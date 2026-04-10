use std::collections::{HashMap, HashSet};

use crate::error::{ErrorKind, OboError};
use crate::lexer::token::Span;
use crate::parser::ast::*;

use super::super::symbols::{FunctionSig, SymbolKind, TypeInfoKind};
use super::super::types::OboType;
use super::Checker;

impl Checker {
    pub(super) fn check_declaration(&mut self, decl: &Declaration) {
        match decl {
            Declaration::Function(f) => self.check_function(f),
            Declaration::Actor(a) => self.check_actor(a),
            Declaration::Entity(e) => self.check_entity(e),
            Declaration::Choice(_) => {}
            Declaration::Trait(t) => self.check_trait(t),
            Declaration::Statement(s) => self.check_statement(s),
            Declaration::Const(c) => {
                self.infer_expr_type(&c.value);
            }
            _ => {}
        }
    }

    fn check_function(&mut self, f: &FunctionDecl) {
        if f.is_abstract {
            return;
        }

        self.current_function = Some(f.name.clone());
        self.symbols.push_scope();

        // metal function → entire body is metal context
        let was_metal = self.in_metal;
        if f.is_metal {
            self.in_metal = true;
        }

        for param in &f.params {
            let ty = param
                .type_annotation
                .as_ref()
                .map(|t| self.resolve_type_expr(t))
                .unwrap_or(OboType::Unknown);
            self.symbols
                .define_variable(&param.name, ty, SymbolKind::Parameter, false, param.span);
        }

        self.check_statements(&f.body);

        let locals = self.symbols.pop_scope();
        self.check_unused_variables(&locals);

        self.in_metal = was_metal;
        self.current_function = None;
    }

