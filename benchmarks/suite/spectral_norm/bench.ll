; OBO native codegen (Phase 7)
declare i32 @printf(i8*, ...) nounwind
declare i32 @strcmp(i8*, i8*) nounwind readonly
declare void @obo_frame_push(i8*, i32) nounwind
declare void @obo_frame_pop() nounwind
declare void @obo_print_stack_trace() nounwind
declare void @obo_install_signal_handlers() nounwind
declare i8* @obo_str_concat(i8*, i8*) nounwind
declare i8* @obo_str_concat_int(i8*, i64) nounwind
declare i8* @obo_i64_to_str(i64) nounwind
declare i8* @obo_list_new_i64(i64, i64*) nounwind
declare i64 @obo_list_len(i8*) nounwind readonly
declare i64 @obo_list_get(i8*, i64) nounwind readonly
declare void @obo_list_set_i64(i8*, i64, i64) nounwind
declare void @obo_list_print(i8*) nounwind
declare i8* @obo_map_new() nounwind
declare i64 @obo_map_len(i8*) nounwind readonly
declare void @obo_map_put_i64(i8*, i8*, i64) nounwind
declare void @obo_map_put_str(i8*, i8*, i8*) nounwind
declare void @obo_map_put_f64(i8*, i8*, double) nounwind
declare void @obo_map_put_bool(i8*, i8*, i64) nounwind
declare void @obo_map_put_null(i8*, i8*) nounwind
declare void @obo_map_put_list(i8*, i8*, i8*) nounwind
declare void @obo_map_put_map(i8*, i8*, i8*) nounwind
declare void @obo_map_put_entity(i8*, i8*, i8*) nounwind
declare void @obo_map_put_boxed(i8*, i8*, i8*) nounwind
declare i8* @obo_map_get_boxed(i8*, i8*) nounwind readonly
declare void @obo_map_print(i8*) nounwind
declare i8* @obo_entity_new(i8*) nounwind
declare void @obo_entity_put_i64(i8*, i8*, i64) nounwind
declare void @obo_entity_put_str(i8*, i8*, i8*) nounwind
declare void @obo_entity_put_f64(i8*, i8*, double) nounwind
declare void @obo_entity_put_bool(i8*, i8*, i64) nounwind
declare void @obo_entity_put_null(i8*, i8*) nounwind
declare void @obo_entity_put_list(i8*, i8*, i8*) nounwind
declare void @obo_entity_put_map(i8*, i8*, i8*) nounwind
declare void @obo_entity_put_entity(i8*, i8*, i8*) nounwind
declare void @obo_entity_put_boxed(i8*, i8*, i8*) nounwind
declare i8* @obo_entity_get_boxed(i8*, i8*) nounwind readonly
declare void @obo_entity_print(i8*) nounwind
declare i8* @obo_entity_new_slotted(i8*, i32) nounwind
declare void @obo_entity_set_field_name(i8*, i32, i8*) nounwind
declare i8* @obo_entity_get_slot(i8*, i32) nounwind readonly
declare void @obo_entity_set_slot_i64(i8*, i32, i64) nounwind
declare void @obo_entity_set_slot_f64(i8*, i32, double) nounwind
declare void @obo_entity_set_slot_str(i8*, i32, i8*) nounwind
declare void @obo_entity_set_slot_bool(i8*, i32, i64) nounwind
declare void @obo_entity_set_slot_null(i8*, i32) nounwind
declare void @obo_entity_set_slot_list(i8*, i32, i8*) nounwind
declare void @obo_entity_set_slot_map(i8*, i32, i8*) nounwind
declare void @obo_entity_set_slot_entity(i8*, i32, i8*) nounwind
declare void @obo_entity_set_slot_boxed(i8*, i32, i8*) nounwind
declare i8* @obo_entity_gfs(i8*, i32, i8*) nounwind readonly
declare void @obo_entity_sfs_i64(i8*, i32, i8*, i64) nounwind
declare void @obo_entity_sfs_f64(i8*, i32, i8*, double) nounwind
declare void @obo_entity_sfs_str(i8*, i32, i8*, i8*) nounwind
declare void @obo_entity_sfs_bool(i8*, i32, i8*, i64) nounwind
declare void @obo_entity_sfs_null(i8*, i32, i8*) nounwind
declare void @obo_entity_sfs_list(i8*, i32, i8*, i8*) nounwind
declare void @obo_entity_sfs_map(i8*, i32, i8*, i8*) nounwind
declare void @obo_entity_sfs_entity(i8*, i32, i8*, i8*) nounwind
declare void @obo_entity_sfs_boxed(i8*, i32, i8*, i8*) nounwind
declare void @obo_value_print(i8*) nounwind
declare i8* @obo_set_new(i8*) nounwind
declare i8* @obo_set_add(i8*, i64) nounwind
declare i8* @obo_set_remove(i8*, i64) nounwind
declare i64 @obo_set_has(i8*, i64) nounwind readonly
declare i8* @obo_set_union(i8*, i8*) nounwind
declare i8* @obo_set_intersect(i8*, i8*) nounwind
declare i8* @obo_set_difference(i8*, i8*) nounwind
declare i8* @obo_queue_push(i8*, i64) nounwind
declare i64 @obo_queue_peek(i8*) nounwind readonly
declare i8* @obo_queue_pop(i8*) nounwind
declare i8* @obo_stack_push(i8*, i64) nounwind
declare i64 @obo_stack_peek(i8*) nounwind readonly
declare i8* @obo_stack_pop(i8*) nounwind
declare i8* @obo_buffer_new(i64) nounwind
declare i64 @obo_buffer_length(i8*) nounwind readonly
declare i64 @obo_buffer_get(i8*, i64) nounwind readonly
declare i8* @obo_buffer_set(i8*, i64, i64) nounwind
declare i8* @obo_buffer_toList(i8*) nounwind
declare i8* @obo_textbuilder_new(i64) nounwind
declare i8* @obo_textbuilder_append(i8*, i8*) nounwind
declare i8* @obo_textbuilder_appendChar(i8*, i64) nounwind
declare i8* @obo_textbuilder_appendInt(i8*, i64) nounwind
declare i8* @obo_textbuilder_build(i8*) nounwind
declare i64 @obo_textbuilder_length(i8*) nounwind readonly
declare i8* @obo_textbuilder_clear(i8*) nounwind
declare i8* @obo_textbuilder_toString(i8*) nounwind
declare i8* @obo_arena_create(i64) nounwind
declare i64 @obo_arena_alloc(i8*, i64) nounwind
declare i64 @obo_arena_reset(i8*) nounwind
declare i64 @obo_arena_destroy(i8*) nounwind
declare i64 @obo_arena_used(i8*) nounwind readonly
declare i64 @obo_arena_capacity(i8*) nounwind readonly
declare i64 @obo_arena_write_i64(i64, i64) nounwind
declare i64 @obo_arena_write_f64(i64, double) nounwind
declare i64 @obo_arena_read_i64(i64) nounwind readonly
declare double @obo_arena_read_f64(i64) nounwind readonly
declare i8* @obo_bag_add(i8*, i64) nounwind
declare i64 @obo_bag_has(i8*, i64) nounwind readonly
declare i8* @obo_bag_remove(i8*, i64) nounwind
declare i8* @obo_grid2d_new(i64, i64, i64) nounwind
declare i64 @obo_grid2d_rows(i8*) nounwind readonly
declare i64 @obo_grid2d_cols(i8*) nounwind readonly
declare i64 @obo_grid2d_count(i8*) nounwind readonly
declare i64 @obo_grid2d_get(i8*, i64, i64) nounwind readonly
declare i8* @obo_grid2d_set(i8*, i64, i64, i64) nounwind
declare i8* @obo_grid2d_fill(i8*, i64) nounwind
declare i8* @obo_grid2d_row(i8*, i64) nounwind readonly
declare i8* @obo_grid2d_col(i8*, i64) nounwind readonly
declare i8* @obo_grid2d_toList(i8*) nounwind
declare i8* @obo_grid3d_new(i64, i64, i64, i64) nounwind
declare i64 @obo_grid3d_x(i8*) nounwind readonly
declare i64 @obo_grid3d_y(i8*) nounwind readonly
declare i64 @obo_grid3d_z(i8*) nounwind readonly
declare i64 @obo_grid3d_count(i8*) nounwind readonly
declare i64 @obo_grid3d_get(i8*, i64, i64, i64) nounwind readonly
declare i8* @obo_grid3d_set(i8*, i64, i64, i64, i64) nounwind
declare i8* @obo_grid3d_fill(i8*, i64) nounwind
declare i8* @obo_grid3d_toList(i8*) nounwind
declare i8* @obo_assert_fail(i8*) nounwind
declare i8* @obo_reflect(i8*) nounwind readonly
declare i64 @obo_value_as_i64(i8*) nounwind readonly
declare i64 @obo_value_truthy(i8*) nounwind readonly
declare i64 @obo_value_len(i8*) nounwind readonly
declare i64 @obo_value_empty(i8*) nounwind readonly
declare i8* @obo_value_keys(i8*) nounwind
declare i8* @obo_value_as_list_ptr(i8*) nounwind readonly
declare i8* @obo_value_as_mixed_list_ptr(i8*) nounwind readonly
declare i8* @obo_value_as_map_ptr(i8*) nounwind readonly
declare i8* @obo_value_as_entity_ptr(i8*) nounwind readonly
declare i64 @__sys_Math_abs(i64) nounwind readnone
declare i64 @__sys_Math_floor(double) nounwind readnone
declare i64 @__sys_Math_ceil(double) nounwind readnone
declare i64 @__sys_Math_round(double) nounwind readnone
declare i64 @__sys_Math_min(i64, i64) nounwind readnone
declare i64 @__sys_Math_max(i64, i64) nounwind readnone
declare i64 @__sys_Math_sign(i64) nounwind readnone
declare i64 @__sys_Math_maxNumber() nounwind readnone
declare i64 @__sys_Math_minNumber() nounwind readnone
declare i64 @__sys_Time_now() nounwind
declare i64 @__sys_Time_nowSeconds() nounwind
declare i64 @__sys_Time_sleep(i64) nounwind
declare i8* @__sys_File_read(i8*) nounwind
declare i64 @__sys_File_exists(i8*) nounwind readonly
declare i64 @__sys_Convert_toNumber(i8*) nounwind readonly
declare i8* @__sys_Convert_toText(i64) nounwind
declare i64 @obo_native_call_method_i64(i8*, i8*, i64, i64*) nounwind
declare i64 @obo_str_truthy(i8*) nounwind readonly
declare void @obo_print_bool(i64) nounwind
declare void @obo_print_double(double) nounwind
declare i8* @obo_prompt(i8*) nounwind
declare i8* @obo_f64_to_str(double) nounwind
declare i64 @obo_call_indirect_i64(i8*, i64, i64*) nounwind
declare double @__sys_Math_pi() nounwind readnone
declare double @__sys_Math_e() nounwind readnone
declare double @__sys_Math_infinity() nounwind readnone
declare double @__sys_Math_sqrt(double) nounwind readnone
declare double @__sys_Math_pow(double, double) nounwind readnone
declare double @__sys_Math_sin(double) nounwind readnone
declare double @__sys_Math_cos(double) nounwind readnone
declare double @__sys_Math_tan(double) nounwind readnone
declare double @__sys_Math_asin(double) nounwind readnone
declare double @__sys_Math_acos(double) nounwind readnone
declare double @__sys_Math_atan(double) nounwind readnone
declare double @__sys_Math_atan2(double, double) nounwind readnone
declare double @__sys_Math_log(double) nounwind readnone
declare double @__sys_Math_log10(double) nounwind readnone
declare double @__sys_Math_lerp(double, double, double) nounwind readnone
declare double @__sys_Math_clamp(double, double, double) nounwind readnone
declare double @__sys_Math_random() nounwind
declare i64 @__sys_Math_randomInt(i64, i64) nounwind
declare i64 @__sys_File_write(i8*, i8*) nounwind
declare i64 @__sys_File_append(i8*, i8*) nounwind
declare i64 @__sys_File_delete(i8*) nounwind
declare i8* @__sys_File_readLines(i8*) nounwind
declare double @__sys_Convert_toDecimal(i8*) nounwind readonly
declare i64 @__sys_Convert_toFlag(i64) nounwind readnone
declare i64 @__sys_Convert_toChar(i64) nounwind readnone
declare double @__sys_Time_measure() nounwind
declare i64 @__sys_Time_startTimer() nounwind
declare i64 @__sys_Time_stopTimer() nounwind
declare i64 @__sys_pointer_alloc(i64) nounwind
declare i64 @__sys_pointer_free(i64) nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1)
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8 , i64, i1)
declare i64 @__text_length(i8*) nounwind readonly
declare i64 @__text_empty(i8*) nounwind readonly
declare i8* @__text_upper(i8*) nounwind
declare i8* @__text_lower(i8*) nounwind
declare i8* @__text_trim(i8*) nounwind
declare i8* @__text_trimStart(i8*) nounwind
declare i8* @__text_trimEnd(i8*) nounwind
declare i8* @__text_reversed(i8*) nounwind
declare i64 @__text_contains(i8*, i8*) nounwind readonly
declare i64 @__text_startsWith(i8*, i8*) nounwind readonly
declare i64 @__text_endsWith(i8*, i8*) nounwind readonly
declare i64 @__text_indexOf(i8*, i8*) nounwind readonly
declare i8* @__text_replace(i8*, i8*, i8*) nounwind
declare i8* @__text_substring(i8*, i64, i64) nounwind
declare i8* @__text_repeat(i8*, i64) nounwind
declare i8* @__text_padLeft(i8*, i64, i8*) nounwind
declare i8* @__text_padRight(i8*, i64, i8*) nounwind
declare i64 @__text_toNumber(i8*) nounwind readonly
declare double @__text_toDecimal(i8*) nounwind readonly
declare i8* @__text_split(i8*, i8*) nounwind
declare i8* @obo_list_add(i8*, i64) nounwind
declare i64 @obo_list_first(i8*) nounwind readonly
declare i64 @obo_list_last(i8*) nounwind readonly
declare i64 @obo_list_empty(i8*) nounwind readonly
declare i64 @obo_list_contains(i8*, i64) nounwind readonly
declare i64 @obo_list_indexOf(i8*, i64) nounwind readonly
declare i8* @obo_list_sort(i8*) nounwind
declare i8* @obo_list_reverse(i8*) nounwind
declare i8* @obo_list_take(i8*, i64) nounwind
declare i8* @obo_list_skip(i8*, i64) nounwind
declare i8* @obo_list_slice(i8*, i64, i64) nounwind
declare i8* @obo_list_remove(i8*, i64) nounwind
declare i8* @obo_list_removeAt(i8*, i64) nounwind
declare i8* @obo_list_insert(i8*, i64, i64) nounwind
declare i8* @obo_list_join(i8*, i8*) nounwind
declare i8* @obo_list_distinct(i8*) nounwind
declare i64 @obo_map_empty(i8*) nounwind readonly
declare i64 @obo_map_has(i8*, i8*) nounwind readonly
declare i8* @obo_map_set(i8*, i8*, i64) nounwind
declare i8* @obo_map_remove(i8*, i8*) nounwind
declare i8* @obo_map_set_int(i8*, i64, i64) nounwind
declare i8* @obo_map_set_int_str(i8*, i64, i8*) nounwind
declare i8* @obo_map_set_int_boxed(i8*, i64, i8*) nounwind
declare i64 @obo_map_get_int(i8*, i64) nounwind readonly
declare i8* @obo_map_get_int_boxed(i8*, i64) nounwind readonly
declare i64 @obo_map_has_int(i8*, i64) nounwind readonly
declare i8* @obo_map_remove_int(i8*, i64) nounwind
declare i64 @obo_type_check(i8*, i8*) nounwind readonly
declare void @obo_arena_register(i8*) nounwind
declare void @obo_arena_free_all() nounwind
declare void @obo_gc_push_root(i8**) nounwind
declare void @obo_gc_push_roots_bulk(i8***, i64) nounwind
declare void @obo_gc_pop_roots(i64) nounwind
declare void @obo_gc_collect() nounwind
declare void @obo_gc_pause() nounwind
declare void @obo_gc_resume() nounwind
declare i8* @obo_closure_new(i8*, i64) nounwind
declare void @obo_closure_set_capture(i8*, i64, i64) nounwind
declare i64 @obo_closure_get_capture(i8*, i64) nounwind readonly
declare i64 @obo_closure_call_0(i8*) nounwind
declare i64 @obo_closure_call_1(i8*, i64) nounwind
declare i64 @obo_closure_call_2(i8*, i64, i64) nounwind
declare i64 @obo_closure_call_3(i8*, i64, i64, i64) nounwind
declare i8* @obo_event_listen(i8*, i8*, i8*) nounwind
declare i8* @obo_event_emit(i8*, i8*, i8*) nounwind
declare i8* @obo_task_spawn(i8*) nounwind
declare void @obo_task_wait(i8*) nounwind
declare void @obo_task_wait_all() nounwind
declare i8* @obo_channel_create() nounwind
declare void @obo_channel_send(i8*, i64) nounwind
declare i64 @obo_channel_receive(i8*) nounwind
declare i8* @obo_atomic_create(i64) nounwind
declare i64 @obo_atomic_load(i8*) nounwind
declare void @obo_atomic_store(i8*, i64) nounwind
declare i64 @obo_atomic_add(i8*, i64) nounwind
declare i64 @obo_atomic_sub(i8*, i64) nounwind
declare i8* @obo_possible_push() nounwind
declare i64 @obo_possible_pop() nounwind
declare void @obo_throw(i8*) nounwind
declare i8* @obo_possible_get_error() nounwind
declare i64 @obo_safe_div(i64, i64) nounwind readnone
declare i64 @obo_safe_mod(i64, i64) nounwind readnone
declare i8* @obo_range(i64, i64, i64) nounwind
declare i32 @_setjmp(i8*) #0
declare i8* @malloc(i64) nounwind
declare i8* @obo_list_filter(i8*, i8*) nounwind
declare i8* @obo_list_map(i8*, i8*) nounwind
declare i64 @obo_list_reduce(i8*, i64, i8*) nounwind
declare i64 @obo_list_any(i8*, i8*) nounwind
declare i64 @obo_list_all(i8*, i8*) nounwind
declare i8* @obo_mixed_list_new(i64) nounwind
declare void @obo_mixed_list_set(i8*, i64, i8*) nounwind
declare i8* @obo_mixed_list_get(i8*, i64) nounwind readonly
declare i8* @obo_dyn_index(i8*, i64) nounwind readonly
declare i8* @obo_dyn_index_str(i8*, i8*) nounwind readonly
declare i64 @obo_mixed_list_len(i8*) nounwind readonly
declare void @obo_mixed_list_print(i8*) nounwind
declare i8* @obo_mixed_list_filter(i8*, i8*) nounwind
declare i8* @obo_mixed_list_map(i8*, i8*) nounwind
declare void @obo_mixed_list_each(i8*, i8*) nounwind
declare i8* @obo_mixed_list_add(i8*, i8*) nounwind
declare i8* @obo_mixed_list_removeAt(i8*, i64) nounwind
declare i8* @obo_mixed_list_join(i8*, i8*) nounwind
declare i64 @obo_mixed_list_contains(i8*, i8*) nounwind readonly
declare i8* @obo_mixed_list_reduce(i8*, i8*, i8*) nounwind
declare i64 @obo_mixed_list_any(i8*, i8*) nounwind
declare i64 @obo_mixed_list_all(i8*, i8*) nounwind
declare i8* @obo_list_sort_by(i8*, i8*) nounwind
declare i8* @obo_mixed_list_sort_by(i8*, i8*) nounwind
declare i8* @obo_box_i64(i64) nounwind
declare i8* @obo_box_f64(double) nounwind
declare i8* @obo_box_str(i8*) nounwind
declare i8* @obo_box_bool(i64) nounwind
declare i8* @obo_box_null() nounwind
declare i8* @obo_box_list(i8*) nounwind
declare i8* @obo_box_map(i8*) nounwind
declare i8* @obo_box_entity(i8*) nounwind
declare double @obo_value_as_f64(i8*) nounwind readonly
declare i8* @obo_value_as_str(i8*) nounwind readonly
declare i64 @obo_value_compare(i8*, i8*) nounwind readonly
declare i8* @obo_dyn_arith(i8*, i8*, i32) nounwind
declare i64 @obo_value_to_closure_arg_boxed(i8*) nounwind readonly
declare i8* @obo_value_to_str(i8*) nounwind
declare i8* @obo_format_list_string(i8*) nounwind
declare i8* @obo_format_map_string(i8*) nounwind
declare i8* @obo_format_entity_string(i8*) nounwind
declare void @obo_event_loop_run(i8*, i8*, i8*, i64) nounwind
declare void @obo_event_loop_stop() nounwind

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }

