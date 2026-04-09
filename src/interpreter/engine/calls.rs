use std::collections::HashSet;

use crate::parser::ast::*;
use crate::stdlib;

use super::super::value::{ActionBody, OboAction, OboFunction, OboMap, Value};
use super::{Interpreter, Signal, TypeDef};

impl Interpreter {
    pub(super) fn eval_call(&mut self, callee: &Expr, args: &[CallArg]) -> Result<Value, String> {
        if let Expr::MemberAccess(obj, method, _) = callee {
            let object = self.eval_expr(obj)?;
            return self.eval_method_call(object, method, args, obj);
        }

        // Handle set/queue/stack/pair/bag/buffer/slice constructors
        if let Expr::Identifier(name, _) = callee {
            if matches!(name.as_str(), "map" | "set" | "queue" | "stack" | "pair" | "bag" | "buffer" | "slice" | "grid2d" | "grid3d" | "TextBuilder" | "Arena") && self.env.get(name).is_none() {
                let arg_vals: Vec<Value> = args
                    .iter()
                    .map(|a| self.eval_expr(&a.value))
                    .collect::<Result<_, _>>()?;
                return match name.as_str() {
                    "map" => Ok(Value::Map(OboMap::new())),
                    "set" => {
                        let mut seen = Vec::new();
                        for v in arg_vals {
                            if !seen.contains(&v) {
                                seen.push(v);
                            }
                        }
                        Ok(Value::Set(seen))
                    }
                    "queue" => Ok(Value::Queue(arg_vals)),
                    "stack" => Ok(Value::Stack(arg_vals)),
                    "pair" => {
                        if arg_vals.len() != 2 {
                            return Err(format!(
                                "Obo: pair() requires exactly 2 arguments, got {} 🤨", arg_vals.len()
                            ));
                        }
                        let mut it = arg_vals.into_iter();
                        Ok(Value::Pair(Box::new(it.next().unwrap()), Box::new(it.next().unwrap())))
                    }
                    "bag" => Ok(Value::Bag(arg_vals)),
                    "buffer" => {
                        if arg_vals.len() == 1 {
                            let size = match &arg_vals[0] {
                                Value::Number(n) => *n as usize,
                                _ => return Err("Obo: buffer() size must be an integer 🤨".into()),
                            };
                            Ok(Value::Buffer(vec![0u8; size]))
                        } else if arg_vals.is_empty() {
                            Ok(Value::Buffer(Vec::new()))
                        } else {
                            return Err("Obo: buffer() takes 0 or 1 arguments 🤨".into());
                        }
                    }
                    "TextBuilder" => {
                        let cap = if arg_vals.len() == 1 {
                            match &arg_vals[0] {
                                Value::Number(n) => *n as usize,
                                _ => 64,
                            }
                        } else { 64 };
                        Ok(Value::TextBuilder(std::sync::Arc::new(std::sync::Mutex::new(Vec::with_capacity(cap)))))
                    }
                    "Arena" => {
                        let cap = if arg_vals.len() == 1 {
                            match &arg_vals[0] {
                                Value::Number(n) => *n as usize,
                                _ => 1024,
                            }
                        } else { 1024 };
                        Ok(Value::Arena(std::sync::Arc::new(std::sync::Mutex::new(
                            super::super::value::OboArenaInterp::new(cap)
                        ))))
                    }
                    "slice" => {
                        if arg_vals.len() != 3 {
                            return Err(format!(
                                "Obo: slice() requires 3 arguments (list, start, end), got {} 🤨", arg_vals.len()
                            ));
                        }
                        let mut it = arg_vals.into_iter();
                        let list = it.next().unwrap();
                        let start = it.next().unwrap();
                        let end = it.next().unwrap();
                        let items = match list {
                            Value::List(v) => v,
                            _ => return Err("Obo: slice() first argument must be a list 🤨".into()),
                        };
                        let s = match start {
                            Value::Number(n) => n as usize,
                            _ => return Err("Obo: slice() start must be an integer 🤨".into()),
                        };
                        let e = match end {
                            Value::Number(n) => n as usize,
                            _ => return Err("Obo: slice() end must be an integer 🤨".into()),
                        };
                        let e = e.min(items.len());
                        let s = s.min(e);
                        Ok(Value::List(items[s..e].to_vec()))
                    }
                    "grid2d" => {
                        if arg_vals.len() < 2 {
                            return Err("Obo: grid2d() requires at least 2 arguments (rows, cols) 🤨".into());
                        }
                        let rows = match &arg_vals[0] {
                            Value::Number(n) => *n as usize,
                            _ => return Err("Obo: grid2d() rows must be a number 🤨".into()),
                        };
                        let cols = match &arg_vals[1] {
                            Value::Number(n) => *n as usize,
                            _ => return Err("Obo: grid2d() cols must be a number 🤨".into()),
                        };
                        let fill = if arg_vals.len() > 2 { arg_vals[2].clone() } else { Value::Number(0) };
                        let data = vec![fill; rows * cols];
                        Ok(Value::Grid2D { rows, cols, data })
                    }
                    "grid3d" => {
                        if arg_vals.len() < 3 {
                            return Err("Obo: grid3d() requires at least 3 arguments (x, y, z) 🤨".into());
                        }
                        let x = match &arg_vals[0] {
                            Value::Number(n) => *n as usize,
                            _ => return Err("Obo: grid3d() x must be a number 🤨".into()),
                        };
                        let y = match &arg_vals[1] {
                            Value::Number(n) => *n as usize,
                            _ => return Err("Obo: grid3d() y must be a number 🤨".into()),
                        };
                        let z = match &arg_vals[2] {
                            Value::Number(n) => *n as usize,
                            _ => return Err("Obo: grid3d() z must be a number 🤨".into()),
                        };
                        let fill = if arg_vals.len() > 3 { arg_vals[3].clone() } else { Value::Number(0) };
                        let data = vec![fill; x * y * z];
                        Ok(Value::Grid3D { x, y, z, data })
                    }
                    _ => unreachable!(),
                };
            }

            // inspect(obj) — returns a list of maps with field info
            if name == "inspect" {
                if args.len() != 1 {
                    return Err("Obo: inspect() takes exactly 1 argument 🤨".into());
                }
                let obj = self.eval_expr(&args[0].value)?;
                return Ok(self.reflect_value(&obj));
            }
        }

        let callee_val = self.eval_expr(callee)?;
        let has_named = args.iter().any(|a| a.name.is_some());

        if has_named {
            // Reorder named arguments to match parameter order
            let params: &[Param] = match &callee_val {
                Value::Function(f) => &f.params,
                Value::Action(a) => &a.params,
                _ => &[],
            };
            if !params.is_empty() {
                let arg_vals = self.reorder_named_args(args, params)?;
                return self.call_value(&callee_val, &arg_vals);
            }
        }

        let arg_vals: Vec<Value> = args
            .iter()
            .map(|a| self.eval_expr(&a.value))
            .collect::<Result<_, _>>()?;

        self.call_value(&callee_val, &arg_vals)
    }

