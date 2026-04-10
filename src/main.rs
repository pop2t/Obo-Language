mod error;
mod lexer;
mod parser;
mod interpreter;
mod analyzer;
mod ir;
mod stdlib;
mod llvm_emit;
mod cli;
mod runtime_c;
mod runtime_obo;
mod lsp;

use crate::error::ErrorReporter;
use crate::lexer::scanner::Scanner;
use crate::parser::parser::Parser;
use crate::parser::printer::AstPrinter;
use crate::interpreter::engine::Interpreter;
use crate::analyzer::checker::Checker;
use crate::ir::lowering::Lowering;
use crate::ir::printer as ir_printer;
use std::collections::HashSet;
use std::env;
use std::fs;
use std::path::{Path, PathBuf};
use std::process::{self, Command};

const VERSION: &str = "0.7.0";

fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 {
        print_usage();
        process::exit(1);
    }

    match args[1].as_str() {
        "lex" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to lex 👀");
                eprintln!("→ usage: obo lex <file.obo>");
                process::exit(1);
            }
            cmd_lex(&args[2]);
        }
        "parse" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to parse 👀");
                eprintln!("→ usage: obo parse <file.obo>");
                process::exit(1);
            }
            cmd_parse(&args[2]);
        }
        "check" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to check 🔍");
                eprintln!("→ usage: obo check <file.obo>");
                process::exit(1);
            }
            cmd_check(&args[2]);
        }
        "ir" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to lower to IR 🔧");
                eprintln!("→ usage: obo ir <file.obo>");
                process::exit(1);
            }
            cmd_ir(&args[2]);
        }
        "build" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to compile to native code 🔨");
                eprintln!("→ usage: obo build <file.obo> [options]");
                eprintln!("  options: -o <exe>  --emit-ll [file.ll]  --no-link");
                process::exit(1);
            }
            match cli::parse_build_args(&args[2..]) {
                Ok(cfg) => cmd_build(&cfg),
                Err(e) => {
                    eprintln!("Obo: {} 🤔", e);
                    eprintln!("→ obo build <file.obo> [-o out] [--emit-ll] [--no-link]");
                    process::exit(1);
                }
            }
        }
        "doctor" => {
            cmd_doctor();
        }
        "run" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to run 👀");
                eprintln!("→ usage: obo run <file.obo>");
                process::exit(1);
            }
            cmd_run(&args[2]);
        }
        "test" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to test 🧪");
                eprintln!("→ usage: obo test <file.obo>");
                process::exit(1);
            }
            cmd_test(&args[2]);
        }
        "repl" => {
            cmd_repl();
        }
        "fmt" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to format 📐");
                eprintln!("→ usage: obo fmt <file.obo> [-w]");
                process::exit(1);
            }
            let write_in_place = args.iter().any(|a| a == "-w" || a == "--write");
            cmd_fmt(&args[2], write_in_place);
        }
        "doc" => {
            if args.len() < 3 {
                eprintln!("Obo: I need a file to document 📖");
                eprintln!("→ usage: obo doc <file.obo> [-o output.md]");
                process::exit(1);
            }
            let output = args.iter().position(|a| a == "-o" || a == "--output")
                .and_then(|i| args.get(i + 1).map(|s| s.as_str()));
            cmd_doc(&args[2], output);
        }
        "lsp" => {
            lsp::server::run_lsp();
        }
        "version" | "--version" | "-v" => {
            println!("OBO v{}", VERSION);
        }
        "help" | "--help" | "-h" => {
            print_usage();
        }
        other => {
            if other.ends_with(".obo") {
                cmd_run(other);
            } else {
                eprintln!("Obo: I don't know what '{}' means 🤔", other);
                eprintln!("→ try: obo help");
                process::exit(1);
            }
        }
    }
}

fn read_source(path: &str) -> String {
    match fs::read_to_string(path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("Obo: Can't read '{}' 😬", path);
            eprintln!("→ {}", e);
            process::exit(1);
        }
    }
}

fn cmd_lex(path: &str) {
    let source = read_source(path);
    let scanner = Scanner::new(&source);
    let (tokens, errors) = scanner.scan_tokens();

    if !errors.is_empty() {
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in errors {
            reporter.report(error);
        }
        reporter.display_all(&source);
        eprintln!();
    }

    for token in &tokens {
        println!(
            "{:>4}:{:<3} {:20} {:?}",
            token.span.line,
            token.span.column,
            format!("{:?}", token.kind),
            token.lexeme,
        );
    }

    let count = tokens.len();
    println!("\n--- {} tokens ---", count);
}

