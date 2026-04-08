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


define i64 @rt_strlen(i64 %arg0) {
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
  %var_n_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_ch_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_strlen_b1, label %rt_strlen_b2
rt_strlen_b1:
  ret i64 0
rt_strlen_b2:
  br label %rt_strlen_b3
rt_strlen_b3:
  store i64 0, i64* %var_n_ptr
  br label %rt_strlen_b4
rt_strlen_b4:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %var_n_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_3_ptr
  %t12 = load i64, i64* %reg_4_ptr
  %t13 = add i64 %t11, %t12
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = inttoptr i64 %t14 to i8*
  %t16 = load i8, i8* %t15
  %t17 = zext i8 %t16 to i64
  store i64 %t17, i64* %reg_6_ptr
  %t18 = load i64, i64* %reg_6_ptr
  store i64 %t18, i64* %var_ch_ptr
  %t19 = load i64, i64* %var_ch_ptr
  store i64 %t19, i64* %reg_7_ptr
  %t20 = load i64, i64* %reg_7_ptr
  %t21 = icmp eq i64 %t20, 0
  %t22 = zext i1 %t21 to i64
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  %t25 = icmp ne i64 %t23, 0
  %t26 = zext i1 %t25 to i64
  %t24 = icmp ne i64 %t26, 0
  br i1 %t24, label %rt_strlen_b6, label %rt_strlen_b7
rt_strlen_b5:
  ret i64 0
rt_strlen_b6:
  %t27 = load i64, i64* %var_n_ptr
  store i64 %t27, i64* %reg_9_ptr
  %t28 = load i64, i64* %reg_9_ptr
  ret i64 %t28
rt_strlen_b7:
  br label %rt_strlen_b8
rt_strlen_b8:
  %t29 = load i64, i64* %var_n_ptr
  store i64 %t29, i64* %reg_10_ptr
  %t30 = load i64, i64* %reg_10_ptr
  %t31 = add i64 %t30, 1
  store i64 %t31, i64* %reg_11_ptr
  %t32 = load i64, i64* %reg_11_ptr
  store i64 %t32, i64* %var_n_ptr
  br label %rt_strlen_b4
}

define i64 @rt_strcmp(i64 %arg0, i64 %arg1) {
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
  %var_i_ptr = alloca i64
  %var_b_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_cb_ptr = alloca i64
  %var_a_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_a_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_b_ptr
  %t2 = load i64, i64* %var_a_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %var_b_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp eq i64 %t4, %t5
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %rt_strcmp_b1, label %rt_strcmp_b2
rt_strcmp_b1:
  ret i64 0
rt_strcmp_b2:
  br label %rt_strcmp_b3
rt_strcmp_b3:
  %t12 = load i64, i64* %var_a_ptr
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  %t14 = icmp eq i64 %t13, 0
  %t15 = zext i1 %t14 to i64
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t18 = icmp ne i64 %t16, 0
  %t19 = zext i1 %t18 to i64
  %t17 = icmp ne i64 %t19, 0
  br i1 %t17, label %rt_strcmp_b4, label %rt_strcmp_b5
rt_strcmp_b4:
  %t20 = sub i64 0, 1
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  ret i64 %t21
rt_strcmp_b5:
  br label %rt_strcmp_b6
rt_strcmp_b6:
  %t22 = load i64, i64* %var_b_ptr
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  %t24 = icmp eq i64 %t23, 0
  %t25 = zext i1 %t24 to i64
  store i64 %t25, i64* %reg_9_ptr
  %t26 = load i64, i64* %reg_9_ptr
  %t28 = icmp ne i64 %t26, 0
  %t29 = zext i1 %t28 to i64
  %t27 = icmp ne i64 %t29, 0
  br i1 %t27, label %rt_strcmp_b7, label %rt_strcmp_b8
rt_strcmp_b7:
  ret i64 1
rt_strcmp_b8:
  br label %rt_strcmp_b9
rt_strcmp_b9:
  store i64 0, i64* %var_i_ptr
  br label %rt_strcmp_b10
rt_strcmp_b10:
  %t30 = load i64, i64* %var_a_ptr
  store i64 %t30, i64* %reg_10_ptr
  %t31 = load i64, i64* %var_i_ptr
  store i64 %t31, i64* %reg_11_ptr
  %t32 = load i64, i64* %reg_10_ptr
  %t33 = load i64, i64* %reg_11_ptr
  %t34 = add i64 %t32, %t33
  store i64 %t34, i64* %reg_12_ptr
  %t35 = load i64, i64* %reg_12_ptr
  %t36 = inttoptr i64 %t35 to i8*
  %t37 = load i8, i8* %t36
  %t38 = zext i8 %t37 to i64
  store i64 %t38, i64* %reg_13_ptr
  %t39 = load i64, i64* %reg_13_ptr
  store i64 %t39, i64* %var_ca_ptr
  %t40 = load i64, i64* %var_b_ptr
  store i64 %t40, i64* %reg_14_ptr
  %t41 = load i64, i64* %var_i_ptr
  store i64 %t41, i64* %reg_15_ptr
  %t42 = load i64, i64* %reg_14_ptr
  %t43 = load i64, i64* %reg_15_ptr
  %t44 = add i64 %t42, %t43
  store i64 %t44, i64* %reg_16_ptr
  %t45 = load i64, i64* %reg_16_ptr
  %t46 = inttoptr i64 %t45 to i8*
  %t47 = load i8, i8* %t46
  %t48 = zext i8 %t47 to i64
  store i64 %t48, i64* %reg_17_ptr
  %t49 = load i64, i64* %reg_17_ptr
  store i64 %t49, i64* %var_cb_ptr
  %t50 = load i64, i64* %var_ca_ptr
  store i64 %t50, i64* %reg_18_ptr
  %t51 = load i64, i64* %var_cb_ptr
  store i64 %t51, i64* %reg_19_ptr
  %t52 = load i64, i64* %reg_18_ptr
  %t53 = load i64, i64* %reg_19_ptr
  %t54 = icmp ne i64 %t52, %t53
  %t55 = zext i1 %t54 to i64
  store i64 %t55, i64* %reg_20_ptr
  %t56 = load i64, i64* %reg_20_ptr
  %t58 = icmp ne i64 %t56, 0
  %t59 = zext i1 %t58 to i64
  %t57 = icmp ne i64 %t59, 0
  br i1 %t57, label %rt_strcmp_b12, label %rt_strcmp_b13
rt_strcmp_b11:
  ret i64 0
rt_strcmp_b12:
  %t60 = load i64, i64* %var_ca_ptr
  store i64 %t60, i64* %reg_21_ptr
  %t61 = load i64, i64* %var_cb_ptr
  store i64 %t61, i64* %reg_22_ptr
  %t62 = load i64, i64* %reg_21_ptr
  %t63 = load i64, i64* %reg_22_ptr
  %t64 = sub i64 %t62, %t63
  store i64 %t64, i64* %reg_23_ptr
  %t65 = load i64, i64* %reg_23_ptr
  ret i64 %t65
rt_strcmp_b13:
  br label %rt_strcmp_b14
rt_strcmp_b14:
  %t66 = load i64, i64* %var_ca_ptr
  store i64 %t66, i64* %reg_24_ptr
  %t67 = load i64, i64* %reg_24_ptr
  %t68 = icmp eq i64 %t67, 0
  %t69 = zext i1 %t68 to i64
  store i64 %t69, i64* %reg_25_ptr
  %t70 = load i64, i64* %reg_25_ptr
  %t72 = icmp ne i64 %t70, 0
  %t73 = zext i1 %t72 to i64
  %t71 = icmp ne i64 %t73, 0
  br i1 %t71, label %rt_strcmp_b15, label %rt_strcmp_b16
rt_strcmp_b15:
  ret i64 0
rt_strcmp_b16:
  br label %rt_strcmp_b17
rt_strcmp_b17:
  %t74 = load i64, i64* %var_i_ptr
  store i64 %t74, i64* %reg_26_ptr
  %t75 = load i64, i64* %reg_26_ptr
  %t76 = add i64 %t75, 1
  store i64 %t76, i64* %reg_27_ptr
  %t77 = load i64, i64* %reg_27_ptr
  store i64 %t77, i64* %var_i_ptr
  br label %rt_strcmp_b10
}

define i64 @rt_strcpy(i64 %arg0, i64 %arg1) {
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
  %var_ch_ptr = alloca i64
  %var_dst_ptr = alloca i64
  %var_src_ptr = alloca i64
  %var_i_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_dst_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_src_ptr
  %t2 = load i64, i64* %var_src_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_strcpy_b1, label %rt_strcpy_b2
rt_strcpy_b1:
  %t10 = load i64, i64* %var_dst_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  ret i64 %t11
rt_strcpy_b2:
  br label %rt_strcpy_b3
rt_strcpy_b3:
  store i64 0, i64* %var_i_ptr
  br label %rt_strcpy_b4
rt_strcpy_b4:
  %t12 = load i64, i64* %var_src_ptr
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %var_i_ptr
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = load i64, i64* %reg_6_ptr
  %t16 = add i64 %t14, %t15
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i64, i64* %reg_7_ptr
  %t18 = inttoptr i64 %t17 to i8*
  %t19 = load i8, i8* %t18
  %t20 = zext i8 %t19 to i64
  store i64 %t20, i64* %reg_8_ptr
  %t21 = load i64, i64* %reg_8_ptr
  store i64 %t21, i64* %var_ch_ptr
  %t22 = load i64, i64* %var_dst_ptr
  store i64 %t22, i64* %reg_9_ptr
  %t23 = load i64, i64* %var_i_ptr
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_9_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t26 = add i64 %t24, %t25
  store i64 %t26, i64* %reg_11_ptr
  %t27 = load i64, i64* %var_ch_ptr
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_11_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = inttoptr i64 %t28 to i8*
  %t31 = trunc i64 %t29 to i8
  store i8 %t31, i8* %t30
  store i64 0, i64* %reg_13_ptr
  %t32 = load i64, i64* %var_ch_ptr
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t34 = icmp eq i64 %t33, 0
  %t35 = zext i1 %t34 to i64
  store i64 %t35, i64* %reg_15_ptr
  %t36 = load i64, i64* %reg_15_ptr
  %t38 = icmp ne i64 %t36, 0
  %t39 = zext i1 %t38 to i64
  %t37 = icmp ne i64 %t39, 0
  br i1 %t37, label %rt_strcpy_b6, label %rt_strcpy_b7
rt_strcpy_b5:
  ret i64 0
rt_strcpy_b6:
  %t40 = load i64, i64* %var_dst_ptr
  store i64 %t40, i64* %reg_16_ptr
  %t41 = load i64, i64* %reg_16_ptr
  ret i64 %t41
rt_strcpy_b7:
  br label %rt_strcpy_b8
rt_strcpy_b8:
  %t42 = load i64, i64* %var_i_ptr
  store i64 %t42, i64* %reg_17_ptr
  %t43 = load i64, i64* %reg_17_ptr
  %t44 = add i64 %t43, 1
  store i64 %t44, i64* %reg_18_ptr
  %t45 = load i64, i64* %reg_18_ptr
  store i64 %t45, i64* %var_i_ptr
  br label %rt_strcpy_b4
}

define i64 @rt_strdup(i64 %arg0) {
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
  %var_buf_ptr = alloca i64
  %var_len_ptr = alloca i64
  %var_src_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_src_ptr
  %t1 = load i64, i64* %var_src_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_strdup_b1, label %rt_strdup_b2
rt_strdup_b1:
  ret i64 0
rt_strdup_b2:
  br label %rt_strdup_b3
rt_strdup_b3:
  %t9 = load i64, i64* %var_src_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = call i64 @rt_strlen(i64 %t10)
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  store i64 %t12, i64* %var_len_ptr
  %t13 = load i64, i64* %var_len_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = add i64 %t14, 1
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = call i64 @__sys_pointer_alloc(i64 %t16)
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  store i64 %t18, i64* %var_buf_ptr
  %t19 = load i64, i64* %var_buf_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = icmp eq i64 %t20, 0
  %t22 = zext i1 %t21 to i64
  store i64 %t22, i64* %reg_9_ptr
  %t23 = load i64, i64* %reg_9_ptr
  %t25 = icmp ne i64 %t23, 0
  %t26 = zext i1 %t25 to i64
  %t24 = icmp ne i64 %t26, 0
  br i1 %t24, label %rt_strdup_b4, label %rt_strdup_b5
rt_strdup_b4:
  ret i64 0
rt_strdup_b5:
  br label %rt_strdup_b6
rt_strdup_b6:
  %t27 = load i64, i64* %var_buf_ptr
  store i64 %t27, i64* %reg_10_ptr
  %t28 = load i64, i64* %var_src_ptr
  store i64 %t28, i64* %reg_11_ptr
  %t29 = load i64, i64* %var_len_ptr
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %reg_12_ptr
  %t31 = add i64 %t30, 1
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_10_ptr
  %t33 = load i64, i64* %reg_11_ptr
  %t34 = load i64, i64* %reg_13_ptr
  %t35 = inttoptr i64 %t32 to i8*
  %t36 = inttoptr i64 %t33 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t35, i8* %t36, i64 %t34, i1 false)
  store i64 0, i64* %reg_14_ptr
  %t37 = load i64, i64* %var_buf_ptr
  store i64 %t37, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_15_ptr
  ret i64 %t38
}

define i64 @rt_str_concat(i64 %arg0, i64 %arg1) {
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
  %var_buf_ptr = alloca i64
  %var_lb_ptr = alloca i64
  %var_b_ptr = alloca i64
  %var_la_ptr = alloca i64
  %var_a_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_a_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_b_ptr
  %t2 = load i64, i64* %var_a_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = call i64 @rt_strlen(i64 %t3)
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  store i64 %t5, i64* %var_la_ptr
  %t6 = load i64, i64* %var_b_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = call i64 @rt_strlen(i64 %t7)
  store i64 %t8, i64* %reg_5_ptr
  %t9 = load i64, i64* %reg_5_ptr
  store i64 %t9, i64* %var_lb_ptr
  %t10 = load i64, i64* %var_la_ptr
  store i64 %t10, i64* %reg_6_ptr
  %t11 = load i64, i64* %var_lb_ptr
  store i64 %t11, i64* %reg_7_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = load i64, i64* %reg_7_ptr
  %t14 = add i64 %t12, %t13
  store i64 %t14, i64* %reg_8_ptr
  %t15 = load i64, i64* %reg_8_ptr
  %t16 = add i64 %t15, 1
  store i64 %t16, i64* %reg_9_ptr
  %t17 = load i64, i64* %reg_9_ptr
  %t18 = call i64 @__sys_pointer_alloc(i64 %t17)
  store i64 %t18, i64* %reg_10_ptr
  %t19 = load i64, i64* %reg_10_ptr
  store i64 %t19, i64* %var_buf_ptr
  %t20 = load i64, i64* %var_buf_ptr
  store i64 %t20, i64* %reg_11_ptr
  %t21 = load i64, i64* %reg_11_ptr
  %t22 = icmp eq i64 %t21, 0
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_12_ptr
  %t24 = load i64, i64* %reg_12_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %rt_str_concat_b1, label %rt_str_concat_b2
rt_str_concat_b1:
  ret i64 0
rt_str_concat_b2:
  br label %rt_str_concat_b3
rt_str_concat_b3:
  %t28 = load i64, i64* %var_la_ptr
  store i64 %t28, i64* %reg_13_ptr
  %t29 = load i64, i64* %reg_13_ptr
  %t30 = icmp sgt i64 %t29, 0
  %t31 = zext i1 %t30 to i64
  store i64 %t31, i64* %reg_14_ptr
  %t32 = load i64, i64* %reg_14_ptr
  %t34 = icmp ne i64 %t32, 0
  %t35 = zext i1 %t34 to i64
  %t33 = icmp ne i64 %t35, 0
  br i1 %t33, label %rt_str_concat_b4, label %rt_str_concat_b5
rt_str_concat_b4:
  %t36 = load i64, i64* %var_buf_ptr
  store i64 %t36, i64* %reg_15_ptr
  %t37 = load i64, i64* %var_a_ptr
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %var_la_ptr
  store i64 %t38, i64* %reg_17_ptr
  %t39 = load i64, i64* %reg_15_ptr
  %t40 = load i64, i64* %reg_16_ptr
  %t41 = load i64, i64* %reg_17_ptr
  %t42 = inttoptr i64 %t39 to i8*
  %t43 = inttoptr i64 %t40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t42, i8* %t43, i64 %t41, i1 false)
  store i64 0, i64* %reg_18_ptr
  br label %rt_str_concat_b6
rt_str_concat_b5:
  br label %rt_str_concat_b6
rt_str_concat_b6:
  %t44 = load i64, i64* %var_lb_ptr
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t46 = icmp sgt i64 %t45, 0
  %t47 = zext i1 %t46 to i64
  store i64 %t47, i64* %reg_20_ptr
  %t48 = load i64, i64* %reg_20_ptr
  %t50 = icmp ne i64 %t48, 0
  %t51 = zext i1 %t50 to i64
  %t49 = icmp ne i64 %t51, 0
  br i1 %t49, label %rt_str_concat_b7, label %rt_str_concat_b8
rt_str_concat_b7:
  %t52 = load i64, i64* %var_buf_ptr
  store i64 %t52, i64* %reg_21_ptr
  %t53 = load i64, i64* %var_la_ptr
  store i64 %t53, i64* %reg_22_ptr
  %t54 = load i64, i64* %reg_21_ptr
  %t55 = load i64, i64* %reg_22_ptr
  %t56 = add i64 %t54, %t55
  store i64 %t56, i64* %reg_23_ptr
  %t57 = load i64, i64* %var_b_ptr
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i64, i64* %var_lb_ptr
  store i64 %t58, i64* %reg_25_ptr
  %t59 = load i64, i64* %reg_23_ptr
  %t60 = load i64, i64* %reg_24_ptr
  %t61 = load i64, i64* %reg_25_ptr
  %t62 = inttoptr i64 %t59 to i8*
  %t63 = inttoptr i64 %t60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t62, i8* %t63, i64 %t61, i1 false)
  store i64 0, i64* %reg_26_ptr
  br label %rt_str_concat_b9
rt_str_concat_b8:
  br label %rt_str_concat_b9
rt_str_concat_b9:
  %t64 = load i64, i64* %var_buf_ptr
  store i64 %t64, i64* %reg_27_ptr
  %t65 = load i64, i64* %var_la_ptr
  store i64 %t65, i64* %reg_28_ptr
  %t66 = load i64, i64* %reg_27_ptr
  %t67 = load i64, i64* %reg_28_ptr
  %t68 = add i64 %t66, %t67
  store i64 %t68, i64* %reg_29_ptr
  %t69 = load i64, i64* %var_lb_ptr
  store i64 %t69, i64* %reg_30_ptr
  %t70 = load i64, i64* %reg_29_ptr
  %t71 = load i64, i64* %reg_30_ptr
  %t72 = add i64 %t70, %t71
  store i64 %t72, i64* %reg_31_ptr
  %t73 = load i64, i64* %reg_31_ptr
  %t74 = inttoptr i64 %t73 to i8*
  %t75 = trunc i64 0 to i8
  store i8 %t75, i8* %t74
  store i64 0, i64* %reg_32_ptr
  %t76 = load i64, i64* %var_buf_ptr
  store i64 %t76, i64* %reg_33_ptr
  %t77 = load i64, i64* %reg_33_ptr
  ret i64 %t77
}