@obo.str.0 = private unnamed_addr constant [4 x i8] c"add\00"
@obo.str.1 = private unnamed_addr constant [16 x i8] c"Spectral norm: \00"

define internal double @eval_A(i64 %arg0, i64 %arg1) {
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
  %reg_14_ptr = alloca double
  %var_j_ptr = alloca i64
  %var_i_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_i_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_j_ptr
  %t2 = load i64, i64* %var_i_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %var_j_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = add i64 %t4, %t5
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %var_i_ptr
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %var_j_ptr
  store i64 %t8, i64* %reg_6_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_6_ptr
  %t11 = add i64 %t9, %t10
  store i64 %t11, i64* %reg_7_ptr
  %t12 = load i64, i64* %reg_7_ptr
  %t13 = add i64 %t12, 1
  store i64 %t13, i64* %reg_8_ptr
  %t14 = load i64, i64* %reg_4_ptr
  %t15 = load i64, i64* %reg_8_ptr
  %t16 = mul i64 %t14, %t15
  store i64 %t16, i64* %reg_9_ptr
  %t17 = load i64, i64* %reg_9_ptr
  %t18 = call i64 @obo_safe_div(i64 %t17, i64 2)
  store i64 %t18, i64* %reg_10_ptr
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_11_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_11_ptr
  %t22 = add i64 %t20, %t21
  store i64 %t22, i64* %reg_12_ptr
  %t23 = load i64, i64* %reg_12_ptr
  %t24 = add i64 %t23, 1
  store i64 %t24, i64* %reg_13_ptr
  %t25 = load i64, i64* %reg_13_ptr
  %t26 = sitofp i64 %t25 to double
  %t27 = fdiv contract double 0x3FF0000000000000, %t26
  store double %t27, double* %reg_14_ptr
  %t28 = load double, double* %reg_14_ptr
  ret double %t28
}

