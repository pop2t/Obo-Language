use std::collections::{HashMap, HashSet};

use crate::ir::inst::{
    BasicBlock, BinOp, BlockId, Constant, Inst, IrFunction, IrProgram, IrParamType, Operand,
    Reg, UnaryOp,
};

use super::super::infer::{
    extern_fn_ret, infer_function_types, resolve_instance_method, LowType,
};
use super::{llvm_c_array, llvm_fn_ret_ty};

/// Returns true if a call target is guaranteed not to trigger GC (no allocation).
/// This lets us skip GC root registration for functions whose only calls are to
/// pure intrinsics (e.g. Math.sqrt, Math.sin).
fn call_is_gc_safe(name: &str) -> bool {
    name.starts_with("__sys_Math_")
        || name.starts_with("__sys_Convert_")
        || name == "obo_f64_show"
}

fn param_low_type(f: &IrFunction, index: usize) -> LowType {
    if f.params.get(index).map(|s| s.as_str()) == Some("__closure_self") {
        return LowType::Closure;
    }
    if index == 0
        && f.params.get(0).map(|s| s.as_str()) == Some("self")
        && f.name.contains("::")
    {
        let declared = f.param_types.get(0).copied().unwrap_or(IrParamType::I64);
        return match declared {
            IrParamType::F64 => LowType::F64,
            IrParamType::Bool => LowType::Bool,
            IrParamType::I64 => LowType::I64,
            IrParamType::Str
            | IrParamType::List
            | IrParamType::MixedList
            | IrParamType::Map
            | IrParamType::Entity
            | IrParamType::Dyn
            | IrParamType::Closure
            | IrParamType::Task
            | IrParamType::F64List => LowType::Entity,
        };
    }
    match f.param_types.get(index).copied().unwrap_or(IrParamType::I64) {
        IrParamType::I64 => LowType::I64,
        IrParamType::Str => LowType::Str,
        IrParamType::List => LowType::List,
        IrParamType::MixedList => LowType::MixedList,
        IrParamType::F64List => LowType::F64List,
        IrParamType::Map => LowType::Map,
        IrParamType::Entity => LowType::Entity,
        IrParamType::Dyn => LowType::Dyn,
        IrParamType::Bool => LowType::Bool,
        IrParamType::F64 => LowType::F64,
        IrParamType::Closure => LowType::Closure,
        IrParamType::Task => LowType::Task,
    }
}

fn llvm_param_low_type(param_ty: &str) -> Option<LowType> {
    match param_ty.trim() {
        "double" => Some(LowType::F64),
        "i64" => Some(LowType::I64),
        "i8*" => Some(LowType::Dyn),
        _ => None,
    }
}

fn extern_param_low_type(name: &str, index: usize) -> Option<LowType> {
    match name {
        "obo_prompt" | "obo_str_truthy" if index == 0 => Some(LowType::Str),
        "__sys_File_read"
        | "__sys_File_exists"
        | "__sys_File_delete"
        | "__sys_File_readLines"
        | "__sys_Convert_toNumber"
        | "__sys_Convert_toDecimal" if index == 0 => Some(LowType::Str),
        "__sys_File_write" | "__sys_File_append" => {
            if index < 2 { Some(LowType::Str) } else { None }
        }
        "__sys_Convert_toText"
        | "__sys_Convert_toFlag"
        | "__sys_Convert_toChar"
        | "__sys_Time_sleep"
        | "__sys_pointer_alloc"
        | "__sys_pointer_free" if index == 0 => Some(LowType::I64),
        "__sys_mem_load64" | "__sys_mem_load8" | "__sys_mem_load32" if index == 0 => Some(LowType::I64),
        "__sys_mem_store64" | "__sys_mem_store8" | "__sys_mem_store32" if index < 2 => Some(LowType::I64),
        "__sys_mem_copy" | "__sys_mem_zero" if index < 3 => Some(LowType::I64),
        "__sys_Math_abs" | "__sys_Math_sign" | "__sys_Math_floor" | "__sys_Math_ceil"
        | "__sys_Math_round" | "__sys_Math_sqrt" | "__sys_Math_sin" | "__sys_Math_cos"
        | "__sys_Math_tan" | "__sys_Math_asin" | "__sys_Math_acos" | "__sys_Math_atan"
        | "__sys_Math_log" | "__sys_Math_log10" if index == 0 => Some(LowType::F64),
        "__sys_Math_min" | "__sys_Math_max" | "__sys_Math_randomInt" => {
            if index < 2 { Some(LowType::I64) } else { None }
        }
        "__sys_Math_pow" | "__sys_Math_atan2" => {
            if index < 2 { Some(LowType::F64) } else { None }
        }
        "__sys_Math_lerp" | "__sys_Math_clamp" => {
            if index < 3 { Some(LowType::F64) } else { None }
        }
        // TextBuilder: first arg is always the builder pointer (Entity)
        "obo_textbuilder_new" if index == 0 => Some(LowType::I64),
        "obo_textbuilder_append" => match index {
            0 => Some(LowType::Entity),
            1 => Some(LowType::Str),
            _ => None,
        },
        "obo_textbuilder_appendChar" | "obo_textbuilder_appendInt" => match index {
            0 => Some(LowType::Entity),
            1 => Some(LowType::I64),
            _ => None,
        },
        "obo_textbuilder_build" | "obo_textbuilder_toString"
        | "obo_textbuilder_length" | "obo_textbuilder_clear" if index == 0 => Some(LowType::Entity),
        // Arena: first arg is the arena pointer (Entity), second is i64
        "obo_arena_create" if index == 0 => Some(LowType::I64),
        "obo_arena_alloc" => match index {
            0 => Some(LowType::Entity),
            1 => Some(LowType::I64),
            _ => None,
        },
        "obo_arena_reset" | "obo_arena_destroy"
        | "obo_arena_used" | "obo_arena_capacity" if index == 0 => Some(LowType::Entity),
        "obo_arena_write_i64" => match index {
            0 => Some(LowType::I64),
            1 => Some(LowType::I64),
            _ => None,
        },
        "obo_arena_write_f64" => match index {
            0 => Some(LowType::I64),
            1 => Some(LowType::F64),
            _ => None,
        },
        "obo_arena_read_i64" | "obo_arena_read_f64" if index == 0 => Some(LowType::I64),
        // Integer-keyed map helpers
        "obo_map_set_int" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            2 => Some(LowType::I64),
            _ => None,
        },
        "obo_map_set_int_str" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            2 => Some(LowType::Str),
            _ => None,
        },
        "obo_map_set_int_boxed" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            2 => Some(LowType::Dyn),
            _ => None,
        },
        "obo_map_get_int" | "obo_map_has_int" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            _ => None,
        },
        "obo_map_get_int_boxed" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            _ => None,
        },
        "obo_map_remove_int" => match index {
            0 => Some(LowType::Map),
            1 => Some(LowType::I64),
            _ => None,
        },
        _ => None,
    }
}

fn rewrite_phi_blocks(blocks: &[BasicBlock]) -> Vec<BasicBlock> {
    let mut edge_copies: HashMap<(BlockId, BlockId), Vec<(Reg, Operand)>> = HashMap::new();
    for block in blocks {
        for inst in &block.insts {
            if let Inst::Phi(dst, arms) = inst {
                for (operand, pred) in arms {
                    edge_copies
                        .entry((*pred, block.id))
                        .or_default()
                        .push((*dst, operand.clone()));
                }
            }
        }
    }

    let mut next_block_id = blocks.iter().map(|block| block.id.0).max().unwrap_or(0) + 1;
    let mut rewritten = Vec::with_capacity(blocks.len());

    for block in blocks {
        let mut insts: Vec<Inst> = Vec::new();
        let mut lines: Vec<u32> = Vec::new();
        for (i, inst) in block.insts.iter().enumerate() {
            if !matches!(inst, Inst::Phi(..)) {
                insts.push(inst.clone());
                lines.push(*block.lines.get(i).unwrap_or(&0));
            }
        }

        let terminator = if matches!(insts.last(), Some(Inst::Jump(_) | Inst::Branch(..) | Inst::Return(_))) {
            lines.pop();
            insts.pop()
        } else {
            None
        };

        match terminator {
            Some(Inst::Jump(target)) => {
                if let Some(copies) = edge_copies.get(&(block.id, target)) {
                    for (dst, operand) in copies {
                        insts.push(Inst::Copy(*dst, operand.clone()));
                        lines.push(0);
                    }
                }
                insts.push(Inst::Jump(target));
                lines.push(0);
                rewritten.push(BasicBlock { id: block.id, insts, lines });
            }
            Some(Inst::Branch(cond, then_block, else_block)) => {
                let mut bridge_blocks = Vec::new();

                let rewritten_then = if let Some(copies) = edge_copies.get(&(block.id, then_block)) {
                    let bridge_id = BlockId(next_block_id);
                    next_block_id += 1;
                    let mut bridge_insts = Vec::with_capacity(copies.len() + 1);
                    for (dst, operand) in copies {
                        bridge_insts.push(Inst::Copy(*dst, operand.clone()));
                    }
                    bridge_insts.push(Inst::Jump(then_block));
                    let n = bridge_insts.len();
                    bridge_blocks.push(BasicBlock {
                        id: bridge_id,
                        insts: bridge_insts,
                        lines: vec![0; n],
                    });
                    bridge_id
                } else {
                    then_block
                };

                let rewritten_else = if let Some(copies) = edge_copies.get(&(block.id, else_block)) {
                    let bridge_id = BlockId(next_block_id);
                    next_block_id += 1;
                    let mut bridge_insts = Vec::with_capacity(copies.len() + 1);
                    for (dst, operand) in copies {
                        bridge_insts.push(Inst::Copy(*dst, operand.clone()));
                    }
                    bridge_insts.push(Inst::Jump(else_block));
                    let n = bridge_insts.len();
                    bridge_blocks.push(BasicBlock {
                        id: bridge_id,
                        insts: bridge_insts,
                        lines: vec![0; n],
                    });
                    bridge_id
                } else {
                    else_block
                };

                insts.push(Inst::Branch(cond, rewritten_then, rewritten_else));
                lines.push(0);
                rewritten.push(BasicBlock { id: block.id, insts, lines });
                rewritten.extend(bridge_blocks);
            }
            Some(other) => {
                insts.push(other);
                lines.push(0);
                rewritten.push(BasicBlock { id: block.id, insts, lines });
            }
            None => {
                rewritten.push(BasicBlock { id: block.id, insts, lines });
            }
        }
    }

    rewritten
}

/// Compute which MakeEntity registers can be stack-allocated (non-escaping).
/// A register "escapes" if it is: returned, passed as a call arg, stored to a
/// variable that itself escapes, or used as a field value in another entity.
fn compute_non_escaping_entities(blocks: &[BasicBlock]) -> HashSet<u32> {
    // Step 1: collect all MakeEntity destination registers
    let mut entity_regs: HashSet<u32> = HashSet::new();
    for block in blocks {
        for inst in &block.insts {
            if let Inst::MakeEntity(r, _, _) = inst {
                entity_regs.insert(r.0);
            }
        }
    }
    if entity_regs.is_empty() {
        return HashSet::new();
    }

    // Step 2: build reg→var and var→reg maps (for Store/Load tracking)
    let mut reg_to_var: HashMap<u32, HashSet<String>> = HashMap::new();
    let mut var_to_reg: HashMap<String, HashSet<u32>> = HashMap::new();
    for block in blocks {
        for inst in &block.insts {
            if let Inst::Store(name, Operand::Reg(r)) = inst {
                if entity_regs.contains(&r.0) {
                    reg_to_var.entry(r.0).or_default().insert(name.clone());
                    var_to_reg.entry(name.clone()).or_default().insert(r.0);
                }
            }
            // Load from var into reg propagates identity
            if let Inst::Load(_r, name) = inst {
                if let Some(orig_regs) = var_to_reg.get(name) {
                    for &orig in orig_regs {
                        if entity_regs.contains(&orig) {
                            reg_to_var.entry(orig).or_default().insert(name.clone());
                        }
                    }
                }
            }
        }
    }

    // Step 3: mark escaping registers
    let mut escaping: HashSet<u32> = HashSet::new();

    let _mark_reg_escaping = |r: u32, escaping: &mut HashSet<u32>| {
        if entity_regs.contains(&r) {
            escaping.insert(r);
        }
    };

    let mark_operand_escaping = |op: &Operand, escaping: &mut HashSet<u32>| {
        if let Operand::Reg(r) = op {
            if entity_regs.contains(&r.0) {
                escaping.insert(r.0);
            }
        }
    };

    for block in blocks {
        for inst in &block.insts {
            match inst {
                // Returned → escapes
                Inst::Return(ops) => {
                    for op in ops {
                        mark_operand_escaping(op, &mut escaping);
                    }
                }
                // Passed as call argument → escapes
                Inst::Call(_, _, args) => {
                    for a in args {
                        mark_operand_escaping(a, &mut escaping);
                    }
                }
                Inst::CallMethod(_, obj, _, args) => {
                    mark_operand_escaping(obj, &mut escaping);
                    for a in args {
                        mark_operand_escaping(a, &mut escaping);
                    }
                }
                Inst::CallClosure(_, _, args) => {
                    for a in args {
                        mark_operand_escaping(a, &mut escaping);
                    }
                }
                // Used as field value in another entity → escapes
                Inst::MakeEntity(_, _, fields) => {
                    for (_, v) in fields {
                        mark_operand_escaping(v, &mut escaping);
                    }
                }
                Inst::MakePackedEntity(_, _, fields) => {
                    for (_, v) in fields {
                        mark_operand_escaping(v, &mut escaping);
                    }
                }
                // Stored into a list/map → escapes
                Inst::MakeList(_, ops) => {
                    for o in ops {
                        mark_operand_escaping(o, &mut escaping);
                    }
                }
                Inst::MakeMap(_, pairs) => {
                    for (k, v) in pairs {
                        mark_operand_escaping(k, &mut escaping);
                        mark_operand_escaping(v, &mut escaping);
                    }
                }
                // SetIndex/SetField with entity as value → escapes
                Inst::SetIndex(_, _, val) => {
                    mark_operand_escaping(val, &mut escaping);
                }
                Inst::SetField(_, _, val) => {
                    mark_operand_escaping(val, &mut escaping);
                }
                // RunTask → escapes
                Inst::RunTask(_, op) => {
                    mark_operand_escaping(op, &mut escaping);
                }
                // MakeClosure captures → escape
                Inst::MakeClosure(_, _, caps) => {
                    for c in caps {
                        mark_operand_escaping(c, &mut escaping);
                    }
                }
                _ => {}
            }
        }
    }

    // Step 4: propagate escaping through var aliases
    // If a reg escapes, all regs stored to the same var also escape.
    let mut changed = true;
    while changed {
        changed = false;
        for (&r, vars) in &reg_to_var {
            if escaping.contains(&r) {
                for var in vars {
                    if let Some(regs) = var_to_reg.get(var) {
                        for &other in regs {
                            if entity_regs.contains(&other) && !escaping.contains(&other) {
                                escaping.insert(other);
                                changed = true;
                            }
                        }
                    }
                }
            }
        }
        // Reverse: if a var's reg escapes, propagate
        for (_, regs) in &var_to_reg {
            if regs.iter().any(|r| escaping.contains(r)) {
                for &r in regs {
                    if entity_regs.contains(&r) && !escaping.contains(&r) {
                        escaping.insert(r);
                        changed = true;
                    }
                }
            }
        }
    }

    // Return non-escaping = entity_regs - escaping
    entity_regs.difference(&escaping).copied().collect()
}

