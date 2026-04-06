use crate::interpreter::value::Value;

/// List member access (properties like .count, .first, .last, .empty, .reversed, .sorted)
pub fn list_member(items: &[Value], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(items.len() as i64)),
        "first" => Some(items.first().cloned().unwrap_or(Value::Null)),
        "last" => Some(items.last().cloned().unwrap_or(Value::Null)),
        "empty" => Some(Value::Flag(items.is_empty())),
        "reversed" => {
            let mut rev = items.to_vec();
            rev.reverse();
            Some(Value::List(rev))
        }
        "sorted" => {
            let mut sorted = items.to_vec();
            sorted.sort_by(value_cmp);
            Some(Value::List(sorted))
        }
        "distinct" => {
            let mut unique = Vec::new();
            for item in items {
                if !unique.contains(item) {
                    unique.push(item.clone());
                }
            }
            Some(Value::List(unique))
        }
        _ => None,
    }
}

/// List method calls (like .filter, .map, .reduce, .add, .remove, etc.)
/// Returns None if the method name isn't recognized.
pub fn list_method(items: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "add" => {
            let mut new_items = items.to_vec();
            new_items.extend(args.to_vec());
            Some(Ok(Value::List(new_items)))
        }
        "insert" => {
            if args.len() >= 2 {
                if let Value::Number(idx) = &args[0] {
                    let mut new_items = items.to_vec();
                    let i = (*idx).max(0) as usize;
                    if i <= new_items.len() {
                        new_items.insert(i, args[1].clone());
                    }
                    return Some(Ok(Value::List(new_items)));
                }
            }
            Some(Err("Obo: insert needs an index and a value 🤌".into()))
        }
        "remove" => {
            if let Some(target) = args.first() {
                let mut new_items = items.to_vec();
                if let Some(pos) = new_items.iter().position(|x| x == target) {
                    new_items.remove(pos);
                }
                return Some(Ok(Value::List(new_items)));
            }
            Some(Err("Obo: remove needs a value to remove 🤌".into()))
        }
        "removeAt" => {
            if let Some(Value::Number(idx)) = args.first() {
                let mut new_items = items.to_vec();
                let i = *idx as usize;
                if i < new_items.len() {
                    new_items.remove(i);
                }
                return Some(Ok(Value::List(new_items)));
            }
            Some(Err("Obo: removeAt needs an index 🤌".into()))
        }
        "indexOf" => {
            if let Some(target) = args.first() {
                let pos = items.iter().position(|x| x == target);
                return Some(Ok(match pos {
                    Some(i) => Value::Number(i as i64),
                    None => Value::Number(-1),
                }));
            }
            Some(Err("Obo: indexOf needs a value to find 🤌".into()))
        }
        "contains" => {
            if let Some(target) = args.first() {
                return Some(Ok(Value::Flag(items.contains(target))));
            }
            Some(Err("Obo: contains needs a value to look for 🤌".into()))
        }
        "join" => {
            let sep = match args.first() {
                Some(Value::Text(s)) => s.as_str(),
                _ => ", ",
            };
            let parts: Vec<String> = items.iter().map(|v| v.to_string()).collect();
            Some(Ok(Value::Text(parts.join(sep))))
        }
        "reverse" => {
            let mut rev = items.to_vec();
            rev.reverse();
            Some(Ok(Value::List(rev)))
        }
        "sort" => {
            let mut sorted = items.to_vec();
            sorted.sort_by(value_cmp);
            Some(Ok(Value::List(sorted)))
        }
        "take" => {
            if let Some(Value::Number(n)) = args.first() {
                let n = (*n).max(0) as usize;
                return Some(Ok(Value::List(items.iter().take(n).cloned().collect())));
            }
            Some(Err("Obo: take needs a number 🤌".into()))
        }
        "skip" => {
            if let Some(Value::Number(n)) = args.first() {
                let n = (*n).max(0) as usize;
                return Some(Ok(Value::List(items.iter().skip(n).cloned().collect())));
            }
            Some(Err("Obo: skip needs a number 🤌".into()))
        }
        "flat" => {
            let mut result = Vec::new();
            for item in items {
                if let Value::List(inner) = item {
                    result.extend(inner.iter().cloned());
                } else {
                    result.push(item.clone());
                }
            }
            Some(Ok(Value::List(result)))
        }
        "slice" => {
            if args.len() >= 2 {
                if let (Value::Number(start), Value::Number(end)) = (&args[0], &args[1]) {
                    let s = (*start).max(0) as usize;
                    let e = (*end).max(0) as usize;
                    let e = e.min(items.len());
                    if s <= e {
                        return Some(Ok(Value::List(items[s..e].to_vec())));
                    }
                    return Some(Ok(Value::List(Vec::new())));
                }
            }
            Some(Err("Obo: slice needs a start and end index 🤌".into()))
        }
        _ => None,
    }
}

