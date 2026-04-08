use std::collections::HashMap;

use crate::ir::inst::{
    BinOp, Constant, Inst, IrFunction, IrProgram, IrParamType, Operand, Reg, UnaryOp,
};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum LowType {
    I64,
    /// IEEE-754 double (f64)
    F64,
    /// Pointer to null-terminated string (i8*)
    Str,
    /// Opaque list handle (same storage class as Str: i8*)
    List,
    /// Opaque map (i8*)
    Map,
    /// Opaque entity (i8*)
    Entity,
    /// Boxed tagged value (OboValue*; i8*)
    Dyn,
    /// Stored as i64 0/1
    Bool,
    /// Opaque closure pointer (i8*)
    Closure,
    /// Opaque task handle (i8*)
    Task,
    /// Opaque mixed list (OboMixedList*; i8*)
    MixedList,
}

impl LowType {
    pub fn llvm(&self) -> &'static str {
        match self {
            LowType::I64 | LowType::Bool => "i64",
            LowType::F64 => "double",
            LowType::Str | LowType::List | LowType::Map | LowType::Entity | LowType::Dyn | LowType::Closure | LowType::Task | LowType::MixedList => "i8*",
        }
    }
    pub fn is_ptr(&self) -> bool {
        matches!(self, LowType::Str | LowType::List | LowType::Map | LowType::Entity | LowType::Dyn | LowType::Closure | LowType::Task | LowType::MixedList)
    }
}

fn llvm_ret_str_to_lowtype(s: &str) -> LowType {
    match s {
        "i64" => LowType::I64,
        "double" => LowType::F64,
        "i8*" => LowType::Dyn,
        "void" => LowType::I64,  // void returns treated as i64 (0)
        "i8" => LowType::I64,
        "i32" => LowType::I64,
        _ => LowType::Dyn,
    }
}

/// Return type for extern C symbols referenced by `Call` but not defined in IR.
pub fn extern_fn_ret(name: &str) -> Option<LowType> {
    match name {
        "__indirect" | "obo_type_check" | "obo_closure_get_capture" | "obo_possible_pop" => Some(LowType::I64),
        "obo_prompt" | "obo_possible_get_error" => Some(LowType::Str),
        "obo_possible_push" | "obo_range" | "obo_event_listen" | "obo_event_emit" | "obo_channel_create" | "obo_atomic_create" => Some(LowType::Dyn),
        "obo_channel_receive" | "obo_atomic_load" | "obo_atomic_add" | "obo_atomic_sub" => Some(LowType::I64),
        "_setjmp" => Some(LowType::I64),
        "__sys_File_read" | "__sys_File_readLines" | "__sys_Convert_toText" => Some(LowType::Str),
        "__sys_File_exists" | "__sys_File_write" | "__sys_File_append" | "__sys_File_delete" => {
            Some(LowType::I64)
        }
        "__sys_Convert_toNumber" => Some(LowType::I64),
        "__sys_Convert_toDecimal" => Some(LowType::F64),
        "__sys_Convert_toFlag" | "__sys_Convert_toChar" => Some(LowType::I64),
        "__sys_Time_now" | "__sys_Time_nowSeconds" | "__sys_Time_sleep" => Some(LowType::I64),
        "__sys_Time_measure" => Some(LowType::F64),
        "__sys_Math_abs" | "__sys_Math_min" | "__sys_Math_max" | "__sys_Math_sign" => {
            Some(LowType::I64)
        }
        "__sys_Math_pi" | "__sys_Math_e" | "__sys_Math_infinity" => Some(LowType::F64),
        "__sys_Math_maxNumber" | "__sys_Math_minNumber" => Some(LowType::I64),
        "__sys_Math_sqrt" | "__sys_Math_pow" | "__sys_Math_sin" | "__sys_Math_cos"
        | "__sys_Math_tan" | "__sys_Math_asin" | "__sys_Math_acos" | "__sys_Math_atan"
        | "__sys_Math_atan2" | "__sys_Math_log" | "__sys_Math_log10" | "__sys_Math_lerp"
        | "__sys_Math_clamp" | "__sys_Math_random" => Some(LowType::F64),
        "__sys_Math_floor" | "__sys_Math_ceil" | "__sys_Math_round" | "__sys_Math_randomInt" => {
            Some(LowType::I64)
        }
        "__sys_pointer_alloc" | "__sys_pointer_free" => Some(LowType::I64),
        "__sys_mem_load64" | "__sys_mem_load8" | "__sys_mem_load32" => Some(LowType::I64),
        "__sys_mem_store64" | "__sys_mem_store8" | "__sys_mem_store32" | "__sys_mem_copy" | "__sys_mem_zero" => Some(LowType::I64),
        // Set methods
        "obo_set_new" | "obo_set_add" | "obo_set_remove" | "obo_set_union" | "obo_set_intersect" | "obo_set_difference" => Some(LowType::List),
        "obo_set_has" => Some(LowType::Bool),
        // Queue methods
        "obo_queue_push" | "obo_queue_pop" => Some(LowType::List),
        "obo_queue_peek" => Some(LowType::I64),
        // Stack methods
        "obo_stack_push" | "obo_stack_pop" => Some(LowType::List),
        "obo_stack_peek" => Some(LowType::I64),
        // Buffer methods
        "obo_buffer_new" | "obo_buffer_set" | "obo_buffer_toList" => Some(LowType::List),
        "obo_buffer_length" | "obo_buffer_get" => Some(LowType::I64),
        // TextBuilder methods
        "obo_textbuilder_new" | "obo_textbuilder_append" | "obo_textbuilder_appendChar"
        | "obo_textbuilder_appendInt" | "obo_textbuilder_clear" => Some(LowType::Entity),
        "obo_textbuilder_build" | "obo_textbuilder_toString" => Some(LowType::Str),
        "obo_textbuilder_length" => Some(LowType::I64),
        // Arena methods
        "obo_arena_create" => Some(LowType::Entity),
        "obo_arena_alloc" | "obo_arena_used" | "obo_arena_capacity"
        | "obo_arena_read_i64" => Some(LowType::I64),
        "obo_arena_read_f64" => Some(LowType::F64),
        "obo_arena_reset" | "obo_arena_destroy"
        | "obo_arena_write_i64" | "obo_arena_write_f64" => Some(LowType::I64),
        // Integer-keyed map helpers
        "obo_map_set_int" | "obo_map_set_int_str" | "obo_map_set_int_boxed"
        | "obo_map_remove_int" => Some(LowType::Map),
        "obo_map_get_int" | "obo_map_has_int" => Some(LowType::I64),
        "obo_map_get_int_boxed" => Some(LowType::Dyn),
        // Bag methods (bag = list)
        "obo_bag_add" | "obo_bag_remove" => Some(LowType::List),
        "obo_bag_has" => Some(LowType::Bool),
        // List slice
        "obo_list_slice" => Some(LowType::List),
        // Grid2D methods
        "obo_grid2d_new" | "obo_grid2d_set" | "obo_grid2d_fill" | "obo_grid2d_row" | "obo_grid2d_col" | "obo_grid2d_toList" => Some(LowType::List),
        "obo_grid2d_rows" | "obo_grid2d_cols" | "obo_grid2d_count" | "obo_grid2d_get" => Some(LowType::I64),
        // Grid3D methods
        "obo_grid3d_new" | "obo_grid3d_set" | "obo_grid3d_fill" | "obo_grid3d_toList" => Some(LowType::List),
        "obo_grid3d_x" | "obo_grid3d_y" | "obo_grid3d_z" | "obo_grid3d_count" | "obo_grid3d_get" => Some(LowType::I64),
        // Assert / Reflect
        "obo_assert_fail" => Some(LowType::Dyn), // void but declared as i8* for IR compatibility
        "obo_reflect" => Some(LowType::List),
        _ if name.starts_with("__text_") => {
            match name {
                "__text_length" | "__text_indexOf" | "__text_toNumber" => Some(LowType::I64),
                "__text_empty" | "__text_contains" | "__text_startsWith" | "__text_endsWith" => {
                    Some(LowType::Bool)
                }
                "__text_toDecimal" => Some(LowType::F64),
                _ => Some(LowType::Str),
            }
        }
        _ => None,
    }
}

