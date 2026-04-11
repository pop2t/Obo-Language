pub mod collections;
pub mod text;
pub mod math;
pub mod time;
pub mod filesystem;
pub mod convert;
pub mod path;
pub mod process;

use crate::interpreter::value::Value;

/// System actor names that are accessible globally without `use`.
pub const SYSTEM_ACTORS: &[&str] = &["Math", "Time", "File", "Convert", "pointer", "mem", "memo", "Path", "Process"];

/// Resolve a system actor member access like `Math.pi`
pub fn system_member(actor: &str, member: &str) -> Option<Value> {
    match actor {
        "Math" => math::math_member(member),
        "Time" => time::time_member(member),
        "pointer" => Some(Value::BuiltinFn(format!("pointer.{}", member))),
        _ => None,
    }
}

/// Resolve a system actor method call like `Math.sqrt(16)`
pub fn system_call(actor: &str, method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match actor {
        "Math" => math::math_call(method, args),
        "Time" => time::time_call(method, args),
        "File" => filesystem::file_call(method, args),
        "Convert" => convert::convert_call(method, args),
        "Path" => path::path_call(method, args),
        "Process" => process::process_call(method, args),
        "pointer" => Some(match method {
            "alloc" => {
                Err("Obo: pointer.alloc() requires native compilation — use 'obo build' 🔧".into())
            }
            "free" => {
                Err("Obo: pointer.free() requires native compilation — use 'obo build' 🔧".into())
            }
            _ => Err(format!("Obo: pointer doesn't have '{}' 🤨", method)),
        }),
        "mem" => Some(match method {
            "load64" | "store64" | "load8" | "store8" => {
                Err("Obo: mem operations require native compilation — use 'obo build' 🔧".into())
            }
            _ => Err(format!("Obo: mem doesn't have '{}' 🤨", method)),
        }),
        "memo" => Some(match method {
            "reserve" | "clean" | "grab8" | "grab16" | "grab32" | "grab64"
            | "drop8" | "drop16" | "drop32" | "drop64" => {
                Err("Obo: memo operations require native compilation — use 'obo build' 🔧".into())
            }
            _ => Err(format!("Obo: memo doesn't have '{}' — try reserve, clean, grab8/16/32/64, or drop8/16/32/64 🤨", method)),
        }),
        _ => None,
    }
}