    fn check_actor(&mut self, a: &ActorDecl) {
        if let Some(ref parent_name) = a.parent {
            match self.symbols.lookup_type(parent_name) {
                Some(parent_info) => {
                    if parent_info.is_sealed {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::SealedInheritance,
                                format!(
                                    "'{}' can't inherit from '{}' — it's final!",
                                    a.name, parent_name
                                ),
                                a.span,
                            )
                            .with_hint("Final actors cannot be extended")
                            .with_secondary(parent_info.defined_at, "marked final here".to_string()),
                        );
                    }
                    if !matches!(parent_info.kind, TypeInfoKind::Actor { .. }) {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::InvalidInheritance,
                                format!(
                                    "'{}' can only inherit from another actor, but '{}' is a {}",
                                    a.name,
                                    parent_name,
                                    match &parent_info.kind {
                                        TypeInfoKind::Entity { .. } => "entity",
                                        TypeInfoKind::Choice { .. } => "choice",
                                        TypeInfoKind::Trait { .. } => "trait",
                                        _ => "different kind",
                                    }
                                ),
                                a.span,
                            )
                            .with_hint(format!(
                                "Use 'has {}' for traits, or 'is' only with actors",
                                parent_name
                            )),
                        );
                    }
                }
                None => {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::UndeclaredType,
                            format!(
                                "'{}' inherits from '{}', but I can't find that type anywhere",
                                a.name, parent_name
                            ),
                            a.span,
                        )
                        .with_hint("Make sure the parent actor is defined before this one"),
                    );
                }
            }
        }

        for trait_name in &a.traits {
            let trait_info = self.symbols.lookup_type(trait_name).cloned();
            match trait_info {
                Some(info) => {
                    if !matches!(info.kind, TypeInfoKind::Trait { .. }) {
                        self.errors.push(OboError::new(
                            ErrorKind::InvalidInheritance,
                            format!(
                                "'has {}' — but '{}' isn't a trait, it's a {}",
                                trait_name,
                                trait_name,
                                match &info.kind {
                                    TypeInfoKind::Actor { .. } => "actor (use 'is' for actors)",
                                    TypeInfoKind::Entity { .. } => "entity",
                                    TypeInfoKind::Choice { .. } => "choice",
                                    _ => "type",
                                }
                            ),
                            a.span,
                        ));
                    } else if let TypeInfoKind::Trait {
                        methods: trait_methods,
                        fields: trait_fields,
                    } = &info.kind
                    {
                        self.check_trait_conformance(a, trait_name, trait_methods, trait_fields);
                    }
                }
                None => {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::UndeclaredType,
                            format!(
                                "'{}' says it has '{}', but that trait doesn't exist",
                                a.name, trait_name
                            ),
                            a.span,
                        )
                        .with_hint("Define the trait first, then implement it"),
                    );
                }
            }
        }

        if let Some(ref parent_name) = a.parent {
            self.check_abstract_implementations(a, parent_name);
        }

        let all_fields = self.collect_actor_fields(&a.name);
        for member in &a.members {
            if let ActorMember::Method(m) = member {
                self.check_actor_method(m, &all_fields, &a.name);
            }
        }
    }

    pub(super) fn collect_actor_fields(&self, actor_name: &str) -> Vec<(String, OboType, Span)> {
        let mut fields = Vec::new();
        let mut current = Some(actor_name.to_string());
        let mut visited = HashSet::new();

        while let Some(ref name) = current {
            if !visited.insert(name.clone()) {
                break;
            }
            if let Some(info) = self.symbols.lookup_type(name) {
                match &info.kind {
                    TypeInfoKind::Actor {
                        parent,
                        fields: actor_fields,
                        ..
                    } => {
                        for (fname, finfo) in actor_fields {
                            if !fields.iter().any(|(n, _, _)| n == fname) {
                                fields.push((fname.clone(), finfo.ty.clone(), finfo.defined_at));
                            }
                        }
                        current = parent.clone();
                    }
                    _ => break,
                }
            } else {
                break;
            }
        }
        fields
    }

    fn check_actor_method(&mut self, m: &FunctionDecl, fields: &[(String, OboType, Span)], actor_name: &str) {
        if m.is_abstract {
            return;
        }

        self.current_function = Some(m.name.clone());
        self.symbols.push_scope();

        // Define `self` so actor methods can reference self.field
        self.symbols.define_variable(
            "self",
            OboType::Actor(actor_name.to_string()),
            SymbolKind::Variable,
            false,
            m.span,
        );

        for (name, ty, span) in fields {
            self.symbols
                .define_variable(name, ty.clone(), SymbolKind::Variable, false, *span);
        }

        for param in &m.params {
            let ty = param
                .type_annotation
                .as_ref()
                .map(|t| self.resolve_type_expr(t))
                .unwrap_or(OboType::Unknown);
            self.symbols
                .define_variable(&param.name, ty, SymbolKind::Parameter, false, param.span);
        }

        self.check_statements(&m.body);
        self.symbols.pop_scope();
        self.current_function = None;
    }

    fn check_entity(&mut self, _e: &EntityDecl) {}

    fn check_trait(&mut self, _t: &TraitDecl) {}

    fn check_trait_conformance(
        &mut self,
        actor: &ActorDecl,
        trait_name: &str,
        trait_methods: &HashMap<String, FunctionSig>,
        trait_fields: &[String],
    ) {
        let actor_methods: Vec<&str> = actor
            .members
            .iter()
            .filter_map(|m| {
                if let ActorMember::Method(f) = m {
                    Some(f.name.as_str())
                } else {
                    None
                }
            })
            .collect();

        let actor_fields: Vec<&str> = actor
            .members
            .iter()
            .filter_map(|m| {
                if let ActorMember::Field(f) = m {
                    Some(f.name.as_str())
                } else {
                    None
                }
            })
            .collect();

        for (method_name, trait_sig) in trait_methods {
            if !actor_methods.contains(&method_name.as_str()) {
                self.errors.push(
                    OboError::new(
                        ErrorKind::MissingTraitMethod,
                        format!(
                            "'{}' says it has '{}', but never wrote '{}'",
                            actor.name, trait_name, method_name
                        ),
                        actor.span,
                    )
                    .with_hint(format!(
                        "Add: function {}({}) {{ ... }}",
                        method_name,
                        trait_sig
                            .params
                            .iter()
                            .map(|p| p.name.as_str())
                            .collect::<Vec<_>>()
                            .join(", ")
                    ))
                    .with_secondary(trait_sig.defined_at, "required by this trait".to_string()),
                );
            }
        }

        for field_name in trait_fields {
            if !actor_fields.contains(&field_name.as_str()) {
                self.errors.push(
                    OboError::new(
                        ErrorKind::MissingTraitMethod,
                        format!(
                            "'{}' says it has '{}', but is missing field '{}'",
                            actor.name, trait_name, field_name
                        ),
                        actor.span,
                    )
                    .with_hint(format!("Add: {} as number;", field_name)),
                );
            }
        }
    }

    fn check_abstract_implementations(&mut self, actor: &ActorDecl, parent_name: &str) {
        let parent_info = match self.symbols.lookup_type(parent_name) {
            Some(info) => info.clone(),
            None => return,
        };

        if !parent_info.is_abstract {
            return;
        }

        if let TypeInfoKind::Actor {
            methods: parent_methods,
            ..
        } = &parent_info.kind
        {
            let actor_methods: Vec<&str> = actor
                .members
                .iter()
                .filter_map(|m| {
                    if let ActorMember::Method(f) = m {
                        Some(f.name.as_str())
                    } else {
                        None
                    }
                })
                .collect();

            for (name, sig) in parent_methods {
                if sig.is_abstract && !actor_methods.contains(&name.as_str()) {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::AbstractNotImplemented,
                            format!(
                                "'{}' inherits from template '{}' but doesn't implement '{}'",
                                actor.name, parent_name, name
                            ),
                            actor.span,
                        )
                        .with_hint(format!(
                            "Add: function {}({}) {{ ... }}",
                            name,
                            sig.params
                                .iter()
                                .map(|p| p.name.as_str())
                                .collect::<Vec<_>>()
                                .join(", ")
                        ))
                        .with_note(format!(
                            "Template methods from '{}' must be implemented",
                            parent_name
                        )),
                    );
                }
            }
        }
    }
}