use std::collections::HashMap;
use std::thread;

use crate::parser::ast::Expr;

use super::super::environment::Environment;
use super::super::value::{OboTask, Value};
use super::Interpreter;

pub(super) struct PendingTask {
    pub handle: thread::JoinHandle<Result<Value, String>>,
}

impl Interpreter {
    pub(super) fn spawn_task_expr(&mut self, expr: &Expr) -> Result<Value, String> {
        let task_id = self.fresh_task_id();

        let env_snapshot = self.env.snapshot_all();
        let type_registry = self.type_registry.clone();
        let extensions = self.extensions.clone();
        let next_instance_id = self.next_instance_id;
        let bridge_functions = self.bridge_functions.clone();
        let expr_clone = expr.clone();

        let handle = thread::spawn(move || {
            let mut task_interpreter = Interpreter {
                env: Environment::from_snapshot(env_snapshot),
                type_registry,
                extensions,
                event_listeners: HashMap::new(),
                next_instance_id,
                pending_tasks: HashMap::new(),
                next_task_id: 1,
                bridge_functions,
                generator_consumer: None,
            };

            let res = match &expr_clone {
                Expr::Action(_, _, _) | Expr::ArrowAction(_, _, _) => {
                    match task_interpreter.eval_expr(&expr_clone) {
                        Ok(action) => match action {
                            Value::Action(_) | Value::Function(_) | Value::BuiltinFn(_) => {
                                task_interpreter.call_value(&action, &[])
                            }
                            other => Err(format!(
                                "Obo: run expected a callable task body, got {} 🤨",
                                other.type_name()
                            )),
                        },
                        Err(e) => Err(e),
                    }
                }
                _ => task_interpreter.eval_expr(&expr_clone),
            };

            res
        });

        self.pending_tasks.insert(task_id, PendingTask { handle });

        let task = OboTask { task_id };
        Ok(Value::Task(task))
    }

    pub(super) fn wait_for_task(&mut self, task: &OboTask) -> Result<Value, String> {
        let Some(pending) = self.pending_tasks.remove(&task.task_id) else {
            return Ok(Value::Null);
        };

        match pending.handle.join() {
            Ok(result) => result,
            Err(_) => Err("Obo: Task panicked 💥".into()),
        }
    }

    pub(super) fn wait_for_all_tasks(&mut self) -> Result<(), String> {
        let task_ids: Vec<u64> = self.pending_tasks.keys().copied().collect();
        for task_id in task_ids {
            let task = OboTask { task_id };
            self.wait_for_task(&task)?;
        }
        Ok(())
    }
}