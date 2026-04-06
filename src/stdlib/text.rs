use crate::interpreter::value::Value;

/// Text member access (properties)
pub fn text_member(s: &str, member: &str) -> Option<Value> {
    match member {
        "length" | "count" => Some(Value::Number(s.len() as i64)),
        "upper" => Some(Value::Text(s.to_uppercase())),
        "lower" => Some(Value::Text(s.to_lowercase())),
        "trim" => Some(Value::Text(s.trim().to_string())),
        "trimStart" => Some(Value::Text(s.trim_start().to_string())),
        "trimEnd" => Some(Value::Text(s.trim_end().to_string())),
        "reversed" => Some(Value::Text(s.chars().rev().collect())),
        "empty" => Some(Value::Flag(s.is_empty())),
        "chars" => {
            let chars: Vec<Value> = s.chars().map(|c| Value::Char(c)).collect();
            Some(Value::List(chars))
        }
        "words" => {
            let words: Vec<Value> = s.split_whitespace().map(|w| Value::Text(w.to_string())).collect();
            Some(Value::List(words))
        }
        "lines" => {
            let lines: Vec<Value> = s.lines().map(|l| Value::Text(l.to_string())).collect();
            Some(Value::List(lines))
        }
        _ => None,
    }
}

/// Text method calls
pub fn text_method(s: &str, method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "contains" => {
            if let Some(Value::Text(target)) = args.first() {
                return Some(Ok(Value::Flag(s.contains(target.as_str()))));
            }
            Some(Err("Obo: contains needs text to search for 🤌".into()))
        }
        "startsWith" => {
            if let Some(Value::Text(prefix)) = args.first() {
                return Some(Ok(Value::Flag(s.starts_with(prefix.as_str()))));
            }
            Some(Err("Obo: startsWith needs a text prefix 🤌".into()))
        }
        "endsWith" => {
            if let Some(Value::Text(suffix)) = args.first() {
                return Some(Ok(Value::Flag(s.ends_with(suffix.as_str()))));
            }
            Some(Err("Obo: endsWith needs a text suffix 🤌".into()))
        }
        "split" => {
            if let Some(Value::Text(sep)) = args.first() {
                let parts: Vec<Value> = s.split(sep.as_str())
                    .map(|p| Value::Text(p.to_string()))
                    .collect();
                return Some(Ok(Value::List(parts)));
            }
            Some(Err("Obo: split needs a separator 🤌".into()))
        }
        "replace" => {
            if args.len() >= 2 {
                if let (Value::Text(from), Value::Text(to)) = (&args[0], &args[1]) {
                    return Some(Ok(Value::Text(s.replace(from.as_str(), to.as_str()))));
                }
            }
            Some(Err("Obo: replace needs 'from' and 'to' text 🤌".into()))
        }
        "substring" => {
            if args.len() >= 2 {
                if let (Value::Number(start), Value::Number(end)) = (&args[0], &args[1]) {
                    let start = (*start).max(0) as usize;
                    let end = (*end).max(0) as usize;
                    let chars: Vec<char> = s.chars().collect();
                    let end = end.min(chars.len());
                    if start <= end {
                        let sub: String = chars[start..end].iter().collect();
                        return Some(Ok(Value::Text(sub)));
                    }
                    return Some(Ok(Value::Text(String::new())));
                }
            }
            Some(Err("Obo: substring needs start and end positions 🤌".into()))
        }
        "indexOf" => {
            if let Some(Value::Text(target)) = args.first() {
                return Some(Ok(match s.find(target.as_str()) {
                    Some(i) => Value::Number(i as i64),
                    None => Value::Number(-1),
                }));
            }
            Some(Err("Obo: indexOf needs text to find 🤌".into()))
        }
        "repeat" => {
            if let Some(Value::Number(n)) = args.first() {
                let n = (*n).max(0) as usize;
                return Some(Ok(Value::Text(s.repeat(n))));
            }
            Some(Err("Obo: repeat needs a count 🤌".into()))
        }
        "padLeft" => {
            if let Some(Value::Number(width)) = args.first() {
                let width = (*width).max(0) as usize;
                let pad_char = match args.get(1) {
                    Some(Value::Text(c)) => c.chars().next().unwrap_or(' '),
                    Some(Value::Char(c)) => *c,
                    _ => ' ',
                };
                if s.len() >= width {
                    return Some(Ok(Value::Text(s.to_string())));
                }
                let padding: String = std::iter::repeat(pad_char).take(width - s.len()).collect();
                return Some(Ok(Value::Text(format!("{}{}", padding, s))));
            }
            Some(Err("Obo: padLeft needs a width 🤌".into()))
        }
        "padRight" => {
            if let Some(Value::Number(width)) = args.first() {
                let width = (*width).max(0) as usize;
                let pad_char = match args.get(1) {
                    Some(Value::Text(c)) => c.chars().next().unwrap_or(' '),
                    Some(Value::Char(c)) => *c,
                    _ => ' ',
                };
                if s.len() >= width {
                    return Some(Ok(Value::Text(s.to_string())));
                }
                let padding: String = std::iter::repeat(pad_char).take(width - s.len()).collect();
                return Some(Ok(Value::Text(format!("{}{}", s, padding))));
            }
            Some(Err("Obo: padRight needs a width 🤌".into()))
        }
        "toNumber" => {
            Some(Ok(match s.parse::<i64>() {
                Ok(n) => Value::Number(n),
                Err(_) => Value::Null,
            }))
        }
        "toDecimal" => {
            Some(Ok(match s.parse::<f64>() {
                Ok(n) => Value::Decimal(n),
                Err(_) => Value::Null,
            }))
        }
        _ => None,
    }
}