fn cmd_parse(path: &str) {
    let source = read_source(path);

    // Phase 1: Lex
    let scanner = Scanner::new(&source);
    let (tokens, lex_errors) = scanner.scan_tokens();

    let has_lex_errors = !lex_errors.is_empty();
    if has_lex_errors {
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in lex_errors {
            reporter.report(error);
        }
        reporter.display_all(&source);
        eprintln!();
    }

    // Phase 2: Parse
    let parser = Parser::new(tokens);
    let (program, parse_errors) = parser.parse();

    if !parse_errors.is_empty() {
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in parse_errors {
            reporter.report(error);
        }
        reporter.display_all(&source);
        eprintln!();
    }

    // Print AST
    let mut printer = AstPrinter::new();
    print!("{}", printer.print_program(&program));
    println!("--- {} top-level declarations ---", program.len());
}

fn cmd_doc(path: &str, output_path: Option<&str>) {
    use crate::parser::docgen::DocGenerator;

    let source = read_source(path);
    let (program, has_errors) = compile_to_ast(path, &source);

    if has_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    let markdown = DocGenerator::new(path).generate(&program);

    if let Some(out) = output_path {
        if let Err(e) = fs::write(out, &markdown) {
            eprintln!("Obo: Can't write '{}' — {} 😬", out, e);
            process::exit(1);
        }
        eprintln!("Obo: Documentation written to {} 📖", out);
    } else {
        print!("{}", markdown);
    }
}

fn cmd_fmt(path: &str, write_in_place: bool) {
    use crate::parser::formatter::Formatter;

    let source = read_source(path);
    let (program, has_errors) = compile_to_ast(path, &source);

    if has_errors {
        process::exit(1);
    }

    let formatted = Formatter::new().format(&program);

    if write_in_place {
        if let Err(e) = fs::write(path, &formatted) {
            eprintln!("Obo: Can't write '{}' — {} 😬", path, e);
            process::exit(1);
        }
        eprintln!("Obo: Formatted {} ✅", path);
    } else {
        print!("{}", formatted);
    }
}

fn cmd_ir(path: &str) {
    let source = read_source(path);
    let (program, has_errors) = compile_to_ast(path, &source);

    if has_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    let lowering = Lowering::new();
    let ir_program = lowering.lower(&program);
    print!("{}", ir_printer::print_program(&ir_program));
}