/// Map member access
pub fn map_member(pairs: &[(Value, Value)], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(pairs.len() as i64)),
        "empty" => Some(Value::Flag(pairs.is_empty())),
        "keys" => {
            let keys: Vec<Value> = pairs.iter().map(|(k, _)| k.clone()).collect();
            Some(Value::List(keys))
        }
        "values" => {
            let vals: Vec<Value> = pairs.iter().map(|(_, v)| v.clone()).collect();
            Some(Value::List(vals))
        }
        _ => None,
    }
}

/// Map method calls
pub fn map_method(pairs: &[(Value, Value)], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "get" => {
            if let Some(key) = args.first() {
                for (k, v) in pairs {
                    if k == key {
                        return Some(Ok(v.clone()));
                    }
                }
                let fallback = args.get(1).cloned().unwrap_or(Value::Null);
                return Some(Ok(fallback));
            }
            Some(Err("Obo: get needs a key 🤌".into()))
        }
        "has" => {
            if let Some(key) = args.first() {
                return Some(Ok(Value::Flag(pairs.iter().any(|(k, _)| k == key))));
            }
            Some(Err("Obo: has needs a key 🤌".into()))
        }
        "set" => {
            if args.len() >= 2 {
                let mut new_pairs = pairs.to_vec();
                let key = &args[0];
                let val = &args[1];
                if let Some(pos) = new_pairs.iter().position(|(k, _)| k == key) {
                    new_pairs[pos].1 = val.clone();
                } else {
                    new_pairs.push((key.clone(), val.clone()));
                }
                return Some(Ok(Value::Map(new_pairs)));
            }
            Some(Err("Obo: set needs a key and a value 🤌".into()))
        }
        "remove" => {
            if let Some(key) = args.first() {
                let new_pairs: Vec<(Value, Value)> = pairs.iter()
                    .filter(|(k, _)| k != key)
                    .cloned()
                    .collect();
                return Some(Ok(Value::Map(new_pairs)));
            }
            Some(Err("Obo: remove needs a key 🤌".into()))
        }
        _ => None,
    }
}

fn value_cmp(a: &Value, b: &Value) -> std::cmp::Ordering {
    match (a, b) {
        (Value::Number(a), Value::Number(b)) => a.cmp(b),
        (Value::Decimal(a), Value::Decimal(b)) => a.partial_cmp(b).unwrap_or(std::cmp::Ordering::Equal),
        (Value::Text(a), Value::Text(b)) => a.cmp(b),
        _ => std::cmp::Ordering::Equal,
    }
}

/// Set member access
pub fn set_member(items: &[Value], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(items.len() as i64)),
        "empty" => Some(Value::Flag(items.is_empty())),
        "toList" => Some(Value::List(items.to_vec())),
        _ => None,
    }
}

