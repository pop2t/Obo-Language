use std::io::{self, Write};

use crate::parser::ast::*;

use super::super::value::Value;
use super::{Interpreter, Signal, TypeDef, GeneratorConsumer};

impl Interpreter {
    pub(super) fn exec_statements(&mut self, stmts: &[Statement]) -> Result<Signal, String> {
        for stmt in stmts {
            let signal = self.exec_statement(stmt)?;
            match signal {
                Signal::None => {}
                other => return Ok(other),
            }
        }
        Ok(Signal::None)
    }

    pub(super) fn exec_statement(&mut self, stmt: &Statement) -> Result<Signal, String> {
        match stmt {
            Statement::Show(s) => {
                let value = self.eval_expr(&s.value)?;
                println!("{}", value);
                Ok(Signal::None)
            }
            Statement::Prompt(p) => {
                let message = self.eval_expr(&p.message)?;
                print!("{}", message);
                io::stdout().flush().ok();

                let mut input = String::new();
                io::stdin()
                    .read_line(&mut input)
                    .map_err(|e| format!("Obo: Can't read input 😬 — {}", e))?;
                let trimmed = input.trim().to_string();

                self.env.define_or_set(&p.target, Value::Text(trimmed));
                Ok(Signal::None)
            }
            Statement::If(i) => {
                let cond = self.eval_expr(&i.condition)?;
                if cond.is_truthy() {
                    self.env.push_scope();
                    let signal = self.exec_statements(&i.then_body)?;
                    self.env.pop_scope();
                    Ok(signal)
                } else if let Some(else_body) = &i.else_body {
                    self.env.push_scope();
                    let signal = self.exec_statements(else_body)?;
                    self.env.pop_scope();
                    Ok(signal)
                } else {
                    Ok(Signal::None)
                }
            }
            Statement::While(w) => {
                loop {
                    let cond = self.eval_expr(&w.condition)?;
                    if !cond.is_truthy() {
                        break;
                    }
                    self.env.push_scope();
                    let signal = self.exec_statements(&w.body)?;
                    self.env.pop_scope();
                    match signal {
                        Signal::Stop => break,
                        Signal::Out(v) => return Ok(Signal::Out(v)),
                        Signal::Restart => continue,
                        Signal::None | Signal::Yield => {}
                    }
                }
                Ok(Signal::None)
            }
            Statement::Forever(f) => {
                loop {
                    self.env.push_scope();
                    let signal = self.exec_statements(&f.body)?;
                    self.env.pop_scope();
                    match signal {
                        Signal::Stop => break,
                        Signal::Out(v) => return Ok(Signal::Out(v)),
                        Signal::Restart => continue,
                        Signal::None | Signal::Yield => {}
                    }
                }
                Ok(Signal::None)
            }
            Statement::Count(c) => {
                let start = self
                    .eval_expr(&c.start)?
                    .to_number()
                    .ok_or_else(|| "Obo: Count start must be a number 🤨".to_string())?;
                let end = self
                    .eval_expr(&c.end)?
                    .to_number()
                    .ok_or_else(|| "Obo: Count end must be a number 🤨".to_string())?;
                let step = if let Some(s) = &c.step {
                    self.eval_expr(s)?
                        .to_number()
                        .ok_or_else(|| "Obo: Count step must be a number 🤨".to_string())?
                } else {
                    1
                };

                if step == 0 {
                    return Err("Obo: Count step can't be 0 — that's an infinite loop 😬".into());
                }

                let mut i = start;
                while (step > 0 && i < end) || (step < 0 && i > end) {
                    self.env.push_scope();
                    self.env.define(&c.var_name, Value::Number(i));
                    let signal = self.exec_statements(&c.body)?;
                    self.env.pop_scope();
                    match signal {
                        Signal::Stop => break,
                        Signal::Out(v) => return Ok(Signal::Out(v)),
                        Signal::Restart => {}
                        Signal::None | Signal::Yield => {}
                    }
                    i += step;
                }
                Ok(Signal::None)
            }
            Statement::ForIn(f) => {
                // Check if the iterable is a function call — might be a generator
                if let Expr::Call(callee, args, _) = &f.iterable {
                    // Resolve the callee to check if it's a generator function
                    let func_val = self.eval_expr(callee)?;
                    if let Value::Function(ref func) = func_val {
                        if Self::body_contains_emit(&func.body) {
                            // Generator function — use consumer-driven approach
                            let arg_vals: Vec<Value> = args
                                .iter()
                                .map(|a| self.eval_expr(&a.value))
                                .collect::<Result<_, _>>()?;

                            let prev_consumer = self.generator_consumer.take();
                            self.generator_consumer = Some(GeneratorConsumer {
                                var_name: f.var_name.clone(),
                                body: f.body.clone(),
                            });

                            let result = self.call_function(&func.clone(), &arg_vals);

                            self.generator_consumer = prev_consumer;

                            return match result {
                                Ok(_) => Ok(Signal::None),
                                Err(e) => Err(e),
                            };
                        }
                    }
                }

                // Normal iterable evaluation
                let iterable = self.eval_expr(&f.iterable)?;
                let items = match &iterable {
                    Value::List(items) => items.clone(),
                    Value::Set(items) => items.clone(),
                    Value::Queue(items) => items.clone(),
                    Value::Stack(items) => items.clone(),
                    Value::Bag(items) => items.clone(),
                    Value::Map(pairs) => pairs.iter().map(|(k, _)| k.clone()).collect(),
                    Value::Pair(a, b) => vec![*a.clone(), *b.clone()],
                    Value::Buffer(buf) => buf.iter().map(|b| Value::Number(*b as i64)).collect(),
                    Value::Text(s) => s.chars().map(Value::Char).collect(),
                    _ => {
                        return Err(format!(
                            "Obo: Can't iterate over {} — it's not a list or text 🤨",
                            iterable.type_name()
                        ))
                    }
                };

                for item in items {
                    self.env.push_scope();
                    self.env.define(&f.var_name, item);
                    let signal = self.exec_statements(&f.body)?;
                    self.env.pop_scope();
                    match signal {
                        Signal::Stop => break,
                        Signal::Out(v) => return Ok(Signal::Out(v)),
                        Signal::Restart => continue,
                        Signal::None | Signal::Yield => {}
                    }
                }
                Ok(Signal::None)
            }
            Statement::Check(c) => {
                let value = self.eval_expr(&c.value)?;
                for arm in &c.arms {
                    if self.check_pattern_matches(&value, &arm.pattern)? {
                        self.env.push_scope();
                        // Bind destructured fields for choice patterns
                        match &arm.pattern {
                            CheckPattern::TypeCheck(_, Some(bindings))
                            | CheckPattern::TypeWithGuard(_, Some(bindings), _) => {
                                if let Value::ChoiceValue(_, _, data) = &value {
                                    for (i, name) in bindings.iter().enumerate() {
                                        let val = data.get(i).cloned().unwrap_or(Value::Null);
                                        self.env.define(name, val);
                                    }
                                }
                            }
                            _ => {}
                        }
                        let signal = self.exec_statements(&arm.body)?;
                        self.env.pop_scope();
                        return Ok(signal);
                    }
                }
                Ok(Signal::None)
            }
            Statement::Out(o) => {
                let values: Vec<Value> = o
                    .values
                    .iter()
                    .map(|e| self.eval_expr(e))
                    .collect::<Result<_, _>>()?;
                Ok(Signal::Out(values))
            }
            Statement::Stop(_) => Ok(Signal::Stop),
            Statement::Restart(_) => Ok(Signal::Restart),
            Statement::Wait(w) => {
                if w.is_wait_for_all {
                    self.wait_for_all_tasks()?;
                } else if w.is_wait_for {
                    let task = self.eval_expr(&w.duration)?;
                    match task {
                        Value::Task(task) => { self.wait_for_task(&task)?; }
                        other => {
                            return Err(format!(
                                "Obo: wait for needs a task handle, got {} 🤨",
                                other.type_name()
                            ))
                        }
                    }
                } else {
                    let duration = self.eval_expr(&w.duration)?;
                    if let Some(secs) = duration.to_decimal() {
                        let millis = (secs * 1000.0) as u64;
                        std::thread::sleep(std::time::Duration::from_millis(millis));
                    }
                }
                Ok(Signal::None)
            }
            Statement::Emit(e) => {
                if self.try_emit_event(&e.value)? {
                    return Ok(Signal::None);
                }

                let value = self.eval_expr(&e.value)?;
                // If we're inside a generator driven by a for-in loop,
                // execute the consumer's body with the emitted value
                if let Some(consumer) = &self.generator_consumer {
                    let var_name = consumer.var_name.clone();
                    let body = consumer.body.clone();
                    self.env.push_scope();
                    self.env.define(&var_name, value);
                    let signal = self.exec_statements(&body)?;
                    self.env.pop_scope();
                    return match signal {
                        Signal::Stop => Ok(Signal::Stop),
                        Signal::Out(v) => Ok(Signal::Out(v)),
                        _ => Ok(Signal::None),
                    };
                }
                let _ = value;
                Ok(Signal::Yield)
            }
            Statement::Run(r) => {
                let _task = self.spawn_task_expr(&r.expr)?;
                Ok(Signal::None)
            }
            Statement::Assert(a) => {
                let value = self.eval_expr(&a.condition)?;
                if !value.is_truthy() {
                    let msg = if let Some(ref msg_expr) = a.message {
                        let msg_val = self.eval_expr(msg_expr)?;
                        format!("{}", msg_val)
                    } else {
                        "Assertion failed".to_string()
                    };
                    return Err(format!("Obo: {} 💥", msg));
                }
                Ok(Signal::None)
            }
            Statement::Assignment(a) => {
                let value = self.eval_expr(&a.value)?;
                self.assign_target(&a.target, value)?;
                Ok(Signal::None)
            }
            Statement::MultiAssignment(m) => {
                let value = self.eval_expr(&m.value)?;
                match value {
                    Value::List(items) => {
                        for (index, name) in m.targets.iter().enumerate() {
                            let value = items.get(index).cloned().unwrap_or(Value::Null);
                            self.env.define_or_set(name, value);
                        }
                    }
                    single => {
                        if let Some(first) = m.targets.first() {
                            self.env.define_or_set(first, single);
                        }
                        for name in m.targets.iter().skip(1) {
                            self.env.define_or_set(name, Value::Null);
                        }
                    }
                }
                Ok(Signal::None)
            }
            Statement::Expr(e) => {
                self.eval_expr(e)?;
                Ok(Signal::None)
            }
            Statement::PossibleBlock(p) => {
                self.env.push_scope();
                let result = self.exec_statements(&p.body);
                self.env.pop_scope();

                match result {
                    Ok(signal) => Ok(signal),
                    Err(error_msg) => {
                        self.env.push_scope();
                        if let Some(err_name) = &p.error_name {
                            self.env.define(err_name, Value::Text(error_msg));
                        }
                        let signal = self.exec_statements(&p.else_body)?;
                        self.env.pop_scope();
                        Ok(signal)
                    }
                }
            }
            Statement::SafeBlock(body, _) | Statement::MetalBlock(body, _) => {
                self.env.push_scope();
                let signal = self.exec_statements(body)?;
                self.env.pop_scope();
                Ok(signal)
            }
            Statement::Block(stmts) => {
                self.env.push_scope();
                let signal = self.exec_statements(stmts)?;
                self.env.pop_scope();
                Ok(signal)
            }
            Statement::VarDecl(v) => {
                let value = self.eval_expr(&v.initializer)?;
                let value = if let Some(ref ta) = v.type_annotation {
                    self.coerce_to_type(value, ta)?
                } else {
                    value
                };
                self.env.define_or_set(&v.name, value);
                Ok(Signal::None)
            }
        }
    }