fn cmd_build(cfg: &cli::BuildArgs) {
    let path = &cfg.input;
    let source = read_source(path);
    let (program, has_parse_errors) = compile_to_ast(path, &source);

    if has_parse_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    let checker = Checker::new();
    let (_symbols, check_errors) = checker.check(&program);

    if !check_errors.is_empty() {
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in check_errors {
            reporter.report(error);
        }
        reporter.display_all(&source);
        if reporter.has_errors() {
            process::exit(1);
        }
    }

    let lowering = Lowering::new();
    let mut ir_program = lowering.lower(&program);

    // Set source file info for debug metadata.
    {
        let p = std::path::Path::new(path);
        ir_program.source_file = p.file_name().map(|f| f.to_string_lossy().into_owned()).unwrap_or_default();
        ir_program.source_dir = p.parent().and_then(|d| d.canonicalize().ok()).map(|d| d.to_string_lossy().into_owned()).unwrap_or_else(|| ".".to_string());
    }

    // Freestanding implies no-gc (no GC roots / sweep in Tier 0).
    let effective_no_gc = cfg.no_gc || cfg.freestanding;

    let (llvm_ir, fn_ret) = match llvm_emit::emit_program(&mut ir_program, cfg.debug, effective_no_gc) {
        Ok(p) => p,
        Err(e) => {
            eprintln!("Obo: Native build failed — {} 🧱", e);
            process::exit(1);
        }
    };
    let dispatch_c = llvm_emit::generate_obo_native_dispatch_c(&ir_program, &fn_ret);

    // Branch on runtime backend: C (default) vs OBO self-hosted.
    let (rt_c_src, runtime_ll_extra) = if cfg.runtime.as_deref() == Some("obo") {
        match compile_obo_runtime(&dispatch_c) {
            Ok((rt_ll, bridge_c)) => (bridge_c, Some(rt_ll)),
            Err(e) => {
                eprintln!("Obo: OBO runtime compilation failed — {} 🧱", e);
                process::exit(1);
            }
        }
    } else {
        let freestanding_define = if cfg.freestanding { "#define OBO_FREESTANDING\n" } else { "" };
        (format!("{}{}{}", freestanding_define, runtime_c::OBO_RT_C, dispatch_c), None)
    };

    // Collect unique bridge library names for linker flags.
    let bridge_libs: Vec<String> = {
        let mut libs = Vec::new();
        for bfn in &ir_program.bridge_fns {
            if !libs.contains(&bfn.lib_name) {
                libs.push(bfn.lib_name.clone());
            }
        }
        libs
    };

    let (ll_path, ll_persistent) = if let Some(ref p) = cfg.emit_ll {
        if let Err(e) = fs::write(p, &llvm_ir) {
            eprintln!("Obo: Can't write '{}' — {} 😬", p, e);
            process::exit(1);
        }
        eprintln!("Obo: LLVM IR saved → {}", p);
        (PathBuf::from(p), true)
    } else {
        let tmp = env::temp_dir().join(format!("obo_build_{}.ll", process::id()));
        if let Err(e) = fs::write(&tmp, &llvm_ir) {
            eprintln!("Obo: Can't write temp LLVM IR — {} 😬", e);
            process::exit(1);
        }
        (tmp, false)
    };

    if cfg.no_link {
        let rt_next = ll_path.parent().map_or_else(
            || PathBuf::from("obo_rt.c"),
            |p| p.join("obo_rt.c"),
        );
        if let Err(e) = fs::write(&rt_next, &rt_c_src) {
            eprintln!("Obo: Can't write '{}' next to .ll — {} 😬", rt_next.display(), e);
            process::exit(1);
        }
        eprintln!(
            "Obo: Done (--no-link). Example: clang -O2 -o a.out {} {} ✅",
            ll_path.display(),
            rt_next.display()
        );
        return;
    }

    let exe = cfg
        .output_exe
        .as_ref()
        .map(String::as_str)
        .unwrap_or("a.out");
    let ll_str = match ll_path.to_str() {
        Some(s) => s,
        None => {
            eprintln!("Obo: Bad path for LLVM IR 😬");
            process::exit(1);
        }
    };

    let rt_c = env::temp_dir().join(format!("obo_rt_{}.c", process::id()));
    if let Err(e) = fs::write(&rt_c, &rt_c_src) {
        eprintln!("Obo: Can't write temp runtime — {} 😬", e);
        process::exit(1);
    }
    let rt_str = match rt_c.to_str() {
        Some(s) => s,
        None => {
            eprintln!("Obo: Bad temp path for runtime 😬");
            process::exit(1);
        }
    };

    let mut clang = Command::new("clang");
    if cfg.debug {
        clang.arg("-g").arg("-O0");
    } else {
        clang.arg("-O2");
    }

    // Bare-metal / cross-compilation flags.
    if cfg.freestanding || cfg.no_stdlib {
        clang.arg("-ffreestanding").arg("-nostdlib");
    }
    if let Some(ref triple) = cfg.target {
        clang.arg(format!("--target={}", triple));
    }
    if let Some(ref ent) = cfg.entry {
        clang.arg("-e").arg(ent);
    }
    if let Some(ref ls) = cfg.linker_script {
        clang.arg("-T").arg(ls);
    }

    clang.arg("-Wno-override-module");

    // Only link pthread when hosted (not freestanding/no-stdlib).
    if !cfg.freestanding && !cfg.no_stdlib {
        clang.arg("-lpthread");
    }

    // Write OBO runtime .ll to temp file if using --runtime obo.
    let rt_ll_temp: Option<PathBuf> = if let Some(ref rt_ll_src) = runtime_ll_extra {
        let p = env::temp_dir().join(format!("obo_rt_obo_{}.ll", process::id()));
        if let Err(e) = fs::write(&p, rt_ll_src) {
            eprintln!("Obo: Can't write temp runtime .ll — {} 😬", e);
            process::exit(1);
        }
        Some(p)
    } else {
        None
    };

    clang
        .args(bridge_libs.iter().map(|l| format!("-l{}", l)))
        .arg("-o")
        .arg(exe)
        .arg(ll_str)
        .arg(rt_str);

    // Add the self-hosted runtime .ll if present.
    if let Some(ref rt_ll_path) = rt_ll_temp {
        clang.arg(rt_ll_path.to_str().unwrap());
    }

    let status = clang.status();

    let _ = fs::remove_file(&rt_c);
    if let Some(ref rt_ll_path) = rt_ll_temp {
        let _ = fs::remove_file(rt_ll_path);
    }

    if !ll_persistent {
        let _ = fs::remove_file(&ll_path);
    }

    match status {
        Ok(s) if s.success() => {
            eprintln!("Obo: Built native executable → {} ⚙️", exe);
        }
        Ok(s) => {
            eprintln!("Obo: clang exited with status {} 🔧", s);
            eprintln!("→ Native builds need clang on PATH (macOS: Xcode Command Line Tools).");
            if !ll_persistent {
                eprintln!("→ Tip: obo build {} --emit-ll --no-link  (save .ll, then: clang -o app file.ll)", path);
            } else if let Some(ref p) = cfg.emit_ll {
                eprintln!("→ Try: clang -O2 -o {} {}", exe, p);
            }
            process::exit(1);
        }
        Err(e) => {
            eprintln!("Obo: Couldn't run clang — {} 🔧", e);
            eprintln!("→ Install clang, or use --emit-ll --no-link and compile the .ll yourself.");
            process::exit(1);
        }
    }
}

