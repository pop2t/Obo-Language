mod calls;
mod declarations;
mod expressions;
mod statements;
mod tasks;

use std::collections::HashMap;
use std::collections::HashSet;

use crate::parser::ast::*;

use super::environment::Environment;
use super::value::*;

#[derive(Debug)]
pub enum Signal {
    None,
    Out(Vec<Value>),
    Stop,
    Restart,
    Yield,
}

/// Context for driving a generator from a for-in loop.
/// When `emit` is called inside a generator, the consumer's body is executed
/// with the emitted value bound to `var_name`.
pub struct GeneratorConsumer {
    pub var_name: String,
    pub body: Vec<Statement>,
}

pub struct Interpreter {
    pub env: Environment,
    type_registry: HashMap<String, TypeDef>,
    /// Extension methods: (target_type, method_name) -> FunctionDecl
    extensions: HashMap<(String, String), FunctionDecl>,
    event_listeners: HashMap<u64, HashMap<String, Vec<Value>>>,
    next_instance_id: u64,
    pending_tasks: HashMap<u64, tasks::PendingTask>,
    next_task_id: u64,
    /// Bridge function names -> library name (for error messages in interpreter mode)
    bridge_functions: HashMap<String, String>,
    /// When set, `emit` will execute this consumer's body with the emitted value
    generator_consumer: Option<GeneratorConsumer>,
    /// Value type names (stack-allocated in native, component-wise ops in interpreter)
    value_types: HashSet<String>,
}

#[allow(dead_code)]
#[derive(Debug, Clone)]
enum TypeDef {
    Entity(EntityDecl),
    Actor(ActorDecl),
    Choice(ChoiceDecl),
}

impl Interpreter {
    pub fn new() -> Self {
        Self {
            env: Environment::new(),
            type_registry: HashMap::new(),
            extensions: HashMap::new(),
            event_listeners: HashMap::new(),
            next_instance_id: 1,
            pending_tasks: HashMap::new(),
            next_task_id: 1,
            bridge_functions: HashMap::new(),
            generator_consumer: None,
            value_types: HashSet::new(),
        }
    }

    fn fresh_instance_id(&mut self) -> u64 {
        let instance_id = self.next_instance_id;
        self.next_instance_id += 1;
        instance_id
    }

    fn fresh_task_id(&mut self) -> u64 {
        let task_id = self.next_task_id;
        self.next_task_id += 1;
        task_id
    }

    pub fn run(&mut self, program: &Program) -> Result<(), String> {
        for decl in program {
            self.register_declaration(decl)?;
        }

        let main_fn = self.env.get("main").cloned();
        match main_fn {
            Some(Value::Function(f)) => {
                self.call_function(&f, &[])?;
                Ok(())
            }
            Some(_) => Err("Obo: 'main' exists but it's not a function 🤨".into()),
            None => Err("Obo: I can't find function main() — where do I start? 🤔".into()),
        }
    }

    /// Evaluate a single declaration in REPL mode.
    /// Returns Some(value) for bare expressions, None for statements/declarations.
    pub fn eval_repl_declaration(&mut self, decl: &Declaration) -> Result<Option<Value>, String> {
        match decl {
            Declaration::Statement(Statement::Expr(e)) => {
                let val = self.eval_expr(e)?;
                Ok(Some(val))
            }
            Declaration::Statement(stmt) => {
                self.exec_statement(stmt)?;
                Ok(None)
            }
            other => {
                self.register_declaration(other)?;
                Ok(None)
            }
        }
    }
}