define internal i64 @eval_A_times_u(i8* %arg0, i64 %arg1, i8* %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca double
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %var_u_ptr = alloca i8*
  %var_au_ptr = alloca i8*
  %var_i_ptr = alloca i64
  %var_sum_ptr = alloca double
  %var_j_ptr = alloca i64
  %var_n_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 4
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_15_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_17_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_u_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_au_ptr, i8*** %gc_root_gep_3
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 4)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_u_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_au_ptr
  store i64 0, i64* %var_i_ptr
  %t3 = load i64, i64* %var_n_ptr
  store i64 %t3, i64* %reg_3_ptr
  store i64 1, i64* %reg_4_ptr
  br label %eval_A_times_u_b1
eval_A_times_u_b1:
  %t4 = load i64, i64* %var_i_ptr
  store i64 %t4, i64* %reg_5_ptr
  %t5 = load i64, i64* %reg_5_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t7 = icmp slt i64 %t5, %t6
  %t8 = zext i1 %t7 to i64
  store i64 %t8, i64* %reg_6_ptr
  %t9 = load i64, i64* %reg_6_ptr
  %t11 = icmp ne i64 %t9, 0
  %t12 = zext i1 %t11 to i64
  %t10 = icmp ne i64 %t12, 0
  br i1 %t10, label %eval_A_times_u_b2, label %eval_A_times_u_b4