fn cmd_doctor() {
    println!("OBO v{} — environment check", VERSION);
    println!();
    println!("  Rust crate dependencies: 0 (stdlib only)");
    println!("  Native build (optional): clang on PATH compiles generated LLVM IR.");
    println!();

    match Command::new("clang").arg("--version").output() {
        Ok(out) if out.status.success() => {
            let line = String::from_utf8_lossy(&out.stdout);
            let first = line.lines().next().unwrap_or("clang");
            println!("  clang: OK — {}", first);
        }
        Ok(_) => println!("  clang: found but returned an error"),
        Err(_) => println!("  clang: not found (obo run still works; obo build needs clang)"),
    }

    match Command::new("rustc").arg("--version").output() {
        Ok(out) if out.status.success() => {
            println!(
                "  rustc: {} (only needed to build the obo compiler itself)",
                String::from_utf8_lossy(&out.stdout).trim()
            );
        }
        _ => println!("  rustc: not found (install Rust to build obo from source)"),
    }
    println!();
    println!("\"Simple on the surface. Powerful underneath.\"");
}

fn cmd_check(path: &str) {
    let source = read_source(path);
    let (program, has_parse_errors) = compile_to_ast(path, &source);

    if has_parse_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    let checker = Checker::new();
    let (_symbols, check_errors) = checker.check(&program);

    if !check_errors.is_empty() {
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in check_errors {
            reporter.report(error);
        }
        reporter.display_all(&source);

        if reporter.has_errors() {
            process::exit(1);
        }
    } else {
        eprintln!("Obo: All clear! No issues found ✅");
    }
}

fn cmd_run(path: &str) {
    let source = read_source(path);
    let (program, has_errors) = compile_to_ast(path, &source);

    if has_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    let mut interp = Interpreter::new();
    if let Err(e) = interp.run(&program) {
        display_runtime_error(path, &source, &e);
        process::exit(1);
    }
}

fn cmd_test(path: &str) {
    use crate::parser::ast::Declaration;
    use std::time::Instant;

    let source = read_source(path);
    let (program, has_errors) = compile_to_ast(path, &source);

    if has_errors {
        process::exit(1);
    }

    let (program, import_errors) = resolve_imports(path, program);
    if import_errors {
        process::exit(1);
    }

    // Collect @test function names from the AST
    let test_names: Vec<String> = program
        .iter()
        .filter_map(|decl| {
            if let Declaration::Function(f) = decl {
                if f.attributes.iter().any(|a| a.name == "test") {
                    return Some(f.name.clone());
                }
            }
            None
        })
        .collect();

    if test_names.is_empty() {
        eprintln!("Obo: No @test functions found in {} 🤷", path);
        process::exit(0);
    }

    let use_color = std::io::IsTerminal::is_terminal(&std::io::stderr());
    let sty = |text: &str, ansi: &str| -> String {
        if use_color { format!("{}{}\x1b[0m", ansi, text) } else { text.to_string() }
    };

    eprintln!("{}\n", sty(
        &format!("Obo: Running {} test(s) from {} 🧪", test_names.len(), path),
        "\x1b[1;38;5;214m",
    ));

    // Register all declarations
    let mut interp = Interpreter::new();
    for decl in &program {
        if let Err(e) = interp.register_declaration(decl) {
            eprintln!("Obo: Registration error — {} 💥", e);
            process::exit(1);
        }
    }

    let mut passed = 0u32;
    let mut failed = 0u32;
    let mut failures: Vec<(String, String)> = Vec::new();
    let total_start = Instant::now();

    for name in &test_names {
        let func = match interp.env.get(name).cloned() {
            Some(crate::interpreter::value::Value::Function(f)) => f,
            _ => {
                eprintln!("  {} {} — not found after registration", sty("✗", "\x1b[1;31m"), name);
                failed += 1;
                failures.push((name.clone(), "function not found".into()));
                continue;
            }
        };

        let start = Instant::now();
        match interp.call_function(&func, &[]) {
            Ok(_) => {
                let elapsed = start.elapsed();
                eprintln!("  {} {} {}", sty("✓", "\x1b[1;32m"), sty(name, "\x1b[1;37m"), sty(&format!("({:.1}ms)", elapsed.as_secs_f64() * 1000.0), "\x1b[0;37m"));
                passed += 1;
            }
            Err(e) => {
                let elapsed = start.elapsed();
                eprintln!("  {} {} {}", sty("✗", "\x1b[1;31m"), sty(name, "\x1b[1;37m"), sty(&format!("({:.1}ms)", elapsed.as_secs_f64() * 1000.0), "\x1b[0;37m"));
                let clean = e.trim().trim_start_matches("Obo: ");
                eprintln!("    {} {}", sty("→", "\x1b[1;31m"), sty(clean, "\x1b[0;31m"));
                failed += 1;
                failures.push((name.clone(), e));
            }
        }
    }

    let total_elapsed = total_start.elapsed();
    let time_str = format!("({:.1}ms)", total_elapsed.as_secs_f64() * 1000.0);
    eprintln!();
    if failed == 0 {
        eprintln!(
            "{}",
            sty(
                &format!("Obo: All {} test(s) passed ✅ {}", passed, time_str),
                "\x1b[1;32m",
            )
        );
    } else {
        eprintln!(
            "{}",
            sty(
                &format!("Obo: {} passed, {} failed ❌ {}", passed, failed, time_str),
                "\x1b[1;31m",
            )
        );
        process::exit(1);
    }
}