impl From<IrParamType> for LowType {
    fn from(p: IrParamType) -> Self {
        match p {
            IrParamType::I64 => LowType::I64,
            IrParamType::Str => LowType::Str,
            IrParamType::List => LowType::List,
            IrParamType::MixedList => LowType::MixedList,
            IrParamType::Map => LowType::Map,
            IrParamType::Entity => LowType::Entity,
            IrParamType::Dyn => LowType::Dyn,
            IrParamType::Bool => LowType::Bool,
            IrParamType::F64 => LowType::F64,
            IrParamType::Closure => LowType::Closure,
            IrParamType::Task => LowType::Task,
        }
    }
}

fn first_arg_ty(
    args: &[Operand],
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
) -> Option<LowType> {
    args.first().and_then(|arg| operand_ty(arg, reg_ty, var_ty))
}

fn wants_mixed_list(
    args: &[Operand],
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
) -> bool {
    !matches!(first_arg_ty(args, reg_ty, var_ty), Some(LowType::I64 | LowType::Bool) | None)
}

fn infer_call_method_type(
    receiver_ty: Option<LowType>,
    method: &str,
    args: &[Operand],
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
    ext_ret: Option<LowType>,
) -> LowType {
    match receiver_ty {
        Some(LowType::Str) => match method {
            "contains" | "startsWith" | "endsWith" => LowType::Bool,
            "indexOf" | "toNumber" => LowType::I64,
            "toDecimal" => LowType::F64,
            "split" => LowType::MixedList,
            "replace" | "substring" | "repeat" | "padLeft" | "padRight" | "join" => {
                LowType::Str
            }
            "filter" | "map" | "add" | "removeAt" => LowType::MixedList,
            "reduce" => LowType::Dyn,
            "any" | "all" => LowType::Bool,
            _ => ext_ret.unwrap_or(LowType::Str),
        },
        Some(LowType::List) => match method {
            "add" => {
                if wants_mixed_list(args, reg_ty, var_ty) {
                    LowType::MixedList
                } else {
                    LowType::List
                }
            }
            "contains" | "empty" | "any" | "all" => LowType::Bool,
            "indexOf" | "first" | "last" | "reduce" => LowType::I64,
            "join" => LowType::Str,
            _ => ext_ret.unwrap_or(LowType::List),
        },
        Some(LowType::MixedList) => match method {
            "filter" | "map" | "add" | "removeAt" => LowType::MixedList,
            "join" => LowType::Str,
            "contains" | "any" | "all" => LowType::Bool,
            "reduce" => LowType::Dyn,
            "each" => LowType::I64,
            _ => ext_ret.unwrap_or(LowType::MixedList),
        },
        Some(LowType::Map) => match method {
            "has" | "empty" => LowType::Bool,
            "get" => LowType::Dyn,
            "remove" | "set" => LowType::Map,
            _ => ext_ret.unwrap_or(LowType::Map),
        },
        Some(LowType::Dyn) => match method {
            "filter" | "map" | "add" | "removeAt" | "sortBy" => LowType::Dyn,
            "join" => LowType::Str,
            "contains" | "any" | "all" | "has" | "empty" | "startsWith" | "endsWith" => {
                LowType::Bool
            }
            "reduce" | "get" => LowType::Dyn,
            "remove" | "set" => LowType::Map,
            "indexOf" | "toNumber" | "receive" | "load" | "sub" | "increment"
            | "decrement" => LowType::I64,
            "toDecimal" => LowType::F64,
            "split" => LowType::MixedList,
            "replace" | "substring" | "repeat" | "padLeft" | "padRight" => LowType::Str,
            "send" | "store" => LowType::I64,
            _ => ext_ret.unwrap_or(LowType::I64),
        },
        _ => ext_ret.unwrap_or(LowType::I64),
    }
}

/// Fixed-point over the program so `out other()` picks up the callee's return type.
/// Iteration count is **hard-capped** so a pathological program cannot spin forever.
pub fn infer_function_returns(ir: &IrProgram) -> Result<HashMap<String, LowType>, String> {
    const MAX_ITERS: usize = 32;
    let mut ret_map: HashMap<String, LowType> = HashMap::new();
    for f in &ir.functions {
        ret_map.insert(f.name.clone(), LowType::I64);
    }
    // Register bridge function return types.
    for bfn in &ir.bridge_fns {
        let lt = llvm_ret_str_to_lowtype(&bfn.return_type);
        ret_map.insert(bfn.name.clone(), lt);
    }
    let cap = MAX_ITERS.max(1);
    for _ in 0..cap {
        let mut changed = false;
        for f in &ir.functions {
            let (reg_ty, var_ty) = infer_function_types(f, ir, &ret_map);
            let new_ret = infer_return_type_unified(f, &reg_ty, &var_ty)?;
            let old = ret_map[&f.name];
            if old != new_ret {
                ret_map.insert(f.name.clone(), new_ret);
                changed = true;
            }
        }
        if !changed {
            return Ok(ret_map);
        }
    }
    Err("native build: could not infer function return types (fixed point did not converge in time — unsupported mutual recursion?)".into())
}

