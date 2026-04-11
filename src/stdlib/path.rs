use crate::interpreter::value::Value;
use std::path::{Path, MAIN_SEPARATOR};

/// Handle Path.method(args) calls
pub fn path_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "join" => {
            // Path.join(a, b) or Path.join(a, b, c, ...)
            if args.is_empty() {
                return Some(Err("Obo: Path.join needs at least one path 🤌".into()));
            }
            let mut result = std::path::PathBuf::new();
            for arg in args {
                if let Value::Text(s) = arg {
                    result.push(s);
                } else {
                    return Some(Err("Obo: Path.join arguments must be text 🤌".into()));
                }
            }
            Some(Ok(Value::Text(result.to_string_lossy().to_string())))
        }
        "parent" => {
            if let Some(Value::Text(path)) = args.first() {
                let p = Path::new(path);
                return Some(Ok(match p.parent() {
                    Some(parent) => Value::Text(parent.to_string_lossy().to_string()),
                    None => Value::Text(String::new()),
                }));
            }
            Some(Err("Obo: Path.parent needs a path 🤌".into()))
        }
        "filename" => {
            if let Some(Value::Text(path)) = args.first() {
                let p = Path::new(path);
                return Some(Ok(match p.file_name() {
                    Some(name) => Value::Text(name.to_string_lossy().to_string()),
                    None => Value::Text(String::new()),
                }));
            }
            Some(Err("Obo: Path.filename needs a path 🤌".into()))
        }
        "extension" => {
            if let Some(Value::Text(path)) = args.first() {
                let p = Path::new(path);
                return Some(Ok(match p.extension() {
                    Some(ext) => Value::Text(ext.to_string_lossy().to_string()),
                    None => Value::Text(String::new()),
                }));
            }
            Some(Err("Obo: Path.extension needs a path 🤌".into()))
        }
        "absolute" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(
                    match std::fs::canonicalize(path) {
                        Ok(abs) => Ok(Value::Text(abs.to_string_lossy().to_string())),
                        Err(e) => Err(format!("Obo: Can't resolve '{}' — {} 📂", path, e)),
                    }
                );
            }
            Some(Err("Obo: Path.absolute needs a path 🤌".into()))
        }
        "home" => {
            Some(Ok(Value::Text(
                std::env::var("HOME")
                    .unwrap_or_else(|_| "/".to_string()),
            )))
        }
        "separator" => {
            Some(Ok(Value::Text(MAIN_SEPARATOR.to_string())))
        }
        _ => None,
    }
}