    pub(super) fn call_value(&mut self, callee: &Value, args: &[Value]) -> Result<Value, String> {
        match callee {
            Value::Function(f) => self.call_function(f, args),
            Value::Action(a) => self.call_action(a, args),
            Value::BuiltinFn(name) => self.call_builtin(name, args),
            _ => Err(format!(
                "Obo: Can't call {} — it's not a function 🤨",
                callee.type_name()
            )),
        }
    }

    pub fn call_function(
        &mut self,
        func: &OboFunction,
        args: &[Value],
    ) -> Result<Value, String> {
        self.env.push_scope();

        for (index, param) in func.params.iter().enumerate() {
            let value = if index < args.len() {
                args[index].clone()
            } else if let Some(default) = &param.default_value {
                self.eval_expr(default)?
            } else {
                Value::Null
            };
            self.env.define(&param.name, value);
        }

        let signal = self.exec_statements(&func.body)?;
        self.env.pop_scope();

        match signal {
            Signal::Out(values) => {
                if values.len() == 1 {
                    Ok(values.into_iter().next().unwrap())
                } else if values.is_empty() {
                    Ok(Value::Null)
                } else {
                    Ok(Value::List(values))
                }
            }
            _ => Ok(Value::Null),
        }
    }

    fn call_action(&mut self, action: &OboAction, args: &[Value]) -> Result<Value, String> {
        self.env.push_scope();

        for (key, value) in &action.captured_env {
            self.env.define(key, value.clone());
        }

        for (index, param) in action.params.iter().enumerate() {
            let value = args.get(index).cloned().unwrap_or(Value::Null);
            self.env.define(&param.name, value);
        }

        let result = match &action.body {
            ActionBody::Block(stmts) => {
                let signal = self.exec_statements(stmts)?;
                match signal {
                    Signal::Out(values) => {
                        if values.len() == 1 {
                            values.into_iter().next().unwrap()
                        } else {
                            Value::Null
                        }
                    }
                    _ => Value::Null,
                }
            }
            ActionBody::Expr(expr) => self.eval_expr(expr)?,
        };

        self.env.pop_scope();
        Ok(result)
    }