eval_A_times_u_b2:
  store double 0x0000000000000000, double* %var_sum_ptr
  store i64 0, i64* %var_j_ptr
  %t13 = load i64, i64* %var_n_ptr
  store i64 %t13, i64* %reg_7_ptr
  store i64 1, i64* %reg_8_ptr
  br label %eval_A_times_u_b5
eval_A_times_u_b3:
  %t14 = load i64, i64* %var_i_ptr
  store i64 %t14, i64* %reg_25_ptr
  %t15 = load i64, i64* %reg_25_ptr
  %t16 = load i64, i64* %reg_4_ptr
  %t17 = add i64 %t15, %t16
  store i64 %t17, i64* %reg_26_ptr
  %t18 = load i64, i64* %reg_26_ptr
  store i64 %t18, i64* %var_i_ptr
  br label %eval_A_times_u_b1
eval_A_times_u_b4:
  call void @obo_gc_pop_roots(i64 4)
  ret i64 0
eval_A_times_u_b5:
  %t19 = load i64, i64* %var_j_ptr
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_7_ptr
  %t22 = icmp slt i64 %t20, %t21
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %eval_A_times_u_b6, label %eval_A_times_u_b8
eval_A_times_u_b6:
  %t28 = load double, double* %var_sum_ptr
  store double %t28, double* %reg_11_ptr
  %t29 = load i64, i64* %var_i_ptr
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %var_j_ptr
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = call double @eval_A(i64 %t31, i64 %t32)
  store double %t33, double* %reg_14_ptr
  %t34 = load i8*, i8** %var_u_ptr
  store i8* %t34, i8** %reg_15_ptr
  %t35 = load i64, i64* %var_j_ptr
  store i64 %t35, i64* %reg_16_ptr
  %t36 = load i8*, i8** %reg_15_ptr
  %t37 = load i64, i64* %reg_16_ptr
  %t38 = mul i64 %t37, 16
  %t39 = add i64 %t38, 16
  %t40 = getelementptr i8, i8* %t36, i64 %t39
  store i8* %t40, i8** %reg_17_ptr
  %t41 = load double, double* %reg_14_ptr
  %t42 = load i8*, i8** %reg_17_ptr
  %t44 = getelementptr i8, i8* %t42, i64 0
  %t45 = bitcast i8* %t44 to i64*
  %t46 = load i64, i64* %t45
  %t47 = getelementptr i8, i8* %t42, i64 8
  %t48 = bitcast i8* %t47 to i64*
  %t49 = load i64, i64* %t48
  %t50 = icmp eq i64 %t46, 5
  %t51 = bitcast i64 %t49 to double
  %t52 = sitofp i64 %t49 to double
  %t43 = select i1 %t50, double %t51, double %t52
  %t53 = fmul contract double %t41, %t43
  store double %t53, double* %reg_18_ptr
  %t54 = load double, double* %reg_11_ptr
  %t55 = load double, double* %reg_18_ptr
  %t56 = fadd contract double %t54, %t55
  store double %t56, double* %reg_19_ptr
  %t57 = load double, double* %reg_19_ptr
  store double %t57, double* %var_sum_ptr
  br label %eval_A_times_u_b7