pub(super) fn emit_function(
    f: &IrFunction,
    ir: &IrProgram,
    string_table: &[String],
    fn_ret: &HashMap<String, LowType>,
    bridge_ret_overrides: &HashMap<String, String>,
    closure_param_returns: &HashMap<String, Vec<Option<LowType>>>,
    consistent_field_types: &HashMap<String, LowType>,
    subprogram_id: Option<u32>,
    next_md_id: &mut u32,
    no_gc: bool,
) -> Result<String, String> {
    let (mut reg_ty, mut var_ty) = infer_function_types(f, ir, fn_ret);
    let emitted_blocks = rewrite_phi_blocks(&f.blocks);

    // Escape analysis: identify MakeEntity registers that never escape the function.
    let _non_escaping = compute_non_escaping_entities(&emitted_blocks);

    let mut closure_handle_ret_regs: HashMap<Reg, LowType> = HashMap::new();
    let mut closure_handle_ret_vars: HashMap<String, LowType> = HashMap::new();
    if let Some(param_returns) = closure_param_returns.get(&f.name) {
        for (index, maybe_ret) in param_returns.iter().enumerate() {
            let Some(ret_ty) = maybe_ret else {
                continue;
            };
            if f.param_types.get(index).copied() == Some(IrParamType::Closure) {
                closure_handle_ret_regs.insert(Reg(index as u32), *ret_ty);
                if let Some(name) = f.params.get(index) {
                    closure_handle_ret_vars.insert(name.clone(), *ret_ty);
                }
            }
        }
    }
    for _ in 0..4 {
        for block in &emitted_blocks {
            for inst in &block.insts {
                match inst {
                    Inst::Copy(dst, Operand::Reg(src)) => {
                        if let Some(ret_ty) = closure_handle_ret_regs.get(src).copied() {
                            closure_handle_ret_regs.insert(*dst, ret_ty);
                        }
                    }
                    Inst::Load(r, name) => {
                        if let Some(ret_ty) = closure_handle_ret_vars.get(name).copied() {
                            closure_handle_ret_regs.insert(*r, ret_ty);
                        }
                        if let Some(var_ret) = var_ty.get(name).copied() {
                            if let Some(slot) = reg_ty.get_mut(r.0 as usize) {
                                *slot = Some(var_ret);
                            }
                        }
                    }
                    Inst::Store(name, Operand::Reg(src)) => {
                        if let Some(ret_ty) = closure_handle_ret_regs.get(src).copied() {
                            closure_handle_ret_vars.insert(name.clone(), ret_ty);
                        }
                        if let Some(ret_ty) = reg_ty.get(src.0 as usize).and_then(|ty| *ty) {
                                // Don't downgrade a wider type to a narrower one.
                            // e.g. MixedList→List can happen when a variable is
                            // initialized as [] (List) and later upgraded by .add(str).
                            let dominated = match (var_ty.get(name).copied(), ret_ty) {
                                (Some(LowType::MixedList), LowType::List) => true,
                                (Some(LowType::F64List), LowType::List) => true,
                                (Some(LowType::Dyn), LowType::I64 | LowType::Bool) => true,
                                // Don't narrow Dyn to a specific container type:
                                // a variable assigned Dyn in one block and
                                // MixedList/List/Map in another must stay Dyn.
                                (Some(LowType::Dyn), LowType::MixedList | LowType::List | LowType::Map) => true,
                                _ => false,
                            };
                            if !dominated {
                                var_ty.insert(name.clone(), ret_ty);
                            }
                        }
                    }
                    Inst::CallClosure(r, Operand::Reg(src), _) => {
                        if let Some(ret_ty) = closure_handle_ret_regs.get(src).copied() {
                            if let Some(slot) = reg_ty.get_mut(r.0 as usize) {
                                *slot = Some(ret_ty);
                            }
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    let max_r = reg_ty.len() as u32;

    let mut vars: HashSet<String> = HashSet::new();
    for b in &emitted_blocks {
        for inst in &b.insts {
            if let Inst::Load(_, n) | Inst::Store(n, _) = inst {
                vars.insert(n.clone());
            }
        }
    }

    let default_ret = llvm_fn_ret_ty(&f.name, fn_ret);
    let ret_llvm = if f.is_interrupt {
        "void"
    } else if f.is_export {
        if let Some(ref ert) = f.export_ret_type {
            ert.as_str()
        } else {
            default_ret
        }
    } else {
        default_ret
    };
    let is_closure_fn = f.name.starts_with("__closure_");

    let mut params = String::new();
    for i in 0..f.params.len() {
        if i > 0 {
            params.push_str(", ");
        }
        if f.is_export && i < f.export_param_types.len() {
            params.push_str(&format!("{} %arg{}", f.export_param_types[i], i));
        } else {
            let pt = if is_closure_fn && i > 0 {
                LowType::I64
            } else {
                param_low_type(f, i)
            };
            params.push_str(&format!("{} %arg{}", pt.llvm(), i));
        }
    }

    // Functions callable from the C runtime (dispatch table, main) need external linkage;
    // everything else is `internal` so LLVM can inline across call boundaries.
    // @export functions get external linkage for C ABI compatibility.
    // @interrupt functions get external linkage + naked attribute for bare-metal ISRs.
    let is_dispatch_method = f.name.contains("::")
        && f.params.first().map(|s| s.as_str()) == Some("self");
    let linkage = if f.name == "main" || is_dispatch_method || f.is_export || f.is_interrupt {
        ""
    } else {
        "internal "
    };

    let fn_attrs = if f.is_interrupt {
        " naked noinline"
    } else {
        ""
    };

    let mut s = String::new();
    let dbg_ref = if let Some(sp) = subprogram_id {
        format!(" !dbg !{}", sp)
    } else {
        String::new()
    };
    s.push_str(&format!(
        "define {}{} @{}({}){}{} {{\n",
        linkage,
        ret_llvm,
        sanitize_global(&f.name),
        params,
        fn_attrs,
        dbg_ref,
    ));
    s.push_str("entry:\n");

    for r in 0..max_r {
        let ty = reg_ty
            .get(r as usize)
            .and_then(|x| *x)
            .unwrap_or(LowType::I64);
        s.push_str(&format!("  %reg_{}_ptr = alloca {}\n", r, ty.llvm()));
    }
    for v in &vars {
        let ty = var_ty.get(v).copied().unwrap_or(LowType::I64);
        s.push_str(&format!(
            "  %var_{}_ptr = alloca {}\n",
            sanitize_name(v),
            ty.llvm()
        ));
    }

    for (i, _) in f.params.iter().enumerate() {
        let semantic_ty = reg_ty
            .get(i)
            .and_then(|ty| *ty)
            .unwrap_or_else(|| param_low_type(f, i));
        if is_closure_fn && i > 0 {
            match semantic_ty {
                LowType::I64 | LowType::Bool => {
                    s.push_str(&format!("  store i64 %arg{}, i64* %reg_{}_ptr\n", i, i));
                }
                LowType::F64 => {
                    let bits = format!("%closure_arg_bits_{}", i);
                    s.push_str(&format!("  {} = bitcast i64 %arg{} to double\n", bits, i));
                    s.push_str(&format!("  store double {}, double* %reg_{}_ptr\n", bits, i));
                }
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    let ptr = format!("%closure_arg_ptr_{}", i);
                    s.push_str(&format!("  {} = inttoptr i64 %arg{} to i8*\n", ptr, i));
                    s.push_str(&format!("  store i8* {}, i8** %reg_{}_ptr\n", ptr, i));
                }
            }
            continue;
        }
        match param_low_type(f, i) {
            LowType::I64 | LowType::Bool => {
                if f.is_export && i < f.export_param_types.len() {
                    let ept = &f.export_param_types[i];
                    match ept.as_str() {
                        "i8" | "i16" | "i32" => {
                            // Sign-extend narrow C int to i64
                            let ext = format!("%arg{}_sext", i);
                            s.push_str(&format!("  {} = sext {} %arg{} to i64\n", ext, ept, i));
                            s.push_str(&format!("  store i64 {}, i64* %reg_{}_ptr\n", ext, i));
                        }
                        "i8*" => {
                            // Pointer → i64 (ptrtoint)
                            let cast = format!("%arg{}_ptoi", i);
                            s.push_str(&format!("  {} = ptrtoint i8* %arg{} to i64\n", cast, i));
                            s.push_str(&format!("  store i64 {}, i64* %reg_{}_ptr\n", cast, i));
                        }
                        "float" => {
                            // float → double (fpext)
                            let ext = format!("%arg{}_fext", i);
                            s.push_str(&format!("  {} = fpext float %arg{} to double\n", ext, i));
                            s.push_str(&format!("  store double {}, double* %reg_{}_ptr\n", ext, i));
                        }
                        _ => {
                            s.push_str(&format!("  store i64 %arg{}, i64* %reg_{}_ptr\n", i, i));
                        }
                    }
                } else {
                    s.push_str(&format!("  store i64 %arg{}, i64* %reg_{}_ptr\n", i, i));
                }
            }
            LowType::F64 => {
                s.push_str(&format!(
                    "  store double %arg{}, double* %reg_{}_ptr\n",
                    i, i
                ));
            }
            LowType::Str
            | LowType::List
            | LowType::Map
            | LowType::Entity
            | LowType::Dyn
            | LowType::Closure
            | LowType::Task
            | LowType::MixedList
            | LowType::F64List => {
                s.push_str(&format!("  store i8* %arg{}, i8** %reg_{}_ptr\n", i, i));
            }
        }
    }

    // ----- GC root registration -----
    // Root named variables unconditionally (they persist across the function).
    // For temporary registers, only root those that hold pointer types and are
    // live across a Call/CallMethod/CallClosure (which might trigger GC).
    let mut gc_root_count = 0i64;

    // Pre-scan: does the function contain ANY instruction that could trigger GC?
    let fn_has_gc_call = !no_gc && emitted_blocks.iter().any(|b| {
        b.insts.iter().any(|inst| match inst {
            Inst::Call(_, name, _) => !call_is_gc_safe(name),
            Inst::CallMethod(..) | Inst::CallClosure(..) => true,
            Inst::Show(_) => true,
            Inst::MakeEntity(..) | Inst::MakePackedEntity(..) => true,
            Inst::MakeList(..) | Inst::MakeMap(..) | Inst::MakeClosure(..) => true,
            _ => false,
        })
    });

    // Compute which pointer registers need rooting: ones live across a call.
    let needs_root = {
        let mut needs = HashSet::new();
        // Collect all register reads/writes and identify call boundaries.
        // A register needs rooting if it's written before AND read after any Call.
        let mut defined_before_call: HashSet<u32> = HashSet::new();
        let mut seen_call = false;
        for block in &emitted_blocks {
            defined_before_call.clear();
            seen_call = false;
            for inst in &block.insts {
                // Collect operand reads — if seen_call and reg was defined before, it needs root
                let mut check_operand = |op: &Operand| {
                    if let Operand::Reg(r) = op {
                        if seen_call && defined_before_call.contains(&r.0) {
                            needs.insert(r.0);
                        }
                    }
                };
                match inst {
                    Inst::Copy(_, op) | Inst::UnaryOp(_, _, op)
                    | Inst::Show(op) | Inst::Store(_, op) => { check_operand(op); }
                    Inst::BinOp(_, _, l, r) | Inst::SetField(l, _, r)
                    | Inst::GetIndex(_, l, r) => { check_operand(l); check_operand(r); }
                    Inst::SetIndex(a, b, c) => { check_operand(a); check_operand(b); check_operand(c); }
                    Inst::GetField(_, op, _) => { check_operand(op); }
                    Inst::Call(_, _, args) => {
                        for a in args { check_operand(a); }
                    }
                    Inst::CallMethod(_, obj, _, args) => {
                        check_operand(obj);
                        for a in args { check_operand(a); }
                    }
                    Inst::CallClosure(_, cls, args) => {
                        check_operand(cls);
                        for a in args { check_operand(a); }
                    }
                    Inst::MakeList(_, ops) => { for o in ops { check_operand(o); } }
                    Inst::MakeMap(_, pairs) => {
                        for (k, v) in pairs { check_operand(k); check_operand(v); }
                    }
                    Inst::MakeEntity(_, _, fields) => {
                        for (_, v) in fields { check_operand(v); }
                    }
                    Inst::MakePackedEntity(_, _, fields) => {
                        for (_, v) in fields { check_operand(v); }
                    }
                    Inst::MakeClosure(_, _, caps) => { for c in caps { check_operand(c); } }
                    Inst::Return(ops) => { for o in ops { check_operand(o); } }
                    Inst::Branch(op, _, _) => { check_operand(op); }
                    Inst::Phi(_, pairs) => { for (op, _) in pairs { check_operand(op); } }
                    Inst::RunTask(_, op) | Inst::WaitTask(op) => { check_operand(op); }
                    _ => {}
                }
                // Record destination register as defined
                match inst {
                    Inst::Const(r, _) | Inst::Copy(r, _) | Inst::BinOp(r, _, _, _)
                    | Inst::UnaryOp(r, _, _) | Inst::Load(r, _)
                    | Inst::GetField(r, _, _) | Inst::GetIndex(r, _, _)
                    | Inst::MakeList(r, _) | Inst::MakeMap(r, _) | Inst::MakeEntity(r, _, _)
                    | Inst::MakePackedEntity(r, _, _)
                    | Inst::MakeClosure(r, _, _) | Inst::Phi(r, _) | Inst::RunTask(r, _) => {
                        defined_before_call.insert(r.0);
                    }
                    Inst::Call(r, name, _) => {
                        defined_before_call.insert(r.0);
                        if !call_is_gc_safe(name) {
                            seen_call = true;
                        }
                    }
                    Inst::CallMethod(r, _, _, _) | Inst::CallClosure(r, _, _) => {
                        defined_before_call.insert(r.0);
                        seen_call = true;
                    }
                    _ => {}
                }
                // Show can trigger GC via string formatting
                if matches!(inst, Inst::Show(_)) {
                    seen_call = true;
                }
            }
        }
        needs
    };

    if fn_has_gc_call {
        let mut root_slots: Vec<String> = Vec::new();
        for r in 0..max_r {
            let ty = reg_ty
                .get(r as usize)
                .and_then(|x| *x)
                .unwrap_or(LowType::I64);
            if ty.is_ptr() && needs_root.contains(&r) {
                root_slots.push(format!("%reg_{}_ptr", r));
                gc_root_count += 1;
            }
        }
        for v in &vars {
            let ty = var_ty.get(v).copied().unwrap_or(LowType::I64);
            if ty.is_ptr() {
                root_slots.push(format!("%var_{}_ptr", sanitize_name(v)));
                gc_root_count += 1;
            }
        }
        if gc_root_count > 0 {
            if gc_root_count <= 3 {
                // For small counts, individual calls are fine (less setup overhead).
                for slot in &root_slots {
                    s.push_str(&format!(
                        "  call void @obo_gc_push_root(i8** {})\n",
                        slot
                    ));
                }
            } else {
                // Bulk push: alloca an array of i8** pointers, store all roots, call once.
                s.push_str(&format!(
                    "  %gc_root_arr = alloca i8**, i64 {}\n",
                    gc_root_count
                ));
                for (i, slot) in root_slots.iter().enumerate() {
                    let gep = format!("%gc_root_gep_{}", i);
                    s.push_str(&format!(
                        "  {} = getelementptr i8**, i8*** %gc_root_arr, i64 {}\n",
                        gep, i
                    ));
                    s.push_str(&format!(
                        "  store i8** {}, i8*** {}\n",
                        slot, gep
                    ));
                }
                s.push_str(&format!(
                    "  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 {})\n",
                    gc_root_count
                ));
            }
        }
    } // end !no_gc

    let block_names: HashMap<BlockId, String> = emitted_blocks
        .iter()
        .map(|b| (b.id, format!("{}_b{}", sanitize_global(&f.name), b.id.0)))
        .collect();

    // Shadow call stack: push frame at function entry (debug builds).
    if subprogram_id.is_some() {
        // Add function name to string table for stack trace.
        let fn_display = f.name.replace("::", ".");
        let name_bytes = fn_display.as_bytes();
        let name_len = name_bytes.len() + 1; // +1 for null terminator
        let name_global = format!("@obo.dbg.fn.{}", sanitize_global(&f.name));
        // We emit the global inline. It will appear before the function body in the output,
        // but LLVM handles forward references. Instead, use a private global approach
        // where the string is declared inside the function via a constant expression.
        s.push_str(&format!(
            "  call void @obo_frame_push(i8* getelementptr inbounds ([{} x i8], [{} x i8]* {}, i64 0, i64 0), i32 {})\n",
            name_len, name_len, name_global, f.start_line
        ));
        // Also emit signal handler install at start of main.
        if f.name == "main" {
            s.push_str("  call void @obo_install_signal_handlers()\n");
        }
    }

    // In no-gc mode, pause the GC at the start of main so no collection ever triggers.
    if no_gc && f.name == "main" {
        s.push_str("  call void @obo_gc_pause()\n");
    }

    if emitted_blocks.is_empty() {
        s.push_str("  ret i32 0\n}\n");
        return Ok(s);
    }

    let mut tmp = 0u32;
    let mut entity_ptr_cache: HashMap<String, String> = HashMap::new();
    let mut reg_source_var: HashMap<u32, String> = HashMap::new();
    let mut packed_reg_types: HashMap<u32, String> = HashMap::new();
    let mut packed_var_types: HashMap<String, String> = HashMap::new();

    // TCO: detect tail-call positions — Call(r,...) immediately followed by Return([Reg(r)])
    // in the same basic block, for non-main functions only.
    let tail_call_regs: HashSet<u32> = if f.name != "main" && gc_root_count == 0 {
        let mut tails = HashSet::new();
        for block in &emitted_blocks {
            let insts = &block.insts;
            if insts.len() >= 2 {
                let last_idx = insts.len() - 1;
                if let Inst::Return(ops) = &insts[last_idx] {
                    if ops.len() == 1 {
                        if let Operand::Reg(ret_reg) = &ops[0] {
                            if let Inst::Call(call_reg, _, _) = &insts[last_idx - 1] {
                                if call_reg.0 == ret_reg.0 {
                                    tails.insert(call_reg.0);
                                }
                            }
                        }
                    }
                }
            }
        }
        tails
    } else {
        HashSet::new()
    };

    // Build DILocation metadata IDs for each unique source line (when debug info enabled).
    let mut line_to_md: HashMap<u32, u32> = HashMap::new();
    if subprogram_id.is_some() {
        for block in &emitted_blocks {
            for &line in &block.lines {
                if line > 0 && !line_to_md.contains_key(&line) {
                    line_to_md.insert(line, *next_md_id);
                    *next_md_id += 1;
                }
            }
        }
    }

    for (bi, block) in emitted_blocks.iter().enumerate() {
        if bi > 0 {
            s.push_str(&format!("{}:\n", block_names[&block.id]));
        }
        entity_ptr_cache.clear();
        reg_source_var.clear();
        for (ii, inst) in block.insts.iter().enumerate() {
            let before_len = s.len();
            emit_inst(
                &mut s,
                &mut tmp,
                f,
                ir,
                inst,
                &reg_ty,
                &var_ty,
                string_table,
                &block_names,
                fn_ret,
                gc_root_count,
                bridge_ret_overrides,
                &mut entity_ptr_cache,
                &mut reg_source_var,
                consistent_field_types,
                &mut packed_reg_types,
                &mut packed_var_types,
                &tail_call_regs,
            )?;

            // Annotate emitted LLVM instructions with !dbg metadata.
            if let Some(_sp) = subprogram_id {
                let line = *block.lines.get(ii).unwrap_or(&0);
                if line > 0 {
                    if let Some(&md) = line_to_md.get(&line) {
                        // Splice `, !dbg !N` before each `\n` in the newly emitted text
                        // that starts with `  ` (indicating an instruction, not a label).
                        let new_text = s[before_len..].to_string();
                        s.truncate(before_len);
                        let dbg_suffix = format!(", !dbg !{}", md);
                        for raw_line in new_text.split('\n') {
                            if raw_line.starts_with("  ") && !raw_line.trim_start().starts_with(';') {
                                // Don't double-annotate lines already containing !dbg
                                if raw_line.contains("!dbg") {
                                    s.push_str(raw_line);
                                } else {
                                    s.push_str(raw_line);
                                    s.push_str(&dbg_suffix);
                                }
                                s.push('\n');
                            } else if !raw_line.is_empty() {
                                s.push_str(raw_line);
                                s.push('\n');
                            }
                        }
                    }
                }
            }
        }
    }

    if !s.contains("\n  ret ") {
        if gc_root_count > 0 {
            s.push_str(&format!(
                "  call void @obo_gc_pop_roots(i64 {})\n",
                gc_root_count
            ));
        }
        if f.name == "main" {
            s.push_str("  call void @obo_arena_free_all()\n");
            s.push_str("  ret i32 0\n");
        } else {
            match fn_ret.get(&f.name).copied().unwrap_or(LowType::I64) {
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    s.push_str("  ret i8* null\n");
                }
                LowType::F64 => s.push_str("  ret double 0.0\n"),
                LowType::I64 | LowType::Bool => s.push_str("  ret i64 0\n"),
            }
        }
    }

    // Shadow call stack: inject obo_frame_pop() before every ret instruction.
    if subprogram_id.is_some() {
        let original = std::mem::take(&mut s);
        s = String::with_capacity(original.len() + 256);
        for line in original.split('\n') {
            let trimmed = line.trim();
            if trimmed.starts_with("ret ") {
                s.push_str("  call void @obo_frame_pop()\n");
            }
            s.push_str(line);
            s.push('\n');
        }
        // Remove trailing extra newline from split
        if s.ends_with("\n\n") {
            s.pop();
        }
    }

    s.push_str("}\n");

    // Append DILocation metadata entries for this function.
    if let Some(sp) = subprogram_id {
        let mut entries: Vec<(u32, u32)> = line_to_md.into_iter().collect();
        entries.sort_by_key(|&(_, md)| md);
        for (line, md) in entries {
            s.push_str(&format!(
                "!{} = !DILocation(line: {}, column: 0, scope: !{})\n",
                md, line, sp
            ));
        }
    }

    Ok(s)
}

fn sanitize_name(s: &str) -> String {
    s.chars()
        .map(|c| if c.is_alphanumeric() || c == '_' { c } else { '_' })
        .collect()
}

fn sanitize_global(s: &str) -> String {
    if s.contains("::") {
        s.replace("::", "_")
    } else {
        s.to_string()
    }
}

fn operand_is_null(op: &Operand) -> bool {
    matches!(op, Operand::Const(Constant::Null))
}

fn preferred_dyn_operand_type(op: BinOp, other: LowType) -> Option<LowType> {
    use BinOp::*;
    match op {
        Concat => Some(LowType::Str),
        Add => match other {
            LowType::Str => Some(LowType::Str),
            LowType::F64 => Some(LowType::F64),
            LowType::I64 | LowType::Bool => Some(LowType::I64),
            _ => None,
        },
        Sub | Mul | Mod => match other {
            LowType::F64 => Some(LowType::F64),
            LowType::I64 | LowType::Bool => Some(LowType::I64),
            _ => None,
        },
        Div => match other {
            LowType::F64 => Some(LowType::F64),
            LowType::I64 | LowType::Bool => Some(LowType::I64),
            _ => None,
        },
        Eq | NotEq | Less | Greater | LessEq | GreaterEq => match other {
            LowType::Str => Some(LowType::Str),
            LowType::F64 => Some(LowType::F64),
            LowType::I64 | LowType::Bool => Some(LowType::I64),
            _ => None,
        },
        And | Or => Some(LowType::Bool),
        BitAnd | BitOr | BitXor | Shl | Shr => match other {
            LowType::I64 | LowType::Bool => Some(LowType::I64),
            _ => None,
        },
    }
}

fn emit_truthy_i64(
    s: &mut String,
    tmp: &mut u32,
    value: &str,
    ty: LowType,
) -> Result<String, String> {
    match ty {
        LowType::I64 | LowType::Bool => {
            let cmp = fresh_tmp(tmp);
            s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", cmp, value));
            let ext = fresh_tmp(tmp);
            s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
            Ok(ext)
        }
        LowType::F64 => {
            let cmp = fresh_tmp(tmp);
            s.push_str(&format!("  {} = fcmp une double {}, 0.0\n", cmp, value));
            let ext = fresh_tmp(tmp);
            s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
            Ok(ext)
        }
        LowType::Str => {
            let out = fresh_tmp(tmp);
            s.push_str(&format!("  {} = call i64 @obo_str_truthy(i8* {})\n", out, value));
            Ok(out)
        }
        LowType::Dyn => {
            let out = fresh_tmp(tmp);
            s.push_str(&format!("  {} = call i64 @obo_value_truthy(i8* {})\n", out, value));
            Ok(out)
        }
        LowType::List => {
            // Inline list_len: OboList.len at offset 0
            let len_ptr = fresh_tmp(tmp);
            s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, value));
            let len = fresh_tmp(tmp);
            s.push_str(&format!("  {} = load i64, i64* {}\n", len, len_ptr));
            let cmp = fresh_tmp(tmp);
            s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", cmp, len));
            let ext = fresh_tmp(tmp);
            s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
            Ok(ext)
        }
        LowType::MixedList | LowType::F64List => {
            // Inline mixed_list_len: OboMixedList.len at offset 0
            let len_ptr = fresh_tmp(tmp);
            s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, value));
            let len = fresh_tmp(tmp);
            s.push_str(&format!("  {} = load i64, i64* {}\n", len, len_ptr));
            let cmp = fresh_tmp(tmp);
            s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", cmp, len));
            let ext = fresh_tmp(tmp);
            s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
            Ok(ext)
        }
        LowType::Map | LowType::Entity | LowType::Closure | LowType::Task => {
            let cmp = fresh_tmp(tmp);
            s.push_str(&format!("  {} = icmp ne i8* {}, null\n", cmp, value));
            let ext = fresh_tmp(tmp);
            s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
            Ok(ext)
        }
    }
}

/// Convert a List, MixedList, Map, or Entity pointer to an i8* string via the C runtime formatters.
fn emit_heap_to_str(
    s: &mut String,
    tmp: &mut u32,
    value: &str,
    ty: LowType,
) -> Result<String, String> {
    let func = match ty {
        LowType::List | LowType::MixedList => "obo_format_list_string",
        LowType::Map => "obo_format_map_string",
        LowType::Entity => "obo_format_entity_string",
        _ => return Err(format!("emit_heap_to_str: unsupported type {:?}", ty)),
    };
    let out = fresh_tmp(tmp);
    s.push_str(&format!("  {} = call i8* @{}(i8* {})\n", out, func, value));
    Ok(out)
}