define i64 @rt_i64_to_str(i64 %arg0) {
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
  %var_len_ptr = alloca i64
  %var_val_ptr = alloca i64
  %var_digit_ptr = alloca i64
  %var_tmp_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_neg_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_pos_ptr = alloca i64
  %var_result_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_n_ptr
  %t1 = load i64, i64* %var_n_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_i64_to_str_b1, label %rt_i64_to_str_b2
rt_i64_to_str_b1:
  %t9 = call i64 @__sys_pointer_alloc(i64 2)
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  store i64 %t10, i64* %var_buf_ptr
  %t11 = load i64, i64* %var_buf_ptr
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  %t13 = inttoptr i64 %t12 to i8*
  %t14 = trunc i64 48 to i8
  store i8 %t14, i8* %t13
  store i64 0, i64* %reg_5_ptr
  %t15 = load i64, i64* %var_buf_ptr
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = add i64 %t16, 1
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  %t19 = inttoptr i64 %t18 to i8*
  %t20 = trunc i64 0 to i8
  store i8 %t20, i8* %t19
  store i64 0, i64* %reg_8_ptr
  %t21 = load i64, i64* %var_buf_ptr
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  ret i64 %t22
rt_i64_to_str_b2:
  br label %rt_i64_to_str_b3
rt_i64_to_str_b3:
  %t23 = call i64 @__sys_pointer_alloc(i64 22)
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  store i64 %t24, i64* %var_tmp_ptr
  store i64 0, i64* %var_neg_ptr
  %t25 = load i64, i64* %var_n_ptr
  store i64 %t25, i64* %reg_11_ptr
  %t26 = load i64, i64* %reg_11_ptr
  store i64 %t26, i64* %var_val_ptr
  %t27 = load i64, i64* %var_val_ptr
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_12_ptr
  %t29 = icmp slt i64 %t28, 0
  %t30 = zext i1 %t29 to i64
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_13_ptr
  %t33 = icmp ne i64 %t31, 0
  %t34 = zext i1 %t33 to i64
  %t32 = icmp ne i64 %t34, 0
  br i1 %t32, label %rt_i64_to_str_b4, label %rt_i64_to_str_b5
rt_i64_to_str_b4:
  store i64 1, i64* %var_neg_ptr
  %t35 = load i64, i64* %var_val_ptr
  store i64 %t35, i64* %reg_14_ptr
  %t36 = load i64, i64* %reg_14_ptr
  %t37 = sub i64 0, %t36
  store i64 %t37, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_15_ptr
  store i64 %t38, i64* %var_val_ptr
  br label %rt_i64_to_str_b6
rt_i64_to_str_b5:
  br label %rt_i64_to_str_b6
rt_i64_to_str_b6:
  store i64 21, i64* %var_pos_ptr
  %t39 = load i64, i64* %var_tmp_ptr
  store i64 %t39, i64* %reg_16_ptr
  %t40 = load i64, i64* %var_pos_ptr
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i64, i64* %reg_16_ptr
  %t42 = load i64, i64* %reg_17_ptr
  %t43 = add i64 %t41, %t42
  store i64 %t43, i64* %reg_18_ptr
  %t44 = load i64, i64* %reg_18_ptr
  %t45 = inttoptr i64 %t44 to i8*
  %t46 = trunc i64 0 to i8
  store i8 %t46, i8* %t45
  store i64 0, i64* %reg_19_ptr
  br label %rt_i64_to_str_b7
rt_i64_to_str_b7:
  %t47 = load i64, i64* %var_val_ptr
  store i64 %t47, i64* %reg_20_ptr
  %t48 = load i64, i64* %reg_20_ptr
  %t49 = icmp eq i64 %t48, 0
  %t50 = zext i1 %t49 to i64
  store i64 %t50, i64* %reg_21_ptr
  %t51 = load i64, i64* %reg_21_ptr
  %t53 = icmp ne i64 %t51, 0
  %t54 = zext i1 %t53 to i64
  %t52 = icmp ne i64 %t54, 0
  br i1 %t52, label %rt_i64_to_str_b9, label %rt_i64_to_str_b10
rt_i64_to_str_b8:
  %t55 = load i64, i64* %var_neg_ptr
  store i64 %t55, i64* %reg_37_ptr
  %t56 = load i64, i64* %reg_37_ptr
  %t57 = icmp eq i64 %t56, 1
  %t58 = zext i1 %t57 to i64
  store i64 %t58, i64* %reg_38_ptr
  %t59 = load i64, i64* %reg_38_ptr
  %t61 = icmp ne i64 %t59, 0
  %t62 = zext i1 %t61 to i64
  %t60 = icmp ne i64 %t62, 0
  br i1 %t60, label %rt_i64_to_str_b12, label %rt_i64_to_str_b13
rt_i64_to_str_b9:
  br label %rt_i64_to_str_b8
rt_i64_to_str_b10:
  br label %rt_i64_to_str_b11
rt_i64_to_str_b11:
  %t63 = load i64, i64* %var_pos_ptr
  store i64 %t63, i64* %reg_22_ptr
  %t64 = load i64, i64* %reg_22_ptr
  %t65 = sub i64 %t64, 1
  store i64 %t65, i64* %reg_23_ptr
  %t66 = load i64, i64* %reg_23_ptr
  store i64 %t66, i64* %var_pos_ptr
  %t67 = load i64, i64* %var_val_ptr
  store i64 %t67, i64* %reg_24_ptr
  %t68 = load i64, i64* %var_val_ptr
  store i64 %t68, i64* %reg_25_ptr
  %t69 = load i64, i64* %reg_25_ptr
  %t70 = call i64 @obo_safe_div(i64 %t69, i64 10)
  store i64 %t70, i64* %reg_26_ptr
  %t71 = load i64, i64* %reg_26_ptr
  %t72 = mul i64 %t71, 10
  store i64 %t72, i64* %reg_27_ptr
  %t73 = load i64, i64* %reg_24_ptr
  %t74 = load i64, i64* %reg_27_ptr
  %t75 = sub i64 %t73, %t74
  store i64 %t75, i64* %reg_28_ptr
  %t76 = load i64, i64* %reg_28_ptr
  store i64 %t76, i64* %var_digit_ptr
  %t77 = load i64, i64* %var_tmp_ptr
  store i64 %t77, i64* %reg_29_ptr
  %t78 = load i64, i64* %var_pos_ptr
  store i64 %t78, i64* %reg_30_ptr
  %t79 = load i64, i64* %reg_29_ptr
  %t80 = load i64, i64* %reg_30_ptr
  %t81 = add i64 %t79, %t80
  store i64 %t81, i64* %reg_31_ptr
  %t82 = load i64, i64* %var_digit_ptr
  store i64 %t82, i64* %reg_32_ptr
  %t83 = load i64, i64* %reg_32_ptr
  %t84 = add i64 48, %t83
  store i64 %t84, i64* %reg_33_ptr
  %t85 = load i64, i64* %reg_31_ptr
  %t86 = load i64, i64* %reg_33_ptr
  %t87 = inttoptr i64 %t85 to i8*
  %t88 = trunc i64 %t86 to i8
  store i8 %t88, i8* %t87
  store i64 0, i64* %reg_34_ptr
  %t89 = load i64, i64* %var_val_ptr
  store i64 %t89, i64* %reg_35_ptr
  %t90 = load i64, i64* %reg_35_ptr
  %t91 = call i64 @obo_safe_div(i64 %t90, i64 10)
  store i64 %t91, i64* %reg_36_ptr
  %t92 = load i64, i64* %reg_36_ptr
  store i64 %t92, i64* %var_val_ptr
  br label %rt_i64_to_str_b7
rt_i64_to_str_b12:
  %t93 = load i64, i64* %var_pos_ptr
  store i64 %t93, i64* %reg_39_ptr
  %t94 = load i64, i64* %reg_39_ptr
  %t95 = sub i64 %t94, 1
  store i64 %t95, i64* %reg_40_ptr
  %t96 = load i64, i64* %reg_40_ptr
  store i64 %t96, i64* %var_pos_ptr
  %t97 = load i64, i64* %var_tmp_ptr
  store i64 %t97, i64* %reg_41_ptr
  %t98 = load i64, i64* %var_pos_ptr
  store i64 %t98, i64* %reg_42_ptr
  %t99 = load i64, i64* %reg_41_ptr
  %t100 = load i64, i64* %reg_42_ptr
  %t101 = add i64 %t99, %t100
  store i64 %t101, i64* %reg_43_ptr
  %t102 = load i64, i64* %reg_43_ptr
  %t103 = inttoptr i64 %t102 to i8*
  %t104 = trunc i64 45 to i8
  store i8 %t104, i8* %t103
  store i64 0, i64* %reg_44_ptr
  br label %rt_i64_to_str_b14
rt_i64_to_str_b13:
  br label %rt_i64_to_str_b14
rt_i64_to_str_b14:
  %t105 = load i64, i64* %var_pos_ptr
  store i64 %t105, i64* %reg_45_ptr
  %t106 = load i64, i64* %reg_45_ptr
  %t107 = sub i64 21, %t106
  store i64 %t107, i64* %reg_46_ptr
  %t108 = load i64, i64* %reg_46_ptr
  store i64 %t108, i64* %var_len_ptr
  %t109 = load i64, i64* %var_len_ptr
  store i64 %t109, i64* %reg_47_ptr
  %t110 = load i64, i64* %reg_47_ptr
  %t111 = add i64 %t110, 1
  store i64 %t111, i64* %reg_48_ptr
  %t112 = load i64, i64* %reg_48_ptr
  %t113 = call i64 @__sys_pointer_alloc(i64 %t112)
  store i64 %t113, i64* %reg_49_ptr
  %t114 = load i64, i64* %reg_49_ptr
  store i64 %t114, i64* %var_result_ptr
  %t115 = load i64, i64* %var_result_ptr
  store i64 %t115, i64* %reg_50_ptr
  %t116 = load i64, i64* %var_tmp_ptr
  store i64 %t116, i64* %reg_51_ptr
  %t117 = load i64, i64* %var_pos_ptr
  store i64 %t117, i64* %reg_52_ptr
  %t118 = load i64, i64* %reg_51_ptr
  %t119 = load i64, i64* %reg_52_ptr
  %t120 = add i64 %t118, %t119
  store i64 %t120, i64* %reg_53_ptr
  %t121 = load i64, i64* %var_len_ptr
  store i64 %t121, i64* %reg_54_ptr
  %t122 = load i64, i64* %reg_54_ptr
  %t123 = add i64 %t122, 1
  store i64 %t123, i64* %reg_55_ptr
  %t124 = load i64, i64* %reg_50_ptr
  %t125 = load i64, i64* %reg_53_ptr
  %t126 = load i64, i64* %reg_55_ptr
  %t127 = inttoptr i64 %t124 to i8*
  %t128 = inttoptr i64 %t125 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t127, i8* %t128, i64 %t126, i1 false)
  store i64 0, i64* %reg_56_ptr
  %t129 = load i64, i64* %var_tmp_ptr
  store i64 %t129, i64* %reg_57_ptr
  %t130 = load i64, i64* %reg_57_ptr
  %t131 = call i64 @__sys_pointer_free(i64 %t130)
  store i64 %t131, i64* %reg_58_ptr
  %t132 = load i64, i64* %var_result_ptr
  store i64 %t132, i64* %reg_59_ptr
  %t133 = load i64, i64* %reg_59_ptr
  ret i64 %t133
}

define i64 @rt_str_truthy(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_s_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_str_truthy_b1, label %rt_str_truthy_b2
rt_str_truthy_b1:
  ret i64 0
rt_str_truthy_b2:
  br label %rt_str_truthy_b3
rt_str_truthy_b3:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = inttoptr i64 %t10 to i8*
  %t12 = load i8, i8* %t11
  %t13 = zext i8 %t12 to i64
  store i64 %t13, i64* %reg_4_ptr
  %t14 = load i64, i64* %reg_4_ptr
  store i64 %t14, i64* %var_ch_ptr
  %t15 = load i64, i64* %var_ch_ptr
  store i64 %t15, i64* %reg_5_ptr
  %t16 = load i64, i64* %reg_5_ptr
  %t17 = icmp eq i64 %t16, 0
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_6_ptr
  %t19 = load i64, i64* %reg_6_ptr
  %t21 = icmp ne i64 %t19, 0
  %t22 = zext i1 %t21 to i64
  %t20 = icmp ne i64 %t22, 0
  br i1 %t20, label %rt_str_truthy_b4, label %rt_str_truthy_b5
rt_str_truthy_b4:
  ret i64 0
rt_str_truthy_b5:
  br label %rt_str_truthy_b6
rt_str_truthy_b6:
  ret i64 1
}

define i64 @rt_str_contains(i64 %arg0, i64 %arg1) {
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
  %var_needle_ptr = alloca i64
  %var_cb_ptr = alloca i64
  %var_limit_ptr = alloca i64
  %var_matched_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_haystack_ptr = alloca i64
  %var_nlen_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_hlen_ptr = alloca i64
  %var_j_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_haystack_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_needle_ptr
  %t2 = load i64, i64* %var_haystack_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_str_contains_b1, label %rt_str_contains_b2
rt_str_contains_b1:
  ret i64 0
rt_str_contains_b2:
  br label %rt_str_contains_b3
rt_str_contains_b3:
  %t10 = load i64, i64* %var_needle_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  %t12 = icmp eq i64 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t16 = icmp ne i64 %t14, 0
  %t17 = zext i1 %t16 to i64
  %t15 = icmp ne i64 %t17, 0
  br i1 %t15, label %rt_str_contains_b4, label %rt_str_contains_b5
rt_str_contains_b4:
  ret i64 1
rt_str_contains_b5:
  br label %rt_str_contains_b6
rt_str_contains_b6:
  %t18 = load i64, i64* %var_needle_ptr
  store i64 %t18, i64* %reg_6_ptr
  %t19 = load i64, i64* %reg_6_ptr
  %t20 = call i64 @rt_strlen(i64 %t19)
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  store i64 %t21, i64* %var_nlen_ptr
  %t22 = load i64, i64* %var_nlen_ptr
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  %t24 = icmp eq i64 %t23, 0
  %t25 = zext i1 %t24 to i64
  store i64 %t25, i64* %reg_9_ptr
  %t26 = load i64, i64* %reg_9_ptr
  %t28 = icmp ne i64 %t26, 0
  %t29 = zext i1 %t28 to i64
  %t27 = icmp ne i64 %t29, 0
  br i1 %t27, label %rt_str_contains_b7, label %rt_str_contains_b8
rt_str_contains_b7:
  ret i64 1
rt_str_contains_b8:
  br label %rt_str_contains_b9
rt_str_contains_b9:
  %t30 = load i64, i64* %var_haystack_ptr
  store i64 %t30, i64* %reg_10_ptr
  %t31 = load i64, i64* %reg_10_ptr
  %t32 = call i64 @rt_strlen(i64 %t31)
  store i64 %t32, i64* %reg_11_ptr
  %t33 = load i64, i64* %reg_11_ptr
  store i64 %t33, i64* %var_hlen_ptr
  %t34 = load i64, i64* %var_nlen_ptr
  store i64 %t34, i64* %reg_12_ptr
  %t35 = load i64, i64* %var_hlen_ptr
  store i64 %t35, i64* %reg_13_ptr
  %t36 = load i64, i64* %reg_12_ptr
  %t37 = load i64, i64* %reg_13_ptr
  %t38 = icmp sgt i64 %t36, %t37
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_14_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %rt_str_contains_b10, label %rt_str_contains_b11
rt_str_contains_b10:
  ret i64 0
rt_str_contains_b11:
  br label %rt_str_contains_b12
rt_str_contains_b12:
  store i64 0, i64* %var_i_ptr
  %t44 = load i64, i64* %var_hlen_ptr
  store i64 %t44, i64* %reg_15_ptr
  %t45 = load i64, i64* %var_nlen_ptr
  store i64 %t45, i64* %reg_16_ptr
  %t46 = load i64, i64* %reg_15_ptr
  %t47 = load i64, i64* %reg_16_ptr
  %t48 = sub i64 %t46, %t47
  store i64 %t48, i64* %reg_17_ptr
  %t49 = load i64, i64* %reg_17_ptr
  store i64 %t49, i64* %var_limit_ptr
  br label %rt_str_contains_b13
rt_str_contains_b13:
  %t50 = load i64, i64* %var_i_ptr
  store i64 %t50, i64* %reg_18_ptr
  %t51 = load i64, i64* %var_limit_ptr
  store i64 %t51, i64* %reg_19_ptr
  %t52 = load i64, i64* %reg_18_ptr
  %t53 = load i64, i64* %reg_19_ptr
  %t54 = icmp sgt i64 %t52, %t53
  %t55 = zext i1 %t54 to i64
  store i64 %t55, i64* %reg_20_ptr
  %t56 = load i64, i64* %reg_20_ptr
  %t58 = icmp ne i64 %t56, 0
  %t59 = zext i1 %t58 to i64
  %t57 = icmp ne i64 %t59, 0
  br i1 %t57, label %rt_str_contains_b15, label %rt_str_contains_b16
rt_str_contains_b14:
  ret i64 0
rt_str_contains_b15:
  ret i64 0
rt_str_contains_b16:
  br label %rt_str_contains_b17
rt_str_contains_b17:
  store i64 0, i64* %var_j_ptr
  store i64 1, i64* %var_matched_ptr
  br label %rt_str_contains_b18
rt_str_contains_b18:
  %t60 = load i64, i64* %var_j_ptr
  store i64 %t60, i64* %reg_21_ptr
  %t61 = load i64, i64* %var_nlen_ptr
  store i64 %t61, i64* %reg_22_ptr
  %t62 = load i64, i64* %reg_21_ptr
  %t63 = load i64, i64* %reg_22_ptr
  %t64 = icmp sge i64 %t62, %t63
  %t65 = zext i1 %t64 to i64
  store i64 %t65, i64* %reg_23_ptr
  %t66 = load i64, i64* %reg_23_ptr
  %t68 = icmp ne i64 %t66, 0
  %t69 = zext i1 %t68 to i64
  %t67 = icmp ne i64 %t69, 0
  br i1 %t67, label %rt_str_contains_b20, label %rt_str_contains_b21
rt_str_contains_b19:
  %t70 = load i64, i64* %var_matched_ptr
  store i64 %t70, i64* %reg_39_ptr
  %t71 = load i64, i64* %reg_39_ptr
  %t72 = icmp eq i64 %t71, 1
  %t73 = zext i1 %t72 to i64
  store i64 %t73, i64* %reg_40_ptr
  %t74 = load i64, i64* %reg_40_ptr
  %t76 = icmp ne i64 %t74, 0
  %t77 = zext i1 %t76 to i64
  %t75 = icmp ne i64 %t77, 0
  br i1 %t75, label %rt_str_contains_b26, label %rt_str_contains_b27
rt_str_contains_b20:
  br label %rt_str_contains_b19
rt_str_contains_b21:
  br label %rt_str_contains_b22
rt_str_contains_b22:
  %t78 = load i64, i64* %var_haystack_ptr
  store i64 %t78, i64* %reg_24_ptr
  %t79 = load i64, i64* %var_i_ptr
  store i64 %t79, i64* %reg_25_ptr
  %t80 = load i64, i64* %reg_24_ptr
  %t81 = load i64, i64* %reg_25_ptr
  %t82 = add i64 %t80, %t81
  store i64 %t82, i64* %reg_26_ptr
  %t83 = load i64, i64* %var_j_ptr
  store i64 %t83, i64* %reg_27_ptr
  %t84 = load i64, i64* %reg_26_ptr
  %t85 = load i64, i64* %reg_27_ptr
  %t86 = add i64 %t84, %t85
  store i64 %t86, i64* %reg_28_ptr
  %t87 = load i64, i64* %reg_28_ptr
  %t88 = inttoptr i64 %t87 to i8*
  %t89 = load i8, i8* %t88
  %t90 = zext i8 %t89 to i64
  store i64 %t90, i64* %reg_29_ptr
  %t91 = load i64, i64* %reg_29_ptr
  store i64 %t91, i64* %var_ca_ptr
  %t92 = load i64, i64* %var_needle_ptr
  store i64 %t92, i64* %reg_30_ptr
  %t93 = load i64, i64* %var_j_ptr
  store i64 %t93, i64* %reg_31_ptr
  %t94 = load i64, i64* %reg_30_ptr
  %t95 = load i64, i64* %reg_31_ptr
  %t96 = add i64 %t94, %t95
  store i64 %t96, i64* %reg_32_ptr
  %t97 = load i64, i64* %reg_32_ptr
  %t98 = inttoptr i64 %t97 to i8*
  %t99 = load i8, i8* %t98
  %t100 = zext i8 %t99 to i64
  store i64 %t100, i64* %reg_33_ptr
  %t101 = load i64, i64* %reg_33_ptr
  store i64 %t101, i64* %var_cb_ptr
  %t102 = load i64, i64* %var_ca_ptr
  store i64 %t102, i64* %reg_34_ptr
  %t103 = load i64, i64* %var_cb_ptr
  store i64 %t103, i64* %reg_35_ptr
  %t104 = load i64, i64* %reg_34_ptr
  %t105 = load i64, i64* %reg_35_ptr
  %t106 = icmp ne i64 %t104, %t105
  %t107 = zext i1 %t106 to i64
  store i64 %t107, i64* %reg_36_ptr
  %t108 = load i64, i64* %reg_36_ptr
  %t110 = icmp ne i64 %t108, 0
  %t111 = zext i1 %t110 to i64
  %t109 = icmp ne i64 %t111, 0
  br i1 %t109, label %rt_str_contains_b23, label %rt_str_contains_b24
rt_str_contains_b23:
  store i64 0, i64* %var_matched_ptr
  br label %rt_str_contains_b19
rt_str_contains_b24:
  br label %rt_str_contains_b25
rt_str_contains_b25:
  %t112 = load i64, i64* %var_j_ptr
  store i64 %t112, i64* %reg_37_ptr
  %t113 = load i64, i64* %reg_37_ptr
  %t114 = add i64 %t113, 1
  store i64 %t114, i64* %reg_38_ptr
  %t115 = load i64, i64* %reg_38_ptr
  store i64 %t115, i64* %var_j_ptr
  br label %rt_str_contains_b18
rt_str_contains_b26:
  ret i64 1
rt_str_contains_b27:
  br label %rt_str_contains_b28
rt_str_contains_b28:
  %t116 = load i64, i64* %var_i_ptr
  store i64 %t116, i64* %reg_41_ptr
  %t117 = load i64, i64* %reg_41_ptr
  %t118 = add i64 %t117, 1
  store i64 %t118, i64* %reg_42_ptr
  %t119 = load i64, i64* %reg_42_ptr
  store i64 %t119, i64* %var_i_ptr
  br label %rt_str_contains_b13
}

define i64 @rt_str_indexOf(i64 %arg0, i64 %arg1) {
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
  %var_haystack_ptr = alloca i64
  %var_nlen_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_limit_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_hlen_ptr = alloca i64
  %var_matched_ptr = alloca i64
  %var_cb_ptr = alloca i64
  %var_j_ptr = alloca i64
  %var_needle_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_haystack_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_needle_ptr
  %t2 = load i64, i64* %var_haystack_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_str_indexOf_b1, label %rt_str_indexOf_b2
rt_str_indexOf_b1:
  %t10 = sub i64 0, 1
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  ret i64 %t11
rt_str_indexOf_b2:
  br label %rt_str_indexOf_b3
rt_str_indexOf_b3:
  %t12 = load i64, i64* %var_needle_ptr
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  %t14 = icmp eq i64 %t13, 0
  %t15 = zext i1 %t14 to i64
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t18 = icmp ne i64 %t16, 0
  %t19 = zext i1 %t18 to i64
  %t17 = icmp ne i64 %t19, 0
  br i1 %t17, label %rt_str_indexOf_b4, label %rt_str_indexOf_b5
rt_str_indexOf_b4:
  ret i64 0
rt_str_indexOf_b5:
  br label %rt_str_indexOf_b6
rt_str_indexOf_b6:
  %t20 = load i64, i64* %var_needle_ptr
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  %t22 = call i64 @rt_strlen(i64 %t21)
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  store i64 %t23, i64* %var_nlen_ptr
  %t24 = load i64, i64* %var_nlen_ptr
  store i64 %t24, i64* %reg_9_ptr
  %t25 = load i64, i64* %reg_9_ptr
  %t26 = icmp eq i64 %t25, 0
  %t27 = zext i1 %t26 to i64
  store i64 %t27, i64* %reg_10_ptr
  %t28 = load i64, i64* %reg_10_ptr
  %t30 = icmp ne i64 %t28, 0
  %t31 = zext i1 %t30 to i64
  %t29 = icmp ne i64 %t31, 0
  br i1 %t29, label %rt_str_indexOf_b7, label %rt_str_indexOf_b8
rt_str_indexOf_b7:
  ret i64 0
rt_str_indexOf_b8:
  br label %rt_str_indexOf_b9
rt_str_indexOf_b9:
  %t32 = load i64, i64* %var_haystack_ptr
  store i64 %t32, i64* %reg_11_ptr
  %t33 = load i64, i64* %reg_11_ptr
  %t34 = call i64 @rt_strlen(i64 %t33)
  store i64 %t34, i64* %reg_12_ptr
  %t35 = load i64, i64* %reg_12_ptr
  store i64 %t35, i64* %var_hlen_ptr
  %t36 = load i64, i64* %var_nlen_ptr
  store i64 %t36, i64* %reg_13_ptr
  %t37 = load i64, i64* %var_hlen_ptr
  store i64 %t37, i64* %reg_14_ptr
  %t38 = load i64, i64* %reg_13_ptr
  %t39 = load i64, i64* %reg_14_ptr
  %t40 = icmp sgt i64 %t38, %t39
  %t41 = zext i1 %t40 to i64
  store i64 %t41, i64* %reg_15_ptr
  %t42 = load i64, i64* %reg_15_ptr
  %t44 = icmp ne i64 %t42, 0
  %t45 = zext i1 %t44 to i64
  %t43 = icmp ne i64 %t45, 0
  br i1 %t43, label %rt_str_indexOf_b10, label %rt_str_indexOf_b11
rt_str_indexOf_b10:
  %t46 = sub i64 0, 1
  store i64 %t46, i64* %reg_16_ptr
  %t47 = load i64, i64* %reg_16_ptr
  ret i64 %t47
rt_str_indexOf_b11:
  br label %rt_str_indexOf_b12
rt_str_indexOf_b12:
  store i64 0, i64* %var_i_ptr
  %t48 = load i64, i64* %var_hlen_ptr
  store i64 %t48, i64* %reg_17_ptr
  %t49 = load i64, i64* %var_nlen_ptr
  store i64 %t49, i64* %reg_18_ptr
  %t50 = load i64, i64* %reg_17_ptr
  %t51 = load i64, i64* %reg_18_ptr
  %t52 = sub i64 %t50, %t51
  store i64 %t52, i64* %reg_19_ptr
  %t53 = load i64, i64* %reg_19_ptr
  store i64 %t53, i64* %var_limit_ptr
  br label %rt_str_indexOf_b13
rt_str_indexOf_b13:
  %t54 = load i64, i64* %var_i_ptr
  store i64 %t54, i64* %reg_20_ptr
  %t55 = load i64, i64* %var_limit_ptr
  store i64 %t55, i64* %reg_21_ptr
  %t56 = load i64, i64* %reg_20_ptr
  %t57 = load i64, i64* %reg_21_ptr
  %t58 = icmp sgt i64 %t56, %t57
  %t59 = zext i1 %t58 to i64
  store i64 %t59, i64* %reg_22_ptr
  %t60 = load i64, i64* %reg_22_ptr
  %t62 = icmp ne i64 %t60, 0
  %t63 = zext i1 %t62 to i64
  %t61 = icmp ne i64 %t63, 0
  br i1 %t61, label %rt_str_indexOf_b15, label %rt_str_indexOf_b16
rt_str_indexOf_b14:
  ret i64 0
rt_str_indexOf_b15:
  %t64 = sub i64 0, 1
  store i64 %t64, i64* %reg_23_ptr
  %t65 = load i64, i64* %reg_23_ptr
  ret i64 %t65
rt_str_indexOf_b16:
  br label %rt_str_indexOf_b17
rt_str_indexOf_b17:
  store i64 0, i64* %var_j_ptr
  store i64 1, i64* %var_matched_ptr
  br label %rt_str_indexOf_b18
rt_str_indexOf_b18:
  %t66 = load i64, i64* %var_j_ptr
  store i64 %t66, i64* %reg_24_ptr
  %t67 = load i64, i64* %var_nlen_ptr
  store i64 %t67, i64* %reg_25_ptr
  %t68 = load i64, i64* %reg_24_ptr
  %t69 = load i64, i64* %reg_25_ptr
  %t70 = icmp sge i64 %t68, %t69
  %t71 = zext i1 %t70 to i64
  store i64 %t71, i64* %reg_26_ptr
  %t72 = load i64, i64* %reg_26_ptr
  %t74 = icmp ne i64 %t72, 0
  %t75 = zext i1 %t74 to i64
  %t73 = icmp ne i64 %t75, 0
  br i1 %t73, label %rt_str_indexOf_b20, label %rt_str_indexOf_b21
rt_str_indexOf_b19:
  %t76 = load i64, i64* %var_matched_ptr
  store i64 %t76, i64* %reg_42_ptr
  %t77 = load i64, i64* %reg_42_ptr
  %t78 = icmp eq i64 %t77, 1
  %t79 = zext i1 %t78 to i64
  store i64 %t79, i64* %reg_43_ptr
  %t80 = load i64, i64* %reg_43_ptr
  %t82 = icmp ne i64 %t80, 0
  %t83 = zext i1 %t82 to i64
  %t81 = icmp ne i64 %t83, 0
  br i1 %t81, label %rt_str_indexOf_b26, label %rt_str_indexOf_b27
rt_str_indexOf_b20:
  br label %rt_str_indexOf_b19
rt_str_indexOf_b21:
  br label %rt_str_indexOf_b22
rt_str_indexOf_b22:
  %t84 = load i64, i64* %var_haystack_ptr
  store i64 %t84, i64* %reg_27_ptr
  %t85 = load i64, i64* %var_i_ptr
  store i64 %t85, i64* %reg_28_ptr
  %t86 = load i64, i64* %reg_27_ptr
  %t87 = load i64, i64* %reg_28_ptr
  %t88 = add i64 %t86, %t87
  store i64 %t88, i64* %reg_29_ptr
  %t89 = load i64, i64* %var_j_ptr
  store i64 %t89, i64* %reg_30_ptr
  %t90 = load i64, i64* %reg_29_ptr
  %t91 = load i64, i64* %reg_30_ptr
  %t92 = add i64 %t90, %t91
  store i64 %t92, i64* %reg_31_ptr
  %t93 = load i64, i64* %reg_31_ptr
  %t94 = inttoptr i64 %t93 to i8*
  %t95 = load i8, i8* %t94
  %t96 = zext i8 %t95 to i64
  store i64 %t96, i64* %reg_32_ptr
  %t97 = load i64, i64* %reg_32_ptr
  store i64 %t97, i64* %var_ca_ptr
  %t98 = load i64, i64* %var_needle_ptr
  store i64 %t98, i64* %reg_33_ptr
  %t99 = load i64, i64* %var_j_ptr
  store i64 %t99, i64* %reg_34_ptr
  %t100 = load i64, i64* %reg_33_ptr
  %t101 = load i64, i64* %reg_34_ptr
  %t102 = add i64 %t100, %t101
  store i64 %t102, i64* %reg_35_ptr
  %t103 = load i64, i64* %reg_35_ptr
  %t104 = inttoptr i64 %t103 to i8*
  %t105 = load i8, i8* %t104
  %t106 = zext i8 %t105 to i64
  store i64 %t106, i64* %reg_36_ptr
  %t107 = load i64, i64* %reg_36_ptr
  store i64 %t107, i64* %var_cb_ptr
  %t108 = load i64, i64* %var_ca_ptr
  store i64 %t108, i64* %reg_37_ptr
  %t109 = load i64, i64* %var_cb_ptr
  store i64 %t109, i64* %reg_38_ptr
  %t110 = load i64, i64* %reg_37_ptr
  %t111 = load i64, i64* %reg_38_ptr
  %t112 = icmp ne i64 %t110, %t111
  %t113 = zext i1 %t112 to i64
  store i64 %t113, i64* %reg_39_ptr
  %t114 = load i64, i64* %reg_39_ptr
  %t116 = icmp ne i64 %t114, 0
  %t117 = zext i1 %t116 to i64
  %t115 = icmp ne i64 %t117, 0
  br i1 %t115, label %rt_str_indexOf_b23, label %rt_str_indexOf_b24
rt_str_indexOf_b23:
  store i64 0, i64* %var_matched_ptr
  br label %rt_str_indexOf_b19
rt_str_indexOf_b24:
  br label %rt_str_indexOf_b25
rt_str_indexOf_b25:
  %t118 = load i64, i64* %var_j_ptr
  store i64 %t118, i64* %reg_40_ptr
  %t119 = load i64, i64* %reg_40_ptr
  %t120 = add i64 %t119, 1
  store i64 %t120, i64* %reg_41_ptr
  %t121 = load i64, i64* %reg_41_ptr
  store i64 %t121, i64* %var_j_ptr
  br label %rt_str_indexOf_b18
rt_str_indexOf_b26:
  %t122 = load i64, i64* %var_i_ptr
  store i64 %t122, i64* %reg_44_ptr
  %t123 = load i64, i64* %reg_44_ptr
  ret i64 %t123
rt_str_indexOf_b27:
  br label %rt_str_indexOf_b28
rt_str_indexOf_b28:
  %t124 = load i64, i64* %var_i_ptr
  store i64 %t124, i64* %reg_45_ptr
  %t125 = load i64, i64* %reg_45_ptr
  %t126 = add i64 %t125, 1
  store i64 %t126, i64* %reg_46_ptr
  %t127 = load i64, i64* %reg_46_ptr
  store i64 %t127, i64* %var_i_ptr
  br label %rt_str_indexOf_b13
}