eval_A_times_u_b7:
  %t58 = load i64, i64* %var_j_ptr
  store i64 %t58, i64* %reg_20_ptr
  %t59 = load i64, i64* %reg_20_ptr
  %t60 = load i64, i64* %reg_8_ptr
  %t61 = add i64 %t59, %t60
  store i64 %t61, i64* %reg_21_ptr
  %t62 = load i64, i64* %reg_21_ptr
  store i64 %t62, i64* %var_j_ptr
  br label %eval_A_times_u_b5
eval_A_times_u_b8:
  %t63 = load double, double* %var_sum_ptr
  store double %t63, double* %reg_22_ptr
  %t64 = load i8*, i8** %var_au_ptr
  store i8* %t64, i8** %reg_23_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i8*, i8** %reg_23_ptr
  %t67 = load i64, i64* %reg_24_ptr
  %t68 = load double, double* %reg_22_ptr
  %t69 = call i8* @obo_box_f64(double %t68)
  call void @obo_mixed_list_set(i8* %t66, i64 %t67, i8* %t69)
  br label %eval_A_times_u_b3
}

define internal i64 @eval_At_times_u(i8* %arg0, i64 %arg1, i8* %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca double
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %var_atu_ptr = alloca i8*
  %var_j_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_sum_ptr = alloca double
  %var_u_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 4
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_15_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_17_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_atu_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_u_ptr, i8*** %gc_root_gep_3
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 4)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_u_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_atu_ptr
  store i64 0, i64* %var_i_ptr
  %t3 = load i64, i64* %var_n_ptr
  store i64 %t3, i64* %reg_3_ptr
  store i64 1, i64* %reg_4_ptr
  br label %eval_At_times_u_b1
eval_At_times_u_b1:
  %t4 = load i64, i64* %var_i_ptr
  store i64 %t4, i64* %reg_5_ptr
  %t5 = load i64, i64* %reg_5_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t7 = icmp slt i64 %t5, %t6
  %t8 = zext i1 %t7 to i64
  store i64 %t8, i64* %reg_6_ptr
  %t9 = load i64, i64* %reg_6_ptr
  %t11 = icmp ne i64 %t9, 0
  %t12 = zext i1 %t11 to i64
  %t10 = icmp ne i64 %t12, 0
  br i1 %t10, label %eval_At_times_u_b2, label %eval_At_times_u_b4
eval_At_times_u_b2:
  store double 0x0000000000000000, double* %var_sum_ptr
  store i64 0, i64* %var_j_ptr
  %t13 = load i64, i64* %var_n_ptr
  store i64 %t13, i64* %reg_7_ptr
  store i64 1, i64* %reg_8_ptr
  br label %eval_At_times_u_b5
eval_At_times_u_b3:
  %t14 = load i64, i64* %var_i_ptr
  store i64 %t14, i64* %reg_25_ptr
  %t15 = load i64, i64* %reg_25_ptr
  %t16 = load i64, i64* %reg_4_ptr
  %t17 = add i64 %t15, %t16
  store i64 %t17, i64* %reg_26_ptr
  %t18 = load i64, i64* %reg_26_ptr
  store i64 %t18, i64* %var_i_ptr
  br label %eval_At_times_u_b1
eval_At_times_u_b4:
  call void @obo_gc_pop_roots(i64 4)
  ret i64 0