fn infer_return_type_unified(
    func: &IrFunction,
    reg_ty: &[Option<LowType>],
    var_ty: &HashMap<String, LowType>,
) -> Result<LowType, String> {
    let mut types: Vec<LowType> = Vec::new();
    let mut saw_multi_return = false;
    let mut saw_non_multi_return = false;
    for block in &func.blocks {
        for inst in &block.insts {
            if let Inst::Return(ops) = inst {
                if ops.len() > 1 {
                    saw_multi_return = true;
                    continue;
                }
                saw_non_multi_return = true;
                if let Some(op) = ops.first() {
                    if let Some(rt) = operand_ty(op, reg_ty, var_ty) {
                        types.push(rt);
                    }
                }
            }
        }
    }
    if saw_multi_return {
        if saw_non_multi_return {
            return Ok(LowType::Dyn);
        }
        return Ok(LowType::MixedList);
    }
    if types.is_empty() {
        return Ok(LowType::I64);
    }
    let first = types[0];
    for t in types.iter().skip(1) {
        if *t != first {
            // Mixed return types → unify to Dyn (boxed dynamic value)
            return Ok(LowType::Dyn);
        }
    }
    Ok(first)
}

/// Resolve `method` + number of call arguments (excluding receiver) to a unique `Actor::method` IR name.
pub fn resolve_instance_method<'a>(ir: &'a IrProgram, method: &str, argc: usize) -> Option<&'a str> {
    let nparams = argc + 1;
    let mut hits: Vec<&str> = Vec::new();
    for f in &ir.functions {
        let Some((_actor, m)) = f.name.split_once("::") else {
            continue;
        };
        if m == method && f.params.len() == nparams {
            hits.push(f.name.as_str());
        }
    }
    if hits.len() == 1 {
        Some(hits[0])
    } else {
        None
    }
}

/// Infer entity field types by scanning all `MakeEntity` instructions across the program.
/// Returns entity_name → { field_name → LowType }.
pub fn infer_entity_field_types(
    ir: &IrProgram,
    fn_ret: &HashMap<String, LowType>,
) -> HashMap<String, HashMap<String, LowType>> {
    let mut eft: HashMap<String, HashMap<String, LowType>> = HashMap::new();
    for f in &ir.functions {
        let (reg_ty, var_ty) = infer_function_types_inner(f, ir, fn_ret, &HashMap::new());
        for block in &f.blocks {
            for inst in &block.insts {
                if let Inst::MakeEntity(_, type_name, fields) = inst {
                    let entry = eft.entry(type_name.clone()).or_insert_with(HashMap::new);
                    for (fname, op) in fields {
                        // Skip null operands — Constant::Null maps to I64 in const_ty
                        // but the runtime stores it as OBO_VTAG_NULL, so treating it as
                        // I64 would give wrong semantics (0 instead of "null").
                        if matches!(op, Operand::Const(Constant::Null)) {
                            // Null conflicts with any concrete type — mark as Dyn.
                            entry.insert(fname.clone(), LowType::Dyn);
                            continue;
                        }
                        if let Some(t) = operand_ty(op, &reg_ty, &var_ty) {
                            if matches!(t, LowType::F64 | LowType::I64) {
                                let prev = entry.get(fname.as_str()).copied();
                                match prev {
                                    None => { entry.insert(fname.clone(), t); }
                                    Some(pt) if pt == t => {} // consistent
                                    Some(LowType::Dyn) => {} // already conflicted
                                    _ => { entry.insert(fname.clone(), LowType::Dyn); } // conflict
                                }
                            } else {
                                // Non-numeric type — mark as Dyn to avoid conflicts.
                                entry.insert(fname.clone(), LowType::Dyn);
                            }
                        }
                    }
                }
                // Packed entities: resolve field types from packed_layouts.
                if let Inst::MakePackedEntity(_, type_name, _) = inst {
                    if let Some(layout) = ir.packed_layouts.get(type_name.as_str()) {
                        let entry = eft.entry(type_name.clone()).or_insert_with(HashMap::new);
                        for (fname, ftype) in layout {
                            let lt = match ftype.as_str() {
                                "f32" | "f64" | "decimal" => LowType::F64,
                                _ => LowType::I64,
                            };
                            entry.insert(fname.clone(), lt);
                        }
                    }
                }
            }
        }
    }
    eft
}

/// Build a map of field_name → LowType for fields that are consistently the same
/// concrete type (F64 or I64) across ALL entity types that define them.
/// Used to skip redundant vtag writes in SetField.
pub fn build_consistent_field_types(
    ir: &IrProgram,
    fn_ret: &HashMap<String, LowType>,
) -> HashMap<String, LowType> {
    let eft = infer_entity_field_types(ir, fn_ret);
    let mut result: HashMap<String, Option<LowType>> = HashMap::new();
    for (_entity_name, fields) in &eft {
        for (field_name, &field_ty) in fields {
            if !matches!(field_ty, LowType::F64 | LowType::I64) {
                // Non-concrete → poison this field name
                result.insert(field_name.clone(), None);
                continue;
            }
            match result.get(field_name) {
                None => { result.insert(field_name.clone(), Some(field_ty)); }
                Some(Some(prev)) if *prev == field_ty => {} // consistent
                _ => { result.insert(field_name.clone(), None); } // conflict
            }
        }
    }
    result.into_iter().filter_map(|(k, v)| v.map(|t| (k, t))).collect()
}

/// Infer the low-level type of each register and variable in a function.
pub fn infer_function_types(
    func: &IrFunction,
    ir: &IrProgram,
    fn_ret: &HashMap<String, LowType>,
) -> (Vec<Option<LowType>>, HashMap<String, LowType>) {
    // Pre-compute entity field types for typed GetField results.
    let eft = infer_entity_field_types(ir, fn_ret);
    infer_function_types_inner(func, ir, fn_ret, &eft)
}

