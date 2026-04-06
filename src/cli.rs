//! Minimal command-line parsing — no external CLI crates.

use std::path::Path;

/// Parsed `obo build ...` arguments.
pub struct BuildArgs {
    pub input: String,
    /// Executable output (`None` with `--no-link` means no binary).
    pub output_exe: Option<String>,
    /// If set, LLVM IR is written to this path (UTF-8).
    pub emit_ll: Option<String>,
    /// Skip `clang`; only produce `.ll` when combined with `emit_ll` or implied default path.
    pub no_link: bool,
}

impl BuildArgs {
    /// Default `.ll` path next to the source file: `src/app.obo` → `src/app.ll`
    pub fn default_ll_path(input: &str) -> String {
        Path::new(input)
            .with_extension("ll")
            .to_string_lossy()
            .into_owned()
    }
}

/// Parse argv after the `build` subcommand: `obo build [options] <file.obo>`
pub fn parse_build_args(args: &[String]) -> Result<BuildArgs, String> {
    let mut input: Option<String> = None;
    let mut output_exe: Option<String> = None;
    let mut emit_ll: Option<Option<String>> = None; // None = not requested, Some(None) = auto path, Some(Some(p)) = explicit
    let mut no_link = false;

    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "-o" | "--output" => {
                let path = args
                    .get(i + 1)
                    .ok_or_else(|| "expected a path after -o".to_string())?;
                output_exe = Some(path.clone());
                i += 2;
            }
            "--emit-ll" => {
                // Next arg is an explicit path only if it ends with `.ll` (avoids eating `foo.obo`).
                if let Some(next) = args.get(i + 1) {
                    if next.ends_with(".ll") {
                        emit_ll = Some(Some(next.clone()));
                        i += 2;
                    } else {
                        emit_ll = Some(None);
                        i += 1;
                    }
                } else {
                    emit_ll = Some(None);
                    i += 1;
                }
            }
            "--no-link" | "--ll-only" => {
                no_link = true;
                i += 1;
            }
            s if s.ends_with(".obo") => {
                input = Some(s.to_string());
                i += 1;
            }
            s => {
                return Err(format!("unknown or misplaced argument: {}", s));
            }
        }
    }

    let input = input.ok_or_else(|| "expected an .obo source file (e.g. obo build app.obo)".to_string())?;

    let emit_ll_resolved = match emit_ll {
        None => None,
        Some(None) => Some(BuildArgs::default_ll_path(&input)),
        Some(Some(p)) => Some(p),
    };

    if no_link && emit_ll_resolved.is_none() {
        // Implied: write .ll next to source
        let path = BuildArgs::default_ll_path(&input);
        return Ok(BuildArgs {
            input,
            output_exe: None,
            emit_ll: Some(path),
            no_link: true,
        });
    }

    let output_exe = if no_link {
        None
    } else {
        Some(output_exe.unwrap_or_else(|| "a.out".to_string()))
    };

    Ok(BuildArgs {
        input,
        output_exe,
        emit_ll: emit_ll_resolved,
        no_link,
    })
}