    fn try_emit_event(&mut self, expr: &Expr) -> Result<bool, String> {
        match expr {
            Expr::Call(callee, args, _) => {
                let callee_value = self.eval_expr(callee)?;
                if let Value::EventRef(event) = callee_value {
                    let arg_values: Vec<Value> = args
                        .iter()
                        .map(|arg| self.eval_expr(&arg.value))
                        .collect::<Result<_, _>>()?;
                    self.dispatch_event(&event, &arg_values)?;
                    return Ok(true);
                }
                Ok(false)
            }
            _ => {
                let value = self.eval_expr(expr)?;
                if let Value::EventRef(event) = value {
                    self.dispatch_event(&event, &[])?;
                    return Ok(true);
                }
                Ok(false)
            }
        }
    }

    fn dispatch_event(
        &mut self,
        event: &super::super::value::OboEventRef,
        args: &[Value],
    ) -> Result<(), String> {
        let listeners = self
            .event_listeners
            .get(&event.instance_id)
            .and_then(|events| events.get(&event.event_name))
            .cloned()
            .unwrap_or_default();

        for listener in listeners {
            let _ = self.call_value(&listener, args)?;
        }

        Ok(())
    }

    fn assign_target(&mut self, target: &Expr, value: Value) -> Result<(), String> {
        match target {
            Expr::Identifier(name, _) => {
                self.env.define_or_set(name, value);
                Ok(())
            }
            Expr::MemberAccess(obj, field, _) => {
                if let Expr::Identifier(name, _) = obj.as_ref() {
                    let instance = self
                        .env
                        .get(name)
                        .cloned()
                        .ok_or_else(|| format!("Obo: I don't see '{}' anywhere 👀", name))?;
                    if let Value::Instance(ref inst) = instance {
                        // Check for property setter
                        if let Some(TypeDef::Actor(actor)) = self.type_registry.get(&inst.type_name).cloned() {
                            for m in &actor.members {
                                if let ActorMember::Property(prop) = m {
                                    if prop.name == *field {
                                        if let Some((ref param_name, ref setter_body)) = prop.setter {
                                            self.env.push_scope();
                                            let fields = inst.snapshot_fields();
                                            for (k, v) in &fields {
                                                self.env.define(k, v.clone());
                                            }
                                            self.env.define(&param_name, value);
                                            self.exec_statements(setter_body)?;
                                            // Collect modified fields back
                                            for k in fields.keys() {
                                                if let Some(v) = self.env.get(&k).cloned() {
                                                    inst.set_field(k.clone(), v);
                                                }
                                            }
                                            self.env.pop_scope();
                                            self.env.define_or_set(name, instance);
                                            return Ok(());
                                        }
                                        return Err(format!(
                                            "Obo: Property '{}' has no setter 🤨", field
                                        ));
                                    }
                                }
                            }
                        }
                        inst.set_field(field.clone(), value);
                        self.env.define_or_set(name, instance);
                        return Ok(());
                    }
                }
                Err("Obo: Can't assign to this member access 🤨".into())
            }
            Expr::IndexAccess(obj, index, _) => {
                if let Expr::Identifier(name, _) = obj.as_ref() {
                    let idx = self.eval_expr(index)?;
                    let mut container = self
                        .env
                        .get(name)
                        .cloned()
                        .ok_or_else(|| format!("Obo: I don't see '{}' anywhere 👀", name))?;
                    match (&mut container, &idx) {
                        (Value::List(items), Value::Number(i)) => {
                            let i = *i as usize;
                            if i < items.len() {
                                items[i] = value;
                            } else {
                                return Err(format!(
                                    "Obo: Index {} is out of bounds (list has {} items) 😬",
                                    i,
                                    items.len()
                                ));
                            }
                        }
                        (Value::Map(map), _) => {
                            map.set(idx, value);
                        }
                        _ => return Err("Obo: Can't index into this 🤨".into()),
                    }
                    self.env.define_or_set(name, container);
                    return Ok(());
                }
                Err("Obo: Can't assign to this 🤨".into())
            }
            _ => Err("Obo: Can't assign to this expression 🤨".into()),
        }
    }