define i64 @rt_str_substring(i64 %arg0, i64 %arg1, i64 %arg2) {
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
  %var_slen_ptr = alloca i64
  %var_lo_ptr = alloca i64
  %var_hi_ptr = alloca i64
  %var_start_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_end_ptr = alloca i64
  %var_buf_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_start_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_end_ptr
  %t3 = load i64, i64* %var_s_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_3_ptr
  %t5 = icmp eq i64 %t4, 0
  %t6 = zext i1 %t5 to i64
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t9 = icmp ne i64 %t7, 0
  %t10 = zext i1 %t9 to i64
  %t8 = icmp ne i64 %t10, 0
  br i1 %t8, label %rt_str_substring_b1, label %rt_str_substring_b2
rt_str_substring_b1:
  ret i64 0
rt_str_substring_b2:
  br label %rt_str_substring_b3
rt_str_substring_b3:
  %t11 = load i64, i64* %var_s_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t13 = call i64 @rt_strlen(i64 %t12)
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_6_ptr
  store i64 %t14, i64* %var_slen_ptr
  %t15 = load i64, i64* %var_start_ptr
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_7_ptr
  store i64 %t16, i64* %var_lo_ptr
  %t17 = load i64, i64* %var_end_ptr
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  store i64 %t18, i64* %var_hi_ptr
  %t19 = load i64, i64* %var_lo_ptr
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_9_ptr
  %t21 = icmp slt i64 %t20, 0
  %t22 = zext i1 %t21 to i64
  store i64 %t22, i64* %reg_10_ptr
  %t23 = load i64, i64* %reg_10_ptr
  %t25 = icmp ne i64 %t23, 0
  %t26 = zext i1 %t25 to i64
  %t24 = icmp ne i64 %t26, 0
  br i1 %t24, label %rt_str_substring_b4, label %rt_str_substring_b5
rt_str_substring_b4:
  store i64 0, i64* %var_lo_ptr
  br label %rt_str_substring_b6
rt_str_substring_b5:
  br label %rt_str_substring_b6
rt_str_substring_b6:
  %t27 = load i64, i64* %var_hi_ptr
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %var_slen_ptr
  store i64 %t28, i64* %reg_12_ptr
  %t29 = load i64, i64* %reg_11_ptr
  %t30 = load i64, i64* %reg_12_ptr
  %t31 = icmp sgt i64 %t29, %t30
  %t32 = zext i1 %t31 to i64
  store i64 %t32, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_13_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %rt_str_substring_b7, label %rt_str_substring_b8
rt_str_substring_b7:
  %t37 = load i64, i64* %var_slen_ptr
  store i64 %t37, i64* %reg_14_ptr
  %t38 = load i64, i64* %reg_14_ptr
  store i64 %t38, i64* %var_hi_ptr
  br label %rt_str_substring_b9
rt_str_substring_b8:
  br label %rt_str_substring_b9
rt_str_substring_b9:
  %t39 = load i64, i64* %var_lo_ptr
  store i64 %t39, i64* %reg_15_ptr
  %t40 = load i64, i64* %var_hi_ptr
  store i64 %t40, i64* %reg_16_ptr
  %t41 = load i64, i64* %reg_15_ptr
  %t42 = load i64, i64* %reg_16_ptr
  %t43 = icmp sge i64 %t41, %t42
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_17_ptr
  %t45 = load i64, i64* %reg_17_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %rt_str_substring_b10, label %rt_str_substring_b11
rt_str_substring_b10:
  %t49 = call i64 @__sys_pointer_alloc(i64 1)
  store i64 %t49, i64* %reg_18_ptr
  %t50 = load i64, i64* %reg_18_ptr
  store i64 %t50, i64* %var_buf_ptr
  %t51 = load i64, i64* %var_buf_ptr
  store i64 %t51, i64* %reg_19_ptr
  %t52 = load i64, i64* %reg_19_ptr
  %t53 = inttoptr i64 %t52 to i8*
  %t54 = trunc i64 0 to i8
  store i8 %t54, i8* %t53
  store i64 0, i64* %reg_20_ptr
  %t55 = load i64, i64* %var_buf_ptr
  store i64 %t55, i64* %reg_21_ptr
  %t56 = load i64, i64* %reg_21_ptr
  ret i64 %t56
rt_str_substring_b11:
  br label %rt_str_substring_b12
rt_str_substring_b12:
  %t57 = load i64, i64* %var_hi_ptr
  store i64 %t57, i64* %reg_22_ptr
  %t58 = load i64, i64* %var_lo_ptr
  store i64 %t58, i64* %reg_23_ptr
  %t59 = load i64, i64* %reg_22_ptr
  %t60 = load i64, i64* %reg_23_ptr
  %t61 = sub i64 %t59, %t60
  store i64 %t61, i64* %reg_24_ptr
  %t62 = load i64, i64* %reg_24_ptr
  store i64 %t62, i64* %var_n_ptr
  %t63 = load i64, i64* %var_n_ptr
  store i64 %t63, i64* %reg_25_ptr
  %t64 = load i64, i64* %reg_25_ptr
  %t65 = add i64 %t64, 1
  store i64 %t65, i64* %reg_26_ptr
  %t66 = load i64, i64* %reg_26_ptr
  %t67 = call i64 @__sys_pointer_alloc(i64 %t66)
  store i64 %t67, i64* %reg_27_ptr
  %t68 = load i64, i64* %reg_27_ptr
  store i64 %t68, i64* %var_buf_ptr
  %t69 = load i64, i64* %var_buf_ptr
  store i64 %t69, i64* %reg_28_ptr
  %t70 = load i64, i64* %var_s_ptr
  store i64 %t70, i64* %reg_29_ptr
  %t71 = load i64, i64* %var_lo_ptr
  store i64 %t71, i64* %reg_30_ptr
  %t72 = load i64, i64* %reg_29_ptr
  %t73 = load i64, i64* %reg_30_ptr
  %t74 = add i64 %t72, %t73
  store i64 %t74, i64* %reg_31_ptr
  %t75 = load i64, i64* %var_n_ptr
  store i64 %t75, i64* %reg_32_ptr
  %t76 = load i64, i64* %reg_28_ptr
  %t77 = load i64, i64* %reg_31_ptr
  %t78 = load i64, i64* %reg_32_ptr
  %t79 = inttoptr i64 %t76 to i8*
  %t80 = inttoptr i64 %t77 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t79, i8* %t80, i64 %t78, i1 false)
  store i64 0, i64* %reg_33_ptr
  %t81 = load i64, i64* %var_buf_ptr
  store i64 %t81, i64* %reg_34_ptr
  %t82 = load i64, i64* %var_n_ptr
  store i64 %t82, i64* %reg_35_ptr
  %t83 = load i64, i64* %reg_34_ptr
  %t84 = load i64, i64* %reg_35_ptr
  %t85 = add i64 %t83, %t84
  store i64 %t85, i64* %reg_36_ptr
  %t86 = load i64, i64* %reg_36_ptr
  %t87 = inttoptr i64 %t86 to i8*
  %t88 = trunc i64 0 to i8
  store i8 %t88, i8* %t87
  store i64 0, i64* %reg_37_ptr
  %t89 = load i64, i64* %var_buf_ptr
  store i64 %t89, i64* %reg_38_ptr
  %t90 = load i64, i64* %reg_38_ptr
  ret i64 %t90
}

define i64 @rt_str_startsWith(i64 %arg0, i64 %arg1) {
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
  %var_cb_ptr = alloca i64
  %var_slen_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_plen_ptr = alloca i64
  %var_prefix_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_s_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_prefix_ptr
  %t2 = load i64, i64* %var_s_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_str_startsWith_b1, label %rt_str_startsWith_b2
rt_str_startsWith_b1:
  ret i64 0
rt_str_startsWith_b2:
  br label %rt_str_startsWith_b3
rt_str_startsWith_b3:
  %t10 = load i64, i64* %var_prefix_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  %t12 = icmp eq i64 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t16 = icmp ne i64 %t14, 0
  %t17 = zext i1 %t16 to i64
  %t15 = icmp ne i64 %t17, 0
  br i1 %t15, label %rt_str_startsWith_b4, label %rt_str_startsWith_b5
rt_str_startsWith_b4:
  ret i64 1
rt_str_startsWith_b5:
  br label %rt_str_startsWith_b6
rt_str_startsWith_b6:
  %t18 = load i64, i64* %var_prefix_ptr
  store i64 %t18, i64* %reg_6_ptr
  %t19 = load i64, i64* %reg_6_ptr
  %t20 = call i64 @rt_strlen(i64 %t19)
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  store i64 %t21, i64* %var_plen_ptr
  %t22 = load i64, i64* %var_plen_ptr
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  %t24 = icmp eq i64 %t23, 0
  %t25 = zext i1 %t24 to i64
  store i64 %t25, i64* %reg_9_ptr
  %t26 = load i64, i64* %reg_9_ptr
  %t28 = icmp ne i64 %t26, 0
  %t29 = zext i1 %t28 to i64
  %t27 = icmp ne i64 %t29, 0
  br i1 %t27, label %rt_str_startsWith_b7, label %rt_str_startsWith_b8
rt_str_startsWith_b7:
  ret i64 1
rt_str_startsWith_b8:
  br label %rt_str_startsWith_b9
rt_str_startsWith_b9:
  %t30 = load i64, i64* %var_s_ptr
  store i64 %t30, i64* %reg_10_ptr
  %t31 = load i64, i64* %reg_10_ptr
  %t32 = call i64 @rt_strlen(i64 %t31)
  store i64 %t32, i64* %reg_11_ptr
  %t33 = load i64, i64* %reg_11_ptr
  store i64 %t33, i64* %var_slen_ptr
  %t34 = load i64, i64* %var_plen_ptr
  store i64 %t34, i64* %reg_12_ptr
  %t35 = load i64, i64* %var_slen_ptr
  store i64 %t35, i64* %reg_13_ptr
  %t36 = load i64, i64* %reg_12_ptr
  %t37 = load i64, i64* %reg_13_ptr
  %t38 = icmp sgt i64 %t36, %t37
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_14_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %rt_str_startsWith_b10, label %rt_str_startsWith_b11
rt_str_startsWith_b10:
  ret i64 0
rt_str_startsWith_b11:
  br label %rt_str_startsWith_b12
rt_str_startsWith_b12:
  store i64 0, i64* %var_i_ptr
  br label %rt_str_startsWith_b13
rt_str_startsWith_b13:
  %t44 = load i64, i64* %var_i_ptr
  store i64 %t44, i64* %reg_15_ptr
  %t45 = load i64, i64* %var_plen_ptr
  store i64 %t45, i64* %reg_16_ptr
  %t46 = load i64, i64* %reg_15_ptr
  %t47 = load i64, i64* %reg_16_ptr
  %t48 = icmp sge i64 %t46, %t47
  %t49 = zext i1 %t48 to i64
  store i64 %t49, i64* %reg_17_ptr
  %t50 = load i64, i64* %reg_17_ptr
  %t52 = icmp ne i64 %t50, 0
  %t53 = zext i1 %t52 to i64
  %t51 = icmp ne i64 %t53, 0
  br i1 %t51, label %rt_str_startsWith_b15, label %rt_str_startsWith_b16
rt_str_startsWith_b14:
  ret i64 0
rt_str_startsWith_b15:
  ret i64 1
rt_str_startsWith_b16:
  br label %rt_str_startsWith_b17
rt_str_startsWith_b17:
  %t54 = load i64, i64* %var_s_ptr
  store i64 %t54, i64* %reg_18_ptr
  %t55 = load i64, i64* %var_i_ptr
  store i64 %t55, i64* %reg_19_ptr
  %t56 = load i64, i64* %reg_18_ptr
  %t57 = load i64, i64* %reg_19_ptr
  %t58 = add i64 %t56, %t57
  store i64 %t58, i64* %reg_20_ptr
  %t59 = load i64, i64* %reg_20_ptr
  %t60 = inttoptr i64 %t59 to i8*
  %t61 = load i8, i8* %t60
  %t62 = zext i8 %t61 to i64
  store i64 %t62, i64* %reg_21_ptr
  %t63 = load i64, i64* %reg_21_ptr
  store i64 %t63, i64* %var_ca_ptr
  %t64 = load i64, i64* %var_prefix_ptr
  store i64 %t64, i64* %reg_22_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_23_ptr
  %t66 = load i64, i64* %reg_22_ptr
  %t67 = load i64, i64* %reg_23_ptr
  %t68 = add i64 %t66, %t67
  store i64 %t68, i64* %reg_24_ptr
  %t69 = load i64, i64* %reg_24_ptr
  %t70 = inttoptr i64 %t69 to i8*
  %t71 = load i8, i8* %t70
  %t72 = zext i8 %t71 to i64
  store i64 %t72, i64* %reg_25_ptr
  %t73 = load i64, i64* %reg_25_ptr
  store i64 %t73, i64* %var_cb_ptr
  %t74 = load i64, i64* %var_ca_ptr
  store i64 %t74, i64* %reg_26_ptr
  %t75 = load i64, i64* %var_cb_ptr
  store i64 %t75, i64* %reg_27_ptr
  %t76 = load i64, i64* %reg_26_ptr
  %t77 = load i64, i64* %reg_27_ptr
  %t78 = icmp ne i64 %t76, %t77
  %t79 = zext i1 %t78 to i64
  store i64 %t79, i64* %reg_28_ptr
  %t80 = load i64, i64* %reg_28_ptr
  %t82 = icmp ne i64 %t80, 0
  %t83 = zext i1 %t82 to i64
  %t81 = icmp ne i64 %t83, 0
  br i1 %t81, label %rt_str_startsWith_b18, label %rt_str_startsWith_b19
rt_str_startsWith_b18:
  ret i64 0
rt_str_startsWith_b19:
  br label %rt_str_startsWith_b20
rt_str_startsWith_b20:
  %t84 = load i64, i64* %var_i_ptr
  store i64 %t84, i64* %reg_29_ptr
  %t85 = load i64, i64* %reg_29_ptr
  %t86 = add i64 %t85, 1
  store i64 %t86, i64* %reg_30_ptr
  %t87 = load i64, i64* %reg_30_ptr
  store i64 %t87, i64* %var_i_ptr
  br label %rt_str_startsWith_b13
}

define i64 @rt_str_endsWith(i64 %arg0, i64 %arg1) {
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
  %var_cb_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_offset_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_suffix_ptr = alloca i64
  %var_xlen_ptr = alloca i64
  %var_slen_ptr = alloca i64
  %var_s_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_suffix_ptr
  %t2 = load i64, i64* %var_s_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_str_endsWith_b1, label %rt_str_endsWith_b2
rt_str_endsWith_b1:
  ret i64 0
rt_str_endsWith_b2:
  br label %rt_str_endsWith_b3
rt_str_endsWith_b3:
  %t10 = load i64, i64* %var_suffix_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  %t12 = icmp eq i64 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t16 = icmp ne i64 %t14, 0
  %t17 = zext i1 %t16 to i64
  %t15 = icmp ne i64 %t17, 0
  br i1 %t15, label %rt_str_endsWith_b4, label %rt_str_endsWith_b5
rt_str_endsWith_b4:
  ret i64 1
rt_str_endsWith_b5:
  br label %rt_str_endsWith_b6
rt_str_endsWith_b6:
  %t18 = load i64, i64* %var_suffix_ptr
  store i64 %t18, i64* %reg_6_ptr
  %t19 = load i64, i64* %reg_6_ptr
  %t20 = call i64 @rt_strlen(i64 %t19)
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  store i64 %t21, i64* %var_xlen_ptr
  %t22 = load i64, i64* %var_xlen_ptr
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  %t24 = icmp eq i64 %t23, 0
  %t25 = zext i1 %t24 to i64
  store i64 %t25, i64* %reg_9_ptr
  %t26 = load i64, i64* %reg_9_ptr
  %t28 = icmp ne i64 %t26, 0
  %t29 = zext i1 %t28 to i64
  %t27 = icmp ne i64 %t29, 0
  br i1 %t27, label %rt_str_endsWith_b7, label %rt_str_endsWith_b8
rt_str_endsWith_b7:
  ret i64 1
rt_str_endsWith_b8:
  br label %rt_str_endsWith_b9
rt_str_endsWith_b9:
  %t30 = load i64, i64* %var_s_ptr
  store i64 %t30, i64* %reg_10_ptr
  %t31 = load i64, i64* %reg_10_ptr
  %t32 = call i64 @rt_strlen(i64 %t31)
  store i64 %t32, i64* %reg_11_ptr
  %t33 = load i64, i64* %reg_11_ptr
  store i64 %t33, i64* %var_slen_ptr
  %t34 = load i64, i64* %var_xlen_ptr
  store i64 %t34, i64* %reg_12_ptr
  %t35 = load i64, i64* %var_slen_ptr
  store i64 %t35, i64* %reg_13_ptr
  %t36 = load i64, i64* %reg_12_ptr
  %t37 = load i64, i64* %reg_13_ptr
  %t38 = icmp sgt i64 %t36, %t37
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_14_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %rt_str_endsWith_b10, label %rt_str_endsWith_b11
rt_str_endsWith_b10:
  ret i64 0
rt_str_endsWith_b11:
  br label %rt_str_endsWith_b12
rt_str_endsWith_b12:
  %t44 = load i64, i64* %var_slen_ptr
  store i64 %t44, i64* %reg_15_ptr
  %t45 = load i64, i64* %var_xlen_ptr
  store i64 %t45, i64* %reg_16_ptr
  %t46 = load i64, i64* %reg_15_ptr
  %t47 = load i64, i64* %reg_16_ptr
  %t48 = sub i64 %t46, %t47
  store i64 %t48, i64* %reg_17_ptr
  %t49 = load i64, i64* %reg_17_ptr
  store i64 %t49, i64* %var_offset_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_str_endsWith_b13
rt_str_endsWith_b13:
  %t50 = load i64, i64* %var_i_ptr
  store i64 %t50, i64* %reg_18_ptr
  %t51 = load i64, i64* %var_xlen_ptr
  store i64 %t51, i64* %reg_19_ptr
  %t52 = load i64, i64* %reg_18_ptr
  %t53 = load i64, i64* %reg_19_ptr
  %t54 = icmp sge i64 %t52, %t53
  %t55 = zext i1 %t54 to i64
  store i64 %t55, i64* %reg_20_ptr
  %t56 = load i64, i64* %reg_20_ptr
  %t58 = icmp ne i64 %t56, 0
  %t59 = zext i1 %t58 to i64
  %t57 = icmp ne i64 %t59, 0
  br i1 %t57, label %rt_str_endsWith_b15, label %rt_str_endsWith_b16
rt_str_endsWith_b14:
  ret i64 0
rt_str_endsWith_b15:
  ret i64 1
rt_str_endsWith_b16:
  br label %rt_str_endsWith_b17
rt_str_endsWith_b17:
  %t60 = load i64, i64* %var_s_ptr
  store i64 %t60, i64* %reg_21_ptr
  %t61 = load i64, i64* %var_offset_ptr
  store i64 %t61, i64* %reg_22_ptr
  %t62 = load i64, i64* %reg_21_ptr
  %t63 = load i64, i64* %reg_22_ptr
  %t64 = add i64 %t62, %t63
  store i64 %t64, i64* %reg_23_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i64, i64* %reg_23_ptr
  %t67 = load i64, i64* %reg_24_ptr
  %t68 = add i64 %t66, %t67
  store i64 %t68, i64* %reg_25_ptr
  %t69 = load i64, i64* %reg_25_ptr
  %t70 = inttoptr i64 %t69 to i8*
  %t71 = load i8, i8* %t70
  %t72 = zext i8 %t71 to i64
  store i64 %t72, i64* %reg_26_ptr
  %t73 = load i64, i64* %reg_26_ptr
  store i64 %t73, i64* %var_ca_ptr
  %t74 = load i64, i64* %var_suffix_ptr
  store i64 %t74, i64* %reg_27_ptr
  %t75 = load i64, i64* %var_i_ptr
  store i64 %t75, i64* %reg_28_ptr
  %t76 = load i64, i64* %reg_27_ptr
  %t77 = load i64, i64* %reg_28_ptr
  %t78 = add i64 %t76, %t77
  store i64 %t78, i64* %reg_29_ptr
  %t79 = load i64, i64* %reg_29_ptr
  %t80 = inttoptr i64 %t79 to i8*
  %t81 = load i8, i8* %t80
  %t82 = zext i8 %t81 to i64
  store i64 %t82, i64* %reg_30_ptr
  %t83 = load i64, i64* %reg_30_ptr
  store i64 %t83, i64* %var_cb_ptr
  %t84 = load i64, i64* %var_ca_ptr
  store i64 %t84, i64* %reg_31_ptr
  %t85 = load i64, i64* %var_cb_ptr
  store i64 %t85, i64* %reg_32_ptr
  %t86 = load i64, i64* %reg_31_ptr
  %t87 = load i64, i64* %reg_32_ptr
  %t88 = icmp ne i64 %t86, %t87
  %t89 = zext i1 %t88 to i64
  store i64 %t89, i64* %reg_33_ptr
  %t90 = load i64, i64* %reg_33_ptr
  %t92 = icmp ne i64 %t90, 0
  %t93 = zext i1 %t92 to i64
  %t91 = icmp ne i64 %t93, 0
  br i1 %t91, label %rt_str_endsWith_b18, label %rt_str_endsWith_b19
rt_str_endsWith_b18:
  ret i64 0
rt_str_endsWith_b19:
  br label %rt_str_endsWith_b20
rt_str_endsWith_b20:
  %t94 = load i64, i64* %var_i_ptr
  store i64 %t94, i64* %reg_34_ptr
  %t95 = load i64, i64* %reg_34_ptr
  %t96 = add i64 %t95, 1
  store i64 %t96, i64* %reg_35_ptr
  %t97 = load i64, i64* %reg_35_ptr
  store i64 %t97, i64* %var_i_ptr
  br label %rt_str_endsWith_b13
}