/// Set method calls
pub fn set_method(items: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "add" => {
            let mut new_items = items.to_vec();
            for arg in args {
                if !new_items.contains(arg) {
                    new_items.push(arg.clone());
                }
            }
            Some(Ok(Value::Set(new_items)))
        }
        "remove" => {
            if let Some(target) = args.first() {
                let new_items: Vec<Value> = items.iter().filter(|x| *x != target).cloned().collect();
                Some(Ok(Value::Set(new_items)))
            } else {
                Some(Err("Obo: remove needs a value to remove 🤌".into()))
            }
        }
        "has" | "contains" => {
            if let Some(target) = args.first() {
                Some(Ok(Value::Flag(items.contains(target))))
            } else {
                Some(Err("Obo: has needs a value to check 🤌".into()))
            }
        }
        "union" => {
            if let Some(Value::Set(other)) = args.first() {
                let mut result = items.to_vec();
                for v in other {
                    if !result.contains(v) {
                        result.push(v.clone());
                    }
                }
                Some(Ok(Value::Set(result)))
            } else {
                Some(Err("Obo: union needs a set 🤌".into()))
            }
        }
        "intersect" => {
            if let Some(Value::Set(other)) = args.first() {
                let result: Vec<Value> = items.iter().filter(|v| other.contains(v)).cloned().collect();
                Some(Ok(Value::Set(result)))
            } else {
                Some(Err("Obo: intersect needs a set 🤌".into()))
            }
        }
        "difference" => {
            if let Some(Value::Set(other)) = args.first() {
                let result: Vec<Value> = items.iter().filter(|v| !other.contains(v)).cloned().collect();
                Some(Ok(Value::Set(result)))
            } else {
                Some(Err("Obo: difference needs a set 🤌".into()))
            }
        }
        _ => None,
    }
}

/// Queue member access
pub fn queue_member(items: &[Value], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(items.len() as i64)),
        "empty" => Some(Value::Flag(items.is_empty())),
        "peek" | "front" => Some(items.first().cloned().unwrap_or(Value::Null)),
        "toList" => Some(Value::List(items.to_vec())),
        _ => None,
    }
}

/// Queue method calls (FIFO)
pub fn queue_method(items: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "push" | "enqueue" => {
            let mut new_items = items.to_vec();
            new_items.extend(args.to_vec());
            Some(Ok(Value::Queue(new_items)))
        }
        "pop" | "dequeue" => {
            if items.is_empty() {
                Some(Ok(Value::Null))
            } else {
                let mut new_items = items.to_vec();
                new_items.remove(0);
                Some(Ok(Value::Queue(new_items)))
            }
        }
        "has" | "contains" => {
            if let Some(target) = args.first() {
                Some(Ok(Value::Flag(items.contains(target))))
            } else {
                Some(Err("Obo: has needs a value to check 🤌".into()))
            }
        }
        _ => None,
    }
}

/// Stack member access
pub fn stack_member(items: &[Value], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(items.len() as i64)),
        "empty" => Some(Value::Flag(items.is_empty())),
        "peek" | "top" => Some(items.last().cloned().unwrap_or(Value::Null)),
        "toList" => Some(Value::List(items.to_vec())),
        _ => None,
    }
}

/// Stack method calls (LIFO)
pub fn stack_method(items: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "push" => {
            let mut new_items = items.to_vec();
            new_items.extend(args.to_vec());
            Some(Ok(Value::Stack(new_items)))
        }
        "pop" => {
            if items.is_empty() {
                Some(Ok(Value::Null))
            } else {
                let mut new_items = items.to_vec();
                new_items.pop();
                Some(Ok(Value::Stack(new_items)))
            }
        }
        "has" | "contains" => {
            if let Some(target) = args.first() {
                Some(Ok(Value::Flag(items.contains(target))))
            } else {
                Some(Err("Obo: has needs a value to check 🤌".into()))
            }
        }
        _ => None,
    }
}

// ── Pair ──────────────────────────────────────────────

