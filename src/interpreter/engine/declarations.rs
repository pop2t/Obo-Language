use crate::parser::ast::*;

use super::super::value::{OboFunction, Value};
use super::{Interpreter, TypeDef};

impl Interpreter {
    pub fn register_declaration(&mut self, decl: &Declaration) -> Result<(), String> {
        match decl {
            Declaration::Function(f) => {
                let func = OboFunction {
                    name: f.name.clone(),
                    params: f.params.clone(),
                    body: f.body.clone(),
                    closure_env: None,
                };
                self.env.define(&f.name, Value::Function(func));
            }
            Declaration::Entity(e) => {
                self.type_registry
                    .insert(e.name.clone(), TypeDef::Entity(e.clone()));
            }
            Declaration::Actor(a) => {
                self.type_registry
                    .insert(a.name.clone(), TypeDef::Actor(a.clone()));
                self.register_actor_statics(a)?;
            }
            Declaration::Choice(c) => {
                self.type_registry
                    .insert(c.name.clone(), TypeDef::Choice(c.clone()));
                self.register_choice_constructors(c)?;
            }
            Declaration::Const(c) => {
                let value = self.eval_expr(&c.value)?;
                self.env.define(&c.name, value);
            }
            Declaration::Extend(ext) => {
                for method in &ext.methods {
                    self.extensions.insert(
                        (ext.target.clone(), method.name.clone()),
                        method.clone(),
                    );
                }
            }
            Declaration::Use(_)
            | Declaration::Trait(_)
            | Declaration::TypeAlias(_)
            | Declaration::Statement(_) => {}
            Declaration::Bridge(b) => {
                for f in &b.functions {
                    self.bridge_functions.insert(f.name.clone(), b.lib_name.clone());
                }
            }
            Declaration::ConditionalCompilation(cond) => {
                let matches = match cond.condition.as_str() {
                    "platform" => {
                        let current = if cfg!(target_os = "macos") { "macos" }
                            else if cfg!(target_os = "linux") { "linux" }
                            else if cfg!(target_os = "windows") { "windows" }
                            else { "unknown" };
                        cond.value == current
                    }
                    "debug" => cond.value == "true",
                    _ => false,
                };
                let body = if matches {
                    &cond.then_body
                } else if let Some(ref else_body) = cond.else_body {
                    else_body
                } else {
                    return Ok(());
                };
                for decl in body {
                    self.register_declaration(decl)?;
                }
            }
        }
        Ok(())
    }

    fn register_actor_statics(&mut self, actor: &ActorDecl) -> Result<(), String> {
        for member in &actor.members {
            if let ActorMember::Method(f) = member {
                if f.is_static {
                    let qualified = format!("{}.{}", actor.name, f.name);
                    let func = OboFunction {
                        name: qualified.clone(),
                        params: f.params.clone(),
                        body: f.body.clone(),
                        closure_env: None,
                    };
                    self.env.define(&qualified, Value::Function(func));
                }
            }
        }
        Ok(())
    }

    fn register_choice_constructors(&mut self, choice: &ChoiceDecl) -> Result<(), String> {
        for variant in &choice.variants {
            let qualified = format!("{}.{}", choice.name, variant.name);
            if variant.fields.is_empty() {
                self.env.define(
                    &qualified,
                    Value::ChoiceValue(choice.name.clone(), variant.name.clone(), vec![]),
                );
            } else {
                self.env.define(&qualified, Value::BuiltinFn(qualified.clone()));
            }
        }
        Ok(())
    }
}