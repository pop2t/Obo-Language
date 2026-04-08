use std::collections::HashMap;

use crate::error::{ErrorKind, OboError};
use crate::parser::ast::*;
use crate::stdlib::SYSTEM_ACTORS;

use super::super::symbols::*;
use super::super::types::OboType;
use super::Checker;

impl Checker {
    pub(super) fn register_declaration(&mut self, decl: &Declaration) {
        match decl {
            Declaration::Function(f) => {
                let sig = self.build_function_sig(f);
                if let Some(existing) = self.symbols.define_function(sig) {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::DuplicateDeclaration,
                            format!(
                                "'{}' is already defined — you can't have two functions with the same name",
                                f.name
                            ),
                            f.span,
                        )
                        .with_hint(format!("First defined at line {}", existing.defined_at.line)),
                    );
                }
            }
            Declaration::Entity(e) => {
                let info = self.build_entity_info(e);
                if let Some(existing) = self.symbols.define_type(info) {
                    self.error_duplicate_type(&e.name, e.span, existing.defined_at);
                }
            }
            Declaration::Actor(a) => {
                let info = self.build_actor_info(a);
                if let Some(existing) = self.symbols.define_type(info) {
                    self.error_duplicate_type(&a.name, a.span, existing.defined_at);
                }
            }
            Declaration::Choice(c) => {
                let info = self.build_choice_info(c);
                if let Some(existing) = self.symbols.define_type(info) {
                    self.error_duplicate_type(&c.name, c.span, existing.defined_at);
                }
            }
            Declaration::Trait(t) => {
                let info = self.build_trait_info(t);
                if let Some(existing) = self.symbols.define_type(info) {
                    self.error_duplicate_type(&t.name, t.span, existing.defined_at);
                }
            }
            Declaration::Const(c) => {
                let ty = self.infer_expr_type(&c.value);
                if let Some(existing) = self.symbols.define_constant(&c.name, ty, c.span) {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::DuplicateDeclaration,
                            format!("Constant '{}' is already defined", c.name),
                            c.span,
                        )
                        .with_hint(format!("First defined at line {}", existing.defined_at.line)),
                    );
                }
            }
            Declaration::Statement(_)
            | Declaration::TypeAlias(_)
            | Declaration::Extend(_)
            | Declaration::Bridge(_)
            | Declaration::ConditionalCompilation(_) => {}

            Declaration::Use(use_decl) => {
                // Register system actors (Math, Time, etc.) so the checker
                // doesn't reject them as undeclared variables.
                for name in &use_decl.path {
                    if SYSTEM_ACTORS.contains(&name.as_str()) {
                        self.symbols.define_variable(
                            name,
                            OboType::Unknown,
                            SymbolKind::Variable,
                            false,
                            use_decl.span,
                        );
                    }
                }
            }
        }
    }

    fn build_function_sig(&self, f: &FunctionDecl) -> FunctionSig {
        let params: Vec<ParamSig> = f
            .params
            .iter()
            .map(|p| ParamSig {
                name: p.name.clone(),
                ty: p
                    .type_annotation
                    .as_ref()
                    .map(|t| self.resolve_type_expr(t))
                    .unwrap_or(OboType::Unknown),
                has_default: p.default_value.is_some(),
            })
            .collect();

        FunctionSig {
            name: f.name.clone(),
            params,
            return_type: OboType::Unknown,
            is_static: f.is_static,
            is_abstract: f.is_abstract,
            is_public: f.is_public,
            is_deprecated: f.attributes.iter().any(|a| a.name == "deprecated"),
            is_test: f.attributes.iter().any(|a| a.name == "test"),
            defined_at: f.span,
        }
    }

    fn build_entity_info(&self, e: &EntityDecl) -> TypeInfo {
        let mut fields = HashMap::new();
        for field in &e.fields {
            fields.insert(
                field.name.clone(),
                FieldInfo {
                    name: field.name.clone(),
                    ty: field
                        .type_annotation
                        .as_ref()
                        .map(|t| self.resolve_type_expr(t))
                        .unwrap_or(OboType::Unknown),
                    is_public: field.is_public,
                    has_default: field.default_value.is_some(),
                    defined_at: field.span,
                },
            );
        }
        TypeInfo {
            name: e.name.clone(),
            kind: TypeInfoKind::Entity { fields },
            is_public: e.is_public,
            is_abstract: false,
            is_sealed: false,
            is_deprecated: e.attributes.iter().any(|a| a.name == "deprecated"),
            is_reflectable: e.attributes.iter().any(|a| a.name == "reflectable"),
            is_serializable: e.attributes.iter().any(|a| a.name == "serializable"),
            is_packed: e.is_packed,
            is_value: e.is_value,
            defined_at: e.span,
        }
    }

    fn build_actor_info(&self, a: &ActorDecl) -> TypeInfo {
        let mut fields = HashMap::new();
        let mut methods = HashMap::new();

        for member in &a.members {
            match member {
                ActorMember::Field(f) => {
                    fields.insert(
                        f.name.clone(),
                        FieldInfo {
                            name: f.name.clone(),
                            ty: f
                                .type_annotation
                                .as_ref()
                                .map(|t| self.resolve_type_expr(t))
                                .unwrap_or(OboType::Unknown),
                            is_public: f.is_public,
                            has_default: f.default_value.is_some(),
                            defined_at: f.span,
                        },
                    );
                }
                ActorMember::Method(m) => {
                    let sig = self.build_function_sig(m);
                    methods.insert(m.name.clone(), sig);
                }
                _ => {}
            }
        }

        TypeInfo {
            name: a.name.clone(),
            kind: TypeInfoKind::Actor {
                parent: a.parent.clone(),
                traits: a.traits.clone(),
                fields,
                methods,
            },
            is_public: a.is_public,
            is_abstract: a.is_abstract,
            is_sealed: a.is_sealed,
            is_deprecated: a.attributes.iter().any(|a| a.name == "deprecated"),
            is_reflectable: a.attributes.iter().any(|a| a.name == "reflectable"),
            is_serializable: a.attributes.iter().any(|a| a.name == "serializable"),
            is_packed: false,
            is_value: false,
            defined_at: a.span,
        }
    }

    fn build_choice_info(&self, c: &ChoiceDecl) -> TypeInfo {
        let variants = c
            .variants
            .iter()
            .map(|v| VariantInfo {
                name: v.name.clone(),
                fields: v
                    .fields
                    .iter()
                    .map(|p| ParamSig {
                        name: p.name.clone(),
                        ty: p
                            .type_annotation
                            .as_ref()
                            .map(|t| self.resolve_type_expr(t))
                            .unwrap_or(OboType::Unknown),
                        has_default: p.default_value.is_some(),
                    })
                    .collect(),
                defined_at: v.span,
            })
            .collect();

        TypeInfo {
            name: c.name.clone(),
            kind: TypeInfoKind::Choice { variants },
            is_public: c.is_public,
            is_abstract: false,
            is_sealed: false,
            is_deprecated: false,
            is_reflectable: false,
            is_serializable: false,
            is_packed: false,
            is_value: false,
            defined_at: c.span,
        }
    }

    fn build_trait_info(&self, t: &TraitDecl) -> TypeInfo {
        let mut methods = HashMap::new();
        let mut fields = Vec::new();
        for member in &t.members {
            match member {
                TraitMember::Method(m) => {
                    let sig = self.build_function_sig(m);
                    methods.insert(m.name.clone(), sig);
                }
                TraitMember::Field(f) => {
                    fields.push(f.name.clone());
                }
            }
        }
        TypeInfo {
            name: t.name.clone(),
            kind: TypeInfoKind::Trait { methods, fields },
            is_public: t.is_public,
            is_abstract: false,
            is_sealed: false,
            is_deprecated: false,
            is_reflectable: false,
            is_serializable: false,
            is_packed: false,
            is_value: false,
            defined_at: t.span,
        }
    }
}