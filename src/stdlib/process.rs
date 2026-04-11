use crate::interpreter::value::Value;
use std::process::Command;

/// Handle Process.method(args) calls
pub fn process_call(method: &str, args: &[Value]) -> Option<Result<Value, String>> {
    match method {
        "run" => {
            // Process.run(command, [args]) → map with "code", "stdout", "stderr"
            if args.is_empty() {
                return Some(Err("Obo: Process.run needs a command 🤌".into()));
            }
            if let Value::Text(cmd) = &args[0] {
                let cmd_args: Vec<String> = args[1..]
                    .iter()
                    .filter_map(|a| {
                        if let Value::Text(s) = a {
                            Some(s.clone())
                        } else {
                            None
                        }
                    })
                    .collect();

                let output = Command::new(cmd)
                    .args(&cmd_args)
                    .output();

                return Some(match output {
                    Ok(out) => {
                        let code = out.status.code().unwrap_or(-1) as i64;
                        let stdout = String::from_utf8_lossy(&out.stdout).to_string();
                        let stderr = String::from_utf8_lossy(&out.stderr).to_string();
                        // Return a map with code, stdout, stderr
                        let mut result = crate::interpreter::value::OboMap::new();
                        result.set(Value::Text("code".to_string()), Value::Number(code));
                        result.set(Value::Text("stdout".to_string()), Value::Text(stdout));
                        result.set(Value::Text("stderr".to_string()), Value::Text(stderr));
                        Ok(Value::Map(result))
                    }
                    Err(e) => Err(format!("Obo: Can't run '{}' — {} 🔧", cmd, e)),
                });
            }
            Some(Err("Obo: Process.run command must be text 🤌".into()))
        }
        "exit" => {
            if let Some(Value::Number(code)) = args.first() {
                std::process::exit(*code as i32);
            }
            std::process::exit(0);
        }
        "args" => {
            let args: Vec<Value> = std::env::args()
                .map(|a| Value::Text(a))
                .collect();
            Some(Ok(Value::List(args)))
        }
        "currentDir" => {
            Some(match std::env::current_dir() {
                Ok(dir) => Ok(Value::Text(dir.to_string_lossy().to_string())),
                Err(e) => Err(format!("Obo: Can't get current directory — {} 🔧", e)),
            })
        }
        "getEnv" => {
            if let Some(Value::Text(name)) = args.first() {
                return Some(Ok(match std::env::var(name) {
                    Ok(val) => Value::Text(val),
                    Err(_) => Value::Null,
                }));
            }
            Some(Err("Obo: Process.getEnv needs a variable name 🤌".into()))
        }
        "setEnv" => {
            if args.len() >= 2 {
                if let (Value::Text(name), Value::Text(val)) = (&args[0], &args[1]) {
                    std::env::set_var(name, val);
                    return Some(Ok(Value::Flag(true)));
                }
            }
            Some(Err("Obo: Process.setEnv needs a name and value 🤌".into()))
        }
        _ => None,
    }
}
