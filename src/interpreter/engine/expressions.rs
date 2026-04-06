use std::collections::HashMap;

use crate::parser::ast::*;
use crate::stdlib;

use super::super::value::{
    ActionBody, OboAction, OboEventRef, OboFunction, OboInstance, Value,
};
use super::{Interpreter, Signal, TypeDef};

impl Interpreter {
    pub(super) fn eval_expr(&mut self, expr: &Expr) -> Result<Value, String> {
        match expr {
            Expr::NumberLit(n, _) => Ok(Value::Number(*n)),
            Expr::DecimalLit(n, _) => Ok(Value::Decimal(*n)),
            Expr::StringLit(s, _) => Ok(Value::Text(s.clone())),
            Expr::CharLit(c, _) => Ok(Value::Char(*c)),
            Expr::BoolLit(b, _) => Ok(Value::Flag(*b)),
            Expr::NullLit(_) => Ok(Value::Null),
            Expr::Identifier(name, _) => {
                if let Some(val) = self.env.get(name).cloned() {
                    Ok(val)
                } else if self.type_registry.contains_key(name) {
                    Ok(Value::Text(format!("__type__{}", name)))
                } else if stdlib::SYSTEM_ACTORS.contains(&name.as_str()) {
                    Ok(Value::Text(format!("__system__{}", name)))
                } else if let Some(lib) = self.bridge_functions.get(name) {
                    Err(format!("Obo: '{}' is a bridge function (from \"{}\") — use 'obo build' for native compilation 🔧", name, lib))
                } else {
                    Err(format!("Obo: I don't see '{}' anywhere 👀", name))
                }
            }
            Expr::Binary(left, op, right, _) => {
                let lhs = self.eval_expr(left)?;
                let rhs = self.eval_expr(right)?;
                self.eval_binary(&lhs, op, &rhs)
            }
            Expr::Unary(op, operand, _) => {
                let val = self.eval_expr(operand)?;
                match op {
                    UnaryOp::Neg => match val {
                        Value::Number(n) => Ok(Value::Number(-n)),
                        Value::Decimal(n) => Ok(Value::Decimal(-n)),
                        _ => Err(format!("Obo: Can't negate a {} 🤨", val.type_name())),
                    },
                    UnaryOp::Not => Ok(Value::Flag(!val.is_truthy())),
                }
            }
            Expr::Logical(left, op, right, _) => {
                let lhs = self.eval_expr(left)?;
                match op {
                    LogicalOp::And => {
                        if !lhs.is_truthy() {
                            Ok(Value::Flag(false))
                        } else {
                            Ok(Value::Flag(self.eval_expr(right)?.is_truthy()))
                        }
                    }
                    LogicalOp::Or => {
                        if lhs.is_truthy() {
                            Ok(Value::Flag(true))
                        } else {
                            Ok(Value::Flag(self.eval_expr(right)?.is_truthy()))
                        }
                    }
                }
            }
            Expr::Call(callee, args, _) => self.eval_call(callee, args),
            Expr::MemberAccess(obj, member, _) => {
                let object = self.eval_expr(obj)?;
                self.eval_member_access(&object, member, obj)
            }
            Expr::IndexAccess(obj, index, _) => {
                let object = self.eval_expr(obj)?;
                let idx = self.eval_expr(index)?;
                match (&object, &idx) {
                    (Value::List(items), Value::Number(i)) => {
                        let i = *i as usize;
                        items.get(i).cloned().ok_or_else(|| {
                            format!(
                                "Obo: Index {} is out of bounds (list has {} items) 😬",
                                i,
                                items.len()
                            )
                        })
                    }
                    (Value::Text(s), Value::Number(i)) => {
                        let i = *i as usize;
                        s.chars().nth(i).map(Value::Char).ok_or_else(|| {
                            format!("Obo: Index {} is out of bounds 😬", i)
                        })
                    }
                    (Value::Map(pairs), _) => {
                        for (k, v) in pairs {
                            if k == &idx {
                                return Ok(v.clone());
                            }
                        }
                        Ok(Value::Null)
                    }
                    _ => Err(format!("Obo: Can't index into {} 🤨", object.type_name())),
                }
            }
            Expr::ListLiteral(elems, _) => {
                let items: Vec<Value> = elems
                    .iter()
                    .map(|e| self.eval_expr(e))
                    .collect::<Result<_, _>>()?;
                Ok(Value::List(items))
            }
            Expr::MapLiteral(pairs, _) => {
                let items: Vec<(Value, Value)> = pairs
                    .iter()
                    .map(|(k, v)| Ok((self.eval_expr(k)?, self.eval_expr(v)?)))
                    .collect::<Result<_, String>>()?;
                Ok(Value::Map(items))
            }
            Expr::EntityInit(name, fields, _) => {
                // Block instantiation of template actors
                if let Some(TypeDef::Actor(actor)) = self.type_registry.get(name) {
                    if actor.is_abstract {
                        return Err(format!("Obo: Can't create {} — it's a template 🤨", name));
                    }
                }
                let mut field_map = HashMap::new();
                for field in fields {
                    let value = self.eval_expr(&field.value)?;
                    field_map.insert(field.name.clone(), value);
                }
                Ok(Value::Instance(OboInstance {
                    instance_id: self.fresh_instance_id(),
                    type_name: name.clone(),
                    fields: field_map,
                }))
            }
            Expr::Cast(_, operand, _) => {
                let val = self.eval_expr(operand)?;
                Ok(val)
            }
            Expr::InlineIf(value, condition, fallback, _) => {
                let cond = self.eval_expr(condition)?;
                if cond.is_truthy() {
                    self.eval_expr(value)
                } else {
                    self.eval_expr(fallback)
                }
            }
            Expr::IfPossibleElse(expr, fallback, _) => match self.eval_expr(expr) {
                Ok(val) if !matches!(val, Value::Null) => Ok(val),
                _ => self.eval_expr(fallback),
            },
            Expr::SafeCast(_, expr, fallback, _) => match self.eval_expr(expr) {
                Ok(val) if !matches!(val, Value::Null) => Ok(val),
                _ => self.eval_expr(fallback),
            },
            Expr::Range(start, end, step, _) => {
                let s = self.eval_expr(start)?.to_number().unwrap_or(0);
                let e = self.eval_expr(end)?.to_number().unwrap_or(0);
                let st = step
                    .as_ref()
                    .map(|s| self.eval_expr(s).ok().and_then(|v| v.to_number()).unwrap_or(1))
                    .unwrap_or(1);
                let mut items = Vec::new();
                let mut i = s;
                while (st > 0 && i < e) || (st < 0 && i > e) {
                    items.push(Value::Number(i));
                    i += st;
                }
                Ok(Value::List(items))
            }
            Expr::Run(expr, _) => self.spawn_task_expr(expr),
            Expr::ChannelCreate(_) => {
                use std::collections::VecDeque;
                use std::sync::{Arc, Mutex, Condvar};
                Ok(Value::Channel(super::super::value::OboChannel {
                    inner: Arc::new((Mutex::new(VecDeque::new()), Condvar::new())),
                }))
            }
            Expr::AtomicCreate(init, _) => {
                use std::sync::Arc;
                use std::sync::atomic::AtomicI64;
                let initial = if let Some(expr) = init {
                    match self.eval_expr(expr)? {
                        Value::Number(n) => n,
                        _ => 0,
                    }
                } else {
                    0
                };
                Ok(Value::Atomic(super::super::value::OboAtomic {
                    inner: Arc::new(AtomicI64::new(initial)),
                }))
            }
            Expr::Action(params, body, _) => {
                let captured = self.env.snapshot_all();
                Ok(Value::Action(OboAction {
                    params: params.clone(),
                    body: ActionBody::Block(body.clone()),
                    captured_env: captured,
                }))
            }
            Expr::ArrowAction(params, body, _) => {
                let captured = self.env.snapshot_all();
                Ok(Value::Action(OboAction {
                    params: params.clone(),
                    body: ActionBody::Expr(body.clone()),
                    captured_env: captured,
                }))
            }
            Expr::Pipe(left, right, _) => {
                let val = self.eval_expr(left)?;
                match right.as_ref() {
                    Expr::Call(callee, args, span) => {
                        let mut new_args = vec![CallArg {
                            name: None,
                            value: Expr::NumberLit(0, *span),
                        }];
                        new_args.extend(args.clone());
                        let callee_val = self.eval_expr(callee)?;
                        let mut arg_vals = vec![val];
                        for arg in args {
                            arg_vals.push(self.eval_expr(&arg.value)?);
                        }
                        self.call_value(&callee_val, &arg_vals)
                    }
                    Expr::Identifier(name, _) => {
                        let func = self.env.get(name).cloned().ok_or_else(|| {
                            format!("Obo: I don't see '{}' anywhere 👀", name)
                        })?;
                        self.call_value(&func, &[val])
                    }
                    _ => Err("Obo: Right side of pipe must be a function 🤨".into()),
                }
            }
            Expr::Interpolation(parts, _) => {
                let mut result = String::new();
                for part in parts {
                    let val = self.eval_expr(part)?;
                    result.push_str(&val.to_string());
                }
                Ok(Value::Text(result))
            }
        }
    }