eval_At_times_u_b5:
  %t19 = load i64, i64* %var_j_ptr
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_7_ptr
  %t22 = icmp slt i64 %t20, %t21
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %eval_At_times_u_b6, label %eval_At_times_u_b8
eval_At_times_u_b6:
  %t28 = load double, double* %var_sum_ptr
  store double %t28, double* %reg_11_ptr
  %t29 = load i64, i64* %var_j_ptr
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %var_i_ptr
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = call double @eval_A(i64 %t31, i64 %t32)
  store double %t33, double* %reg_14_ptr
  %t34 = load i8*, i8** %var_u_ptr
  store i8* %t34, i8** %reg_15_ptr
  %t35 = load i64, i64* %var_j_ptr
  store i64 %t35, i64* %reg_16_ptr
  %t36 = load i8*, i8** %reg_15_ptr
  %t37 = load i64, i64* %reg_16_ptr
  %t38 = mul i64 %t37, 16
  %t39 = add i64 %t38, 16
  %t40 = getelementptr i8, i8* %t36, i64 %t39
  store i8* %t40, i8** %reg_17_ptr
  %t41 = load double, double* %reg_14_ptr
  %t42 = load i8*, i8** %reg_17_ptr
  %t44 = getelementptr i8, i8* %t42, i64 0
  %t45 = bitcast i8* %t44 to i64*
  %t46 = load i64, i64* %t45
  %t47 = getelementptr i8, i8* %t42, i64 8
  %t48 = bitcast i8* %t47 to i64*
  %t49 = load i64, i64* %t48
  %t50 = icmp eq i64 %t46, 5
  %t51 = bitcast i64 %t49 to double
  %t52 = sitofp i64 %t49 to double
  %t43 = select i1 %t50, double %t51, double %t52
  %t53 = fmul contract double %t41, %t43
  store double %t53, double* %reg_18_ptr
  %t54 = load double, double* %reg_11_ptr
  %t55 = load double, double* %reg_18_ptr
  %t56 = fadd contract double %t54, %t55
  store double %t56, double* %reg_19_ptr
  %t57 = load double, double* %reg_19_ptr
  store double %t57, double* %var_sum_ptr
  br label %eval_At_times_u_b7
eval_At_times_u_b7:
  %t58 = load i64, i64* %var_j_ptr
  store i64 %t58, i64* %reg_20_ptr
  %t59 = load i64, i64* %reg_20_ptr
  %t60 = load i64, i64* %reg_8_ptr
  %t61 = add i64 %t59, %t60
  store i64 %t61, i64* %reg_21_ptr
  %t62 = load i64, i64* %reg_21_ptr
  store i64 %t62, i64* %var_j_ptr
  br label %eval_At_times_u_b5
eval_At_times_u_b8:
  %t63 = load double, double* %var_sum_ptr
  store double %t63, double* %reg_22_ptr
  %t64 = load i8*, i8** %var_atu_ptr
  store i8* %t64, i8** %reg_23_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i8*, i8** %reg_23_ptr
  %t67 = load i64, i64* %reg_24_ptr
  %t68 = load double, double* %reg_22_ptr
  %t69 = call i8* @obo_box_f64(double %t68)
  call void @obo_mixed_list_set(i8* %t66, i64 %t67, i8* %t69)
  br label %eval_At_times_u_b3
}

define internal i64 @eval_AtA_times_u(i8* %arg0, i64 %arg1, i8* %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_v_ptr = alloca i8*
  %var_u_ptr = alloca i8*
  %var_atau_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 6
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_9_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_16_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_18_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_v_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_u_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %var_atau_ptr, i8*** %gc_root_gep_5
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 6)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_u_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_atau_ptr
  %t3 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  store i8* %t4, i8** %var_v_ptr
  store i64 0, i64* %var_i_ptr
  %t5 = load i64, i64* %var_n_ptr
  store i64 %t5, i64* %reg_4_ptr
  store i64 1, i64* %reg_5_ptr
  br label %eval_AtA_times_u_b1
eval_AtA_times_u_b1:
  %t6 = load i64, i64* %var_i_ptr
  store i64 %t6, i64* %reg_6_ptr
  %t7 = load i64, i64* %reg_6_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = icmp slt i64 %t7, %t8
  %t10 = zext i1 %t9 to i64
  store i64 %t10, i64* %reg_7_ptr
  %t11 = load i64, i64* %reg_7_ptr
  %t13 = icmp ne i64 %t11, 0
  %t14 = zext i1 %t13 to i64
  %t12 = icmp ne i64 %t14, 0
  br i1 %t12, label %eval_AtA_times_u_b2, label %eval_AtA_times_u_b4
eval_AtA_times_u_b2:
  %t15 = load i8*, i8** %var_v_ptr
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %reg_8_ptr
  %t17 = call i8* @obo_box_f64(double 0x0000000000000000)
  %t18 = call i8* @obo_mixed_list_add(i8* %t16, i8* %t17)
  store i8* %t18, i8** %reg_9_ptr
  %t19 = load i8*, i8** %reg_9_ptr
  store i8* %t19, i8** %var_v_ptr
  br label %eval_AtA_times_u_b3
eval_AtA_times_u_b3:
  %t20 = load i64, i64* %var_i_ptr
  store i64 %t20, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_10_ptr
  %t22 = load i64, i64* %reg_5_ptr
  %t23 = add i64 %t21, %t22
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  store i64 %t24, i64* %var_i_ptr
  br label %eval_AtA_times_u_b1
eval_AtA_times_u_b4:
  %t25 = load i8*, i8** %var_u_ptr
  store i8* %t25, i8** %reg_12_ptr
  %t26 = load i64, i64* %var_n_ptr
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i8*, i8** %var_v_ptr
  store i8* %t27, i8** %reg_14_ptr
  %t28 = load i8*, i8** %reg_12_ptr
  %t29 = load i64, i64* %reg_13_ptr
  %t30 = load i8*, i8** %reg_14_ptr
  %t31 = call i64 @eval_A_times_u(i8* %t28, i64 %t29, i8* %t30)
  store i64 %t31, i64* %reg_15_ptr
  %t32 = load i8*, i8** %var_v_ptr
  store i8* %t32, i8** %reg_16_ptr
  %t33 = load i64, i64* %var_n_ptr
  store i64 %t33, i64* %reg_17_ptr
  %t34 = load i8*, i8** %var_atau_ptr
  store i8* %t34, i8** %reg_18_ptr
  %t35 = load i8*, i8** %reg_16_ptr
  %t36 = load i64, i64* %reg_17_ptr
  %t37 = load i8*, i8** %reg_18_ptr
  %t38 = call i64 @eval_At_times_u(i8* %t35, i64 %t36, i8* %t37)
  store i64 %t38, i64* %reg_19_ptr
  call void @obo_gc_pop_roots(i64 6)
  ret i64 0
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca double
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i64
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca double
  %reg_52_ptr = alloca double
  %reg_53_ptr = alloca double
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca i8*
  %var_vv_ptr = alloca double
  %var_n_ptr = alloca i64
  %var_v_ptr = alloca i8*
  %var_u_ptr = alloca i8*
  %var_vBv_ptr = alloca double
  %var_result_ptr = alloca double
  %var_i_ptr = alloca i64
  %gc_root_arr = alloca i8**, i64 7
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_7_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_8_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_9_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_20_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_22_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %var_v_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %var_u_ptr, i8*** %gc_root_gep_6
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 7)
  store i64 1000, i64* %var_n_ptr
  %t0 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_u_ptr
  %t2 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  store i8* %t3, i8** %var_v_ptr
  store i64 0, i64* %var_i_ptr
  %t4 = load i64, i64* %var_n_ptr
  store i64 %t4, i64* %reg_2_ptr
  store i64 1, i64* %reg_3_ptr
  br label %main_b1
