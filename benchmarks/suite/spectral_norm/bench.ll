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
declare i8* @obo_f64_list_new(i64, double*) nounwind
declare i8* @obo_f64_list_add(i8*, double) nounwind
declare double @obo_f64_list_get(i8*, i64) nounwind readonly
declare void @obo_f64_list_set(i8*, i64, double) nounwind
declare i64 @obo_f64_list_length(i8*) nounwind readonly
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
  %var_i_ptr = alloca i64
  %var_j_ptr = alloca i64
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
  %t18 = sdiv i64 %t17, 2
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
  %t27 = fdiv reassoc contract double 0x3FF0000000000000, %t26
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
  %reg_17_ptr = alloca double
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
  %var_n_ptr = alloca i64
  %var_sum_ptr = alloca double
  %var_j_ptr = alloca i64
  %var_i_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %var_u_ptr)
  call void @obo_gc_push_root(i8** %var_au_ptr)
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
  call void @obo_gc_pop_roots(i64 3)
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
  %t38 = mul i64 %t37, 8
  %t39 = add i64 %t38, 16
  %t40 = getelementptr i8, i8* %t36, i64 %t39
  %t41 = bitcast i8* %t40 to double*
  %t42 = load double, double* %t41
  store double %t42, double* %reg_17_ptr
  %t43 = load double, double* %reg_14_ptr
  %t44 = load double, double* %reg_17_ptr
  %t45 = fmul reassoc contract double %t43, %t44
  store double %t45, double* %reg_18_ptr
  %t46 = load double, double* %reg_11_ptr
  %t47 = load double, double* %reg_18_ptr
  %t48 = fadd reassoc contract double %t46, %t47
  store double %t48, double* %reg_19_ptr
  %t49 = load double, double* %reg_19_ptr
  store double %t49, double* %var_sum_ptr
  br label %eval_A_times_u_b7
eval_A_times_u_b7:
  %t50 = load i64, i64* %var_j_ptr
  store i64 %t50, i64* %reg_20_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t52 = load i64, i64* %reg_8_ptr
  %t53 = add i64 %t51, %t52
  store i64 %t53, i64* %reg_21_ptr
  %t54 = load i64, i64* %reg_21_ptr
  store i64 %t54, i64* %var_j_ptr
  br label %eval_A_times_u_b5
eval_A_times_u_b8:
  %t55 = load double, double* %var_sum_ptr
  store double %t55, double* %reg_22_ptr
  %t56 = load i8*, i8** %var_au_ptr
  store i8* %t56, i8** %reg_23_ptr
  %t57 = load i64, i64* %var_i_ptr
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i8*, i8** %reg_23_ptr
  %t59 = load i64, i64* %reg_24_ptr
  %t60 = load double, double* %reg_22_ptr
  %t61 = mul i64 %t59, 8
  %t62 = add i64 %t61, 16
  %t63 = getelementptr i8, i8* %t58, i64 %t62
  %t64 = bitcast i8* %t63 to double*
  store double %t60, double* %t64
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
  %reg_17_ptr = alloca double
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
  %var_u_ptr = alloca i8*
  %var_n_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_sum_ptr = alloca double
  %var_j_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %var_atu_ptr)
  call void @obo_gc_push_root(i8** %var_u_ptr)
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
  call void @obo_gc_pop_roots(i64 3)
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
  %t38 = mul i64 %t37, 8
  %t39 = add i64 %t38, 16
  %t40 = getelementptr i8, i8* %t36, i64 %t39
  %t41 = bitcast i8* %t40 to double*
  %t42 = load double, double* %t41
  store double %t42, double* %reg_17_ptr
  %t43 = load double, double* %reg_14_ptr
  %t44 = load double, double* %reg_17_ptr
  %t45 = fmul reassoc contract double %t43, %t44
  store double %t45, double* %reg_18_ptr
  %t46 = load double, double* %reg_11_ptr
  %t47 = load double, double* %reg_18_ptr
  %t48 = fadd reassoc contract double %t46, %t47
  store double %t48, double* %reg_19_ptr
  %t49 = load double, double* %reg_19_ptr
  store double %t49, double* %var_sum_ptr
  br label %eval_At_times_u_b7
eval_At_times_u_b7:
  %t50 = load i64, i64* %var_j_ptr
  store i64 %t50, i64* %reg_20_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t52 = load i64, i64* %reg_8_ptr
  %t53 = add i64 %t51, %t52
  store i64 %t53, i64* %reg_21_ptr
  %t54 = load i64, i64* %reg_21_ptr
  store i64 %t54, i64* %var_j_ptr
  br label %eval_At_times_u_b5
