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
        "createDir" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::create_dir(path) {
                    Ok(_) => Ok(Value::Flag(true)),
                    Err(e) => Err(format!("Obo: Can't create directory '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.createDir needs a path 🤌".into()))
        }
        "createDirAll" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::create_dir_all(path) {
                    Ok(_) => Ok(Value::Flag(true)),
                    Err(e) => Err(format!("Obo: Can't create directories '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.createDirAll needs a path 🤌".into()))
        }
        "listDir" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::read_dir(path) {
                    Ok(entries) => {
                        let mut names = Vec::new();
                        for entry in entries {
                            if let Ok(e) = entry {
                                names.push(Value::Text(
                                    e.file_name().to_string_lossy().to_string(),
                                ));
                            }
                        }
                        Ok(Value::List(names))
                    }
                    Err(e) => Err(format!("Obo: Can't list '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.listDir needs a path 🤌".into()))
        }
        "isDir" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(Ok(Value::Flag(std::path::Path::new(path).is_dir())));
            }
            Some(Err("Obo: File.isDir needs a path 🤌".into()))
        }
        "isFile" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(Ok(Value::Flag(std::path::Path::new(path).is_file())));
            }
            Some(Err("Obo: File.isFile needs a path 🤌".into()))
        }
        "copy" => {
            if args.len() >= 2 {
                if let (Value::Text(src), Value::Text(dst)) = (&args[0], &args[1]) {
                    return Some(match std::fs::copy(src, dst) {
                        Ok(_) => Ok(Value::Flag(true)),
                        Err(e) => Err(format!("Obo: Can't copy '{}' to '{}' — {} 📂", src, dst, e)),
                    });
                }
            }
            Some(Err("Obo: File.copy needs source and destination paths 🤌".into()))
        }
        "rename" => {
            if args.len() >= 2 {
                if let (Value::Text(src), Value::Text(dst)) = (&args[0], &args[1]) {
                    return Some(match std::fs::rename(src, dst) {
                        Ok(_) => Ok(Value::Flag(true)),
                        Err(e) => Err(format!("Obo: Can't rename '{}' to '{}' — {} 📂", src, dst, e)),
                    });
                }
            }
            Some(Err("Obo: File.rename needs source and destination paths 🤌".into()))
        }
        "size" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::metadata(path) {
                    Ok(meta) => Ok(Value::Number(meta.len() as i64)),
                    Err(e) => Err(format!("Obo: Can't get size of '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.size needs a path 🤌".into()))
        }
        "deleteDir" => {
            if let Some(Value::Text(path)) = args.first() {
                return Some(match std::fs::remove_dir_all(path) {
                    Ok(_) => Ok(Value::Flag(true)),
                    Err(e) => Err(format!("Obo: Can't delete directory '{}' — {} 📂", path, e)),
                });
            }
            Some(Err("Obo: File.deleteDir needs a path 🤌".into()))
        }
        _ => None,
    }
}
