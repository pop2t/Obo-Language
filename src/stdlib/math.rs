use crate::interpreter::value::Value;

/// Handle Math.member access (constants like Math.pi)
pub fn math_member(member: &str) -> Option<Value> {
    match member {
        "pi" => Some(Value::Decimal(std::f64::consts::PI)),
        "e" => Some(Value::Decimal(std::f64::consts::E)),
        "infinity" => Some(Value::Decimal(f64::INFINITY)),
        "maxNumber" => Some(Value::Number(i64::MAX)),
        "minNumber" => Some(Value::Number(i64::MIN)),
        _ => None,
    }
}

/// Handle Math.method(args) calls
pub fn math_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "abs" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(n.abs()),
                Some(Value::Decimal(n)) => Value::Decimal(n.abs()),
                _ => return Some(Err("Obo: Math.abs needs a number 🤌".into())),
            }))
        }
        "floor" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(*n),
                Some(Value::Decimal(n)) => Value::Number(n.floor() as i64),
                _ => return Some(Err("Obo: Math.floor needs a number 🤌".into())),
            }))
        }
        "ceil" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(*n),
                Some(Value::Decimal(n)) => Value::Number(n.ceil() as i64),
                _ => return Some(Err("Obo: Math.ceil needs a number 🤌".into())),
            }))
        }
        "round" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(*n),
                Some(Value::Decimal(n)) => Value::Number(n.round() as i64),
                _ => return Some(Err("Obo: Math.round needs a number 🤌".into())),
            }))
        }
        "sqrt" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.sqrt())))
        }
        "pow" => {
            let base = to_f64(args.first())?;
            let exp = to_f64(args.get(1))?;
            Some(Ok(Value::Decimal(base.powf(exp))))
        }
        "sin" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.sin())))
        }
        "cos" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.cos())))
        }
        "tan" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.tan())))
        }
        "asin" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.asin())))
        }
        "acos" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.acos())))
        }
        "atan" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.atan())))
        }
        "atan2" => {
            let y = to_f64(args.first())?;
            let x = to_f64(args.get(1))?;
            Some(Ok(Value::Decimal(y.atan2(x))))
        }
        "log" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.ln())))
        }
        "log10" => {
            let n = to_f64(args.first())?;
            Some(Ok(Value::Decimal(n.log10())))
        }
        "min" => {
            if args.len() >= 2 {
                return Some(Ok(match (&args[0], &args[1]) {
                    (Value::Number(a), Value::Number(b)) => Value::Number(*a.min(b)),
                    _ => {
                        let a = to_f64(args.first())?;
                        let b = to_f64(args.get(1))?;
                        Value::Decimal(a.min(b))
                    }
                }));
            }
            Some(Err("Obo: Math.min needs two values 🤌".into()))
        }
        "max" => {
            if args.len() >= 2 {
                return Some(Ok(match (&args[0], &args[1]) {
                    (Value::Number(a), Value::Number(b)) => Value::Number(*a.max(b)),
                    _ => {
                        let a = to_f64(args.first())?;
                        let b = to_f64(args.get(1))?;
                        Value::Decimal(a.max(b))
                    }
                }));
            }
            Some(Err("Obo: Math.max needs two values 🤌".into()))
        }
        "clamp" => {
            if args.len() >= 3 {
                let val = to_f64(args.first())?;
                let lo = to_f64(args.get(1))?;
                let hi = to_f64(args.get(2))?;
                return Some(Ok(Value::Decimal(val.max(lo).min(hi))));
            }
            Some(Err("Obo: Math.clamp needs a value, min, and max 🤌".into()))
        }
        "sign" => {
            Some(Ok(match args.first() {
                Some(Value::Number(n)) => Value::Number(n.signum()),
                Some(Value::Decimal(n)) => {
                    if *n > 0.0 { Value::Number(1) }
                    else if *n < 0.0 { Value::Number(-1) }
                    else { Value::Number(0) }
                }
                _ => return Some(Err("Obo: Math.sign needs a number 🤌".into())),
            }))
        }
        "random" => {
            let r = simple_random();
            Some(Ok(Value::Decimal(r)))
        }
        "randomInt" => {
            if args.len() >= 2 {
                if let (Value::Number(lo), Value::Number(hi)) = (&args[0], &args[1]) {
                    let range = (hi - lo).max(1);
                    let r = (simple_random() * range as f64) as i64 + lo;
                    return Some(Ok(Value::Number(r)));
                }
            }
            Some(Err("Obo: Math.randomInt needs min and max 🤌".into()))
        }
        "lerp" => {
            if args.len() >= 3 {
                let a = to_f64(args.first())?;
                let b = to_f64(args.get(1))?;
                let t = to_f64(args.get(2))?;
                return Some(Ok(Value::Decimal(a + (b - a) * t)));
            }
            Some(Err("Obo: Math.lerp needs a, b, and t 🤌".into()))
        }
        _ => None,
    }
}

fn to_f64(val: Option<&Value>) -> Option<f64> {
    match val {
        Some(Value::Number(n)) => Some(*n as f64),
        Some(Value::Decimal(n)) => Some(*n),
        _ => None,
    }
}

fn simple_random() -> f64 {
    use std::time::SystemTime;
    let seed = SystemTime::now()
        .duration_since(SystemTime::UNIX_EPOCH)
        .unwrap_or_default()
        .subsec_nanos();
    ((seed as u64).wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407) >> 33) as f64
        / (1u64 << 31) as f64
}