eval_At_times_u_b8:
  %t55 = load double, double* %var_sum_ptr
  store double %t55, double* %reg_22_ptr
  %t56 = load i8*, i8** %var_atu_ptr
  store i8* %t56, i8** %reg_23_ptr
  %t57 = load i64, i64* %var_i_ptr
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i8*, i8** %reg_23_ptr
  %t59 = load i64, i64* %reg_24_ptr
  %t60 = load double, double* %reg_22_ptr
  %t61 = mul i64 %t59, 8
  %t62 = add i64 %t61, 16
  %t63 = getelementptr i8, i8* %t58, i64 %t62
  %t64 = bitcast i8* %t63 to double*
  store double %t60, double* %t64
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
  %var_u_ptr = alloca i8*
  %var_i_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_v_ptr = alloca i8*
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
  store i8** %var_u_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_v_ptr, i8*** %gc_root_gep_4
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
  %t17 = call i8* @obo_f64_list_add(i8* %t16, double 0x0000000000000000)
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  store i8* %t18, i8** %var_v_ptr
  br label %eval_AtA_times_u_b3
eval_AtA_times_u_b3:
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_5_ptr
  %t22 = add i64 %t20, %t21
  store i64 %t22, i64* %reg_11_ptr
  %t23 = load i64, i64* %reg_11_ptr
  store i64 %t23, i64* %var_i_ptr
  br label %eval_AtA_times_u_b1
eval_AtA_times_u_b4:
  %t24 = load i8*, i8** %var_u_ptr
  store i8* %t24, i8** %reg_12_ptr
  %t25 = load i64, i64* %var_n_ptr
  store i64 %t25, i64* %reg_13_ptr
  %t26 = load i8*, i8** %var_v_ptr
  store i8* %t26, i8** %reg_14_ptr
  %t27 = load i8*, i8** %reg_12_ptr
  %t28 = load i64, i64* %reg_13_ptr
  %t29 = load i8*, i8** %reg_14_ptr
  %t30 = call i64 @eval_A_times_u(i8* %t27, i64 %t28, i8* %t29)
  store i64 %t30, i64* %reg_15_ptr
  %t31 = load i8*, i8** %var_v_ptr
  store i8* %t31, i8** %reg_16_ptr
  %t32 = load i64, i64* %var_n_ptr
  store i64 %t32, i64* %reg_17_ptr
  %t33 = load i8*, i8** %var_atau_ptr
  store i8* %t33, i8** %reg_18_ptr
  %t34 = load i8*, i8** %reg_16_ptr
  %t35 = load i64, i64* %reg_17_ptr
  %t36 = load i8*, i8** %reg_18_ptr
  %t37 = call i64 @eval_At_times_u(i8* %t34, i64 %t35, i8* %t36)
  store i64 %t37, i64* %reg_19_ptr
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
  %reg_33_ptr = alloca double
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca double
  %reg_37_ptr = alloca double
  %reg_38_ptr = alloca double
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i64
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca double
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca double
  %reg_52_ptr = alloca double
  %reg_53_ptr = alloca double
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca i8*
  %var_result_ptr = alloca double
  %var_vv_ptr = alloca double
  %var_v_ptr = alloca i8*
  %var_u_ptr = alloca i8*
  %var_vBv_ptr = alloca double
  %var_i_ptr = alloca i64
  %var_n_ptr = alloca i64
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
  %t16 = call i8* @obo_f64_list_add(i8* %t15, double 0x3FF0000000000000)
  store i8* %t16, i8** %reg_7_ptr
  %t17 = load i8*, i8** %reg_7_ptr
  store i8* %t17, i8** %var_u_ptr
  %t18 = load i8*, i8** %var_v_ptr
  store i8* %t18, i8** %reg_8_ptr
  %t19 = load i8*, i8** %reg_8_ptr
  %t20 = call i8* @obo_f64_list_add(i8* %t19, double 0x0000000000000000)
  store i8* %t20, i8** %reg_9_ptr
  %t21 = load i8*, i8** %reg_9_ptr
  store i8* %t21, i8** %var_v_ptr
  br label %main_b3
main_b3:
  %t22 = load i64, i64* %var_i_ptr
  store i64 %t22, i64* %reg_10_ptr
  %t23 = load i64, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_3_ptr
  %t25 = add i64 %t23, %t24
  store i64 %t25, i64* %reg_11_ptr
  %t26 = load i64, i64* %reg_11_ptr
  store i64 %t26, i64* %var_i_ptr
  br label %main_b1