fn cmd_repl() {
    use std::io::{self, BufRead, Write};

    eprintln!("OBO v{} — interactive shell", VERSION);
    eprintln!("Type expressions, statements, or declarations. Ctrl-D to exit.\n");

    let mut interp = Interpreter::new();
    let mut line_buffer = String::new();
    let mut brace_depth: i32 = 0;
    let stdin = io::stdin();

    loop {
        // Prompt
        if brace_depth > 0 {
            eprint!("... ");
        } else {
            eprint!("obo> ");
        }
        io::stderr().flush().ok();

        let mut line = String::new();
        match stdin.lock().read_line(&mut line) {
            Ok(0) => {
                // EOF (Ctrl-D)
                eprintln!("\nBye 👋");
                break;
            }
            Ok(_) => {}
            Err(_) => break,
        }

        // Track brace depth for multi-line input
        for ch in line.chars() {
            match ch {
                '{' => brace_depth += 1,
                '}' => brace_depth -= 1,
                _ => {}
            }
        }
        line_buffer.push_str(&line);

        if brace_depth > 0 {
            continue;
        }

        let input = line_buffer.trim();
        if input.is_empty() {
            line_buffer.clear();
            brace_depth = 0;
            continue;
        }

        // Auto-append semicolon for bare expressions (no trailing ; or })
        let source = if !input.ends_with(';') && !input.ends_with('}') {
            format!("{};", input)
        } else {
            input.to_string()
        };

        // Lex
        let scanner = Scanner::new(&source);
        let (tokens, lex_errors) = scanner.scan_tokens();
        if !lex_errors.is_empty() {
            let mut reporter = ErrorReporter::new().with_file("<repl>");
            for e in lex_errors {
                reporter.report(e);
            }
            reporter.display_all(&source);
            line_buffer.clear();
            brace_depth = 0;
            continue;
        }

        // Parse
        let parser = Parser::new(tokens);
        let (declarations, parse_errors) = parser.parse();
        if !parse_errors.is_empty() {
            let mut reporter = ErrorReporter::new().with_file("<repl>");
            for e in parse_errors {
                reporter.report(e);
            }
            reporter.display_all(&source);
            line_buffer.clear();
            brace_depth = 0;
            continue;
        }

        // Execute
        for decl in &declarations {
            match interp.eval_repl_declaration(decl) {
                Ok(Some(val)) => {
                    if !matches!(val, crate::interpreter::value::Value::Null) {
                        println!("→ {}", val);
                    }
                }
                Ok(None) => {}
                Err(e) => eprintln!("{}", e),
            }
        }

        line_buffer.clear();
        brace_depth = 0;
    }
}

