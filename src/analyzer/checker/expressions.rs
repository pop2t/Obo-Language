use crate::error::{ErrorKind, OboError};
use crate::parser::ast::*;

use super::super::symbols::{SymbolKind, TypeInfoKind};
use super::super::types::OboType;
use super::Checker;

impl Checker {
    pub(super) fn infer_expr_type(&mut self, expr: &Expr) -> OboType {
        match expr {
            Expr::NumberLit(_, _) => OboType::Number,
            Expr::DecimalLit(_, _) => OboType::Decimal,
            Expr::StringLit(_, _) => OboType::Text,
            Expr::CharLit(_, _) => OboType::Char,
            Expr::BoolLit(_, _) => OboType::Flag,
            Expr::NullLit(_) => OboType::Null,

            Expr::Identifier(name, span) => {
                let found_type = self.symbols.lookup(name).map(|s| s.ty.clone());
                if let Some(ty) = found_type {
                    self.symbols.mark_used(name);
                    ty
                } else if self.symbols.lookup_type(name).is_some() {
                    OboType::Named(name.clone())
                } else if self.symbols.lookup_function(name).is_some() {
                    OboType::Unknown
                } else {
                    let hint = self.suggest_similar_name(name);
                    self.errors.push(
                        OboError::new(
                            ErrorKind::UndeclaredVariable,
                            format!("I can't find '{}' — is it defined?", name),
                            *span,
                        )
                        .with_hint(hint),
                    );
                    OboType::Error
                }
            }

            Expr::Binary(left, op, right, span) => {
                let lt = self.infer_expr_type(left);
                let rt = self.infer_expr_type(right);

                if lt.is_error() || rt.is_error() {
                    return OboType::Error;
                }
                if lt.is_unknown() || rt.is_unknown() {
                    return OboType::Unknown;
                }

                // Allow component-wise arithmetic on matching value types
                if lt == rt {
                    let name = match &lt {
                        OboType::Entity(n) | OboType::Named(n) => Some(n.as_str()),
                        _ => None,
                    };
                    if let Some(n) = name {
                        if self.symbols.lookup_type(n).map_or(false, |t| t.is_value) {
                            match op {
                                BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div => {
                                    return lt;
                                }
                                _ => {}
                            }
                        }
                    }
                }

                match op {
                    BinOp::Add => {
                        if lt == OboType::Text || rt == OboType::Text {
                            OboType::Text
                        } else if lt.is_numeric() && rt.is_numeric() {
                            if lt == OboType::Decimal || rt == OboType::Decimal {
                                OboType::Decimal
                            } else {
                                OboType::Number
                            }
                        } else {
                            self.errors.push(
                                OboError::new(
                                    ErrorKind::InvalidOperation,
                                    format!(
                                        "Can't add {} and {} together",
                                        lt.display_name(),
                                        rt.display_name()
                                    ),
                                    *span,
                                )
                                .with_hint("+ works with numbers, decimals, and text"),
                            );
                            OboType::Error
                        }
                    }
                    BinOp::Sub | BinOp::Mul | BinOp::Mod => {
                        if lt.is_numeric() && rt.is_numeric() {
                            if lt == OboType::Decimal || rt == OboType::Decimal {
                                OboType::Decimal
                            } else {
                                OboType::Number
                            }
                        } else {
                            let op_name = match op {
                                BinOp::Sub => "subtract",
                                BinOp::Mul => "multiply",
                                BinOp::Mod => "modulo",
                                _ => unreachable!(),
                            };
                            self.errors.push(
                                OboError::new(
                                    ErrorKind::InvalidOperation,
                                    format!(
                                        "Can't {} {} and {}",
                                        op_name,
                                        lt.display_name(),
                                        rt.display_name()
                                    ),
                                    *span,
                                )
                                .with_hint(
                                    "Math operations only work with numbers and decimals",
                                ),
                            );
                            OboType::Error
                        }
                    }
                    BinOp::Div => {
                        if lt.is_numeric() && rt.is_numeric() {
                            OboType::Decimal
                        } else {
                            self.errors.push(OboError::new(
                                ErrorKind::InvalidOperation,
                                format!(
                                    "Can't divide {} by {}",
                                    lt.display_name(),
                                    rt.display_name()
                                ),
                                *span,
                            ));
                            OboType::Error
                        }
                    }
                    BinOp::Eq
                    | BinOp::NotEq
                    | BinOp::Less
                    | BinOp::Greater
                    | BinOp::LessEq
                    | BinOp::GreaterEq => OboType::Flag,
                    BinOp::BitAnd | BinOp::BitOr | BinOp::BitXor
                    | BinOp::Shl | BinOp::Shr => {
                        if !lt.is_unknown() && !rt.is_unknown()
                            && (!lt.is_numeric() || !rt.is_numeric())
                        {
                            self.errors.push(OboError::new(
                                ErrorKind::InvalidOperation,
                                format!(
                                    "Bitwise ops need integers, got {} and {}",
                                    lt.display_name(),
                                    rt.display_name()
                                ),
                                *span,
                            ));
                            OboType::Error
                        } else {
                            OboType::Number
                        }
                    }
                }
            }

            Expr::Unary(op, operand, span) => {
                let t = self.infer_expr_type(operand);
                match op {
                    UnaryOp::Neg => {
                        if !t.is_unknown() && !t.is_error() && !t.is_numeric() {
                            self.errors.push(OboError::new(
                                ErrorKind::InvalidOperation,
                                format!(
                                    "Can't negate a {} — only numbers and decimals",
                                    t.display_name()
                                ),
                                *span,
                            ));
                            OboType::Error
                        } else {
                            t
                        }
                    }
                    UnaryOp::Not => {
                        if !t.is_unknown() && !t.is_error() && t != OboType::Flag {
                            self.errors.push(OboError::new(
                                ErrorKind::InvalidOperation,
                                format!(
                                    "'not' only works with flags (true/false), got {}",
                                    t.display_name()
                                ),
                                *span,
                            ));
                        }
                        OboType::Flag
                    }
                    UnaryOp::BitNot => {
                        if !t.is_unknown() && !t.is_error() && !t.is_numeric() {
                            self.errors.push(OboError::new(
                                ErrorKind::InvalidOperation,
                                format!(
                                    "'~' only works with integers, got {}",
                                    t.display_name()
                                ),
                                *span,
                            ));
                            OboType::Error
                        } else {
                            OboType::Number
                        }
                    }
                }
            }

            Expr::Logical(left, _, right, _) => {
                self.infer_expr_type(left);
                self.infer_expr_type(right);
                OboType::Flag
            }

            Expr::Call(callee, args, span) => {
                if let Expr::Identifier(name, _) = callee.as_ref() {
                    self.symbols.mark_used(name);
                    if name == "Arena" && !self.in_metal {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::InvalidOperation,
                                "Arena is only available inside metal blocks",
                                *span,
                            )
                            .with_hint("Wrap this code in a metal { } block to use Arena."),
                        );
                    }
                }
                if let Expr::MemberAccess(obj, _, _) = callee.as_ref() {
                    if let Expr::Identifier(name, _) = obj.as_ref() {
                        self.symbols.mark_used(name);
                    }
                }
                for arg in args {
                    self.infer_expr_type(&arg.value);
                }

                if let Expr::Identifier(name, _) = callee.as_ref() {
                    if let Some(sig) = self.symbols.lookup_function(name).cloned() {
                        if sig.is_deprecated {
                            self.errors.push(
                                OboError::new(
                                    ErrorKind::DeprecatedUsage,
                                    format!("'{}' is deprecated", name),
                                    *span,
                                )
                                .with_secondary(
                                    sig.defined_at,
                                    "deprecated function defined here".to_string(),
                                ),
                            );
                        }
                        let required = sig.params.iter().filter(|p| !p.has_default).count();
                        let total = sig.params.len();
                        let effective_args = args.len() + self.pipe_extra_args;

                        if effective_args < required || effective_args > total {
                            let msg = if required == total {
                                format!(
                                    "'{}' expects {} {}, but got {}",
                                    name,
                                    total,
                                    if total == 1 { "argument" } else { "arguments" },
                                    effective_args
                                )
                            } else {
                                format!(
                                    "'{}' expects {}-{} arguments, but got {}",
                                    name, required, total, effective_args
                                )
                            };
                            self.errors.push(
                                OboError::new(ErrorKind::ArgumentCountMismatch, msg, *span)
                                    .with_secondary(
                                        sig.defined_at,
                                        "function defined here".to_string(),
                                    ),
                            );
                        }
                        return sig.return_type.clone();
                    }
                }
                OboType::Unknown
            }

