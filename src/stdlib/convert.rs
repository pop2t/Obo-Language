use crate::interpreter::value::Value;

/// Handle Convert.method(args) calls
pub fn convert_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "toNumber" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(*n),
                Some(Value::Decimal(n)) => Value::Number(*n as i64),
                Some(Value::Text(s)) => match s.parse::<i64>() {
                    Ok(n) => Value::Number(n),
                    Err(_) => Value::Null,
                },
                Some(Value::Flag(b)) => Value::Number(if *b { 1 } else { 0 }),
                Some(Value::Char(c)) => Value::Number(*c as i64),
                _ => Value::Null,
            }))
        }
        "toDecimal" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Decimal(*n as f64),
                Some(Value::Decimal(n)) => Value::Decimal(*n),
                Some(Value::Text(s)) => match s.parse::<f64>() {
                    Ok(n) => Value::Decimal(n),
                    Err(_) => Value::Null,
                },
                _ => Value::Null,
            }))
        }
        "toText" => {
            Some(Ok(match args.first() {
                Some(val) => Value::Text(val.to_string()),
                None => Value::Text(String::new()),
            }))
        }
        "toFlag" => {
            Some(Ok(match args.first() {
                Some(val) => Value::Flag(val.is_truthy()),
                None => Value::Flag(false),
            }))
        }
        "toChar" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => {
                    match char::from_u32(*n as u32) {
                        Some(c) => Value::Char(c),
                        None => Value::Null,
                    }
                }
                Some(Value::Text(s)) => {
                    match s.chars().next() {
                        Some(c) => Value::Char(c),
                        None => Value::Null,
                    }
                }
                _ => Value::Null,
            }))
        }
        _ => None,
    }
}