/// Recursively resolve `use` declarations, loading and parsing referenced .obo files.
/// Returns the merged program with all imported declarations prepended.
fn resolve_imports(
    root_path: &str,
    program: crate::parser::ast::Program,
) -> (crate::parser::ast::Program, bool) {
    use crate::parser::ast::Declaration;

    let root_dir = Path::new(root_path)
        .parent()
        .unwrap_or_else(|| Path::new("."));

    let mut visited: HashSet<PathBuf> = HashSet::new();
    if let Ok(canonical) = fs::canonicalize(root_path) {
        visited.insert(canonical);
    } else {
        visited.insert(PathBuf::from(root_path));
    }

    let mut imported_decls: Vec<Declaration> = Vec::new();
    let mut has_errors = false;

    fn collect_imports(
        decls: &[Declaration],
        base_dir: &Path,
        visited: &mut HashSet<PathBuf>,
        imported: &mut Vec<Declaration>,
        errors: &mut bool,
    ) {
        for decl in decls {
            if let Declaration::Use(use_decl) = decl {
                if let Some(specific) = &use_decl.specific {
                    // "use X from module.path;" → load module.path.obo, import only X
                    let module_path_str = use_decl.path.join("/");
                    let file_path = base_dir.join(format!("{}.obo", module_path_str));
                    load_module_file(
                        &file_path, base_dir, visited, imported, errors,
                        Some(specific),
                    );
                } else {
                    // "use Foo, Bar;" → load Foo.obo and Bar.obo
                    for module_name in &use_decl.path {
                        if crate::stdlib::SYSTEM_ACTORS.contains(&module_name.as_str()) {
                            continue;
                        }
                        let file_path = base_dir.join(format!("{}.obo", module_name));
                        load_module_file(
                            &file_path, base_dir, visited, imported, errors, None,
                        );
                    }
                }
            }
        }
    }

    fn load_module_file(
        file_path: &Path,
        base_dir: &Path,
        visited: &mut HashSet<PathBuf>,
        imported: &mut Vec<Declaration>,
        errors: &mut bool,
        specific: Option<&Vec<String>>,
    ) {
        let canonical = fs::canonicalize(file_path)
            .unwrap_or_else(|_| file_path.to_path_buf());

        if visited.contains(&canonical) {
            return;
        }

        if !file_path.exists() {
            eprintln!(
                "Obo: Can't find module '{}' 😬",
                file_path.display()
            );
            *errors = true;
            return;
        }

        visited.insert(canonical);

        let source = match fs::read_to_string(file_path) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("Obo: Can't read '{}' — {} 😬", file_path.display(), e);
                *errors = true;
                return;
            }
        };

        let path_str = file_path.to_string_lossy().to_string();
        let scanner = Scanner::new(&source);
        let (tokens, lex_errors) = scanner.scan_tokens();

        if !lex_errors.is_empty() {
            *errors = true;
            let mut reporter = ErrorReporter::new().with_file(&path_str);
            for error in lex_errors {
                reporter.report(error);
            }
            reporter.display_all(&source);
        }

        let parser = Parser::new(tokens);
        let (module_program, parse_errors) = parser.parse();

        if !parse_errors.is_empty() {
            *errors = true;
            let mut reporter = ErrorReporter::new().with_file(&path_str);
            for error in parse_errors {
                reporter.report(error);
            }
            reporter.display_all(&source);
        }

        // Recurse into the module's own imports
        let module_dir = file_path.parent().unwrap_or(base_dir);
        collect_imports(&module_program, module_dir, visited, imported, errors);

        // Filter to only public/requested symbols if specific imports were requested
        for decl in module_program {
            let dominated = match &decl {
                Declaration::Statement(_) => true,
                _ => false,
            };
            if dominated {
                continue;
            }
            if let Some(names) = specific {
                let decl_name = match &decl {
                    Declaration::Function(f) => Some(&f.name),
                    Declaration::Entity(e) => Some(&e.name),
                    Declaration::Actor(a) => Some(&a.name),
                    Declaration::Choice(c) => Some(&c.name),
                    Declaration::Const(c) => Some(&c.name),
                    _ => None,
                };
                if let Some(name) = decl_name {
                    if !names.contains(name) {
                        continue;
                    }
                } else {
                    continue;
                }
            }
            imported.push(decl);
        }
    }

    collect_imports(&program, root_dir, &mut visited, &mut imported_decls, &mut has_errors);

    // Prepend imported declarations before the root program's declarations
    imported_decls.extend(program);
    (imported_decls, has_errors)
}