define i64 @rt_str_upper(i64 %arg0) {
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
  %var_s_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_len_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_str_upper_b1, label %rt_str_upper_b2
rt_str_upper_b1:
  ret i64 0
rt_str_upper_b2:
  br label %rt_str_upper_b3
rt_str_upper_b3:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = call i64 @rt_strlen(i64 %t10)
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  store i64 %t12, i64* %var_len_ptr
  %t13 = load i64, i64* %var_len_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = add i64 %t14, 1
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = call i64 @__sys_pointer_alloc(i64 %t16)
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  store i64 %t18, i64* %var_buf_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_str_upper_b4
rt_str_upper_b4:
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %var_len_ptr
  store i64 %t20, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_8_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = icmp sge i64 %t21, %t22
  %t24 = zext i1 %t23 to i64
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t27 = icmp ne i64 %t25, 0
  %t28 = zext i1 %t27 to i64
  %t26 = icmp ne i64 %t28, 0
  br i1 %t26, label %rt_str_upper_b6, label %rt_str_upper_b7
rt_str_upper_b5:
  %t29 = load i64, i64* %var_buf_ptr
  store i64 %t29, i64* %reg_28_ptr
  %t30 = load i64, i64* %var_len_ptr
  store i64 %t30, i64* %reg_29_ptr
  %t31 = load i64, i64* %reg_28_ptr
  %t32 = load i64, i64* %reg_29_ptr
  %t33 = add i64 %t31, %t32
  store i64 %t33, i64* %reg_30_ptr
  %t34 = load i64, i64* %reg_30_ptr
  %t35 = inttoptr i64 %t34 to i8*
  %t36 = trunc i64 0 to i8
  store i8 %t36, i8* %t35
  store i64 0, i64* %reg_31_ptr
  %t37 = load i64, i64* %var_buf_ptr
  store i64 %t37, i64* %reg_32_ptr
  %t38 = load i64, i64* %reg_32_ptr
  ret i64 %t38
rt_str_upper_b6:
  br label %rt_str_upper_b5
rt_str_upper_b7:
  br label %rt_str_upper_b8
rt_str_upper_b8:
  %t39 = load i64, i64* %var_s_ptr
  store i64 %t39, i64* %reg_11_ptr
  %t40 = load i64, i64* %var_i_ptr
  store i64 %t40, i64* %reg_12_ptr
  %t41 = load i64, i64* %reg_11_ptr
  %t42 = load i64, i64* %reg_12_ptr
  %t43 = add i64 %t41, %t42
  store i64 %t43, i64* %reg_13_ptr
  %t44 = load i64, i64* %reg_13_ptr
  %t45 = inttoptr i64 %t44 to i8*
  %t46 = load i8, i8* %t45
  %t47 = zext i8 %t46 to i64
  store i64 %t47, i64* %reg_14_ptr
  %t48 = load i64, i64* %reg_14_ptr
  store i64 %t48, i64* %var_ch_ptr
  %t49 = load i64, i64* %var_ch_ptr
  store i64 %t49, i64* %reg_15_ptr
  %t50 = load i64, i64* %reg_15_ptr
  %t51 = icmp sge i64 %t50, 97
  %t52 = zext i1 %t51 to i64
  store i64 %t52, i64* %reg_16_ptr
  %t53 = load i64, i64* %reg_16_ptr
  %t55 = icmp ne i64 %t53, 0
  %t56 = zext i1 %t55 to i64
  %t54 = icmp ne i64 %t56, 0
  br i1 %t54, label %rt_str_upper_b9, label %rt_str_upper_b10
rt_str_upper_b9:
  %t57 = load i64, i64* %var_ch_ptr
  store i64 %t57, i64* %reg_17_ptr
  %t58 = load i64, i64* %reg_17_ptr
  %t59 = icmp sle i64 %t58, 122
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_18_ptr
  %t61 = load i64, i64* %reg_18_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %rt_str_upper_b12, label %rt_str_upper_b13
rt_str_upper_b10:
  br label %rt_str_upper_b11
rt_str_upper_b11:
  %t65 = load i64, i64* %var_buf_ptr
  store i64 %t65, i64* %reg_21_ptr
  %t66 = load i64, i64* %var_i_ptr
  store i64 %t66, i64* %reg_22_ptr
  %t67 = load i64, i64* %reg_21_ptr
  %t68 = load i64, i64* %reg_22_ptr
  %t69 = add i64 %t67, %t68
  store i64 %t69, i64* %reg_23_ptr
  %t70 = load i64, i64* %var_ch_ptr
  store i64 %t70, i64* %reg_24_ptr
  %t71 = load i64, i64* %reg_23_ptr
  %t72 = load i64, i64* %reg_24_ptr
  %t73 = inttoptr i64 %t71 to i8*
  %t74 = trunc i64 %t72 to i8
  store i8 %t74, i8* %t73
  store i64 0, i64* %reg_25_ptr
  %t75 = load i64, i64* %var_i_ptr
  store i64 %t75, i64* %reg_26_ptr
  %t76 = load i64, i64* %reg_26_ptr
  %t77 = add i64 %t76, 1
  store i64 %t77, i64* %reg_27_ptr
  %t78 = load i64, i64* %reg_27_ptr
  store i64 %t78, i64* %var_i_ptr
  br label %rt_str_upper_b4
rt_str_upper_b12:
  %t79 = load i64, i64* %var_ch_ptr
  store i64 %t79, i64* %reg_19_ptr
  %t80 = load i64, i64* %reg_19_ptr
  %t81 = sub i64 %t80, 32
  store i64 %t81, i64* %reg_20_ptr
  %t82 = load i64, i64* %reg_20_ptr
  store i64 %t82, i64* %var_ch_ptr
  br label %rt_str_upper_b14
rt_str_upper_b13:
  br label %rt_str_upper_b14
rt_str_upper_b14:
  br label %rt_str_upper_b11
}

define i64 @rt_str_lower(i64 %arg0) {
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
  %var_buf_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_len_ptr = alloca i64
  %var_i_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_str_lower_b1, label %rt_str_lower_b2
rt_str_lower_b1:
  ret i64 0
rt_str_lower_b2:
  br label %rt_str_lower_b3
rt_str_lower_b3:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = call i64 @rt_strlen(i64 %t10)
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  store i64 %t12, i64* %var_len_ptr
  %t13 = load i64, i64* %var_len_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = add i64 %t14, 1
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = call i64 @__sys_pointer_alloc(i64 %t16)
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  store i64 %t18, i64* %var_buf_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_str_lower_b4
rt_str_lower_b4:
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %var_len_ptr
  store i64 %t20, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_8_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = icmp sge i64 %t21, %t22
  %t24 = zext i1 %t23 to i64
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t27 = icmp ne i64 %t25, 0
  %t28 = zext i1 %t27 to i64
  %t26 = icmp ne i64 %t28, 0
  br i1 %t26, label %rt_str_lower_b6, label %rt_str_lower_b7
rt_str_lower_b5:
  %t29 = load i64, i64* %var_buf_ptr
  store i64 %t29, i64* %reg_28_ptr
  %t30 = load i64, i64* %var_len_ptr
  store i64 %t30, i64* %reg_29_ptr
  %t31 = load i64, i64* %reg_28_ptr
  %t32 = load i64, i64* %reg_29_ptr
  %t33 = add i64 %t31, %t32
  store i64 %t33, i64* %reg_30_ptr
  %t34 = load i64, i64* %reg_30_ptr
  %t35 = inttoptr i64 %t34 to i8*
  %t36 = trunc i64 0 to i8
  store i8 %t36, i8* %t35
  store i64 0, i64* %reg_31_ptr
  %t37 = load i64, i64* %var_buf_ptr
  store i64 %t37, i64* %reg_32_ptr
  %t38 = load i64, i64* %reg_32_ptr
  ret i64 %t38
rt_str_lower_b6:
  br label %rt_str_lower_b5
rt_str_lower_b7:
  br label %rt_str_lower_b8
rt_str_lower_b8:
  %t39 = load i64, i64* %var_s_ptr
  store i64 %t39, i64* %reg_11_ptr
  %t40 = load i64, i64* %var_i_ptr
  store i64 %t40, i64* %reg_12_ptr
  %t41 = load i64, i64* %reg_11_ptr
  %t42 = load i64, i64* %reg_12_ptr
  %t43 = add i64 %t41, %t42
  store i64 %t43, i64* %reg_13_ptr
  %t44 = load i64, i64* %reg_13_ptr
  %t45 = inttoptr i64 %t44 to i8*
  %t46 = load i8, i8* %t45
  %t47 = zext i8 %t46 to i64
  store i64 %t47, i64* %reg_14_ptr
  %t48 = load i64, i64* %reg_14_ptr
  store i64 %t48, i64* %var_ch_ptr
  %t49 = load i64, i64* %var_ch_ptr
  store i64 %t49, i64* %reg_15_ptr
  %t50 = load i64, i64* %reg_15_ptr
  %t51 = icmp sge i64 %t50, 65
  %t52 = zext i1 %t51 to i64
  store i64 %t52, i64* %reg_16_ptr
  %t53 = load i64, i64* %reg_16_ptr
  %t55 = icmp ne i64 %t53, 0
  %t56 = zext i1 %t55 to i64
  %t54 = icmp ne i64 %t56, 0
  br i1 %t54, label %rt_str_lower_b9, label %rt_str_lower_b10
rt_str_lower_b9:
  %t57 = load i64, i64* %var_ch_ptr
  store i64 %t57, i64* %reg_17_ptr
  %t58 = load i64, i64* %reg_17_ptr
  %t59 = icmp sle i64 %t58, 90
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_18_ptr
  %t61 = load i64, i64* %reg_18_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %rt_str_lower_b12, label %rt_str_lower_b13
rt_str_lower_b10:
  br label %rt_str_lower_b11
rt_str_lower_b11:
  %t65 = load i64, i64* %var_buf_ptr
  store i64 %t65, i64* %reg_21_ptr
  %t66 = load i64, i64* %var_i_ptr
  store i64 %t66, i64* %reg_22_ptr
  %t67 = load i64, i64* %reg_21_ptr
  %t68 = load i64, i64* %reg_22_ptr
  %t69 = add i64 %t67, %t68
  store i64 %t69, i64* %reg_23_ptr
  %t70 = load i64, i64* %var_ch_ptr
  store i64 %t70, i64* %reg_24_ptr
  %t71 = load i64, i64* %reg_23_ptr
  %t72 = load i64, i64* %reg_24_ptr
  %t73 = inttoptr i64 %t71 to i8*
  %t74 = trunc i64 %t72 to i8
  store i8 %t74, i8* %t73
  store i64 0, i64* %reg_25_ptr
  %t75 = load i64, i64* %var_i_ptr
  store i64 %t75, i64* %reg_26_ptr
  %t76 = load i64, i64* %reg_26_ptr
  %t77 = add i64 %t76, 1
  store i64 %t77, i64* %reg_27_ptr
  %t78 = load i64, i64* %reg_27_ptr
  store i64 %t78, i64* %var_i_ptr
  br label %rt_str_lower_b4
rt_str_lower_b12:
  %t79 = load i64, i64* %var_ch_ptr
  store i64 %t79, i64* %reg_19_ptr
  %t80 = load i64, i64* %reg_19_ptr
  %t81 = add i64 %t80, 32
  store i64 %t81, i64* %reg_20_ptr
  %t82 = load i64, i64* %reg_20_ptr
  store i64 %t82, i64* %var_ch_ptr
  br label %rt_str_lower_b14
rt_str_lower_b13:
  br label %rt_str_lower_b14
rt_str_lower_b14:
  br label %rt_str_lower_b11
}

define i64 @rt_str_trim(i64 %arg0) {
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
  %var_s_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_len_ptr = alloca i64
  %var_lo_ptr = alloca i64
  %var_hi_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_n_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_str_trim_b1, label %rt_str_trim_b2
rt_str_trim_b1:
  ret i64 0
rt_str_trim_b2:
  br label %rt_str_trim_b3
rt_str_trim_b3:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = call i64 @rt_strlen(i64 %t10)
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  store i64 %t12, i64* %var_len_ptr
  %t13 = load i64, i64* %var_len_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = icmp eq i64 %t14, 0
  %t16 = zext i1 %t15 to i64
  store i64 %t16, i64* %reg_6_ptr
  %t17 = load i64, i64* %reg_6_ptr
  %t19 = icmp ne i64 %t17, 0
  %t20 = zext i1 %t19 to i64
  %t18 = icmp ne i64 %t20, 0
  br i1 %t18, label %rt_str_trim_b4, label %rt_str_trim_b5
rt_str_trim_b4:
  %t21 = call i64 @__sys_pointer_alloc(i64 1)
  store i64 %t21, i64* %reg_7_ptr
  %t22 = load i64, i64* %reg_7_ptr
  store i64 %t22, i64* %var_buf_ptr
  %t23 = load i64, i64* %var_buf_ptr
  store i64 %t23, i64* %reg_8_ptr
  %t24 = load i64, i64* %reg_8_ptr
  %t25 = inttoptr i64 %t24 to i8*
  %t26 = trunc i64 0 to i8
  store i8 %t26, i8* %t25
  store i64 0, i64* %reg_9_ptr
  %t27 = load i64, i64* %var_buf_ptr
  store i64 %t27, i64* %reg_10_ptr
  %t28 = load i64, i64* %reg_10_ptr
  ret i64 %t28
rt_str_trim_b5:
  br label %rt_str_trim_b6
rt_str_trim_b6:
  store i64 0, i64* %var_lo_ptr
  br label %rt_str_trim_b7
rt_str_trim_b7:
  %t29 = load i64, i64* %var_lo_ptr
  store i64 %t29, i64* %reg_11_ptr
  %t30 = load i64, i64* %var_len_ptr
  store i64 %t30, i64* %reg_12_ptr
  %t31 = load i64, i64* %reg_11_ptr
  %t32 = load i64, i64* %reg_12_ptr
  %t33 = icmp sge i64 %t31, %t32
  %t34 = zext i1 %t33 to i64
  store i64 %t34, i64* %reg_13_ptr
  %t35 = load i64, i64* %reg_13_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %rt_str_trim_b9, label %rt_str_trim_b10
rt_str_trim_b8:
  %t39 = load i64, i64* %var_len_ptr
  store i64 %t39, i64* %reg_28_ptr
  %t40 = load i64, i64* %reg_28_ptr
  store i64 %t40, i64* %var_hi_ptr
  br label %rt_str_trim_b24
rt_str_trim_b9:
  br label %rt_str_trim_b8
rt_str_trim_b10:
  br label %rt_str_trim_b11
rt_str_trim_b11:
  %t41 = load i64, i64* %var_s_ptr
  store i64 %t41, i64* %reg_14_ptr
  %t42 = load i64, i64* %var_lo_ptr
  store i64 %t42, i64* %reg_15_ptr
  %t43 = load i64, i64* %reg_14_ptr
  %t44 = load i64, i64* %reg_15_ptr
  %t45 = add i64 %t43, %t44
  store i64 %t45, i64* %reg_16_ptr
  %t46 = load i64, i64* %reg_16_ptr
  %t47 = inttoptr i64 %t46 to i8*
  %t48 = load i8, i8* %t47
  %t49 = zext i8 %t48 to i64
  store i64 %t49, i64* %reg_17_ptr
  %t50 = load i64, i64* %reg_17_ptr
  store i64 %t50, i64* %var_ch_ptr
  %t51 = load i64, i64* %var_ch_ptr
  store i64 %t51, i64* %reg_18_ptr
  %t52 = load i64, i64* %reg_18_ptr
  %t53 = icmp ne i64 %t52, 32
  %t54 = zext i1 %t53 to i64
  store i64 %t54, i64* %reg_19_ptr
  %t55 = load i64, i64* %reg_19_ptr
  %t57 = icmp ne i64 %t55, 0
  %t58 = zext i1 %t57 to i64
  %t56 = icmp ne i64 %t58, 0
  br i1 %t56, label %rt_str_trim_b12, label %rt_str_trim_b13
rt_str_trim_b12:
  %t59 = load i64, i64* %var_ch_ptr
  store i64 %t59, i64* %reg_20_ptr
  %t60 = load i64, i64* %reg_20_ptr
  %t61 = icmp ne i64 %t60, 9
  %t62 = zext i1 %t61 to i64
  store i64 %t62, i64* %reg_21_ptr
  %t63 = load i64, i64* %reg_21_ptr
  %t65 = icmp ne i64 %t63, 0
  %t66 = zext i1 %t65 to i64
  %t64 = icmp ne i64 %t66, 0
  br i1 %t64, label %rt_str_trim_b15, label %rt_str_trim_b16
rt_str_trim_b13:
  br label %rt_str_trim_b14
rt_str_trim_b14:
  %t67 = load i64, i64* %var_lo_ptr
  store i64 %t67, i64* %reg_26_ptr
  %t68 = load i64, i64* %reg_26_ptr
  %t69 = add i64 %t68, 1
  store i64 %t69, i64* %reg_27_ptr
  %t70 = load i64, i64* %reg_27_ptr
  store i64 %t70, i64* %var_lo_ptr
  br label %rt_str_trim_b7
rt_str_trim_b15:
  %t71 = load i64, i64* %var_ch_ptr
  store i64 %t71, i64* %reg_22_ptr
  %t72 = load i64, i64* %reg_22_ptr
  %t73 = icmp ne i64 %t72, 10
  %t74 = zext i1 %t73 to i64
  store i64 %t74, i64* %reg_23_ptr
  %t75 = load i64, i64* %reg_23_ptr
  %t77 = icmp ne i64 %t75, 0
  %t78 = zext i1 %t77 to i64
  %t76 = icmp ne i64 %t78, 0
  br i1 %t76, label %rt_str_trim_b18, label %rt_str_trim_b19
rt_str_trim_b16:
  br label %rt_str_trim_b17
rt_str_trim_b17:
  br label %rt_str_trim_b14
rt_str_trim_b18:
  %t79 = load i64, i64* %var_ch_ptr
  store i64 %t79, i64* %reg_24_ptr
  %t80 = load i64, i64* %reg_24_ptr
  %t81 = icmp ne i64 %t80, 13
  %t82 = zext i1 %t81 to i64
  store i64 %t82, i64* %reg_25_ptr
  %t83 = load i64, i64* %reg_25_ptr
  %t85 = icmp ne i64 %t83, 0
  %t86 = zext i1 %t85 to i64
  %t84 = icmp ne i64 %t86, 0
  br i1 %t84, label %rt_str_trim_b21, label %rt_str_trim_b22
rt_str_trim_b19:
  br label %rt_str_trim_b20
rt_str_trim_b20:
  br label %rt_str_trim_b17
rt_str_trim_b21:
  br label %rt_str_trim_b8
rt_str_trim_b22:
  br label %rt_str_trim_b23
rt_str_trim_b23:
  br label %rt_str_trim_b20
rt_str_trim_b24:
  %t87 = load i64, i64* %var_hi_ptr
  store i64 %t87, i64* %reg_29_ptr
  %t88 = load i64, i64* %var_lo_ptr
  store i64 %t88, i64* %reg_30_ptr
  %t89 = load i64, i64* %reg_29_ptr
  %t90 = load i64, i64* %reg_30_ptr
  %t91 = icmp sle i64 %t89, %t90
  %t92 = zext i1 %t91 to i64
  store i64 %t92, i64* %reg_31_ptr
  %t93 = load i64, i64* %reg_31_ptr
  %t95 = icmp ne i64 %t93, 0
  %t96 = zext i1 %t95 to i64
  %t94 = icmp ne i64 %t96, 0
  br i1 %t94, label %rt_str_trim_b26, label %rt_str_trim_b27
rt_str_trim_b25:
  %t97 = load i64, i64* %var_hi_ptr
  store i64 %t97, i64* %reg_47_ptr
  %t98 = load i64, i64* %var_lo_ptr
  store i64 %t98, i64* %reg_48_ptr
  %t99 = load i64, i64* %reg_47_ptr
  %t100 = load i64, i64* %reg_48_ptr
  %t101 = sub i64 %t99, %t100
  store i64 %t101, i64* %reg_49_ptr
  %t102 = load i64, i64* %reg_49_ptr
  store i64 %t102, i64* %var_n_ptr
  %t103 = load i64, i64* %var_n_ptr
  store i64 %t103, i64* %reg_50_ptr
  %t104 = load i64, i64* %reg_50_ptr
  %t105 = add i64 %t104, 1
  store i64 %t105, i64* %reg_51_ptr
  %t106 = load i64, i64* %reg_51_ptr
  %t107 = call i64 @__sys_pointer_alloc(i64 %t106)
  store i64 %t107, i64* %reg_52_ptr
  %t108 = load i64, i64* %reg_52_ptr
  store i64 %t108, i64* %var_buf_ptr
  %t109 = load i64, i64* %var_n_ptr
  store i64 %t109, i64* %reg_53_ptr
  %t110 = load i64, i64* %reg_53_ptr
  %t111 = icmp sgt i64 %t110, 0
  %t112 = zext i1 %t111 to i64
  store i64 %t112, i64* %reg_54_ptr
  %t113 = load i64, i64* %reg_54_ptr
  %t115 = icmp ne i64 %t113, 0
  %t116 = zext i1 %t115 to i64
  %t114 = icmp ne i64 %t116, 0
  br i1 %t114, label %rt_str_trim_b41, label %rt_str_trim_b42
rt_str_trim_b26:
  br label %rt_str_trim_b25
rt_str_trim_b27:
  br label %rt_str_trim_b28
rt_str_trim_b28:
  %t117 = load i64, i64* %var_s_ptr
  store i64 %t117, i64* %reg_32_ptr
  %t118 = load i64, i64* %var_hi_ptr
  store i64 %t118, i64* %reg_33_ptr
  %t119 = load i64, i64* %reg_32_ptr
  %t120 = load i64, i64* %reg_33_ptr
  %t121 = add i64 %t119, %t120
  store i64 %t121, i64* %reg_34_ptr
  %t122 = load i64, i64* %reg_34_ptr
  %t123 = sub i64 %t122, 1
  store i64 %t123, i64* %reg_35_ptr
  %t124 = load i64, i64* %reg_35_ptr
  %t125 = inttoptr i64 %t124 to i8*
  %t126 = load i8, i8* %t125
  %t127 = zext i8 %t126 to i64
  store i64 %t127, i64* %reg_36_ptr
  %t128 = load i64, i64* %reg_36_ptr
  store i64 %t128, i64* %var_ch_ptr
  %t129 = load i64, i64* %var_ch_ptr
  store i64 %t129, i64* %reg_37_ptr
  %t130 = load i64, i64* %reg_37_ptr
  %t131 = icmp ne i64 %t130, 32
  %t132 = zext i1 %t131 to i64
  store i64 %t132, i64* %reg_38_ptr
  %t133 = load i64, i64* %reg_38_ptr
  %t135 = icmp ne i64 %t133, 0
  %t136 = zext i1 %t135 to i64
  %t134 = icmp ne i64 %t136, 0
  br i1 %t134, label %rt_str_trim_b29, label %rt_str_trim_b30
rt_str_trim_b29:
  %t137 = load i64, i64* %var_ch_ptr
  store i64 %t137, i64* %reg_39_ptr
  %t138 = load i64, i64* %reg_39_ptr
  %t139 = icmp ne i64 %t138, 9
  %t140 = zext i1 %t139 to i64
  store i64 %t140, i64* %reg_40_ptr
  %t141 = load i64, i64* %reg_40_ptr
  %t143 = icmp ne i64 %t141, 0
  %t144 = zext i1 %t143 to i64
  %t142 = icmp ne i64 %t144, 0
  br i1 %t142, label %rt_str_trim_b32, label %rt_str_trim_b33
rt_str_trim_b30:
  br label %rt_str_trim_b31
rt_str_trim_b31:
  %t145 = load i64, i64* %var_hi_ptr
  store i64 %t145, i64* %reg_45_ptr
  %t146 = load i64, i64* %reg_45_ptr
  %t147 = sub i64 %t146, 1
  store i64 %t147, i64* %reg_46_ptr
  %t148 = load i64, i64* %reg_46_ptr
  store i64 %t148, i64* %var_hi_ptr
  br label %rt_str_trim_b24
rt_str_trim_b32:
  %t149 = load i64, i64* %var_ch_ptr
  store i64 %t149, i64* %reg_41_ptr
  %t150 = load i64, i64* %reg_41_ptr
  %t151 = icmp ne i64 %t150, 10
  %t152 = zext i1 %t151 to i64
  store i64 %t152, i64* %reg_42_ptr
  %t153 = load i64, i64* %reg_42_ptr
  %t155 = icmp ne i64 %t153, 0
  %t156 = zext i1 %t155 to i64
  %t154 = icmp ne i64 %t156, 0
  br i1 %t154, label %rt_str_trim_b35, label %rt_str_trim_b36
rt_str_trim_b33:
  br label %rt_str_trim_b34
rt_str_trim_b34:
  br label %rt_str_trim_b31
rt_str_trim_b35:
  %t157 = load i64, i64* %var_ch_ptr
  store i64 %t157, i64* %reg_43_ptr
  %t158 = load i64, i64* %reg_43_ptr
  %t159 = icmp ne i64 %t158, 13
  %t160 = zext i1 %t159 to i64
  store i64 %t160, i64* %reg_44_ptr
  %t161 = load i64, i64* %reg_44_ptr
  %t163 = icmp ne i64 %t161, 0
  %t164 = zext i1 %t163 to i64
  %t162 = icmp ne i64 %t164, 0
  br i1 %t162, label %rt_str_trim_b38, label %rt_str_trim_b39
rt_str_trim_b36:
  br label %rt_str_trim_b37
rt_str_trim_b37:
  br label %rt_str_trim_b34
rt_str_trim_b38:
  br label %rt_str_trim_b25
rt_str_trim_b39:
  br label %rt_str_trim_b40
rt_str_trim_b40:
  br label %rt_str_trim_b37
rt_str_trim_b41:
  %t165 = load i64, i64* %var_buf_ptr
  store i64 %t165, i64* %reg_55_ptr
  %t166 = load i64, i64* %var_s_ptr
  store i64 %t166, i64* %reg_56_ptr
  %t167 = load i64, i64* %var_lo_ptr
  store i64 %t167, i64* %reg_57_ptr
  %t168 = load i64, i64* %reg_56_ptr
  %t169 = load i64, i64* %reg_57_ptr
  %t170 = add i64 %t168, %t169
  store i64 %t170, i64* %reg_58_ptr
  %t171 = load i64, i64* %var_n_ptr
  store i64 %t171, i64* %reg_59_ptr
  %t172 = load i64, i64* %reg_55_ptr
  %t173 = load i64, i64* %reg_58_ptr
  %t174 = load i64, i64* %reg_59_ptr
  %t175 = inttoptr i64 %t172 to i8*
  %t176 = inttoptr i64 %t173 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t175, i8* %t176, i64 %t174, i1 false)
  store i64 0, i64* %reg_60_ptr
  br label %rt_str_trim_b43