main_b1:
  %t5 = load i64, i64* %var_i_ptr
  store i64 %t5, i64* %reg_4_ptr
  %t6 = load i64, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_2_ptr
  %t8 = icmp slt i64 %t6, %t7
  %t9 = zext i1 %t8 to i64
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  %t12 = icmp ne i64 %t10, 0
  %t13 = zext i1 %t12 to i64
  %t11 = icmp ne i64 %t13, 0
  br i1 %t11, label %main_b2, label %main_b4
main_b2:
  %t14 = load i8*, i8** %var_u_ptr
  store i8* %t14, i8** %reg_6_ptr
  %t15 = load i8*, i8** %reg_6_ptr
  %t16 = call i8* @obo_box_f64(double 0x3FF0000000000000)
  %t17 = call i8* @obo_mixed_list_add(i8* %t15, i8* %t16)
  store i8* %t17, i8** %reg_7_ptr
  %t18 = load i8*, i8** %reg_7_ptr
  store i8* %t18, i8** %var_u_ptr
  %t19 = load i8*, i8** %var_v_ptr
  store i8* %t19, i8** %reg_8_ptr
  %t20 = load i8*, i8** %reg_8_ptr
  %t21 = call i8* @obo_box_f64(double 0x0000000000000000)
  %t22 = call i8* @obo_mixed_list_add(i8* %t20, i8* %t21)
  store i8* %t22, i8** %reg_9_ptr
  %t23 = load i8*, i8** %reg_9_ptr
  store i8* %t23, i8** %var_v_ptr
  br label %main_b3
main_b3:
  %t24 = load i64, i64* %var_i_ptr
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t26 = load i64, i64* %reg_3_ptr
  %t27 = add i64 %t25, %t26
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_11_ptr
  store i64 %t28, i64* %var_i_ptr
  br label %main_b1
main_b4:
  store i64 0, i64* %var_i_ptr
  store i64 10, i64* %reg_12_ptr
  store i64 1, i64* %reg_13_ptr
  br label %main_b5
main_b5:
  %t29 = load i64, i64* %var_i_ptr
  store i64 %t29, i64* %reg_14_ptr
  %t30 = load i64, i64* %reg_14_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = icmp slt i64 %t30, %t31
  %t33 = zext i1 %t32 to i64
  store i64 %t33, i64* %reg_15_ptr
  %t34 = load i64, i64* %reg_15_ptr
  %t36 = icmp ne i64 %t34, 0
  %t37 = zext i1 %t36 to i64
  %t35 = icmp ne i64 %t37, 0
  br i1 %t35, label %main_b6, label %main_b8
main_b6:
  %t38 = load i8*, i8** %var_u_ptr
  store i8* %t38, i8** %reg_16_ptr
  %t39 = load i64, i64* %var_n_ptr
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i8*, i8** %var_v_ptr
  store i8* %t40, i8** %reg_18_ptr
  %t41 = load i8*, i8** %reg_16_ptr
  %t42 = load i64, i64* %reg_17_ptr
  %t43 = load i8*, i8** %reg_18_ptr
  %t44 = call i64 @eval_AtA_times_u(i8* %t41, i64 %t42, i8* %t43)
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i8*, i8** %var_v_ptr
  store i8* %t45, i8** %reg_20_ptr
  %t46 = load i64, i64* %var_n_ptr
  store i64 %t46, i64* %reg_21_ptr
  %t47 = load i8*, i8** %var_u_ptr
  store i8* %t47, i8** %reg_22_ptr
  %t48 = load i8*, i8** %reg_20_ptr
  %t49 = load i64, i64* %reg_21_ptr
  %t50 = load i8*, i8** %reg_22_ptr
  %t51 = call i64 @eval_AtA_times_u(i8* %t48, i64 %t49, i8* %t50)
  store i64 %t51, i64* %reg_23_ptr
  br label %main_b7
main_b7:
  %t52 = load i64, i64* %var_i_ptr
  store i64 %t52, i64* %reg_24_ptr
  %t53 = load i64, i64* %reg_24_ptr
  %t54 = load i64, i64* %reg_13_ptr
  %t55 = add i64 %t53, %t54
  store i64 %t55, i64* %reg_25_ptr
  %t56 = load i64, i64* %reg_25_ptr
  store i64 %t56, i64* %var_i_ptr
  br label %main_b5
main_b8:
  store double 0x0000000000000000, double* %var_vBv_ptr
  store double 0x0000000000000000, double* %var_vv_ptr
  store i64 0, i64* %var_i_ptr
  %t57 = load i64, i64* %var_n_ptr
  store i64 %t57, i64* %reg_26_ptr
  store i64 1, i64* %reg_27_ptr
  br label %main_b9
main_b9:
  %t58 = load i64, i64* %var_i_ptr
  store i64 %t58, i64* %reg_28_ptr
  %t59 = load i64, i64* %reg_28_ptr
  %t60 = load i64, i64* %reg_26_ptr
  %t61 = icmp slt i64 %t59, %t60
  %t62 = zext i1 %t61 to i64
  store i64 %t62, i64* %reg_29_ptr
  %t63 = load i64, i64* %reg_29_ptr
  %t65 = icmp ne i64 %t63, 0
  %t66 = zext i1 %t65 to i64
  %t64 = icmp ne i64 %t66, 0
  br i1 %t64, label %main_b10, label %main_b12
