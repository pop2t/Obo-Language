use crate::interpreter::value::Value;

/// Handle File.method(args) calls
pub fn file_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "read" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::read_to_string(path) {
                    Ok(contents) => Ok(Value::Text(contents)),
                    Err(e) => Err(format!("Obo: Can't read '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.read needs a file path 🤌".into()))
        }
        "write" => {
            if args.len() >= 2 {
                if let (Value::Text(path), Value::Text(contents)) = (&args[0], &args[1]) {
                    return Some(match std::fs::write(path, contents) {
                        Ok(_) => Ok(Value::Flag(true)),
                        Err(e) => Err(format!("Obo: Can't write to '{}' — {} 📂", path, e)),
                    });
                }
            }
            Some(Err("Obo: File.write needs a path and contents 🤌".into()))
        }
        "append" => {
            if args.len() >= 2 {
                if let (Value::Text(path), Value::Text(contents)) = (&args[0], &args[1]) {
                    use std::io::Write;
                    return Some(match std::fs::OpenOptions::new().append(true).create(true).open(path) {
                        Ok(mut file) => match file.write_all(contents.as_bytes()) {
                            Ok(_) => Ok(Value::Flag(true)),
                            Err(e) => Err(format!("Obo: Can't append to '{}' — {} 📂", path, e)),
                        },
                        Err(e) => Err(format!("Obo: Can't open '{}' — {} 📂", path, e)),
                    });
                }
            }
            Some(Err("Obo: File.append needs a path and contents 🤌".into()))
        }
        "exists" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(Ok(Value::Flag(std::path::Path::new(path).exists())));
            }
            Some(Err("Obo: File.exists needs a path 🤌".into()))
        }
        "delete" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::remove_file(path) {
                    Ok(_) => Ok(Value::Flag(true)),
                    Err(e) => Err(format!("Obo: Can't delete '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.delete needs a path 🤌".into()))
        }
        "readLines" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::read_to_string(path) {
                    Ok(contents) => {
                        let lines: Vec<Value> = contents.lines()
                            .map(|l| Value::Text(l.to_string()))
                            .collect();
                        Ok(Value::List(lines))
                    }
                    Err(e) => Err(format!("Obo: Can't read '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.readLines needs a path 🤌".into()))
        }
        _ => None,
    }
}