rt_str_trim_b42:
  br label %rt_str_trim_b43
rt_str_trim_b43:
  %t177 = load i64, i64* %var_buf_ptr
  store i64 %t177, i64* %reg_61_ptr
  %t178 = load i64, i64* %var_n_ptr
  store i64 %t178, i64* %reg_62_ptr
  %t179 = load i64, i64* %reg_61_ptr
  %t180 = load i64, i64* %reg_62_ptr
  %t181 = add i64 %t179, %t180
  store i64 %t181, i64* %reg_63_ptr
  %t182 = load i64, i64* %reg_63_ptr
  %t183 = inttoptr i64 %t182 to i8*
  %t184 = trunc i64 0 to i8
  store i8 %t184, i8* %t183
  store i64 0, i64* %reg_64_ptr
  %t185 = load i64, i64* %var_buf_ptr
  store i64 %t185, i64* %reg_65_ptr
  %t186 = load i64, i64* %reg_65_ptr
  ret i64 %t186
}

define i64 @rt_str_repeat(i64 %arg0, i64 %arg1) {
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
  %var_i_ptr = alloca i64
  %var_times_ptr = alloca i64
  %var_total_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_len_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_times_ptr
  %t2 = load i64, i64* %var_s_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_str_repeat_b1, label %rt_str_repeat_b2
rt_str_repeat_b1:
  ret i64 0
rt_str_repeat_b2:
  br label %rt_str_repeat_b3
rt_str_repeat_b3:
  %t10 = load i64, i64* %var_times_ptr
  store i64 %t10, i64* %reg_4_ptr
  %t11 = load i64, i64* %reg_4_ptr
  %t12 = icmp sle i64 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t16 = icmp ne i64 %t14, 0
  %t17 = zext i1 %t16 to i64
  %t15 = icmp ne i64 %t17, 0
  br i1 %t15, label %rt_str_repeat_b4, label %rt_str_repeat_b5
rt_str_repeat_b4:
  %t18 = call i64 @__sys_pointer_alloc(i64 1)
  store i64 %t18, i64* %reg_6_ptr
  %t19 = load i64, i64* %reg_6_ptr
  store i64 %t19, i64* %var_buf_ptr
  %t20 = load i64, i64* %var_buf_ptr
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  %t22 = inttoptr i64 %t21 to i8*
  %t23 = trunc i64 0 to i8
  store i8 %t23, i8* %t22
  store i64 0, i64* %reg_8_ptr
  %t24 = load i64, i64* %var_buf_ptr
  store i64 %t24, i64* %reg_9_ptr
  %t25 = load i64, i64* %reg_9_ptr
  ret i64 %t25
rt_str_repeat_b5:
  br label %rt_str_repeat_b6
rt_str_repeat_b6:
  %t26 = load i64, i64* %var_s_ptr
  store i64 %t26, i64* %reg_10_ptr
  %t27 = load i64, i64* %reg_10_ptr
  %t28 = call i64 @rt_strlen(i64 %t27)
  store i64 %t28, i64* %reg_11_ptr
  %t29 = load i64, i64* %reg_11_ptr
  store i64 %t29, i64* %var_len_ptr
  %t30 = load i64, i64* %var_len_ptr
  store i64 %t30, i64* %reg_12_ptr
  %t31 = load i64, i64* %var_times_ptr
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_12_ptr
  %t33 = load i64, i64* %reg_13_ptr
  %t34 = mul i64 %t32, %t33
  store i64 %t34, i64* %reg_14_ptr
  %t35 = load i64, i64* %reg_14_ptr
  store i64 %t35, i64* %var_total_ptr
  %t36 = load i64, i64* %var_total_ptr
  store i64 %t36, i64* %reg_15_ptr
  %t37 = load i64, i64* %reg_15_ptr
  %t38 = add i64 %t37, 1
  store i64 %t38, i64* %reg_16_ptr
  %t39 = load i64, i64* %reg_16_ptr
  %t40 = call i64 @__sys_pointer_alloc(i64 %t39)
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i64, i64* %reg_17_ptr
  store i64 %t41, i64* %var_buf_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_str_repeat_b7
rt_str_repeat_b7:
  %t42 = load i64, i64* %var_i_ptr
  store i64 %t42, i64* %reg_18_ptr
  %t43 = load i64, i64* %var_times_ptr
  store i64 %t43, i64* %reg_19_ptr
  %t44 = load i64, i64* %reg_18_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t46 = icmp sge i64 %t44, %t45
  %t47 = zext i1 %t46 to i64
  store i64 %t47, i64* %reg_20_ptr
  %t48 = load i64, i64* %reg_20_ptr
  %t50 = icmp ne i64 %t48, 0
  %t51 = zext i1 %t50 to i64
  %t49 = icmp ne i64 %t51, 0
  br i1 %t49, label %rt_str_repeat_b9, label %rt_str_repeat_b10
rt_str_repeat_b8:
  %t52 = load i64, i64* %var_buf_ptr
  store i64 %t52, i64* %reg_31_ptr
  %t53 = load i64, i64* %var_total_ptr
  store i64 %t53, i64* %reg_32_ptr
  %t54 = load i64, i64* %reg_31_ptr
  %t55 = load i64, i64* %reg_32_ptr
  %t56 = add i64 %t54, %t55
  store i64 %t56, i64* %reg_33_ptr
  %t57 = load i64, i64* %reg_33_ptr
  %t58 = inttoptr i64 %t57 to i8*
  %t59 = trunc i64 0 to i8
  store i8 %t59, i8* %t58
  store i64 0, i64* %reg_34_ptr
  %t60 = load i64, i64* %var_buf_ptr
  store i64 %t60, i64* %reg_35_ptr
  %t61 = load i64, i64* %reg_35_ptr
  ret i64 %t61
rt_str_repeat_b9:
  br label %rt_str_repeat_b8
rt_str_repeat_b10:
  br label %rt_str_repeat_b11
rt_str_repeat_b11:
  %t62 = load i64, i64* %var_buf_ptr
  store i64 %t62, i64* %reg_21_ptr
  %t63 = load i64, i64* %var_i_ptr
  store i64 %t63, i64* %reg_22_ptr
  %t64 = load i64, i64* %var_len_ptr
  store i64 %t64, i64* %reg_23_ptr
  %t65 = load i64, i64* %reg_22_ptr
  %t66 = load i64, i64* %reg_23_ptr
  %t67 = mul i64 %t65, %t66
  store i64 %t67, i64* %reg_24_ptr
  %t68 = load i64, i64* %reg_21_ptr
  %t69 = load i64, i64* %reg_24_ptr
  %t70 = add i64 %t68, %t69
  store i64 %t70, i64* %reg_25_ptr
  %t71 = load i64, i64* %var_s_ptr
  store i64 %t71, i64* %reg_26_ptr
  %t72 = load i64, i64* %var_len_ptr
  store i64 %t72, i64* %reg_27_ptr
  %t73 = load i64, i64* %reg_25_ptr
  %t74 = load i64, i64* %reg_26_ptr
  %t75 = load i64, i64* %reg_27_ptr
  %t76 = inttoptr i64 %t73 to i8*
  %t77 = inttoptr i64 %t74 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t76, i8* %t77, i64 %t75, i1 false)
  store i64 0, i64* %reg_28_ptr
  %t78 = load i64, i64* %var_i_ptr
  store i64 %t78, i64* %reg_29_ptr
  %t79 = load i64, i64* %reg_29_ptr
  %t80 = add i64 %t79, 1
  store i64 %t80, i64* %reg_30_ptr
  %t81 = load i64, i64* %reg_30_ptr
  store i64 %t81, i64* %var_i_ptr
  br label %rt_str_repeat_b7
}

define i64 @rt_str_reversed(i64 %arg0) {
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
  %var_i_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_len_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %var_s_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %rt_str_reversed_b1, label %rt_str_reversed_b2
rt_str_reversed_b1:
  ret i64 0
rt_str_reversed_b2:
  br label %rt_str_reversed_b3
rt_str_reversed_b3:
  %t9 = load i64, i64* %var_s_ptr
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t11 = call i64 @rt_strlen(i64 %t10)
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  store i64 %t12, i64* %var_len_ptr
  %t13 = load i64, i64* %var_len_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = add i64 %t14, 1
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = call i64 @__sys_pointer_alloc(i64 %t16)
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  store i64 %t18, i64* %var_buf_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_str_reversed_b4
rt_str_reversed_b4:
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %var_len_ptr
  store i64 %t20, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_8_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = icmp sge i64 %t21, %t22
  %t24 = zext i1 %t23 to i64
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t27 = icmp ne i64 %t25, 0
  %t28 = zext i1 %t27 to i64
  %t26 = icmp ne i64 %t28, 0
  br i1 %t26, label %rt_str_reversed_b6, label %rt_str_reversed_b7
rt_str_reversed_b5:
  %t29 = load i64, i64* %var_buf_ptr
  store i64 %t29, i64* %reg_25_ptr
  %t30 = load i64, i64* %var_len_ptr
  store i64 %t30, i64* %reg_26_ptr
  %t31 = load i64, i64* %reg_25_ptr
  %t32 = load i64, i64* %reg_26_ptr
  %t33 = add i64 %t31, %t32
  store i64 %t33, i64* %reg_27_ptr
  %t34 = load i64, i64* %reg_27_ptr
  %t35 = inttoptr i64 %t34 to i8*
  %t36 = trunc i64 0 to i8
  store i8 %t36, i8* %t35
  store i64 0, i64* %reg_28_ptr
  %t37 = load i64, i64* %var_buf_ptr
  store i64 %t37, i64* %reg_29_ptr
  %t38 = load i64, i64* %reg_29_ptr
  ret i64 %t38
rt_str_reversed_b6:
  br label %rt_str_reversed_b5
rt_str_reversed_b7:
  br label %rt_str_reversed_b8
rt_str_reversed_b8:
  %t39 = load i64, i64* %var_s_ptr
  store i64 %t39, i64* %reg_11_ptr
  %t40 = load i64, i64* %var_len_ptr
  store i64 %t40, i64* %reg_12_ptr
  %t41 = load i64, i64* %reg_11_ptr
  %t42 = load i64, i64* %reg_12_ptr
  %t43 = add i64 %t41, %t42
  store i64 %t43, i64* %reg_13_ptr
  %t44 = load i64, i64* %reg_13_ptr
  %t45 = sub i64 %t44, 1
  store i64 %t45, i64* %reg_14_ptr
  %t46 = load i64, i64* %var_i_ptr
  store i64 %t46, i64* %reg_15_ptr
  %t47 = load i64, i64* %reg_14_ptr
  %t48 = load i64, i64* %reg_15_ptr
  %t49 = sub i64 %t47, %t48
  store i64 %t49, i64* %reg_16_ptr
  %t50 = load i64, i64* %reg_16_ptr
  %t51 = inttoptr i64 %t50 to i8*
  %t52 = load i8, i8* %t51
  %t53 = zext i8 %t52 to i64
  store i64 %t53, i64* %reg_17_ptr
  %t54 = load i64, i64* %reg_17_ptr
  store i64 %t54, i64* %var_ch_ptr
  %t55 = load i64, i64* %var_buf_ptr
  store i64 %t55, i64* %reg_18_ptr
  %t56 = load i64, i64* %var_i_ptr
  store i64 %t56, i64* %reg_19_ptr
  %t57 = load i64, i64* %reg_18_ptr
  %t58 = load i64, i64* %reg_19_ptr
  %t59 = add i64 %t57, %t58
  store i64 %t59, i64* %reg_20_ptr
  %t60 = load i64, i64* %var_ch_ptr
  store i64 %t60, i64* %reg_21_ptr
  %t61 = load i64, i64* %reg_20_ptr
  %t62 = load i64, i64* %reg_21_ptr
  %t63 = inttoptr i64 %t61 to i8*
  %t64 = trunc i64 %t62 to i8
  store i8 %t64, i8* %t63
  store i64 0, i64* %reg_22_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_23_ptr
  %t66 = load i64, i64* %reg_23_ptr
  %t67 = add i64 %t66, 1
  store i64 %t67, i64* %reg_24_ptr
  %t68 = load i64, i64* %reg_24_ptr
  store i64 %t68, i64* %var_i_ptr
  br label %rt_str_reversed_b4
}

define i64 @rt_str_replace(i64 %arg0, i64 %arg1, i64 %arg2) {
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
  %var_new_s_ptr = alloca i64
  %var_s_ptr = alloca i64
  %var_flen_ptr = alloca i64
  %var_newlen_ptr = alloca i64
  %var_idx_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_rest_ptr = alloca i64
  %var_tlen_ptr = alloca i64
  %var_old_s_ptr = alloca i64
  %var_slen_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_old_s_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_new_s_ptr
  %t3 = load i64, i64* %var_s_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_3_ptr
  %t5 = icmp eq i64 %t4, 0
  %t6 = zext i1 %t5 to i64
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t9 = icmp ne i64 %t7, 0
  %t10 = zext i1 %t9 to i64
  %t8 = icmp ne i64 %t10, 0
  br i1 %t8, label %rt_str_replace_b1, label %rt_str_replace_b2
rt_str_replace_b1:
  ret i64 0
rt_str_replace_b2:
  br label %rt_str_replace_b3
rt_str_replace_b3:
  %t11 = load i64, i64* %var_s_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t13 = call i64 @rt_strlen(i64 %t12)
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_6_ptr
  store i64 %t14, i64* %var_slen_ptr
  %t15 = load i64, i64* %var_old_s_ptr
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_7_ptr
  %t17 = call i64 @rt_strlen(i64 %t16)
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  store i64 %t18, i64* %var_flen_ptr
  %t19 = load i64, i64* %var_new_s_ptr
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_9_ptr
  %t21 = call i64 @rt_strlen(i64 %t20)
  store i64 %t21, i64* %reg_10_ptr
  %t22 = load i64, i64* %reg_10_ptr
  store i64 %t22, i64* %var_tlen_ptr
  %t23 = load i64, i64* %var_flen_ptr
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  %t25 = icmp eq i64 %t24, 0
  %t26 = zext i1 %t25 to i64
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t29 = icmp ne i64 %t27, 0
  %t30 = zext i1 %t29 to i64
  %t28 = icmp ne i64 %t30, 0
  br i1 %t28, label %rt_str_replace_b4, label %rt_str_replace_b5
rt_str_replace_b4:
  %t31 = load i64, i64* %var_s_ptr
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = tail call i64 @rt_strdup(i64 %t32)
  store i64 %t33, i64* %reg_14_ptr
  %t34 = load i64, i64* %reg_14_ptr
  ret i64 %t34
rt_str_replace_b5:
  br label %rt_str_replace_b6
rt_str_replace_b6:
  %t35 = load i64, i64* %var_s_ptr
  store i64 %t35, i64* %reg_15_ptr
  %t36 = load i64, i64* %var_old_s_ptr
  store i64 %t36, i64* %reg_16_ptr
  %t37 = load i64, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_16_ptr
  %t39 = call i64 @rt_str_indexOf(i64 %t37, i64 %t38)
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_17_ptr
  store i64 %t40, i64* %var_idx_ptr
  %t41 = load i64, i64* %var_idx_ptr
  store i64 %t41, i64* %reg_18_ptr
  %t42 = load i64, i64* %reg_18_ptr
  %t43 = icmp slt i64 %t42, 0
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %rt_str_replace_b7, label %rt_str_replace_b8
rt_str_replace_b7:
  %t49 = load i64, i64* %var_s_ptr
  store i64 %t49, i64* %reg_20_ptr
  %t50 = load i64, i64* %reg_20_ptr
  %t51 = tail call i64 @rt_strdup(i64 %t50)
  store i64 %t51, i64* %reg_21_ptr
  %t52 = load i64, i64* %reg_21_ptr
  ret i64 %t52
rt_str_replace_b8:
  br label %rt_str_replace_b9
rt_str_replace_b9:
  %t53 = load i64, i64* %var_slen_ptr
  store i64 %t53, i64* %reg_22_ptr
  %t54 = load i64, i64* %var_flen_ptr
  store i64 %t54, i64* %reg_23_ptr
  %t55 = load i64, i64* %reg_22_ptr
  %t56 = load i64, i64* %reg_23_ptr
  %t57 = sub i64 %t55, %t56
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i64, i64* %var_tlen_ptr
  store i64 %t58, i64* %reg_25_ptr
  %t59 = load i64, i64* %reg_24_ptr
  %t60 = load i64, i64* %reg_25_ptr
  %t61 = add i64 %t59, %t60
  store i64 %t61, i64* %reg_26_ptr
  %t62 = load i64, i64* %reg_26_ptr
  store i64 %t62, i64* %var_newlen_ptr
  %t63 = load i64, i64* %var_newlen_ptr
  store i64 %t63, i64* %reg_27_ptr
  %t64 = load i64, i64* %reg_27_ptr
  %t65 = add i64 %t64, 1
  store i64 %t65, i64* %reg_28_ptr
  %t66 = load i64, i64* %reg_28_ptr
  %t67 = call i64 @__sys_pointer_alloc(i64 %t66)
  store i64 %t67, i64* %reg_29_ptr
  %t68 = load i64, i64* %reg_29_ptr
  store i64 %t68, i64* %var_buf_ptr
  %t69 = load i64, i64* %var_idx_ptr
  store i64 %t69, i64* %reg_30_ptr
  %t70 = load i64, i64* %reg_30_ptr
  %t71 = icmp sgt i64 %t70, 0
  %t72 = zext i1 %t71 to i64
  store i64 %t72, i64* %reg_31_ptr
  %t73 = load i64, i64* %reg_31_ptr
  %t75 = icmp ne i64 %t73, 0
  %t76 = zext i1 %t75 to i64
  %t74 = icmp ne i64 %t76, 0
  br i1 %t74, label %rt_str_replace_b10, label %rt_str_replace_b11
rt_str_replace_b10:
  %t77 = load i64, i64* %var_buf_ptr
  store i64 %t77, i64* %reg_32_ptr
  %t78 = load i64, i64* %var_s_ptr
  store i64 %t78, i64* %reg_33_ptr
  %t79 = load i64, i64* %var_idx_ptr
  store i64 %t79, i64* %reg_34_ptr
  %t80 = load i64, i64* %reg_32_ptr
  %t81 = load i64, i64* %reg_33_ptr
  %t82 = load i64, i64* %reg_34_ptr
  %t83 = inttoptr i64 %t80 to i8*
  %t84 = inttoptr i64 %t81 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t83, i8* %t84, i64 %t82, i1 false)
  store i64 0, i64* %reg_35_ptr
  br label %rt_str_replace_b12
rt_str_replace_b11:
  br label %rt_str_replace_b12
rt_str_replace_b12:
  %t85 = load i64, i64* %var_tlen_ptr
  store i64 %t85, i64* %reg_36_ptr
  %t86 = load i64, i64* %reg_36_ptr
  %t87 = icmp sgt i64 %t86, 0
  %t88 = zext i1 %t87 to i64
  store i64 %t88, i64* %reg_37_ptr
  %t89 = load i64, i64* %reg_37_ptr
  %t91 = icmp ne i64 %t89, 0
  %t92 = zext i1 %t91 to i64
  %t90 = icmp ne i64 %t92, 0
  br i1 %t90, label %rt_str_replace_b13, label %rt_str_replace_b14
rt_str_replace_b13:
  %t93 = load i64, i64* %var_buf_ptr
  store i64 %t93, i64* %reg_38_ptr
  %t94 = load i64, i64* %var_idx_ptr
  store i64 %t94, i64* %reg_39_ptr
  %t95 = load i64, i64* %reg_38_ptr
  %t96 = load i64, i64* %reg_39_ptr
  %t97 = add i64 %t95, %t96
  store i64 %t97, i64* %reg_40_ptr
  %t98 = load i64, i64* %var_new_s_ptr
  store i64 %t98, i64* %reg_41_ptr
  %t99 = load i64, i64* %var_tlen_ptr
  store i64 %t99, i64* %reg_42_ptr
  %t100 = load i64, i64* %reg_40_ptr
  %t101 = load i64, i64* %reg_41_ptr
  %t102 = load i64, i64* %reg_42_ptr
  %t103 = inttoptr i64 %t100 to i8*
  %t104 = inttoptr i64 %t101 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t103, i8* %t104, i64 %t102, i1 false)
  store i64 0, i64* %reg_43_ptr
  br label %rt_str_replace_b15
rt_str_replace_b14:
  br label %rt_str_replace_b15
rt_str_replace_b15:
  %t105 = load i64, i64* %var_slen_ptr
  store i64 %t105, i64* %reg_44_ptr
  %t106 = load i64, i64* %var_idx_ptr
  store i64 %t106, i64* %reg_45_ptr
  %t107 = load i64, i64* %reg_44_ptr
  %t108 = load i64, i64* %reg_45_ptr
  %t109 = sub i64 %t107, %t108
  store i64 %t109, i64* %reg_46_ptr
  %t110 = load i64, i64* %var_flen_ptr
  store i64 %t110, i64* %reg_47_ptr
  %t111 = load i64, i64* %reg_46_ptr
  %t112 = load i64, i64* %reg_47_ptr
  %t113 = sub i64 %t111, %t112
  store i64 %t113, i64* %reg_48_ptr
  %t114 = load i64, i64* %reg_48_ptr
  store i64 %t114, i64* %var_rest_ptr
  %t115 = load i64, i64* %var_rest_ptr
  store i64 %t115, i64* %reg_49_ptr
  %t116 = load i64, i64* %reg_49_ptr
  %t117 = icmp sgt i64 %t116, 0
  %t118 = zext i1 %t117 to i64
  store i64 %t118, i64* %reg_50_ptr
  %t119 = load i64, i64* %reg_50_ptr
  %t121 = icmp ne i64 %t119, 0
  %t122 = zext i1 %t121 to i64
  %t120 = icmp ne i64 %t122, 0
  br i1 %t120, label %rt_str_replace_b16, label %rt_str_replace_b17