pub fn pair_member(first: &Value, second: &Value, member: &str) -> Option<Value> {
    match member {
        "first" => Some(first.clone()),
        "second" => Some(second.clone()),
        "toList" => Some(Value::List(vec![first.clone(), second.clone()])),
        _ => None,
    }
}

// ── Bag ───────────────────────────────────────────────

pub fn bag_member(items: &[Value], member: &str) -> Option<Value> {
    match member {
        "count" | "length" => Some(Value::Number(items.len() as i64)),
        "empty" => Some(Value::Flag(items.is_empty())),
        "toList" => Some(Value::List(items.to_vec())),
        _ => None,
    }
}

pub fn bag_method(items: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "add" => {
            let mut new_items = items.to_vec();
            new_items.extend(args.to_vec());
            Some(Ok(Value::Bag(new_items)))
        }
        "has" | "contains" => {
            if let Some(target) = args.first() {
                Some(Ok(Value::Flag(items.contains(target))))
            } else {
                Some(Err("Obo: has needs a value to check 🤌".into()))
            }
        }
        "remove" => {
            if let Some(target) = args.first() {
                let mut new_items = items.to_vec();
                if let Some(pos) = new_items.iter().position(|x| x == target) {
                    new_items.remove(pos);
                }
                Some(Ok(Value::Bag(new_items)))
            } else {
                Some(Err("Obo: remove needs a value 🤌".into()))
            }
        }
        _ => None,
    }
}

// ── Buffer ────────────────────────────────────────────

pub fn buffer_member(buf: &[u8], member: &str) -> Option<Value> {
    match member {
        "length" | "count" => Some(Value::Number(buf.len() as i64)),
        "empty" => Some(Value::Flag(buf.is_empty())),
        _ => None,
    }
}

pub fn buffer_method(buf: &[u8], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "get" => {
            let i = match args.first() {
                Some(Value::Number(n)) => *n as usize,
                _ => return Some(Err("Obo: buffer.get needs an index 🤌".into())),
            };
            if i < buf.len() {
                Some(Ok(Value::Number(buf[i] as i64)))
            } else {
                Some(Ok(Value::Null))
            }
        }
        "set" => {
            if args.len() >= 2 {
                let idx = match &args[0] {
                    Value::Number(n) => *n as usize,
                    _ => return Some(Err("Obo: buffer.set index must be a number 🤌".into())),
                };
                let val = match &args[1] {
                    Value::Number(n) => *n as u8,
                    _ => return Some(Err("Obo: buffer.set value must be a number 🤌".into())),
                };
                let mut new_buf = buf.to_vec();
                if idx < new_buf.len() {
                    new_buf[idx] = val;
                }
                Some(Ok(Value::Buffer(new_buf)))
            } else {
                Some(Err("Obo: buffer.set needs index and value 🤌".into()))
            }
        }
        "toList" => {
            Some(Ok(Value::List(buf.iter().map(|b| Value::Number(*b as i64)).collect())))
        }
        _ => None,
    }
}

// ── Grid2D ────────────────────────────────────────────

pub fn grid2d_member(rows: usize, cols: usize, data: &[Value], member: &str) -> Option<Value> {
    match member {
        "rows" => Some(Value::Number(rows as i64)),
        "cols" => Some(Value::Number(cols as i64)),
        "count" | "length" => Some(Value::Number(data.len() as i64)),
        "toList" => Some(Value::List(data.to_vec())),
        _ => None,
    }
}

