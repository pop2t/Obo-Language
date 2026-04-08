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
    /// Emit DWARF debug info and compile with `-g`.
    pub debug: bool,
    /// Disable GC: skip root tracking / collection; allocations freed at exit only.
    pub no_gc: bool,
    /// Bare-metal / freestanding build: Tier 0 runtime, no libc, user provides allocator stubs.
    pub freestanding: bool,
    /// Cross-compilation target triple (e.g. "thumbv7em-none-eabi").
    pub target: Option<String>,
    /// Custom entry point symbol (passed as `-e` to linker).
    pub entry: Option<String>,
    /// Skip linking libc / stdlib (`-nostdlib -ffreestanding`).
    pub no_stdlib: bool,
    /// Linker script path (passed as `-T` to clang).
    pub linker_script: Option<String>,
    /// Runtime backend: `None` (default C runtime) or `Some("obo")` for self-hosted OBO runtime.
    pub runtime: Option<String>,
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
    let mut debug = false;
    let mut no_gc = false;
    let mut freestanding = false;
    let mut target: Option<String> = None;
    let mut entry: Option<String> = None;
    let mut no_stdlib = false;
    let mut linker_script: Option<String> = None;
    let mut runtime: Option<String> = None;

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
            "--debug" | "-g" => {
                debug = true;
                i += 1;
            }
            "--no-gc" => {
                no_gc = true;
                i += 1;
            }
            "--freestanding" => {
                freestanding = true;
                i += 1;
            }
            "--no-stdlib" => {
                no_stdlib = true;
                i += 1;
            }
            s if s.starts_with("--target=") => {
                target = Some(s["--target=".len()..].to_string());
                i += 1;
            }
            "--target" => {
                let t = args
                    .get(i + 1)
                    .ok_or_else(|| "expected a target triple after --target".to_string())?;
                target = Some(t.clone());
                i += 2;
            }
            "--entry" | "-e" => {
                let e = args
                    .get(i + 1)
                    .ok_or_else(|| "expected an entry symbol after --entry".to_string())?;
                entry = Some(e.clone());
                i += 2;
            }
            "--linker-script" | "-T" => {
                let ls = args
                    .get(i + 1)
                    .ok_or_else(|| "expected a linker script path after --linker-script".to_string())?;
                linker_script = Some(ls.clone());
                i += 2;
            }
            "--runtime" => {
                let r = args
                    .get(i + 1)
                    .ok_or_else(|| "expected a runtime name after --runtime (e.g. obo)".to_string())?;
                runtime = Some(r.clone());
                i += 2;
            }
            s if s.starts_with("--runtime=") => {
                runtime = Some(s["--runtime=".len()..].to_string());
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
            debug,
            no_gc,
            freestanding,
            target,
            entry,
            no_stdlib,
            linker_script,
            runtime,
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
        debug,
        no_gc,
        freestanding,
        target,
        entry,
        no_stdlib,
        linker_script,
        runtime,
    })
}
