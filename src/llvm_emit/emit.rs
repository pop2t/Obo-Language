mod function;

use std::collections::{HashMap, HashSet};

use crate::ir::inst::{Constant, Inst, IrProgram, Operand, Reg};

use super::infer::{infer_function_returns, resolve_instance_method, LowType};

fn llvm_fn_ret_ty(name: &str, fn_ret: &HashMap<String, LowType>) -> &'static str {
    if name == "main" {
        return "i32";
    }
    if name.starts_with("__closure_") {
        return "i64";
    }
    match fn_ret.get(name).copied().unwrap_or(LowType::I64) {
        LowType::Str
        | LowType::List
        | LowType::Map
        | LowType::Entity
        | LowType::Dyn
        | LowType::Closure
        | LowType::Task
        | LowType::MixedList => "i8*",
        LowType::F64 => "double",
        LowType::I64 | LowType::Bool => "i64",
    }
}

pub fn emit_program(ir: &mut IrProgram) -> Result<(String, HashMap<String, LowType>), String> {
    let fn_ret = infer_function_returns(ir)?;

    // Inter-procedural param type refinement: scan all call sites and infer
    // param types from argument types when the declared type is default I64.
    {
        use crate::ir::inst::IrParamType;
        use super::infer::{infer_function_types, operand_ty};
        let to_param_type = |ty: LowType| match ty {
            LowType::I64 => IrParamType::I64,
            LowType::Str => IrParamType::Str,
            LowType::List => IrParamType::List,
            LowType::MixedList => IrParamType::MixedList,
            LowType::Map => IrParamType::Map,
            LowType::Entity => IrParamType::Entity,
            LowType::Dyn => IrParamType::Dyn,
            LowType::Bool => IrParamType::Bool,
            LowType::F64 => IrParamType::F64,
            LowType::Closure => IrParamType::Closure,
            LowType::Task => IrParamType::Task,
        };
        for _ in 0..8 {
            let mut refinements: HashMap<String, Vec<Option<LowType>>> = HashMap::new();
            for f in &ir.functions {
                let (reg_ty, var_ty) = infer_function_types(f, ir, &fn_ret);
                for block in &f.blocks {
                    for inst in &block.insts {
                        if let Inst::Call(_, callee, args) = inst {
                            let entry = refinements
                                .entry(callee.clone())
                                .or_insert_with(|| vec![None; args.len()]);
                            while entry.len() < args.len() {
                                entry.push(None);
                            }
                            for (i, arg) in args.iter().enumerate() {
                                if let Some(t) = operand_ty(arg, &reg_ty, &var_ty) {
                                    if entry[i].is_none() || entry[i] == Some(LowType::I64) {
                                        entry[i] = Some(t);
                                    }
                                }
                            }
                        }
                        if let Inst::CallMethod(_, obj, method, args) = inst {
                            let Some(callee) = resolve_instance_method(ir, method, args.len()) else {
                                continue;
                            };
                            let entry = refinements
                                .entry(callee.to_string())
                                .or_insert_with(|| vec![None; args.len() + 1]);
                            while entry.len() < args.len() + 1 {
                                entry.push(None);
                            }
                            if entry[0].is_none() || entry[0] == Some(LowType::I64) {
                                entry[0] = operand_ty(obj, &reg_ty, &var_ty).or(Some(LowType::Entity));
                            }
                            for (i, arg) in args.iter().enumerate() {
                                if let Some(t) = operand_ty(arg, &reg_ty, &var_ty) {
                                    if entry[i + 1].is_none() || entry[i + 1] == Some(LowType::I64) {
                                        entry[i + 1] = Some(t);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            let mut changed = false;
            for f in &mut ir.functions {
                if let Some(refined) = refinements.get(&f.name) {
                    for (i, maybe_ty) in refined.iter().enumerate() {
                        if let Some(ty) = maybe_ty {
                            if i < f.param_types.len() {
                                let current = f.param_types[i];
                                if current == IrParamType::I64 && *ty != LowType::I64 {
                                    f.param_types[i] = to_param_type(*ty);
                                    changed = true;
                                }
                            }
                        }
                    }
                }
            }

            if !changed {
                break;
            }
        }
    }

    for f in &ir.functions {
        if f.name == "main" {
            let rt = fn_ret.get("main").copied().unwrap_or(LowType::I64);
            if rt != LowType::I64 {
                return Err(
                    "native build: main must exit with a number; use show for text (main cannot return text)"
                        .into(),
                );
            }
        }
    }

    let mut out = String::new();
    out.push_str("; OBO native codegen (Phase 7)\n");
    out.push_str("declare i32 @printf(i8*, ...)\n");
    out.push_str("declare i32 @strcmp(i8*, i8*)\n");
    out.push_str("declare i8* @obo_str_concat(i8*, i8*)\n");
    out.push_str("declare i8* @obo_str_concat_int(i8*, i64)\n");
    out.push_str("declare i8* @obo_i64_to_str(i64)\n");
    out.push_str("declare i8* @obo_list_new_i64(i64, i64*)\n");
    out.push_str("declare i64 @obo_list_len(i8*)\n");
    out.push_str("declare i64 @obo_list_get(i8*, i64)\n");
    out.push_str("declare void @obo_list_set_i64(i8*, i64, i64)\n");
    out.push_str("declare void @obo_list_print(i8*)\n");
    out.push_str("declare i8* @obo_map_new()\n");
    out.push_str("declare i64 @obo_map_len(i8*)\n");
    out.push_str("declare void @obo_map_put_i64(i8*, i8*, i64)\n");
    out.push_str("declare void @obo_map_put_str(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_map_put_f64(i8*, i8*, double)\n");
    out.push_str("declare void @obo_map_put_bool(i8*, i8*, i64)\n");
    out.push_str("declare void @obo_map_put_null(i8*, i8*)\n");
    out.push_str("declare void @obo_map_put_list(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_map_put_map(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_map_put_entity(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_map_put_boxed(i8*, i8*, i8*)\n");
    out.push_str("declare i8* @obo_map_get_boxed(i8*, i8*)\n");
    out.push_str("declare void @obo_map_print(i8*)\n");
    out.push_str("declare i8* @obo_entity_new(i8*)\n");
    out.push_str("declare void @obo_entity_put_i64(i8*, i8*, i64)\n");
    out.push_str("declare void @obo_entity_put_str(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_put_f64(i8*, i8*, double)\n");
    out.push_str("declare void @obo_entity_put_bool(i8*, i8*, i64)\n");
    out.push_str("declare void @obo_entity_put_null(i8*, i8*)\n");
    out.push_str("declare void @obo_entity_put_list(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_put_map(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_put_entity(i8*, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_put_boxed(i8*, i8*, i8*)\n");
    out.push_str("declare i8* @obo_entity_get_boxed(i8*, i8*)\n");
    out.push_str("declare void @obo_entity_print(i8*)\n");
    // Slotted entity (compile-time field offsets)
    out.push_str("declare i8* @obo_entity_new_slotted(i8*, i32)\n");
    out.push_str("declare void @obo_entity_set_field_name(i8*, i32, i8*)\n");
    out.push_str("declare i8* @obo_entity_get_slot(i8*, i32)\n");
    out.push_str("declare void @obo_entity_set_slot_i64(i8*, i32, i64)\n");
    out.push_str("declare void @obo_entity_set_slot_f64(i8*, i32, double)\n");
    out.push_str("declare void @obo_entity_set_slot_str(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_set_slot_bool(i8*, i32, i64)\n");
    out.push_str("declare void @obo_entity_set_slot_null(i8*, i32)\n");
    out.push_str("declare void @obo_entity_set_slot_list(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_set_slot_map(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_set_slot_entity(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_set_slot_boxed(i8*, i32, i8*)\n");
    // Hybrid entity access (slot-if-slotted, map-if-regular)
    out.push_str("declare i8* @obo_entity_gfs(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_i64(i8*, i32, i8*, i64)\n");
    out.push_str("declare void @obo_entity_sfs_f64(i8*, i32, i8*, double)\n");
    out.push_str("declare void @obo_entity_sfs_str(i8*, i32, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_bool(i8*, i32, i8*, i64)\n");
    out.push_str("declare void @obo_entity_sfs_null(i8*, i32, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_list(i8*, i32, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_map(i8*, i32, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_entity(i8*, i32, i8*, i8*)\n");
    out.push_str("declare void @obo_entity_sfs_boxed(i8*, i32, i8*, i8*)\n");
    out.push_str("declare void @obo_value_print(i8*)\n");
    // Set methods
    out.push_str("declare i8* @obo_set_new(i8*)\n");
    out.push_str("declare i8* @obo_set_add(i8*, i64)\n");
    out.push_str("declare i8* @obo_set_remove(i8*, i64)\n");
    out.push_str("declare i64 @obo_set_has(i8*, i64)\n");
    out.push_str("declare i8* @obo_set_union(i8*, i8*)\n");
    out.push_str("declare i8* @obo_set_intersect(i8*, i8*)\n");
    out.push_str("declare i8* @obo_set_difference(i8*, i8*)\n");
    // Queue methods
    out.push_str("declare i8* @obo_queue_push(i8*, i64)\n");
    out.push_str("declare i64 @obo_queue_peek(i8*)\n");
    out.push_str("declare i8* @obo_queue_pop(i8*)\n");
    // Stack methods
    out.push_str("declare i8* @obo_stack_push(i8*, i64)\n");
    out.push_str("declare i64 @obo_stack_peek(i8*)\n");
    out.push_str("declare i8* @obo_stack_pop(i8*)\n");
    // Buffer methods
    out.push_str("declare i8* @obo_buffer_new(i64)\n");
    out.push_str("declare i64 @obo_buffer_length(i8*)\n");
    out.push_str("declare i64 @obo_buffer_get(i8*, i64)\n");
    out.push_str("declare i8* @obo_buffer_set(i8*, i64, i64)\n");
    out.push_str("declare i8* @obo_buffer_toList(i8*)\n");
    // Bag methods (bag = list)
    out.push_str("declare i8* @obo_bag_add(i8*, i64)\n");
    out.push_str("declare i64 @obo_bag_has(i8*, i64)\n");
    out.push_str("declare i8* @obo_bag_remove(i8*, i64)\n");
    // Grid2D methods
    out.push_str("declare i8* @obo_grid2d_new(i64, i64, i64)\n");
    out.push_str("declare i64 @obo_grid2d_rows(i8*)\n");
    out.push_str("declare i64 @obo_grid2d_cols(i8*)\n");
    out.push_str("declare i64 @obo_grid2d_count(i8*)\n");
    out.push_str("declare i64 @obo_grid2d_get(i8*, i64, i64)\n");
    out.push_str("declare i8* @obo_grid2d_set(i8*, i64, i64, i64)\n");
    out.push_str("declare i8* @obo_grid2d_fill(i8*, i64)\n");
    out.push_str("declare i8* @obo_grid2d_row(i8*, i64)\n");
    out.push_str("declare i8* @obo_grid2d_col(i8*, i64)\n");
    out.push_str("declare i8* @obo_grid2d_toList(i8*)\n");
    // Grid3D methods
    out.push_str("declare i8* @obo_grid3d_new(i64, i64, i64, i64)\n");
    out.push_str("declare i64 @obo_grid3d_x(i8*)\n");
    out.push_str("declare i64 @obo_grid3d_y(i8*)\n");
    out.push_str("declare i64 @obo_grid3d_z(i8*)\n");
    out.push_str("declare i64 @obo_grid3d_count(i8*)\n");
    out.push_str("declare i64 @obo_grid3d_get(i8*, i64, i64, i64)\n");
    out.push_str("declare i8* @obo_grid3d_set(i8*, i64, i64, i64, i64)\n");
    out.push_str("declare i8* @obo_grid3d_fill(i8*, i64)\n");
    out.push_str("declare i8* @obo_grid3d_toList(i8*)\n");
    out.push_str("declare i8* @obo_assert_fail(i8*)\n");
    out.push_str("declare i8* @obo_reflect(i8*)\n");
    out.push_str("declare i64 @obo_value_as_i64(i8*)\n");
    out.push_str("declare i64 @obo_value_truthy(i8*)\n");
    out.push_str("declare i64 @obo_value_len(i8*)\n");
    out.push_str("declare i64 @obo_value_empty(i8*)\n");
    out.push_str("declare i8* @obo_value_keys(i8*)\n");
    out.push_str("declare i8* @obo_value_as_list_ptr(i8*)\n");
    out.push_str("declare i8* @obo_value_as_mixed_list_ptr(i8*)\n");
    out.push_str("declare i8* @obo_value_as_map_ptr(i8*)\n");
    out.push_str("declare i8* @obo_value_as_entity_ptr(i8*)\n");
    out.push_str("declare i64 @__sys_Math_abs(i64)\n");
    out.push_str("declare i64 @__sys_Math_floor(double)\n");
    out.push_str("declare i64 @__sys_Math_ceil(double)\n");
    out.push_str("declare i64 @__sys_Math_round(double)\n");
    out.push_str("declare i64 @__sys_Math_min(i64, i64)\n");
    out.push_str("declare i64 @__sys_Math_max(i64, i64)\n");
    out.push_str("declare i64 @__sys_Math_sign(i64)\n");
    out.push_str("declare i64 @__sys_Math_maxNumber()\n");
    out.push_str("declare i64 @__sys_Math_minNumber()\n");
    out.push_str("declare i64 @__sys_Time_now()\n");
    out.push_str("declare i64 @__sys_Time_nowSeconds()\n");
    out.push_str("declare i64 @__sys_Time_sleep(i64)\n");
    out.push_str("declare i8* @__sys_File_read(i8*)\n");
    out.push_str("declare i64 @__sys_File_exists(i8*)\n");
    out.push_str("declare i64 @__sys_Convert_toNumber(i8*)\n");
    out.push_str("declare i8* @__sys_Convert_toText(i64)\n");
    out.push_str("declare i64 @obo_native_call_method_i64(i8*, i8*, i64, i64*)\n");
    out.push_str("declare i64 @obo_str_truthy(i8*)\n");
    out.push_str("declare void @obo_print_bool(i64)\n");
    out.push_str("declare void @obo_print_double(double)\n");
    out.push_str("declare i8* @obo_prompt(i8*)\n");
    out.push_str("declare i8* @obo_f64_to_str(double)\n");
    out.push_str("declare i64 @obo_call_indirect_i64(i8*, i64, i64*)\n");
    out.push_str("declare double @__sys_Math_pi()\n");
    out.push_str("declare double @__sys_Math_e()\n");
    out.push_str("declare double @__sys_Math_infinity()\n");
    out.push_str("declare double @__sys_Math_sqrt(double)\n");
    out.push_str("declare double @__sys_Math_pow(double, double)\n");
    out.push_str("declare double @__sys_Math_sin(double)\n");
    out.push_str("declare double @__sys_Math_cos(double)\n");
    out.push_str("declare double @__sys_Math_tan(double)\n");
    out.push_str("declare double @__sys_Math_asin(double)\n");
    out.push_str("declare double @__sys_Math_acos(double)\n");
    out.push_str("declare double @__sys_Math_atan(double)\n");
    out.push_str("declare double @__sys_Math_atan2(double, double)\n");
    out.push_str("declare double @__sys_Math_log(double)\n");
    out.push_str("declare double @__sys_Math_log10(double)\n");
    out.push_str("declare double @__sys_Math_lerp(double, double, double)\n");
    out.push_str("declare double @__sys_Math_clamp(double, double, double)\n");
    out.push_str("declare double @__sys_Math_random()\n");
    out.push_str("declare i64 @__sys_Math_randomInt(i64, i64)\n");
    out.push_str("declare i64 @__sys_File_write(i8*, i8*)\n");
    out.push_str("declare i64 @__sys_File_append(i8*, i8*)\n");
    out.push_str("declare i64 @__sys_File_delete(i8*)\n");
    out.push_str("declare i8* @__sys_File_readLines(i8*)\n");
    out.push_str("declare double @__sys_Convert_toDecimal(i8*)\n");
    out.push_str("declare i64 @__sys_Convert_toFlag(i64)\n");
    out.push_str("declare i64 @__sys_Convert_toChar(i64)\n");
    out.push_str("declare double @__sys_Time_measure()\n");
    out.push_str("declare i64 @__sys_Time_startTimer()\n");
    out.push_str("declare i64 @__sys_Time_stopTimer()\n");
    out.push_str("declare i64 @__sys_pointer_alloc(i64)\n");
    out.push_str("declare i64 @__sys_pointer_free(i64)\n");
    out.push_str("declare i64 @__text_length(i8*)\n");
    out.push_str("declare i64 @__text_empty(i8*)\n");
    out.push_str("declare i8* @__text_upper(i8*)\n");
    out.push_str("declare i8* @__text_lower(i8*)\n");
    out.push_str("declare i8* @__text_trim(i8*)\n");
    out.push_str("declare i8* @__text_trimStart(i8*)\n");
    out.push_str("declare i8* @__text_trimEnd(i8*)\n");
    out.push_str("declare i8* @__text_reversed(i8*)\n");
    out.push_str("declare i64 @__text_contains(i8*, i8*)\n");
    out.push_str("declare i64 @__text_startsWith(i8*, i8*)\n");
    out.push_str("declare i64 @__text_endsWith(i8*, i8*)\n");
    out.push_str("declare i64 @__text_indexOf(i8*, i8*)\n");
    out.push_str("declare i8* @__text_replace(i8*, i8*, i8*)\n");
    out.push_str("declare i8* @__text_substring(i8*, i64, i64)\n");
    out.push_str("declare i8* @__text_repeat(i8*, i64)\n");
    out.push_str("declare i8* @__text_padLeft(i8*, i64, i8*)\n");
    out.push_str("declare i8* @__text_padRight(i8*, i64, i8*)\n");
    out.push_str("declare i64 @__text_toNumber(i8*)\n");
    out.push_str("declare double @__text_toDecimal(i8*)\n");
    out.push_str("declare i8* @__text_split(i8*, i8*)\n");
    out.push_str("declare i8* @obo_list_add(i8*, i64)\n");
    out.push_str("declare i64 @obo_list_first(i8*)\n");
    out.push_str("declare i64 @obo_list_last(i8*)\n");
    out.push_str("declare i64 @obo_list_empty(i8*)\n");
    out.push_str("declare i64 @obo_list_contains(i8*, i64)\n");
    out.push_str("declare i64 @obo_list_indexOf(i8*, i64)\n");
    out.push_str("declare i8* @obo_list_sort(i8*)\n");
    out.push_str("declare i8* @obo_list_reverse(i8*)\n");
    out.push_str("declare i8* @obo_list_take(i8*, i64)\n");
    out.push_str("declare i8* @obo_list_skip(i8*, i64)\n");
    out.push_str("declare i8* @obo_list_slice(i8*, i64, i64)\n");
    out.push_str("declare i8* @obo_list_remove(i8*, i64)\n");
    out.push_str("declare i8* @obo_list_removeAt(i8*, i64)\n");
    out.push_str("declare i8* @obo_list_insert(i8*, i64, i64)\n");
    out.push_str("declare i8* @obo_list_join(i8*, i8*)\n");
    out.push_str("declare i8* @obo_list_distinct(i8*)\n");
    out.push_str("declare i64 @obo_map_empty(i8*)\n");
    out.push_str("declare i64 @obo_map_has(i8*, i8*)\n");
    out.push_str("declare i8* @obo_map_set(i8*, i8*, i64)\n");
    out.push_str("declare i8* @obo_map_remove(i8*, i8*)\n");
    out.push_str("declare i64 @obo_type_check(i8*, i8*)\n");
    out.push_str("declare void @obo_arena_register(i8*)\n");
    out.push_str("declare void @obo_arena_free_all()\n");
    out.push_str("declare void @obo_gc_push_root(i8**)\n");
    out.push_str("declare void @obo_gc_pop_roots(i64)\n");
    out.push_str("declare void @obo_gc_collect()\n");
    out.push_str("declare void @obo_gc_pause()\n");
    out.push_str("declare void @obo_gc_resume()\n");
    out.push_str("declare i8* @obo_closure_new(i8*, i64)\n");
    out.push_str("declare void @obo_closure_set_capture(i8*, i64, i64)\n");
    out.push_str("declare i64 @obo_closure_get_capture(i8*, i64)\n");
    out.push_str("declare i64 @obo_closure_call_0(i8*)\n");
    out.push_str("declare i64 @obo_closure_call_1(i8*, i64)\n");
    out.push_str("declare i64 @obo_closure_call_2(i8*, i64, i64)\n");
    out.push_str("declare i64 @obo_closure_call_3(i8*, i64, i64, i64)\n");
    out.push_str("declare i8* @obo_event_listen(i8*, i8*, i8*)\n");
    out.push_str("declare i8* @obo_event_emit(i8*, i8*, i8*)\n");
    out.push_str("declare i8* @obo_task_spawn(i8*)\n");
    out.push_str("declare void @obo_task_wait(i8*)\n");
    out.push_str("declare void @obo_task_wait_all()\n");
    out.push_str("declare i8* @obo_channel_create()\n");
    out.push_str("declare void @obo_channel_send(i8*, i64)\n");
    out.push_str("declare i64 @obo_channel_receive(i8*)\n");
    out.push_str("declare i8* @obo_atomic_create(i64)\n");
    out.push_str("declare i64 @obo_atomic_load(i8*)\n");
    out.push_str("declare void @obo_atomic_store(i8*, i64)\n");
    out.push_str("declare i64 @obo_atomic_add(i8*, i64)\n");
    out.push_str("declare i64 @obo_atomic_sub(i8*, i64)\n");
    out.push_str("declare i8* @obo_possible_push()\n");
    out.push_str("declare i64 @obo_possible_pop()\n");
    out.push_str("declare void @obo_throw(i8*)\n");
    out.push_str("declare i8* @obo_possible_get_error()\n");
    out.push_str("declare i64 @obo_safe_div(i64, i64)\n");
    out.push_str("declare i64 @obo_safe_mod(i64, i64)\n");
    out.push_str("declare i8* @obo_range(i64, i64, i64)\n");
    out.push_str("declare i32 @_setjmp(i8*) #0\n");
    out.push_str("declare i8* @malloc(i64)\n");
    out.push_str("declare i8* @obo_list_filter(i8*, i8*)\n");
    out.push_str("declare i8* @obo_list_map(i8*, i8*)\n");
    out.push_str("declare i64 @obo_list_reduce(i8*, i64, i8*)\n");
    out.push_str("declare i64 @obo_list_any(i8*, i8*)\n");
    out.push_str("declare i64 @obo_list_all(i8*, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_new(i64)\n");
    out.push_str("declare void @obo_mixed_list_set(i8*, i64, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_get(i8*, i64)\n");
    out.push_str("declare i64 @obo_mixed_list_len(i8*)\n");
    out.push_str("declare void @obo_mixed_list_print(i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_filter(i8*, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_map(i8*, i8*)\n");
    out.push_str("declare void @obo_mixed_list_each(i8*, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_add(i8*, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_removeAt(i8*, i64)\n");
    out.push_str("declare i8* @obo_mixed_list_join(i8*, i8*)\n");
    out.push_str("declare i64 @obo_mixed_list_contains(i8*, i8*)\n");
    out.push_str("declare i8* @obo_mixed_list_reduce(i8*, i8*, i8*)\n");
    out.push_str("declare i64 @obo_mixed_list_any(i8*, i8*)\n");
    out.push_str("declare i64 @obo_mixed_list_all(i8*, i8*)\n");
    out.push_str("declare i8* @obo_box_i64(i64)\n");
    out.push_str("declare i8* @obo_box_f64(double)\n");
    out.push_str("declare i8* @obo_box_str(i8*)\n");
    out.push_str("declare i8* @obo_box_bool(i64)\n");
    out.push_str("declare i8* @obo_box_null()\n");
    out.push_str("declare i8* @obo_box_list(i8*)\n");
    out.push_str("declare i8* @obo_box_map(i8*)\n");
    out.push_str("declare i8* @obo_box_entity(i8*)\n");
    out.push_str("declare double @obo_value_as_f64(i8*)\n");
    out.push_str("declare i8* @obo_value_as_str(i8*)\n");
    out.push_str("declare i64 @obo_value_compare(i8*, i8*)\n");
    out.push_str("declare i8* @obo_dyn_arith(i8*, i8*, i32)\n");
    out.push_str("declare i64 @obo_value_to_closure_arg_boxed(i8*)\n");
    out.push_str("declare i8* @obo_value_to_str(i8*)\n");
    out.push_str("declare i8* @obo_format_list_string(i8*)\n");
    out.push_str("declare i8* @obo_format_map_string(i8*)\n");
    out.push_str("declare i8* @obo_format_entity_string(i8*)\n\n");

    // Bridge (FFI) declarations — skip if already declared by the runtime.
    // Also capture existing declaration return types for conflict resolution.
    let existing_decl_ret: std::collections::HashMap<String, String> = out
        .lines()
        .filter_map(|l| {
            let l = l.trim();
            if l.starts_with("declare ") {
                let rest = l.strip_prefix("declare ")?;
                let ret_type = rest.split_whitespace().next()?.to_string();
                let name = l.split('@').nth(1).and_then(|s| s.split('(').next())?.to_string();
                Some((name, ret_type))
            } else {
                None
            }
        })
        .collect();
    let existing_decls: std::collections::HashSet<String> = existing_decl_ret.keys().cloned().collect();

    // Build corrected bridge return types (overriding with existing declarations where they conflict).
    let mut bridge_ret_overrides: std::collections::HashMap<String, String> = std::collections::HashMap::new();
    for bfn in &ir.bridge_fns {
        if let Some(existing_ret) = existing_decl_ret.get(&bfn.name) {
            bridge_ret_overrides.insert(bfn.name.clone(), existing_ret.clone());
        }
    }

    for bfn in &ir.bridge_fns {
        if existing_decls.contains(&bfn.name) {
            continue;
        }
        let params = bfn.param_types.join(", ");
        let variadic = if bfn.is_variadic {
            if params.is_empty() { "..." } else { ", ..." }
        } else {
            ""
        };
        out.push_str(&format!(
            "declare {} @{}({}{})\n",
            bfn.return_type, bfn.name, params, variadic
        ));
    }
    if !ir.bridge_fns.is_empty() {
        out.push('\n');
    }

    out.push_str("@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c\"%lld\\0A\\00\"\n");
    out.push_str("@obo.fmt.str = private unnamed_addr constant [4 x i8] c\"%s\\0A\\00\"\n");
    out.push_str("@obo.fmt.closure = private unnamed_addr constant [12 x i8] c\"<action>\\0A\\00\\00\\00\"\n\n");
    out.push_str("@obo.fmt.task = private unnamed_addr constant [8 x i8] c\"<task>\\0A\\00\"\n\n");
    out.push_str("attributes #0 = { returns_twice }\n\n");

    let mut string_table = Vec::new();
    collect_string_constants(ir, &mut string_table);
    collect_heap_key_strings(ir, &mut string_table);

    for (index, s) in string_table.iter().enumerate() {
        let (byte_len, payload) = llvm_c_array(s);
        out.push_str(&format!(
            "@obo.str.{} = private unnamed_addr constant [{} x i8] c\"{}\"\n",
            index, byte_len, payload
        ));
    }
    out.push('\n');

    let mut closure_param_returns: HashMap<String, Vec<Option<LowType>>> = HashMap::new();
    for f in &ir.functions {
        let mut closure_regs: HashMap<Reg, String> = HashMap::new();
        let mut closure_vars: HashMap<String, String> = HashMap::new();
        for block in &f.blocks {
            for inst in &block.insts {
                match inst {
                    Inst::MakeClosure(r, name, _) => {
                        closure_regs.insert(*r, name.clone());
                    }
                    Inst::Copy(dst, Operand::Reg(src)) => {
                        if let Some(name) = closure_regs.get(src).cloned() {
                            closure_regs.insert(*dst, name);
                        }
                    }
                    Inst::Store(name, Operand::Reg(src)) => {
                        if let Some(closure_name) = closure_regs.get(src).cloned() {
                            closure_vars.insert(name.clone(), closure_name);
                        }
                    }
                    Inst::Load(r, name) => {
                        if let Some(closure_name) = closure_vars.get(name).cloned() {
                            closure_regs.insert(*r, closure_name);
                        }
                    }
                    Inst::Call(_, callee, args) => {
                        let entry = closure_param_returns
                            .entry(callee.clone())
                            .or_insert_with(|| vec![None; args.len()]);
                        while entry.len() < args.len() {
                            entry.push(None);
                        }
                        for (index, arg) in args.iter().enumerate() {
                            let Operand::Reg(reg) = arg else {
                                continue;
                            };
                            let Some(closure_name) = closure_regs.get(reg) else {
                                continue;
                            };
                            let Some(ret_ty) = fn_ret.get(closure_name).copied() else {
                                continue;
                            };
                            match entry[index] {
                                None => entry[index] = Some(ret_ty),
                                Some(existing) if existing == ret_ty => {}
                                Some(_) => entry[index] = Some(LowType::Dyn),
                            }
                        }
                    }
                    Inst::CallMethod(_, _, method, args) => {
                        let Some(callee) = resolve_instance_method(ir, method, args.len()) else {
                            continue;
                        };
                        let entry = closure_param_returns
                            .entry(callee.to_string())
                            .or_insert_with(|| vec![None; args.len() + 1]);
                        while entry.len() < args.len() + 1 {
                            entry.push(None);
                        }
                        for (index, arg) in args.iter().enumerate() {
                            let Operand::Reg(reg) = arg else {
                                continue;
                            };
                            let Some(closure_name) = closure_regs.get(reg) else {
                                continue;
                            };
                            let Some(ret_ty) = fn_ret.get(closure_name).copied() else {
                                continue;
                            };
                            match entry[index + 1] {
                                None => entry[index + 1] = Some(ret_ty),
                                Some(existing) if existing == ret_ty => {}
                                Some(_) => entry[index + 1] = Some(LowType::Dyn),
                            }
                        }
                    }
                    _ => {}
                }
            }
        }
    }

    for f in &ir.functions {
        out.push_str(&function::emit_function(
            f,
            ir,
            &string_table,
            &fn_ret,
            &bridge_ret_overrides,
            &closure_param_returns,
        )?);
        out.push('\n');
    }

    Ok((out, fn_ret))
}

fn llvm_c_array(s: &str) -> (usize, String) {
    let mut out = String::new();
    for b in s.as_bytes() {
        match *b {
            b'"' => out.push_str("\\22"),
            b'\\' => out.push_str("\\5C"),
            b'\n' => out.push_str("\\0A"),
            b'\r' => out.push_str("\\0D"),
            b'\t' => out.push_str("\\09"),
            0 => out.push_str("\\00"),
            b if b >= 32 && b < 127 => out.push(b as char),
            b => out.push_str(&format!("\\{:02X}", b)),
        }
    }
    out.push_str("\\00");
    (s.as_bytes().len() + 1, out)
}

fn collect_heap_key_strings(ir: &IrProgram, out: &mut Vec<String>) {
    let mut seen: HashSet<String> = out.iter().cloned().collect();
    let mut add = |s: String| {
        if seen.insert(s.clone()) {
            out.push(s);
        }
    };
    for f in &ir.functions {
        for b in &f.blocks {
            for inst in &b.insts {
                match inst {
                    Inst::GetField(_, _, name) => add(name.clone()),
                    Inst::SetField(_, name, _) => add(name.clone()),
                    Inst::MakeMap(_, pairs) => {
                        for (k, _) in pairs {
                            if let Operand::Const(Constant::Text(s)) = k {
                                add(s.clone());
                            }
                        }
                    }
                    Inst::MakeEntity(_, tname, fields) => {
                        add(tname.clone());
                        for (n, _) in fields {
                            add(n.clone());
                        }
                    }
                    _ => {}
                }
            }
        }
    }
}

fn collect_string_constants(ir: &IrProgram, out: &mut Vec<String>) {
    let mut seen = HashSet::new();
    for f in &ir.functions {
        for b in &f.blocks {
            for inst in &b.insts {
                scan_operand_strings(inst, out, &mut seen);
            }
        }
    }
    for (_, c) in &ir.constants {
        if let Constant::Text(s) = c {
            if seen.insert(s.clone()) {
                out.push(s.clone());
            }
        }
    }
}

fn add_str(s: &str, out: &mut Vec<String>, seen: &mut HashSet<String>) {
    if seen.insert(s.to_string()) {
        out.push(s.to_string());
    }
}

fn add_op_str(op: &Operand, out: &mut Vec<String>, seen: &mut HashSet<String>) {
    if let Operand::Const(Constant::Text(s)) = op {
        add_str(s, out, seen);
    }
}

fn scan_operand_strings(inst: &Inst, out: &mut Vec<String>, seen: &mut HashSet<String>) {
    match inst {
        Inst::Const(_, Constant::Text(s)) => add_str(s, out, seen),
        Inst::Copy(_, op) => add_op_str(op, out, seen),
        Inst::BinOp(_, _, l, r) => {
            add_op_str(l, out, seen);
            add_op_str(r, out, seen);
        }
        Inst::UnaryOp(_, _, op) => add_op_str(op, out, seen),
        Inst::Show(op) => add_op_str(op, out, seen),
        Inst::Store(_, op) => add_op_str(op, out, seen),
        Inst::Call(_, _, args) => {
            for a in args {
                add_op_str(a, out, seen);
            }
        }
        Inst::CallMethod(_, obj, method, args) => {
            add_str(method, out, seen);
            add_op_str(obj, out, seen);
            for a in args {
                add_op_str(a, out, seen);
            }
        }
        Inst::GetField(_, obj, _) => add_op_str(obj, out, seen),
        Inst::SetField(obj, _, val) => {
            add_op_str(obj, out, seen);
            add_op_str(val, out, seen);
        }
        Inst::GetIndex(_, obj, idx) => {
            add_op_str(obj, out, seen);
            add_op_str(idx, out, seen);
        }
        Inst::SetIndex(obj, idx, val) => {
            add_op_str(obj, out, seen);
            add_op_str(idx, out, seen);
            add_op_str(val, out, seen);
        }
        Inst::Branch(cond, _, _) => add_op_str(cond, out, seen),
        Inst::Return(ops) => {
            for op in ops {
                add_op_str(op, out, seen);
            }
        }
        Inst::MakeList(_, els) => {
            for e in els {
                add_op_str(e, out, seen);
            }
        }
        Inst::MakeMap(_, pairs) => {
            for (key, value) in pairs {
                add_op_str(key, out, seen);
                add_op_str(value, out, seen);
            }
        }
        Inst::MakeEntity(_, _, fields) => {
            for (_, value) in fields {
                add_op_str(value, out, seen);
            }
        }
        Inst::MakeClosure(_, _, caps) => {
            for c in caps {
                add_op_str(c, out, seen);
            }
        }
        Inst::CallClosure(_, closure, args) => {
            add_op_str(closure, out, seen);
            for a in args {
                add_op_str(a, out, seen);
            }
        }
        Inst::Phi(_, arms) => {
            for (op, _) in arms {
                add_op_str(op, out, seen);
            }
        }
        _ => {}
    }
}