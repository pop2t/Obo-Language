use std::time::{SystemTime, UNIX_EPOCH, Instant};
use crate::interpreter::value::Value;

thread_local! {
    static STOPWATCH: std::cell::RefCell<Option<Instant>> = std::cell::RefCell::new(None);
}

/// Handle Time.member access
pub fn time_member(member: &str) -> Option<Value> {
    match member {
        "now" => {
            let millis = SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap_or_default()
                .as_millis();
            Some(Value::Number(millis as i64))
        }
        "nowSeconds" => {
            let secs = SystemTime::now()
                .duration_since(UNIX_EPOCH)
                .unwrap_or_default()
                .as_secs();
            Some(Value::Number(secs as i64))
        }
        _ => None,
    }
}

/// Handle Time.method(args) calls
pub fn time_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "sleep" => {
            if let Some(val) = args.first() {
                let ms = match val {
                    Value::Number(n) => *n as u64,
                    Value::Decimal(n) => (*n * 1000.0) as u64,
                    _ => return Some(Err("Obo: Time.sleep needs a duration in milliseconds 🤌".into())),
                };
                std::thread::sleep(std::time::Duration::from_millis(ms));
                return Some(Ok(Value::Null));
            }
            Some(Err("Obo: Time.sleep needs a duration 🤌".into()))
        }
        "startTimer" => {
            STOPWATCH.with(|sw| {
                *sw.borrow_mut() = Some(Instant::now());
            });
            Some(Ok(Value::Null))
        }
        "stopTimer" => {
            let elapsed = STOPWATCH.with(|sw| {
                sw.borrow().map(|start| start.elapsed().as_millis() as i64)
            });
            match elapsed {
                Some(ms) => Some(Ok(Value::Number(ms))),
                None => Some(Ok(Value::Number(0))),
            }
        }
        "measure" => {
            // Returns current high-res time in milliseconds (for benchmarking)
            let now = Instant::now();
            let ns = now.elapsed().as_nanos();
            Some(Ok(Value::Decimal(ns as f64 / 1_000_000.0)))
        }
        _ => None,
    }
}
