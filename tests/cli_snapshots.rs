use std::fs;
use std::path::{Path, PathBuf};
use std::process::{Command, Output};

fn repo_root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn bin_path() -> &'static str {
    env!("CARGO_BIN_EXE_obo")
}

fn run_obo(args: &[&str]) -> Output {
    Command::new(bin_path())
        .current_dir(repo_root())
        .args(args)
        .output()
        .expect("failed to run obo")
}

fn build_and_run_native(source: &str, artifact_name: &str) -> Output {
    let binary_path = artifact_path(artifact_name);
    if binary_path.exists() {
        fs::remove_file(&binary_path).expect("failed to clear old native artifact");
    }

    let binary_arg = binary_path
        .strip_prefix(repo_root())
        .unwrap_or(binary_path.as_path())
        .to_string_lossy()
        .into_owned();

    let build = run_obo(&["build", source, "-o", &binary_arg]);
    assert!(
        build.status.success(),
        "native build failed: {}",
        normalize(&build.stderr)
    );

    Command::new(&binary_path)
        .current_dir(repo_root())
        .output()
        .expect("failed to run native artifact")
}

fn normalize(text: &[u8]) -> String {
    String::from_utf8_lossy(text).replace("\r\n", "\n")
}

fn snapshot_path(name: &str) -> PathBuf {
    repo_root().join("tests").join("snapshots").join(name)
}

fn assert_snapshot(name: &str, actual: &str) {
    let path = snapshot_path(name);
    if std::env::var("UPDATE_SNAPSHOTS").ok().as_deref() == Some("1") {
        if let Some(parent) = path.parent() {
            fs::create_dir_all(parent).expect("failed to create snapshot directory");
        }
        fs::write(&path, actual).expect("failed to write snapshot");
    }

    let expected = fs::read_to_string(&path)
        .unwrap_or_else(|_| panic!("missing snapshot: {}", path.display()))
        .replace("\r\n", "\n");
    assert_eq!(
        expected.trim_end_matches('\n'),
        actual.trim_end_matches('\n'),
        "snapshot mismatch for {}",
        name
    );
}

fn artifact_path(name: &str) -> PathBuf {
    let dir = repo_root().join("target").join("test-artifacts");
    fs::create_dir_all(&dir).expect("failed to create artifact directory");
    dir.join(name)
}

fn summarize_llvm_ir(ir: &str) -> String {
    let interesting = [
        "define i32 @main",
        " fadd ",
        " sitofp ",
        " call i8* @obo_f64_to_str",
        " call i8* @obo_str_concat",
        " call i8* @obo_task_spawn",
        " call void @obo_task_wait",
        " call void @obo_task_wait_all",
        " call void @obo_print_double",
        " ret i32 ",
    ];

    let mut out = String::new();
    for line in ir.lines() {
        if interesting.iter().any(|needle| line.contains(needle)) {
            out.push_str(line.trim_end());
            out.push('\n');
        }
    }
    out
}

#[test]
fn lexer_snapshot_matches() {
    let output = run_obo(&["lex", "tests/fixtures/lexer_snapshot.obo"]);
    assert!(output.status.success(), "lex failed: {}", normalize(&output.stderr));
    assert_snapshot("lexer_snapshot.txt", &normalize(&output.stdout));
}

#[test]
fn parser_snapshot_matches() {
    let output = run_obo(&["parse", "tests/fixtures/parser_snapshot.obo"]);
    assert!(output.status.success(), "parse failed: {}", normalize(&output.stderr));
    assert_snapshot("parser_snapshot.txt", &normalize(&output.stdout));
}

#[test]
fn checker_diagnostic_snapshot_matches() {
    let output = run_obo(&["check", "tests/fixtures/checker_error.obo"]);
    assert!(!output.status.success(), "check unexpectedly succeeded");
    assert_snapshot("checker_error.txt", &normalize(&output.stderr));
}

#[test]
fn event_runtime_snapshot_matches() {
    let output = run_obo(&["run", "tests/fixtures/event_runtime.obo"]);
    assert!(output.status.success(), "run failed: {}", normalize(&output.stderr));
    assert_snapshot("event_runtime.txt", &normalize(&output.stdout));
}

#[test]
fn task_runtime_snapshot_matches() {
    let output = run_obo(&["run", "tests/fixtures/task_runtime.obo"]);
    assert!(output.status.success(), "run failed: {}", normalize(&output.stderr));
    assert_snapshot("task_runtime.txt", &normalize(&output.stdout));
}

#[test]
fn native_phi_runtime_snapshot_matches() {
    let output = build_and_run_native("tests/fixtures/native_phi_runtime.obo", "native_phi_runtime_bin");
    assert!(output.status.success(), "native run failed: {}", normalize(&output.stderr));
    assert_snapshot("native_phi_runtime.txt", &normalize(&output.stdout));
}

#[test]
fn native_map_entity_runtime_snapshot_matches() {
    let output = build_and_run_native(
        "tests/fixtures/native_map_entity_runtime.obo",
        "native_map_entity_runtime_bin",
    );
    assert!(output.status.success(), "native run failed: {}", normalize(&output.stderr));
    assert_snapshot("native_map_entity_runtime.txt", &normalize(&output.stdout));
}

#[test]
fn native_ir_snapshot_matches() {
    let ll_path = artifact_path("native_parity_snapshot.ll");
    if ll_path.exists() {
        fs::remove_file(&ll_path).expect("failed to clear old ll artifact");
    }

    let ll_arg = ll_path
        .strip_prefix(repo_root())
        .unwrap_or(ll_path.as_path())
        .to_string_lossy()
        .into_owned();

    let output = run_obo(&[
        "build",
        "tests/fixtures/native_parity.obo",
        "--emit-ll",
        &ll_arg,
        "--no-link",
    ]);
    assert!(output.status.success(), "native build failed: {}", normalize(&output.stderr));

    let ir = fs::read_to_string(&ll_path).expect("failed to read emitted llvm ir");
    assert_snapshot("native_parity_ir.txt", &summarize_llvm_ir(&ir));
}

#[test]
fn native_task_ir_snapshot_matches() {
    let ll_path = artifact_path("native_task_snapshot.ll");
    if ll_path.exists() {
        fs::remove_file(&ll_path).expect("failed to clear old ll artifact");
    }

    let ll_arg = ll_path
        .strip_prefix(repo_root())
        .unwrap_or(ll_path.as_path())
        .to_string_lossy()
        .into_owned();

    let output = run_obo(&[
        "build",
        "tests/fixtures/native_task_ir.obo",
        "--emit-ll",
        &ll_arg,
        "--no-link",
    ]);
    assert!(output.status.success(), "native build failed: {}", normalize(&output.stderr));

    let ir = fs::read_to_string(&ll_path).expect("failed to read emitted llvm ir");
    assert_snapshot("native_task_ir.txt", &summarize_llvm_ir(&ir));
}

#[test]
fn snapshot_fixtures_exist() {
    for fixture in [
        "tests/fixtures/lexer_snapshot.obo",
        "tests/fixtures/parser_snapshot.obo",
        "tests/fixtures/checker_error.obo",
        "tests/fixtures/event_runtime.obo",
        "tests/fixtures/task_runtime.obo",
        "tests/fixtures/native_parity.obo",
        "tests/fixtures/native_phi_runtime.obo",
        "tests/fixtures/native_map_entity_runtime.obo",
        "tests/fixtures/native_task_ir.obo",
    ] {
        assert!(Path::new(fixture).exists(), "missing fixture: {}", fixture);
    }
}