/// Compile the self-hosted OBO runtime modules into LLVM IR + C bridge source.
/// Returns (runtime_llvm_ir, bridge_c_source).
fn compile_obo_runtime(dispatch_c: &str) -> Result<(String, String), String> {
    // 1. Write all OBO runtime source files to a temp directory
    //    (resolve_imports needs files on disk).
    let tmp_dir = env::temp_dir().join(format!("obo_rt_obo_{}", process::id()));
    fs::create_dir_all(&tmp_dir).map_err(|e| format!("Can't create temp dir: {}", e))?;

    for (name, src) in runtime_obo::MODULES {
        let path = tmp_dir.join(name);
        fs::write(&path, src).map_err(|e| format!("Can't write {}: {}", name, e))?;
    }

    // 2. Compile obo_rt_all.obo through the full pipeline.
    let master = tmp_dir.join("obo_rt_all.obo");
    let master_path = master.to_string_lossy().to_string();
    let source = runtime_obo::OBO_RT_ALL;

    let (program, has_parse_errors) = compile_to_ast(&master_path, source);
    if has_parse_errors {
        let _ = fs::remove_dir_all(&tmp_dir);
        return Err("parse errors in OBO runtime modules".to_string());
    }

    let (program, import_errors) = resolve_imports(&master_path, program);
    if import_errors {
        let _ = fs::remove_dir_all(&tmp_dir);
        return Err("import resolution errors in OBO runtime modules".to_string());
    }

    let lowering = Lowering::new();
    let mut ir_program = lowering.lower(&program);

    // Compile with no_gc = true (prevent GC instrumentation on internal runtime allocations).
    let (runtime_ll, _fn_ret) = llvm_emit::emit_program(&mut ir_program, false, true)
        .map_err(|e| format!("OBO runtime emit failed: {}", e))?;

    // 3. Clean up temp directory.
    let _ = fs::remove_dir_all(&tmp_dir);

    // 4. Build bridge C source: bridge code + per-program dispatch table.
    let bridge_c = format!("{}\n{}", runtime_obo::OBO_RT_BRIDGE_C, dispatch_c);

    Ok((runtime_ll, bridge_c))
}

fn compile_to_ast(path: &str, source: &str) -> (crate::parser::ast::Program, bool) {
    let scanner = Scanner::new(source);
    let (tokens, lex_errors) = scanner.scan_tokens();

    let mut has_errors = false;

    if !lex_errors.is_empty() {
        has_errors = true;
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in lex_errors {
            reporter.report(error);
        }
        reporter.display_all(source);
    }

    let parser = Parser::new(tokens);
    let (program, parse_errors) = parser.parse();

    if !parse_errors.is_empty() {
        has_errors = true;
        let mut reporter = ErrorReporter::new().with_file(path);
        for error in parse_errors {
            reporter.report(error);
        }
        reporter.display_all(source);
    }

    (program, has_errors)
}

fn print_usage() {
    println!("OBO v{}", VERSION);
    println!();
    println!("Usage:");
    println!("  obo run <file.obo>           Run with the built-in interpreter (full language)");
    println!("  obo <file.obo>               Same as run");
    println!("  obo test <file.obo>          Run @test functions and report results");
    println!("  obo repl                     Interactive shell");
    println!("  obo fmt <file.obo> [-w]      Format source (-w writes in place)");
    println!("  obo doc <file.obo> [-o out]   Generate Markdown documentation");
    println!("  obo lsp                      Start the Language Server (for VS Code)");
    println!("  obo check <file.obo>         Type-check only");
    println!("  obo ir <file.obo>            Print intermediate representation");
    println!("  obo build <file.obo> [opts]  Compile to a native binary (subset of the language)");
    println!("  obo doctor                   Show toolchain info (no network)");
    println!("  obo lex | parse <file>       Lexer / parser debugging");
    println!("  obo version | help");
    println!();
    println!("Build options (zero extra Rust dependencies; uses clang if linking):");
    println!("  -o, --output <exe>   Output executable name (default: a.out)");
    println!("  --emit-ll [path.ll] Save LLVM IR (default: <source>.ll beside .obo)");
    println!("  --no-link, --ll-only Only write .ll; do not run clang");
    println!();
    println!("\"Simple on the surface. Powerful underneath. And a little bit alive.\"");
}