    fn check_pattern_matches(
        &mut self,
        value: &Value,
        pattern: &CheckPattern,
    ) -> Result<bool, String> {
        match pattern {
            CheckPattern::Null => Ok(matches!(value, Value::Null)),
            CheckPattern::Value(expr) => {
                let pattern_val = self.eval_expr(expr)?;
                Ok(value == &pattern_val)
            }
            CheckPattern::Comparison(op, expr) => {
                let rhs = self.eval_expr(expr)?;
                match op.as_str() {
                    "<" => Ok(self.compare_values(value, &rhs)? < 0),
                    ">" => Ok(self.compare_values(value, &rhs)? > 0),
                    "<=" => Ok(self.compare_values(value, &rhs)? <= 0),
                    ">=" => Ok(self.compare_values(value, &rhs)? >= 0),
                    "==" => Ok(value == &rhs),
                    "!=" => Ok(value != &rhs),
                    _ => Err(format!("Obo: Unknown comparison operator '{}'", op)),
                }
            }
            CheckPattern::TypeCheck(type_name, _) => match value {
                Value::Instance(inst) => Ok(inst.type_name == *type_name),
                Value::ChoiceValue(_, variant, _) => Ok(variant == type_name),
                _ => Ok(value.type_name() == type_name.as_str()),
            },
            CheckPattern::TypeWithGuard(type_name, _, _guard) => match value {
                Value::Instance(inst) => Ok(inst.type_name == *type_name),
                Value::ChoiceValue(_, variant, _) => Ok(variant == type_name),
                _ => Ok(false),
            },
        }
    }