            Expr::MemberAccess(object, member, _) => {
                if let Expr::Identifier(name, _) = object.as_ref() {
                    self.symbols.mark_used(name);
                }
                let obj_type = self.infer_expr_type(object);
                match &obj_type {
                    OboType::Text => match member.as_str() {
                        "length" | "count" => OboType::Number,
                        "upper" | "lower" | "trim" => OboType::Text,
                        "contains" | "startsWith" | "endsWith" => OboType::Flag,
                        "split" => OboType::List(Box::new(OboType::Text)),
                        _ => OboType::Unknown,
                    },
                    OboType::List(_) => match member.as_str() {
                        "count" => OboType::Number,
                        "first" | "last" => OboType::Unknown,
                        _ => OboType::Unknown,
                    },
                    _ => OboType::Unknown,
                }
            }

            Expr::IndexAccess(object, index, _) => {
                if let Expr::Identifier(name, _) = object.as_ref() {
                    self.symbols.mark_used(name);
                }
                self.infer_expr_type(object);
                self.infer_expr_type(index);
                OboType::Unknown
            }

            Expr::ListLiteral(elements, _) => {
                if elements.is_empty() {
                    return OboType::List(Box::new(OboType::Unknown));
                }
                let first_type = self.infer_expr_type(&elements[0]);
                for elem in elements.iter().skip(1) {
                    self.infer_expr_type(elem);
                }
                OboType::List(Box::new(first_type))
            }