pub fn grid2d_method(rows: usize, cols: usize, data: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "get" => {
            if args.len() < 2 {
                return Some(Err("Obo: grid2d.get needs row and col 🤌".into()));
            }
            let r = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid2d.get row must be a number 🤌".into())) };
            let c = match &args[1] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid2d.get col must be a number 🤌".into())) };
            if r < rows && c < cols {
                Some(Ok(data[r * cols + c].clone()))
            } else {
                Some(Ok(Value::Null))
            }
        }
        "set" => {
            if args.len() < 3 {
                return Some(Err("Obo: grid2d.set needs row, col, value 🤌".into()));
            }
            let r = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid2d.set row must be a number 🤌".into())) };
            let c = match &args[1] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid2d.set col must be a number 🤌".into())) };
            let val = args[2].clone();
            let mut new_data = data.to_vec();
            if r < rows && c < cols {
                new_data[r * cols + c] = val;
            }
            Some(Ok(Value::Grid2D { rows, cols, data: new_data }))
        }
        "fill" => {
            if args.is_empty() {
                return Some(Err("Obo: grid2d.fill needs a value 🤌".into()));
            }
            let val = args[0].clone();
            let new_data = vec![val; rows * cols];
            Some(Ok(Value::Grid2D { rows, cols, data: new_data }))
        }
        "row" => {
            if args.is_empty() {
                return Some(Err("Obo: grid2d.row needs an index 🤌".into()));
            }
            let r = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: row index must be a number 🤌".into())) };
            if r < rows {
                let start = r * cols;
                let end = start + cols;
                Some(Ok(Value::List(data[start..end].to_vec())))
            } else {
                Some(Ok(Value::List(vec![])))
            }
        }
        "col" => {
            if args.is_empty() {
                return Some(Err("Obo: grid2d.col needs an index 🤌".into()));
            }
            let c = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: col index must be a number 🤌".into())) };
            if c < cols {
                let col_data: Vec<Value> = (0..rows).map(|r| data[r * cols + c].clone()).collect();
                Some(Ok(Value::List(col_data)))
            } else {
                Some(Ok(Value::List(vec![])))
            }
        }
        _ => None,
    }
}

// ── Grid3D ────────────────────────────────────────────

pub fn grid3d_member(x: usize, y: usize, z: usize, data: &[Value], member: &str) -> Option<Value> {
    match member {
        "x" | "width" => Some(Value::Number(x as i64)),
        "y" | "height" => Some(Value::Number(y as i64)),
        "z" | "depth" => Some(Value::Number(z as i64)),
        "count" | "length" => Some(Value::Number(data.len() as i64)),
        "toList" => Some(Value::List(data.to_vec())),
        _ => None,
    }
}

pub fn grid3d_method(x: usize, y: usize, z: usize, data: &[Value], method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "get" => {
            if args.len() < 3 {
                return Some(Err("Obo: grid3d.get needs x, y, z 🤌".into()));
            }
            let gx = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.get x must be a number 🤌".into())) };
            let gy = match &args[1] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.get y must be a number 🤌".into())) };
            let gz = match &args[2] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.get z must be a number 🤌".into())) };
            if gx < x && gy < y && gz < z {
                let idx = gx * y * z + gy * z + gz;
                Some(Ok(data[idx].clone()))
            } else {
                Some(Ok(Value::Null))
            }
        }
        "set" => {
            if args.len() < 4 {
                return Some(Err("Obo: grid3d.set needs x, y, z, value 🤌".into()));
            }
            let gx = match &args[0] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.set x must be a number 🤌".into())) };
            let gy = match &args[1] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.set y must be a number 🤌".into())) };
            let gz = match &args[2] { Value::Number(n) => *n as usize, _ => return Some(Err("Obo: grid3d.set z must be a number 🤌".into())) };
            let val = args[3].clone();
            let mut new_data = data.to_vec();
            if gx < x && gy < y && gz < z {
                let idx = gx * y * z + gy * z + gz;
                new_data[idx] = val;
            }
            Some(Ok(Value::Grid3D { x, y, z, data: new_data }))
        }
        "fill" => {
            if args.is_empty() {
                return Some(Err("Obo: grid3d.fill needs a value 🤌".into()));
            }
            let val = args[0].clone();
            let new_data = vec![val; x * y * z];
            Some(Ok(Value::Grid3D { x, y, z, data: new_data }))
        }
        _ => None,
    }
}
