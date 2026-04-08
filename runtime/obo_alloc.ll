; OBO native codegen (Phase 7)
declare i32 @printf(i8*, ...)
declare i32 @strcmp(i8*, i8*)
declare void @obo_frame_push(i8*, i32)
declare void @obo_frame_pop()
declare void @obo_print_stack_trace()
declare void @obo_install_signal_handlers()
declare i8* @obo_str_concat(i8*, i8*)
declare i8* @obo_str_concat_int(i8*, i64)
declare i8* @obo_i64_to_str(i64)
declare i8* @obo_list_new_i64(i64, i64*)
declare i64 @obo_list_len(i8*)
declare i64 @obo_list_get(i8*, i64)
declare void @obo_list_set_i64(i8*, i64, i64)
declare void @obo_list_print(i8*)
declare i8* @obo_map_new()
declare i64 @obo_map_len(i8*)
declare void @obo_map_put_i64(i8*, i8*, i64)
declare void @obo_map_put_str(i8*, i8*, i8*)
declare void @obo_map_put_f64(i8*, i8*, double)
declare void @obo_map_put_bool(i8*, i8*, i64)
declare void @obo_map_put_null(i8*, i8*)
declare void @obo_map_put_list(i8*, i8*, i8*)
declare void @obo_map_put_map(i8*, i8*, i8*)
declare void @obo_map_put_entity(i8*, i8*, i8*)
declare void @obo_map_put_boxed(i8*, i8*, i8*)
declare i8* @obo_map_get_boxed(i8*, i8*)
declare void @obo_map_print(i8*)
declare i8* @obo_entity_new(i8*)
declare void @obo_entity_put_i64(i8*, i8*, i64)
declare void @obo_entity_put_str(i8*, i8*, i8*)
declare void @obo_entity_put_f64(i8*, i8*, double)
declare void @obo_entity_put_bool(i8*, i8*, i64)
declare void @obo_entity_put_null(i8*, i8*)
declare void @obo_entity_put_list(i8*, i8*, i8*)
declare void @obo_entity_put_map(i8*, i8*, i8*)
declare void @obo_entity_put_entity(i8*, i8*, i8*)
declare void @obo_entity_put_boxed(i8*, i8*, i8*)
declare i8* @obo_entity_get_boxed(i8*, i8*)
declare void @obo_entity_print(i8*)
declare i8* @obo_entity_new_slotted(i8*, i32)
declare void @obo_entity_set_field_name(i8*, i32, i8*)
declare i8* @obo_entity_get_slot(i8*, i32)
declare void @obo_entity_set_slot_i64(i8*, i32, i64)
declare void @obo_entity_set_slot_f64(i8*, i32, double)
declare void @obo_entity_set_slot_str(i8*, i32, i8*)
declare void @obo_entity_set_slot_bool(i8*, i32, i64)
declare void @obo_entity_set_slot_null(i8*, i32)
declare void @obo_entity_set_slot_list(i8*, i32, i8*)
declare void @obo_entity_set_slot_map(i8*, i32, i8*)
declare void @obo_entity_set_slot_entity(i8*, i32, i8*)
declare void @obo_entity_set_slot_boxed(i8*, i32, i8*)
declare i8* @obo_entity_gfs(i8*, i32, i8*)
declare void @obo_entity_sfs_i64(i8*, i32, i8*, i64)
declare void @obo_entity_sfs_f64(i8*, i32, i8*, double)
declare void @obo_entity_sfs_str(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_bool(i8*, i32, i8*, i64)
declare void @obo_entity_sfs_null(i8*, i32, i8*)
declare void @obo_entity_sfs_list(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_map(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_entity(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_boxed(i8*, i32, i8*, i8*)
declare void @obo_value_print(i8*)
declare i8* @obo_set_new(i8*)
declare i8* @obo_set_add(i8*, i64)
declare i8* @obo_set_remove(i8*, i64)
declare i64 @obo_set_has(i8*, i64)
declare i8* @obo_set_union(i8*, i8*)
declare i8* @obo_set_intersect(i8*, i8*)
declare i8* @obo_set_difference(i8*, i8*)
declare i8* @obo_queue_push(i8*, i64)
declare i64 @obo_queue_peek(i8*)
declare i8* @obo_queue_pop(i8*)
declare i8* @obo_stack_push(i8*, i64)
declare i64 @obo_stack_peek(i8*)
declare i8* @obo_stack_pop(i8*)
declare i8* @obo_buffer_new(i64)
declare i64 @obo_buffer_length(i8*)
declare i64 @obo_buffer_get(i8*, i64)
declare i8* @obo_buffer_set(i8*, i64, i64)
declare i8* @obo_buffer_toList(i8*)
declare i8* @obo_textbuilder_new(i64)
declare i8* @obo_textbuilder_append(i8*, i8*)
declare i8* @obo_textbuilder_appendChar(i8*, i64)
declare i8* @obo_textbuilder_appendInt(i8*, i64)
declare i8* @obo_textbuilder_build(i8*)
declare i64 @obo_textbuilder_length(i8*)
declare i8* @obo_textbuilder_clear(i8*)
declare i8* @obo_textbuilder_toString(i8*)
declare i8* @obo_arena_create(i64)
declare i64 @obo_arena_alloc(i8*, i64)
declare i64 @obo_arena_reset(i8*)
declare i64 @obo_arena_destroy(i8*)
declare i64 @obo_arena_used(i8*)
declare i64 @obo_arena_capacity(i8*)
declare i64 @obo_arena_write_i64(i64, i64)
declare i64 @obo_arena_write_f64(i64, double)
declare i64 @obo_arena_read_i64(i64)
declare double @obo_arena_read_f64(i64)
declare i8* @obo_bag_add(i8*, i64)
declare i64 @obo_bag_has(i8*, i64)
declare i8* @obo_bag_remove(i8*, i64)
declare i8* @obo_grid2d_new(i64, i64, i64)
declare i64 @obo_grid2d_rows(i8*)
declare i64 @obo_grid2d_cols(i8*)
declare i64 @obo_grid2d_count(i8*)
declare i64 @obo_grid2d_get(i8*, i64, i64)
declare i8* @obo_grid2d_set(i8*, i64, i64, i64)
declare i8* @obo_grid2d_fill(i8*, i64)
declare i8* @obo_grid2d_row(i8*, i64)
declare i8* @obo_grid2d_col(i8*, i64)
declare i8* @obo_grid2d_toList(i8*)
declare i8* @obo_grid3d_new(i64, i64, i64, i64)
declare i64 @obo_grid3d_x(i8*)
declare i64 @obo_grid3d_y(i8*)
declare i64 @obo_grid3d_z(i8*)
declare i64 @obo_grid3d_count(i8*)
declare i64 @obo_grid3d_get(i8*, i64, i64, i64)
declare i8* @obo_grid3d_set(i8*, i64, i64, i64, i64)
declare i8* @obo_grid3d_fill(i8*, i64)
declare i8* @obo_grid3d_toList(i8*)
declare i8* @obo_assert_fail(i8*)
declare i8* @obo_reflect(i8*)
declare i64 @obo_value_as_i64(i8*)
declare i64 @obo_value_truthy(i8*)
declare i64 @obo_value_len(i8*)
declare i64 @obo_value_empty(i8*)
declare i8* @obo_value_keys(i8*)
declare i8* @obo_value_as_list_ptr(i8*)
declare i8* @obo_value_as_mixed_list_ptr(i8*)
declare i8* @obo_value_as_map_ptr(i8*)
declare i8* @obo_value_as_entity_ptr(i8*)
declare i64 @__sys_Math_abs(i64)
declare i64 @__sys_Math_floor(double)
declare i64 @__sys_Math_ceil(double)
declare i64 @__sys_Math_round(double)
declare i64 @__sys_Math_min(i64, i64)
declare i64 @__sys_Math_max(i64, i64)
declare i64 @__sys_Math_sign(i64)
declare i64 @__sys_Math_maxNumber()
declare i64 @__sys_Math_minNumber()
declare i64 @__sys_Time_now()
declare i64 @__sys_Time_nowSeconds()
declare i64 @__sys_Time_sleep(i64)
declare i8* @__sys_File_read(i8*)
declare i64 @__sys_File_exists(i8*)
declare i64 @__sys_Convert_toNumber(i8*)
declare i8* @__sys_Convert_toText(i64)
declare i64 @obo_native_call_method_i64(i8*, i8*, i64, i64*)
declare i64 @obo_str_truthy(i8*)
declare void @obo_print_bool(i64)
declare void @obo_print_double(double)
declare i8* @obo_prompt(i8*)
declare i8* @obo_f64_to_str(double)
declare i64 @obo_call_indirect_i64(i8*, i64, i64*)
declare double @__sys_Math_pi()
declare double @__sys_Math_e()
declare double @__sys_Math_infinity()
declare double @__sys_Math_sqrt(double)
declare double @__sys_Math_pow(double, double)
declare double @__sys_Math_sin(double)
declare double @__sys_Math_cos(double)
declare double @__sys_Math_tan(double)
declare double @__sys_Math_asin(double)
declare double @__sys_Math_acos(double)
declare double @__sys_Math_atan(double)
declare double @__sys_Math_atan2(double, double)
declare double @__sys_Math_log(double)
declare double @__sys_Math_log10(double)
declare double @__sys_Math_lerp(double, double, double)
declare double @__sys_Math_clamp(double, double, double)
declare double @__sys_Math_random()
declare i64 @__sys_Math_randomInt(i64, i64)
declare i64 @__sys_File_write(i8*, i8*)
declare i64 @__sys_File_append(i8*, i8*)
declare i64 @__sys_File_delete(i8*)
declare i8* @__sys_File_readLines(i8*)
declare double @__sys_Convert_toDecimal(i8*)
declare i64 @__sys_Convert_toFlag(i64)
declare i64 @__sys_Convert_toChar(i64)
declare double @__sys_Time_measure()
declare i64 @__sys_Time_startTimer()
declare i64 @__sys_Time_stopTimer()
declare i64 @__sys_pointer_alloc(i64)
declare i64 @__sys_pointer_free(i64)
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1)
declare i64 @__text_length(i8*)
declare i64 @__text_empty(i8*)
declare i8* @__text_upper(i8*)
declare i8* @__text_lower(i8*)
declare i8* @__text_trim(i8*)
declare i8* @__text_trimStart(i8*)
declare i8* @__text_trimEnd(i8*)
declare i8* @__text_reversed(i8*)
declare i64 @__text_contains(i8*, i8*)
declare i64 @__text_startsWith(i8*, i8*)
declare i64 @__text_endsWith(i8*, i8*)
declare i64 @__text_indexOf(i8*, i8*)
declare i8* @__text_replace(i8*, i8*, i8*)
declare i8* @__text_substring(i8*, i64, i64)
declare i8* @__text_repeat(i8*, i64)
declare i8* @__text_padLeft(i8*, i64, i8*)
declare i8* @__text_padRight(i8*, i64, i8*)
declare i64 @__text_toNumber(i8*)
declare double @__text_toDecimal(i8*)
declare i8* @__text_split(i8*, i8*)
declare i8* @obo_list_add(i8*, i64)
declare i64 @obo_list_first(i8*)
declare i64 @obo_list_last(i8*)
declare i64 @obo_list_empty(i8*)
declare i64 @obo_list_contains(i8*, i64)
declare i64 @obo_list_indexOf(i8*, i64)
declare i8* @obo_list_sort(i8*)
declare i8* @obo_list_reverse(i8*)
declare i8* @obo_list_take(i8*, i64)
declare i8* @obo_list_skip(i8*, i64)
declare i8* @obo_list_slice(i8*, i64, i64)
declare i8* @obo_list_remove(i8*, i64)
declare i8* @obo_list_removeAt(i8*, i64)
declare i8* @obo_list_insert(i8*, i64, i64)
declare i8* @obo_list_join(i8*, i8*)
declare i8* @obo_list_distinct(i8*)
declare i64 @obo_map_empty(i8*)
declare i64 @obo_map_has(i8*, i8*)
declare i8* @obo_map_set(i8*, i8*, i64)
declare i8* @obo_map_remove(i8*, i8*)
declare i8* @obo_map_set_int(i8*, i64, i64)
declare i8* @obo_map_set_int_str(i8*, i64, i8*)
declare i8* @obo_map_set_int_boxed(i8*, i64, i8*)
declare i64 @obo_map_get_int(i8*, i64)
declare i8* @obo_map_get_int_boxed(i8*, i64)
declare i64 @obo_map_has_int(i8*, i64)
declare i8* @obo_map_remove_int(i8*, i64)
declare i64 @obo_type_check(i8*, i8*)
declare void @obo_arena_register(i8*)
declare void @obo_arena_free_all()
declare void @obo_gc_push_root(i8**)
declare void @obo_gc_pop_roots(i64)
declare void @obo_gc_collect()
declare void @obo_gc_pause()
declare void @obo_gc_resume()
declare i8* @obo_closure_new(i8*, i64)
declare void @obo_closure_set_capture(i8*, i64, i64)
declare i64 @obo_closure_get_capture(i8*, i64)
declare i64 @obo_closure_call_0(i8*)
declare i64 @obo_closure_call_1(i8*, i64)
declare i64 @obo_closure_call_2(i8*, i64, i64)
declare i64 @obo_closure_call_3(i8*, i64, i64, i64)
declare i8* @obo_event_listen(i8*, i8*, i8*)
declare i8* @obo_event_emit(i8*, i8*, i8*)
declare i8* @obo_task_spawn(i8*)
declare void @obo_task_wait(i8*)
declare void @obo_task_wait_all()
declare i8* @obo_channel_create()
declare void @obo_channel_send(i8*, i64)
declare i64 @obo_channel_receive(i8*)
declare i8* @obo_atomic_create(i64)
declare i64 @obo_atomic_load(i8*)
declare void @obo_atomic_store(i8*, i64)
declare i64 @obo_atomic_add(i8*, i64)
declare i64 @obo_atomic_sub(i8*, i64)
declare i8* @obo_possible_push()
declare i64 @obo_possible_pop()
declare void @obo_throw(i8*)
declare i8* @obo_possible_get_error()
declare i64 @obo_safe_div(i64, i64)
declare i64 @obo_safe_mod(i64, i64)
declare i8* @obo_range(i64, i64, i64)
declare i32 @_setjmp(i8*) #0
declare i8* @malloc(i64)
declare i8* @obo_list_filter(i8*, i8*)
declare i8* @obo_list_map(i8*, i8*)
declare i64 @obo_list_reduce(i8*, i64, i8*)
declare i64 @obo_list_any(i8*, i8*)
declare i64 @obo_list_all(i8*, i8*)
declare i8* @obo_mixed_list_new(i64)
declare void @obo_mixed_list_set(i8*, i64, i8*)
declare i8* @obo_mixed_list_get(i8*, i64)
declare i64 @obo_mixed_list_len(i8*)
declare void @obo_mixed_list_print(i8*)
declare i8* @obo_mixed_list_filter(i8*, i8*)
declare i8* @obo_mixed_list_map(i8*, i8*)
declare void @obo_mixed_list_each(i8*, i8*)
declare i8* @obo_mixed_list_add(i8*, i8*)
declare i8* @obo_mixed_list_removeAt(i8*, i64)
declare i8* @obo_mixed_list_join(i8*, i8*)
declare i64 @obo_mixed_list_contains(i8*, i8*)
declare i8* @obo_mixed_list_reduce(i8*, i8*, i8*)
declare i64 @obo_mixed_list_any(i8*, i8*)
declare i64 @obo_mixed_list_all(i8*, i8*)
declare i8* @obo_box_i64(i64)
declare i8* @obo_box_f64(double)
declare i8* @obo_box_str(i8*)
declare i8* @obo_box_bool(i64)
declare i8* @obo_box_null()
declare i8* @obo_box_list(i8*)
declare i8* @obo_box_map(i8*)
declare i8* @obo_box_entity(i8*)
declare double @obo_value_as_f64(i8*)
declare i8* @obo_value_as_str(i8*)
declare i64 @obo_value_compare(i8*, i8*)
declare i8* @obo_dyn_arith(i8*, i8*, i32)
declare i64 @obo_value_to_closure_arg_boxed(i8*)
declare i8* @obo_value_to_str(i8*)
declare i8* @obo_format_list_string(i8*)
declare i8* @obo_format_map_string(i8*)
declare i8* @obo_format_entity_string(i8*)
declare void @obo_event_loop_run(i8*, i8*, i8*, i64)
declare void @obo_event_loop_stop()

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }


define void @obo_heap_init(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %var_heap_ptr = alloca i64
  %var_payload_size_ptr = alloca i64
  %var_header_val_ptr = alloca i64
  %var_size_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_heap_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_size_ptr
  %t2 = load i64, i64* %var_size_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = sub i64 %t3, 16
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  store i64 %t5, i64* %var_payload_size_ptr
  %t6 = load i64, i64* %var_payload_size_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = mul i64 %t7, 2
  store i64 %t8, i64* %reg_5_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = or i64 %t9, 1
  store i64 %t10, i64* %reg_6_ptr
  %t11 = load i64, i64* %reg_6_ptr
  store i64 %t11, i64* %var_header_val_ptr
  %t12 = load i64, i64* %var_heap_ptr
  store i64 %t12, i64* %reg_7_ptr
  %t13 = load i64, i64* %reg_7_ptr
  %t14 = add i64 %t13, 8
  store i64 %t14, i64* %reg_8_ptr
  %t15 = load i64, i64* %var_header_val_ptr
  store i64 %t15, i64* %reg_9_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = load i64, i64* %reg_9_ptr
  %t18 = inttoptr i64 %t16 to i64*
  store i64 %t17, i64* %t18
  store i64 0, i64* %reg_10_ptr
  %t19 = load i64, i64* %var_heap_ptr
  store i64 %t19, i64* %reg_11_ptr
  %t20 = load i64, i64* %reg_11_ptr
  %t21 = add i64 %t20, 16
  store i64 %t21, i64* %reg_12_ptr
  %t22 = load i64, i64* %reg_12_ptr
  %t23 = inttoptr i64 %t22 to i64*
  store i64 0, i64* %t23
  store i64 0, i64* %reg_13_ptr
  %t24 = load i64, i64* %var_heap_ptr
  store i64 %t24, i64* %reg_14_ptr
  %t25 = load i64, i64* %var_heap_ptr
  store i64 %t25, i64* %reg_15_ptr
  %t26 = load i64, i64* %reg_15_ptr
  %t27 = add i64 %t26, 16
  store i64 %t27, i64* %reg_16_ptr
  %t28 = load i64, i64* %reg_14_ptr
  %t29 = load i64, i64* %reg_16_ptr
  %t30 = inttoptr i64 %t28 to i64*
  store i64 %t29, i64* %t30
  store i64 0, i64* %reg_17_ptr
  ret void
}

define i64 @obo_heap_alloc(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i64
  %reg_43_ptr = alloca i64
  %reg_44_ptr = alloca i64
  %reg_45_ptr = alloca i64
  %reg_46_ptr = alloca i64
  %reg_47_ptr = alloca i64
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca i64
  %reg_51_ptr = alloca i64
  %reg_52_ptr = alloca i64
  %reg_53_ptr = alloca i64
  %reg_54_ptr = alloca i64
  %reg_55_ptr = alloca i64
  %reg_56_ptr = alloca i64
  %reg_57_ptr = alloca i64
  %reg_58_ptr = alloca i64
  %reg_59_ptr = alloca i64
  %reg_60_ptr = alloca i64
  %reg_61_ptr = alloca i64
  %reg_62_ptr = alloca i64
  %reg_63_ptr = alloca i64
  %reg_64_ptr = alloca i64
  %reg_65_ptr = alloca i64
  %reg_66_ptr = alloca i64
  %reg_67_ptr = alloca i64
  %reg_68_ptr = alloca i64
  %reg_69_ptr = alloca i64
  %reg_70_ptr = alloca i64
  %reg_71_ptr = alloca i64
  %var_new_payload_ptr = alloca i64
  %var_remaining_ptr = alloca i64
  %var_new_hdr_addr_ptr = alloca i64
  %var_req_size_ptr = alloca i64
  %var_rem_ptr = alloca i64
  %var_prev_link_ptr = alloca i64
  %var_hdr_val_ptr = alloca i64
  %var_next_free_ptr = alloca i64
  %var_block_size_ptr = alloca i64
  %var_new_hdr_ptr = alloca i64
  %var_heap_ptr = alloca i64
  %var_hdr_addr_ptr = alloca i64
  %var_size_ptr = alloca i64
  %var_curr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_heap_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_req_size_ptr
  %t2 = load i64, i64* %var_req_size_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  store i64 %t3, i64* %var_size_ptr
  %t4 = load i64, i64* %var_size_ptr
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp slt i64 %t5, 8
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %obo_heap_alloc_b1, label %obo_heap_alloc_b2
obo_heap_alloc_b1:
  store i64 8, i64* %var_size_ptr
  br label %obo_heap_alloc_b3
obo_heap_alloc_b2:
  br label %obo_heap_alloc_b3
obo_heap_alloc_b3:
  %t12 = load i64, i64* %var_size_ptr
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  %t14 = and i64 %t13, 7
  store i64 %t14, i64* %reg_6_ptr
  %t15 = load i64, i64* %reg_6_ptr
  store i64 %t15, i64* %var_rem_ptr
  %t16 = load i64, i64* %var_rem_ptr
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i64, i64* %reg_7_ptr
  %t18 = icmp ne i64 %t17, 0
  %t19 = zext i1 %t18 to i64
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t22 = icmp ne i64 %t20, 0
  %t23 = zext i1 %t22 to i64
  %t21 = icmp ne i64 %t23, 0
  br i1 %t21, label %obo_heap_alloc_b4, label %obo_heap_alloc_b5
obo_heap_alloc_b4:
  %t24 = load i64, i64* %var_size_ptr
  store i64 %t24, i64* %reg_9_ptr
  %t25 = load i64, i64* %var_rem_ptr
  store i64 %t25, i64* %reg_10_ptr
  %t26 = load i64, i64* %reg_10_ptr
  %t27 = sub i64 8, %t26
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_9_ptr
  %t29 = load i64, i64* %reg_11_ptr
  %t30 = add i64 %t28, %t29
  store i64 %t30, i64* %reg_12_ptr
  %t31 = load i64, i64* %reg_12_ptr
  store i64 %t31, i64* %var_size_ptr
  br label %obo_heap_alloc_b6
obo_heap_alloc_b5:
  br label %obo_heap_alloc_b6
obo_heap_alloc_b6:
  %t32 = load i64, i64* %var_heap_ptr
  store i64 %t32, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_13_ptr
  store i64 %t33, i64* %var_prev_link_ptr
  %t34 = load i64, i64* %var_heap_ptr
  store i64 %t34, i64* %reg_14_ptr
  %t35 = load i64, i64* %reg_14_ptr
  %t36 = inttoptr i64 %t35 to i64*
  %t37 = load i64, i64* %t36
  store i64 %t37, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_15_ptr
  store i64 %t38, i64* %var_curr_ptr
  br label %obo_heap_alloc_b7
obo_heap_alloc_b7:
  %t39 = load i64, i64* %var_curr_ptr
  store i64 %t39, i64* %reg_16_ptr
  %t40 = load i64, i64* %reg_16_ptr
  %t41 = icmp eq i64 %t40, 0
  %t42 = zext i1 %t41 to i64
  store i64 %t42, i64* %reg_17_ptr
  %t43 = load i64, i64* %reg_17_ptr
  %t45 = icmp ne i64 %t43, 0
  %t46 = zext i1 %t45 to i64
  %t44 = icmp ne i64 %t46, 0
  br i1 %t44, label %obo_heap_alloc_b9, label %obo_heap_alloc_b10
obo_heap_alloc_b8:
  ret i64 0
obo_heap_alloc_b9:
  ret i64 0
obo_heap_alloc_b10:
  br label %obo_heap_alloc_b11
obo_heap_alloc_b11:
  %t47 = load i64, i64* %var_curr_ptr
  store i64 %t47, i64* %reg_18_ptr
  %t48 = load i64, i64* %reg_18_ptr
  %t49 = sub i64 %t48, 8
  store i64 %t49, i64* %reg_19_ptr
  %t50 = load i64, i64* %reg_19_ptr
  store i64 %t50, i64* %var_hdr_addr_ptr
  %t51 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t51, i64* %reg_20_ptr
  %t52 = load i64, i64* %reg_20_ptr
  %t53 = inttoptr i64 %t52 to i64*
  %t54 = load i64, i64* %t53
  store i64 %t54, i64* %reg_21_ptr
  %t55 = load i64, i64* %reg_21_ptr
  store i64 %t55, i64* %var_hdr_val_ptr
  %t56 = load i64, i64* %var_hdr_val_ptr
  store i64 %t56, i64* %reg_22_ptr
  %t57 = load i64, i64* %reg_22_ptr
  %t58 = ashr i64 %t57, 1
  store i64 %t58, i64* %reg_23_ptr
  %t59 = load i64, i64* %reg_23_ptr
  store i64 %t59, i64* %var_block_size_ptr
  %t60 = load i64, i64* %var_block_size_ptr
  store i64 %t60, i64* %reg_24_ptr
  %t61 = load i64, i64* %var_size_ptr
  store i64 %t61, i64* %reg_25_ptr
  %t62 = load i64, i64* %reg_24_ptr
  %t63 = load i64, i64* %reg_25_ptr
  %t64 = icmp sge i64 %t62, %t63
  %t65 = zext i1 %t64 to i64
  store i64 %t65, i64* %reg_26_ptr
  %t66 = load i64, i64* %reg_26_ptr
  %t68 = icmp ne i64 %t66, 0
  %t69 = zext i1 %t68 to i64
  %t67 = icmp ne i64 %t69, 0
  br i1 %t67, label %obo_heap_alloc_b12, label %obo_heap_alloc_b13
obo_heap_alloc_b12:
  %t70 = load i64, i64* %var_block_size_ptr
  store i64 %t70, i64* %reg_27_ptr
  %t71 = load i64, i64* %var_size_ptr
  store i64 %t71, i64* %reg_28_ptr
  %t72 = load i64, i64* %reg_28_ptr
  %t73 = add i64 %t72, 16
  store i64 %t73, i64* %reg_29_ptr
  %t74 = load i64, i64* %reg_27_ptr
  %t75 = load i64, i64* %reg_29_ptr
  %t76 = icmp sge i64 %t74, %t75
  %t77 = zext i1 %t76 to i64
  store i64 %t77, i64* %reg_30_ptr
  %t78 = load i64, i64* %reg_30_ptr
  %t80 = icmp ne i64 %t78, 0
  %t81 = zext i1 %t80 to i64
  %t79 = icmp ne i64 %t81, 0
  br i1 %t79, label %obo_heap_alloc_b15, label %obo_heap_alloc_b16
obo_heap_alloc_b13:
  br label %obo_heap_alloc_b14
obo_heap_alloc_b14:
  %t82 = load i64, i64* %var_curr_ptr
  store i64 %t82, i64* %reg_69_ptr
  %t83 = load i64, i64* %reg_69_ptr
  store i64 %t83, i64* %var_prev_link_ptr
  %t84 = load i64, i64* %var_curr_ptr
  store i64 %t84, i64* %reg_70_ptr
  %t85 = load i64, i64* %reg_70_ptr
  %t86 = inttoptr i64 %t85 to i64*
  %t87 = load i64, i64* %t86
  store i64 %t87, i64* %reg_71_ptr
  %t88 = load i64, i64* %reg_71_ptr
  store i64 %t88, i64* %var_curr_ptr
  br label %obo_heap_alloc_b7
obo_heap_alloc_b15:
  %t89 = load i64, i64* %var_curr_ptr
  store i64 %t89, i64* %reg_31_ptr
  %t90 = load i64, i64* %var_size_ptr
  store i64 %t90, i64* %reg_32_ptr
  %t91 = load i64, i64* %reg_31_ptr
  %t92 = load i64, i64* %reg_32_ptr
  %t93 = add i64 %t91, %t92
  store i64 %t93, i64* %reg_33_ptr
  %t94 = load i64, i64* %reg_33_ptr
  store i64 %t94, i64* %var_new_hdr_addr_ptr
  %t95 = load i64, i64* %var_new_hdr_addr_ptr
  store i64 %t95, i64* %reg_34_ptr
  %t96 = load i64, i64* %reg_34_ptr
  %t97 = add i64 %t96, 8
  store i64 %t97, i64* %reg_35_ptr
  %t98 = load i64, i64* %reg_35_ptr
  store i64 %t98, i64* %var_new_payload_ptr
  %t99 = load i64, i64* %var_block_size_ptr
  store i64 %t99, i64* %reg_36_ptr
  %t100 = load i64, i64* %var_size_ptr
  store i64 %t100, i64* %reg_37_ptr
  %t101 = load i64, i64* %reg_36_ptr
  %t102 = load i64, i64* %reg_37_ptr
  %t103 = sub i64 %t101, %t102
  store i64 %t103, i64* %reg_38_ptr
  %t104 = load i64, i64* %reg_38_ptr
  %t105 = sub i64 %t104, 8
  store i64 %t105, i64* %reg_39_ptr
  %t106 = load i64, i64* %reg_39_ptr
  store i64 %t106, i64* %var_remaining_ptr
  %t107 = load i64, i64* %var_remaining_ptr
  store i64 %t107, i64* %reg_40_ptr
  %t108 = load i64, i64* %reg_40_ptr
  %t109 = mul i64 %t108, 2
  store i64 %t109, i64* %reg_41_ptr
  %t110 = load i64, i64* %reg_41_ptr
  %t111 = or i64 %t110, 1
  store i64 %t111, i64* %reg_42_ptr
  %t112 = load i64, i64* %reg_42_ptr
  store i64 %t112, i64* %var_new_hdr_ptr
  %t113 = load i64, i64* %var_new_hdr_addr_ptr
  store i64 %t113, i64* %reg_43_ptr
  %t114 = load i64, i64* %var_new_hdr_ptr
  store i64 %t114, i64* %reg_44_ptr
  %t115 = load i64, i64* %reg_43_ptr
  %t116 = load i64, i64* %reg_44_ptr
  %t117 = inttoptr i64 %t115 to i64*
  store i64 %t116, i64* %t117
  store i64 0, i64* %reg_45_ptr
  %t118 = load i64, i64* %var_curr_ptr
  store i64 %t118, i64* %reg_46_ptr
  %t119 = load i64, i64* %reg_46_ptr
  %t120 = inttoptr i64 %t119 to i64*
  %t121 = load i64, i64* %t120
  store i64 %t121, i64* %reg_47_ptr
  %t122 = load i64, i64* %reg_47_ptr
  store i64 %t122, i64* %var_next_free_ptr
  %t123 = load i64, i64* %var_new_payload_ptr
  store i64 %t123, i64* %reg_48_ptr
  %t124 = load i64, i64* %var_next_free_ptr
  store i64 %t124, i64* %reg_49_ptr
  %t125 = load i64, i64* %reg_48_ptr
  %t126 = load i64, i64* %reg_49_ptr
  %t127 = inttoptr i64 %t125 to i64*
  store i64 %t126, i64* %t127
  store i64 0, i64* %reg_50_ptr
  %t128 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t128, i64* %reg_51_ptr
  %t129 = load i64, i64* %var_size_ptr
  store i64 %t129, i64* %reg_52_ptr
  %t130 = load i64, i64* %reg_52_ptr
  %t131 = mul i64 %t130, 2
  store i64 %t131, i64* %reg_53_ptr
  %t132 = load i64, i64* %reg_51_ptr
  %t133 = load i64, i64* %reg_53_ptr
  %t134 = inttoptr i64 %t132 to i64*
  store i64 %t133, i64* %t134
  store i64 0, i64* %reg_54_ptr
  %t135 = load i64, i64* %var_prev_link_ptr
  store i64 %t135, i64* %reg_55_ptr
  %t136 = load i64, i64* %var_new_payload_ptr
  store i64 %t136, i64* %reg_56_ptr
  %t137 = load i64, i64* %reg_55_ptr
  %t138 = load i64, i64* %reg_56_ptr
  %t139 = inttoptr i64 %t137 to i64*
  store i64 %t138, i64* %t139
  store i64 0, i64* %reg_57_ptr
  %t140 = load i64, i64* %var_curr_ptr
  store i64 %t140, i64* %reg_58_ptr
  %t141 = load i64, i64* %reg_58_ptr
  ret i64 %t141
obo_heap_alloc_b16:
  br label %obo_heap_alloc_b17
obo_heap_alloc_b17:
  %t142 = load i64, i64* %var_curr_ptr
  store i64 %t142, i64* %reg_59_ptr
  %t143 = load i64, i64* %reg_59_ptr
  %t144 = inttoptr i64 %t143 to i64*
  %t145 = load i64, i64* %t144
  store i64 %t145, i64* %reg_60_ptr
  %t146 = load i64, i64* %reg_60_ptr
  store i64 %t146, i64* %var_next_free_ptr
  %t147 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t147, i64* %reg_61_ptr
  %t148 = load i64, i64* %var_block_size_ptr
  store i64 %t148, i64* %reg_62_ptr
  %t149 = load i64, i64* %reg_62_ptr
  %t150 = mul i64 %t149, 2
  store i64 %t150, i64* %reg_63_ptr
  %t151 = load i64, i64* %reg_61_ptr
  %t152 = load i64, i64* %reg_63_ptr
  %t153 = inttoptr i64 %t151 to i64*
  store i64 %t152, i64* %t153
  store i64 0, i64* %reg_64_ptr
  %t154 = load i64, i64* %var_prev_link_ptr
  store i64 %t154, i64* %reg_65_ptr
  %t155 = load i64, i64* %var_next_free_ptr
  store i64 %t155, i64* %reg_66_ptr
  %t156 = load i64, i64* %reg_65_ptr
  %t157 = load i64, i64* %reg_66_ptr
  %t158 = inttoptr i64 %t156 to i64*
  store i64 %t157, i64* %t158
  store i64 0, i64* %reg_67_ptr
  %t159 = load i64, i64* %var_curr_ptr
  store i64 %t159, i64* %reg_68_ptr
  %t160 = load i64, i64* %reg_68_ptr
  ret i64 %t160
}

define void @obo_heap_free(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  %var_block_size_ptr = alloca i64
  %var_heap_ptr = alloca i64
  %var_hdr_addr_ptr = alloca i64
  %var_old_head_ptr = alloca i64
  %var_hdr_val_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_heap_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %var_ptr_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %obo_heap_free_b1, label %obo_heap_free_b2
obo_heap_free_b1:
  ret void
obo_heap_free_b2:
  br label %obo_heap_free_b3
obo_heap_free_b3:
  %t10 = load i64, i64* %var_ptr_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  %t12 = sub i64 %t11, 8
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  store i64 %t13, i64* %var_hdr_addr_ptr
  %t14 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t14, i64* %reg_6_ptr
  %t15 = load i64, i64* %reg_6_ptr
  %t16 = inttoptr i64 %t15 to i64*
  %t17 = load i64, i64* %t16
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  store i64 %t18, i64* %var_hdr_val_ptr
  %t19 = load i64, i64* %var_hdr_val_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = ashr i64 %t20, 1
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  store i64 %t22, i64* %var_block_size_ptr
  %t23 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %var_block_size_ptr
  store i64 %t24, i64* %reg_11_ptr
  %t25 = load i64, i64* %reg_11_ptr
  %t26 = mul i64 %t25, 2
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t28 = or i64 %t27, 1
  store i64 %t28, i64* %reg_13_ptr
  %t29 = load i64, i64* %reg_10_ptr
  %t30 = load i64, i64* %reg_13_ptr
  %t31 = inttoptr i64 %t29 to i64*
  store i64 %t30, i64* %t31
  store i64 0, i64* %reg_14_ptr
  %t32 = load i64, i64* %var_heap_ptr
  store i64 %t32, i64* %reg_15_ptr
  %t33 = load i64, i64* %reg_15_ptr
  %t34 = inttoptr i64 %t33 to i64*
  %t35 = load i64, i64* %t34
  store i64 %t35, i64* %reg_16_ptr
  %t36 = load i64, i64* %reg_16_ptr
  store i64 %t36, i64* %var_old_head_ptr
  %t37 = load i64, i64* %var_ptr_ptr
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i64, i64* %var_old_head_ptr
  store i64 %t38, i64* %reg_18_ptr
  %t39 = load i64, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_18_ptr
  %t41 = inttoptr i64 %t39 to i64*
  store i64 %t40, i64* %t41
  store i64 0, i64* %reg_19_ptr
  %t42 = load i64, i64* %var_heap_ptr
  store i64 %t42, i64* %reg_20_ptr
  %t43 = load i64, i64* %var_ptr_ptr
  store i64 %t43, i64* %reg_21_ptr
  %t44 = load i64, i64* %reg_20_ptr
  %t45 = load i64, i64* %reg_21_ptr
  %t46 = inttoptr i64 %t44 to i64*
  store i64 %t45, i64* %t46
  store i64 0, i64* %reg_22_ptr
  ret void
}

define i64 @obo_heap_realloc(i64 %arg0, i64 %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %var_new_size_ptr = alloca i64
  %var_new_ptr_ptr = alloca i64
  %var_heap_ptr = alloca i64
  %var_old_size_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_word_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  %var_hdr_val_ptr = alloca i64
  %var_hdr_addr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_heap_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_new_size_ptr
  %t3 = load i64, i64* %var_ptr_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_3_ptr
  %t5 = icmp eq i64 %t4, 0
  %t6 = zext i1 %t5 to i64
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t9 = icmp ne i64 %t7, 0
  %t10 = zext i1 %t9 to i64
  %t8 = icmp ne i64 %t10, 0
  br i1 %t8, label %obo_heap_realloc_b1, label %obo_heap_realloc_b2
obo_heap_realloc_b1:
  %t11 = load i64, i64* %var_heap_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %var_new_size_ptr
  store i64 %t12, i64* %reg_6_ptr
  %t13 = load i64, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_6_ptr
  %t15 = tail call i64 @obo_heap_alloc(i64 %t13, i64 %t14)
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_7_ptr
  ret i64 %t16
obo_heap_realloc_b2:
  br label %obo_heap_realloc_b3
obo_heap_realloc_b3:
  %t17 = load i64, i64* %var_ptr_ptr
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  %t19 = sub i64 %t18, 8
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_9_ptr
  store i64 %t20, i64* %var_hdr_addr_ptr
  %t21 = load i64, i64* %var_hdr_addr_ptr
  store i64 %t21, i64* %reg_10_ptr
  %t22 = load i64, i64* %reg_10_ptr
  %t23 = inttoptr i64 %t22 to i64*
  %t24 = load i64, i64* %t23
  store i64 %t24, i64* %reg_11_ptr
  %t25 = load i64, i64* %reg_11_ptr
  store i64 %t25, i64* %var_hdr_val_ptr
  %t26 = load i64, i64* %var_hdr_val_ptr
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t28 = ashr i64 %t27, 1
  store i64 %t28, i64* %reg_13_ptr
  %t29 = load i64, i64* %reg_13_ptr
  store i64 %t29, i64* %var_old_size_ptr
  %t30 = load i64, i64* %var_new_size_ptr
  store i64 %t30, i64* %reg_14_ptr
  %t31 = load i64, i64* %var_old_size_ptr
  store i64 %t31, i64* %reg_15_ptr
  %t32 = load i64, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_15_ptr
  %t34 = icmp sle i64 %t32, %t33
  %t35 = zext i1 %t34 to i64
  store i64 %t35, i64* %reg_16_ptr
  %t36 = load i64, i64* %reg_16_ptr
  %t38 = icmp ne i64 %t36, 0
  %t39 = zext i1 %t38 to i64
  %t37 = icmp ne i64 %t39, 0
  br i1 %t37, label %obo_heap_realloc_b4, label %obo_heap_realloc_b5
obo_heap_realloc_b4:
  %t40 = load i64, i64* %var_ptr_ptr
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i64, i64* %reg_17_ptr
  ret i64 %t41
obo_heap_realloc_b5:
  br label %obo_heap_realloc_b6
obo_heap_realloc_b6:
  %t42 = load i64, i64* %var_heap_ptr
  store i64 %t42, i64* %reg_18_ptr
  %t43 = load i64, i64* %var_new_size_ptr
  store i64 %t43, i64* %reg_19_ptr
  %t44 = load i64, i64* %reg_18_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t46 = call i64 @obo_heap_alloc(i64 %t44, i64 %t45)
  store i64 %t46, i64* %reg_20_ptr
  %t47 = load i64, i64* %reg_20_ptr
  store i64 %t47, i64* %var_new_ptr_ptr
  %t48 = load i64, i64* %var_new_ptr_ptr
  store i64 %t48, i64* %reg_21_ptr
  %t49 = load i64, i64* %reg_21_ptr
  %t50 = icmp eq i64 %t49, 0
  %t51 = zext i1 %t50 to i64
  store i64 %t51, i64* %reg_22_ptr
  %t52 = load i64, i64* %reg_22_ptr
  %t54 = icmp ne i64 %t52, 0
  %t55 = zext i1 %t54 to i64
  %t53 = icmp ne i64 %t55, 0
  br i1 %t53, label %obo_heap_realloc_b7, label %obo_heap_realloc_b8
obo_heap_realloc_b7:
  ret i64 0
obo_heap_realloc_b8:
  br label %obo_heap_realloc_b9
obo_heap_realloc_b9:
  store i64 0, i64* %var_i_ptr
  br label %obo_heap_realloc_b10
obo_heap_realloc_b10:
  %t56 = load i64, i64* %var_i_ptr
  store i64 %t56, i64* %reg_23_ptr
  %t57 = load i64, i64* %var_old_size_ptr
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i64, i64* %reg_23_ptr
  %t59 = load i64, i64* %reg_24_ptr
  %t60 = icmp sge i64 %t58, %t59
  %t61 = zext i1 %t60 to i64
  store i64 %t61, i64* %reg_25_ptr
  %t62 = load i64, i64* %reg_25_ptr
  %t64 = icmp ne i64 %t62, 0
  %t65 = zext i1 %t64 to i64
  %t63 = icmp ne i64 %t65, 0
  br i1 %t63, label %obo_heap_realloc_b12, label %obo_heap_realloc_b13
obo_heap_realloc_b11:
  %t66 = load i64, i64* %var_heap_ptr
  store i64 %t66, i64* %reg_37_ptr
  %t67 = load i64, i64* %var_ptr_ptr
  store i64 %t67, i64* %reg_38_ptr
  %t68 = load i64, i64* %reg_37_ptr
  %t69 = load i64, i64* %reg_38_ptr
  %t70 = call i64 @obo_heap_free(i64 %t68, i64 %t69)
  store i64 %t70, i64* %reg_39_ptr
  %t71 = load i64, i64* %var_new_ptr_ptr
  store i64 %t71, i64* %reg_40_ptr
  %t72 = load i64, i64* %reg_40_ptr
  ret i64 %t72
obo_heap_realloc_b12:
  br label %obo_heap_realloc_b11
obo_heap_realloc_b13:
  br label %obo_heap_realloc_b14
obo_heap_realloc_b14:
  %t73 = load i64, i64* %var_ptr_ptr
  store i64 %t73, i64* %reg_26_ptr
  %t74 = load i64, i64* %var_i_ptr
  store i64 %t74, i64* %reg_27_ptr
  %t75 = load i64, i64* %reg_26_ptr
  %t76 = load i64, i64* %reg_27_ptr
  %t77 = add i64 %t75, %t76
  store i64 %t77, i64* %reg_28_ptr
  %t78 = load i64, i64* %reg_28_ptr
  %t79 = inttoptr i64 %t78 to i64*
  %t80 = load i64, i64* %t79
  store i64 %t80, i64* %reg_29_ptr
  %t81 = load i64, i64* %reg_29_ptr
  store i64 %t81, i64* %var_word_ptr
  %t82 = load i64, i64* %var_new_ptr_ptr
  store i64 %t82, i64* %reg_30_ptr
  %t83 = load i64, i64* %var_i_ptr
  store i64 %t83, i64* %reg_31_ptr
  %t84 = load i64, i64* %reg_30_ptr
  %t85 = load i64, i64* %reg_31_ptr
  %t86 = add i64 %t84, %t85
  store i64 %t86, i64* %reg_32_ptr
  %t87 = load i64, i64* %var_word_ptr
  store i64 %t87, i64* %reg_33_ptr
  %t88 = load i64, i64* %reg_32_ptr
  %t89 = load i64, i64* %reg_33_ptr
  %t90 = inttoptr i64 %t88 to i64*
  store i64 %t89, i64* %t90
  store i64 0, i64* %reg_34_ptr
  %t91 = load i64, i64* %var_i_ptr
  store i64 %t91, i64* %reg_35_ptr
  %t92 = load i64, i64* %reg_35_ptr
  %t93 = add i64 %t92, 8
  store i64 %t93, i64* %reg_36_ptr
  %t94 = load i64, i64* %reg_36_ptr
  store i64 %t94, i64* %var_i_ptr
  br label %obo_heap_realloc_b10
}