rt_str_replace_b16:
  %t123 = load i64, i64* %var_buf_ptr
  store i64 %t123, i64* %reg_51_ptr
  %t124 = load i64, i64* %var_idx_ptr
  store i64 %t124, i64* %reg_52_ptr
  %t125 = load i64, i64* %reg_51_ptr
  %t126 = load i64, i64* %reg_52_ptr
  %t127 = add i64 %t125, %t126
  store i64 %t127, i64* %reg_53_ptr
  %t128 = load i64, i64* %var_tlen_ptr
  store i64 %t128, i64* %reg_54_ptr
  %t129 = load i64, i64* %reg_53_ptr
  %t130 = load i64, i64* %reg_54_ptr
  %t131 = add i64 %t129, %t130
  store i64 %t131, i64* %reg_55_ptr
  %t132 = load i64, i64* %var_s_ptr
  store i64 %t132, i64* %reg_56_ptr
  %t133 = load i64, i64* %var_idx_ptr
  store i64 %t133, i64* %reg_57_ptr
  %t134 = load i64, i64* %reg_56_ptr
  %t135 = load i64, i64* %reg_57_ptr
  %t136 = add i64 %t134, %t135
  store i64 %t136, i64* %reg_58_ptr
  %t137 = load i64, i64* %var_flen_ptr
  store i64 %t137, i64* %reg_59_ptr
  %t138 = load i64, i64* %reg_58_ptr
  %t139 = load i64, i64* %reg_59_ptr
  %t140 = add i64 %t138, %t139
  store i64 %t140, i64* %reg_60_ptr
  %t141 = load i64, i64* %var_rest_ptr
  store i64 %t141, i64* %reg_61_ptr
  %t142 = load i64, i64* %reg_55_ptr
  %t143 = load i64, i64* %reg_60_ptr
  %t144 = load i64, i64* %reg_61_ptr
  %t145 = inttoptr i64 %t142 to i8*
  %t146 = inttoptr i64 %t143 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t145, i8* %t146, i64 %t144, i1 false)
  store i64 0, i64* %reg_62_ptr
  br label %rt_str_replace_b18
rt_str_replace_b17:
  br label %rt_str_replace_b18
rt_str_replace_b18:
  %t147 = load i64, i64* %var_buf_ptr
  store i64 %t147, i64* %reg_63_ptr
  %t148 = load i64, i64* %var_newlen_ptr
  store i64 %t148, i64* %reg_64_ptr
  %t149 = load i64, i64* %reg_63_ptr
  %t150 = load i64, i64* %reg_64_ptr
  %t151 = add i64 %t149, %t150
  store i64 %t151, i64* %reg_65_ptr
  %t152 = load i64, i64* %reg_65_ptr
  %t153 = inttoptr i64 %t152 to i8*
  %t154 = trunc i64 0 to i8
  store i8 %t154, i8* %t153
  store i64 0, i64* %reg_66_ptr
  %t155 = load i64, i64* %var_buf_ptr
  store i64 %t155, i64* %reg_67_ptr
  %t156 = load i64, i64* %reg_67_ptr
  ret i64 %t156
}

define i64 @rt_str_replace_all(i64 %arg0, i64 %arg1, i64 %arg2) {
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
  %reg_72_ptr = alloca i64
  %reg_73_ptr = alloca i64
  %reg_74_ptr = alloca i64
  %reg_75_ptr = alloca i64
  %reg_76_ptr = alloca i64
  %reg_77_ptr = alloca i64
  %reg_78_ptr = alloca i64
  %reg_79_ptr = alloca i64
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca i64
  %reg_82_ptr = alloca i64
  %reg_83_ptr = alloca i64
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i64
  %reg_86_ptr = alloca i64
  %reg_87_ptr = alloca i64
  %reg_88_ptr = alloca i64
  %reg_89_ptr = alloca i64
  %reg_90_ptr = alloca i64
  %reg_91_ptr = alloca i64
  %reg_92_ptr = alloca i64
  %reg_93_ptr = alloca i64
  %reg_94_ptr = alloca i64
  %reg_95_ptr = alloca i64
  %reg_96_ptr = alloca i64
  %reg_97_ptr = alloca i64
  %reg_98_ptr = alloca i64
  %reg_99_ptr = alloca i64
  %reg_100_ptr = alloca i64
  %reg_101_ptr = alloca i64
  %reg_102_ptr = alloca i64
  %reg_103_ptr = alloca i64
  %reg_104_ptr = alloca i64
  %reg_105_ptr = alloca i64
  %reg_106_ptr = alloca i64
  %reg_107_ptr = alloca i64
  %reg_108_ptr = alloca i64
  %reg_109_ptr = alloca i64
  %reg_110_ptr = alloca i64
  %reg_111_ptr = alloca i64
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i64
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca i64
  %reg_116_ptr = alloca i64
  %reg_117_ptr = alloca i64
  %reg_118_ptr = alloca i64
  %reg_119_ptr = alloca i64
  %reg_120_ptr = alloca i64
  %reg_121_ptr = alloca i64
  %reg_122_ptr = alloca i64
  %reg_123_ptr = alloca i64
  %reg_124_ptr = alloca i64
  %reg_125_ptr = alloca i64
  %reg_126_ptr = alloca i64
  %var_slen_ptr = alloca i64
  %var_flen_ptr = alloca i64
  %var_dst_pos_ptr = alloca i64
  %var_matched_ptr = alloca i64
  %var_ch_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_old_s_ptr = alloca i64
  %var_cb_ptr = alloca i64
  %var_j_ptr = alloca i64
  %var_src_pos_ptr = alloca i64
  %var_found_ptr = alloca i64
  %var_cnt_ptr = alloca i64
  %var_can_match_ptr = alloca i64
  %var_ca_ptr = alloca i64
  %var_pos_ptr = alloca i64
  %var_newlen_ptr = alloca i64
  %var_new_s_ptr = alloca i64
  %var_tlen_ptr = alloca i64
  %var_s_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_s_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_old_s_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_new_s_ptr
  %t3 = load i64, i64* %var_s_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_3_ptr
  %t5 = icmp eq i64 %t4, 0
  %t6 = zext i1 %t5 to i64
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t9 = icmp ne i64 %t7, 0
  %t10 = zext i1 %t9 to i64
  %t8 = icmp ne i64 %t10, 0
  br i1 %t8, label %rt_str_replace_all_b1, label %rt_str_replace_all_b2
rt_str_replace_all_b1:
  ret i64 0
rt_str_replace_all_b2:
  br label %rt_str_replace_all_b3
rt_str_replace_all_b3:
  %t11 = load i64, i64* %var_old_s_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t13 = call i64 @rt_strlen(i64 %t12)
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_6_ptr
  store i64 %t14, i64* %var_flen_ptr
  %t15 = load i64, i64* %var_flen_ptr
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_7_ptr
  %t17 = icmp eq i64 %t16, 0
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  %t21 = icmp ne i64 %t19, 0
  %t22 = zext i1 %t21 to i64
  %t20 = icmp ne i64 %t22, 0
  br i1 %t20, label %rt_str_replace_all_b4, label %rt_str_replace_all_b5
rt_str_replace_all_b4:
  %t23 = load i64, i64* %var_s_ptr
  store i64 %t23, i64* %reg_9_ptr
  %t24 = load i64, i64* %reg_9_ptr
  %t25 = tail call i64 @rt_strdup(i64 %t24)
  store i64 %t25, i64* %reg_10_ptr
  %t26 = load i64, i64* %reg_10_ptr
  ret i64 %t26
rt_str_replace_all_b5:
  br label %rt_str_replace_all_b6
rt_str_replace_all_b6:
  %t27 = load i64, i64* %var_s_ptr
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_11_ptr
  %t29 = call i64 @rt_strlen(i64 %t28)
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %reg_12_ptr
  store i64 %t30, i64* %var_slen_ptr
  %t31 = load i64, i64* %var_new_s_ptr
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = call i64 @rt_strlen(i64 %t32)
  store i64 %t33, i64* %reg_14_ptr
  %t34 = load i64, i64* %reg_14_ptr
  store i64 %t34, i64* %var_tlen_ptr
  store i64 0, i64* %var_cnt_ptr
  store i64 0, i64* %var_pos_ptr
  br label %rt_str_replace_all_b7
rt_str_replace_all_b7:
  %t35 = load i64, i64* %var_pos_ptr
  store i64 %t35, i64* %reg_15_ptr
  %t36 = load i64, i64* %var_slen_ptr
  store i64 %t36, i64* %reg_16_ptr
  %t37 = load i64, i64* %var_flen_ptr
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i64, i64* %reg_16_ptr
  %t39 = load i64, i64* %reg_17_ptr
  %t40 = sub i64 %t38, %t39
  store i64 %t40, i64* %reg_18_ptr
  %t41 = load i64, i64* %reg_15_ptr
  %t42 = load i64, i64* %reg_18_ptr
  %t43 = icmp sgt i64 %t41, %t42
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %rt_str_replace_all_b9, label %rt_str_replace_all_b10
rt_str_replace_all_b8:
  %t49 = load i64, i64* %var_cnt_ptr
  store i64 %t49, i64* %reg_49_ptr
  %t50 = load i64, i64* %reg_49_ptr
  %t51 = icmp eq i64 %t50, 0
  %t52 = zext i1 %t51 to i64
  store i64 %t52, i64* %reg_50_ptr
  %t53 = load i64, i64* %reg_50_ptr
  %t55 = icmp ne i64 %t53, 0
  %t56 = zext i1 %t55 to i64
  %t54 = icmp ne i64 %t56, 0
  br i1 %t54, label %rt_str_replace_all_b26, label %rt_str_replace_all_b27
rt_str_replace_all_b9:
  br label %rt_str_replace_all_b8
rt_str_replace_all_b10:
  br label %rt_str_replace_all_b11
rt_str_replace_all_b11:
  store i64 0, i64* %var_j_ptr
  store i64 1, i64* %var_matched_ptr
  br label %rt_str_replace_all_b12
rt_str_replace_all_b12:
  %t57 = load i64, i64* %var_j_ptr
  store i64 %t57, i64* %reg_20_ptr
  %t58 = load i64, i64* %var_flen_ptr
  store i64 %t58, i64* %reg_21_ptr
  %t59 = load i64, i64* %reg_20_ptr
  %t60 = load i64, i64* %reg_21_ptr
  %t61 = icmp sge i64 %t59, %t60
  %t62 = zext i1 %t61 to i64
  store i64 %t62, i64* %reg_22_ptr
  %t63 = load i64, i64* %reg_22_ptr
  %t65 = icmp ne i64 %t63, 0
  %t66 = zext i1 %t65 to i64
  %t64 = icmp ne i64 %t66, 0
  br i1 %t64, label %rt_str_replace_all_b14, label %rt_str_replace_all_b15
rt_str_replace_all_b13:
  %t67 = load i64, i64* %var_matched_ptr
  store i64 %t67, i64* %reg_38_ptr
  %t68 = load i64, i64* %reg_38_ptr
  %t69 = icmp eq i64 %t68, 1
  %t70 = zext i1 %t69 to i64
  store i64 %t70, i64* %reg_39_ptr
  %t71 = load i64, i64* %reg_39_ptr
  %t73 = icmp ne i64 %t71, 0
  %t74 = zext i1 %t73 to i64
  %t72 = icmp ne i64 %t74, 0
  br i1 %t72, label %rt_str_replace_all_b20, label %rt_str_replace_all_b21
rt_str_replace_all_b14:
  br label %rt_str_replace_all_b13
rt_str_replace_all_b15:
  br label %rt_str_replace_all_b16
rt_str_replace_all_b16:
  %t75 = load i64, i64* %var_s_ptr
  store i64 %t75, i64* %reg_23_ptr
  %t76 = load i64, i64* %var_pos_ptr
  store i64 %t76, i64* %reg_24_ptr
  %t77 = load i64, i64* %reg_23_ptr
  %t78 = load i64, i64* %reg_24_ptr
  %t79 = add i64 %t77, %t78
  store i64 %t79, i64* %reg_25_ptr
  %t80 = load i64, i64* %var_j_ptr
  store i64 %t80, i64* %reg_26_ptr
  %t81 = load i64, i64* %reg_25_ptr
  %t82 = load i64, i64* %reg_26_ptr
  %t83 = add i64 %t81, %t82
  store i64 %t83, i64* %reg_27_ptr
  %t84 = load i64, i64* %reg_27_ptr
  %t85 = inttoptr i64 %t84 to i8*
  %t86 = load i8, i8* %t85
  %t87 = zext i8 %t86 to i64
  store i64 %t87, i64* %reg_28_ptr
  %t88 = load i64, i64* %reg_28_ptr
  store i64 %t88, i64* %var_ca_ptr
  %t89 = load i64, i64* %var_old_s_ptr
  store i64 %t89, i64* %reg_29_ptr
  %t90 = load i64, i64* %var_j_ptr
  store i64 %t90, i64* %reg_30_ptr
  %t91 = load i64, i64* %reg_29_ptr
  %t92 = load i64, i64* %reg_30_ptr
  %t93 = add i64 %t91, %t92
  store i64 %t93, i64* %reg_31_ptr
  %t94 = load i64, i64* %reg_31_ptr
  %t95 = inttoptr i64 %t94 to i8*
  %t96 = load i8, i8* %t95
  %t97 = zext i8 %t96 to i64
  store i64 %t97, i64* %reg_32_ptr
  %t98 = load i64, i64* %reg_32_ptr
  store i64 %t98, i64* %var_cb_ptr
  %t99 = load i64, i64* %var_ca_ptr
  store i64 %t99, i64* %reg_33_ptr
  %t100 = load i64, i64* %var_cb_ptr
  store i64 %t100, i64* %reg_34_ptr
  %t101 = load i64, i64* %reg_33_ptr
  %t102 = load i64, i64* %reg_34_ptr
  %t103 = icmp ne i64 %t101, %t102
  %t104 = zext i1 %t103 to i64
  store i64 %t104, i64* %reg_35_ptr
  %t105 = load i64, i64* %reg_35_ptr
  %t107 = icmp ne i64 %t105, 0
  %t108 = zext i1 %t107 to i64
  %t106 = icmp ne i64 %t108, 0
  br i1 %t106, label %rt_str_replace_all_b17, label %rt_str_replace_all_b18
rt_str_replace_all_b17:
  store i64 0, i64* %var_matched_ptr
  br label %rt_str_replace_all_b13
rt_str_replace_all_b18:
  br label %rt_str_replace_all_b19
rt_str_replace_all_b19:
  %t109 = load i64, i64* %var_j_ptr
  store i64 %t109, i64* %reg_36_ptr
  %t110 = load i64, i64* %reg_36_ptr
  %t111 = add i64 %t110, 1
  store i64 %t111, i64* %reg_37_ptr
  %t112 = load i64, i64* %reg_37_ptr
  store i64 %t112, i64* %var_j_ptr
  br label %rt_str_replace_all_b12
rt_str_replace_all_b20:
  %t113 = load i64, i64* %var_cnt_ptr
  store i64 %t113, i64* %reg_40_ptr
  %t114 = load i64, i64* %reg_40_ptr
  %t115 = add i64 %t114, 1
  store i64 %t115, i64* %reg_41_ptr
  %t116 = load i64, i64* %reg_41_ptr
  store i64 %t116, i64* %var_cnt_ptr
  %t117 = load i64, i64* %var_pos_ptr
  store i64 %t117, i64* %reg_42_ptr
  %t118 = load i64, i64* %var_flen_ptr
  store i64 %t118, i64* %reg_43_ptr
  %t119 = load i64, i64* %reg_42_ptr
  %t120 = load i64, i64* %reg_43_ptr
  %t121 = add i64 %t119, %t120
  store i64 %t121, i64* %reg_44_ptr
  %t122 = load i64, i64* %reg_44_ptr
  store i64 %t122, i64* %var_pos_ptr
  br label %rt_str_replace_all_b22
rt_str_replace_all_b21:
  br label %rt_str_replace_all_b22
rt_str_replace_all_b22:
  %t123 = load i64, i64* %var_matched_ptr
  store i64 %t123, i64* %reg_45_ptr
  %t124 = load i64, i64* %reg_45_ptr
  %t125 = icmp ne i64 %t124, 1
  %t126 = zext i1 %t125 to i64
  store i64 %t126, i64* %reg_46_ptr
  %t127 = load i64, i64* %reg_46_ptr
  %t129 = icmp ne i64 %t127, 0
  %t130 = zext i1 %t129 to i64
  %t128 = icmp ne i64 %t130, 0
  br i1 %t128, label %rt_str_replace_all_b23, label %rt_str_replace_all_b24
rt_str_replace_all_b23:
  %t131 = load i64, i64* %var_pos_ptr
  store i64 %t131, i64* %reg_47_ptr
  %t132 = load i64, i64* %reg_47_ptr
  %t133 = add i64 %t132, 1
  store i64 %t133, i64* %reg_48_ptr
  %t134 = load i64, i64* %reg_48_ptr
  store i64 %t134, i64* %var_pos_ptr
  br label %rt_str_replace_all_b25
rt_str_replace_all_b24:
  br label %rt_str_replace_all_b25
rt_str_replace_all_b25:
  br label %rt_str_replace_all_b7
rt_str_replace_all_b26:
  %t135 = load i64, i64* %var_s_ptr
  store i64 %t135, i64* %reg_51_ptr
  %t136 = load i64, i64* %reg_51_ptr
  %t137 = tail call i64 @rt_strdup(i64 %t136)
  store i64 %t137, i64* %reg_52_ptr
  %t138 = load i64, i64* %reg_52_ptr
  ret i64 %t138
rt_str_replace_all_b27:
  br label %rt_str_replace_all_b28
rt_str_replace_all_b28:
  %t139 = load i64, i64* %var_slen_ptr
  store i64 %t139, i64* %reg_53_ptr
  %t140 = load i64, i64* %var_cnt_ptr
  store i64 %t140, i64* %reg_54_ptr
  %t141 = load i64, i64* %var_tlen_ptr
  store i64 %t141, i64* %reg_55_ptr
  %t142 = load i64, i64* %var_flen_ptr
  store i64 %t142, i64* %reg_56_ptr
  %t143 = load i64, i64* %reg_55_ptr
  %t144 = load i64, i64* %reg_56_ptr
  %t145 = sub i64 %t143, %t144
  store i64 %t145, i64* %reg_57_ptr
  %t146 = load i64, i64* %reg_54_ptr
  %t147 = load i64, i64* %reg_57_ptr
  %t148 = mul i64 %t146, %t147
  store i64 %t148, i64* %reg_58_ptr
  %t149 = load i64, i64* %reg_53_ptr
  %t150 = load i64, i64* %reg_58_ptr
  %t151 = add i64 %t149, %t150
  store i64 %t151, i64* %reg_59_ptr
  %t152 = load i64, i64* %reg_59_ptr
  store i64 %t152, i64* %var_newlen_ptr
  %t153 = load i64, i64* %var_newlen_ptr
  store i64 %t153, i64* %reg_60_ptr
  %t154 = load i64, i64* %reg_60_ptr
  %t155 = add i64 %t154, 1
  store i64 %t155, i64* %reg_61_ptr
  %t156 = load i64, i64* %reg_61_ptr
  %t157 = call i64 @__sys_pointer_alloc(i64 %t156)
  store i64 %t157, i64* %reg_62_ptr
  %t158 = load i64, i64* %reg_62_ptr
  store i64 %t158, i64* %var_buf_ptr
  store i64 0, i64* %var_src_pos_ptr
  store i64 0, i64* %var_dst_pos_ptr
  br label %rt_str_replace_all_b29
rt_str_replace_all_b29:
  %t159 = load i64, i64* %var_src_pos_ptr
  store i64 %t159, i64* %reg_63_ptr
  %t160 = load i64, i64* %var_slen_ptr
  store i64 %t160, i64* %reg_64_ptr
  %t161 = load i64, i64* %reg_63_ptr
  %t162 = load i64, i64* %reg_64_ptr
  %t163 = icmp sge i64 %t161, %t162
  %t164 = zext i1 %t163 to i64
  store i64 %t164, i64* %reg_65_ptr
  %t165 = load i64, i64* %reg_65_ptr
  %t167 = icmp ne i64 %t165, 0
  %t168 = zext i1 %t167 to i64
  %t166 = icmp ne i64 %t168, 0
  br i1 %t166, label %rt_str_replace_all_b31, label %rt_str_replace_all_b32
rt_str_replace_all_b30:
  %t169 = load i64, i64* %var_buf_ptr
  store i64 %t169, i64* %reg_122_ptr
  %t170 = load i64, i64* %var_newlen_ptr
  store i64 %t170, i64* %reg_123_ptr
  %t171 = load i64, i64* %reg_122_ptr
  %t172 = load i64, i64* %reg_123_ptr
  %t173 = add i64 %t171, %t172
  store i64 %t173, i64* %reg_124_ptr
  %t174 = load i64, i64* %reg_124_ptr
  %t175 = inttoptr i64 %t174 to i8*
  %t176 = trunc i64 0 to i8
  store i8 %t176, i8* %t175
  store i64 0, i64* %reg_125_ptr
  %t177 = load i64, i64* %var_buf_ptr
  store i64 %t177, i64* %reg_126_ptr
  %t178 = load i64, i64* %reg_126_ptr
  ret i64 %t178
rt_str_replace_all_b31:
  br label %rt_str_replace_all_b30
rt_str_replace_all_b32:
  br label %rt_str_replace_all_b33
rt_str_replace_all_b33:
  store i64 0, i64* %var_can_match_ptr
  %t179 = load i64, i64* %var_src_pos_ptr
  store i64 %t179, i64* %reg_66_ptr
  %t180 = load i64, i64* %var_flen_ptr
  store i64 %t180, i64* %reg_67_ptr
  %t181 = load i64, i64* %reg_66_ptr
  %t182 = load i64, i64* %reg_67_ptr
  %t183 = add i64 %t181, %t182
  store i64 %t183, i64* %reg_68_ptr
  %t184 = load i64, i64* %var_slen_ptr
  store i64 %t184, i64* %reg_69_ptr
  %t185 = load i64, i64* %reg_68_ptr
  %t186 = load i64, i64* %reg_69_ptr
  %t187 = icmp sle i64 %t185, %t186
  %t188 = zext i1 %t187 to i64
  store i64 %t188, i64* %reg_70_ptr
  %t189 = load i64, i64* %reg_70_ptr
  %t191 = icmp ne i64 %t189, 0
  %t192 = zext i1 %t191 to i64
  %t190 = icmp ne i64 %t192, 0
  br i1 %t190, label %rt_str_replace_all_b34, label %rt_str_replace_all_b35
rt_str_replace_all_b34:
  store i64 1, i64* %var_can_match_ptr
  br label %rt_str_replace_all_b36
rt_str_replace_all_b35:
  br label %rt_str_replace_all_b36
rt_str_replace_all_b36:
  store i64 0, i64* %var_found_ptr
  %t193 = load i64, i64* %var_can_match_ptr
  store i64 %t193, i64* %reg_71_ptr
  %t194 = load i64, i64* %reg_71_ptr
  %t195 = icmp eq i64 %t194, 1
  %t196 = zext i1 %t195 to i64
  store i64 %t196, i64* %reg_72_ptr
  %t197 = load i64, i64* %reg_72_ptr
  %t199 = icmp ne i64 %t197, 0
  %t200 = zext i1 %t199 to i64
  %t198 = icmp ne i64 %t200, 0
  br i1 %t198, label %rt_str_replace_all_b37, label %rt_str_replace_all_b38
rt_str_replace_all_b37:
  store i64 0, i64* %var_j_ptr
  store i64 1, i64* %var_found_ptr
  br label %rt_str_replace_all_b40
rt_str_replace_all_b38:
  br label %rt_str_replace_all_b39
rt_str_replace_all_b39:
  %t201 = load i64, i64* %var_found_ptr
  store i64 %t201, i64* %reg_91_ptr
  %t202 = load i64, i64* %reg_91_ptr
  %t203 = icmp eq i64 %t202, 1
  %t204 = zext i1 %t203 to i64
  store i64 %t204, i64* %reg_92_ptr
  %t205 = load i64, i64* %reg_92_ptr
  %t207 = icmp ne i64 %t205, 0
  %t208 = zext i1 %t207 to i64
  %t206 = icmp ne i64 %t208, 0
  br i1 %t206, label %rt_str_replace_all_b48, label %rt_str_replace_all_b49
rt_str_replace_all_b40:
  %t209 = load i64, i64* %var_j_ptr
  store i64 %t209, i64* %reg_73_ptr
  %t210 = load i64, i64* %var_flen_ptr
  store i64 %t210, i64* %reg_74_ptr
  %t211 = load i64, i64* %reg_73_ptr
  %t212 = load i64, i64* %reg_74_ptr
  %t213 = icmp sge i64 %t211, %t212
  %t214 = zext i1 %t213 to i64
  store i64 %t214, i64* %reg_75_ptr
  %t215 = load i64, i64* %reg_75_ptr
  %t217 = icmp ne i64 %t215, 0
  %t218 = zext i1 %t217 to i64
  %t216 = icmp ne i64 %t218, 0
  br i1 %t216, label %rt_str_replace_all_b42, label %rt_str_replace_all_b43
rt_str_replace_all_b41:
  br label %rt_str_replace_all_b39
rt_str_replace_all_b42:
  br label %rt_str_replace_all_b41
rt_str_replace_all_b43:
  br label %rt_str_replace_all_b44
rt_str_replace_all_b44:
  %t219 = load i64, i64* %var_s_ptr
  store i64 %t219, i64* %reg_76_ptr
  %t220 = load i64, i64* %var_src_pos_ptr
  store i64 %t220, i64* %reg_77_ptr
  %t221 = load i64, i64* %reg_76_ptr
  %t222 = load i64, i64* %reg_77_ptr
  %t223 = add i64 %t221, %t222
  store i64 %t223, i64* %reg_78_ptr
  %t224 = load i64, i64* %var_j_ptr
  store i64 %t224, i64* %reg_79_ptr
  %t225 = load i64, i64* %reg_78_ptr
  %t226 = load i64, i64* %reg_79_ptr
  %t227 = add i64 %t225, %t226
  store i64 %t227, i64* %reg_80_ptr
  %t228 = load i64, i64* %reg_80_ptr
  %t229 = inttoptr i64 %t228 to i8*
  %t230 = load i8, i8* %t229
  %t231 = zext i8 %t230 to i64
  store i64 %t231, i64* %reg_81_ptr
  %t232 = load i64, i64* %reg_81_ptr
  store i64 %t232, i64* %var_ca_ptr
  %t233 = load i64, i64* %var_old_s_ptr
  store i64 %t233, i64* %reg_82_ptr
  %t234 = load i64, i64* %var_j_ptr
  store i64 %t234, i64* %reg_83_ptr
  %t235 = load i64, i64* %reg_82_ptr
  %t236 = load i64, i64* %reg_83_ptr
  %t237 = add i64 %t235, %t236
  store i64 %t237, i64* %reg_84_ptr
  %t238 = load i64, i64* %reg_84_ptr
  %t239 = inttoptr i64 %t238 to i8*
  %t240 = load i8, i8* %t239
  %t241 = zext i8 %t240 to i64
  store i64 %t241, i64* %reg_85_ptr
  %t242 = load i64, i64* %reg_85_ptr
  store i64 %t242, i64* %var_cb_ptr
  %t243 = load i64, i64* %var_ca_ptr
  store i64 %t243, i64* %reg_86_ptr
  %t244 = load i64, i64* %var_cb_ptr
  store i64 %t244, i64* %reg_87_ptr
  %t245 = load i64, i64* %reg_86_ptr
  %t246 = load i64, i64* %reg_87_ptr
  %t247 = icmp ne i64 %t245, %t246
  %t248 = zext i1 %t247 to i64
  store i64 %t248, i64* %reg_88_ptr
  %t249 = load i64, i64* %reg_88_ptr
  %t251 = icmp ne i64 %t249, 0
  %t252 = zext i1 %t251 to i64
  %t250 = icmp ne i64 %t252, 0
  br i1 %t250, label %rt_str_replace_all_b45, label %rt_str_replace_all_b46
rt_str_replace_all_b45:
  store i64 0, i64* %var_found_ptr
  br label %rt_str_replace_all_b41
rt_str_replace_all_b46:
  br label %rt_str_replace_all_b47
rt_str_replace_all_b47:
  %t253 = load i64, i64* %var_j_ptr
  store i64 %t253, i64* %reg_89_ptr
  %t254 = load i64, i64* %reg_89_ptr
  %t255 = add i64 %t254, 1
  store i64 %t255, i64* %reg_90_ptr
  %t256 = load i64, i64* %reg_90_ptr
  store i64 %t256, i64* %var_j_ptr
  br label %rt_str_replace_all_b40
rt_str_replace_all_b48:
  %t257 = load i64, i64* %var_tlen_ptr
  store i64 %t257, i64* %reg_93_ptr
  %t258 = load i64, i64* %reg_93_ptr
  %t259 = icmp sgt i64 %t258, 0
  %t260 = zext i1 %t259 to i64
  store i64 %t260, i64* %reg_94_ptr
  %t261 = load i64, i64* %reg_94_ptr
  %t263 = icmp ne i64 %t261, 0
  %t264 = zext i1 %t263 to i64
  %t262 = icmp ne i64 %t264, 0
  br i1 %t262, label %rt_str_replace_all_b51, label %rt_str_replace_all_b52
rt_str_replace_all_b49:
  br label %rt_str_replace_all_b50
rt_str_replace_all_b50:
  %t265 = load i64, i64* %var_found_ptr
  store i64 %t265, i64* %reg_107_ptr
  %t266 = load i64, i64* %reg_107_ptr
  %t267 = icmp ne i64 %t266, 1
  %t268 = zext i1 %t267 to i64
  store i64 %t268, i64* %reg_108_ptr
  %t269 = load i64, i64* %reg_108_ptr
  %t271 = icmp ne i64 %t269, 0
  %t272 = zext i1 %t271 to i64
  %t270 = icmp ne i64 %t272, 0
  br i1 %t270, label %rt_str_replace_all_b54, label %rt_str_replace_all_b55
rt_str_replace_all_b51:
  %t273 = load i64, i64* %var_buf_ptr
  store i64 %t273, i64* %reg_95_ptr
  %t274 = load i64, i64* %var_dst_pos_ptr
  store i64 %t274, i64* %reg_96_ptr
  %t275 = load i64, i64* %reg_95_ptr
  %t276 = load i64, i64* %reg_96_ptr
  %t277 = add i64 %t275, %t276
  store i64 %t277, i64* %reg_97_ptr
  %t278 = load i64, i64* %var_new_s_ptr
  store i64 %t278, i64* %reg_98_ptr
  %t279 = load i64, i64* %var_tlen_ptr
  store i64 %t279, i64* %reg_99_ptr
  %t280 = load i64, i64* %reg_97_ptr
  %t281 = load i64, i64* %reg_98_ptr
  %t282 = load i64, i64* %reg_99_ptr
  %t283 = inttoptr i64 %t280 to i8*
  %t284 = inttoptr i64 %t281 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t283, i8* %t284, i64 %t282, i1 false)
  store i64 0, i64* %reg_100_ptr
  br label %rt_str_replace_all_b53