/// Display a runtime error with colored formatting matching the compile-time style.
fn display_runtime_error(path: &str, source: &str, error_msg: &str) {
    let use_color = std::io::IsTerminal::is_terminal(&std::io::stderr());

    let styled = |text: &str, ansi: &str| -> String {
        if use_color {
            format!("{}{}\x1b[0m", ansi, text)
        } else {
            text.to_string()
        }
    };

    let obo_color = "\x1b[1;38;5;214m"; // warm mustard/gold
    let err_color = "\x1b[1;31m";        // bold red
    let blue = "\x1b[1;34m";             // bold blue
    let white_bold = "\x1b[1;37m";       // bold white
    let hint_color = "\x1b[1;32m";       // bold green
    let dim = "\x1b[0;37m";              // dim white

    // Clean up the raw error message — strip "Obo: " prefix and trailing emoji if present
    let clean_msg = error_msg
        .trim()
        .trim_start_matches("Obo: ")
        .trim_start_matches("Obo — ");

    // Try to extract useful context from the error message
    let (category, _emoji, hint) = categorize_runtime_error(clean_msg);

    eprintln!();
    // Header
    eprintln!(
        "{} {} {}",
        styled("Obo:", obo_color),
        styled(clean_msg, white_bold),
        ""
    );
    // Severity tag
    eprintln!(
        "  {}{}",
        styled("error", err_color),
        styled(&format!("[{}]", category), dim),
    );
    // File location
    eprintln!(
        "  {} {}",
        styled("-->", blue),
        styled(&format!("{} (runtime)", path), dim),
    );

    // Try to find a relevant source line if the error mentions a name
    let lines: Vec<&str> = source.lines().collect();
    if let Some((line_num, line_text)) = find_error_context(&lines, clean_msg) {
        let gutter_width = format!("{}", line_num).len().max(4);
        eprintln!(
            "  {} ",
            styled(&format!("{:>gutter_width$} │", ""), blue),
        );
        eprintln!(
            "  {} {}",
            styled(&format!("{:>gutter_width$} │", line_num), blue),
            line_text,
        );
        eprintln!(
            "  {} ",
            styled(&format!("{:>gutter_width$} │", ""), blue),
        );
    }

    // Hint
    if let Some(hint_text) = hint {
        eprintln!(
            "  {} {}",
            styled("  hint:", hint_color),
            styled(&hint_text, "\x1b[0;32m"),
        );
    }

    eprintln!();
    eprintln!(
        "{}",
        styled("Obo: 1 runtime error 💥", err_color),
    );
}

/// Categorize a runtime error message and provide helpful hints
fn categorize_runtime_error(msg: &str) -> (&str, &str, Option<String>) {
    if msg.contains("doesn't have a method") || msg.contains("doesn't have a field") {
        let hint = if msg.contains("null") {
            Some("The value is null — you might be accessing a field or key that doesn't exist. Use `possible/else` to guard.".to_string())
        } else {
            Some("Check that the method name is correct and defined on this type.".to_string())
        };
        ("missing member", "🤨", hint)
    } else if msg.contains("don't see") || msg.contains("anywhere") {
        ("undeclared variable", "👻", Some("Make sure the variable is defined before use, or check for typos.".to_string()))
    } else if msg.contains("not a function") || msg.contains("Can't call") {
        ("not callable", "🤨", Some("This value is not a function or action — you can't call it with ().".to_string()))
    } else if msg.contains("Assertion failed") {
        ("assertion failed", "💥", Some("An assert() condition evaluated to false.".to_string()))
    } else if msg.contains("Division by zero") || msg.contains("divide by zero") {
        ("division by zero", "💥", Some("The divisor is 0. Guard with an if-check before dividing.".to_string()))
    } else if msg.contains("out of bounds") || msg.contains("Index") {
        ("index out of bounds", "😬", Some("The index exceeds the collection size. Check .count before indexing.".to_string()))
    } else if msg.contains("type") && msg.contains("mismatch") {
        ("type mismatch", "🧩", None)
    } else if msg.contains("Stack overflow") || msg.contains("stack overflow") {
        ("stack overflow", "💥", Some("Infinite recursion detected — check your base case.".to_string()))
    } else if msg.contains("panicked") || msg.contains("panic") {
        ("internal error", "💥", None)
    } else {
        ("runtime error", "💥", None)
    }
}

/// Try to find a source line relevant to the error
fn find_error_context<'a>(lines: &[&'a str], msg: &str) -> Option<(usize, &'a str)> {
    // Extract identifiers mentioned in the error that might appear in source
    // e.g. "null doesn't have a method called 'deposit'" → look for "deposit"
    if let Some(start) = msg.find('\'') {
        if let Some(end) = msg[start + 1..].find('\'') {
            let name = &msg[start + 1..start + 1 + end];
            if name.len() >= 2 {
                // Search from the bottom up (runtime errors often come from later code)
                for (i, line) in lines.iter().enumerate().rev() {
                    if line.contains(name) && !line.trim_start().starts_with("//") {
                        return Some((i + 1, line));
                    }
                }
            }
        }
    }
    None
}
