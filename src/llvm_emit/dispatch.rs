//! Generate C glue for `CallMethod` → `obo_native_call_method_i64` (entity + runtime dispatch).

use std::collections::HashMap;

use crate::ir::inst::{IrFunction, IrParamType, IrProgram};

use super::infer::LowType;

fn llvm_symbol(name: &str) -> String {
    name.replace("::", "_")
}

fn c_escape(s: &str) -> String {
    s.replace('\\', "\\\\").replace('"', "\\\"")
}

/// Appended to `obo_rt.c` when linking. Defines `obo_native_call_method_i64` and `extern`s to LLVM symbols.
pub fn generate_obo_native_dispatch_c(ir: &IrProgram, fn_ret: &HashMap<String, LowType>) -> String {

    let mut out = String::new();
    out.push_str("\n/* --- generated native method dispatch (obo build) --- */\n");

    let mut candidates: Vec<&IrFunction> = Vec::new();
    for f in &ir.functions {
        let Some((_actor, _m)) = f.name.split_once("::") else {
            continue;
        };
        // Instance methods only; static `Actor::method` has no `self` and uses direct LLVM `call`.
        if f.params.first().map(|s| s.as_str()) != Some("self") {
            continue;
        }
        let ret = fn_ret.get(&f.name).copied().unwrap_or(LowType::I64);
        if !matches!(ret, LowType::I64 | LowType::Bool) {
            continue;
        }
        let mut ok = true;
        for i in 1..f.params.len() {
            let pt = f.param_types.get(i).copied().unwrap_or(IrParamType::I64);
            if pt.is_pointer() {
                ok = false;
                break;
            }
        }
        if ok {
            candidates.push(f);
        }
    }

    for f in &candidates {
        let sym = llvm_symbol(&f.name);
        out.push_str(&format!("extern int64_t {}(void* self", sym));
        for _ in 1..f.params.len() {
            out.push_str(", int64_t");
        }
        out.push_str(");\n");
    }

    out.push_str(
        "\nint64_t obo_native_call_method_i64(void* entity, const char* method, int64_t argc, int64_t* argv) {\n",
    );
    out.push_str("  const char* t = obo_entity_type_name(entity);\n");

    for f in &candidates {
        let (actor, mname) = f.name.split_once("::").unwrap();
        let sym = llvm_symbol(&f.name);
        let n_args = f.params.len() - 1;
        out.push_str(&format!(
            "  if (strcmp(t, \"{}\") == 0 && strcmp(method, \"{}\") == 0 && argc == {}) {{\n",
            c_escape(actor),
            c_escape(mname),
            n_args
        ));
        out.push_str("    return ");
        out.push_str(&sym);
        out.push_str("(entity");
        for i in 0..n_args {
            out.push_str(&format!(", argv[{}]", i));
        }
        out.push_str(");\n  }\n");
    }

    out.push_str("  (void)entity; (void)method; (void)argv;\n");
    out.push_str("  return 0;\n}\n");
    out
}