fn emit_object_store_call(
    s: &mut String,
    tmp: &mut u32,
    prefix: &str,
    obj_val: &str,
    key_ptr: &str,
    value_op: &Operand,
    value_val: &str,
    value_ty: LowType,
) -> Result<(), String> {
    if operand_is_null(value_op) {
        s.push_str(&format!(
            "  call void @obo_{}_put_null(i8* {}, i8* {})\n",
            prefix, obj_val, key_ptr
        ));
        return Ok(());
    }

    match value_ty {
        LowType::I64 => {
            s.push_str(&format!(
                "  call void @obo_{}_put_i64(i8* {}, i8* {}, i64 {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::Bool => {
            let coerced = coerce_value(s, tmp, value_val, value_ty, LowType::I64)?;
            s.push_str(&format!(
                "  call void @obo_{}_put_bool(i8* {}, i8* {}, i64 {})\n",
                prefix, obj_val, key_ptr, coerced
            ));
        }
        LowType::F64 => {
            s.push_str(&format!(
                "  call void @obo_{}_put_f64(i8* {}, i8* {}, double {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::Str => {
            s.push_str(&format!(
                "  call void @obo_{}_put_str(i8* {}, i8* {}, i8* {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::List | LowType::MixedList => {
            s.push_str(&format!(
                "  call void @obo_{}_put_list(i8* {}, i8* {}, i8* {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::Map => {
            s.push_str(&format!(
                "  call void @obo_{}_put_map(i8* {}, i8* {}, i8* {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::Entity => {
            s.push_str(&format!(
                "  call void @obo_{}_put_entity(i8* {}, i8* {}, i8* {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        LowType::Dyn => {
            s.push_str(&format!(
                "  call void @obo_{}_put_boxed(i8* {}, i8* {}, i8* {})\n",
                prefix, obj_val, key_ptr, value_val
            ));
        }
        _ => {
            return Err(format!(
                "native build: unsupported {} field type",
                prefix
            ));
        }
    }

    Ok(())
}

/// Look up a field name across all entity layouts. Returns Some(slot_index)
/// if the field exists in at least one layout and all occurrences use the same index.
fn resolve_field_slot(ir: &IrProgram, field_name: &str) -> Option<i32> {
    let mut found_idx: Option<i32> = None;
    for (_entity_name, fields) in &ir.entity_layouts {
        if let Some(pos) = fields.iter().position(|f| f == field_name) {
            let idx = pos as i32;
            match found_idx {
                Some(prev) if prev != idx => return None, // conflict
                _ => found_idx = Some(idx),
            }
        }
    }
    found_idx
}

// ── Inline entity slot access constants (must match OboEntitySlotted layout in obo_rt.c) ──
const SLOTTED_SLOTS_OFFSET: i64 = 32; // byte offset of `slots[]` flexible array member
const OBOVALUE_SIZE: i64 = 16;        // sizeof(OboValue) = { u8 tag, 7 pad, 8 union }
const OBOVALUE_UNION_OFFSET: i64 = 8; // byte offset of union `u` within OboValue
// OboVTag enum values
const OBO_VTAG_I64: u8 = 0;
const OBO_VTAG_STR: u8 = 1;
const OBO_VTAG_LIST: u8 = 2;
const OBO_VTAG_MAP: u8 = 3;
const OBO_VTAG_ENTITY: u8 = 4;
const OBO_VTAG_F64: u8 = 5;
const OBO_VTAG_BOOL: u8 = 6;
const OBO_VTAG_NULL: u8 = 7;

/// Emit inline GEP to get pointer to OboValue at entity slot[idx].
fn emit_inline_slot_ptr(s: &mut String, tmp: &mut u32, entity_val: &str, slot_idx: i32) -> String {
    let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
    let out = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        out, entity_val, offset
    ));
    out
}

/// Emit inline store of a typed value into entity slot[idx].
fn emit_inline_slot_store(
    s: &mut String,
    tmp: &mut u32,
    entity_val: &str,
    slot_idx: i32,
    tag: u8,
    value_val: &str,
    llvm_store_type: &str,
) {
    emit_inline_slot_store_inner(s, tmp, entity_val, slot_idx, Some(tag), value_val, llvm_store_type);
}

/// Emit inline store of a typed value into entity slot[idx], skipping tag write.
fn emit_inline_slot_store_notag(
    s: &mut String,
    tmp: &mut u32,
    entity_val: &str,
    slot_idx: i32,
    value_val: &str,
    llvm_store_type: &str,
) {
    emit_inline_slot_store_inner(s, tmp, entity_val, slot_idx, None, value_val, llvm_store_type);
}

fn emit_inline_slot_store_inner(
    s: &mut String,
    tmp: &mut u32,
    entity_val: &str,
    slot_idx: i32,
    tag: Option<u8>,
    value_val: &str,
    llvm_store_type: &str,
) {
    let base_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
    // Store tag byte (skip if type is statically known)
    if let Some(tag) = tag {
        let tag_ptr = fresh_tmp(tmp);
        s.push_str(&format!(
            "  {} = getelementptr i8, i8* {}, i64 {}\n",
            tag_ptr, entity_val, base_offset
        ));
        s.push_str(&format!("  store i8 {}, i8* {}\n", tag, tag_ptr));
    }
    // Store value into union
    let val_offset = base_offset + OBOVALUE_UNION_OFFSET;
    let val_byte_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        val_byte_ptr, entity_val, val_offset
    ));
    let val_typed_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = bitcast i8* {} to {}*\n",
        val_typed_ptr, val_byte_ptr, llvm_store_type
    ));
    s.push_str(&format!(
        "  store {} {}, {}* {}\n",
        llvm_store_type, value_val, llvm_store_type, val_typed_ptr
    ));
}

/// Emit inline null store into entity slot[idx].
fn emit_inline_slot_store_null(
    s: &mut String,
    tmp: &mut u32,
    entity_val: &str,
    slot_idx: i32,
) {
    let base_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
    let tag_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        tag_ptr, entity_val, base_offset
    ));
    s.push_str(&format!("  store i8 {}, i8* {}\n", OBO_VTAG_NULL, tag_ptr));
    let val_offset = base_offset + OBOVALUE_UNION_OFFSET;
    let val_byte_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        val_byte_ptr, entity_val, val_offset
    ));
    let val_ptr = fresh_tmp(tmp);
    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", val_ptr, val_byte_ptr));
    s.push_str(&format!("  store i64 0, i64* {}\n", val_ptr));
}

/// Emit inline copy of a boxed OboValue* into entity slot[idx].
fn emit_inline_slot_store_boxed(
    s: &mut String,
    tmp: &mut u32,
    entity_val: &str,
    slot_idx: i32,
    boxed_val: &str,
) {
    let base_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
    // Load tag from source OboValue
    let src_tag = fresh_tmp(tmp);
    s.push_str(&format!("  {} = load i8, i8* {}\n", src_tag, boxed_val));
    // Load union as i64 from source + 8
    let src_u_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 8\n",
        src_u_ptr, boxed_val
    ));
    let src_u_i64ptr = fresh_tmp(tmp);
    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", src_u_i64ptr, src_u_ptr));
    let src_u_val = fresh_tmp(tmp);
    s.push_str(&format!("  {} = load i64, i64* {}\n", src_u_val, src_u_i64ptr));
    // Store tag to destination slot
    let dst_tag_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        dst_tag_ptr, entity_val, base_offset
    ));
    s.push_str(&format!("  store i8 {}, i8* {}\n", src_tag, dst_tag_ptr));
    // Store union to destination slot + 8
    let dst_val_offset = base_offset + OBOVALUE_UNION_OFFSET;
    let dst_val_ptr = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = getelementptr i8, i8* {}, i64 {}\n",
        dst_val_ptr, entity_val, dst_val_offset
    ));
    let dst_val_i64ptr = fresh_tmp(tmp);
    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", dst_val_i64ptr, dst_val_ptr));
    s.push_str(&format!("  store i64 {}, i64* {}\n", src_u_val, dst_val_i64ptr));
}

/// Emit a direct slot set for MakeEntity (known slotted entity) — inline GEP stores.
fn emit_entity_slot_set_call(
    s: &mut String,
    tmp: &mut u32,
    obj_val: &str,
    slot_idx: i32,
    value_op: &Operand,
    value_val: &str,
    value_ty: LowType,
) -> Result<(), String> {
    if operand_is_null(value_op) {
        emit_inline_slot_store_null(s, tmp, obj_val, slot_idx);
        return Ok(());
    }
    match value_ty {
        LowType::I64 => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_I64, value_val, "i64"),
        LowType::Bool => {
            let coerced = coerce_value(s, tmp, value_val, value_ty, LowType::I64)?;
            emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_BOOL, &coerced, "i64");
        }
        LowType::F64 => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_F64, value_val, "double"),
        LowType::Str => s.push_str(&format!(
            "  call void @obo_entity_set_slot_str(i8* {}, i32 {}, i8* {})\n",
            obj_val, slot_idx, value_val
        )),
        LowType::List | LowType::MixedList => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_LIST, value_val, "i8*"),
        LowType::Map => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_MAP, value_val, "i8*"),
        LowType::Entity => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_ENTITY, value_val, "i8*"),
        LowType::Dyn => emit_inline_slot_store_boxed(s, tmp, obj_val, slot_idx, value_val),
        _ => return Err("native build: unsupported entity slot field type".into()),
    }
    Ok(())
}

/// Emit inline set-field for SetField (slotted entity, known slot index).
fn emit_entity_sfs_call(
    s: &mut String,
    tmp: &mut u32,
    obj_val: &str,
    slot_idx: i32,
    _key_ptr: &str,
    value_op: &Operand,
    value_val: &str,
    value_ty: LowType,
    skip_tag: bool,
) -> Result<(), String> {
    if operand_is_null(value_op) {
        emit_inline_slot_store_null(s, tmp, obj_val, slot_idx);
        return Ok(());
    }
    match value_ty {
        LowType::I64 => if skip_tag {
            emit_inline_slot_store_notag(s, tmp, obj_val, slot_idx, value_val, "i64");
        } else {
            emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_I64, value_val, "i64");
        },
        LowType::Bool => {
            let coerced = coerce_value(s, tmp, value_val, value_ty, LowType::I64)?;
            emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_BOOL, &coerced, "i64");
        }
        LowType::F64 => if skip_tag {
            emit_inline_slot_store_notag(s, tmp, obj_val, slot_idx, value_val, "double");
        } else {
            emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_F64, value_val, "double");
        },
        LowType::Str => s.push_str(&format!(
            "  call void @obo_entity_sfs_str(i8* {}, i32 {}, i8* {}, i8* {})\n",
            obj_val, slot_idx, _key_ptr, value_val
        )),
        LowType::List | LowType::MixedList => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_LIST, value_val, "i8*"),
        LowType::Map => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_MAP, value_val, "i8*"),
        LowType::Entity => emit_inline_slot_store(s, tmp, obj_val, slot_idx, OBO_VTAG_ENTITY, value_val, "i8*"),
        LowType::Dyn => emit_inline_slot_store_boxed(s, tmp, obj_val, slot_idx, value_val),
        _ => {
            // Fall back to regular entity put
            emit_object_store_call(s, tmp, "entity", obj_val, _key_ptr, value_op, value_val, value_ty)?;
        }
    }
    Ok(())
}