    fn eval_binary(&mut self, lhs: &Value, op: &BinOp, rhs: &Value) -> Result<Value, String> {
        // Check for operator overloading on instances
        if let Value::Instance(inst) = lhs {
            let op_str = match op {
                BinOp::Add => "+", BinOp::Sub => "-", BinOp::Mul => "*", BinOp::Div => "/",
                BinOp::Mod => "%", BinOp::Eq => "==", BinOp::NotEq => "!=",
                BinOp::Less => "<", BinOp::Greater => ">", BinOp::LessEq => "<=", BinOp::GreaterEq => ">=",
            };
            if let Some(TypeDef::Actor(actor)) = self.type_registry.get(&inst.type_name).cloned() {
                for m in &actor.members {
                    if let ActorMember::Operator(op_decl) = m {
                        if op_decl.op == op_str {
                            self.env.push_scope();
                            for (k, v) in &inst.fields {
                                self.env.define(k, v.clone());
                            }
                            self.env.define(&op_decl.param.name, rhs.clone());
                            let signal = self.exec_statements(&op_decl.body)?;
                            self.env.pop_scope();
                            return match signal {
                                Signal::Out(values) if !values.is_empty() => {
                                    Ok(values.into_iter().next().unwrap())
                                }
                                _ => Ok(Value::Null),
                            };
                        }
                    }
                }
            }
        }

        match op {
            BinOp::Add => match (lhs, rhs) {
                (Value::Number(a), Value::Number(b)) => Ok(Value::Number(a + b)),
                (Value::Decimal(a), Value::Decimal(b)) => Ok(Value::Decimal(a + b)),
                (Value::Number(a), Value::Decimal(b)) => Ok(Value::Decimal(*a as f64 + b)),
                (Value::Decimal(a), Value::Number(b)) => Ok(Value::Decimal(a + *b as f64)),
                (Value::Text(a), Value::Text(b)) => Ok(Value::Text(format!("{}{}", a, b))),
                (Value::Text(a), other) => Ok(Value::Text(format!("{}{}", a, other))),
                (other, Value::Text(b)) => Ok(Value::Text(format!("{}{}", other, b))),
                (Value::List(a), Value::List(b)) => {
                    let mut result = a.clone();
                    result.extend(b.clone());
                    Ok(Value::List(result))
                }
                _ => Err(format!(
                    "Obo: Can't add {} and {} 🤨",
                    lhs.type_name(),
                    rhs.type_name()
                )),
            },
            BinOp::Sub => self.numeric_op(lhs, rhs, |a, b| a - b, |a, b| a - b, "-"),
            BinOp::Mul => self.numeric_op(lhs, rhs, |a, b| a * b, |a, b| a * b, "*"),
            BinOp::Div => {
                let is_zero =
                    matches!(rhs, Value::Number(0)) || matches!(rhs, Value::Decimal(n) if *n == 0.0);
                if is_zero {
                    Err("Obo: Division by zero — that's not going to work 😬".into())
                } else {
                    self.numeric_op(lhs, rhs, |a, b| a / b, |a, b| a / b, "/")
                }
            }
            BinOp::Mod => self.numeric_op(lhs, rhs, |a, b| a % b, |a, b| a % b, "%"),
            BinOp::Eq => Ok(Value::Flag(lhs == rhs)),
            BinOp::NotEq => Ok(Value::Flag(lhs != rhs)),
            BinOp::Less => Ok(Value::Flag(self.compare_values(lhs, rhs)? < 0)),
            BinOp::Greater => Ok(Value::Flag(self.compare_values(lhs, rhs)? > 0)),
            BinOp::LessEq => Ok(Value::Flag(self.compare_values(lhs, rhs)? <= 0)),
            BinOp::GreaterEq => Ok(Value::Flag(self.compare_values(lhs, rhs)? >= 0)),
        }
    }