fn infer_function_types_inner(
    func: &IrFunction,
    ir: &IrProgram,
    fn_ret: &HashMap<String, LowType>,
    entity_field_types: &HashMap<String, HashMap<String, LowType>>,
) -> (Vec<Option<LowType>>, HashMap<String, LowType>) {
    let max_reg = max_reg_in_function(func);
    let mut reg_ty: Vec<Option<LowType>> = vec![None; max_reg.max(1) as usize];
    let mut var_ty: HashMap<String, LowType> = HashMap::new();
    let mut reg_source_var: HashMap<Reg, String> = HashMap::new();
    // Track which entity type name a register/variable holds (e.g. "Body").
    let mut reg_entity_name: HashMap<Reg, String> = HashMap::new();
    let mut var_entity_name: HashMap<String, String> = HashMap::new();
    // Track lists known to contain only entities of one type (for typed-array optimization).
    let mut reg_list_entity: HashMap<Reg, String> = HashMap::new();
    let mut var_list_entity: HashMap<String, String> = HashMap::new();

    for (i, p) in func.params.iter().enumerate() {
        let pt = func.param_types.get(i).copied().unwrap_or(IrParamType::I64);
        let low = if p == "__closure_self" {
            LowType::Closure
        } else if p == "self" && func.name.contains("::") && pt == IrParamType::Str {
            LowType::Entity
        } else {
            LowType::from(pt)
        };
        set_reg(&mut reg_ty, Reg(i as u32), low);
        var_ty.insert(p.clone(), low);
    }

    for block in &func.blocks {
        for inst in &block.insts {
            match inst {
                Inst::Const(r, c) => set_reg(&mut reg_ty, *r, const_ty(c)),
                Inst::Copy(r, op) => {
                    if let Some(t) = operand_ty(op, &reg_ty, &var_ty) {
                        set_reg(&mut reg_ty, *r, t);
                    }
                    if let Operand::Reg(src) = op {
                        if let Some(name) = reg_source_var.get(src).cloned() {
                            reg_source_var.insert(*r, name);
                        }
                        // Propagate entity type name through Copy.
                        if let Some(ename) = reg_entity_name.get(src).cloned() {
                            reg_entity_name.insert(*r, ename);
                        }
                        // Propagate list-element entity type through Copy.
                        if let Some(lename) = reg_list_entity.get(src).cloned() {
                            reg_list_entity.insert(*r, lename);
                        }
                    }
                }
                Inst::BinOp(r, op, lhs, rhs) => {
                    let lo = operand_ty(lhs, &reg_ty, &var_ty);
                    let ro = operand_ty(rhs, &reg_ty, &var_ty);
                    let either_f64 = lo == Some(LowType::F64) || ro == Some(LowType::F64);
                    let both_dyn = lo == Some(LowType::Dyn) && ro == Some(LowType::Dyn);
                    // Check if both operands are the same value type
                    let both_value_entity = if lo == Some(LowType::Entity) && ro == Some(LowType::Entity) {
                        let lname = match lhs { Operand::Reg(r) => reg_entity_name.get(r).cloned(), _ => None };
                        let rname = match rhs { Operand::Reg(r) => reg_entity_name.get(r).cloned(), _ => None };
                        if let (Some(ln), Some(rn)) = (&lname, &rname) {
                            if ln == rn && ir.value_types.contains(ln.as_str()) { Some(ln.clone()) } else { None }
                        } else { None }
                    } else { None };
                    let t = match op {
                        BinOp::Add => {
                            if let Some(ref vt) = both_value_entity {
                                reg_entity_name.insert(*r, vt.clone());
                                LowType::Entity
                            } else {
                            let any_str = lo == Some(LowType::Str) || ro == Some(LowType::Str);
                            let any_heap = matches!(lo, Some(LowType::List | LowType::Map | LowType::Entity))
                                || matches!(ro, Some(LowType::List | LowType::Map | LowType::Entity));
                            if any_str || any_heap {
                                LowType::Str
                            } else if both_dyn {
                                LowType::Dyn
                            } else if either_f64 {
                                LowType::F64
                            } else {
                                LowType::I64
                            }
                            }
                        }
                        BinOp::Sub | BinOp::Mul | BinOp::Div | BinOp::Mod => {
                            if let Some(ref vt) = both_value_entity {
                                reg_entity_name.insert(*r, vt.clone());
                                LowType::Entity
                            } else if both_dyn { LowType::Dyn } else if either_f64 { LowType::F64 } else { LowType::I64 }
                        }
                        BinOp::Concat => LowType::Str,
                        BinOp::Eq
                        | BinOp::NotEq
                        | BinOp::Less
                        | BinOp::Greater
                        | BinOp::LessEq
                        | BinOp::GreaterEq
                        | BinOp::And
                        | BinOp::Or => LowType::Bool,
                        BinOp::BitAnd | BinOp::BitOr | BinOp::BitXor
                        | BinOp::Shl | BinOp::Shr => LowType::I64,
                    };
                    set_reg(&mut reg_ty, *r, t);
                }
                Inst::UnaryOp(r, uop, op) => {
                    let t = match uop {
                        UnaryOp::Neg => {
                            if operand_ty(op, &reg_ty, &var_ty) == Some(LowType::F64) {
                                LowType::F64
                            } else {
                                LowType::I64
                            }
                        }
                        UnaryOp::Not => LowType::Bool,
                        UnaryOp::BitNot => LowType::I64,
                    };
                    set_reg(&mut reg_ty, *r, t);
                }
                Inst::Load(r, name) => {
                    reg_source_var.insert(*r, name.clone());
                    if let Some(t) = var_ty.get(name).copied() {
                        set_reg(&mut reg_ty, *r, t);
                    }
                    // Propagate entity type name through Load.
                    if let Some(ename) = var_entity_name.get(name).cloned() {
                        reg_entity_name.insert(*r, ename);
                    }
                    // Propagate list-element entity type through Load.
                    if let Some(lename) = var_list_entity.get(name).cloned() {
                        reg_list_entity.insert(*r, lename);
                    }
                }
                Inst::Store(name, op) => {
                    if let Some(t) = operand_ty(op, &reg_ty, &var_ty) {
                        var_ty.insert(name.clone(), t);
                    }
                    // Propagate entity type name through Store.
                    if let Operand::Reg(src) = op {
                        if let Some(ename) = reg_entity_name.get(src).cloned() {
                            var_entity_name.insert(name.clone(), ename);
                        }
                        // Propagate list-element entity type through Store.
                        if let Some(lename) = reg_list_entity.get(src).cloned() {
                            var_list_entity.insert(name.clone(), lename);
                        }
                    }
                }
                Inst::Call(r, name, _) => {
                    let t = fn_ret
                        .get(name)
                        .copied()
                        .or_else(|| extern_fn_ret(name))
                        .unwrap_or(LowType::I64);
                    set_reg(&mut reg_ty, *r, t);
                }
                Inst::CallMethod(r, obj, method, args) => {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    // Value-type methods: dot returns F64, length returns I64
                    if ot == Some(LowType::Entity) {
                        let vt_name = if let Operand::Reg(reg) = obj {
                            reg_entity_name.get(reg).cloned()
                        } else { None };
                        if let Some(ref vn) = vt_name {
                            if ir.value_types.contains(vn.as_str()) {
                                let t = match method.as_str() {
                                    "dot" => LowType::F64,
                                    "length" => LowType::I64,
                                    _ => LowType::Entity,
                                };
                                set_reg(&mut reg_ty, *r, t);
                                continue;
                            }
                        }
                    }
                    let ext_ret = resolve_instance_method(ir, method, args.len())
                        .and_then(|full| fn_ret.get(full).copied());
                    let t = infer_call_method_type(ot, method, args, &reg_ty, &var_ty, ext_ret);
                    set_reg(&mut reg_ty, *r, t);
                }
                Inst::GetField(r, obj, name) => {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    if ot == Some(LowType::Str) {
                        let t = match name.as_str() {
                            "length" | "count" | "indexOf" => LowType::I64,
                            "empty" => LowType::Bool,
                            _ => LowType::Str,
                        };
                        set_reg(&mut reg_ty, *r, t);
                    } else if ot == Some(LowType::List) {
                        let t = match name.as_str() {
                            "count" | "length" | "first" | "last" => LowType::I64,
                            "empty" => LowType::Bool,
                            _ => LowType::List,
                        };
                        set_reg(&mut reg_ty, *r, t);
                    } else if ot == Some(LowType::MixedList) {
                        let t = match name.as_str() {
                            "count" | "length" => LowType::I64,
                            "empty" => LowType::Bool,
                            _ => LowType::Dyn,
                        };
                        set_reg(&mut reg_ty, *r, t);
                    } else if name == "count" || name == "length" || name == "empty" {
                        if name == "empty" {
                            set_reg(&mut reg_ty, *r, LowType::Bool);
                        }
                    } else if ot == Some(LowType::Map) {
                        set_reg(&mut reg_ty, *r, LowType::Dyn);
                    } else if ot == Some(LowType::Entity) {
                        let field_ty = resolve_entity_field_type(
                            obj, name, &reg_entity_name, &var_entity_name,
                            &reg_source_var, entity_field_types, ir,
                        );
                        set_reg(&mut reg_ty, *r, field_ty);
                    } else if ot == Some(LowType::Dyn) {
                        let t = match name.as_str() {
                            "count" | "length" | "value" | "load" => LowType::I64,
                            "empty" => LowType::Bool,
                            _ => {
                                // Try entity field type inference for Dyn receivers too.
                                resolve_entity_field_type(
                                    obj, name, &reg_entity_name, &var_entity_name,
                                    &reg_source_var, entity_field_types, ir,
                                )
                            }
                        };
                        set_reg(&mut reg_ty, *r, t);
                    }
                }
                Inst::MakeList(r, els) => {
                    let mut has_non_i64 = false;
                    for e in els {
                        let et = operand_ty(e, &reg_ty, &var_ty);
                        if matches!(et, Some(t) if t != LowType::I64 && t != LowType::Bool) {
                            has_non_i64 = true;
                            break;
                        }
                    }
                    if has_non_i64 {
                        set_reg(&mut reg_ty, *r, LowType::MixedList);
                        // Track homogeneous entity lists for typed-array optimization.
                        let mut common_entity: Option<String> = None;
                        let mut all_same = true;
                        for e in els {
                            let et = operand_ty(e, &reg_ty, &var_ty);
                            if et == Some(LowType::Entity) {
                                let ename = match e { Operand::Reg(r) => reg_entity_name.get(r).cloned(), _ => None };
                                if let Some(n) = ename {
                                    if let Some(ref cn) = common_entity {
                                        if &n != cn { all_same = false; break; }
                                    } else {
                                        common_entity = Some(n);
                                    }
                                } else { all_same = false; break; }
                            } else { all_same = false; break; }
                        }
                        if all_same && !els.is_empty() {
                            if let Some(name) = common_entity {
                                reg_list_entity.insert(*r, name);
                            }
                        }
                    } else {
                        set_reg(&mut reg_ty, *r, LowType::List);
                    }
                }
                Inst::MakeMap(r, _) => set_reg(&mut reg_ty, *r, LowType::Map),
                Inst::MakeEntity(r, name, _) => {
                    set_reg(&mut reg_ty, *r, LowType::Entity);
                    reg_entity_name.insert(*r, name.clone());
                }
                Inst::MakePackedEntity(r, name, _) => {
                    set_reg(&mut reg_ty, *r, LowType::Entity);
                    reg_entity_name.insert(*r, name.clone());
                }
                Inst::MakeClosure(r, _, _) => set_reg(&mut reg_ty, *r, LowType::Closure),
                Inst::CallClosure(r, _, _) => set_reg(&mut reg_ty, *r, LowType::I64),
                Inst::RunTask(r, _) => set_reg(&mut reg_ty, *r, LowType::Task),
                Inst::Phi(r, arms) => {
                    for (op, _) in arms {
                        if let Some(t) = operand_ty(op, &reg_ty, &var_ty) {
                            set_reg(&mut reg_ty, *r, t);
                            break;
                        }
                    }
                }
                Inst::Show(_)
                | Inst::WaitTask(_)
                | Inst::WaitAll
                | Inst::GetIndex(_, _, _)
                | Inst::SetField(_, _, _)
                | Inst::SetIndex(_, _, _)
                | Inst::Jump(_)
                | Inst::Branch(_, _, _)
                | Inst::Return(_)
                | Inst::Nop
                | Inst::InlineAsm(_, _, _, _) => {}
            }
        }
    }

    for block in &func.blocks {
        for inst in &block.insts {
            if let Inst::BinOp(r, BinOp::Add, lhs, rhs) = inst {
                let lo = operand_ty(lhs, &reg_ty, &var_ty);
                let ro = operand_ty(rhs, &reg_ty, &var_ty);
                let text_concat = match (lo, ro) {
                    (Some(LowType::Str), Some(LowType::Str)) => true,
                    (Some(LowType::Str), Some(LowType::I64 | LowType::Bool | LowType::F64))
                    | (Some(LowType::I64 | LowType::Bool | LowType::F64), Some(LowType::Str))
                    | (Some(LowType::Str), Some(LowType::Dyn))
                    | (Some(LowType::Dyn), Some(LowType::Str))
                    | (Some(LowType::Str), Some(LowType::List | LowType::Map | LowType::Entity | LowType::MixedList))
                    | (Some(LowType::List | LowType::Map | LowType::Entity | LowType::MixedList), Some(LowType::Str)) => true,
                    _ => false,
                };
                if text_concat {
                    set_reg(&mut reg_ty, *r, LowType::Str);
                }
            }
        }
    }

    for _ in 0..8 {
        for block in &func.blocks {
            for inst in &block.insts {
                if let Inst::GetField(r, obj, name) = inst {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    // Backward inference: field access on a default-I64 value
                    // means the object is actually an entity or dynamic value.
                    if ot == Some(LowType::I64) || ot.is_none() {
                        // For "count"/"length"/"empty", the object could be any
                        // collection type — use Dyn to let the runtime dispatch.
                        let inferred = if matches!(name.as_str(), "count" | "length" | "empty") {
                            LowType::Dyn
                        } else {
                            LowType::Entity
                        };
                        if let Operand::Reg(reg) = obj {
                            set_reg(&mut reg_ty, *reg, inferred);
                            if let Some(name) = reg_source_var.get(reg).cloned() {
                                var_ty.insert(name, inferred);
                            }
                        }
                    }
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    if name == "count" {
                        if matches!(ot, Some(LowType::List | LowType::Map | LowType::MixedList | LowType::Dyn)) {
                            set_reg(&mut reg_ty, *r, LowType::I64);
                        }
                    } else if name == "length" {
                        if matches!(ot, Some(LowType::List | LowType::Map | LowType::MixedList | LowType::Dyn | LowType::Str)) {
                            set_reg(&mut reg_ty, *r, LowType::I64);
                        }
                    } else if name == "empty" {
                        if matches!(ot, Some(LowType::List | LowType::Map | LowType::MixedList | LowType::Dyn | LowType::Str)) {
                            set_reg(&mut reg_ty, *r, LowType::Bool);
                        }
                    } else if ot == Some(LowType::Map) {
                        set_reg(&mut reg_ty, *r, LowType::Dyn);
                    } else if ot == Some(LowType::Entity) {
                        let field_ty = resolve_entity_field_type(
                            obj, name, &reg_entity_name, &var_entity_name,
                            &reg_source_var, entity_field_types, ir,
                        );
                        set_reg(&mut reg_ty, *r, field_ty);
                    } else if ot == Some(LowType::Dyn) {
                        let field_ty = resolve_entity_field_type(
                            obj, name, &reg_entity_name, &var_entity_name,
                            &reg_source_var, entity_field_types, ir,
                        );
                        set_reg(&mut reg_ty, *r, field_ty);
                    }
                }
                if let Inst::GetIndex(r, obj, _) = inst {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    // Backward inference: indexed access on default-I64 means
                    // the object is a Map (string keys) or a dynamic value.
                    if ot == Some(LowType::I64) || ot.is_none() {
                        if let Operand::Reg(reg) = obj {
                            set_reg(&mut reg_ty, *reg, LowType::Map);
                            if let Some(name) = reg_source_var.get(reg).cloned() {
                                var_ty.insert(name, LowType::Map);
                            }
                        }
                    }
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    if ot == Some(LowType::List) {
                        set_reg(&mut reg_ty, *r, LowType::I64);
                    } else if ot == Some(LowType::MixedList) {
                        // Typed-array optimization: if list has known entity element type,
                        // the indexed element is Entity (not Dyn).
                        let list_ent = if let Operand::Reg(reg) = obj {
                            reg_list_entity.get(reg).cloned().or_else(|| {
                                reg_source_var.get(reg).and_then(|v| var_list_entity.get(v).cloned())
                            })
                        } else { None };
                        if let Some(ename) = list_ent {
                            set_reg(&mut reg_ty, *r, LowType::Entity);
                            reg_entity_name.insert(*r, ename);
                        } else {
                            set_reg(&mut reg_ty, *r, LowType::Dyn);
                        }
                    } else if matches!(ot, Some(LowType::Dyn | LowType::Entity | LowType::Map)) {
                        set_reg(&mut reg_ty, *r, LowType::Dyn);
                    } else if ot == Some(LowType::Str) {
                        set_reg(&mut reg_ty, *r, LowType::Str);
                    }
                }
                // Backward inference for SetIndex: if we index-assign into an
                // object that is still default-I64, upgrade it to Map.
                if let Inst::SetIndex(obj, _, _) = inst {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    if ot == Some(LowType::I64) || ot.is_none() {
                        if let Operand::Reg(reg) = obj {
                            set_reg(&mut reg_ty, *reg, LowType::Map);
                            if let Some(name) = reg_source_var.get(reg).cloned() {
                                var_ty.insert(name, LowType::Map);
                            }
                        }
                    }
                }
                // Recompute CallMethod result types after GetIndex/GetField/Load/Store
                // refinement has had a chance to improve the receiver and argument types.
                if let Inst::CallMethod(r, obj, method, args) = inst {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    // Value-type methods: dot returns F64, length returns I64
                    let is_vt_method = if ot == Some(LowType::Entity) {
                        if let Operand::Reg(reg) = obj {
                            reg_entity_name.get(reg)
                                .filter(|vn| ir.value_types.contains(vn.as_str()))
                                .is_some()
                        } else { false }
                    } else { false };
                    if is_vt_method {
                        let t = match method.as_str() {
                            "dot" => LowType::F64,
                            "length" => LowType::I64,
                            _ => LowType::Entity,
                        };
                        set_reg(&mut reg_ty, *r, t);
                    } else {
                        let ext_ret = resolve_instance_method(ir, method, args.len())
                            .and_then(|full| fn_ret.get(full).copied());
                        let t = infer_call_method_type(ot, method, args, &reg_ty, &var_ty, ext_ret);
                        set_reg(&mut reg_ty, *r, t);
                    }
                }
                if let Inst::MakeList(r, els) = inst {
                    let mut has_non_i64 = false;
                    for e in els {
                        let et = operand_ty(e, &reg_ty, &var_ty);
                        if matches!(et, Some(t) if t != LowType::I64 && t != LowType::Bool) {
                            has_non_i64 = true;
                            break;
                        }
                    }
                    set_reg(
                        &mut reg_ty,
                        *r,
                        if has_non_i64 {
                            LowType::MixedList
                        } else {
                            LowType::List
                        },
                    );
                }
                // Backward inference for CallMethod: if a method associated with
                // a specific type is called on a default-I64, upgrade the object.
                if let Inst::CallMethod(_r, obj, method, _args) = inst {
                    let ot = operand_ty(obj, &reg_ty, &var_ty);
                    if ot == Some(LowType::List)
                        && method == "add"
                        && wants_mixed_list(_args, &reg_ty, &var_ty)
                    {
                        if let Operand::Reg(reg) = obj {
                            set_reg(&mut reg_ty, *reg, LowType::MixedList);
                            if let Some(name) = reg_source_var.get(reg).cloned() {
                                var_ty.insert(name, LowType::MixedList);
                            }
                        }
                    }
                    if ot == Some(LowType::I64) || ot.is_none() {
                        let list_methods = [
                            "add", "filter", "map", "each", "find", "reduce", "any", "all",
                            "contains", "indexOf", "sort", "reversed", "slice", "take",
                            "skip", "push", "append", "join", "first", "last", "count",
                            "empty", "flat", "unique", "chunk", "zip", "removeAt",
                        ];
                        let str_methods = [
                            "upper", "lower", "trim", "trimStart", "trimEnd",
                            "startsWith", "endsWith", "split", "replace",
                            "replaceAll", "substring", "charAt", "toNumber", "toDecimal",
                            "repeat", "padLeft", "padRight",
                        ];
                        let map_methods = ["has", "get", "put", "remove", "keys", "values", "entries", "set"];
                        if list_methods.contains(&method.as_str()) {
                            if let Operand::Reg(reg) = obj {
                                set_reg(&mut reg_ty, *reg, LowType::MixedList);
                                if let Some(name) = reg_source_var.get(reg).cloned() {
                                    var_ty.insert(name, LowType::MixedList);
                                }
                            }
                        } else if str_methods.contains(&method.as_str()) {
                            if let Operand::Reg(reg) = obj {
                                set_reg(&mut reg_ty, *reg, LowType::Str);
                                if let Some(name) = reg_source_var.get(reg).cloned() {
                                    var_ty.insert(name, LowType::Str);
                                }
                            }
                        } else if map_methods.contains(&method.as_str()) {
                            if let Operand::Reg(reg) = obj {
                                set_reg(&mut reg_ty, *reg, LowType::Map);
                                if let Some(name) = reg_source_var.get(reg).cloned() {
                                    var_ty.insert(name, LowType::Map);
                                }
                            }
                        } else if let Some(full) = resolve_instance_method(ir, method, _args.len()) {
                            // Only promote the receiver to Entity if the resolved method's
                            // self param is actually an entity type (Str/Entity/Dyn).
                            // Extension methods on primitives (number, decimal, flag) should
                            // not override the receiver's type.
                            let resolved_fn = ir.functions.iter().find(|f| f.name == full);
                            let self_is_entity = resolved_fn
                                .and_then(|f| f.param_types.first().copied())
                                .map(|pt| matches!(pt, IrParamType::Str | IrParamType::Entity | IrParamType::Dyn))
                                .unwrap_or(true);
                            if self_is_entity {
                                if let Operand::Reg(reg) = obj {
                                    set_reg(&mut reg_ty, *reg, LowType::Entity);
                                    if let Some(name) = reg_source_var.get(reg).cloned() {
                                        var_ty.insert(name, LowType::Entity);
                                    }
                                }
                            }
                        }
                    }
                }
                // Re-propagate Store so variables assigned from GetIndex/GetField
                // pick up the newly inferred register types.
                if let Inst::Store(name, op) = inst {
                    if let Some(t) = operand_ty(op, &reg_ty, &var_ty) {
                        var_ty.insert(name.clone(), t);
                    }
                }
                // Re-propagate Load so registers that load from updated variables
                // pick up the new variable types.
                if let Inst::Load(r, name) = inst {
                    if let Some(t) = var_ty.get(name).copied() {
                        set_reg(&mut reg_ty, *r, t);
                    }
                }
                // Re-evaluate BinOp result types after backward inference
                // may have changed operand types (e.g. I64 → Dyn via GetField).
                if let Inst::BinOp(r, op, lhs, rhs) = inst {
                    let lo = operand_ty(lhs, &reg_ty, &var_ty);
                    let ro = operand_ty(rhs, &reg_ty, &var_ty);
                    let either_f64 = lo == Some(LowType::F64) || ro == Some(LowType::F64);
                    let both_dyn = lo == Some(LowType::Dyn) && ro == Some(LowType::Dyn);
                    // Check if both operands are the same value type
                    let both_value_entity = if lo == Some(LowType::Entity) && ro == Some(LowType::Entity) {
                        let lname = match lhs { Operand::Reg(r) => reg_entity_name.get(r).cloned(), _ => None };
                        let rname = match rhs { Operand::Reg(r) => reg_entity_name.get(r).cloned(), _ => None };
                        if let (Some(ln), Some(rn)) = (&lname, &rname) {
                            if ln == rn && ir.value_types.contains(ln.as_str()) { Some(ln.clone()) } else { None }
                        } else { None }
                    } else { None };
                    let new_t = match op {
                        BinOp::Add => {
                            if both_value_entity.is_some() {
                                Some(LowType::Entity)
                            } else {
                            let any_str = lo == Some(LowType::Str) || ro == Some(LowType::Str);
                            let any_heap = matches!(lo, Some(LowType::List | LowType::Map | LowType::Entity))
                                || matches!(ro, Some(LowType::List | LowType::Map | LowType::Entity));
                            if any_str || any_heap {
                                Some(LowType::Str)
                            } else if both_dyn {
                                Some(LowType::Dyn)
                            } else if either_f64 {
                                Some(LowType::F64)
                            } else {
                                None
                            }
                            }
                        }
                        BinOp::Sub | BinOp::Mul | BinOp::Div | BinOp::Mod => {
                            if both_value_entity.is_some() {
                                Some(LowType::Entity)
                            } else if both_dyn {
                                Some(LowType::Dyn)
                            } else if either_f64 {
                                Some(LowType::F64)
                            } else {
                                None
                            }
                        }
                        _ => None,
                    };
                    if let Some(t) = new_t {
                        set_reg(&mut reg_ty, *r, t);
                    }
                }
            }
        }
    }

    for t in reg_ty.iter_mut() {
        if t.is_none() {
            *t = Some(LowType::I64);
        }
    }

    (reg_ty, var_ty)
}