main_b10:
  %t67 = load double, double* %var_vBv_ptr
  store double %t67, double* %reg_30_ptr
  %t68 = load i8*, i8** %var_u_ptr
  store i8* %t68, i8** %reg_31_ptr
  %t69 = load i64, i64* %var_i_ptr
  store i64 %t69, i64* %reg_32_ptr
  %t70 = load i8*, i8** %reg_31_ptr
  %t71 = load i64, i64* %reg_32_ptr
  %t72 = mul i64 %t71, 16
  %t73 = add i64 %t72, 16
  %t74 = getelementptr i8, i8* %t70, i64 %t73
  store i8* %t74, i8** %reg_33_ptr
  %t75 = load i8*, i8** %var_v_ptr
  store i8* %t75, i8** %reg_34_ptr
  %t76 = load i64, i64* %var_i_ptr
  store i64 %t76, i64* %reg_35_ptr
  %t77 = load i8*, i8** %reg_34_ptr
  %t78 = load i64, i64* %reg_35_ptr
  %t79 = mul i64 %t78, 16
  %t80 = add i64 %t79, 16
  %t81 = getelementptr i8, i8* %t77, i64 %t80
  store i8* %t81, i8** %reg_36_ptr
  %t82 = load i8*, i8** %reg_33_ptr
  %t83 = load i8*, i8** %reg_36_ptr
  %t84 = call i8* @obo_dyn_arith(i8* %t82, i8* %t83, i32 2)
  store i8* %t84, i8** %reg_37_ptr
  %t85 = load double, double* %reg_30_ptr
  %t86 = load i8*, i8** %reg_37_ptr
  %t88 = getelementptr i8, i8* %t86, i64 0
  %t89 = bitcast i8* %t88 to i64*
  %t90 = load i64, i64* %t89
  %t91 = getelementptr i8, i8* %t86, i64 8
  %t92 = bitcast i8* %t91 to i64*
  %t93 = load i64, i64* %t92
  %t94 = icmp eq i64 %t90, 5
  %t95 = bitcast i64 %t93 to double
  %t96 = sitofp i64 %t93 to double
  %t87 = select i1 %t94, double %t95, double %t96
  %t97 = fadd contract double %t85, %t87
  store double %t97, double* %reg_38_ptr
  %t98 = load double, double* %reg_38_ptr
  store double %t98, double* %var_vBv_ptr
  %t99 = load double, double* %var_vv_ptr
  store double %t99, double* %reg_39_ptr
  %t100 = load i8*, i8** %var_v_ptr
  store i8* %t100, i8** %reg_40_ptr
  %t101 = load i64, i64* %var_i_ptr
  store i64 %t101, i64* %reg_41_ptr
  %t102 = load i8*, i8** %reg_40_ptr
  %t103 = load i64, i64* %reg_41_ptr
  %t104 = mul i64 %t103, 16
  %t105 = add i64 %t104, 16
  %t106 = getelementptr i8, i8* %t102, i64 %t105
  store i8* %t106, i8** %reg_42_ptr
  %t107 = load i8*, i8** %var_v_ptr
  store i8* %t107, i8** %reg_43_ptr
  %t108 = load i64, i64* %var_i_ptr
  store i64 %t108, i64* %reg_44_ptr
  %t109 = load i8*, i8** %reg_43_ptr
  %t110 = load i64, i64* %reg_44_ptr
  %t111 = mul i64 %t110, 16
  %t112 = add i64 %t111, 16
  %t113 = getelementptr i8, i8* %t109, i64 %t112
  store i8* %t113, i8** %reg_45_ptr
  %t114 = load i8*, i8** %reg_42_ptr
  %t115 = load i8*, i8** %reg_45_ptr
  %t116 = call i8* @obo_dyn_arith(i8* %t114, i8* %t115, i32 2)
  store i8* %t116, i8** %reg_46_ptr
  %t117 = load double, double* %reg_39_ptr
  %t118 = load i8*, i8** %reg_46_ptr
  %t120 = getelementptr i8, i8* %t118, i64 0
  %t121 = bitcast i8* %t120 to i64*
  %t122 = load i64, i64* %t121
  %t123 = getelementptr i8, i8* %t118, i64 8
  %t124 = bitcast i8* %t123 to i64*
  %t125 = load i64, i64* %t124
  %t126 = icmp eq i64 %t122, 5
  %t127 = bitcast i64 %t125 to double
  %t128 = sitofp i64 %t125 to double
  %t119 = select i1 %t126, double %t127, double %t128
  %t129 = fadd contract double %t117, %t119
  store double %t129, double* %reg_47_ptr
  %t130 = load double, double* %reg_47_ptr
  store double %t130, double* %var_vv_ptr
  br label %main_b11
main_b11:
  %t131 = load i64, i64* %var_i_ptr
  store i64 %t131, i64* %reg_48_ptr
  %t132 = load i64, i64* %reg_48_ptr
  %t133 = load i64, i64* %reg_27_ptr
  %t134 = add i64 %t132, %t133
  store i64 %t134, i64* %reg_49_ptr
  %t135 = load i64, i64* %reg_49_ptr
  store i64 %t135, i64* %var_i_ptr
  br label %main_b9
main_b12:
  %t136 = load double, double* %var_vBv_ptr
  store double %t136, double* %reg_50_ptr
  %t137 = load double, double* %var_vv_ptr
  store double %t137, double* %reg_51_ptr
  %t138 = load double, double* %reg_50_ptr
  %t139 = load double, double* %reg_51_ptr
  %t140 = fdiv contract double %t138, %t139
  store double %t140, double* %reg_52_ptr
  %t141 = load double, double* %reg_52_ptr
  %t142 = call double @__sys_Math_sqrt(double %t141)
  store double %t142, double* %reg_53_ptr
  %t143 = load double, double* %reg_53_ptr
  store double %t143, double* %var_result_ptr
  %t144 = load double, double* %var_result_ptr
  store double %t144, double* %reg_54_ptr
  %t145 = load double, double* %reg_54_ptr
  %t146 = call i8* @obo_f64_to_str(double %t145)
  %t147 = call i8* @obo_str_concat(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @obo.str.1, i64 0, i64 0), i8* %t146)
  store i8* %t147, i8** %reg_55_ptr
  %t148 = load i8*, i8** %reg_55_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t148)
  call void @obo_gc_pop_roots(i64 7)
  call void @obo_arena_free_all()
  ret i32 0
}