main_b4:
  store i64 0, i64* %var_i_ptr
  store i64 10, i64* %reg_12_ptr
  store i64 1, i64* %reg_13_ptr
  br label %main_b5
main_b5:
  %t27 = load i64, i64* %var_i_ptr
  store i64 %t27, i64* %reg_14_ptr
  %t28 = load i64, i64* %reg_14_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = icmp slt i64 %t28, %t29
  %t31 = zext i1 %t30 to i64
  store i64 %t31, i64* %reg_15_ptr
  %t32 = load i64, i64* %reg_15_ptr
  %t34 = icmp ne i64 %t32, 0
  %t35 = zext i1 %t34 to i64
  %t33 = icmp ne i64 %t35, 0
  br i1 %t33, label %main_b6, label %main_b8
main_b6:
  %t36 = load i8*, i8** %var_u_ptr
  store i8* %t36, i8** %reg_16_ptr
  %t37 = load i64, i64* %var_n_ptr
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i8*, i8** %var_v_ptr
  store i8* %t38, i8** %reg_18_ptr
  %t39 = load i8*, i8** %reg_16_ptr
  %t40 = load i64, i64* %reg_17_ptr
  %t41 = load i8*, i8** %reg_18_ptr
  %t42 = call i64 @eval_AtA_times_u(i8* %t39, i64 %t40, i8* %t41)
  store i64 %t42, i64* %reg_19_ptr
  %t43 = load i8*, i8** %var_v_ptr
  store i8* %t43, i8** %reg_20_ptr
  %t44 = load i64, i64* %var_n_ptr
  store i64 %t44, i64* %reg_21_ptr
  %t45 = load i8*, i8** %var_u_ptr
  store i8* %t45, i8** %reg_22_ptr
  %t46 = load i8*, i8** %reg_20_ptr
  %t47 = load i64, i64* %reg_21_ptr
  %t48 = load i8*, i8** %reg_22_ptr
  %t49 = call i64 @eval_AtA_times_u(i8* %t46, i64 %t47, i8* %t48)
  store i64 %t49, i64* %reg_23_ptr
  br label %main_b7
main_b7:
  %t50 = load i64, i64* %var_i_ptr
  store i64 %t50, i64* %reg_24_ptr
  %t51 = load i64, i64* %reg_24_ptr
  %t52 = load i64, i64* %reg_13_ptr
  %t53 = add i64 %t51, %t52
  store i64 %t53, i64* %reg_25_ptr
  %t54 = load i64, i64* %reg_25_ptr
  store i64 %t54, i64* %var_i_ptr
  br label %main_b5
main_b8:
  store double 0x0000000000000000, double* %var_vBv_ptr
  store double 0x0000000000000000, double* %var_vv_ptr
  store i64 0, i64* %var_i_ptr
  %t55 = load i64, i64* %var_n_ptr
  store i64 %t55, i64* %reg_26_ptr
  store i64 1, i64* %reg_27_ptr
  br label %main_b9
main_b9:
  %t56 = load i64, i64* %var_i_ptr
  store i64 %t56, i64* %reg_28_ptr
  %t57 = load i64, i64* %reg_28_ptr
  %t58 = load i64, i64* %reg_26_ptr
  %t59 = icmp slt i64 %t57, %t58
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_29_ptr
  %t61 = load i64, i64* %reg_29_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %main_b10, label %main_b12