fn set_reg(reg_ty: &mut Vec<Option<LowType>>, r: Reg, t: LowType) {
    let i = r.0 as usize;
    if i >= reg_ty.len() {
        reg_ty.resize(i + 1, None);
    }
    reg_ty[i] = Some(t);
}

fn const_ty(c: &Constant) -> LowType {
    match c {
        Constant::Number(_) | Constant::Char(_) | Constant::Null => LowType::I64,
        Constant::Decimal(_) => LowType::F64,
        Constant::Text(_) => LowType::Str,
        Constant::Flag(_) => LowType::Bool,
    }
}

pub(crate) fn operand_ty(
    op: &Operand,
    reg_ty: &[Option<LowType>],
    _var_ty: &HashMap<String, LowType>,
) -> Option<LowType> {
    match op {
        Operand::Const(c) => Some(const_ty(c)),
        Operand::Reg(r) => reg_ty.get(r.0 as usize).copied().flatten(),
    }
}

/// Resolve the field type for a GetField on an Entity-typed register.
/// 1. If we know the exact entity type name (via reg_entity_name tracking), look up the field type.
/// 2. Otherwise, if only one entity type in the program has that field, use that type's field layout.
/// Only returns concrete numeric types (F64, I64) that we can load inline from slots.
/// Falls back to Dyn for pointer types (Str, Entity, List, etc.) to avoid misinterpreting
/// OboValue* pointers as raw data pointers.
fn resolve_entity_field_type(
    obj: &Operand,
    field_name: &str,
    reg_entity_name: &HashMap<Reg, String>,
    var_entity_name: &HashMap<String, String>,
    reg_source_var: &HashMap<Reg, String>,
    entity_field_types: &HashMap<String, HashMap<String, LowType>>,
    _ir: &IrProgram,
) -> LowType {
    // Try to find the entity type name from register or variable tracking.
    let ename = match obj {
        Operand::Reg(r) => {
            reg_entity_name.get(r).cloned().or_else(|| {
                reg_source_var.get(r).and_then(|v| var_entity_name.get(v).cloned())
            })
        }
        _ => None,
    };
    if let Some(ref ename) = ename {
        if let Some(fields) = entity_field_types.get(ename) {
            if let Some(ft) = fields.get(field_name) {
                if matches!(ft, LowType::F64 | LowType::I64) {
                    return *ft;
                }
            }
        }
    }
    // Fallback: if all entity types defining this field agree on the type, use it.
    let mut candidates: Vec<&LowType> = Vec::new();
    for (_ent_name, fields) in entity_field_types {
        if let Some(ft) = fields.get(field_name) {
            candidates.push(ft);
        }
    }
    if !candidates.is_empty() && candidates.iter().all(|t| **t == *candidates[0]) {
        if matches!(candidates[0], LowType::F64 | LowType::I64) {
            return *candidates[0];
        }
    }
    LowType::Dyn
}