fn emit_inst(
    s: &mut String,
    tmp: &mut u32,
    f: &IrFunction,
    ir: &IrProgram,
    inst: &Inst,
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
    string_table: &[String],
    block_names: &HashMap<BlockId, String>,
    fn_ret: &HashMap<String, LowType>,
    gc_root_count: i64,
    bridge_ret_overrides: &HashMap<String, String>,
    entity_ptr_cache: &mut HashMap<String, String>,
    reg_source_var: &mut HashMap<u32, String>,
    consistent_field_types: &HashMap<String, LowType>,
    packed_reg_types: &mut HashMap<u32, String>,
    packed_var_types: &mut HashMap<String, String>,
    tail_call_regs: &HashSet<u32>,
) -> Result<(), String> {
    match inst {
        Inst::Const(r, c) => {
            let ptr = format!("%reg_{}_ptr", r.0);
            match c {
                Constant::Number(n) => {
                    s.push_str(&format!("  store i64 {}, i64* {}\n", n, ptr));
                }
                Constant::Decimal(d) => {
                    s.push_str(&format!(
                        "  store double {}, double* {}\n",
                        llvm_f64_hex(*d),
                        ptr
                    ));
                }
                Constant::Text(t) => {
                    let idx = string_index(string_table, t)?;
                    let blen = llvm_c_array(t).0;
                    let gep = format_gep(idx, blen);
                    s.push_str(&format!("  store i8* {}, i8** {}\n", gep, ptr));
                }
                Constant::Char(ch) => {
                    s.push_str(&format!("  store i64 {}, i64* {}\n", *ch as u32, ptr));
                }
                Constant::Flag(b) => {
                    s.push_str(&format!(
                        "  store i64 {}, i64* {}\n",
                        if *b { 1 } else { 0 },
                        ptr
                    ));
                }
                Constant::Null => {
                    s.push_str(&format!("  store i64 0, i64* {}\n", ptr));
                }
            }
        }
        Inst::Copy(r, op) => {
            let (val, ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
            // Propagate packed entity type tracking through copies
            if let Operand::Reg(src) = op {
                if let Some(ptype) = packed_reg_types.get(&src.0).cloned() {
                    packed_reg_types.insert(r.0, ptype);
                }
            }
            let dst = format!("%reg_{}_ptr", r.0);
            match ty {
                LowType::I64 | LowType::Bool => {
                    s.push_str(&format!("  store i64 {}, i64* {}\n", val, dst));
                }
                LowType::F64 => {
                    s.push_str(&format!("  store double {}, double* {}\n", val, dst));
                }
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    s.push_str(&format!("  store i8* {}, i8** {}\n", val, dst));
                }
            }
        }
        Inst::BinOp(r, op, lhs, rhs) => {
            let (mut lv, mut lt) = emit_operand(s, tmp, lhs, reg_ty, var_ty, string_table)?;
            let (mut rv, mut rt) = emit_operand(s, tmp, rhs, reg_ty, var_ty, string_table)?;

            if lt == LowType::Dyn && rt != LowType::Dyn && !operand_is_null(rhs) {
                if let Some(target) = preferred_dyn_operand_type(*op, rt) {
                    lv = coerce_value(s, tmp, &lv, lt, target)?;
                    lt = target;
                }
            }
            if rt == LowType::Dyn && lt != LowType::Dyn && !operand_is_null(lhs) {
                if let Some(target) = preferred_dyn_operand_type(*op, lt) {
                    rv = coerce_value(s, tmp, &rv, rt, target)?;
                    rt = target;
                }
            }

            // --- VALUE TYPE component-wise arithmetic (checked early to skip coercion) ---
            let lhs_vtype = if let Operand::Reg(reg) = lhs {
                packed_reg_types.get(&reg.0).filter(|n| ir.value_types.contains(n.as_str())).cloned()
            } else { None };
            let rhs_vtype = if let Operand::Reg(reg) = rhs {
                packed_reg_types.get(&reg.0).filter(|n| ir.value_types.contains(n.as_str())).cloned()
            } else { None };
            let is_value_binop = matches!((&lhs_vtype, &rhs_vtype), (Some(l), Some(r)) if l == r);

            // Coerce heap types to Str when doing Add/Concat with a text operand.
            // Skip when both operands are Dyn — that case uses runtime arithmetic
            // dispatch (obo_dyn_arith) to preserve numeric semantics.
            // Also skip when both are value types — they use component-wise arithmetic.
            let both_dyn_here = lt == LowType::Dyn && rt == LowType::Dyn;
            if matches!(op, BinOp::Add | BinOp::Concat)
                && !both_dyn_here
                && !is_value_binop
                && (lt == LowType::Str || rt == LowType::Str
                    || matches!(lt, LowType::List | LowType::MixedList | LowType::Map | LowType::Entity | LowType::Dyn)
                    || matches!(rt, LowType::List | LowType::MixedList | LowType::Map | LowType::Entity | LowType::Dyn))
            {
                if matches!(lt, LowType::List | LowType::MixedList | LowType::Map | LowType::Entity) {
                    lv = emit_heap_to_str(s, tmp, &lv, lt)?;
                    lt = LowType::Str;
                }
                if matches!(rt, LowType::List | LowType::MixedList | LowType::Map | LowType::Entity) {
                    rv = emit_heap_to_str(s, tmp, &rv, rt)?;
                    rt = LowType::Str;
                }
                // Dyn (boxed) values: unbox to string via obo_value_to_str
                if lt == LowType::Dyn {
                    let unboxed = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_value_to_str(i8* {})\n", unboxed, lv));
                    lv = unboxed;
                    lt = LowType::Str;
                }
                if rt == LowType::Dyn {
                    let unboxed = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_value_to_str(i8* {})\n", unboxed, rv));
                    rv = unboxed;
                    rt = LowType::Str;
                }
            }

            // --- VALUE TYPE component-wise arithmetic ---
            if let (Some(ref lvt), Some(ref rvt)) = (&lhs_vtype, &rhs_vtype) {
                if lvt == rvt && matches!(op, BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div) {
                    if let Some(layout) = ir.packed_layouts.get(lvt.as_str()) {
                        let field_llvm_types: Vec<&str> = layout.iter().map(|(_, ty)| packed_field_llvm_type(ty)).collect();
                        let struct_ty = format!("<{{ {} }}>", field_llvm_types.join(", "));

                        // Alloca for result
                        let res_alloca = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = alloca {}, align 1\n", res_alloca, struct_ty));

                        // Bitcast both operands to struct pointer
                        let lhs_typed = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast i8* {} to {}*\n", lhs_typed, lv, struct_ty));
                        let rhs_typed = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast i8* {} to {}*\n", rhs_typed, rv, struct_ty));

                        for (idx, (_, fty)) in layout.iter().enumerate() {
                            let llvm_ty = packed_field_llvm_type(fty);
                            let is_float = llvm_ty == "float" || llvm_ty == "double";
                            // Load left field
                            let lgep = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n", lgep, struct_ty, struct_ty, lhs_typed, idx));
                            let lfield = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = load {}, {}* {}\n", lfield, llvm_ty, llvm_ty, lgep));
                            // Load right field
                            let rgep = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n", rgep, struct_ty, struct_ty, rhs_typed, idx));
                            let rfield = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = load {}, {}* {}\n", rfield, llvm_ty, llvm_ty, rgep));
                            // Apply operation
                            let opc = if is_float {
                                match op { BinOp::Add => "fadd", BinOp::Sub => "fsub", BinOp::Mul => "fmul", BinOp::Div => "fdiv", _ => unreachable!() }
                            } else {
                                match op { BinOp::Add => "add", BinOp::Sub => "sub", BinOp::Mul => "mul", BinOp::Div => "sdiv", _ => unreachable!() }
                            };
                            let result_field = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = {} {} {}, {}\n", result_field, opc, llvm_ty, lfield, rfield));
                            // Store into result
                            let res_gep = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n", res_gep, struct_ty, struct_ty, res_alloca, idx));
                            s.push_str(&format!("  store {} {}, {}* {}\n", llvm_ty, result_field, llvm_ty, res_gep));
                        }

                        // Bitcast result to i8*
                        let res_ptr = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast {}* {} to i8*\n", res_ptr, struct_ty, res_alloca));
                        store_reg_value(s, *r, &res_ptr, LowType::Entity);
                        packed_reg_types.insert(r.0, lvt.clone());
                        // Value type BinOp fully handled — skip normal BinOp logic.
                    } else {
                        return Err(format!("native build: unknown value type '{}'", lvt));
                    }
                } else {
                    return Err(format!("native build: value types only support +, -, *, / operators"));
                }
            } else {

            if !matches!(op, BinOp::And | BinOp::Or)
                && (matches!(lt, LowType::List | LowType::Map | LowType::Entity)
                    || matches!(rt, LowType::List | LowType::Map | LowType::Entity))
            {
                return Err(
                    "native build: heap values do not support arithmetic or text ops here".into(),
                );
            }
            // Keep Dyn boxed for comparisons so runtime tag-aware comparison can
            // preserve string and numeric semantics. Arithmetic still unboxes.
            if !matches!(op, BinOp::Eq | BinOp::NotEq | BinOp::Less | BinOp::Greater | BinOp::LessEq | BinOp::GreaterEq) {
                // When both operands are Dyn, dispatch arithmetic to runtime
                // so float vs int semantics are preserved.
                if lt == LowType::Dyn && rt == LowType::Dyn
                    && matches!(op, BinOp::Add | BinOp::Sub | BinOp::Mul | BinOp::Div | BinOp::Mod)
                {
                    let opc: i32 = match op {
                        BinOp::Add => 0,
                        BinOp::Sub => 1,
                        BinOp::Mul => 2,
                        BinOp::Div => 3,
                        BinOp::Mod => 4,
                        _ => unreachable!(),
                    };
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_dyn_arith(i8* {}, i8* {}, i32 {})\n",
                        out, lv, rv, opc
                    ));
                    store_reg_value(s, *r, &out, LowType::Dyn);
                } else {
                    if lt == LowType::Dyn {
                        lv = coerce_value(s, tmp, &lv, LowType::Dyn, LowType::I64)?;
                        lt = LowType::I64;
                    }
                    if rt == LowType::Dyn {
                        rv = coerce_value(s, tmp, &rv, LowType::Dyn, LowType::I64)?;
                        rt = LowType::I64;
                    }
                }
            }
            // If we already handled the Dyn-Dyn arithmetic case, skip
            // the normal code-gen path below.  Comparisons are NOT handled
            // above and must fall through to the obo_value_compare path.
            if lt == LowType::Dyn && rt == LowType::Dyn
                && !matches!(op, BinOp::Eq | BinOp::NotEq | BinOp::Less | BinOp::Greater | BinOp::LessEq | BinOp::GreaterEq)
            {
                // Already emitted — handled above via obo_dyn_arith.
            } else {
            let dst = format!("%reg_{}_ptr", r.0);
            let either_f64 = lt == LowType::F64 || rt == LowType::F64;
            use BinOp::*;
            match op {
                Concat => {
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat(i8* {}, i8* {})\n",
                        t, lv, rv
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add if lt == LowType::Str && rt == LowType::Str => {
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat(i8* {}, i8* {})\n",
                        t, lv, rv
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add if lt == LowType::Str && rt == LowType::F64 => {
                    let rs = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_f64_to_str(double {})\n", rs, rv));
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat(i8* {}, i8* {})\n",
                        t, lv, rs
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add if lt == LowType::F64 && rt == LowType::Str => {
                    let ls = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_f64_to_str(double {})\n", ls, lv));
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat(i8* {}, i8* {})\n",
                        t, ls, rv
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add if lt == LowType::Str && (rt == LowType::I64 || rt == LowType::Bool) => {
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat_int(i8* {}, i64 {})\n",
                        t, lv, rv
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add if (lt == LowType::I64 || lt == LowType::Bool) && rt == LowType::Str => {
                    let ls = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_i64_to_str(i64 {})\n", ls, lv));
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_str_concat(i8* {}, i8* {})\n",
                        t, ls, rv
                    ));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
                Add | Sub | Mul | Div | Mod if lt == LowType::Str || rt == LowType::Str => {
                    return Err(
                        "native build: that operation is not supported on text (only '+' for text and numbers)"
                            .into(),
                    );
                }
                Add | Sub | Mul | Div | Mod if either_f64 => {
                    let fl = ensure_f64(s, tmp, &lv, lt);
                    let fr = ensure_f64(s, tmp, &rv, rt);
                    let opc = match op {
                        Add => "fadd",
                        Sub => "fsub",
                        Mul => "fmul",
                        Div => "fdiv",
                        Mod => "frem",
                        _ => unreachable!(),
                    };
                    let t = fresh_tmp(tmp);
                    // 'reassoc contract' allows LLVM to reorder and fuse FP ops,
                    // enabling auto-vectorization of reductions and FMA formation.
                    s.push_str(&format!("  {} = {} reassoc contract double {}, {}\n", t, opc, fl, fr));
                    s.push_str(&format!("  store double {}, double* {}\n", t, dst));
                }
                Add | Sub | Mul | Div | Mod => {
                    match op {
                        Div => {
                            // If divisor is a non-zero constant, use inline sdiv
                            // instead of obo_safe_div to allow LLVM optimization.
                            let is_const_nonzero = matches!(rhs, Operand::Const(Constant::Number(n)) if *n != 0);
                            let t = fresh_tmp(tmp);
                            if is_const_nonzero {
                                s.push_str(&format!("  {} = sdiv i64 {}, {}\n", t, lv, rv));
                            } else {
                                s.push_str(&format!("  {} = call i64 @obo_safe_div(i64 {}, i64 {})\n", t, lv, rv));
                            }
                            s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                        }
                        Mod => {
                            // If divisor is a non-zero constant, use inline srem.
                            let is_const_nonzero = matches!(rhs, Operand::Const(Constant::Number(n)) if *n != 0);
                            let t = fresh_tmp(tmp);
                            if is_const_nonzero {
                                s.push_str(&format!("  {} = srem i64 {}, {}\n", t, lv, rv));
                            } else {
                                s.push_str(&format!("  {} = call i64 @obo_safe_mod(i64 {}, i64 {})\n", t, lv, rv));
                            }
                            s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                        }
                        _ => {
                            let opc = match op {
                                Add => "add",
                                Sub => "sub",
                                Mul => "mul",
                                _ => unreachable!(),
                            };
                            let t = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = {} i64 {}, {}\n", t, opc, lv, rv));
                            s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                        }
                    }
                }
                Eq | NotEq | Less | Greater | LessEq | GreaterEq => {
                    if lt == LowType::Dyn || rt == LowType::Dyn {
                        let lhs_boxed = if lt == LowType::Dyn {
                            lv.clone()
                        } else if matches!(lhs, Operand::Const(Constant::Null)) {
                            let boxed = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = call i8* @obo_box_null()\n", boxed));
                            boxed
                        } else {
                            box_value(s, tmp, &lv, lt)?
                        };
                        let rhs_boxed = if rt == LowType::Dyn {
                            rv.clone()
                        } else if matches!(rhs, Operand::Const(Constant::Null)) {
                            let boxed = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = call i8* @obo_box_null()\n", boxed));
                            boxed
                        } else {
                            box_value(s, tmp, &rv, rt)?
                        };
                        let cmp = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_value_compare(i8* {}, i8* {})\n",
                            cmp, lhs_boxed, rhs_boxed
                        ));
                        let pred = match op {
                            Eq => "eq",
                            NotEq => "ne",
                            Less => "slt",
                            Greater => "sgt",
                            LessEq => "sle",
                            GreaterEq => "sge",
                            _ => unreachable!(),
                        };
                        let tmp1 = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp {} i64 {}, 0\n", tmp1, pred, cmp));
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, tmp1));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                    } else if lt == LowType::Str && rt == LowType::Str {
                        let cmp = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i32 @strcmp(i8* {}, i8* {})\n",
                            cmp, lv, rv
                        ));
                        let pred = match op {
                            Eq => "eq",
                            NotEq => "ne",
                            Less => "slt",
                            Greater => "sgt",
                            LessEq => "sle",
                            GreaterEq => "sge",
                            _ => unreachable!(),
                        };
                        let tmp1 = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp {} i32 {}, 0\n", tmp1, pred, cmp));
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, tmp1));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                    } else if lt == LowType::Str || rt == LowType::Str {
                        return Err(
                            "native build: compare text only to text (or use numbers with numbers)"
                                .into(),
                        );
                    } else if either_f64 {
                        let fl = ensure_f64(s, tmp, &lv, lt);
                        let fr = ensure_f64(s, tmp, &rv, rt);
                        let pred = match op {
                            Eq => "oeq",
                            NotEq => "une",
                            Less => "olt",
                            Greater => "ogt",
                            LessEq => "ole",
                            GreaterEq => "oge",
                            _ => unreachable!(),
                        };
                        let tmp1 = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = fcmp {} double {}, {}\n", tmp1, pred, fl, fr));
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, tmp1));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                    } else {
                        let pred = match op {
                            Eq => "eq",
                            NotEq => "ne",
                            Less => "slt",
                            Greater => "sgt",
                            LessEq => "sle",
                            GreaterEq => "sge",
                            _ => unreachable!(),
                        };
                        let tmp1 = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp {} i64 {}, {}\n", tmp1, pred, lv, rv));
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, tmp1));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                    }
                }
                And | Or => {
                    let ltr = emit_truthy_i64(s, tmp, &lv, lt)?;
                    let rtr = emit_truthy_i64(s, tmp, &rv, rt)?;
                    let a1 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", a1, ltr));
                    let b1 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", b1, rtr));
                    let opc = if matches!(op, BinOp::And) { "and" } else { "or" };
                    let r1 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = {} i1 {}, {}\n", r1, opc, a1, b1));
                    let ext = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, r1));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                }
                BitAnd | BitOr | BitXor | Shl | Shr => {
                    let opc = match op {
                        BitAnd => "and",
                        BitOr => "or",
                        BitXor => "xor",
                        Shl => "shl",
                        Shr => "ashr",
                        _ => unreachable!(),
                    };
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = {} i64 {}, {}\n", t, opc, lv, rv));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                }
            }
            } // close else-block for Dyn-Dyn arithmetic bypass
            } // close else-block for value type BinOp bypass
        }
        Inst::UnaryOp(r, uop, op) => {
            let (mut v, mut ut) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
            let dst = format!("%reg_{}_ptr", r.0);
            match uop {
                UnaryOp::Neg if ut == LowType::Dyn => {
                    let target = reg_ty
                        .get(r.0 as usize)
                        .and_then(|ty| *ty)
                        .unwrap_or(LowType::I64);
                    let target = if target == LowType::F64 { LowType::F64 } else { LowType::I64 };
                    v = coerce_value(s, tmp, &v, ut, target)?;
                    ut = target;
                    if ut == LowType::F64 {
                        let t = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = fsub double 0.0, {}\n", t, v));
                        s.push_str(&format!("  store double {}, double* {}\n", t, dst));
                    } else {
                        let t = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = sub i64 0, {}\n", t, v));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                    }
                }
                UnaryOp::Neg if ut == LowType::F64 => {
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = fsub double 0.0, {}\n", t, v));
                    s.push_str(&format!("  store double {}, double* {}\n", t, dst));
                }
                UnaryOp::Neg => {
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = sub i64 0, {}\n", t, v));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                }
                UnaryOp::Not if ut == LowType::F64 => {
                    let t1 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = fcmp oeq double {}, 0.0\n", t1, v));
                    let ext = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, t1));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                }
                UnaryOp::Not => {
                    let truthy = emit_truthy_i64(s, tmp, &v, ut)?;
                    let t1 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = icmp eq i64 {}, 0\n", t1, truthy));
                    let ext = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, t1));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", ext, dst));
                }
                UnaryOp::BitNot => {
                    if ut == LowType::Dyn {
                        v = coerce_value(s, tmp, &v, LowType::Dyn, LowType::I64)?;
                    }
                    let t = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = xor i64 {}, -1\n", t, v));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                }
            }
        }
        Inst::Load(r, name) => {
            // @export function reference → function pointer as i64
            if ir.export_fns.contains(name) {
                let dst = format!("%reg_{}_ptr", r.0);
                let t = fresh_tmp(tmp);
                // Find the export function to get its signature
                let efn = ir.functions.iter().find(|f| f.name == *name && f.is_export);
                if let Some(efn) = efn {
                    let ret = efn.export_ret_type.as_deref().unwrap_or("i64");
                    let params: Vec<&str> = efn.export_param_types.iter().map(|s| s.as_str()).collect();
                    let param_str = if params.is_empty() { String::new() } else { params.join(", ") };
                    s.push_str(&format!(
                        "  {} = ptrtoint {} ({})* @{} to i64\n",
                        t, ret, param_str, sanitize_global(name)
                    ));
                } else {
                    // Fallback: treat as i8* function
                    s.push_str(&format!(
                        "  {} = ptrtoint i8* bitcast (i64 ()* @{} to i8*) to i64\n",
                        t, sanitize_global(name)
                    ));
                }
                s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
            } else {
            let ty = var_ty.get(name).copied().unwrap_or(LowType::I64);
            let src = format!("%var_{}_ptr", sanitize_name(name));
            let dst = format!("%reg_{}_ptr", r.0);
            let t = fresh_tmp(tmp);
            match ty {
                LowType::I64 | LowType::Bool => {
                    s.push_str(&format!("  {} = load i64, i64* {}\n", t, src));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", t, dst));
                }
                LowType::F64 => {
                    s.push_str(&format!("  {} = load double, double* {}\n", t, src));
                    s.push_str(&format!("  store double {}, double* {}\n", t, dst));
                }
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    s.push_str(&format!("  {} = load i8*, i8** {}\n", t, src));
                    s.push_str(&format!("  store i8* {}, i8** {}\n", t, dst));
                }
            }
            }
            // Track which variable this register was loaded from (for entity ptr caching)
            reg_source_var.insert(r.0, name.clone());
            // Propagate packed entity type tracking through variable loads
            if let Some(ptype) = packed_var_types.get(name).cloned() {
                packed_reg_types.insert(r.0, ptype);
            }
        }
        Inst::Store(name, op) => {
            // Variable reassignment invalidates any cached entity pointer
            entity_ptr_cache.remove(name);
            // Propagate packed entity type tracking through variable stores
            if let Operand::Reg(src) = op {
                if let Some(ptype) = packed_reg_types.get(&src.0).cloned() {
                    packed_var_types.insert(name.clone(), ptype);
                }
            }
            let (val, ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
            let ptr = format!("%var_{}_ptr", sanitize_name(name));
            match ty {
                LowType::I64 | LowType::Bool => {
                    s.push_str(&format!("  store i64 {}, i64* {}\n", val, ptr));
                }
                LowType::F64 => {
                    s.push_str(&format!("  store double {}, double* {}\n", val, ptr));
                }
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    s.push_str(&format!("  store i8* {}, i8** {}\n", val, ptr));
                }
            }
        }
        Inst::Call(r, name, args) => {
            // ── Memory intrinsics: inline load/store instead of function calls ──
            if name == "__sys_mem_load64" {
                // mem.load64(addr) → inttoptr addr to i64*, load i64
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i64*\n", ptr_tmp, addr_val));
                let val_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = load i64, i64* {}\n", val_tmp, ptr_tmp));
                store_reg_value(s, *r, &val_tmp, LowType::I64);
            } else if name == "__sys_mem_store64" {
                // mem.store64(addr, val) → inttoptr addr to i64*, store i64 val
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let (val_val, _) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i64*\n", ptr_tmp, addr_val));
                s.push_str(&format!("  store i64 {}, i64* {}\n", val_val, ptr_tmp));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if name == "__sys_mem_load8" {
                // mem.load8(addr) → inttoptr addr to i8*, load i8, zext to i64
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", ptr_tmp, addr_val));
                let byte_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = load i8, i8* {}\n", byte_tmp, ptr_tmp));
                let ext_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = zext i8 {} to i64\n", ext_tmp, byte_tmp));
                store_reg_value(s, *r, &ext_tmp, LowType::I64);
            } else if name == "__sys_mem_store8" {
                // mem.store8(addr, val) → inttoptr addr to i8*, trunc val to i8, store
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let (val_val, _) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", ptr_tmp, addr_val));
                let byte_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = trunc i64 {} to i8\n", byte_tmp, val_val));
                s.push_str(&format!("  store i8 {}, i8* {}\n", byte_tmp, ptr_tmp));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if name == "__sys_mem_load32" {
                // mem.load32(addr) → inttoptr addr to i32*, load i32, zext to i64
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i32*\n", ptr_tmp, addr_val));
                let word_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = load i32, i32* {}\n", word_tmp, ptr_tmp));
                let ext_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = zext i32 {} to i64\n", ext_tmp, word_tmp));
                store_reg_value(s, *r, &ext_tmp, LowType::I64);
            } else if name == "__sys_mem_store32" {
                // mem.store32(addr, val) → inttoptr addr to i32*, trunc val to i32, store
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let (val_val, _) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                let ptr_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i32*\n", ptr_tmp, addr_val));
                let word_tmp = fresh_tmp(tmp);
                s.push_str(&format!("  {} = trunc i64 {} to i32\n", word_tmp, val_val));
                s.push_str(&format!("  store i32 {}, i32* {}\n", word_tmp, ptr_tmp));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if name == "__sys_mem_copy" {
                // mem.copy(dst, src, len) → llvm.memcpy
                let (dst_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let (src_val, _) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                let (len_val, _) = emit_operand(s, tmp, &args[2], reg_ty, var_ty, string_table)?;
                let dst_ptr = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", dst_ptr, dst_val));
                let src_ptr = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", src_ptr, src_val));
                s.push_str(&format!("  call void @llvm.memcpy.p0i8.p0i8.i64(i8* {}, i8* {}, i64 {}, i1 false)\n", dst_ptr, src_ptr, len_val));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if name == "__sys_mem_zero" {
                // mem.zero(addr, len) → llvm.memset 0
                let (addr_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let (len_val, _) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                let addr_ptr = fresh_tmp(tmp);
                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", addr_ptr, addr_val));
                s.push_str(&format!("  call void @llvm.memset.p0i8.i64(i8* {}, i8 0, i64 {}, i1 false)\n", addr_ptr, len_val));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if name == "_setjmp" {
                let (arg_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                let tmp32 = fresh_tmp(tmp);
                s.push_str(&format!(
                    "  {} = call i32 @_setjmp(i8* {}) #0\n",
                    tmp32, arg_val
                ));
                let out = fresh_tmp(tmp);
                s.push_str(&format!(
                    "  {} = sext i32 {} to i64\n",
                    out, tmp32
                ));
                store_reg_value(s, *r, &out, LowType::I64);
            } else if name == "obo_metal_enter" || name == "obo_metal_exit" {
                // Void-returning metal mode functions
                s.push_str(&format!("  call void @{}()\n", name));
                store_reg_value(s, *r, "0", LowType::I64);
            } else if let Some(bfn) = ir.bridge_fns.iter().find(|b| b.name == *name) {
                // Bridge (FFI) function call — use the declared LLVM return type.
                // If there's a conflict with an existing declaration, use the existing type.
                let actual_ret = bridge_ret_overrides.get(name)
                    .map(|s| s.as_str())
                    .unwrap_or(bfn.return_type.as_str());
                let callee = ir.functions.iter().find(|func| func.name == *name);
                let mut call_args = Vec::with_capacity(args.len());
                for (index, arg) in args.iter().enumerate() {
                    let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                    let bridge_is_ptr = bfn.param_types.get(index).map(|t| t.trim() == "i8*").unwrap_or(false);
                    if bridge_is_ptr {
                        // Bridge i8* params: raw pointer coercion, no boxing/unboxing.
                        if arg_ty.is_ptr() {
                            // Already a pointer (i8*) — pass through directly.
                            call_args.push(format!("i8* {}", arg_val));
                        } else {
                            // i64/bool → raw pointer via inttoptr.
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", out, arg_val));
                            call_args.push(format!("i8* {}", out));
                        }
                    } else {
                        let expected = callee
                            .map(|func| param_low_type(func, index))
                            .or_else(|| bfn.param_types.get(index).and_then(|ty| llvm_param_low_type(ty)))
                            .unwrap_or(arg_ty);
                        let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                        call_args.push(format!("{} {}", expected.llvm(), coerced));
                    }
                }
                let variadic = if bfn.is_variadic {
                    let param_sig = bfn.param_types.join(", ");
                    format!(" ({}, ...)", param_sig)
                } else {
                    String::new()
                };
                if actual_ret == "void" {
                    s.push_str(&format!(
                        "  call void{} @{}({})\n",
                        variadic, sanitize_global(name), call_args.join(", ")
                    ));
                    store_reg_value(s, *r, "0", LowType::I64);
                } else if actual_ret == "i32" {
                    let tmp32 = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i32{} @{}({})\n",
                        tmp32, variadic, sanitize_global(name), call_args.join(", ")
                    ));
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = sext i32 {} to i64\n", out, tmp32
                    ));
                    store_reg_value(s, *r, &out, LowType::I64);
                } else {
                    let ret_low = match actual_ret {
                        "double" => LowType::F64,
                        "i8*" => LowType::Dyn,
                        _ => LowType::I64,
                    };
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call {}{} @{}({})\n",
                        out, ret_low.llvm(), variadic, sanitize_global(name), call_args.join(", ")
                    ));
                    store_reg_value(s, *r, &out, ret_low);
                }
            } else {
            let ret_ty = fn_ret
                .get(name)
                .copied()
                .or_else(|| extern_fn_ret(name))
                .unwrap_or(LowType::I64);
            let callee = ir.functions.iter().find(|func| func.name == *name);
            let mut call_args = Vec::with_capacity(args.len());
            for (index, arg) in args.iter().enumerate() {
                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                let expected = callee
                    .map(|func| param_low_type(func, index))
                    .or_else(|| extern_param_low_type(name, index))
                    .unwrap_or(arg_ty);
                let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                call_args.push(format!("{} {}", expected.llvm(), coerced));
            }
            let out = fresh_tmp(tmp);
            let tail_prefix = if tail_call_regs.contains(&r.0) { "tail " } else { "" };
            s.push_str(&format!(
                "  {} = {}call {} @{}({})\n",
                out,
                tail_prefix,
                ret_ty.llvm(),
                sanitize_global(name),
                call_args.join(", ")
            ));
            store_reg_value(s, *r, &out, ret_ty);
            }
        }
        Inst::CallMethod(r, obj, method, args) => {
            let (obj_val, obj_ty) = emit_operand(s, tmp, obj, reg_ty, var_ty, string_table)?;
            if try_emit_extension_call(
                s,
                tmp,
                ir,
                fn_ret,
                r,
                &obj_val,
                obj_ty,
                method,
                args,
                reg_ty,
                var_ty,
                string_table,
            )? {
                return Ok(());
            }

            // --- VALUE TYPE methods (dot, length, normalize, etc.) ---
            if obj_ty == LowType::Entity {
                let vtype = if let Operand::Reg(reg) = obj {
                    packed_reg_types.get(&reg.0).filter(|n| ir.value_types.contains(n.as_str())).cloned()
                } else { None };
                if let Some(ref vt_name) = vtype {
                    if method == "dot" && args.len() == 1 {
                        // Dot product: sum of component-wise multiplication
                        if let Some(layout) = ir.packed_layouts.get(vt_name.as_str()) {
                            let field_llvm_types: Vec<&str> = layout.iter().map(|(_, ty)| packed_field_llvm_type(ty)).collect();
                            let struct_ty = format!("<{{ {} }}>", field_llvm_types.join(", "));
                            let (arg_val, _) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;

                            let lhs_typed = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = bitcast i8* {} to {}*\n", lhs_typed, obj_val, struct_ty));
                            let rhs_typed = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = bitcast i8* {} to {}*\n", rhs_typed, arg_val, struct_ty));

                            // Determine result type from first field
                            let first_llvm_ty = field_llvm_types[0];
                            let is_float = first_llvm_ty == "float" || first_llvm_ty == "double";
                            let zero_val = if is_float { "0.0" } else { "0" };
                            let result_llvm_ty = if first_llvm_ty == "float" { "double" } else { first_llvm_ty };
                            let mut accum = format!("{}", zero_val);
                            let mut accum_initialized = false;

                            for (idx, (_, fty)) in layout.iter().enumerate() {
                                let llvm_ty = packed_field_llvm_type(fty);
                                let is_fld_float = llvm_ty == "float" || llvm_ty == "double";
                                let lgep = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n", lgep, struct_ty, struct_ty, lhs_typed, idx));
                                let lfield = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = load {}, {}* {}\n", lfield, llvm_ty, llvm_ty, lgep));
                                let rgep = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n", rgep, struct_ty, struct_ty, rhs_typed, idx));
                                let rfield = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = load {}, {}* {}\n", rfield, llvm_ty, llvm_ty, rgep));
                                let mul_tmp = fresh_tmp(tmp);
                                if is_fld_float {
                                    s.push_str(&format!("  {} = fmul {} {}, {}\n", mul_tmp, llvm_ty, lfield, rfield));
                                    // If float, widen to double for accumulation
                                    let widened = if llvm_ty == "float" {
                                        let w = fresh_tmp(tmp);
                                        s.push_str(&format!("  {} = fpext float {} to double\n", w, mul_tmp));
                                        w
                                    } else {
                                        mul_tmp.clone()
                                    };
                                    if accum_initialized {
                                        let add_tmp = fresh_tmp(tmp);
                                        s.push_str(&format!("  {} = fadd double {}, {}\n", add_tmp, accum, widened));
                                        accum = add_tmp;
                                    } else {
                                        accum = widened;
                                        accum_initialized = true;
                                    }
                                } else {
                                    s.push_str(&format!("  {} = mul {} {}, {}\n", mul_tmp, llvm_ty, lfield, rfield));
                                    if accum_initialized {
                                        let add_tmp = fresh_tmp(tmp);
                                        s.push_str(&format!("  {} = add {} {}, {}\n", add_tmp, llvm_ty, accum, mul_tmp));
                                        accum = add_tmp;
                                    } else {
                                        accum = mul_tmp;
                                        accum_initialized = true;
                                    }
                                }
                            }

                            // Result is f64 (double) for float fields, i64 for int fields
                            if is_float {
                                store_reg_value(s, *r, &accum, LowType::F64);
                            } else {
                                store_reg_value(s, *r, &accum, LowType::I64);
                            }
                            return Ok(());
                        }
                    }
                    // length method: return number of fields
                    if method == "length" && args.is_empty() {
                        if let Some(layout) = ir.packed_layouts.get(vt_name.as_str()) {
                            let len = layout.len();
                            store_reg_value(s, *r, &format!("{}", len), LowType::I64);
                            return Ok(());
                        }
                    }
                }
            }

            match obj_ty {
                LowType::Str => {
                    let known_text_methods = [
                        "contains", "startsWith", "endsWith", "indexOf", "split",
                        "replace", "substring", "repeat", "padLeft", "padRight",
                        "toNumber", "toDecimal",
                    ];
                    if known_text_methods.contains(&method.as_str()) {
                        let symbol = format!("__text_{}", method);
                        let ret_ty = match method.as_str() {
                            "contains" | "startsWith" | "endsWith" => LowType::Bool,
                            "indexOf" | "toNumber" => LowType::I64,
                            "toDecimal" => LowType::F64,
                            "split" => LowType::MixedList,
                            _ => LowType::Str,
                        };
                        let mut call_args = vec![format!("i8* {}", obj_val)];
                        let expected_args: &[LowType] = match method.as_str() {
                            "contains" | "startsWith" | "endsWith" | "indexOf" | "split" => {
                                &[LowType::Str]
                            }
                            "replace" => &[LowType::Str, LowType::Str],
                            "substring" => &[LowType::I64, LowType::I64],
                            "repeat" => &[LowType::I64],
                            "padLeft" | "padRight" => &[LowType::I64, LowType::Str],
                            _ => &[],
                        };
                        for (index, arg) in args.iter().enumerate() {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                            let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                            call_args.push(format!("{} {}", expected.llvm(), coerced));
                        }
                        if matches!(method.as_str(), "padLeft" | "padRight") && args.len() < 2 {
                            call_args.push("i8* null".to_string());
                        }
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call {} @{}({})\n",
                            out,
                            ret_ty.llvm(),
                            symbol,
                            call_args.join(", ")
                        ));
                        store_reg_value(s, *r, &out, ret_ty);
                    } else {
                        // Not a known text method — type inference may be wrong;
                        // treat as MixedList method call.
                        let mixed_method: Option<(&str, LowType, Vec<LowType>)> = match method.as_str() {
                            "filter" => Some(("obo_mixed_list_filter", LowType::MixedList, vec![LowType::Closure])),
                            "map" => Some(("obo_mixed_list_map", LowType::MixedList, vec![LowType::Closure])),
                            "each" => Some(("obo_mixed_list_each", LowType::MixedList, vec![LowType::Closure])),
                            "add" => Some(("obo_mixed_list_add", LowType::MixedList, vec![LowType::Dyn])),
                            "removeAt" => Some(("obo_mixed_list_removeAt", LowType::MixedList, vec![LowType::I64])),
                            "join" => Some(("obo_mixed_list_join", LowType::Str, vec![LowType::Str])),
                            "contains" => Some(("obo_mixed_list_contains", LowType::Bool, vec![LowType::Dyn])),
                            "reduce" => Some(("obo_mixed_list_reduce", LowType::Dyn, vec![LowType::Dyn, LowType::Closure])),
                            "any" => Some(("obo_mixed_list_any", LowType::Bool, vec![LowType::Closure])),
                            "all" => Some(("obo_mixed_list_all", LowType::Bool, vec![LowType::Closure])),
                            _ => None,
                        };
                        if let Some((symbol, ret_ty, expected_args)) = mixed_method {
                            let mut call_args = vec![format!("i8* {}", obj_val)];
                            for (index, arg) in args.iter().enumerate() {
                                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                                let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                                let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                                call_args.push(format!("{} {}", expected.llvm(), coerced));
                            }
                            if matches!(method.as_str(), "padLeft" | "padRight") && args.len() < 2 {
                                call_args.push("i8* null".to_string());
                            }
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call {} @{}({})\n",
                                out, ret_ty.llvm(), symbol, call_args.join(", ")
                            ));
                            store_reg_value(s, *r, &out, ret_ty);
                        } else {
                            return Err(format!(
                                "native build: unsupported method '{}' on text-typed value",
                                method
                            ));
                        }
                    }
                }
                LowType::List => {
                    let (symbol, ret_ty, expected_args): (&str, LowType, Vec<LowType>) =
                        match method.as_str() {
                            "add" => ("obo_list_add", LowType::List, vec![LowType::I64]),
                            "contains" => ("obo_list_contains", LowType::Bool, vec![LowType::I64]),
                            "indexOf" => ("obo_list_indexOf", LowType::I64, vec![LowType::I64]),
                            "sort" => ("obo_list_sort", LowType::List, vec![]),
                            "reverse" => ("obo_list_reverse", LowType::List, vec![]),
                            "take" => ("obo_list_take", LowType::List, vec![LowType::I64]),
                            "skip" => ("obo_list_skip", LowType::List, vec![LowType::I64]),
                            "slice" => ("obo_list_slice", LowType::List, vec![LowType::I64, LowType::I64]),
                            "remove" => ("obo_list_remove", LowType::List, vec![LowType::I64]),
                            "removeAt" => ("obo_list_removeAt", LowType::List, vec![LowType::I64]),
                            "insert" => ("obo_list_insert", LowType::List, vec![LowType::I64, LowType::I64]),
                            "join" => ("obo_list_join", LowType::Str, vec![LowType::Str]),
                            "distinct" => ("obo_list_distinct", LowType::List, vec![]),
                            "filter" => ("obo_list_filter", LowType::List, vec![LowType::Closure]),
                            "map" => ("obo_list_map", LowType::List, vec![LowType::Closure]),
                            "reduce" => ("obo_list_reduce", LowType::I64, vec![LowType::I64, LowType::Closure]),
                            "any" => ("obo_list_any", LowType::Bool, vec![LowType::Closure]),
                            "all" => ("obo_list_all", LowType::Bool, vec![LowType::Closure]),
                            "sortBy" => ("obo_list_sort_by", LowType::List, vec![LowType::Closure]),
                            _ => {
                                return Err(format!(
                                    "native build: unsupported list method '{}'",
                                    method
                                ))
                            }
                        };
                    let mut call_args = vec![format!("i8* {}", obj_val)];
                    for (index, arg) in args.iter().enumerate() {
                        let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                        let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                        let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                        call_args.push(format!("{} {}", expected.llvm(), coerced));
                    }
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call {} @{}({})\n",
                        out,
                        ret_ty.llvm(),
                        symbol,
                        call_args.join(", ")
                    ));
                    store_reg_value(s, *r, &out, ret_ty);
                }
                LowType::MixedList => {
                    let (symbol, ret_ty, expected_args): (&str, LowType, Vec<LowType>) =
                        match method.as_str() {
                            "filter" => ("obo_mixed_list_filter", LowType::MixedList, vec![LowType::Closure]),
                            "map" => ("obo_mixed_list_map", LowType::MixedList, vec![LowType::Closure]),
                            "each" => ("obo_mixed_list_each", LowType::MixedList, vec![LowType::Closure]),
                            "add" => ("obo_mixed_list_add", LowType::MixedList, vec![LowType::Dyn]),
                            "removeAt" => ("obo_mixed_list_removeAt", LowType::MixedList, vec![LowType::I64]),
                            "join" => ("obo_mixed_list_join", LowType::Str, vec![LowType::Str]),
                            "contains" => ("obo_mixed_list_contains", LowType::Bool, vec![LowType::Dyn]),
                            "reduce" => ("obo_mixed_list_reduce", LowType::Dyn, vec![LowType::Dyn, LowType::Closure]),
                            "any" => ("obo_mixed_list_any", LowType::Bool, vec![LowType::Closure]),
                            "all" => ("obo_mixed_list_all", LowType::Bool, vec![LowType::Closure]),
                            "sortBy" => ("obo_mixed_list_sort_by", LowType::MixedList, vec![LowType::Closure]),
                            _ => {
                                return Err(format!(
                                    "native build: unsupported mixed list method '{}'",
                                    method
                                ))
                            }
                        };
                    let mut call_args = vec![format!("i8* {}", obj_val)];
                    for (index, arg) in args.iter().enumerate() {
                        let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                        let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                        let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                        call_args.push(format!("{} {}", expected.llvm(), coerced));
                    }
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call {} @{}({})\n",
                        out,
                        ret_ty.llvm(),
                        symbol,
                        call_args.join(", ")
                    ));
                    store_reg_value(s, *r, &out, ret_ty);
                }
                LowType::F64List => {
                    if method == "add" {
                        if args.is_empty() {
                            return Err("native build: f64 list add expects 1 argument".into());
                        }
                        let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                        let arg_f64 = coerce_value(s, tmp, &arg_val, arg_ty, LowType::F64)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_f64_list_add(i8* {}, double {})\n",
                            out, obj_val, arg_f64
                        ));
                        store_reg_value(s, *r, &out, LowType::F64List);
                    } else {
                        return Err(format!(
                            "native build: unsupported f64 list method '{}'",
                            method
                        ));
                    }
                }
                LowType::Map => {
                    if method == "set" {
                        if args.len() != 2 {
                            return Err("native build: map.set expects exactly 2 arguments".into());
                        }
                        let (key_val, key_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                        let key_ptr = coerce_value(s, tmp, &key_val, key_ty, LowType::Str)?;
                        let (value_val, value_ty) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                        emit_object_store_call(
                            s,
                            tmp,
                            "map",
                            &obj_val,
                            &key_ptr,
                            &args[1],
                            &value_val,
                            value_ty,
                        )?;
                        store_reg_value(s, *r, &obj_val, LowType::Map);
                        return Ok(());
                    }
                    let (symbol, ret_ty, expected_args): (&str, LowType, Vec<LowType>) =
                        match method.as_str() {
                            "has" => ("obo_map_has", LowType::Bool, vec![LowType::Str]),
                            "get" => ("obo_map_get_boxed", LowType::Dyn, vec![LowType::Str]),
                            "remove" => ("obo_map_remove", LowType::Map, vec![LowType::Str]),
                            _ => {
                                return Err(format!(
                                    "native build: unsupported map method '{}'",
                                    method
                                ))
                            }
                        };
                    let mut call_args = vec![format!("i8* {}", obj_val)];
                    for (index, arg) in args.iter().enumerate() {
                        let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                        let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                        let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                        call_args.push(format!("{} {}", expected.llvm(), coerced));
                    }
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call {} @{}({})\n",
                        out,
                        ret_ty.llvm(),
                        symbol,
                        call_args.join(", ")
                    ));
                    store_reg_value(s, *r, &out, ret_ty);
                }
                LowType::Entity | LowType::Dyn => {
                    if let Some(full_name) = resolve_instance_method(ir, method, args.len()) {
                        let func = ir
                            .functions
                            .iter()
                            .find(|candidate| candidate.name == full_name)
                            .ok_or_else(|| format!("native build: missing method body '{}()'", full_name))?;
                        let ret_ty = fn_ret.get(full_name).copied().unwrap_or(LowType::I64);
                        let obj_coerced = coerce_value(s, tmp, &obj_val, obj_ty, param_low_type(func, 0))?;
                        let mut call_args = vec![format!("{} {}", param_low_type(func, 0).llvm(), obj_coerced)];
                        for (index, arg) in args.iter().enumerate() {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                            let expected = param_low_type(func, index + 1);
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                            call_args.push(format!("{} {}", expected.llvm(), coerced));
                        }
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call {} @{}({})\n",
                            out,
                            ret_ty.llvm(),
                            sanitize_global(full_name),
                            call_args.join(", ")
                        ));
                        store_reg_value(s, *r, &out, ret_ty);
                    } else if obj_ty == LowType::Dyn {
                        // Dyn values may be channels/atomics or lists/maps at runtime.
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                        // Check for list methods on Dyn — treat as MixedList
                        let mixed_list_method: Option<(&str, LowType, Vec<LowType>)> = match method.as_str() {
                            "filter" => Some(("obo_mixed_list_filter", LowType::MixedList, vec![LowType::Closure])),
                            "map" => Some(("obo_mixed_list_map", LowType::MixedList, vec![LowType::Closure])),
                            "each" => Some(("obo_mixed_list_each", LowType::MixedList, vec![LowType::Closure])),
                            "add" => Some(("obo_mixed_list_add", LowType::MixedList, vec![LowType::Dyn])),
                            "removeAt" => Some(("obo_mixed_list_removeAt", LowType::MixedList, vec![LowType::I64])),
                            "reduce" => Some(("obo_mixed_list_reduce", LowType::Dyn, vec![LowType::Dyn, LowType::Closure])),
                            "any" => Some(("obo_mixed_list_any", LowType::Bool, vec![LowType::Closure])),
                            "all" => Some(("obo_mixed_list_all", LowType::Bool, vec![LowType::Closure])),
                            "contains" => Some(("obo_mixed_list_contains", LowType::Bool, vec![LowType::Dyn])),
                            "join" => Some(("obo_mixed_list_join", LowType::Str, vec![LowType::Str])),
                            "sortBy" => Some(("obo_mixed_list_sort_by", LowType::MixedList, vec![LowType::Closure])),
                            _ => None,
                        };
                        // Check for string methods on Dyn
                        let str_method: Option<(&str, LowType, Vec<LowType>)> = if mixed_list_method.is_none() {
                            match method.as_str() {
                                "contains" | "startsWith" | "endsWith" | "indexOf" | "split"
                                    => Some((&"", LowType::Str, vec![LowType::Str])),
                                "replace" => Some((&"", LowType::Str, vec![LowType::Str, LowType::Str])),
                                "substring" => Some((&"", LowType::Str, vec![LowType::I64, LowType::I64])),
                                "repeat" => Some((&"", LowType::Str, vec![LowType::I64])),
                                "padLeft" | "padRight" => Some((&"", LowType::Str, vec![LowType::I64, LowType::Str])),
                                "toNumber" => Some((&"", LowType::I64, vec![])),
                                "toDecimal" => Some((&"", LowType::F64, vec![])),
                                _ => None,
                            }
                        } else {
                            None
                        };
                        // Check for map methods on Dyn
                        let map_method: Option<(&str, LowType, Vec<LowType>)> = if mixed_list_method.is_none() {
                            match method.as_str() {
                                "has" => Some(("obo_map_has", LowType::Bool, vec![LowType::Str])),
                                "get" => Some(("obo_map_get_boxed", LowType::Dyn, vec![LowType::Str])),
                                "remove" => Some(("obo_map_remove", LowType::Map, vec![LowType::Str])),
                                "set" => None, // handled separately below
                                _ => None,
                            }
                        } else {
                            None
                        };
                        if method == "set" && args.len() == 2 {
                            let map_ptr = coerce_value(s, tmp, &obj_ptr, LowType::Dyn, LowType::Map)?;
                            let (key_val, key_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                            let key_str = coerce_value(s, tmp, &key_val, key_ty, LowType::Str)?;
                            let (value_val, value_ty) = emit_operand(s, tmp, &args[1], reg_ty, var_ty, string_table)?;
                            emit_object_store_call(s, tmp, "map", &map_ptr, &key_str, &args[1], &value_val, value_ty)?;
                            store_reg_value(s, *r, &obj_ptr, LowType::Dyn);
                        } else if let Some((_, ret_ty, expected_args)) = str_method {
                            // Coerce Dyn to Str and call __text_<method>
                            let str_val = coerce_value(s, tmp, &obj_ptr, LowType::Dyn, LowType::Str)?;
                            let symbol = format!("__text_{}", method);
                            let mut call_args = vec![format!("i8* {}", str_val)];
                            for (index, arg) in args.iter().enumerate() {
                                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                                let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                                let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                                call_args.push(format!("{} {}", expected.llvm(), coerced));
                            }
                            if matches!(method.as_str(), "padLeft" | "padRight") && args.len() < 2 {
                                call_args.push("i8* null".to_string());
                            }
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call {} @{}({})\n",
                                out, ret_ty.llvm(), symbol, call_args.join(", ")
                            ));
                            store_reg_value(s, *r, &out, ret_ty);
                        } else if let Some((symbol, ret_ty, expected_args)) = mixed_list_method {
                            let list_ptr = coerce_value(s, tmp, &obj_ptr, LowType::Dyn, LowType::MixedList)?;
                            let mut call_args = vec![format!("i8* {}", list_ptr)];
                            for (index, arg) in args.iter().enumerate() {
                                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                                let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                                let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                                call_args.push(format!("{} {}", expected.llvm(), coerced));
                            }
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call {} @{}({})\n",
                                out, ret_ty.llvm(), symbol, call_args.join(", ")
                            ));
                            // Re-box MixedList results so the value stays boxed (Dyn).
                            // The receiver was un-boxed via obo_value_as_mixed_list_ptr,
                            // so the result must be re-boxed for subsequent Dyn operations
                            // (e.g. obo_value_len) to work correctly.
                            if ret_ty == LowType::MixedList {
                                let boxed = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = call i8* @obo_box_list(i8* {})\n",
                                    boxed, out
                                ));
                                store_reg_value(s, *r, &boxed, LowType::Dyn);
                            } else {
                                store_reg_value(s, *r, &out, ret_ty);
                            }
                        } else if let Some((symbol, ret_ty, expected_args)) = map_method {
                            let map_ptr = coerce_value(s, tmp, &obj_ptr, LowType::Dyn, LowType::Map)?;
                            let mut call_args = vec![format!("i8* {}", map_ptr)];
                            for (index, arg) in args.iter().enumerate() {
                                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                                let expected = *expected_args.get(index).unwrap_or(&arg_ty);
                                let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
                                call_args.push(format!("{} {}", expected.llvm(), coerced));
                            }
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call {} @{}({})\n",
                                out, ret_ty.llvm(), symbol, call_args.join(", ")
                            ));
                            store_reg_value(s, *r, &out, ret_ty);
                        } else {
                            // Channel/atomic methods on Dyn
                            match method.as_str() {
                                "send" if !args.is_empty() => {
                                    let (av, at) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                                    let cv = coerce_value(s, tmp, &av, at, LowType::I64)?;
                                    s.push_str(&format!("  call void @obo_channel_send(i8* {}, i64 {})\n", obj_ptr, cv));
                                    store_reg_value(s, *r, "0", LowType::I64);
                                }
                                "receive" => {
                                    let out = fresh_tmp(tmp);
                                    s.push_str(&format!("  {} = call i64 @obo_channel_receive(i8* {})\n", out, obj_ptr));
                                    store_reg_value(s, *r, &out, LowType::I64);
                                }
                                "load" | "increment" | "decrement" => {
                                    let sym = match method.as_str() {
                                        "load" => "obo_atomic_load",
                                        "increment" => "obo_atomic_add",
                                        "decrement" => "obo_atomic_sub",
                                        _ => unreachable!(),
                                    };
                                    let delta = if method == "load" { "" } else { ", i64 1" };
                                    let out = fresh_tmp(tmp);
                                    s.push_str(&format!("  {} = call i64 @{}(i8* {}{})\n", out, sym, obj_ptr, delta));
                                    store_reg_value(s, *r, &out, LowType::I64);
                                }
                                "store" if !args.is_empty() => {
                                    let (av, at) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                                    let cv = coerce_value(s, tmp, &av, at, LowType::I64)?;
                                    s.push_str(&format!("  call void @obo_atomic_store(i8* {}, i64 {})\n", obj_ptr, cv));
                                    store_reg_value(s, *r, "0", LowType::I64);
                                }
                                "sub" if !args.is_empty() => {
                                    let (av, at) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                                    let cv = coerce_value(s, tmp, &av, at, LowType::I64)?;
                                    let out = fresh_tmp(tmp);
                                    s.push_str(&format!("  {} = call i64 @obo_atomic_sub(i8* {}, i64 {})\n", out, obj_ptr, cv));
                                    store_reg_value(s, *r, &out, LowType::I64);
                                }
                                _ => {
                                    return Err(format!(
                                        "native build: could not resolve method '{}({} args)' on dynamic value",
                                        method, args.len()
                                    ));
                                }
                            }
                        }
                    } else {
                        return Err(format!(
                            "native build: could not resolve entity method '{}({} args)'",
                            method,
                            args.len()
                        ));
                    }
                }
                _ => {
                    // Channel and atomic method calls operate on opaque i8* pointers
                    match method.as_str() {
                        "send" if !args.is_empty() => {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            s.push_str(&format!(
                                "  call void @obo_channel_send(i8* {}, i64 {})\n",
                                obj_ptr, coerced
                            ));
                            store_reg_value(s, *r, "0", LowType::I64);
                        }
                        "receive" => {
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i64 @obo_channel_receive(i8* {})\n",
                                out, obj_ptr
                            ));
                            store_reg_value(s, *r, &out, LowType::I64);
                        }
                        "add" if !args.is_empty() => {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i64 @obo_atomic_add(i8* {}, i64 {})\n",
                                out, obj_ptr, coerced
                            ));
                            store_reg_value(s, *r, &out, LowType::I64);
                        }
                        "sub" if !args.is_empty() => {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i64 @obo_atomic_sub(i8* {}, i64 {})\n",
                                out, obj_ptr, coerced
                            ));
                            store_reg_value(s, *r, &out, LowType::I64);
                        }
                        "store" if !args.is_empty() => {
                            let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                            let coerced = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            s.push_str(&format!(
                                "  call void @obo_atomic_store(i8* {}, i64 {})\n",
                                obj_ptr, coerced
                            ));
                            store_reg_value(s, *r, "0", LowType::I64);
                        }
                        "load" | "increment" | "decrement" => {
                            let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                            let sym = match method.as_str() {
                                "load" => "obo_atomic_load",
                                "increment" => "obo_atomic_add",
                                "decrement" => "obo_atomic_sub",
                                _ => unreachable!(),
                            };
                            let delta = if method == "load" { "" } else { ", i64 1" };
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i64 @{}(i8* {}{})\n",
                                out, sym, obj_ptr, delta
                            ));
                            store_reg_value(s, *r, &out, LowType::I64);
                        }
                        _ => {
                            // --- Pointer methods: offset, write, read ---
                            if method == "offset" && args.len() == 1 {
                                // ptr.offset(n) → add n bytes to pointer
                                let ptr_val = coerce_value(s, tmp, &obj_val, obj_ty, LowType::I64)?;
                                let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                                let offset = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                                // Convert i64 ptr to i8*, GEP, convert back
                                let base_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", base_ptr, ptr_val));
                                let new_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = getelementptr i8, i8* {}, i64 {}\n", new_ptr, base_ptr, offset));
                                let result = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = ptrtoint i8* {} to i64\n", result, new_ptr));
                                store_reg_value(s, *r, &result, LowType::I64);
                            } else if method == "write" && args.len() == 1 {
                                // ptr.write(value) → store value at pointer address
                                let ptr_val = coerce_value(s, tmp, &obj_val, obj_ty, LowType::I64)?;
                                let (arg_val, arg_ty) = emit_operand(s, tmp, &args[0], reg_ty, var_ty, string_table)?;
                                let base_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", base_ptr, ptr_val));
                                // Check if arg is a value type — write struct contents
                                let arg_vtype = if let Operand::Reg(reg) = &args[0] {
                                    packed_reg_types.get(&reg.0).filter(|n| ir.value_types.contains(n.as_str())).cloned()
                                } else { None };
                                if let Some(ref vt_name) = arg_vtype {
                                    if let Some(layout) = ir.packed_layouts.get(vt_name.as_str()) {
                                        let total_size: usize = layout.iter().map(|(_, ty)| packed_field_size(ty)).sum();
                                        // memcpy from value type to pointer
                                        s.push_str(&format!(
                                            "  call void @llvm.memcpy.p0i8.p0i8.i64(i8* {}, i8* {}, i64 {}, i1 false)\n",
                                            base_ptr, arg_val, total_size
                                        ));
                                    }
                                } else if arg_ty == LowType::F64 {
                                    let dbl_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!("  {} = bitcast i8* {} to double*\n", dbl_ptr, base_ptr));
                                    s.push_str(&format!("  store double {}, double* {}\n", arg_val, dbl_ptr));
                                } else {
                                    let i64_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", i64_ptr, base_ptr));
                                    let coerced = coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?;
                                    s.push_str(&format!("  store i64 {}, i64* {}\n", coerced, i64_ptr));
                                }
                                store_reg_value(s, *r, "0", LowType::I64);
                            } else if method == "read" && args.len() == 1 {
                                // ptr.read(size_in_bytes) → load i64 from pointer
                                let ptr_val = coerce_value(s, tmp, &obj_val, obj_ty, LowType::I64)?;
                                let base_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", base_ptr, ptr_val));
                                let i64_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", i64_ptr, base_ptr));
                                let out = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = load i64, i64* {}\n", out, i64_ptr));
                                store_reg_value(s, *r, &out, LowType::I64);
                            } else if method == "readF32" {
                                // ptr.readF32() → load float, widen to double
                                let ptr_val = coerce_value(s, tmp, &obj_val, obj_ty, LowType::I64)?;
                                let base_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", base_ptr, ptr_val));
                                let f_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = bitcast i8* {} to float*\n", f_ptr, base_ptr));
                                let fval = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = load float, float* {}\n", fval, f_ptr));
                                let dval = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = fpext float {} to double\n", dval, fval));
                                store_reg_value(s, *r, &dval, LowType::F64);
                            } else if method == "readF64" {
                                // ptr.readF64() → load double
                                let ptr_val = coerce_value(s, tmp, &obj_val, obj_ty, LowType::I64)?;
                                let base_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", base_ptr, ptr_val));
                                let d_ptr = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = bitcast i8* {} to double*\n", d_ptr, base_ptr));
                                let out = fresh_tmp(tmp);
                                s.push_str(&format!("  {} = load double, double* {}\n", out, d_ptr));
                                store_reg_value(s, *r, &out, LowType::F64);
                            } else {
                            return Err(format!(
                                "native build: unsupported method call '{}.{}(...)'",
                                obj_ty.llvm(), method
                            ))
                            }
                        }
                    }
                }
            }
        }
        Inst::GetField(r, obj, name) => {
            let (obj_val, obj_ty) = emit_operand(s, tmp, obj, reg_ty, var_ty, string_table)?;
            match obj_ty {
                LowType::Str => {
                    let known = match name.as_str() {
                        "length" | "count" => Some(("__text_length", LowType::I64)),
                        "empty" => Some(("__text_empty", LowType::Bool)),
                        "upper" => Some(("__text_upper", LowType::Str)),
                        "lower" => Some(("__text_lower", LowType::Str)),
                        "trim" => Some(("__text_trim", LowType::Str)),
                        "trimStart" => Some(("__text_trimStart", LowType::Str)),
                        "trimEnd" => Some(("__text_trimEnd", LowType::Str)),
                        "reversed" => Some(("__text_reversed", LowType::Str)),
                        _ => None,
                    };
                    if let Some((symbol, ret_ty)) = known {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = call {} @{}(i8* {})\n", out, ret_ty.llvm(), symbol, obj_val));
                        store_reg_value(s, *r, &out, ret_ty);
                    } else {
                        // Not a known text property — type inference may be wrong;
                        // treat as entity/dyn field access.
                        let key_ptr = interned_string_ptr(name, string_table)?;
                        let out = fresh_tmp(tmp);
                        if let Some(slot_idx) = resolve_field_slot(ir, name) {
                            let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
                            s.push_str(&format!(
                                "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                out, obj_val, offset
                            ));
                        } else {
                            s.push_str(&format!(
                                "  {} = call i8* @obo_entity_get_boxed(i8* {}, i8* {})\n",
                                out, obj_val, key_ptr
                            ));
                        }
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                }
                LowType::List => {
                    if name == "count" || name == "length" {
                        // Inline list_len: OboList.len at offset 0
                        let len_ptr = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, obj_val));
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = load i64, i64* {}\n", out, len_ptr));
                        store_reg_value(s, *r, &out, LowType::I64);
                    } else if name == "empty" {
                        // Inline list_len + compare
                        let len_ptr = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, obj_val));
                        let len = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = load i64, i64* {}\n", len, len_ptr));
                        let cmp = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp eq i64 {}, 0\n", cmp, len));
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", out, cmp));
                        store_reg_value(s, *r, &out, LowType::Bool);
                    } else {
                        let (symbol, ret_ty) = match name.as_str() {
                            "first" => ("obo_list_first", LowType::I64),
                            "last" => ("obo_list_last", LowType::I64),
                            _ => {
                                return Err(format!(
                                    "native build: unsupported list field '{}'",
                                    name
                                ))
                            }
                        };
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = call {} @{}(i8* {})\n", out, ret_ty.llvm(), symbol, obj_val));
                        store_reg_value(s, *r, &out, ret_ty);
                    }
                }
                LowType::MixedList => {
                    // Inline mixed_list_len: OboMixedList.len at offset 0
                    let len_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, obj_val));
                    let len = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = load i64, i64* {}\n", len, len_ptr));
                    if name == "empty" {
                        let cmp = fresh_tmp(tmp);
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp eq i64 {}, 0\n", cmp, len));
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
                        store_reg_value(s, *r, &ext, LowType::Bool);
                    } else if name == "count" || name == "length" {
                        store_reg_value(s, *r, &len, LowType::I64);
                    } else {
                        return Err(format!(
                            "native build: unsupported mixed list field '{}'",
                            name
                        ));
                    }
                }
                LowType::F64List => {
                    // Inline f64_list_len: OboF64List.len at offset 0
                    let len_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", len_ptr, obj_val));
                    let len = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = load i64, i64* {}\n", len, len_ptr));
                    if name == "empty" {
                        let cmp = fresh_tmp(tmp);
                        let ext = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = icmp eq i64 {}, 0\n", cmp, len));
                        s.push_str(&format!("  {} = zext i1 {} to i64\n", ext, cmp));
                        store_reg_value(s, *r, &ext, LowType::Bool);
                    } else if name == "count" || name == "length" {
                        store_reg_value(s, *r, &len, LowType::I64);
                    } else {
                        return Err(format!(
                            "native build: unsupported f64 list field '{}'",
                            name
                        ));
                    }
                }
                LowType::Map => {
                    if name == "count" || name == "length" {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = call i64 @obo_map_len(i8* {})\n", out, obj_val));
                        store_reg_value(s, *r, &out, LowType::I64);
                    } else if name == "empty" {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = call i64 @obo_map_empty(i8* {})\n", out, obj_val));
                        store_reg_value(s, *r, &out, LowType::Bool);
                    } else if name == "keys" {
                        let boxed = box_value(s, tmp, &obj_val, LowType::Map)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_value_keys(i8* {})\n",
                            out, boxed
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    } else {
                        let key_ptr = interned_string_ptr(name, string_table)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_map_get_boxed(i8* {}, i8* {})\n",
                            out, obj_val, key_ptr
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                }
                LowType::Entity => {
                    // Check if this is a packed entity
                    let packed_type_name = if let Operand::Reg(reg) = obj {
                        packed_reg_types.get(&reg.0).cloned()
                    } else {
                        None
                    };
                    if let Some(ref ptype) = packed_type_name {
                        if let Some(layout) = ir.packed_layouts.get(ptype.as_str()) {
                            if let Some(idx) = layout.iter().position(|(n, _)| n == name) {
                                let field_obo_ty = &layout[idx].1;
                                let llvm_ty = packed_field_llvm_type(field_obo_ty);
                                // Build struct type for GEP
                                let field_llvm_types: Vec<&str> = layout.iter().map(|(_, ty)| packed_field_llvm_type(ty)).collect();
                                let struct_ty = format!("<{{ {} }}>", field_llvm_types.join(", "));
                                // Bitcast i8* to struct pointer
                                let typed_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = bitcast i8* {} to {}*\n",
                                    typed_ptr, obj_val, struct_ty
                                ));
                                // GEP to field
                                let gep = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n",
                                    gep, struct_ty, struct_ty, typed_ptr, idx
                                ));
                                // Load field value
                                let raw_val = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = load {}, {}* {}\n",
                                    raw_val, llvm_ty, llvm_ty, gep
                                ));
                                // Widen to IR type
                                let (widened, wide_ty) = coerce_from_packed_field(s, tmp, &raw_val, llvm_ty, field_obo_ty);
                                store_reg_value(s, *r, &widened, wide_ty);
                            } else {
                                return Err(format!("native build: packed entity '{}' has no field '{}'", ptype, name));
                            }
                        } else {
                            return Err(format!("native build: unknown packed type '{}'", ptype));
                        }
                    } else {
                    let key_ptr = interned_string_ptr(name, string_table)?;
                    let result_ty = reg_ty.get(r.0 as usize).and_then(|t| *t).unwrap_or(LowType::Dyn);
                    if let Some(slot_idx) = resolve_field_slot(ir, name) {
                        match result_ty {
                            LowType::F64 => {
                                // Load raw double from slot[idx].u.f64_val directly.
                                let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                let raw_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                    raw_ptr, obj_val, union_offset
                                ));
                                let dbl_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = bitcast i8* {} to double*\n",
                                    dbl_ptr, raw_ptr
                                ));
                                let dbl_val = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = load double, double* {}\n",
                                    dbl_val, dbl_ptr
                                ));
                                store_reg_value(s, *r, &dbl_val, LowType::F64);
                            }
                            LowType::I64 => {
                                // Load raw i64 from slot[idx].u.i64_val directly.
                                let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                let raw_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                    raw_ptr, obj_val, union_offset
                                ));
                                let i64_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = bitcast i8* {} to i64*\n",
                                    i64_ptr, raw_ptr
                                ));
                                let i64_val = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = load i64, i64* {}\n",
                                    i64_val, i64_ptr
                                ));
                                store_reg_value(s, *r, &i64_val, LowType::I64);
                            }
                            _ => {
                                // Return OboValue* pointer (boxed dynamic).
                                let out = fresh_tmp(tmp);
                                let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
                                s.push_str(&format!(
                                    "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                    out, obj_val, offset
                                ));
                                store_reg_value(s, *r, &out, LowType::Dyn);
                            }
                        }
                    } else {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_entity_get_boxed(i8* {}, i8* {})\n",
                            out, obj_val, key_ptr
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                    } // close else (non-packed entity GetField)
                }
                LowType::Dyn => {
                    if name == "count" || name == "length" {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_value_len(i8* {})\n",
                            out, obj_val
                        ));
                        store_reg_value(s, *r, &out, LowType::I64);
                    } else if name == "empty" {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_value_empty(i8* {})\n",
                            out, obj_val
                        ));
                        store_reg_value(s, *r, &out, LowType::Bool);
                    } else if name == "keys" {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_value_keys(i8* {})\n",
                            out, obj_val
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    } else {
                        // Use cached entity pointer if available (avoids redundant obo_value_as_entity_ptr calls)
                        let obj_ptr = if let Operand::Reg(reg) = obj {
                            if let Some(var_name) = reg_source_var.get(&reg.0) {
                                if let Some(cached) = entity_ptr_cache.get(var_name) {
                                    cached.clone()
                                } else {
                                    let ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?;
                                    entity_ptr_cache.insert(var_name.clone(), ptr.clone());
                                    ptr
                                }
                            } else {
                                coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?
                            }
                        } else {
                            coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?
                        };
                        let key_ptr = interned_string_ptr(name, string_table)?;
                        let result_ty = reg_ty.get(r.0 as usize).and_then(|t| *t).unwrap_or(LowType::Dyn);
                        if let Some(slot_idx) = resolve_field_slot(ir, name) {
                            match result_ty {
                                LowType::F64 => {
                                    let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                    let raw_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        raw_ptr, obj_ptr, union_offset
                                    ));
                                    let dbl_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = bitcast i8* {} to double*\n",
                                        dbl_ptr, raw_ptr
                                    ));
                                    let dbl_val = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = load double, double* {}\n",
                                        dbl_val, dbl_ptr
                                    ));
                                    store_reg_value(s, *r, &dbl_val, LowType::F64);
                                }
                                LowType::I64 => {
                                    let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                    let raw_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        raw_ptr, obj_ptr, union_offset
                                    ));
                                    let i64_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = bitcast i8* {} to i64*\n",
                                        i64_ptr, raw_ptr
                                    ));
                                    let i64_val = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = load i64, i64* {}\n",
                                        i64_val, i64_ptr
                                    ));
                                    store_reg_value(s, *r, &i64_val, LowType::I64);
                                }
                                _ => {
                                    let out = fresh_tmp(tmp);
                                    let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        out, obj_ptr, offset
                                    ));
                                    store_reg_value(s, *r, &out, LowType::Dyn);
                                }
                            }
                        } else {
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_entity_get_boxed(i8* {}, i8* {})\n",
                                out, obj_ptr, key_ptr
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        }
                    }
                }
                _ => {
                    if f.name.starts_with("__closure_") && matches!(obj_ty, LowType::I64 | LowType::Bool) {
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?;
                        let key_ptr = interned_string_ptr(name, string_table)?;
                        let result_ty = reg_ty.get(r.0 as usize).and_then(|t| *t).unwrap_or(LowType::Dyn);
                        if let Some(slot_idx) = resolve_field_slot(ir, name) {
                            match result_ty {
                                LowType::I64 => {
                                    let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                    let raw_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        raw_ptr, obj_ptr, union_offset
                                    ));
                                    let i64_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = bitcast i8* {} to i64*\n",
                                        i64_ptr, raw_ptr
                                    ));
                                    let i64_val = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = load i64, i64* {}\n",
                                        i64_val, i64_ptr
                                    ));
                                    store_reg_value(s, *r, &i64_val, LowType::I64);
                                }
                                LowType::F64 => {
                                    let union_offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE + OBOVALUE_UNION_OFFSET;
                                    let raw_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        raw_ptr, obj_ptr, union_offset
                                    ));
                                    let dbl_ptr = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = bitcast i8* {} to double*\n",
                                        dbl_ptr, raw_ptr
                                    ));
                                    let dbl_val = fresh_tmp(tmp);
                                    s.push_str(&format!(
                                        "  {} = load double, double* {}\n",
                                        dbl_val, dbl_ptr
                                    ));
                                    store_reg_value(s, *r, &dbl_val, LowType::F64);
                                }
                                _ => {
                                    let out = fresh_tmp(tmp);
                                    let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
                                    s.push_str(&format!(
                                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                        out, obj_ptr, offset
                                    ));
                                    store_reg_value(s, *r, &out, LowType::Dyn);
                                }
                            }
                        } else {
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_entity_get_boxed(i8* {}, i8* {})\n",
                                out, obj_ptr, key_ptr
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        }
                    } else if name == "value" || name == "load" {
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_atomic_load(i8* {})\n",
                            out, obj_ptr
                        ));
                        store_reg_value(s, *r, &out, LowType::I64);
                    } else if name == "count" || name == "length" {
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_map_len(i8* {})\n",
                            out, obj_ptr
                        ));
                        store_reg_value(s, *r, &out, LowType::I64);
                    } else if name == "empty" {
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i64 @obo_map_empty(i8* {})\n",
                            out, obj_ptr
                        ));
                        store_reg_value(s, *r, &out, LowType::Bool);
                    } else {
                        // Fallback: coerce to Dyn and use entity field access
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Dyn)?;
                        let key_ptr = interned_string_ptr(name, string_table)?;
                        let out = fresh_tmp(tmp);
                        if let Some(slot_idx) = resolve_field_slot(ir, name) {
                            let offset = SLOTTED_SLOTS_OFFSET + slot_idx as i64 * OBOVALUE_SIZE;
                            s.push_str(&format!(
                                "  {} = getelementptr i8, i8* {}, i64 {}\n",
                                out, obj_ptr, offset
                            ));
                        } else {
                            s.push_str(&format!(
                                "  {} = call i8* @obo_entity_get_boxed(i8* {}, i8* {})\n",
                                out, obj_ptr, key_ptr
                            ));
                        }
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                }
            }
        }
        Inst::SetField(obj, name, value) => {
            let (obj_val, obj_ty) = emit_operand(s, tmp, obj, reg_ty, var_ty, string_table)?;
            let (value_val, value_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
            let key_ptr = interned_string_ptr(name, string_table)?;
            match obj_ty {
                LowType::Entity => {
                    // Check if this is a packed entity
                    let packed_type_name = if let Operand::Reg(reg) = obj {
                        packed_reg_types.get(&reg.0).cloned()
                    } else {
                        None
                    };
                    if let Some(ref ptype) = packed_type_name {
                        if let Some(layout) = ir.packed_layouts.get(ptype.as_str()) {
                            if let Some(idx) = layout.iter().position(|(n, _)| n == name) {
                                let field_obo_ty = &layout[idx].1;
                                let llvm_ty = packed_field_llvm_type(field_obo_ty);
                                let field_llvm_types: Vec<&str> = layout.iter().map(|(_, ty)| packed_field_llvm_type(ty)).collect();
                                let struct_ty = format!("<{{ {} }}>", field_llvm_types.join(", "));
                                let typed_ptr = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = bitcast i8* {} to {}*\n",
                                    typed_ptr, obj_val, struct_ty
                                ));
                                let gep = fresh_tmp(tmp);
                                s.push_str(&format!(
                                    "  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n",
                                    gep, struct_ty, struct_ty, typed_ptr, idx
                                ));
                                let coerced = coerce_to_packed_field(s, tmp, &value_val, value_ty, llvm_ty);
                                s.push_str(&format!(
                                    "  store {} {}, {}* {}\n",
                                    llvm_ty, coerced, llvm_ty, gep
                                ));
                            } else {
                                return Err(format!("native build: packed entity '{}' has no field '{}'", ptype, name));
                            }
                        } else {
                            return Err(format!("native build: unknown packed type '{}'", ptype));
                        }
                    } else {
                    if let Some(slot_idx) = resolve_field_slot(ir, name) {
                        let skip_tag = consistent_field_types.get(name.as_str()).copied() == Some(value_ty);
                        emit_entity_sfs_call(
                            s, tmp, &obj_val, slot_idx, &key_ptr,
                            value, &value_val, value_ty, skip_tag,
                        )?;
                    } else {
                        emit_object_store_call(
                            s, tmp, "entity", &obj_val, &key_ptr,
                            value, &value_val, value_ty,
                        )?;
                    }
                    }
                }
                LowType::Map => emit_object_store_call(
                    s, tmp, "map", &obj_val, &key_ptr,
                    value, &value_val, value_ty,
                )?,
                LowType::Dyn | LowType::I64 | LowType::Bool => {
                    // Use cached entity pointer if available
                    let obj_ptr = if obj_ty == LowType::Dyn {
                        if let Operand::Reg(reg) = obj {
                            if let Some(var_name) = reg_source_var.get(&reg.0) {
                                if let Some(cached) = entity_ptr_cache.get(var_name) {
                                    cached.clone()
                                } else {
                                    let ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?;
                                    entity_ptr_cache.insert(var_name.clone(), ptr.clone());
                                    ptr
                                }
                            } else {
                                coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?
                            }
                        } else {
                            coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?
                        }
                    } else {
                        coerce_value(s, tmp, &obj_val, obj_ty, LowType::Entity)?
                    };
                    if let Some(slot_idx) = resolve_field_slot(ir, name) {
                        let skip_tag = consistent_field_types.get(name.as_str()).copied() == Some(value_ty);
                        emit_entity_sfs_call(
                            s, tmp, &obj_ptr, slot_idx, &key_ptr,
                            value, &value_val, value_ty, skip_tag,
                        )?;
                    } else {
                        emit_object_store_call(
                            s, tmp, "entity", &obj_ptr, &key_ptr,
                            value, &value_val, value_ty,
                        )?;
                    }
                }
                _ => return Err("native build: set_field is only supported on maps and entities".into()),
            }
        }
        Inst::GetIndex(r, obj, index) => {
            let (obj_val, obj_ty) = emit_operand(s, tmp, obj, reg_ty, var_ty, string_table)?;
            let (idx_val, idx_ty) = emit_operand(s, tmp, index, reg_ty, var_ty, string_table)?;
            match obj_ty {
                LowType::List => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    // Inline list_get: OboList = {i64 len, i64 cap, i64[] items}
                    // items start at offset 16. Element at offset 16 + idx * 8.
                    let byte_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = mul i64 {}, 8\n", byte_off, idx_i64));
                    let total_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                    let elem_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                        elem_ptr, obj_val, total_off
                    ));
                    let typed_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", typed_ptr, elem_ptr));
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = load i64, i64* {}\n", out, typed_ptr));
                    store_reg_value(s, *r, &out, LowType::I64);
                }
                LowType::MixedList => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    let byte_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = mul i64 {}, 16\n", byte_off, idx_i64));
                    let total_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                    let elem_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                        elem_ptr, obj_val, total_off
                    ));
                    // Typed-array optimization: if result is Entity, extract entity pointer
                    // from OboValue.u.ptr (offset 8 within OboValue) inline.
                    let result_ty = reg_ty.get(r.0 as usize).and_then(|t| *t).unwrap_or(LowType::Dyn);
                    if result_ty == LowType::Entity {
                        let union_ptr = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = getelementptr i8, i8* {}, i64 8\n", union_ptr, elem_ptr));
                        let ptr_cast = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast i8* {} to i8**\n", ptr_cast, union_ptr));
                        let entity_ptr = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = load i8*, i8** {}\n", entity_ptr, ptr_cast));
                        store_reg_value(s, *r, &entity_ptr, LowType::Entity);
                    } else {
                        store_reg_value(s, *r, &elem_ptr, LowType::Dyn);
                    }
                }
                LowType::F64List => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    // Inline f64_list_get: OboF64List = {i64 len, i64 cap, double[] items}
                    // items start at offset 16. Element at offset 16 + idx * 8.
                    let byte_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = mul i64 {}, 8\n", byte_off, idx_i64));
                    let total_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                    let elem_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                        elem_ptr, obj_val, total_off
                    ));
                    let typed_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to double*\n", typed_ptr, elem_ptr));
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = load double, double* {}\n", out, typed_ptr));
                    store_reg_value(s, *r, &out, LowType::F64);
                }
                LowType::Map | LowType::Entity => {
                    let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Map)?;
                    if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                        // Integer key → obo_map_get_int_boxed
                        let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_map_get_int_boxed(i8* {}, i64 {})\n",
                            out, obj_ptr, idx_i64
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    } else {
                        let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = call i8* @obo_map_get_boxed(i8* {}, i8* {})\n",
                            out, obj_ptr, key
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                }
                LowType::Dyn => {
                    if f.name.starts_with("__closure_") {
                        // In closures, types are unreliable. Use runtime dispatch.
                        if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                            let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_dyn_index(i8* {}, i64 {})\n",
                                out, obj_val, idx_i64
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        } else {
                            let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_dyn_index_str(i8* {}, i8* {})\n",
                                out, obj_val, key
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        }
                    } else if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                        let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::MixedList)?;
                        let byte_off = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = mul i64 {}, 16\n", byte_off, idx_i64));
                        let total_off = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = getelementptr i8, i8* {}, i64 {}\n",
                            out, obj_ptr, total_off
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    } else {
                        let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                        let out = fresh_tmp(tmp);
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Map)?;
                        s.push_str(&format!(
                            "  {} = call i8* @obo_map_get_boxed(i8* {}, i8* {})\n",
                            out, obj_ptr, key
                        ));
                        store_reg_value(s, *r, &out, LowType::Dyn);
                    }
                }
                _ => {
                    if f.name.starts_with("__closure_") && matches!(obj_ty, LowType::I64 | LowType::Bool) {
                        // In closures all captures/params are i64 — obo_value_to_closure_arg
                        // extracts the RAW pointer (OboMap*/OboList*/Entity*), not an OboValue*.
                        // Use the raw pointer directly with the appropriate runtime call.
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::MixedList)?;
                        if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                            let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_mixed_list_get(i8* {}, i64 {})\n",
                                out, obj_ptr, idx_i64
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        } else {
                            let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_map_get_boxed(i8* {}, i8* {})\n",
                                out, obj_ptr, key
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        }
                    } else {
                        // Non-closure fallback: use static type to choose path
                        let target_ty = LowType::Dyn;
                        let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, target_ty)?;
                        if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                            let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_mixed_list_get(i8* {}, i64 {})\n",
                                out, obj_ptr, idx_i64
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        } else {
                            let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                            let out = fresh_tmp(tmp);
                            s.push_str(&format!(
                                "  {} = call i8* @obo_map_get_boxed(i8* {}, i8* {})\n",
                                out, obj_ptr, key
                            ));
                            store_reg_value(s, *r, &out, LowType::Dyn);
                        }
                    }
                }
            }
        }
        Inst::SetIndex(obj, index, value) => {
            let (obj_val, obj_ty) = emit_operand(s, tmp, obj, reg_ty, var_ty, string_table)?;
            let (idx_val, idx_ty) = emit_operand(s, tmp, index, reg_ty, var_ty, string_table)?;
            let (value_val, value_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
            match obj_ty {
                LowType::List => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    // F64 values must be bitcast (not fptosi) to preserve float bits in the i64 slot.
                    let value_i64 = if value_ty == LowType::F64 {
                        let bc = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast double {} to i64\n", bc, value_val));
                        bc
                    } else {
                        coerce_value(s, tmp, &value_val, value_ty, LowType::I64)?
                    };
                    // Inline list_set: OboList = {i64 len, i64 cap, i64[] items}
                    // items start at offset 16. Element at offset 16 + idx * 8.
                    let byte_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = mul i64 {}, 8\n", byte_off, idx_i64));
                    let total_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                    let elem_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                        elem_ptr, obj_val, total_off
                    ));
                    let typed_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", typed_ptr, elem_ptr));
                    s.push_str(&format!("  store i64 {}, i64* {}\n", value_i64, typed_ptr));
                }
                LowType::MixedList => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    let boxed = box_value(s, tmp, &value_val, value_ty)?;
                    s.push_str(&format!(
                        "  call void @obo_mixed_list_set(i8* {}, i64 {}, i8* {})\n",
                        obj_val, idx_i64, boxed
                    ));
                }
                LowType::F64List => {
                    let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                    let value_f64 = coerce_value(s, tmp, &value_val, value_ty, LowType::F64)?;
                    // Inline f64_list_set: OboF64List = {i64 len, i64 cap, double[] items}
                    // items start at offset 16. Element at offset 16 + idx * 8.
                    let byte_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = mul i64 {}, 8\n", byte_off, idx_i64));
                    let total_off = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = add i64 {}, 16\n", total_off, byte_off));
                    let elem_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr i8, i8* {}, i64 {}\n",
                        elem_ptr, obj_val, total_off
                    ));
                    let typed_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i8* {} to double*\n", typed_ptr, elem_ptr));
                    s.push_str(&format!("  store double {}, double* {}\n", value_f64, typed_ptr));
                }
                LowType::Map | LowType::Dyn | LowType::Entity => {
                    let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, LowType::Map)?;
                    if matches!(idx_ty, LowType::I64 | LowType::Bool) {
                        // Integer key path
                        let idx_i64 = coerce_value(s, tmp, &idx_val, idx_ty, LowType::I64)?;
                        match value_ty {
                            LowType::I64 => {
                                let vi = coerce_value(s, tmp, &value_val, value_ty, LowType::I64)?;
                                s.push_str(&format!(
                                    "  call i8* @obo_map_set_int(i8* {}, i64 {}, i64 {})\n",
                                    obj_ptr, idx_i64, vi
                                ));
                            }
                            LowType::Str => {
                                s.push_str(&format!(
                                    "  call i8* @obo_map_set_int_str(i8* {}, i64 {}, i8* {})\n",
                                    obj_ptr, idx_i64, value_val
                                ));
                            }
                            _ => {
                                let boxed = box_value(s, tmp, &value_val, value_ty)?;
                                s.push_str(&format!(
                                    "  call i8* @obo_map_set_int_boxed(i8* {}, i64 {}, i8* {})\n",
                                    obj_ptr, idx_i64, boxed
                                ));
                            }
                        }
                    } else {
                        let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                        emit_object_store_call(s, tmp, "map", &obj_ptr, &key, value, &value_val, value_ty)?;
                    }
                }
                _ => {
                    // Fallback: coerce to a raw map pointer for closure ABI values,
                    // otherwise go through the boxed dynamic path.
                    let key = coerce_value(s, tmp, &idx_val, idx_ty, LowType::Str)?;
                    let target_ty = if f.name.starts_with("__closure_") && matches!(obj_ty, LowType::I64 | LowType::Bool) {
                        LowType::Map
                    } else {
                        LowType::Dyn
                    };
                    let obj_ptr = coerce_value(s, tmp, &obj_val, obj_ty, target_ty)?;
                    emit_object_store_call(s, tmp, "map", &obj_ptr, &key, value, &value_val, value_ty)?;
                }
            }
        }
        Inst::MakeList(r, elements) => {
            let list_ty = reg_ty
                .get(r.0 as usize)
                .and_then(|ty| *ty)
                .unwrap_or(LowType::List);
            if list_ty == LowType::MixedList {
                let mixed = fresh_tmp(tmp);
                s.push_str(&format!(
                    "  {} = call i8* @obo_mixed_list_new(i64 {})\n",
                    mixed,
                    elements.len()
                ));
                for (index, element) in elements.iter().enumerate() {
                    let (value, value_ty) = emit_operand(s, tmp, element, reg_ty, var_ty, string_table)?;
                    let boxed = box_value(s, tmp, &value, value_ty)?;
                    s.push_str(&format!(
                        "  call void @obo_mixed_list_set(i8* {}, i64 {}, i8* {})\n",
                        mixed, index, boxed
                    ));
                }
                store_reg_value(s, *r, &mixed, LowType::MixedList);
            } else if list_ty == LowType::F64List {
                let list = if elements.is_empty() {
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_f64_list_new(i64 0, double* null)\n", out));
                    out
                } else {
                    let array = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = alloca [{} x double]\n", array, elements.len()));
                    for (index, element) in elements.iter().enumerate() {
                        let (value, value_ty) = emit_operand(s, tmp, element, reg_ty, var_ty, string_table)?;
                        let value_f64 = coerce_value(s, tmp, &value, value_ty, LowType::F64)?;
                        let slot = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = getelementptr inbounds [{} x double], [{} x double]* {}, i64 0, i64 {}\n",
                            slot,
                            elements.len(),
                            elements.len(),
                            array,
                            index
                        ));
                        s.push_str(&format!("  store double {}, double* {}\n", value_f64, slot));
                    }
                    let data = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr inbounds [{} x double], [{} x double]* {}, i64 0, i64 0\n",
                        data,
                        elements.len(),
                        elements.len(),
                        array
                    ));
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_f64_list_new(i64 {}, double* {})\n",
                        out,
                        elements.len(),
                        data
                    ));
                    out
                };
                store_reg_value(s, *r, &list, LowType::F64List);
            } else {
                let list = if elements.is_empty() {
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_list_new_i64(i64 0, i64* null)\n", out));
                    out
                } else {
                    let array = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = alloca [{} x i64]\n", array, elements.len()));
                    for (index, element) in elements.iter().enumerate() {
                        let (value, value_ty) = emit_operand(s, tmp, element, reg_ty, var_ty, string_table)?;
                        let value_i64 = coerce_value(s, tmp, &value, value_ty, LowType::I64)?;
                        let slot = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = getelementptr inbounds [{} x i64], [{} x i64]* {}, i64 0, i64 {}\n",
                            slot,
                            elements.len(),
                            elements.len(),
                            array,
                            index
                        ));
                        s.push_str(&format!("  store i64 {}, i64* {}\n", value_i64, slot));
                    }
                    let data = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = getelementptr inbounds [{} x i64], [{} x i64]* {}, i64 0, i64 0\n",
                        data,
                        elements.len(),
                        elements.len(),
                        array
                    ));
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @obo_list_new_i64(i64 {}, i64* {})\n",
                        out,
                        elements.len(),
                        data
                    ));
                    out
                };
                store_reg_value(s, *r, &list, LowType::List);
            }
        }
        Inst::MakeMap(r, pairs) => {
            let map = fresh_tmp(tmp);
            s.push_str(&format!("  {} = call i8* @obo_map_new()\n", map));
            for (key, value) in pairs {
                let (key_val, key_ty) = emit_operand(s, tmp, key, reg_ty, var_ty, string_table)?;
                let key_ptr = coerce_value(s, tmp, &key_val, key_ty, LowType::Str)?;
                let (value_val, value_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
                match value_ty {
                    _ => emit_object_store_call(
                        s,
                        tmp,
                        "map",
                        &map,
                        &key_ptr,
                        value,
                        &value_val,
                        value_ty,
                    )?,
                }
            }
            store_reg_value(s, *r, &map, LowType::Map);
        }
        Inst::MakeEntity(r, type_name, fields) => {
            let type_ptr = interned_string_ptr(type_name, string_table)?;
            let entity = fresh_tmp(tmp);
            if let Some(layout) = ir.entity_layouts.get(type_name.as_str()) {
                let nslots = layout.len() as i32;
                s.push_str(&format!(
                    "  {} = call i8* @obo_entity_new_slotted(i8* {}, i32 {})\n",
                    entity, type_ptr, nslots
                ));
                // Set field names for printing/reflection
                for (idx, fname) in layout.iter().enumerate() {
                    let name_ptr = interned_string_ptr(fname, string_table)?;
                    s.push_str(&format!(
                        "  call void @obo_entity_set_field_name(i8* {}, i32 {}, i8* {})\n",
                        entity, idx, name_ptr
                    ));
                }
                for (field_name, value) in fields {
                    let (field_val, field_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
                    if let Some(idx) = layout.iter().position(|f| f == field_name) {
                        emit_entity_slot_set_call(
                            s, tmp, &entity, idx as i32,
                            value, &field_val, field_ty,
                        )?;
                    } else {
                        // Unknown field in layout — fall back for safety
                        let key_ptr = interned_string_ptr(field_name, string_table)?;
                        emit_object_store_call(
                            s, tmp, "entity", &entity, &key_ptr,
                            value, &field_val, field_ty,
                        )?;
                    }
                }
            } else {
                s.push_str(&format!(
                    "  {} = call i8* @obo_entity_new(i8* {})\n",
                    entity, type_ptr
                ));
                for (field_name, value) in fields {
                    let key_ptr = interned_string_ptr(field_name, string_table)?;
                    let (field_val, field_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
                    emit_object_store_call(
                        s, tmp, "entity", &entity, &key_ptr,
                        value, &field_val, field_ty,
                    )?;
                }
            }
            store_reg_value(s, *r, &entity, LowType::Entity);
        }
        Inst::MakePackedEntity(r, type_name, fields) => {
            // Packed entity → LLVM packed struct.
            // Value types use stack allocation (alloca), packed entities use heap (malloc).
            if let Some(layout) = ir.packed_layouts.get(type_name.as_str()) {
                let is_value_type = ir.value_types.contains(type_name.as_str());
                // Build LLVM packed struct type string: <{ i16, i16, i32 }>
                let field_llvm_types: Vec<&str> = layout.iter().map(|(_, ty)| {
                    packed_field_llvm_type(ty)
                }).collect();
                let struct_ty = format!("<{{ {} }}>", field_llvm_types.join(", "));

                // Calculate total size
                let total_size: usize = layout.iter().map(|(_, ty)| packed_field_size(ty)).sum();

                let (raw, typed_ptr) = if is_value_type {
                    // Value type → stack-allocated via alloca
                    let alloca = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = alloca {}, align 1\n",
                        alloca, struct_ty
                    ));
                    let raw = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = bitcast {}* {} to i8*\n",
                        raw, struct_ty, alloca
                    ));
                    (raw, alloca.to_string())
                } else {
                    // Packed entity → heap-allocated via malloc
                    let raw = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i8* @malloc(i64 {})\n",
                        raw, total_size
                    ));
                    let typed_ptr = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = bitcast i8* {} to {}*\n",
                        typed_ptr, raw, struct_ty
                    ));
                    (raw, typed_ptr)
                };

                // Store each field via GEP
                for (field_name, value) in fields {
                    if let Some(idx) = layout.iter().position(|(n, _)| n == field_name) {
                        let (field_val, field_ty) = emit_operand(s, tmp, value, reg_ty, var_ty, string_table)?;
                        let llvm_ty = field_llvm_types[idx];
                        // Convert value to the target type
                        let coerced = coerce_to_packed_field(s, tmp, &field_val, field_ty, llvm_ty);
                        let gep = fresh_tmp(tmp);
                        s.push_str(&format!(
                            "  {} = getelementptr inbounds {}, {}* {}, i32 0, i32 {}\n",
                            gep, struct_ty, struct_ty, typed_ptr, idx
                        ));
                        s.push_str(&format!(
                            "  store {} {}, {}* {}\n",
                            llvm_ty, coerced, llvm_ty, gep
                        ));
                    }
                }

                store_reg_value(s, *r, &raw, LowType::Entity);
                packed_reg_types.insert(r.0, type_name.clone());
            } else {
                return Err(format!("native build: unknown packed type '{}'", type_name));
            }
        }
        Inst::Phi(_, _) => return Err("internal: phi should be rewritten before native emission".into()),
        Inst::MakeClosure(r, name, captures) => {
            let func = ir
                .functions
                .iter()
                .find(|candidate| candidate.name == *name)
                .ok_or_else(|| format!("native build: missing closure function '{}'", name))?;
            let mut signature = vec!["i8*".to_string()];
            for index in 1..func.params.len() {
                signature.push(param_low_type(func, index).llvm().to_string());
            }
            let fn_ptr = fresh_tmp(tmp);
            s.push_str(&format!(
                "  {} = bitcast {} ({})* @{} to i8*\n",
                fn_ptr,
                llvm_fn_ret_ty(name, fn_ret),
                signature.join(", "),
                sanitize_global(name)
            ));
            let closure = fresh_tmp(tmp);
            s.push_str(&format!(
                "  {} = call i8* @obo_closure_new(i8* {}, i64 {})\n",
                closure,
                fn_ptr,
                captures.len()
            ));
            for (index, capture) in captures.iter().enumerate() {
                let (capture_val, capture_ty) = emit_operand(s, tmp, capture, reg_ty, var_ty, string_table)?;
                // All pointer types must use ptrtoint for closure captures (stored as i64).
                let value_i64 = if capture_ty.is_ptr() {
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = ptrtoint i8* {} to i64\n", out, capture_val));
                    out
                } else {
                    coerce_value(s, tmp, &capture_val, capture_ty, LowType::I64)?
                };
                s.push_str(&format!(
                    "  call void @obo_closure_set_capture(i8* {}, i64 {}, i64 {})\n",
                    closure, index, value_i64
                ));
            }
            store_reg_value(s, *r, &closure, LowType::Closure);
        }
        Inst::CallClosure(r, closure, args) => {
            let (closure_val, closure_ty) = emit_operand(s, tmp, closure, reg_ty, var_ty, string_table)?;
            let closure_ptr = coerce_value(s, tmp, &closure_val, closure_ty, LowType::Closure)?;
            let symbol = match args.len() {
                0 => "obo_closure_call_0",
                1 => "obo_closure_call_1",
                2 => "obo_closure_call_2",
                _ => {
                    return Err(format!(
                        "native build: closures with {} call args are not supported yet",
                        args.len()
                    ))
                }
            };
            let mut call_args = vec![format!("i8* {}", closure_ptr)];
            for arg in args {
                let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
                let coerced = if arg_ty == LowType::Dyn {
                    let out = fresh_tmp(tmp);
                    s.push_str(&format!(
                        "  {} = call i64 @obo_value_to_closure_arg_boxed(i8* {})\n",
                        out, arg_val
                    ));
                    out
                } else {
                    coerce_value(s, tmp, &arg_val, arg_ty, LowType::I64)?
                };
                call_args.push(format!("i64 {}", coerced));
            }
            let out_raw = fresh_tmp(tmp);
            s.push_str(&format!(
                "  {} = call i64 @{}({})\n",
                out_raw,
                symbol,
                call_args.join(", ")
            ));
            let ret_ty = reg_ty
                .get(r.0 as usize)
                .and_then(|ty| *ty)
                .unwrap_or(LowType::I64);
            match ret_ty {
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    let out_ptr = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", out_ptr, out_raw));
                    store_reg_value(s, *r, &out_ptr, ret_ty);
                }
                LowType::F64 => {
                    let out_f64 = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = bitcast i64 {} to double\n", out_f64, out_raw));
                    store_reg_value(s, *r, &out_f64, ret_ty);
                }
                LowType::I64 | LowType::Bool => store_reg_value(s, *r, &out_raw, ret_ty),
            }
        }
        Inst::RunTask(r, closure) => {
            let (closure_val, closure_ty) = emit_operand(s, tmp, closure, reg_ty, var_ty, string_table)?;
            let closure_ptr = coerce_value(s, tmp, &closure_val, closure_ty, LowType::Closure)?;
            let out = fresh_tmp(tmp);
            s.push_str(&format!(
                "  {} = call i8* @obo_task_spawn(i8* {})\n",
                out, closure_ptr
            ));
            store_reg_value(s, *r, &out, LowType::Task);
        }
        Inst::WaitTask(task) => {
            let (task_val, task_ty) = emit_operand(s, tmp, task, reg_ty, var_ty, string_table)?;
            let task_ptr = coerce_value(s, tmp, &task_val, task_ty, LowType::Task)?;
            s.push_str(&format!("  call void @obo_task_wait(i8* {})\n", task_ptr));
        }
        Inst::WaitAll => {
            s.push_str("  call void @obo_task_wait_all()\n");
        }
        Inst::Nop => {}
        Inst::InlineAsm(r, template, constraints, inputs) => {
            // Emit LLVM inline assembly.
            // Determine if asm has output (constraint starts with '=')
            let has_output = constraints.contains('=');
            let mut operand_strs = Vec::new();
            for inp in inputs {
                let (val, ty) = emit_operand(s, tmp, inp, reg_ty, var_ty, string_table)?;
                let coerced = coerce_value(s, tmp, &val, ty, LowType::I64)?;
                operand_strs.push(format!("i64 {}", coerced));
            }
            let ops_str = operand_strs.join(", ");
            if has_output {
                let out = fresh_tmp(tmp);
                s.push_str(&format!(
                    "  {} = call i64 asm sideeffect \"{}\", \"{}\"({})\n",
                    out, template, constraints, ops_str
                ));
                store_reg_value(s, *r, &out, LowType::I64);
            } else {
                s.push_str(&format!(
                    "  call void asm sideeffect \"{}\", \"{}\"({})\n",
                    template, constraints, ops_str
                ));
            }
        }
        Inst::Show(op) => {
            let (val, ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
            match ty {
                LowType::Bool => s.push_str(&format!("  call void @obo_print_bool(i64 {})\n", val)),
                LowType::I64 => {
                    let gep = "getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0)";
                    s.push_str(&format!("  call i32 (i8*, ...) @printf(i8* {}, i64 {})\n", gep, val));
                }
                LowType::F64 => {
                    s.push_str(&format!("  call void @obo_print_double(double {})\n", val));
                }
                LowType::Str => {
                    let gep = "getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0)";
                    s.push_str(&format!("  call i32 (i8*, ...) @printf(i8* {}, i8* {})\n", gep, val));
                }
                LowType::List => s.push_str(&format!("  call void @obo_list_print(i8* {})\n", val)),
                LowType::F64List => s.push_str(&format!("  call void @obo_list_print(i8* {})\n", val)),
                LowType::Map => s.push_str(&format!("  call void @obo_map_print(i8* {})\n", val)),
                LowType::Entity => {
                    s.push_str(&format!("  call void @obo_entity_print(i8* {})\n", val));
                }
                LowType::Dyn => s.push_str(&format!("  call void @obo_value_print(i8* {})\n", val)),
                LowType::Closure => {
                    let gep = "getelementptr inbounds ([12 x i8], [12 x i8]* @obo.fmt.closure, i64 0, i64 0)";
                    s.push_str(&format!("  call i32 (i8*, ...) @printf(i8* {})\n", gep));
                }
                LowType::Task => {
                    let gep = "getelementptr inbounds ([8 x i8], [8 x i8]* @obo.fmt.task, i64 0, i64 0)";
                    s.push_str(&format!("  call i32 (i8*, ...) @printf(i8* {})\n", gep));
                }
                LowType::MixedList => {
                    s.push_str(&format!("  call void @obo_mixed_list_print(i8* {})\n", val));
                }
            }
        }
        Inst::Jump(bid) => {
            let label = &block_names[bid];
            s.push_str(&format!("  br label %{}\n", label));
        }
        Inst::Branch(cond, t, f_) => {
            let (v, ct) = emit_operand(s, tmp, cond, reg_ty, var_ty, string_table)?;
            let c = fresh_tmp(tmp);
            let truthy = emit_truthy_i64(s, tmp, &v, ct)?;
            s.push_str(&format!("  {} = icmp ne i64 {}, 0\n", c, truthy));
            s.push_str(&format!(
                "  br i1 {}, label %{}, label %{}\n",
                c, block_names[t], block_names[f_]
            ));
        }
        Inst::Return(ops) => {
            // @interrupt functions always emit `ret void` (ISR — no return value)
            if f.is_interrupt {
                if gc_root_count > 0 {
                    s.push_str(&format!(
                        "  call void @obo_gc_pop_roots(i64 {})\n",
                        gc_root_count
                    ));
                }
                s.push_str("  ret void\n");
            // @export("void") functions always emit `ret void`
            } else if f.is_export && f.export_ret_type.as_deref() == Some("void") {
                if gc_root_count > 0 {
                    s.push_str(&format!(
                        "  call void @obo_gc_pop_roots(i64 {})\n",
                        gc_root_count
                    ));
                }
                s.push_str("  ret void\n");
            } else if f.is_export && f.export_ret_type.is_some() {
                // @export with a specific return type — truncate/coerce the value
                let ert = f.export_ret_type.as_ref().unwrap();
                if let Some(op) = ops.first() {
                    let (v, _ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    match ert.as_str() {
                        "i8" | "i16" | "i32" => {
                            let trunc = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = trunc i64 {} to {}\n", trunc, v, ert));
                            s.push_str(&format!("  ret {} {}\n", ert, trunc));
                        }
                        "float" => {
                            let trunc = fresh_tmp(tmp);
                            s.push_str(&format!("  {} = fptrunc double {} to float\n", trunc, v));
                            s.push_str(&format!("  ret float {}\n", trunc));
                        }
                        _ => {
                            s.push_str(&format!("  ret {} {}\n", ert, v));
                        }
                    }
                } else {
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    match ert.as_str() {
                        "i8" | "i16" | "i32" | "i64" => s.push_str(&format!("  ret {} 0\n", ert)),
                        "float" => s.push_str("  ret float 0.0\n"),
                        "double" => s.push_str("  ret double 0.0\n"),
                        "i8*" => s.push_str("  ret i8* null\n"),
                        _ => s.push_str(&format!("  ret {} 0\n", ert)),
                    }
                }
            } else if f.name == "main" {
                if let Some(op) = ops.first() {
                    let (v, _) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
                    let tmp1 = fresh_tmp(tmp);
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    s.push_str("  call void @obo_arena_free_all()\n");
                    s.push_str(&format!("  {} = trunc i64 {} to i32\n", tmp1, v));
                    s.push_str(&format!("  ret i32 {}\n", tmp1));
                } else {
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    s.push_str("  call void @obo_arena_free_all()\n");
                    s.push_str("  ret i32 0\n");
                }
            } else if f.name.starts_with("__closure_") {
                let raw_ret = if let Some(op) = ops.first() {
                    let (v, ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
                    if ty.is_ptr() {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = ptrtoint i8* {} to i64\n", out, v));
                        out
                    } else if ty == LowType::F64 {
                        let out = fresh_tmp(tmp);
                        s.push_str(&format!("  {} = bitcast double {} to i64\n", out, v));
                        out
                    } else {
                        coerce_value(s, tmp, &v, ty, LowType::I64).map_err(|_| {
                            format!("native build: closure return type mismatch in '{}'", f.name)
                        })?
                    }
                } else {
                    "0".to_string()
                };
                if gc_root_count > 0 {
                    s.push_str(&format!(
                        "  call void @obo_gc_pop_roots(i64 {})\n",
                        gc_root_count
                    ));
                }
                s.push_str(&format!("  ret i64 {}\n", raw_ret));
            } else if ops.len() > 1 {
                let mixed = fresh_tmp(tmp);
                s.push_str(&format!(
                    "  {} = call i8* @obo_mixed_list_new(i64 {})\n",
                    mixed,
                    ops.len()
                ));
                for (index, op) in ops.iter().enumerate() {
                    let (value, value_ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
                    let boxed = box_value(s, tmp, &value, value_ty)?;
                    s.push_str(&format!(
                        "  call void @obo_mixed_list_set(i8* {}, i64 {}, i8* {})\n",
                        mixed, index, boxed
                    ));
                }
                let ret_ty = fn_ret.get(&f.name).copied().unwrap_or(LowType::MixedList);
                let ret_val = if ret_ty == LowType::MixedList {
                    mixed
                } else {
                    coerce_value(s, tmp, &mixed, LowType::MixedList, ret_ty).map_err(|_| {
                        format!("native build: return type mismatch in '{}'", f.name)
                    })?
                };
                if gc_root_count > 0 {
                    s.push_str(&format!(
                        "  call void @obo_gc_pop_roots(i64 {})\n",
                        gc_root_count
                    ));
                }
                match ret_ty {
                    LowType::Str
                    | LowType::List
                    | LowType::Map
                    | LowType::Entity
                    | LowType::Dyn
                    | LowType::Closure
                    | LowType::Task
                    | LowType::MixedList
                    | LowType::F64List => s.push_str(&format!("  ret i8* {}\n", ret_val)),
                    LowType::F64 => s.push_str(&format!("  ret double {}\n", ret_val)),
                    LowType::I64 | LowType::Bool => s.push_str(&format!("  ret i64 {}\n", ret_val)),
                }
            } else if let Some(op) = ops.first() {
                let (v, ty) = emit_operand(s, tmp, op, reg_ty, var_ty, string_table)?;
                let ret_ty = fn_ret.get(&f.name).copied().unwrap_or(LowType::I64);
                // Return null as properly boxed null (not obo_box_i64(0))
                if operand_is_null(op) && ret_ty.is_ptr() {
                    let null_val = fresh_tmp(tmp);
                    s.push_str(&format!("  {} = call i8* @obo_box_null()\n", null_val));
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    s.push_str(&format!("  ret i8* {}\n", null_val));
                } else if ret_ty != ty {
                    let coerced = coerce_value(s, tmp, &v, ty, ret_ty).map_err(|_| {
                        format!("native build: return type mismatch in '{}'", f.name)
                    })?;
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    match ret_ty {
                        LowType::Str
                        | LowType::List
                        | LowType::Map
                        | LowType::Entity
                        | LowType::Dyn
                        | LowType::Closure
                        | LowType::Task
                        | LowType::MixedList
                        | LowType::F64List => s.push_str(&format!("  ret i8* {}\n", coerced)),
                        LowType::F64 => s.push_str(&format!("  ret double {}\n", coerced)),
                        LowType::I64 | LowType::Bool => s.push_str(&format!("  ret i64 {}\n", coerced)),
                    }
                } else {
                    if gc_root_count > 0 {
                        s.push_str(&format!(
                            "  call void @obo_gc_pop_roots(i64 {})\n",
                            gc_root_count
                        ));
                    }
                    match ret_ty {
                        LowType::Str
                        | LowType::List
                        | LowType::Map
                        | LowType::Entity
                        | LowType::Dyn
                        | LowType::Closure
                        | LowType::Task
                        | LowType::MixedList
                        | LowType::F64List => s.push_str(&format!("  ret i8* {}\n", v)),
                        LowType::F64 => s.push_str(&format!("  ret double {}\n", v)),
                        LowType::I64 | LowType::Bool => s.push_str(&format!("  ret i64 {}\n", v)),
                    }
                }
            } else {
                if gc_root_count > 0 {
                    s.push_str(&format!(
                        "  call void @obo_gc_pop_roots(i64 {})\n",
                        gc_root_count
                    ));
                }
                match fn_ret.get(&f.name).copied().unwrap_or(LowType::I64) {
                    LowType::Str
                    | LowType::List
                    | LowType::Map
                    | LowType::Entity
                    | LowType::Dyn
                    | LowType::Closure
                    | LowType::Task
                    | LowType::MixedList
                    | LowType::F64List => s.push_str("  ret i8* null\n"),
                    LowType::F64 => s.push_str("  ret double 0.0\n"),
                    LowType::I64 | LowType::Bool => s.push_str("  ret i64 0\n"),
                }
            }
        }
    }
    Ok(())
}

#[allow(clippy::too_many_arguments)]
fn try_emit_extension_call(
    s: &mut String,
    tmp: &mut u32,
    ir: &IrProgram,
    fn_ret: &HashMap<String, LowType>,
    r: &crate::ir::inst::Reg,
    obj_val: &str,
    obj_ty: LowType,
    method: &str,
    args: &[Operand],
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
    string_table: &[String],
) -> Result<bool, String> {
    let type_name = match obj_ty {
        LowType::I64 => "number",
        LowType::F64 => "decimal",
        LowType::Str => "text",
        LowType::Bool => "flag",
        LowType::List => "list",
        LowType::Map => "map",
        _ => return Ok(false),
    };
    let full_name = format!("{}::{}", type_name, method);
    let Some(func) = ir.functions.iter().find(|candidate| candidate.name == full_name) else {
        return Ok(false);
    };
    let ret_ty = fn_ret.get(&full_name).copied().unwrap_or(LowType::I64);
    let mut call_args = vec![format!("{} {}", obj_ty.llvm(), obj_val)];
    for (index, arg) in args.iter().enumerate() {
        let (arg_val, arg_ty) = emit_operand(s, tmp, arg, reg_ty, var_ty, string_table)?;
        let expected = param_low_type(func, index + 1);
        let coerced = coerce_value(s, tmp, &arg_val, arg_ty, expected)?;
        call_args.push(format!("{} {}", expected.llvm(), coerced));
    }
    let out = fresh_tmp(tmp);
    s.push_str(&format!(
        "  {} = call {} @{}({})\n",
        out,
        ret_ty.llvm(),
        sanitize_global(&full_name),
        call_args.join(", ")
    ));
    store_reg_value(s, *r, &out, ret_ty);
    Ok(true)
}

fn store_reg_value(s: &mut String, reg: crate::ir::inst::Reg, value: &str, ty: LowType) {
    let dst = format!("%reg_{}_ptr", reg.0);
    match ty {
        LowType::I64 | LowType::Bool => {
            s.push_str(&format!("  store i64 {}, i64* {}\n", value, dst));
        }
        LowType::F64 => {
            s.push_str(&format!("  store double {}, double* {}\n", value, dst));
        }
        LowType::Str
        | LowType::List
        | LowType::Map
        | LowType::Entity
        | LowType::Dyn
        | LowType::Closure
        | LowType::Task
        | LowType::MixedList
        | LowType::F64List => {
            s.push_str(&format!("  store i8* {}, i8** {}\n", value, dst));
        }
    }
}

fn coerce_value(
    s: &mut String,
    tmp: &mut u32,
    value: &str,
    from: LowType,
    to: LowType,
) -> Result<String, String> {
    if from == to {
        return Ok(value.to_string());
    }
    // Box non-dynamic values before the generic ptr-to-ptr shortcut.
    if to == LowType::Dyn && from != LowType::Dyn {
        return box_value(s, tmp, value, from);
    }
    // Dyn (boxed) values must be unboxed BEFORE the generic ptr-to-ptr shortcut.
    if from == LowType::Dyn {
        let out = fresh_tmp(tmp);
        match to {
            LowType::I64 => {
                s.push_str(&format!("  {} = call i64 @obo_value_as_i64(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::Bool => {
                s.push_str(&format!("  {} = call i64 @obo_value_truthy(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::F64 => {
                // Inline unbox: load tag + payload, branch-free select
                // OboValue layout: {tag: i64 @+0, payload: i64 @+8}
                // TAG_F64 = 5: payload is f64 bits; TAG_I64 = 0: payload is i64
                let tag_ptr = fresh_tmp(tmp);
                let tag_cast = fresh_tmp(tmp);
                let tag = fresh_tmp(tmp);
                let pay_gep = fresh_tmp(tmp);
                let pay_cast = fresh_tmp(tmp);
                let raw = fresh_tmp(tmp);
                let is_f64 = fresh_tmp(tmp);
                let as_dbl = fresh_tmp(tmp);
                let as_int_dbl = fresh_tmp(tmp);
                s.push_str(&format!("  {} = getelementptr i8, i8* {}, i64 0\n", tag_ptr, value));
                s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", tag_cast, tag_ptr));
                s.push_str(&format!("  {} = load i64, i64* {}\n", tag, tag_cast));
                s.push_str(&format!("  {} = getelementptr i8, i8* {}, i64 8\n", pay_gep, value));
                s.push_str(&format!("  {} = bitcast i8* {} to i64*\n", pay_cast, pay_gep));
                s.push_str(&format!("  {} = load i64, i64* {}\n", raw, pay_cast));
                s.push_str(&format!("  {} = icmp eq i64 {}, 5\n", is_f64, tag));
                s.push_str(&format!("  {} = bitcast i64 {} to double\n", as_dbl, raw));
                s.push_str(&format!("  {} = sitofp i64 {} to double\n", as_int_dbl, raw));
                s.push_str(&format!("  {} = select i1 {}, double {}, double {}\n", out, is_f64, as_dbl, as_int_dbl));
                return Ok(out);
            }
            LowType::Str => {
                s.push_str(&format!("  {} = call i8* @obo_value_to_str(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::List => {
                s.push_str(&format!("  {} = call i8* @obo_value_as_list_ptr(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::MixedList => {
                s.push_str(&format!("  {} = call i8* @obo_value_as_mixed_list_ptr(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::Map => {
                s.push_str(&format!("  {} = call i8* @obo_value_as_map_ptr(i8* {})\n", out, value));
                return Ok(out);
            }
            LowType::Entity => {
                // Inline: load entity pointer from OboValue.u.ptr (offset 8)
                let ptr_gep = fresh_tmp(tmp);
                s.push_str(&format!("  {} = getelementptr i8, i8* {}, i64 8\n", ptr_gep, value));
                let ptr_cast = fresh_tmp(tmp);
                s.push_str(&format!("  {} = bitcast i8* {} to i8**\n", ptr_cast, ptr_gep));
                s.push_str(&format!("  {} = load i8*, i8** {}\n", out, ptr_cast));
                return Ok(out);
            }
            _ => {}
        }
    }
    // All pointer types are i8* at the LLVM level, so ptr-to-ptr is a no-op.
    if from.is_ptr() && to.is_ptr() {
        return Ok(value.to_string());
    }
    if to == LowType::F64 && matches!(from, LowType::I64 | LowType::Bool) {
        return Ok(ensure_f64(s, tmp, value, from));
    }
    if matches!(to, LowType::I64 | LowType::Bool) && from == LowType::F64 {
        return Ok(f64_to_i64(s, tmp, value));
    }
    if matches!(to, LowType::I64 | LowType::Bool) && matches!(from, LowType::I64 | LowType::Bool) {
        return Ok(value.to_string());
    }
    // i64 → pointer: needed when closure captures hold opaque pointers (channels, tasks, etc.)
    if to.is_ptr() && matches!(from, LowType::I64 | LowType::Bool) {
        let out = fresh_tmp(tmp);
        s.push_str(&format!("  {} = inttoptr i64 {} to i8*\n", out, value));
        return Ok(out);
    }
    // pointer → i64: needed when storing pointers into closure captures
    if matches!(to, LowType::I64 | LowType::Bool) && from.is_ptr() {
        let out = fresh_tmp(tmp);
        s.push_str(&format!("  {} = ptrtoint i8* {} to i64\n", out, value));
        return Ok(out);
    }
    Err(format!(
        "native build: cannot coerce {} to {}",
        from.llvm(),
        to.llvm()
    ))
}

fn box_value(s: &mut String, tmp: &mut u32, value: &str, ty: LowType) -> Result<String, String> {
    let out = fresh_tmp(tmp);
    match ty {
        LowType::I64 => s.push_str(&format!("  {} = call i8* @obo_box_i64(i64 {})\n", out, value)),
        LowType::Bool => s.push_str(&format!("  {} = call i8* @obo_box_bool(i64 {})\n", out, value)),
        LowType::F64 => s.push_str(&format!("  {} = call i8* @obo_box_f64(double {})\n", out, value)),
        LowType::Str => s.push_str(&format!("  {} = call i8* @obo_box_str(i8* {})\n", out, value)),
        LowType::List | LowType::MixedList | LowType::F64List => {
            s.push_str(&format!("  {} = call i8* @obo_box_list(i8* {})\n", out, value))
        }
        LowType::Map => s.push_str(&format!("  {} = call i8* @obo_box_map(i8* {})\n", out, value)),
        LowType::Entity => {
            s.push_str(&format!("  {} = call i8* @obo_box_entity(i8* {})\n", out, value))
        }
        LowType::Dyn | LowType::Closure | LowType::Task => return Ok(value.to_string()),
    }
    Ok(out)
}

fn interned_string_ptr(value: &str, string_table: &[String]) -> Result<String, String> {
    let index = string_index(string_table, value)?;
    let byte_len = llvm_c_array(value).0;
    Ok(format_gep(index, byte_len))
}

fn format_gep(idx: usize, byte_len: usize) -> String {
    format!(
        "getelementptr inbounds ([{} x i8], [{} x i8]* @obo.str.{}, i64 0, i64 0)",
        byte_len, byte_len, idx
    )
}

fn fresh_tmp(tmp: &mut u32) -> String {
    let name = format!("%t{}", tmp);
    *tmp += 1;
    name
}

fn string_index(table: &[String], t: &str) -> Result<usize, String> {
    table
        .iter()
        .position(|s| s == t)
        .ok_or_else(|| format!("internal: missing string constant {:?}", t))
}

fn llvm_f64_hex(d: f64) -> String {
    format!("0x{:016X}", d.to_bits())
}

fn emit_operand(
    s: &mut String,
    tmp: &mut u32,
    op: &Operand,
    reg_ty: &[Option<LowType>],
    _var_ty: &HashMap<String, LowType>,
    string_table: &[String],
) -> Result<(String, LowType), String> {
    match op {
        Operand::Const(c) => match c {
            Constant::Number(n) => Ok((n.to_string(), LowType::I64)),
            Constant::Decimal(d) => Ok((llvm_f64_hex(*d), LowType::F64)),
            Constant::Text(t) => {
                let idx = string_index(string_table, t)?;
                let blen = llvm_c_array(t).0;
                Ok((format_gep(idx, blen), LowType::Str))
            }
            Constant::Char(ch) => Ok(((*ch as u32).to_string(), LowType::I64)),
            Constant::Flag(b) => Ok(((if *b { "1" } else { "0" }).to_string(), LowType::Bool)),
            Constant::Null => Ok(("0".to_string(), LowType::I64)),
        },
        Operand::Reg(r) => {
            let ty = reg_ty
                .get(r.0 as usize)
                .and_then(|x| *x)
                .unwrap_or(LowType::I64);
            let ptr = format!("%reg_{}_ptr", r.0);
            let name = fresh_tmp(tmp);
            match ty {
                LowType::I64 | LowType::Bool => {
                    s.push_str(&format!("  {} = load i64, i64* {}\n", name, ptr));
                }
                LowType::F64 => {
                    s.push_str(&format!("  {} = load double, double* {}\n", name, ptr));
                }
                LowType::Str
                | LowType::List
                | LowType::Map
                | LowType::Entity
                | LowType::Dyn
                | LowType::Closure
                | LowType::Task
                | LowType::MixedList
                | LowType::F64List => {
                    s.push_str(&format!("  {} = load i8*, i8** {}\n", name, ptr));
                }
            }
            Ok((name, ty))
        }
    }
}

fn ensure_f64(s: &mut String, tmp: &mut u32, v: &str, ty: LowType) -> String {
    match ty {
        LowType::F64 => v.to_string(),
        LowType::I64 | LowType::Bool => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = sitofp i64 {} to double\n", t, v));
            t
        }
        _ => v.to_string(),
    }
}

fn f64_to_i64(s: &mut String, tmp: &mut u32, v: &str) -> String {
    let t = fresh_tmp(tmp);
    s.push_str(&format!("  {} = fptosi double {} to i64\n", t, v));
    t
}

fn packed_field_llvm_type(ty: &str) -> &'static str {
    match ty {
        "i8" => "i8",
        "u8" | "byte" => "i8",
        "i16" => "i16",
        "u16" => "i16",
        "i32" => "i32",
        "u32" => "i32",
        "i64" | "number" => "i64",
        "u64" => "i64",
        "f32" => "float",
        "f64" | "decimal" => "double",
        "flag" => "i8",
        _ => "i64",
    }
}

fn packed_field_size(ty: &str) -> usize {
    match ty {
        "i8" | "u8" | "byte" | "flag" => 1,
        "i16" | "u16" => 2,
        "i32" | "u32" | "f32" => 4,
        "i64" | "u64" | "number" | "f64" | "decimal" => 8,
        _ => 8,
    }
}

fn coerce_to_packed_field(s: &mut String, tmp: &mut u32, val: &str, src_ty: LowType, target_llvm: &str) -> String {
    match (src_ty, target_llvm) {
        // i64 → smaller int: truncate
        (LowType::I64 | LowType::Bool, "i8") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = trunc i64 {} to i8\n", t, val));
            t
        }
        (LowType::I64 | LowType::Bool, "i16") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = trunc i64 {} to i16\n", t, val));
            t
        }
        (LowType::I64 | LowType::Bool, "i32") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = trunc i64 {} to i32\n", t, val));
            t
        }
        (LowType::I64 | LowType::Bool, "i64") => val.to_string(),
        // f64 → f32: fptrunc
        (LowType::F64, "float") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = fptrunc double {} to float\n", t, val));
            t
        }
        (LowType::F64, "double") => val.to_string(),
        // i64 → float: sitofp
        (LowType::I64 | LowType::Bool, "float") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = sitofp i64 {} to float\n", t, val));
            t
        }
        (LowType::I64 | LowType::Bool, "double") => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = sitofp i64 {} to double\n", t, val));
            t
        }
        _ => val.to_string(),
    }
}

/// Widen a packed field value back to IR-width types (i8/i16/i32→i64, float→double).
fn coerce_from_packed_field(s: &mut String, tmp: &mut u32, val: &str, llvm_ty: &str, obo_ty: &str) -> (String, LowType) {
    let is_unsigned = matches!(obo_ty, "u8" | "u16" | "u32" | "u64" | "byte" | "flag");
    match llvm_ty {
        "i8" | "i16" | "i32" => {
            let t = fresh_tmp(tmp);
            let ext = if is_unsigned { "zext" } else { "sext" };
            s.push_str(&format!("  {} = {} {} {} to i64\n", t, ext, llvm_ty, val));
            (t, LowType::I64)
        }
        "i64" => (val.to_string(), LowType::I64),
        "float" => {
            let t = fresh_tmp(tmp);
            s.push_str(&format!("  {} = fpext float {} to double\n", t, val));
            (t, LowType::F64)
        }
        "double" => (val.to_string(), LowType::F64),
        _ => (val.to_string(), LowType::I64),
    }
}