            Expr::MapLiteral(pairs, _) => {
                if pairs.is_empty() {
                    return OboType::Map(
                        Box::new(OboType::Unknown),
                        Box::new(OboType::Unknown),
                    );
                }
                let key_type = self.infer_expr_type(&pairs[0].0);
                let val_type = self.infer_expr_type(&pairs[0].1);
                for (k, v) in pairs.iter().skip(1) {
                    self.infer_expr_type(k);
                    self.infer_expr_type(v);
                }
                OboType::Map(Box::new(key_type), Box::new(val_type))
            }

            Expr::EntityInit(name, fields, span) => {
                if let Some(info) = self.symbols.lookup_type(name).cloned() {
                    if info.is_deprecated {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::DeprecatedUsage,
                                format!("'{}' is deprecated", name),
                                *span,
                            )
                            .with_secondary(
                                info.defined_at,
                                "deprecated type defined here".to_string(),
                            ),
                        );
                    }
                    // Metal boundary: only packed entities allowed in metal blocks
                    if self.in_metal && !info.is_packed {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::InvalidOperation,
                                format!("Can't create '{}' inside a metal block — only packed entities allowed here", name),
                                *span,
                            )
                            .with_hint("Use 'packed entity' for types that need to live in metal blocks".to_string()),
                        );
                    }
                    let is_actor = matches!(info.kind, TypeInfoKind::Actor { .. });
                    match &info.kind {
                        TypeInfoKind::Entity {
                            fields: expected_fields,
                        } => {
                            for f in fields {
                                self.infer_expr_type(&f.value);
                                if !expected_fields.contains_key(&f.name) {
                                    self.errors.push(
                                        OboError::new(
                                            ErrorKind::UndeclaredVariable,
                                            format!(
                                                "'{}' doesn't have a field called '{}'",
                                                name, f.name
                                            ),
                                            f.span,
                                        )
                                        .with_hint(format!(
                                            "Available fields: {}",
                                            expected_fields
                                                .keys()
                                                .cloned()
                                                .collect::<Vec<_>>()
                                                .join(", ")
                                        )),
                                    );
                                }
                            }
                        }
                        TypeInfoKind::Actor { .. } => {
                            let all_fields = self.collect_actor_fields(name);
                            for f in fields {
                                self.infer_expr_type(&f.value);
                                if !all_fields.iter().any(|(n, _, _)| n == &f.name) {
                                    self.errors.push(
                                        OboError::new(
                                            ErrorKind::UndeclaredVariable,
                                            format!(
                                                "'{}' doesn't have a field called '{}'",
                                                name, f.name
                                            ),
                                            f.span,
                                        )
                                        .with_hint(format!(
                                            "Available fields: {}",
                                            all_fields
                                                .iter()
                                                .map(|(n, _, _)| n.as_str())
                                                .collect::<Vec<_>>()
                                                .join(", ")
                                        )),
                                    );
                                }
                            }
                        }
                        _ => {
                            self.errors.push(OboError::new(
                                ErrorKind::TypeMismatch,
                                format!(
                                    "'{}' can't be instantiated with {{ }} — it's not an entity or actor",
                                    name
                                ),
                                *span,
                            ));
                        }
                    }
                    if is_actor {
                        OboType::Actor(name.clone())
                    } else {
                        OboType::Entity(name.clone())
                    }
                } else {
                    self.errors.push(OboError::new(
                        ErrorKind::UndeclaredType,
                        format!("I don't know what '{}' is — is it defined somewhere?", name),
                        *span,
                    ));
                    OboType::Error
                }
            }

            Expr::InlineIf(value, condition, fallback, _) => {
                let val_type = self.infer_expr_type(value);
                self.infer_expr_type(condition);
                let fb_type = self.infer_expr_type(fallback);
                if val_type.is_unknown() {
                    fb_type
                } else {
                    val_type
                }
            }

            Expr::IfPossibleElse(value, fallback, _) => {
                let val_type = self.infer_expr_type(value);
                let fb_type = self.infer_expr_type(fallback);

                // If the value is a cast, resolve the target type
                let effective_val_type = if val_type.is_unknown() {
                    if let Expr::Cast(type_expr, _, _) = value.as_ref() {
                        self.resolve_type_expr(type_expr)
                    } else {
                        val_type
                    }
                } else {
                    val_type
                };

                if fb_type == OboType::Null || fb_type.is_nullable() {
                    OboType::Nullable(Box::new(effective_val_type))
                } else if effective_val_type.is_unknown() {
                    fb_type
                } else {
                    effective_val_type
                }
            }

            Expr::Action(params, body, _) => {
                self.symbols.push_scope();
                for p in params {
                    let ty = p
                        .type_annotation
                        .as_ref()
                        .map(|t| self.resolve_type_expr(t))
                        .unwrap_or(OboType::Unknown);
                    self.symbols
                        .define_variable(&p.name, ty, SymbolKind::Parameter, false, p.span);
                }
                self.check_statements(body);
                self.symbols.pop_scope();
                OboType::Unknown
            }

            Expr::ArrowAction(params, body, _) => {
                self.symbols.push_scope();
                for p in params {
                    let ty = p
                        .type_annotation
                        .as_ref()
                        .map(|t| self.resolve_type_expr(t))
                        .unwrap_or(OboType::Unknown);
                    self.symbols
                        .define_variable(&p.name, ty, SymbolKind::Parameter, false, p.span);
                }
                self.infer_expr_type(body);
                self.symbols.pop_scope();
                OboType::Unknown
            }

            Expr::Cast(_, _, _) => OboType::Unknown,
            Expr::SafeCast(type_expr, _value, fallback, _) => {
                let target = self.resolve_type_expr(type_expr);
                let fb_type = self.infer_expr_type(fallback);
                if fb_type == OboType::Null || fb_type.is_nullable() {
                    OboType::Nullable(Box::new(target))
                } else {
                    target
                }
            }
            Expr::Range(start, end, step, _) => {
                self.infer_expr_type(start);
                self.infer_expr_type(end);
                if let Some(s) = step {
                    self.infer_expr_type(s);
                }
                OboType::List(Box::new(OboType::Number))
            }
            Expr::Run(expr, _) => {
                self.infer_expr_type(expr);
                OboType::Task
            }
            Expr::ChannelCreate(_) => OboType::Unknown,
            Expr::AtomicCreate(_, _) => OboType::Unknown,
            Expr::Pipe(left, right, _) => {
                self.infer_expr_type(left);
                self.pipe_extra_args += 1;
                let ty = self.infer_expr_type(right);
                self.pipe_extra_args -= 1;
                ty
            }
            Expr::Interpolation(parts, _) => {
                for p in parts {
                    self.infer_expr_type(p);
                }
                OboType::Text
            }
            Expr::Own(expr, span) => {
                if !self.in_metal {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "own is only allowed inside metal blocks",
                            *span,
                        )
                        .with_hint("Wrap this code in a metal { } block to use own."),
                    );
                }
                self.infer_expr_type(expr)
            }
            Expr::InlineAsm(_template, _constraints, inputs, span) => {
                if !self.in_metal {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "asm is only allowed inside metal blocks",
                            *span,
                        )
                        .with_hint("Wrap this code in a metal { } block to use asm."),
                    );
                }
                for input in inputs {
                    self.infer_expr_type(input);
                }
                OboType::Number // asm returns i64
            }
        }
    }

    pub(super) fn resolve_type_expr(&self, type_expr: &TypeExpr) -> OboType {
        match type_expr {
            TypeExpr::Named(name, _) => match name.as_str() {
                "number" | "i64" => OboType::Number,
                "decimal" => OboType::Decimal,
                "text" => OboType::Text,
                "char" => OboType::Char,
                "flag" => OboType::Flag,
                "byte" | "u8" => OboType::Byte,
                "i8" => OboType::I8,
                "i16" => OboType::I16,
                "i32" => OboType::I32,
                "u16" => OboType::U16,
                "u32" => OboType::U32,
                "u64" => OboType::U64,
                "f32" => OboType::F32,
                "f64" => OboType::Decimal,
                "null" => OboType::Null,
                other => OboType::Named(other.to_string()),
            },
            TypeExpr::Generic(name, args, _) => match name.as_str() {
                "list" => {
                    let inner = args
                        .first()
                        .map(|a| self.resolve_type_expr(a))
                        .unwrap_or(OboType::Unknown);
                    OboType::List(Box::new(inner))
                }
                "set" => {
                    let inner = args
                        .first()
                        .map(|a| self.resolve_type_expr(a))
                        .unwrap_or(OboType::Unknown);
                    OboType::Set(Box::new(inner))
                }
                _ => OboType::Named(name.clone()),
            },
            TypeExpr::MapType(key, val, _) => OboType::Map(
                Box::new(self.resolve_type_expr(key)),
                Box::new(self.resolve_type_expr(val)),
            ),
            TypeExpr::Union(types, _) => {
                OboType::Union(types.iter().map(|t| self.resolve_type_expr(t)).collect())
            }
        }
    }
}