rt_str_replace_all_b52:
  br label %rt_str_replace_all_b53
rt_str_replace_all_b53:
  %t285 = load i64, i64* %var_dst_pos_ptr
  store i64 %t285, i64* %reg_101_ptr
  %t286 = load i64, i64* %var_tlen_ptr
  store i64 %t286, i64* %reg_102_ptr
  %t287 = load i64, i64* %reg_101_ptr
  %t288 = load i64, i64* %reg_102_ptr
  %t289 = add i64 %t287, %t288
  store i64 %t289, i64* %reg_103_ptr
  %t290 = load i64, i64* %reg_103_ptr
  store i64 %t290, i64* %var_dst_pos_ptr
  %t291 = load i64, i64* %var_src_pos_ptr
  store i64 %t291, i64* %reg_104_ptr
  %t292 = load i64, i64* %var_flen_ptr
  store i64 %t292, i64* %reg_105_ptr
  %t293 = load i64, i64* %reg_104_ptr
  %t294 = load i64, i64* %reg_105_ptr
  %t295 = add i64 %t293, %t294
  store i64 %t295, i64* %reg_106_ptr
  %t296 = load i64, i64* %reg_106_ptr
  store i64 %t296, i64* %var_src_pos_ptr
  br label %rt_str_replace_all_b50
rt_str_replace_all_b54:
  %t297 = load i64, i64* %var_s_ptr
  store i64 %t297, i64* %reg_109_ptr
  %t298 = load i64, i64* %var_src_pos_ptr
  store i64 %t298, i64* %reg_110_ptr
  %t299 = load i64, i64* %reg_109_ptr
  %t300 = load i64, i64* %reg_110_ptr
  %t301 = add i64 %t299, %t300
  store i64 %t301, i64* %reg_111_ptr
  %t302 = load i64, i64* %reg_111_ptr
  %t303 = inttoptr i64 %t302 to i8*
  %t304 = load i8, i8* %t303
  %t305 = zext i8 %t304 to i64
  store i64 %t305, i64* %reg_112_ptr
  %t306 = load i64, i64* %reg_112_ptr
  store i64 %t306, i64* %var_ch_ptr
  %t307 = load i64, i64* %var_buf_ptr
  store i64 %t307, i64* %reg_113_ptr
  %t308 = load i64, i64* %var_dst_pos_ptr
  store i64 %t308, i64* %reg_114_ptr
  %t309 = load i64, i64* %reg_113_ptr
  %t310 = load i64, i64* %reg_114_ptr
  %t311 = add i64 %t309, %t310
  store i64 %t311, i64* %reg_115_ptr
  %t312 = load i64, i64* %var_ch_ptr
  store i64 %t312, i64* %reg_116_ptr
  %t313 = load i64, i64* %reg_115_ptr
  %t314 = load i64, i64* %reg_116_ptr
  %t315 = inttoptr i64 %t313 to i8*
  %t316 = trunc i64 %t314 to i8
  store i8 %t316, i8* %t315
  store i64 0, i64* %reg_117_ptr
  %t317 = load i64, i64* %var_dst_pos_ptr
  store i64 %t317, i64* %reg_118_ptr
  %t318 = load i64, i64* %reg_118_ptr
  %t319 = add i64 %t318, 1
  store i64 %t319, i64* %reg_119_ptr
  %t320 = load i64, i64* %reg_119_ptr
  store i64 %t320, i64* %var_dst_pos_ptr
  %t321 = load i64, i64* %var_src_pos_ptr
  store i64 %t321, i64* %reg_120_ptr
  %t322 = load i64, i64* %reg_120_ptr
  %t323 = add i64 %t322, 1
  store i64 %t323, i64* %reg_121_ptr
  %t324 = load i64, i64* %reg_121_ptr
  store i64 %t324, i64* %var_src_pos_ptr
  br label %rt_str_replace_all_b56
rt_str_replace_all_b55:
  br label %rt_str_replace_all_b56
rt_str_replace_all_b56:
  br label %rt_str_replace_all_b29
}

define i64 @make_str(i64 %arg0, i64 %arg1, i64 %arg2) {
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
  %var_c1_ptr = alloca i64
  %var_c2_ptr = alloca i64
  %var_c3_ptr = alloca i64
  %var_buf_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_c1_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_c2_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_c3_ptr
  %t3 = call i64 @__sys_pointer_alloc(i64 4)
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_3_ptr
  store i64 %t4, i64* %var_buf_ptr
  %t5 = load i64, i64* %var_buf_ptr
  store i64 %t5, i64* %reg_4_ptr
  %t6 = load i64, i64* %var_c1_ptr
  store i64 %t6, i64* %reg_5_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_5_ptr
  %t9 = inttoptr i64 %t7 to i8*
  %t10 = trunc i64 %t8 to i8
  store i8 %t10, i8* %t9
  store i64 0, i64* %reg_6_ptr
  %t11 = load i64, i64* %var_buf_ptr
  store i64 %t11, i64* %reg_7_ptr
  %t12 = load i64, i64* %reg_7_ptr
  %t13 = add i64 %t12, 1
  store i64 %t13, i64* %reg_8_ptr
  %t14 = load i64, i64* %var_c2_ptr
  store i64 %t14, i64* %reg_9_ptr
  %t15 = load i64, i64* %reg_8_ptr
  %t16 = load i64, i64* %reg_9_ptr
  %t17 = inttoptr i64 %t15 to i8*
  %t18 = trunc i64 %t16 to i8
  store i8 %t18, i8* %t17
  store i64 0, i64* %reg_10_ptr
  %t19 = load i64, i64* %var_buf_ptr
  store i64 %t19, i64* %reg_11_ptr
  %t20 = load i64, i64* %reg_11_ptr
  %t21 = add i64 %t20, 2
  store i64 %t21, i64* %reg_12_ptr
  %t22 = load i64, i64* %var_c3_ptr
  store i64 %t22, i64* %reg_13_ptr
  %t23 = load i64, i64* %reg_12_ptr
  %t24 = load i64, i64* %reg_13_ptr
  %t25 = inttoptr i64 %t23 to i8*
  %t26 = trunc i64 %t24 to i8
  store i8 %t26, i8* %t25
  store i64 0, i64* %reg_14_ptr
  %t27 = load i64, i64* %var_buf_ptr
  store i64 %t27, i64* %reg_15_ptr
  %t28 = load i64, i64* %reg_15_ptr
  %t29 = add i64 %t28, 3
  store i64 %t29, i64* %reg_16_ptr
  %t30 = load i64, i64* %reg_16_ptr
  %t31 = inttoptr i64 %t30 to i8*
  %t32 = trunc i64 0 to i8
  store i8 %t32, i8* %t31
  store i64 0, i64* %reg_17_ptr
  %t33 = load i64, i64* %var_buf_ptr
  store i64 %t33, i64* %reg_18_ptr
  %t34 = load i64, i64* %reg_18_ptr
  ret i64 %t34
}

define i64 @make_empty() {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %t0 = call i64 @__sys_pointer_alloc(i64 1)
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  store i64 %t1, i64* %var_buf_ptr
  %t2 = load i64, i64* %var_buf_ptr
  store i64 %t2, i64* %reg_1_ptr
  %t3 = load i64, i64* %reg_1_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = trunc i64 0 to i8
  store i8 %t5, i8* %t4
  store i64 0, i64* %reg_2_ptr
  %t6 = load i64, i64* %var_buf_ptr
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  ret i64 %t7
}

define i32 @main() {
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
  %reg_72_ptr = alloca i64
  %reg_73_ptr = alloca i64
  %reg_74_ptr = alloca i64
  %reg_75_ptr = alloca i64
  %reg_76_ptr = alloca i64
  %reg_77_ptr = alloca i64
  %reg_78_ptr = alloca i64
  %reg_79_ptr = alloca i64
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca i64
  %reg_82_ptr = alloca i64
  %reg_83_ptr = alloca i64
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i64
  %reg_86_ptr = alloca i64
  %reg_87_ptr = alloca i64
  %reg_88_ptr = alloca i64
  %reg_89_ptr = alloca i64
  %reg_90_ptr = alloca i64
  %reg_91_ptr = alloca i64
  %reg_92_ptr = alloca i64
  %reg_93_ptr = alloca i64
  %reg_94_ptr = alloca i64
  %reg_95_ptr = alloca i64
  %reg_96_ptr = alloca i64
  %reg_97_ptr = alloca i64
  %reg_98_ptr = alloca i64
  %reg_99_ptr = alloca i64
  %reg_100_ptr = alloca i64
  %reg_101_ptr = alloca i64
  %reg_102_ptr = alloca i64
  %reg_103_ptr = alloca i64
  %reg_104_ptr = alloca i64
  %reg_105_ptr = alloca i64
  %reg_106_ptr = alloca i64
  %reg_107_ptr = alloca i64
  %reg_108_ptr = alloca i64
  %reg_109_ptr = alloca i64
  %reg_110_ptr = alloca i64
  %reg_111_ptr = alloca i64
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i64
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca i64
  %reg_116_ptr = alloca i64
  %reg_117_ptr = alloca i64
  %reg_118_ptr = alloca i64
  %reg_119_ptr = alloca i64
  %reg_120_ptr = alloca i64
  %reg_121_ptr = alloca i64
  %reg_122_ptr = alloca i64
  %reg_123_ptr = alloca i64
  %reg_124_ptr = alloca i64
  %reg_125_ptr = alloca i64
  %reg_126_ptr = alloca i64
  %reg_127_ptr = alloca i64
  %reg_128_ptr = alloca i64
  %reg_129_ptr = alloca i64
  %reg_130_ptr = alloca i64
  %reg_131_ptr = alloca i64
  %reg_132_ptr = alloca i64
  %reg_133_ptr = alloca i64
  %reg_134_ptr = alloca i64
  %reg_135_ptr = alloca i64
  %reg_136_ptr = alloca i64
  %reg_137_ptr = alloca i64
  %reg_138_ptr = alloca i64
  %reg_139_ptr = alloca i64
  %reg_140_ptr = alloca i64
  %reg_141_ptr = alloca i64
  %reg_142_ptr = alloca i64
  %reg_143_ptr = alloca i64
  %reg_144_ptr = alloca i64
  %reg_145_ptr = alloca i64
  %reg_146_ptr = alloca i64
  %reg_147_ptr = alloca i64
  %reg_148_ptr = alloca i64
  %reg_149_ptr = alloca i64
  %reg_150_ptr = alloca i64
  %reg_151_ptr = alloca i64
  %reg_152_ptr = alloca i64
  %reg_153_ptr = alloca i64
  %reg_154_ptr = alloca i64
  %reg_155_ptr = alloca i64
  %reg_156_ptr = alloca i64
  %reg_157_ptr = alloca i64
  %reg_158_ptr = alloca i64
  %reg_159_ptr = alloca i64
  %reg_160_ptr = alloca i64
  %reg_161_ptr = alloca i64
  %reg_162_ptr = alloca i64
  %reg_163_ptr = alloca i64
  %reg_164_ptr = alloca i64
  %reg_165_ptr = alloca i64
  %reg_166_ptr = alloca i64
  %var_rev_ptr = alloca i64
  %var_lower_back_ptr = alloca i64
  %var_neg1_ptr = alloca i64
  %var_abc_ptr = alloca i64
  %var_cmp1_ptr = alloca i64
  %var_sneg_ptr = alloca i64
  %var_sub_ptr = alloca i64
  %var_s0_ptr = alloca i64
  %var_upper_abc_ptr = alloca i64
  %var_xx_ptr = alloca i64
  %var_replaced_ptr = alloca i64
  %var_abc2_ptr = alloca i64
  %var_empty_ptr = alloca i64
  %var_def_ptr = alloca i64
  %var_ab_ptr = alloca i64
  %var_rep_ptr = alloca i64
  %var_trimmed_ptr = alloca i64
  %var_bc_ptr = alloca i64
  %var_joined_ptr = alloca i64
  %var_padded_ptr = alloca i64
  %var_s42_ptr = alloca i64
  %t0 = call i64 @make_str(i64 97, i64 98, i64 99)
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  store i64 %t1, i64* %var_abc_ptr
  %t2 = call i64 @make_str(i64 100, i64 101, i64 102)
  store i64 %t2, i64* %reg_1_ptr
  %t3 = load i64, i64* %reg_1_ptr
  store i64 %t3, i64* %var_def_ptr
  %t4 = call i64 @__sys_pointer_alloc(i64 3)
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_ab_ptr
  %t6 = load i64, i64* %var_ab_ptr
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = inttoptr i64 %t7 to i8*
  %t9 = trunc i64 97 to i8
  store i8 %t9, i8* %t8
  store i64 0, i64* %reg_4_ptr
  %t10 = load i64, i64* %var_ab_ptr
  store i64 %t10, i64* %reg_5_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t12 = add i64 %t11, 1
  store i64 %t12, i64* %reg_6_ptr
  %t13 = load i64, i64* %reg_6_ptr
  %t14 = inttoptr i64 %t13 to i8*
  %t15 = trunc i64 98 to i8
  store i8 %t15, i8* %t14
  store i64 0, i64* %reg_7_ptr
  %t16 = load i64, i64* %var_ab_ptr
  store i64 %t16, i64* %reg_8_ptr
  %t17 = load i64, i64* %reg_8_ptr
  %t18 = add i64 %t17, 2
  store i64 %t18, i64* %reg_9_ptr
  %t19 = load i64, i64* %reg_9_ptr
  %t20 = inttoptr i64 %t19 to i8*
  %t21 = trunc i64 0 to i8
  store i8 %t21, i8* %t20
  store i64 0, i64* %reg_10_ptr
  %t22 = call i64 @make_empty()
  store i64 %t22, i64* %reg_11_ptr
  %t23 = load i64, i64* %reg_11_ptr
  store i64 %t23, i64* %var_empty_ptr
  %t24 = load i64, i64* %var_abc_ptr
  store i64 %t24, i64* %reg_12_ptr
  %t25 = load i64, i64* %reg_12_ptr
  %t26 = call i64 @rt_strlen(i64 %t25)
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i64, i64* %reg_13_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t27)
  %t28 = load i64, i64* %var_empty_ptr
  store i64 %t28, i64* %reg_14_ptr
  %t29 = load i64, i64* %reg_14_ptr
  %t30 = call i64 @rt_strlen(i64 %t29)
  store i64 %t30, i64* %reg_15_ptr
  %t31 = load i64, i64* %reg_15_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t31)
  %t32 = call i64 @rt_strlen(i64 0)
  store i64 %t32, i64* %reg_16_ptr
  %t33 = load i64, i64* %reg_16_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t33)
  %t34 = load i64, i64* %var_abc_ptr
  store i64 %t34, i64* %reg_17_ptr
  %t35 = load i64, i64* %var_abc_ptr
  store i64 %t35, i64* %reg_18_ptr
  %t36 = load i64, i64* %reg_17_ptr
  %t37 = load i64, i64* %reg_18_ptr
  %t38 = call i64 @rt_strcmp(i64 %t36, i64 %t37)
  store i64 %t38, i64* %reg_19_ptr
  %t39 = load i64, i64* %reg_19_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t39)
  %t40 = load i64, i64* %var_abc_ptr
  store i64 %t40, i64* %reg_20_ptr
  %t41 = load i64, i64* %var_def_ptr
  store i64 %t41, i64* %reg_21_ptr
  %t42 = load i64, i64* %reg_20_ptr
  %t43 = load i64, i64* %reg_21_ptr
  %t44 = call i64 @rt_strcmp(i64 %t42, i64 %t43)
  store i64 %t44, i64* %reg_22_ptr
  %t45 = load i64, i64* %reg_22_ptr
  store i64 %t45, i64* %var_cmp1_ptr
  store i64 0, i64* %var_neg1_ptr
  %t46 = load i64, i64* %var_cmp1_ptr
  store i64 %t46, i64* %reg_23_ptr
  %t47 = load i64, i64* %reg_23_ptr
  %t48 = icmp slt i64 %t47, 0
  %t49 = zext i1 %t48 to i64
  store i64 %t49, i64* %reg_24_ptr
  %t50 = load i64, i64* %reg_24_ptr
  %t52 = icmp ne i64 %t50, 0
  %t53 = zext i1 %t52 to i64
  %t51 = icmp ne i64 %t53, 0
  br i1 %t51, label %main_b1, label %main_b2
main_b1:
  store i64 1, i64* %var_neg1_ptr
  br label %main_b3
main_b2:
  br label %main_b3