    fn numeric_op(
        &self,
        lhs: &Value,
        rhs: &Value,
        int_op: fn(i64, i64) -> i64,
        float_op: fn(f64, f64) -> f64,
        op_name: &str,
    ) -> Result<Value, String> {
        match (lhs, rhs) {
            (Value::Number(a), Value::Number(b)) => Ok(Value::Number(int_op(*a, *b))),
            (Value::Decimal(a), Value::Decimal(b)) => Ok(Value::Decimal(float_op(*a, *b))),
            (Value::Number(a), Value::Decimal(b)) => {
                Ok(Value::Decimal(float_op(*a as f64, *b)))
            }
            (Value::Decimal(a), Value::Number(b)) => {
                Ok(Value::Decimal(float_op(*a, *b as f64)))
            }
            (Value::Byte(a), Value::Byte(b)) => {
                let result = int_op(*a as i64, *b as i64);
                Ok(Value::Byte(result as u8))
            }
            (Value::Byte(a), Value::Number(b)) => Ok(Value::Number(int_op(*a as i64, *b))),
            (Value::Number(a), Value::Byte(b)) => Ok(Value::Number(int_op(*a, *b as i64))),
            _ => Err(format!(
                "Obo: Can't use '{}' with {} and {} 🤨",
                op_name,
                lhs.type_name(),
                rhs.type_name()
            )),
        }
    }