fn max_reg_operand(op: &Operand) -> u32 {
    match op {
        Operand::Reg(r) => r.0 + 1,
        Operand::Const(_) => 0,
    }
}

fn bump_max_reg(m: &mut u32, op: &Operand) {
    *m = (*m).max(max_reg_operand(op));
}

/// Largest register index + 1 appearing anywhere (dests and operands). Missing this caused
/// undersized `reg_ty`, `operand_ty` = None on `Return`/`Branch`, and oscillation in
/// `infer_function_returns`.
fn max_reg_in_function(func: &IrFunction) -> u32 {
    let mut m = 0u32;
    for block in &func.blocks {
        for inst in &block.insts {
            m = m.max(max_reg_in_inst(inst));
        }
    }
    // Params use %reg_0 .. %reg_{n-1}; ensure the vector is never shorter than that.
    m.max(func.params.len() as u32)
}

fn max_reg_in_inst(inst: &Inst) -> u32 {
    let mut m = 0u32;
    match inst {
        Inst::Const(r, _) => m = m.max(r.0 + 1),
        Inst::Copy(r, op) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, op);
        }
        Inst::BinOp(r, _, lhs, rhs) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, lhs);
            bump_max_reg(&mut m, rhs);
        }
        Inst::UnaryOp(r, _, op) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, op);
        }
        Inst::Load(r, _) => m = m.max(r.0 + 1),
        Inst::Store(_, op) => bump_max_reg(&mut m, op),
        Inst::Call(r, _, args) => {
            m = m.max(r.0 + 1);
            for a in args {
                bump_max_reg(&mut m, a);
            }
        }
        Inst::CallMethod(r, obj, _, args) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, obj);
            for a in args {
                bump_max_reg(&mut m, a);
            }
        }
        Inst::Show(op) => bump_max_reg(&mut m, op),
        Inst::GetField(r, obj, _) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, obj);
        }
        Inst::SetField(obj, _, val) => {
            bump_max_reg(&mut m, obj);
            bump_max_reg(&mut m, val);
        }
        Inst::GetIndex(r, obj, idx) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, obj);
            bump_max_reg(&mut m, idx);
        }
        Inst::SetIndex(obj, idx, val) => {
            bump_max_reg(&mut m, obj);
            bump_max_reg(&mut m, idx);
            bump_max_reg(&mut m, val);
        }
        Inst::MakeList(r, els) => {
            m = m.max(r.0 + 1);
            for e in els {
                bump_max_reg(&mut m, e);
            }
        }
        Inst::MakeMap(r, pairs) => {
            m = m.max(r.0 + 1);
            for (k, v) in pairs {
                bump_max_reg(&mut m, k);
                bump_max_reg(&mut m, v);
            }
        }
        Inst::MakeEntity(r, _, fields) => {
            m = m.max(r.0 + 1);
            for (_, v) in fields {
                bump_max_reg(&mut m, v);
            }
        }
        Inst::MakePackedEntity(r, _, fields) => {
            m = m.max(r.0 + 1);
            for (_, v) in fields {
                bump_max_reg(&mut m, v);
            }
        }
        Inst::MakeClosure(r, _, caps) => {
            m = m.max(r.0 + 1);
            for c in caps { bump_max_reg(&mut m, c); }
        }
        Inst::CallClosure(r, closure, args) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, closure);
            for a in args { bump_max_reg(&mut m, a); }
        }
        Inst::RunTask(r, closure) => {
            m = m.max(r.0 + 1);
            bump_max_reg(&mut m, closure);
        }
        Inst::Jump(_) => {}
        Inst::Branch(cond, _, _) => bump_max_reg(&mut m, cond),
        Inst::WaitTask(task) => bump_max_reg(&mut m, task),
        Inst::WaitAll => {}
        Inst::Return(ops) => {
            for op in ops {
                bump_max_reg(&mut m, op);
            }
        }
        Inst::Phi(r, arms) => {
            m = m.max(r.0 + 1);
            for (op, _) in arms {
                bump_max_reg(&mut m, op);
            }
        }
        Inst::Nop => {}
        Inst::InlineAsm(r, _, _, ops) => {
            m = m.max(r.0 + 1);
            for op in ops {
                bump_max_reg(&mut m, op);
            }
        }
    }
    m
}