main_b3:
  %t54 = load i64, i64* %var_neg1_ptr
  store i64 %t54, i64* %reg_25_ptr
  %t55 = load i64, i64* %reg_25_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t55)
  %t56 = load i64, i64* %var_abc_ptr
  store i64 %t56, i64* %reg_26_ptr
  %t57 = load i64, i64* %reg_26_ptr
  %t58 = call i64 @rt_strdup(i64 %t57)
  store i64 %t58, i64* %reg_27_ptr
  %t59 = load i64, i64* %reg_27_ptr
  store i64 %t59, i64* %var_abc2_ptr
  %t60 = load i64, i64* %var_abc_ptr
  store i64 %t60, i64* %reg_28_ptr
  %t61 = load i64, i64* %var_abc2_ptr
  store i64 %t61, i64* %reg_29_ptr
  %t62 = load i64, i64* %reg_28_ptr
  %t63 = load i64, i64* %reg_29_ptr
  %t64 = call i64 @rt_strcmp(i64 %t62, i64 %t63)
  store i64 %t64, i64* %reg_30_ptr
  %t65 = load i64, i64* %reg_30_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t65)
  %t66 = load i64, i64* %var_abc2_ptr
  store i64 %t66, i64* %reg_31_ptr
  %t67 = load i64, i64* %reg_31_ptr
  %t68 = call i64 @rt_strlen(i64 %t67)
  store i64 %t68, i64* %reg_32_ptr
  %t69 = load i64, i64* %reg_32_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t69)
  %t70 = load i64, i64* %var_abc2_ptr
  store i64 %t70, i64* %reg_33_ptr
  %t71 = load i64, i64* %reg_33_ptr
  %t72 = call i64 @__sys_pointer_free(i64 %t71)
  store i64 %t72, i64* %reg_34_ptr
  %t73 = load i64, i64* %var_abc_ptr
  store i64 %t73, i64* %reg_35_ptr
  %t74 = load i64, i64* %var_def_ptr
  store i64 %t74, i64* %reg_36_ptr
  %t75 = load i64, i64* %reg_35_ptr
  %t76 = load i64, i64* %reg_36_ptr
  %t77 = call i64 @rt_str_concat(i64 %t75, i64 %t76)
  store i64 %t77, i64* %reg_37_ptr
  %t78 = load i64, i64* %reg_37_ptr
  store i64 %t78, i64* %var_joined_ptr
  %t79 = load i64, i64* %var_joined_ptr
  store i64 %t79, i64* %reg_38_ptr
  %t80 = load i64, i64* %reg_38_ptr
  %t81 = call i64 @rt_strlen(i64 %t80)
  store i64 %t81, i64* %reg_39_ptr
  %t82 = load i64, i64* %reg_39_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t82)
  %t83 = call i64 @rt_i64_to_str(i64 42)
  store i64 %t83, i64* %reg_40_ptr
  %t84 = load i64, i64* %reg_40_ptr
  store i64 %t84, i64* %var_s42_ptr
  %t85 = load i64, i64* %var_s42_ptr
  store i64 %t85, i64* %reg_41_ptr
  %t86 = load i64, i64* %reg_41_ptr
  %t87 = call i64 @rt_strlen(i64 %t86)
  store i64 %t87, i64* %reg_42_ptr
  %t88 = load i64, i64* %reg_42_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t88)
  %t89 = load i64, i64* %var_s42_ptr
  store i64 %t89, i64* %reg_43_ptr
  %t90 = load i64, i64* %reg_43_ptr
  %t91 = inttoptr i64 %t90 to i8*
  %t92 = load i8, i8* %t91
  %t93 = zext i8 %t92 to i64
  store i64 %t93, i64* %reg_44_ptr
  %t94 = load i64, i64* %reg_44_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t94)
  %t95 = load i64, i64* %var_s42_ptr
  store i64 %t95, i64* %reg_45_ptr
  %t96 = load i64, i64* %reg_45_ptr
  %t97 = add i64 %t96, 1
  store i64 %t97, i64* %reg_46_ptr
  %t98 = load i64, i64* %reg_46_ptr
  %t99 = inttoptr i64 %t98 to i8*
  %t100 = load i8, i8* %t99
  %t101 = zext i8 %t100 to i64
  store i64 %t101, i64* %reg_47_ptr
  %t102 = load i64, i64* %reg_47_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t102)
  %t103 = sub i64 0, 123
  store i64 %t103, i64* %reg_48_ptr
  %t104 = load i64, i64* %reg_48_ptr
  %t105 = call i64 @rt_i64_to_str(i64 %t104)
  store i64 %t105, i64* %reg_49_ptr
  %t106 = load i64, i64* %reg_49_ptr
  store i64 %t106, i64* %var_sneg_ptr
  %t107 = load i64, i64* %var_sneg_ptr
  store i64 %t107, i64* %reg_50_ptr
  %t108 = load i64, i64* %reg_50_ptr
  %t109 = call i64 @rt_strlen(i64 %t108)
  store i64 %t109, i64* %reg_51_ptr
  %t110 = load i64, i64* %reg_51_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t110)
  %t111 = load i64, i64* %var_sneg_ptr
  store i64 %t111, i64* %reg_52_ptr
  %t112 = load i64, i64* %reg_52_ptr
  %t113 = inttoptr i64 %t112 to i8*
  %t114 = load i8, i8* %t113
  %t115 = zext i8 %t114 to i64
  store i64 %t115, i64* %reg_53_ptr
  %t116 = load i64, i64* %reg_53_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t116)
  %t117 = call i64 @rt_i64_to_str(i64 0)
  store i64 %t117, i64* %reg_54_ptr
  %t118 = load i64, i64* %reg_54_ptr
  store i64 %t118, i64* %var_s0_ptr
  %t119 = load i64, i64* %var_s0_ptr
  store i64 %t119, i64* %reg_55_ptr
  %t120 = load i64, i64* %reg_55_ptr
  %t121 = call i64 @rt_strlen(i64 %t120)
  store i64 %t121, i64* %reg_56_ptr
  %t122 = load i64, i64* %reg_56_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t122)
  %t123 = load i64, i64* %var_s0_ptr
  store i64 %t123, i64* %reg_57_ptr
  %t124 = load i64, i64* %reg_57_ptr
  %t125 = inttoptr i64 %t124 to i8*
  %t126 = load i8, i8* %t125
  %t127 = zext i8 %t126 to i64
  store i64 %t127, i64* %reg_58_ptr
  %t128 = load i64, i64* %reg_58_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t128)
  %t129 = load i64, i64* %var_abc_ptr
  store i64 %t129, i64* %reg_59_ptr
  %t130 = load i64, i64* %reg_59_ptr
  %t131 = call i64 @rt_str_truthy(i64 %t130)
  store i64 %t131, i64* %reg_60_ptr
  %t132 = load i64, i64* %reg_60_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t132)
  %t133 = load i64, i64* %var_empty_ptr
  store i64 %t133, i64* %reg_61_ptr
  %t134 = load i64, i64* %reg_61_ptr
  %t135 = call i64 @rt_str_truthy(i64 %t134)
  store i64 %t135, i64* %reg_62_ptr
  %t136 = load i64, i64* %reg_62_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t136)
  %t137 = call i64 @rt_str_truthy(i64 0)
  store i64 %t137, i64* %reg_63_ptr
  %t138 = load i64, i64* %reg_63_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t138)
  %t139 = load i64, i64* %var_joined_ptr
  store i64 %t139, i64* %reg_64_ptr
  %t140 = load i64, i64* %var_abc_ptr
  store i64 %t140, i64* %reg_65_ptr
  %t141 = load i64, i64* %reg_64_ptr
  %t142 = load i64, i64* %reg_65_ptr
  %t143 = call i64 @rt_str_contains(i64 %t141, i64 %t142)
  store i64 %t143, i64* %reg_66_ptr
  %t144 = load i64, i64* %reg_66_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t144)
  %t145 = load i64, i64* %var_abc_ptr
  store i64 %t145, i64* %reg_67_ptr
  %t146 = load i64, i64* %var_def_ptr
  store i64 %t146, i64* %reg_68_ptr
  %t147 = load i64, i64* %reg_67_ptr
  %t148 = load i64, i64* %reg_68_ptr
  %t149 = call i64 @rt_str_contains(i64 %t147, i64 %t148)
  store i64 %t149, i64* %reg_69_ptr
  %t150 = load i64, i64* %reg_69_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t150)
  %t151 = load i64, i64* %var_joined_ptr
  store i64 %t151, i64* %reg_70_ptr
  %t152 = load i64, i64* %var_def_ptr
  store i64 %t152, i64* %reg_71_ptr
  %t153 = load i64, i64* %reg_70_ptr
  %t154 = load i64, i64* %reg_71_ptr
  %t155 = call i64 @rt_str_indexOf(i64 %t153, i64 %t154)
  store i64 %t155, i64* %reg_72_ptr
  %t156 = load i64, i64* %reg_72_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t156)
  %t157 = load i64, i64* %var_abc_ptr
  store i64 %t157, i64* %reg_73_ptr
  %t158 = load i64, i64* %var_def_ptr
  store i64 %t158, i64* %reg_74_ptr
  %t159 = load i64, i64* %reg_73_ptr
  %t160 = load i64, i64* %reg_74_ptr
  %t161 = call i64 @rt_str_indexOf(i64 %t159, i64 %t160)
  store i64 %t161, i64* %reg_75_ptr
  %t162 = load i64, i64* %reg_75_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t162)
  %t163 = load i64, i64* %var_joined_ptr
  store i64 %t163, i64* %reg_76_ptr
  %t164 = load i64, i64* %var_abc_ptr
  store i64 %t164, i64* %reg_77_ptr
  %t165 = load i64, i64* %reg_76_ptr
  %t166 = load i64, i64* %reg_77_ptr
  %t167 = call i64 @rt_str_startsWith(i64 %t165, i64 %t166)
  store i64 %t167, i64* %reg_78_ptr
  %t168 = load i64, i64* %reg_78_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t168)
  %t169 = load i64, i64* %var_joined_ptr
  store i64 %t169, i64* %reg_79_ptr
  %t170 = load i64, i64* %var_def_ptr
  store i64 %t170, i64* %reg_80_ptr
  %t171 = load i64, i64* %reg_79_ptr
  %t172 = load i64, i64* %reg_80_ptr
  %t173 = call i64 @rt_str_endsWith(i64 %t171, i64 %t172)
  store i64 %t173, i64* %reg_81_ptr
  %t174 = load i64, i64* %reg_81_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t174)
  %t175 = load i64, i64* %var_joined_ptr
  store i64 %t175, i64* %reg_82_ptr
  %t176 = load i64, i64* %var_def_ptr
  store i64 %t176, i64* %reg_83_ptr
  %t177 = load i64, i64* %reg_82_ptr
  %t178 = load i64, i64* %reg_83_ptr
  %t179 = call i64 @rt_str_startsWith(i64 %t177, i64 %t178)
  store i64 %t179, i64* %reg_84_ptr
  %t180 = load i64, i64* %reg_84_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t180)
  %t181 = load i64, i64* %var_abc_ptr
  store i64 %t181, i64* %reg_85_ptr
  %t182 = load i64, i64* %reg_85_ptr
  %t183 = call i64 @rt_str_upper(i64 %t182)
  store i64 %t183, i64* %reg_86_ptr
  %t184 = load i64, i64* %reg_86_ptr
  store i64 %t184, i64* %var_upper_abc_ptr
  %t185 = load i64, i64* %var_upper_abc_ptr
  store i64 %t185, i64* %reg_87_ptr
  %t186 = load i64, i64* %reg_87_ptr
  %t187 = inttoptr i64 %t186 to i8*
  %t188 = load i8, i8* %t187
  %t189 = zext i8 %t188 to i64
  store i64 %t189, i64* %reg_88_ptr
  %t190 = load i64, i64* %reg_88_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t190)
  %t191 = load i64, i64* %var_upper_abc_ptr
  store i64 %t191, i64* %reg_89_ptr
  %t192 = load i64, i64* %reg_89_ptr
  %t193 = add i64 %t192, 1
  store i64 %t193, i64* %reg_90_ptr
  %t194 = load i64, i64* %reg_90_ptr
  %t195 = inttoptr i64 %t194 to i8*
  %t196 = load i8, i8* %t195
  %t197 = zext i8 %t196 to i64
  store i64 %t197, i64* %reg_91_ptr
  %t198 = load i64, i64* %reg_91_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t198)
  %t199 = load i64, i64* %var_upper_abc_ptr
  store i64 %t199, i64* %reg_92_ptr
  %t200 = load i64, i64* %reg_92_ptr
  %t201 = call i64 @rt_str_lower(i64 %t200)
  store i64 %t201, i64* %reg_93_ptr
  %t202 = load i64, i64* %reg_93_ptr
  store i64 %t202, i64* %var_lower_back_ptr
  %t203 = load i64, i64* %var_lower_back_ptr
  store i64 %t203, i64* %reg_94_ptr
  %t204 = load i64, i64* %reg_94_ptr
  %t205 = inttoptr i64 %t204 to i8*
  %t206 = load i8, i8* %t205
  %t207 = zext i8 %t206 to i64
  store i64 %t207, i64* %reg_95_ptr
  %t208 = load i64, i64* %reg_95_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t208)
  %t209 = call i64 @__sys_pointer_alloc(i64 5)
  store i64 %t209, i64* %reg_96_ptr
  %t210 = load i64, i64* %reg_96_ptr
  store i64 %t210, i64* %var_padded_ptr
  %t211 = load i64, i64* %var_padded_ptr
  store i64 %t211, i64* %reg_97_ptr
  %t212 = load i64, i64* %reg_97_ptr
  %t213 = inttoptr i64 %t212 to i8*
  %t214 = trunc i64 32 to i8
  store i8 %t214, i8* %t213
  store i64 0, i64* %reg_98_ptr
  %t215 = load i64, i64* %var_padded_ptr
  store i64 %t215, i64* %reg_99_ptr
  %t216 = load i64, i64* %reg_99_ptr
  %t217 = add i64 %t216, 1
  store i64 %t217, i64* %reg_100_ptr
  %t218 = load i64, i64* %reg_100_ptr
  %t219 = inttoptr i64 %t218 to i8*
  %t220 = trunc i64 97 to i8
  store i8 %t220, i8* %t219
  store i64 0, i64* %reg_101_ptr
  %t221 = load i64, i64* %var_padded_ptr
  store i64 %t221, i64* %reg_102_ptr
  %t222 = load i64, i64* %reg_102_ptr
  %t223 = add i64 %t222, 2
  store i64 %t223, i64* %reg_103_ptr
  %t224 = load i64, i64* %reg_103_ptr
  %t225 = inttoptr i64 %t224 to i8*
  %t226 = trunc i64 98 to i8
  store i8 %t226, i8* %t225
  store i64 0, i64* %reg_104_ptr
  %t227 = load i64, i64* %var_padded_ptr
  store i64 %t227, i64* %reg_105_ptr
  %t228 = load i64, i64* %reg_105_ptr
  %t229 = add i64 %t228, 3
  store i64 %t229, i64* %reg_106_ptr
  %t230 = load i64, i64* %reg_106_ptr
  %t231 = inttoptr i64 %t230 to i8*
  %t232 = trunc i64 32 to i8
  store i8 %t232, i8* %t231
  store i64 0, i64* %reg_107_ptr
  %t233 = load i64, i64* %var_padded_ptr
  store i64 %t233, i64* %reg_108_ptr
  %t234 = load i64, i64* %reg_108_ptr
  %t235 = add i64 %t234, 4
  store i64 %t235, i64* %reg_109_ptr
  %t236 = load i64, i64* %reg_109_ptr
  %t237 = inttoptr i64 %t236 to i8*
  %t238 = trunc i64 0 to i8
  store i8 %t238, i8* %t237
  store i64 0, i64* %reg_110_ptr
  %t239 = load i64, i64* %var_padded_ptr
  store i64 %t239, i64* %reg_111_ptr
  %t240 = load i64, i64* %reg_111_ptr
  %t241 = call i64 @rt_str_trim(i64 %t240)
  store i64 %t241, i64* %reg_112_ptr
  %t242 = load i64, i64* %reg_112_ptr
  store i64 %t242, i64* %var_trimmed_ptr
  %t243 = load i64, i64* %var_trimmed_ptr
  store i64 %t243, i64* %reg_113_ptr
  %t244 = load i64, i64* %reg_113_ptr
  %t245 = call i64 @rt_strlen(i64 %t244)
  store i64 %t245, i64* %reg_114_ptr
  %t246 = load i64, i64* %reg_114_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t246)
  %t247 = load i64, i64* %var_ab_ptr
  store i64 %t247, i64* %reg_115_ptr
  %t248 = load i64, i64* %reg_115_ptr
  %t249 = call i64 @rt_str_repeat(i64 %t248, i64 3)
  store i64 %t249, i64* %reg_116_ptr
  %t250 = load i64, i64* %reg_116_ptr
  store i64 %t250, i64* %var_rep_ptr
  %t251 = load i64, i64* %var_rep_ptr
  store i64 %t251, i64* %reg_117_ptr
  %t252 = load i64, i64* %reg_117_ptr
  %t253 = call i64 @rt_strlen(i64 %t252)
  store i64 %t253, i64* %reg_118_ptr
  %t254 = load i64, i64* %reg_118_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t254)
  %t255 = load i64, i64* %var_abc_ptr
  store i64 %t255, i64* %reg_119_ptr
  %t256 = load i64, i64* %reg_119_ptr
  %t257 = call i64 @rt_str_reversed(i64 %t256)
  store i64 %t257, i64* %reg_120_ptr
  %t258 = load i64, i64* %reg_120_ptr
  store i64 %t258, i64* %var_rev_ptr
  %t259 = load i64, i64* %var_rev_ptr
  store i64 %t259, i64* %reg_121_ptr
  %t260 = load i64, i64* %reg_121_ptr
  %t261 = inttoptr i64 %t260 to i8*
  %t262 = load i8, i8* %t261
  %t263 = zext i8 %t262 to i64
  store i64 %t263, i64* %reg_122_ptr
  %t264 = load i64, i64* %reg_122_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t264)
  %t265 = load i64, i64* %var_rev_ptr
  store i64 %t265, i64* %reg_123_ptr
  %t266 = load i64, i64* %reg_123_ptr
  %t267 = add i64 %t266, 1
  store i64 %t267, i64* %reg_124_ptr
  %t268 = load i64, i64* %reg_124_ptr
  %t269 = inttoptr i64 %t268 to i8*
  %t270 = load i8, i8* %t269
  %t271 = zext i8 %t270 to i64
  store i64 %t271, i64* %reg_125_ptr
  %t272 = load i64, i64* %reg_125_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t272)
  %t273 = load i64, i64* %var_rev_ptr
  store i64 %t273, i64* %reg_126_ptr
  %t274 = load i64, i64* %reg_126_ptr
  %t275 = add i64 %t274, 2
  store i64 %t275, i64* %reg_127_ptr
  %t276 = load i64, i64* %reg_127_ptr
  %t277 = inttoptr i64 %t276 to i8*
  %t278 = load i8, i8* %t277
  %t279 = zext i8 %t278 to i64
  store i64 %t279, i64* %reg_128_ptr
  %t280 = load i64, i64* %reg_128_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t280)
  %t281 = load i64, i64* %var_joined_ptr
  store i64 %t281, i64* %reg_129_ptr
  %t282 = load i64, i64* %reg_129_ptr
  %t283 = call i64 @rt_str_substring(i64 %t282, i64 1, i64 4)
  store i64 %t283, i64* %reg_130_ptr
  %t284 = load i64, i64* %reg_130_ptr
  store i64 %t284, i64* %var_sub_ptr
  %t285 = load i64, i64* %var_sub_ptr
  store i64 %t285, i64* %reg_131_ptr
  %t286 = load i64, i64* %reg_131_ptr
  %t287 = call i64 @rt_strlen(i64 %t286)
  store i64 %t287, i64* %reg_132_ptr
  %t288 = load i64, i64* %reg_132_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t288)
  %t289 = load i64, i64* %var_sub_ptr
  store i64 %t289, i64* %reg_133_ptr
  %t290 = load i64, i64* %reg_133_ptr
  %t291 = inttoptr i64 %t290 to i8*
  %t292 = load i8, i8* %t291
  %t293 = zext i8 %t292 to i64
  store i64 %t293, i64* %reg_134_ptr
  %t294 = load i64, i64* %reg_134_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t294)
  %t295 = call i64 @__sys_pointer_alloc(i64 3)
  store i64 %t295, i64* %reg_135_ptr
  %t296 = load i64, i64* %reg_135_ptr
  store i64 %t296, i64* %var_bc_ptr
  %t297 = load i64, i64* %var_bc_ptr
  store i64 %t297, i64* %reg_136_ptr
  %t298 = load i64, i64* %reg_136_ptr
  %t299 = inttoptr i64 %t298 to i8*
  %t300 = trunc i64 98 to i8
  store i8 %t300, i8* %t299
  store i64 0, i64* %reg_137_ptr
  %t301 = load i64, i64* %var_bc_ptr
  store i64 %t301, i64* %reg_138_ptr
  %t302 = load i64, i64* %reg_138_ptr
  %t303 = add i64 %t302, 1
  store i64 %t303, i64* %reg_139_ptr
  %t304 = load i64, i64* %reg_139_ptr
  %t305 = inttoptr i64 %t304 to i8*
  %t306 = trunc i64 99 to i8
  store i8 %t306, i8* %t305
  store i64 0, i64* %reg_140_ptr
  %t307 = load i64, i64* %var_bc_ptr
  store i64 %t307, i64* %reg_141_ptr
  %t308 = load i64, i64* %reg_141_ptr
  %t309 = add i64 %t308, 2
  store i64 %t309, i64* %reg_142_ptr
  %t310 = load i64, i64* %reg_142_ptr
  %t311 = inttoptr i64 %t310 to i8*
  %t312 = trunc i64 0 to i8
  store i8 %t312, i8* %t311
  store i64 0, i64* %reg_143_ptr
  %t313 = call i64 @__sys_pointer_alloc(i64 3)
  store i64 %t313, i64* %reg_144_ptr
  %t314 = load i64, i64* %reg_144_ptr
  store i64 %t314, i64* %var_xx_ptr
  %t315 = load i64, i64* %var_xx_ptr
  store i64 %t315, i64* %reg_145_ptr
  %t316 = load i64, i64* %reg_145_ptr
  %t317 = inttoptr i64 %t316 to i8*
  %t318 = trunc i64 88 to i8
  store i8 %t318, i8* %t317
  store i64 0, i64* %reg_146_ptr
  %t319 = load i64, i64* %var_xx_ptr
  store i64 %t319, i64* %reg_147_ptr
  %t320 = load i64, i64* %reg_147_ptr
  %t321 = add i64 %t320, 1
  store i64 %t321, i64* %reg_148_ptr
  %t322 = load i64, i64* %reg_148_ptr
  %t323 = inttoptr i64 %t322 to i8*
  %t324 = trunc i64 88 to i8
  store i8 %t324, i8* %t323
  store i64 0, i64* %reg_149_ptr
  %t325 = load i64, i64* %var_xx_ptr
  store i64 %t325, i64* %reg_150_ptr
  %t326 = load i64, i64* %reg_150_ptr
  %t327 = add i64 %t326, 2
  store i64 %t327, i64* %reg_151_ptr
  %t328 = load i64, i64* %reg_151_ptr
  %t329 = inttoptr i64 %t328 to i8*
  %t330 = trunc i64 0 to i8
  store i8 %t330, i8* %t329
  store i64 0, i64* %reg_152_ptr
  %t331 = load i64, i64* %var_abc_ptr
  store i64 %t331, i64* %reg_153_ptr
  %t332 = load i64, i64* %var_bc_ptr
  store i64 %t332, i64* %reg_154_ptr
  %t333 = load i64, i64* %var_xx_ptr
  store i64 %t333, i64* %reg_155_ptr
  %t334 = load i64, i64* %reg_153_ptr
  %t335 = load i64, i64* %reg_154_ptr
  %t336 = load i64, i64* %reg_155_ptr
  %t337 = call i64 @rt_str_replace(i64 %t334, i64 %t335, i64 %t336)
  store i64 %t337, i64* %reg_156_ptr
  %t338 = load i64, i64* %reg_156_ptr
  store i64 %t338, i64* %var_replaced_ptr
  %t339 = load i64, i64* %var_replaced_ptr
  store i64 %t339, i64* %reg_157_ptr
  %t340 = load i64, i64* %reg_157_ptr
  %t341 = call i64 @rt_strlen(i64 %t340)
  store i64 %t341, i64* %reg_158_ptr
  %t342 = load i64, i64* %reg_158_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t342)
  %t343 = load i64, i64* %var_replaced_ptr
  store i64 %t343, i64* %reg_159_ptr
  %t344 = load i64, i64* %reg_159_ptr
  %t345 = inttoptr i64 %t344 to i8*
  %t346 = load i8, i8* %t345
  %t347 = zext i8 %t346 to i64
  store i64 %t347, i64* %reg_160_ptr
  %t348 = load i64, i64* %reg_160_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t348)
  %t349 = load i64, i64* %var_replaced_ptr
  store i64 %t349, i64* %reg_161_ptr
  %t350 = load i64, i64* %reg_161_ptr
  %t351 = add i64 %t350, 1
  store i64 %t351, i64* %reg_162_ptr
  %t352 = load i64, i64* %reg_162_ptr
  %t353 = inttoptr i64 %t352 to i8*
  %t354 = load i8, i8* %t353
  %t355 = zext i8 %t354 to i64
  store i64 %t355, i64* %reg_163_ptr
  %t356 = load i64, i64* %reg_163_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t356)
  %t357 = load i64, i64* %var_replaced_ptr
  store i64 %t357, i64* %reg_164_ptr
  %t358 = load i64, i64* %reg_164_ptr
  %t359 = add i64 %t358, 2
  store i64 %t359, i64* %reg_165_ptr
  %t360 = load i64, i64* %reg_165_ptr
  %t361 = inttoptr i64 %t360 to i8*
  %t362 = load i8, i8* %t361
  %t363 = zext i8 %t362 to i64
  store i64 %t363, i64* %reg_166_ptr
  %t364 = load i64, i64* %reg_166_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t364)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 999)
  call void @obo_arena_free_all()
  ret i32 0
}