    pub(super) fn eval_member_access(
        &mut self,
        object: &Value,
        member: &str,
        obj_expr: &Expr,
    ) -> Result<Value, String> {
        match object {
            Value::Instance(inst) => {
                if let Some(val) = inst.fields.get(member) {
                    return Ok(val.clone());
                }

                // Walk the inheritance chain for properties, events, and methods
                let mut current_type = Some(inst.type_name.clone());
                while let Some(ref type_name) = current_type {
                    if let Some(TypeDef::Actor(actor)) = self.type_registry.get(type_name).cloned()
                    {
                        // Check for property getter
                        for m in &actor.members {
                            if let ActorMember::Property(prop) = m {
                                if prop.name == member {
                                    if let Some(ref getter) = prop.getter {
                                        // Execute getter with `self` fields in scope
                                        self.env.push_scope();
                                        for (k, v) in &inst.fields {
                                            self.env.define(k, v.clone());
                                        }
                                        let signal = self.exec_statements(getter)?;
                                        self.env.pop_scope();
                                        return match signal {
                                            Signal::Out(values) if !values.is_empty() => {
                                                Ok(values.into_iter().next().unwrap())
                                            }
                                            _ => Ok(Value::Null),
                                        };
                                    }
                                    return Err(format!(
                                        "Obo: Property '{}' on {} has no getter 🤨",
                                        member, inst.type_name
                                    ));
                                }
                            }
                        }

                        for m in &actor.members {
                            match m {
                                ActorMember::Event(event) if event.name == member => {
                                    return Ok(Value::EventRef(OboEventRef {
                                        instance_id: inst.instance_id,
                                        owner_type: inst.type_name.clone(),
                                        event_name: event.name.clone(),
                                    }));
                                }
                                ActorMember::Method(f) if f.name == member => {
                                    let func = OboFunction {
                                        name: f.name.clone(),
                                        params: f.params.clone(),
                                        body: f.body.clone(),
                                        closure_env: None,
                                    };
                                    return Ok(Value::Function(func));
                                }
                                _ => {}
                            }
                        }
                        current_type = actor.parent.clone();
                    } else {
                        break;
                    }
                }

                Err(format!(
                    "Obo: {} doesn't have a field or function called '{}' 🤨",
                    inst.type_name, member
                ))
            }
            Value::List(items) => {
                if let Some(val) = stdlib::collections::list_member(items, member) {
                    return Ok(val);
                }
                Ok(Value::BuiltinFn(format!("list.{}", member)))
            }
            Value::Map(pairs) => {
                if let Some(val) = stdlib::collections::map_member(pairs, member) {
                    return Ok(val);
                }
                Ok(Value::BuiltinFn(format!("map.{}", member)))
            }
            Value::Text(s) if s.starts_with("__system__") => {
                let actor_name = &s[10..];
                if let Some(val) = stdlib::system_member(actor_name, member) {
                    return Ok(val);
                }
                Ok(Value::BuiltinFn(format!("{}.{}", actor_name, member)))
            }
            Value::Text(s) if s.starts_with("__type__") => {
                let type_name = &s[8..];
                let qualified = format!("{}.{}", type_name, member);
                if let Some(val) = self.env.get(&qualified).cloned() {
                    return Ok(val);
                }
                Err(format!("Obo: {} doesn't have '{}' 🤨", type_name, member))
            }
            Value::Text(s) => {
                if let Some(val) = stdlib::text::text_member(s, member) {
                    return Ok(val);
                }
                Ok(Value::BuiltinFn(format!("text.{}", member)))
            }
            Value::Set(items) => {
                if let Some(val) = stdlib::collections::set_member(items, member) {
                    return Ok(val);
                }
                Err(format!("Obo: set doesn't have '{}' 🤨", member))
            }
            Value::Queue(items) => {
                if let Some(val) = stdlib::collections::queue_member(items, member) {
                    return Ok(val);
                }
                Err(format!("Obo: queue doesn't have '{}' 🤨", member))
            }
            Value::Stack(items) => {
                if let Some(val) = stdlib::collections::stack_member(items, member) {
                    return Ok(val);
                }
                Err(format!("Obo: stack doesn't have '{}' 🤨", member))
            }
            Value::Pair(first, second) => {
                if let Some(val) = stdlib::collections::pair_member(first, second, member) {
                    return Ok(val);
                }
                Err(format!("Obo: pair doesn't have '{}' 🤨", member))
            }
            Value::Bag(items) => {
                if let Some(val) = stdlib::collections::bag_member(items, member) {
                    return Ok(val);
                }
                Err(format!("Obo: bag doesn't have '{}' 🤨", member))
            }
            Value::Buffer(buf) => {
                if let Some(val) = stdlib::collections::buffer_member(buf, member) {
                    return Ok(val);
                }
                Err(format!("Obo: buffer doesn't have '{}' 🤨", member))
            }
            Value::Grid2D { rows, cols, data } => {
                if let Some(val) = stdlib::collections::grid2d_member(*rows, *cols, data, member) {
                    return Ok(val);
                }
                Err(format!("Obo: grid2d doesn't have '{}' 🤨", member))
            }
            Value::Grid3D { x, y, z, data } => {
                if let Some(val) = stdlib::collections::grid3d_member(*x, *y, *z, data, member) {
                    return Ok(val);
                }
                Err(format!("Obo: grid3d doesn't have '{}' 🤨", member))
            }
            Value::Channel(ch) => {
                match member {
                    "size" => {
                        let (lock, _) = &*ch.inner;
                        let queue = lock.lock().map_err(|e| format!("Obo: channel lock error: {} 😬", e))?;
                        Ok(Value::Number(queue.len() as i64))
                    }
                    _ => Err(format!("Obo: channel doesn't have '{}' 🤨", member)),
                }
            }
            Value::Atomic(a) => {
                use std::sync::atomic::Ordering;
                match member {
                    "value" | "load" => Ok(Value::Number(a.inner.load(Ordering::SeqCst))),
                    _ => Err(format!("Obo: atomic doesn't have '{}' 🤨", member)),
                }
            }
            Value::Pointer(_) => {
                match member {
                    "free" => Ok(Value::BuiltinFn("pointer.free".into())),
                    "address" => {
                        if let Value::Pointer(addr) = object {
                            Ok(Value::Number(*addr as i64))
                        } else {
                            Ok(Value::Number(0))
                        }
                    }
                    _ => Err(format!("Obo: pointer doesn't have '{}' 🤨", member)),
                }
            }
            Value::Byte(b) => {
                match member {
                    "value" => Ok(Value::Number(*b as i64)),
                    _ => Err(format!("Obo: byte doesn't have '{}' 🤨", member)),
                }
            }
            _ => {
                if let Expr::Identifier(name, _) = obj_expr {
                    if stdlib::SYSTEM_ACTORS.contains(&name.as_str()) {
                        if let Some(val) = stdlib::system_member(name, member) {
                            return Ok(val);
                        }
                        return Ok(Value::BuiltinFn(format!("{}.{}", name, member)));
                    }
                }

                if let Expr::Identifier(name, _) = obj_expr {
                    let qualified = format!("{}.{}", name, member);
                    if let Some(val) = self.env.get(&qualified).cloned() {
                        return Ok(val);
                    }
                }
                Err(format!(
                    "Obo: {} doesn't have '{}' 🤨",
                    object.type_name(),
                    member
                ))
            }
        }
    }
}