    fn eval_method_call(
        &mut self,
        object: Value,
        method: &str,
        args: &[CallArg],
        obj_expr: &Expr,
    ) -> Result<Value, String> {
        let arg_vals: Vec<Value> = args
            .iter()
            .map(|a| self.eval_expr(&a.value))
            .collect::<Result<_, _>>()?;

        if let Value::Text(ref s) = object {
            if s.starts_with("__system__") {
                let actor_name = &s[10..];
                if let Some(result) = stdlib::system_call(actor_name, method, &arg_vals) {
                    return result;
                }
                return Err(format!("Obo: {}.{} — I don't know that one 🤨", actor_name, method));
            }
        }

        if let Value::EventRef(event) = &object {
            if method != "listen" {
                return Err(format!(
                    "Obo: Event {}.{} only supports listen(...) right now 🤨",
                    event.owner_type, event.event_name
                ));
            }

            let listener = arg_vals
                .first()
                .cloned()
                .ok_or_else(|| {
                    format!(
                        "Obo: Event {}.{} needs a listener action or function 🤨",
                        event.owner_type, event.event_name
                    )
                })?;

            if !matches!(listener, Value::Action(_) | Value::Function(_) | Value::BuiltinFn(_)) {
                return Err(format!(
                    "Obo: Event {}.{} needs an action or function, not {} 🤨",
                    event.owner_type,
                    event.event_name,
                    listener.type_name()
                ));
            }

            self.event_listeners
                .entry(event.instance_id)
                .or_default()
                .entry(event.event_name.clone())
                .or_default()
                .push(listener);

            return Ok(Value::Null);
        }

        if let Value::List(ref items) = object {
            match method {
                "filter" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut result = Vec::new();
                        for item in items {
                            let passes = self.call_value(action_val, &[item.clone()])?;
                            if passes.is_truthy() {
                                result.push(item.clone());
                            }
                        }
                        return self.maybe_writeback(obj_expr, Value::List(result));
                    }
                    return Err("Obo: filter needs an action 🤨".into());
                }
                "map" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut result = Vec::new();
                        for item in items {
                            result.push(self.call_value(action_val, &[item.clone()])?);
                        }
                        return self.maybe_writeback(obj_expr, Value::List(result));
                    }
                    return Err("Obo: map needs an action 🤨".into());
                }
                "reduce" => {
                    if arg_vals.len() >= 2 {
                        let mut acc = arg_vals[0].clone();
                        let action_val = &arg_vals[1];
                        for item in items {
                            acc = self.call_value(action_val, &[acc, item.clone()])?;
                        }
                        return Ok(acc);
                    }
                    return Err("Obo: reduce needs an initial value and an action 🤨".into());
                }
                "any" => {
                    if let Some(action_val) = arg_vals.first() {
                        for item in items {
                            if self.call_value(action_val, &[item.clone()])?.is_truthy() {
                                return Ok(Value::Flag(true));
                            }
                        }
                        return Ok(Value::Flag(false));
                    }
                    return Err("Obo: any needs an action 🤨".into());
                }
                "all" => {
                    if let Some(action_val) = arg_vals.first() {
                        for item in items {
                            if !self.call_value(action_val, &[item.clone()])?.is_truthy() {
                                return Ok(Value::Flag(false));
                            }
                        }
                        return Ok(Value::Flag(true));
                    }
                    return Err("Obo: all needs an action 🤨".into());
                }
                "sortBy" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut sorted = items.to_vec();
                        let action_clone = action_val.clone();
                        let mut err: Option<String> = None;
                        sorted.sort_by(|a, b| {
                            if err.is_some() {
                                return std::cmp::Ordering::Equal;
                            }
                            match self.call_value(&action_clone, &[a.clone(), b.clone()]) {
                                Ok(Value::Number(n)) => {
                                    if n < 0 { std::cmp::Ordering::Less }
                                    else if n > 0 { std::cmp::Ordering::Greater }
                                    else { std::cmp::Ordering::Equal }
                                }
                                Ok(Value::Decimal(d)) => {
                                    if d < 0.0 { std::cmp::Ordering::Less }
                                    else if d > 0.0 { std::cmp::Ordering::Greater }
                                    else { std::cmp::Ordering::Equal }
                                }
                                Ok(_) => std::cmp::Ordering::Equal,
                                Err(e) => { err = Some(e); std::cmp::Ordering::Equal }
                            }
                        });
                        if let Some(e) = err {
                            return Err(e);
                        }
                        return self.maybe_writeback(obj_expr, Value::List(sorted));
                    }
                    return Err("Obo: sortBy needs a comparator action 🤨".into());
                }
                _ => {}
            }
            if let Some(result) = stdlib::collections::list_method(items, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::F64List(ref items) = object {
            match method {
                "filter" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut result = Vec::new();
                        for &item in items {
                            let passes = self.call_value(action_val, &[Value::Decimal(item)])?;
                            if passes.is_truthy() {
                                result.push(item);
                            }
                        }
                        return self.maybe_writeback(obj_expr, Value::F64List(result));
                    }
                    return Err("Obo: filter needs an action 🤨".into());
                }
                "map" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut result = Vec::new();
                        for &item in items {
                            let val = self.call_value(action_val, &[Value::Decimal(item)])?;
                            match val {
                                Value::Decimal(d) => result.push(d),
                                Value::Number(n) => result.push(n as f64),
                                _ => {
                                    // Falls back to mixed list if map produces non-numeric
                                    let mut mixed: Vec<Value> = result.iter().map(|d| Value::Decimal(*d)).collect();
                                    mixed.push(val);
                                    for &remaining in &items[mixed.len()..] {
                                        mixed.push(self.call_value(action_val, &[Value::Decimal(remaining)])?);
                                    }
                                    return self.maybe_writeback(obj_expr, Value::List(mixed));
                                }
                            }
                        }
                        return self.maybe_writeback(obj_expr, Value::F64List(result));
                    }
                    return Err("Obo: map needs an action 🤨".into());
                }
                "reduce" => {
                    if arg_vals.len() >= 2 {
                        let mut acc = arg_vals[0].clone();
                        let action_val = &arg_vals[1];
                        for &item in items {
                            acc = self.call_value(action_val, &[acc, Value::Decimal(item)])?;
                        }
                        return Ok(acc);
                    }
                    return Err("Obo: reduce needs an initial value and an action 🤨".into());
                }
                "any" => {
                    if let Some(action_val) = arg_vals.first() {
                        for &item in items {
                            if self.call_value(action_val, &[Value::Decimal(item)])?.is_truthy() {
                                return Ok(Value::Flag(true));
                            }
                        }
                        return Ok(Value::Flag(false));
                    }
                    return Err("Obo: any needs an action 🤨".into());
                }
                "all" => {
                    if let Some(action_val) = arg_vals.first() {
                        for &item in items {
                            if !self.call_value(action_val, &[Value::Decimal(item)])?.is_truthy() {
                                return Ok(Value::Flag(false));
                            }
                        }
                        return Ok(Value::Flag(true));
                    }
                    return Err("Obo: all needs an action 🤨".into());
                }
                "sortBy" => {
                    if let Some(action_val) = arg_vals.first() {
                        let mut sorted = items.to_vec();
                        let action_clone = action_val.clone();
                        let mut err: Option<String> = None;
                        sorted.sort_by(|a, b| {
                            if err.is_some() {
                                return std::cmp::Ordering::Equal;
                            }
                            match self.call_value(&action_clone, &[Value::Decimal(*a), Value::Decimal(*b)]) {
                                Ok(Value::Number(n)) => {
                                    if n < 0 { std::cmp::Ordering::Less }
                                    else if n > 0 { std::cmp::Ordering::Greater }
                                    else { std::cmp::Ordering::Equal }
                                }
                                Ok(Value::Decimal(d)) => {
                                    if d < 0.0 { std::cmp::Ordering::Less }
                                    else if d > 0.0 { std::cmp::Ordering::Greater }
                                    else { std::cmp::Ordering::Equal }
                                }
                                Ok(_) => std::cmp::Ordering::Equal,
                                Err(e) => { err = Some(e); std::cmp::Ordering::Equal }
                            }
                        });
                        if let Some(e) = err {
                            return Err(e);
                        }
                        return self.maybe_writeback(obj_expr, Value::F64List(sorted));
                    }
                    return Err("Obo: sortBy needs a comparator action 🤨".into());
                }
                _ => {}
            }
            if let Some(result) = stdlib::collections::f64list_method(items, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::Map(ref map) = object {
            if let Some(result) = stdlib::collections::map_method(map, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::Text(ref s) = object {
            if let Some(result) = stdlib::text::text_method(s, method, &arg_vals) {
                return result;
            }
        }

        if let Value::Set(ref items) = object {
            if let Some(result) = stdlib::collections::set_method(items, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::Queue(ref items) = object {
            if let Some(result) = stdlib::collections::queue_method(items, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::Stack(ref items) = object {
            if let Some(result) = stdlib::collections::stack_method(items, method, &arg_vals) {
                return self.maybe_writeback_result(obj_expr, method, result);
            }
        }

        if let Value::Bag(ref items) = object {
            if let Some(result) = stdlib::collections::bag_method(items, method, &arg_vals) {
                return result;
            }
        }

        if let Value::Buffer(ref buf) = object {
            if let Some(result) = stdlib::collections::buffer_method(buf, method, &arg_vals) {
                return result;
            }
        }

        if let Value::TextBuilder(ref buf) = object {
            match method {
                "append" => {
                    let mut data = buf.lock().unwrap();
                    for val in &arg_vals {
                        match val {
                            Value::Text(s) => data.extend_from_slice(s.as_bytes()),
                            Value::Char(c) => {
                                let mut cbuf = [0u8; 4];
                                let encoded = c.encode_utf8(&mut cbuf);
                                data.extend_from_slice(encoded.as_bytes());
                            }
                            Value::Number(n) => {
                                let s = n.to_string();
                                data.extend_from_slice(s.as_bytes());
                            }
                            other => {
                                let s = other.to_string();
                                data.extend_from_slice(s.as_bytes());
                            }
                        }
                    }
                    return Ok(object.clone());
                }
                "build" | "toString" => {
                    let data = buf.lock().unwrap();
                    let s = String::from_utf8_lossy(&data).into_owned();
                    return Ok(Value::Text(s));
                }
                "length" | "count" => {
                    let data = buf.lock().unwrap();
                    return Ok(Value::Number(data.len() as i64));
                }
                "clear" => {
                    let mut data = buf.lock().unwrap();
                    data.clear();
                    return Ok(object.clone());
                }
                _ => return Err(format!("Obo: TextBuilder.{}() — I don't know that one 🤨", method)),
            }
        }

        if let Value::Arena(ref a) = object {
            match method {
                "alloc" => {
                    // arena.alloc(size) → returns pointer offset as number
                    let size = match arg_vals.first() {
                        Some(Value::Number(n)) => *n as usize,
                        _ => return Err("Obo: Arena.alloc() requires an integer size 🤨".into()),
                    };
                    let mut arena = a.lock().unwrap();
                    let offset = arena.alloc(size);
                    return Ok(Value::Number(offset as i64));
                }
                "reset" => {
                    let mut arena = a.lock().unwrap();
                    arena.reset();
                    return Ok(object.clone());
                }
                "destroy" => {
                    let mut arena = a.lock().unwrap();
                    arena.reset();
                    return Ok(Value::Null);
                }
                "used" => {
                    let arena = a.lock().unwrap();
                    return Ok(Value::Number(arena.used as i64));
                }
                "capacity" => {
                    let arena = a.lock().unwrap();
                    return Ok(Value::Number(arena.cap as i64));
                }
                _ => return Err(format!("Obo: Arena.{}() — I don't know that one 🤨", method)),
            }
        }

        if let Value::Grid2D { rows, cols, ref data } = object {
            if let Some(result) = stdlib::collections::grid2d_method(rows, cols, data, method, &arg_vals) {
                return result;
            }
        }

        if let Value::Grid3D { x, y, z, ref data } = object {
            if let Some(result) = stdlib::collections::grid3d_method(x, y, z, data, method, &arg_vals) {
                return result;
            }
        }

        if let Value::Channel(ref ch) = object {
            match method {
                "send" => {
                    let val = arg_vals.into_iter().next().ok_or_else(|| {
                        "Obo: channel.send() needs a value 🤨".to_string()
                    })?;
                    let (lock, cvar) = &*ch.inner;
                    let mut queue = lock.lock().map_err(|e| format!("Obo: channel lock error: {} 😬", e))?;
                    queue.push_back(val);
                    cvar.notify_one();
                    return Ok(Value::Null);
                }
                "receive" => {
                    let (lock, cvar) = &*ch.inner;
                    let mut queue = lock.lock().map_err(|e| format!("Obo: channel lock error: {} 😬", e))?;
                    while queue.is_empty() {
                        queue = cvar.wait(queue).map_err(|e| format!("Obo: channel wait error: {} 😬", e))?;
                    }
                    return Ok(queue.pop_front().unwrap_or(Value::Null));
                }
                "try_receive" => {
                    let (lock, _) = &*ch.inner;
                    let mut queue = lock.lock().map_err(|e| format!("Obo: channel lock error: {} 😬", e))?;
                    return Ok(queue.pop_front().unwrap_or(Value::Null));
                }
                "size" => {
                    let (lock, _) = &*ch.inner;
                    let queue = lock.lock().map_err(|e| format!("Obo: channel lock error: {} 😬", e))?;
                    return Ok(Value::Number(queue.len() as i64));
                }
                _ => return Err(format!("Obo: channel.{}() — I don't know that one 🤨", method)),
            }
        }

        if let Value::Atomic(ref a) = object {
            use std::sync::atomic::Ordering;
            match method {
                "add" => {
                    let n = arg_vals.first().and_then(|v| v.to_number()).unwrap_or(0);
                    let prev = a.inner.fetch_add(n, Ordering::SeqCst);
                    return Ok(Value::Number(prev + n));
                }
                "sub" => {
                    let n = arg_vals.first().and_then(|v| v.to_number()).unwrap_or(0);
                    let prev = a.inner.fetch_sub(n, Ordering::SeqCst);
                    return Ok(Value::Number(prev - n));
                }
                "store" => {
                    let n = arg_vals.first().and_then(|v| v.to_number()).unwrap_or(0);
                    a.inner.store(n, Ordering::SeqCst);
                    return Ok(Value::Null);
                }
                "load" => {
                    return Ok(Value::Number(a.inner.load(Ordering::SeqCst)));
                }
                "increment" => {
                    let prev = a.inner.fetch_add(1, Ordering::SeqCst);
                    return Ok(Value::Number(prev + 1));
                }
                "decrement" => {
                    let prev = a.inner.fetch_sub(1, Ordering::SeqCst);
                    return Ok(Value::Number(prev - 1));
                }
                _ => return Err(format!("Obo: atomic.{}() — I don't know that one 🤨", method)),
            }
        }

        if let Expr::Identifier(type_name, _) = obj_expr {
            if stdlib::SYSTEM_ACTORS.contains(&type_name.as_str()) {
                if let Some(result) = stdlib::system_call(type_name, method, &arg_vals) {
                    return result;
                }
            }
        }

        if let Value::Instance(ref inst) = object {
            // Value type methods: dot, length
            if self.value_types.contains(&inst.type_name) {
                match method {
                    "dot" if arg_vals.len() == 1 => {
                        if let Value::Instance(ref other) = arg_vals[0] {
                            if other.type_name == inst.type_name {
                                let lfields = inst.snapshot_fields();
                                let rfields = other.snapshot_fields();
                                let mut sum = Value::Decimal(0.0);
                                for (key, lval) in &lfields {
                                    if let Some(rval) = rfields.get(key) {
                                        let product = self.eval_binary(lval, &BinOp::Mul, rval)?;
                                        sum = self.eval_binary(&sum, &BinOp::Add, &product)?;
                                    }
                                }
                                return Ok(sum);
                            }
                        }
                        return Err(format!("Obo: dot() requires matching value type"));
                    }
                    "length" if arg_vals.is_empty() => {
                        let fields = inst.snapshot_fields();
                        return Ok(Value::Number(fields.len() as i64));
                    }
                    _ => {} // fall through to actor method lookup
                }
            }
            if let Some(method_decl) = self.find_actor_method(&inst.type_name, method) {
                let func = OboFunction {
                    name: method_decl.name.clone(),
                    params: method_decl.params.clone(),
                    body: method_decl.body.clone(),
                    closure_env: None,
                };
                let fields = inst.snapshot_fields();
                self.env.push_scope();
                // Define `self` so methods can use self.field
                self.env.define("self", Value::Instance(inst.clone()));
                for (key, value) in &fields {
                    self.env.define(key, value.clone());
                }
                if let Some(TypeDef::Actor(actor)) = self.type_registry.get(&inst.type_name).cloned()
                {
                    for member in &actor.members {
                        if let ActorMember::Event(event) = member {
                            self.env.define(
                                &event.name,
                                Value::EventRef(super::super::value::OboEventRef {
                                    instance_id: inst.instance_id,
                                    owner_type: inst.type_name.clone(),
                                    event_name: event.name.clone(),
                                }),
                            );
                        }
                    }
                }
                let result = self.call_function(&func, &arg_vals)?;

                // Write back fields modified via direct scope variables
                for key in fields.keys() {
                    if let Some(new_val) = self.env.get(key) {
                        inst.set_field(key.clone(), new_val.clone());
                    }
                }
                // Also write back fields modified via self.field = ...
                if let Some(Value::Instance(self_inst)) = self.env.get("self").cloned() {
                    for (key, val) in self_inst.snapshot_fields() {
                        inst.set_field(key, val);
                    }
                }
                self.env.pop_scope();
                return Ok(result);
            }
        }

        if let Expr::Identifier(type_name, _) = obj_expr {
            let qualified = format!("{}.{}", type_name, method);
            if let Some(func_val) = self.env.get(&qualified).cloned() {
                return self.call_value(&func_val, &arg_vals);
            }
        }

        let type_name = object.type_name();
        if let Some(ext_fn) = self
            .extensions
            .get(&(type_name.to_string(), method.to_string()))
            .cloned()
        {
            let mut all_args = vec![object.clone()];
            all_args.extend(arg_vals);
            let func = OboFunction {
                name: ext_fn.name.clone(),
                params: ext_fn.params.clone(),
                body: ext_fn.body.clone(),
                closure_env: None,
            };
            return self.call_function(&func, &all_args);
        }

        Err(format!(
            "Obo: {} doesn't have a method called '{}' 🤨",
            type_name, method
        ))
    }

    fn find_actor_method(&self, type_name: &str, method: &str) -> Option<FunctionDecl> {
        let mut current = Some(type_name.to_string());
        let mut visited = HashSet::new();
        while let Some(name) = current {
            if !visited.insert(name.clone()) {
                break;
            }
            if let Some(TypeDef::Actor(actor)) = self.type_registry.get(&name) {
                for m in &actor.members {
                    if let ActorMember::Method(f) = m {
                        if f.name == method && !f.is_static {
                            return Some(f.clone());
                        }
                    }
                }
                current = actor.parent.clone();
            } else {
                break;
            }
        }
        None
    }

    fn call_builtin(&mut self, name: &str, args: &[Value]) -> Result<Value, String> {
        if name.contains('.') {
            let parts: Vec<&str> = name.splitn(2, '.').collect();
            let actor = parts[0];
            let method = parts[1];

            if stdlib::SYSTEM_ACTORS.contains(&actor) {
                if let Some(result) = stdlib::system_call(actor, method, args) {
                    return result;
                }
                return Err(format!("Obo: {}.{} — I don't know that one 🤨", actor, method));
            }

            return Ok(Value::ChoiceValue(
                actor.to_string(),
                method.to_string(),
                args.to_vec(),
            ));
        }

        Err(format!("Obo: Unknown builtin '{}' 🤨", name))
    }

    fn reorder_named_args(&mut self, args: &[CallArg], params: &[Param]) -> Result<Vec<Value>, String> {
        let mut result: Vec<Option<Value>> = vec![None; params.len()];
        let mut positional_idx = 0;

        for arg in args {
            if let Some(ref name) = arg.name {
                // Named arg: find matching param index
                let idx = params.iter().position(|p| &p.name == name)
                    .ok_or_else(|| format!("Obo: No parameter named '{}' 🤨", name))?;
                if result[idx].is_some() {
                    return Err(format!("Obo: Parameter '{}' provided more than once 🤨", name));
                }
                result[idx] = Some(self.eval_expr(&arg.value)?);
            } else {
                // Positional arg: fill next unfilled slot
                while positional_idx < result.len() && result[positional_idx].is_some() {
                    positional_idx += 1;
                }
                if positional_idx >= params.len() {
                    return Err("Obo: Too many arguments 🤨".into());
                }
                result[positional_idx] = Some(self.eval_expr(&arg.value)?);
                positional_idx += 1;
            }
        }

        // Fill remaining with Null (call_function handles defaults)
        Ok(result.into_iter().map(|v| v.unwrap_or(Value::Null)).collect())
    }

    fn reflect_value(&self, value: &Value) -> Value {
        match value {
            Value::Instance(inst) => {
                let mut entries = Vec::new();
                let fields = inst.snapshot_fields();
                for (name, val) in &fields {
                    let field_map = vec![
                        (Value::Text("name".to_string()), Value::Text(name.clone())),
                        (Value::Text("value".to_string()), val.clone()),
                        (Value::Text("type".to_string()), Value::Text(val.type_name().to_string())),
                    ];
                    entries.push(Value::Map(OboMap::from_entries(field_map)));
                }
                // Also include __type
                let type_map = vec![
                    (Value::Text("name".to_string()), Value::Text("__type".to_string())),
                    (Value::Text("value".to_string()), Value::Text(inst.type_name.clone())),
                    (Value::Text("type".to_string()), Value::Text("text".to_string())),
                ];
                entries.insert(0, Value::Map(OboMap::from_entries(type_map)));
                Value::List(entries)
            }
            _ => {
                // For non-instances, return basic type info
                let info = vec![
                    (Value::Text("type".to_string()), Value::Text(value.type_name().to_string())),
                    (Value::Text("value".to_string()), value.clone()),
                ];
                Value::List(vec![Value::Map(OboMap::from_entries(info))])
            }
        }
    }

    /// For mutating collection methods called on a variable, write the result
    /// back to the source variable so `items.add(4)` mutates in-place.
    fn maybe_writeback(&mut self, obj_expr: &Expr, value: Value) -> Result<Value, String> {
        if let Expr::Identifier(name, _) = obj_expr {
            self.env.set(name, value.clone());
        }
        Ok(value)
    }

    /// Like maybe_writeback but only for methods that produce a new collection
    /// (add, insert, remove, removeAt, set, push, enqueue, pop, dequeue).
    fn maybe_writeback_result(
        &mut self,
        obj_expr: &Expr,
        method: &str,
        result: Result<Value, String>,
    ) -> Result<Value, String> {
        let value = result?;
        let is_mutating = matches!(
            method,
            "add" | "insert" | "remove" | "removeAt"
            | "set" | "push" | "enqueue" | "pop" | "dequeue"
            | "sort" | "reverse"
        );
        if is_mutating {
            if let Expr::Identifier(name, _) = obj_expr {
                self.env.set(name, value.clone());
            }
        }
        Ok(value)
    }
}