    pub(super) fn compare_values(&self, a: &Value, b: &Value) -> Result<i32, String> {
        match (a, b) {
            (Value::Number(a), Value::Number(b)) => Ok(a.cmp(b) as i32),
            (Value::Decimal(a), Value::Decimal(b)) => {
                Ok(a.partial_cmp(b).map(|o| o as i32).unwrap_or(0))
            }
            (Value::Number(a), Value::Decimal(b)) => {
                Ok((*a as f64).partial_cmp(b).map(|o| o as i32).unwrap_or(0))
            }
            (Value::Decimal(a), Value::Number(b)) => {
                Ok(a.partial_cmp(&(*b as f64)).map(|o| o as i32).unwrap_or(0))
            }
            (Value::Text(a), Value::Text(b)) => Ok(a.cmp(b) as i32),
            (Value::Byte(a), Value::Byte(b)) => Ok(a.cmp(b) as i32),
            (Value::Byte(a), Value::Number(b)) => Ok((*a as i64).cmp(b) as i32),
            (Value::Number(a), Value::Byte(b)) => Ok(a.cmp(&(*b as i64)) as i32),
            _ => Err(format!(
                "Obo: Can't compare {} with {} 🤨",
                a.type_name(),
                b.type_name()
            )),
        }
    }

    pub(super) fn coerce_to_type(&self, value: Value, te: &TypeExpr) -> Result<Value, String> {
        if let TypeExpr::Named(name, _) = te {
            match name.as_str() {
                "byte" => {
                    let n = value.to_number().ok_or_else(|| {
                        format!("Obo: Can't convert {} to byte 🤨", value.type_name())
                    })?;
                    if n < 0 || n > 255 {
                        return Err(format!(
                            "Obo: That number is too big for a byte (got {}, need 0–255) 😬",
                            n
                        ));
                    }
                    Ok(Value::Byte(n as u8))
                }
                "pointer" => {
                    let n = value.to_number().unwrap_or(0);
                    Ok(Value::Pointer(n as u64))
                }
                _ => Ok(value),
            }
        } else {
            Ok(value)
        }
    }

    /// Check if a list of statements contains an `emit` statement (recursively).
    fn body_contains_emit(stmts: &[Statement]) -> bool {
        for stmt in stmts {
            match stmt {
                Statement::Emit(_) => return true,
                Statement::If(i) => {
                    if Self::body_contains_emit(&i.then_body) { return true; }
                    if let Some(else_body) = &i.else_body {
                        if Self::body_contains_emit(else_body) { return true; }
                    }
                }
                Statement::While(w) => {
                    if Self::body_contains_emit(&w.body) { return true; }
                }
                Statement::Forever(f) => {
                    if Self::body_contains_emit(&f.body) { return true; }
                }
                Statement::ForIn(f) => {
                    if Self::body_contains_emit(&f.body) { return true; }
                }
                Statement::Count(c) => {
                    if Self::body_contains_emit(&c.body) { return true; }
                }
                Statement::Check(c) => {
                    for arm in &c.arms {
                        if Self::body_contains_emit(&arm.body) { return true; }
                    }
                }
                _ => {}
            }
        }
        false
    }
}