main_b10:
  %t65 = load double, double* %var_vBv_ptr
  store double %t65, double* %reg_30_ptr
  %t66 = load i8*, i8** %var_u_ptr
  store i8* %t66, i8** %reg_31_ptr
  %t67 = load i64, i64* %var_i_ptr
  store i64 %t67, i64* %reg_32_ptr
  %t68 = load i8*, i8** %reg_31_ptr
  %t69 = load i64, i64* %reg_32_ptr
  %t70 = mul i64 %t69, 8
  %t71 = add i64 %t70, 16
  %t72 = getelementptr i8, i8* %t68, i64 %t71
  %t73 = bitcast i8* %t72 to double*
  %t74 = load double, double* %t73
  store double %t74, double* %reg_33_ptr
  %t75 = load i8*, i8** %var_v_ptr
  store i8* %t75, i8** %reg_34_ptr
  %t76 = load i64, i64* %var_i_ptr
  store i64 %t76, i64* %reg_35_ptr
  %t77 = load i8*, i8** %reg_34_ptr
  %t78 = load i64, i64* %reg_35_ptr
  %t79 = mul i64 %t78, 8
  %t80 = add i64 %t79, 16
  %t81 = getelementptr i8, i8* %t77, i64 %t80
  %t82 = bitcast i8* %t81 to double*
  %t83 = load double, double* %t82
  store double %t83, double* %reg_36_ptr
  %t84 = load double, double* %reg_33_ptr
  %t85 = load double, double* %reg_36_ptr
  %t86 = fmul reassoc contract double %t84, %t85
  store double %t86, double* %reg_37_ptr
  %t87 = load double, double* %reg_30_ptr
  %t88 = load double, double* %reg_37_ptr
  %t89 = fadd reassoc contract double %t87, %t88
  store double %t89, double* %reg_38_ptr
  %t90 = load double, double* %reg_38_ptr
  store double %t90, double* %var_vBv_ptr
  %t91 = load double, double* %var_vv_ptr
  store double %t91, double* %reg_39_ptr
  %t92 = load i8*, i8** %var_v_ptr
  store i8* %t92, i8** %reg_40_ptr
  %t93 = load i64, i64* %var_i_ptr
  store i64 %t93, i64* %reg_41_ptr
  %t94 = load i8*, i8** %reg_40_ptr
  %t95 = load i64, i64* %reg_41_ptr
  %t96 = mul i64 %t95, 8
  %t97 = add i64 %t96, 16
  %t98 = getelementptr i8, i8* %t94, i64 %t97
  %t99 = bitcast i8* %t98 to double*
  %t100 = load double, double* %t99
  store double %t100, double* %reg_42_ptr
  %t101 = load i8*, i8** %var_v_ptr
  store i8* %t101, i8** %reg_43_ptr
  %t102 = load i64, i64* %var_i_ptr
  store i64 %t102, i64* %reg_44_ptr
  %t103 = load i8*, i8** %reg_43_ptr
  %t104 = load i64, i64* %reg_44_ptr
  %t105 = mul i64 %t104, 8
  %t106 = add i64 %t105, 16
  %t107 = getelementptr i8, i8* %t103, i64 %t106
  %t108 = bitcast i8* %t107 to double*
  %t109 = load double, double* %t108
  store double %t109, double* %reg_45_ptr
  %t110 = load double, double* %reg_42_ptr
  %t111 = load double, double* %reg_45_ptr
  %t112 = fmul reassoc contract double %t110, %t111
  store double %t112, double* %reg_46_ptr
  %t113 = load double, double* %reg_39_ptr
  %t114 = load double, double* %reg_46_ptr
  %t115 = fadd reassoc contract double %t113, %t114
  store double %t115, double* %reg_47_ptr
  %t116 = load double, double* %reg_47_ptr
  store double %t116, double* %var_vv_ptr
  br label %main_b11
main_b11:
  %t117 = load i64, i64* %var_i_ptr
  store i64 %t117, i64* %reg_48_ptr
  %t118 = load i64, i64* %reg_48_ptr
  %t119 = load i64, i64* %reg_27_ptr
  %t120 = add i64 %t118, %t119
  store i64 %t120, i64* %reg_49_ptr
  %t121 = load i64, i64* %reg_49_ptr
  store i64 %t121, i64* %var_i_ptr
  br label %main_b9
main_b12:
  %t122 = load double, double* %var_vBv_ptr
  store double %t122, double* %reg_50_ptr
  %t123 = load double, double* %var_vv_ptr
  store double %t123, double* %reg_51_ptr
  %t124 = load double, double* %reg_50_ptr
  %t125 = load double, double* %reg_51_ptr
  %t126 = fdiv reassoc contract double %t124, %t125
  store double %t126, double* %reg_52_ptr
  %t127 = load double, double* %reg_52_ptr
  %t128 = call double @__sys_Math_sqrt(double %t127)
  store double %t128, double* %reg_53_ptr
  %t129 = load double, double* %reg_53_ptr
  store double %t129, double* %var_result_ptr
  %t130 = load double, double* %var_result_ptr
  store double %t130, double* %reg_54_ptr
  %t131 = load double, double* %reg_54_ptr
  %t132 = call i8* @obo_f64_to_str(double %t131)
  %t133 = call i8* @obo_str_concat(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @obo.str.1, i64 0, i64 0), i8* %t132)
  store i8* %t133, i8** %reg_55_ptr
  %t134 = load i8*, i8** %reg_55_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t134)
  call void @obo_gc_pop_roots(i64 7)
  call void @obo_arena_free_all()
  ret i32 0
}

