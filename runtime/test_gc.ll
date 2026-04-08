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


define i64 @rt_gc_init() {
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
  %var_ctx_ptr = alloca i64
  %var_roots_ptr = alloca i64
  %var_ht_ptr = alloca i64
  %t0 = call i64 @__sys_pointer_alloc(i64 80)
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  store i64 %t1, i64* %var_ctx_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_1_ptr
  %t3 = load i64, i64* %reg_1_ptr
  %t4 = icmp eq i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_2_ptr
  %t6 = load i64, i64* %reg_2_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %rt_gc_init_b1, label %rt_gc_init_b2
rt_gc_init_b1:
  ret i64 0
rt_gc_init_b2:
  br label %rt_gc_init_b3
rt_gc_init_b3:
  %t10 = load i64, i64* %var_ctx_ptr
  store i64 %t10, i64* %reg_3_ptr
  %t11 = load i64, i64* %reg_3_ptr
  %t12 = inttoptr i64 %t11 to i8*
  call void @llvm.memset.p0i8.i64(i8* %t12, i8 0, i64 80, i1 false)
  store i64 0, i64* %reg_4_ptr
  %t13 = load i64, i64* %var_ctx_ptr
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = add i64 %t14, 16
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = inttoptr i64 %t16 to i64*
  store i64 256, i64* %t17
  store i64 0, i64* %reg_7_ptr
  %t18 = call i64 @__sys_pointer_alloc(i64 32768)
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  store i64 %t19, i64* %var_roots_ptr
  %t20 = load i64, i64* %var_roots_ptr
  store i64 %t20, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_9_ptr
  %t22 = icmp eq i64 %t21, 0
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %rt_gc_init_b4, label %rt_gc_init_b5
rt_gc_init_b4:
  %t28 = load i64, i64* %var_ctx_ptr
  store i64 %t28, i64* %reg_11_ptr
  %t29 = load i64, i64* %reg_11_ptr
  %t30 = call i64 @__sys_pointer_free(i64 %t29)
  store i64 %t30, i64* %reg_12_ptr
  ret i64 0
rt_gc_init_b5:
  br label %rt_gc_init_b6
rt_gc_init_b6:
  %t31 = load i64, i64* %var_roots_ptr
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = inttoptr i64 %t32 to i8*
  call void @llvm.memset.p0i8.i64(i8* %t33, i8 0, i64 32768, i1 false)
  store i64 0, i64* %reg_14_ptr
  %t34 = load i64, i64* %var_ctx_ptr
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  %t36 = add i64 %t35, 40
  store i64 %t36, i64* %reg_16_ptr
  %t37 = load i64, i64* %var_roots_ptr
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i64, i64* %reg_16_ptr
  %t39 = load i64, i64* %reg_17_ptr
  %t40 = inttoptr i64 %t38 to i64*
  store i64 %t39, i64* %t40
  store i64 0, i64* %reg_18_ptr
  %t41 = call i64 @__sys_pointer_alloc(i64 131072)
  store i64 %t41, i64* %reg_19_ptr
  %t42 = load i64, i64* %reg_19_ptr
  store i64 %t42, i64* %var_ht_ptr
  %t43 = load i64, i64* %var_ht_ptr
  store i64 %t43, i64* %reg_20_ptr
  %t44 = load i64, i64* %reg_20_ptr
  %t45 = icmp eq i64 %t44, 0
  %t46 = zext i1 %t45 to i64
  store i64 %t46, i64* %reg_21_ptr
  %t47 = load i64, i64* %reg_21_ptr
  %t49 = icmp ne i64 %t47, 0
  %t50 = zext i1 %t49 to i64
  %t48 = icmp ne i64 %t50, 0
  br i1 %t48, label %rt_gc_init_b7, label %rt_gc_init_b8
rt_gc_init_b7:
  %t51 = load i64, i64* %var_roots_ptr
  store i64 %t51, i64* %reg_22_ptr
  %t52 = load i64, i64* %reg_22_ptr
  %t53 = call i64 @__sys_pointer_free(i64 %t52)
  store i64 %t53, i64* %reg_23_ptr
  %t54 = load i64, i64* %var_ctx_ptr
  store i64 %t54, i64* %reg_24_ptr
  %t55 = load i64, i64* %reg_24_ptr
  %t56 = call i64 @__sys_pointer_free(i64 %t55)
  store i64 %t56, i64* %reg_25_ptr
  ret i64 0
rt_gc_init_b8:
  br label %rt_gc_init_b9
rt_gc_init_b9:
  %t57 = load i64, i64* %var_ht_ptr
  store i64 %t57, i64* %reg_26_ptr
  %t58 = load i64, i64* %reg_26_ptr
  %t59 = inttoptr i64 %t58 to i8*
  call void @llvm.memset.p0i8.i64(i8* %t59, i8 0, i64 131072, i1 false)
  store i64 0, i64* %reg_27_ptr
  %t60 = load i64, i64* %var_ctx_ptr
  store i64 %t60, i64* %reg_28_ptr
  %t61 = load i64, i64* %reg_28_ptr
  %t62 = add i64 %t61, 48
  store i64 %t62, i64* %reg_29_ptr
  %t63 = load i64, i64* %var_ht_ptr
  store i64 %t63, i64* %reg_30_ptr
  %t64 = load i64, i64* %reg_29_ptr
  %t65 = load i64, i64* %reg_30_ptr
  %t66 = inttoptr i64 %t64 to i64*
  store i64 %t65, i64* %t66
  store i64 0, i64* %reg_31_ptr
  %t67 = load i64, i64* %var_ctx_ptr
  store i64 %t67, i64* %reg_32_ptr
  %t68 = load i64, i64* %reg_32_ptr
  %t69 = add i64 %t68, 64
  store i64 %t69, i64* %reg_33_ptr
  %t70 = load i64, i64* %reg_33_ptr
  %t71 = inttoptr i64 %t70 to i64*
  store i64 4096, i64* %t71
  store i64 0, i64* %reg_34_ptr
  %t72 = load i64, i64* %var_ctx_ptr
  store i64 %t72, i64* %reg_35_ptr
  %t73 = load i64, i64* %reg_35_ptr
  ret i64 %t73
}

define i64 @rt_gc_node_alloc(i64 %arg0) {
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
  %var_nxt_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_old_head_ptr = alloca i64
  %var_fl_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_pool_idx_ptr = alloca i64
  %var_chunk_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = add i64 %t2, 72
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = inttoptr i64 %t4 to i64*
  %t6 = load i64, i64* %t5
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  store i64 %t7, i64* %var_fl_ptr
  %t8 = load i64, i64* %var_fl_ptr
  store i64 %t8, i64* %reg_4_ptr
  %t9 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t9, 0
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t14 = icmp ne i64 %t12, 0
  %t15 = zext i1 %t14 to i64
  %t13 = icmp ne i64 %t15, 0
  br i1 %t13, label %rt_gc_node_alloc_b1, label %rt_gc_node_alloc_b2
rt_gc_node_alloc_b1:
  %t16 = load i64, i64* %var_fl_ptr
  store i64 %t16, i64* %reg_6_ptr
  %t17 = load i64, i64* %reg_6_ptr
  %t18 = add i64 %t17, 16
  store i64 %t18, i64* %reg_7_ptr
  %t19 = load i64, i64* %reg_7_ptr
  %t20 = inttoptr i64 %t19 to i64*
  %t21 = load i64, i64* %t20
  store i64 %t21, i64* %reg_8_ptr
  %t22 = load i64, i64* %reg_8_ptr
  store i64 %t22, i64* %var_nxt_ptr
  %t23 = load i64, i64* %var_ctx_ptr
  store i64 %t23, i64* %reg_9_ptr
  %t24 = load i64, i64* %reg_9_ptr
  %t25 = add i64 %t24, 72
  store i64 %t25, i64* %reg_10_ptr
  %t26 = load i64, i64* %var_nxt_ptr
  store i64 %t26, i64* %reg_11_ptr
  %t27 = load i64, i64* %reg_10_ptr
  %t28 = load i64, i64* %reg_11_ptr
  %t29 = inttoptr i64 %t27 to i64*
  store i64 %t28, i64* %t29
  store i64 0, i64* %reg_12_ptr
  %t30 = load i64, i64* %var_fl_ptr
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_13_ptr
  ret i64 %t31
rt_gc_node_alloc_b2:
  br label %rt_gc_node_alloc_b3
rt_gc_node_alloc_b3:
  %t32 = load i64, i64* %var_ctx_ptr
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t34 = add i64 %t33, 64
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  %t36 = inttoptr i64 %t35 to i64*
  %t37 = load i64, i64* %t36
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %reg_16_ptr
  store i64 %t38, i64* %var_pool_idx_ptr
  %t39 = load i64, i64* %var_pool_idx_ptr
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_17_ptr
  %t41 = icmp sge i64 %t40, 4096
  %t42 = zext i1 %t41 to i64
  store i64 %t42, i64* %reg_18_ptr
  %t43 = load i64, i64* %reg_18_ptr
  %t45 = icmp ne i64 %t43, 0
  %t46 = zext i1 %t45 to i64
  %t44 = icmp ne i64 %t46, 0
  br i1 %t44, label %rt_gc_node_alloc_b4, label %rt_gc_node_alloc_b5
rt_gc_node_alloc_b4:
  %t47 = call i64 @__sys_pointer_alloc(i64 131080)
  store i64 %t47, i64* %reg_19_ptr
  %t48 = load i64, i64* %reg_19_ptr
  store i64 %t48, i64* %var_chunk_ptr
  %t49 = load i64, i64* %var_chunk_ptr
  store i64 %t49, i64* %reg_20_ptr
  %t50 = load i64, i64* %reg_20_ptr
  %t51 = icmp eq i64 %t50, 0
  %t52 = zext i1 %t51 to i64
  store i64 %t52, i64* %reg_21_ptr
  %t53 = load i64, i64* %reg_21_ptr
  %t55 = icmp ne i64 %t53, 0
  %t56 = zext i1 %t55 to i64
  %t54 = icmp ne i64 %t56, 0
  br i1 %t54, label %rt_gc_node_alloc_b7, label %rt_gc_node_alloc_b8
rt_gc_node_alloc_b5:
  br label %rt_gc_node_alloc_b6
rt_gc_node_alloc_b6:
  %t57 = load i64, i64* %var_ctx_ptr
  store i64 %t57, i64* %reg_35_ptr
  %t58 = load i64, i64* %reg_35_ptr
  %t59 = add i64 %t58, 56
  store i64 %t59, i64* %reg_36_ptr
  %t60 = load i64, i64* %reg_36_ptr
  %t61 = inttoptr i64 %t60 to i64*
  %t62 = load i64, i64* %t61
  store i64 %t62, i64* %reg_37_ptr
  %t63 = load i64, i64* %reg_37_ptr
  store i64 %t63, i64* %var_chunk_ptr
  %t64 = load i64, i64* %var_chunk_ptr
  store i64 %t64, i64* %reg_38_ptr
  %t65 = load i64, i64* %reg_38_ptr
  %t66 = add i64 %t65, 8
  store i64 %t66, i64* %reg_39_ptr
  %t67 = load i64, i64* %var_pool_idx_ptr
  store i64 %t67, i64* %reg_40_ptr
  %t68 = load i64, i64* %reg_40_ptr
  %t69 = mul i64 %t68, 32
  store i64 %t69, i64* %reg_41_ptr
  %t70 = load i64, i64* %reg_39_ptr
  %t71 = load i64, i64* %reg_41_ptr
  %t72 = add i64 %t70, %t71
  store i64 %t72, i64* %reg_42_ptr
  %t73 = load i64, i64* %reg_42_ptr
  store i64 %t73, i64* %var_node_ptr
  %t74 = load i64, i64* %var_ctx_ptr
  store i64 %t74, i64* %reg_43_ptr
  %t75 = load i64, i64* %reg_43_ptr
  %t76 = add i64 %t75, 64
  store i64 %t76, i64* %reg_44_ptr
  %t77 = load i64, i64* %var_pool_idx_ptr
  store i64 %t77, i64* %reg_45_ptr
  %t78 = load i64, i64* %reg_45_ptr
  %t79 = add i64 %t78, 1
  store i64 %t79, i64* %reg_46_ptr
  %t80 = load i64, i64* %reg_44_ptr
  %t81 = load i64, i64* %reg_46_ptr
  %t82 = inttoptr i64 %t80 to i64*
  store i64 %t81, i64* %t82
  store i64 0, i64* %reg_47_ptr
  %t83 = load i64, i64* %var_node_ptr
  store i64 %t83, i64* %reg_48_ptr
  %t84 = load i64, i64* %reg_48_ptr
  ret i64 %t84
rt_gc_node_alloc_b7:
  ret i64 0
rt_gc_node_alloc_b8:
  br label %rt_gc_node_alloc_b9
rt_gc_node_alloc_b9:
  %t85 = load i64, i64* %var_ctx_ptr
  store i64 %t85, i64* %reg_22_ptr
  %t86 = load i64, i64* %reg_22_ptr
  %t87 = add i64 %t86, 56
  store i64 %t87, i64* %reg_23_ptr
  %t88 = load i64, i64* %reg_23_ptr
  %t89 = inttoptr i64 %t88 to i64*
  %t90 = load i64, i64* %t89
  store i64 %t90, i64* %reg_24_ptr
  %t91 = load i64, i64* %reg_24_ptr
  store i64 %t91, i64* %var_old_head_ptr
  %t92 = load i64, i64* %var_chunk_ptr
  store i64 %t92, i64* %reg_25_ptr
  %t93 = load i64, i64* %var_old_head_ptr
  store i64 %t93, i64* %reg_26_ptr
  %t94 = load i64, i64* %reg_25_ptr
  %t95 = load i64, i64* %reg_26_ptr
  %t96 = inttoptr i64 %t94 to i64*
  store i64 %t95, i64* %t96
  store i64 0, i64* %reg_27_ptr
  %t97 = load i64, i64* %var_ctx_ptr
  store i64 %t97, i64* %reg_28_ptr
  %t98 = load i64, i64* %reg_28_ptr
  %t99 = add i64 %t98, 56
  store i64 %t99, i64* %reg_29_ptr
  %t100 = load i64, i64* %var_chunk_ptr
  store i64 %t100, i64* %reg_30_ptr
  %t101 = load i64, i64* %reg_29_ptr
  %t102 = load i64, i64* %reg_30_ptr
  %t103 = inttoptr i64 %t101 to i64*
  store i64 %t102, i64* %t103
  store i64 0, i64* %reg_31_ptr
  %t104 = load i64, i64* %var_ctx_ptr
  store i64 %t104, i64* %reg_32_ptr
  %t105 = load i64, i64* %reg_32_ptr
  %t106 = add i64 %t105, 64
  store i64 %t106, i64* %reg_33_ptr
  %t107 = load i64, i64* %reg_33_ptr
  %t108 = inttoptr i64 %t107 to i64*
  store i64 0, i64* %t108
  store i64 0, i64* %reg_34_ptr
  store i64 0, i64* %var_pool_idx_ptr
  br label %rt_gc_node_alloc_b6
}

define void @rt_gc_node_free(i64 %arg0, i64 %arg1) {
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
  %var_ctx_ptr = alloca i64
  %var_fl_ptr = alloca i64
  %var_node_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_node_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = add i64 %t3, 72
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = inttoptr i64 %t5 to i64*
  %t7 = load i64, i64* %t6
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  store i64 %t8, i64* %var_fl_ptr
  %t9 = load i64, i64* %var_node_ptr
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  %t11 = add i64 %t10, 16
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %var_fl_ptr
  store i64 %t12, i64* %reg_7_ptr
  %t13 = load i64, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_7_ptr
  %t15 = inttoptr i64 %t13 to i64*
  store i64 %t14, i64* %t15
  store i64 0, i64* %reg_8_ptr
  %t16 = load i64, i64* %var_ctx_ptr
  store i64 %t16, i64* %reg_9_ptr
  %t17 = load i64, i64* %reg_9_ptr
  %t18 = add i64 %t17, 72
  store i64 %t18, i64* %reg_10_ptr
  %t19 = load i64, i64* %var_node_ptr
  store i64 %t19, i64* %reg_11_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_11_ptr
  %t22 = inttoptr i64 %t20 to i64*
  store i64 %t21, i64* %t22
  store i64 0, i64* %reg_12_ptr
  ret void
}

define i64 @rt_gc_ptr_hash(i64 %arg0) {
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
  %var_ptr_ptr = alloca i64
  %var_h_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ptr_ptr
  %t1 = load i64, i64* %var_ptr_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = ashr i64 %t2, 4
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %var_ptr_ptr
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = ashr i64 %t5, 18
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_2_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = xor i64 %t7, %t8
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_h_ptr
  %t11 = load i64, i64* %var_h_ptr
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = and i64 %t12, 16383
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  store i64 %t14, i64* %var_h_ptr
  %t15 = load i64, i64* %var_h_ptr
  store i64 %t15, i64* %reg_8_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = icmp slt i64 %t16, 0
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_9_ptr
  %t19 = load i64, i64* %reg_9_ptr
  %t21 = icmp ne i64 %t19, 0
  %t22 = zext i1 %t21 to i64
  %t20 = icmp ne i64 %t22, 0
  br i1 %t20, label %rt_gc_ptr_hash_b1, label %rt_gc_ptr_hash_b2
rt_gc_ptr_hash_b1:
  %t23 = load i64, i64* %var_h_ptr
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  %t25 = sub i64 0, %t24
  store i64 %t25, i64* %reg_11_ptr
  %t26 = load i64, i64* %reg_11_ptr
  store i64 %t26, i64* %var_h_ptr
  br label %rt_gc_ptr_hash_b3
rt_gc_ptr_hash_b2:
  br label %rt_gc_ptr_hash_b3
rt_gc_ptr_hash_b3:
  %t27 = load i64, i64* %var_h_ptr
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_12_ptr
  ret i64 %t28
}

define void @rt_gc_ht_insert(i64 %arg0, i64 %arg1) {
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
  %var_ht_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_h_ptr = alloca i64
  %var_old_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_slot_addr_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_node_ptr
  %t2 = load i64, i64* %var_node_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i64*
  %t5 = load i64, i64* %t4
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  store i64 %t6, i64* %var_ptr_ptr
  %t7 = load i64, i64* %var_ptr_ptr
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = call i64 @rt_gc_ptr_hash(i64 %t8)
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_h_ptr
  %t11 = load i64, i64* %var_ctx_ptr
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = add i64 %t12, 48
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  %t15 = inttoptr i64 %t14 to i64*
  %t16 = load i64, i64* %t15
  store i64 %t16, i64* %reg_8_ptr
  %t17 = load i64, i64* %reg_8_ptr
  store i64 %t17, i64* %var_ht_ptr
  %t18 = load i64, i64* %var_ht_ptr
  store i64 %t18, i64* %reg_9_ptr
  %t19 = load i64, i64* %var_h_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = mul i64 %t20, 8
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = load i64, i64* %reg_11_ptr
  %t24 = add i64 %t22, %t23
  store i64 %t24, i64* %reg_12_ptr
  %t25 = load i64, i64* %reg_12_ptr
  store i64 %t25, i64* %var_slot_addr_ptr
  %t26 = load i64, i64* %var_slot_addr_ptr
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i64, i64* %reg_13_ptr
  %t28 = inttoptr i64 %t27 to i64*
  %t29 = load i64, i64* %t28
  store i64 %t29, i64* %reg_14_ptr
  %t30 = load i64, i64* %reg_14_ptr
  store i64 %t30, i64* %var_old_ptr
  %t31 = load i64, i64* %var_node_ptr
  store i64 %t31, i64* %reg_15_ptr
  %t32 = load i64, i64* %reg_15_ptr
  %t33 = add i64 %t32, 24
  store i64 %t33, i64* %reg_16_ptr
  %t34 = load i64, i64* %var_old_ptr
  store i64 %t34, i64* %reg_17_ptr
  %t35 = load i64, i64* %reg_16_ptr
  %t36 = load i64, i64* %reg_17_ptr
  %t37 = inttoptr i64 %t35 to i64*
  store i64 %t36, i64* %t37
  store i64 0, i64* %reg_18_ptr
  %t38 = load i64, i64* %var_slot_addr_ptr
  store i64 %t38, i64* %reg_19_ptr
  %t39 = load i64, i64* %var_node_ptr
  store i64 %t39, i64* %reg_20_ptr
  %t40 = load i64, i64* %reg_19_ptr
  %t41 = load i64, i64* %reg_20_ptr
  %t42 = inttoptr i64 %t40 to i64*
  store i64 %t41, i64* %t42
  store i64 0, i64* %reg_21_ptr
  ret void
}

define void @rt_gc_ht_remove(i64 %arg0, i64 %arg1) {
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
  %var_ht_ptr = alloca i64
  %var_slot_addr_ptr = alloca i64
  %var_curr_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_h_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_prev_addr_ptr = alloca i64
  %var_nxt_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_node_ptr
  %t2 = load i64, i64* %var_node_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i64*
  %t5 = load i64, i64* %t4
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  store i64 %t6, i64* %var_ptr_ptr
  %t7 = load i64, i64* %var_ptr_ptr
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = call i64 @rt_gc_ptr_hash(i64 %t8)
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_h_ptr
  %t11 = load i64, i64* %var_ctx_ptr
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = add i64 %t12, 48
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  %t15 = inttoptr i64 %t14 to i64*
  %t16 = load i64, i64* %t15
  store i64 %t16, i64* %reg_8_ptr
  %t17 = load i64, i64* %reg_8_ptr
  store i64 %t17, i64* %var_ht_ptr
  %t18 = load i64, i64* %var_ht_ptr
  store i64 %t18, i64* %reg_9_ptr
  %t19 = load i64, i64* %var_h_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = mul i64 %t20, 8
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = load i64, i64* %reg_11_ptr
  %t24 = add i64 %t22, %t23
  store i64 %t24, i64* %reg_12_ptr
  %t25 = load i64, i64* %reg_12_ptr
  store i64 %t25, i64* %var_slot_addr_ptr
  %t26 = load i64, i64* %var_slot_addr_ptr
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i64, i64* %reg_13_ptr
  store i64 %t27, i64* %var_prev_addr_ptr
  %t28 = load i64, i64* %var_prev_addr_ptr
  store i64 %t28, i64* %reg_14_ptr
  %t29 = load i64, i64* %reg_14_ptr
  %t30 = inttoptr i64 %t29 to i64*
  %t31 = load i64, i64* %t30
  store i64 %t31, i64* %reg_15_ptr
  %t32 = load i64, i64* %reg_15_ptr
  store i64 %t32, i64* %var_curr_ptr
  br label %rt_gc_ht_remove_b1
rt_gc_ht_remove_b1:
  %t33 = load i64, i64* %var_curr_ptr
  store i64 %t33, i64* %reg_16_ptr
  %t34 = load i64, i64* %reg_16_ptr
  %t35 = icmp eq i64 %t34, 0
  %t36 = zext i1 %t35 to i64
  store i64 %t36, i64* %reg_17_ptr
  %t37 = load i64, i64* %reg_17_ptr
  %t39 = icmp ne i64 %t37, 0
  %t40 = zext i1 %t39 to i64
  %t38 = icmp ne i64 %t40, 0
  br i1 %t38, label %rt_gc_ht_remove_b3, label %rt_gc_ht_remove_b4
rt_gc_ht_remove_b2:
  ret void
rt_gc_ht_remove_b3:
  br label %rt_gc_ht_remove_b2
rt_gc_ht_remove_b4:
  br label %rt_gc_ht_remove_b5
rt_gc_ht_remove_b5:
  %t41 = load i64, i64* %var_curr_ptr
  store i64 %t41, i64* %reg_18_ptr
  %t42 = load i64, i64* %var_node_ptr
  store i64 %t42, i64* %reg_19_ptr
  %t43 = load i64, i64* %reg_18_ptr
  %t44 = load i64, i64* %reg_19_ptr
  %t45 = icmp eq i64 %t43, %t44
  %t46 = zext i1 %t45 to i64
  store i64 %t46, i64* %reg_20_ptr
  %t47 = load i64, i64* %reg_20_ptr
  %t49 = icmp ne i64 %t47, 0
  %t50 = zext i1 %t49 to i64
  %t48 = icmp ne i64 %t50, 0
  br i1 %t48, label %rt_gc_ht_remove_b6, label %rt_gc_ht_remove_b7
rt_gc_ht_remove_b6:
  %t51 = load i64, i64* %var_node_ptr
  store i64 %t51, i64* %reg_21_ptr
  %t52 = load i64, i64* %reg_21_ptr
  %t53 = add i64 %t52, 24
  store i64 %t53, i64* %reg_22_ptr
  %t54 = load i64, i64* %reg_22_ptr
  %t55 = inttoptr i64 %t54 to i64*
  %t56 = load i64, i64* %t55
  store i64 %t56, i64* %reg_23_ptr
  %t57 = load i64, i64* %reg_23_ptr
  store i64 %t57, i64* %var_nxt_ptr
  %t58 = load i64, i64* %var_prev_addr_ptr
  store i64 %t58, i64* %reg_24_ptr
  %t59 = load i64, i64* %var_nxt_ptr
  store i64 %t59, i64* %reg_25_ptr
  %t60 = load i64, i64* %reg_24_ptr
  %t61 = load i64, i64* %reg_25_ptr
  %t62 = inttoptr i64 %t60 to i64*
  store i64 %t61, i64* %t62
  store i64 0, i64* %reg_26_ptr
  br label %rt_gc_ht_remove_b2
rt_gc_ht_remove_b7:
  br label %rt_gc_ht_remove_b8
rt_gc_ht_remove_b8:
  %t63 = load i64, i64* %var_curr_ptr
  store i64 %t63, i64* %reg_27_ptr
  %t64 = load i64, i64* %reg_27_ptr
  %t65 = add i64 %t64, 24
  store i64 %t65, i64* %reg_28_ptr
  %t66 = load i64, i64* %reg_28_ptr
  store i64 %t66, i64* %var_prev_addr_ptr
  %t67 = load i64, i64* %var_prev_addr_ptr
  store i64 %t67, i64* %reg_29_ptr
  %t68 = load i64, i64* %reg_29_ptr
  %t69 = inttoptr i64 %t68 to i64*
  %t70 = load i64, i64* %t69
  store i64 %t70, i64* %reg_30_ptr
  %t71 = load i64, i64* %reg_30_ptr
  store i64 %t71, i64* %var_curr_ptr
  br label %rt_gc_ht_remove_b1
}

define i64 @rt_gc_find_node(i64 %arg0, i64 %arg1) {
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
  %var_slot_addr_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_node_ptr_ptr = alloca i64
  %var_h_ptr = alloca i64
  %var_curr_ptr = alloca i64
  %var_ht_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %var_ptr_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = call i64 @rt_gc_ptr_hash(i64 %t3)
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  store i64 %t5, i64* %var_h_ptr
  %t6 = load i64, i64* %var_ctx_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = add i64 %t7, 48
  store i64 %t8, i64* %reg_5_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = inttoptr i64 %t9 to i64*
  %t11 = load i64, i64* %t10
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  store i64 %t12, i64* %var_ht_ptr
  %t13 = load i64, i64* %var_ht_ptr
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %var_h_ptr
  store i64 %t14, i64* %reg_8_ptr
  %t15 = load i64, i64* %reg_8_ptr
  %t16 = mul i64 %t15, 8
  store i64 %t16, i64* %reg_9_ptr
  %t17 = load i64, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_9_ptr
  %t19 = add i64 %t17, %t18
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  store i64 %t20, i64* %var_slot_addr_ptr
  %t21 = load i64, i64* %var_slot_addr_ptr
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_11_ptr
  %t23 = inttoptr i64 %t22 to i64*
  %t24 = load i64, i64* %t23
  store i64 %t24, i64* %reg_12_ptr
  %t25 = load i64, i64* %reg_12_ptr
  store i64 %t25, i64* %var_curr_ptr
  br label %rt_gc_find_node_b1
rt_gc_find_node_b1:
  %t26 = load i64, i64* %var_curr_ptr
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i64, i64* %reg_13_ptr
  %t28 = icmp eq i64 %t27, 0
  %t29 = zext i1 %t28 to i64
  store i64 %t29, i64* %reg_14_ptr
  %t30 = load i64, i64* %reg_14_ptr
  %t32 = icmp ne i64 %t30, 0
  %t33 = zext i1 %t32 to i64
  %t31 = icmp ne i64 %t33, 0
  br i1 %t31, label %rt_gc_find_node_b3, label %rt_gc_find_node_b4
rt_gc_find_node_b2:
  ret i64 0
rt_gc_find_node_b3:
  ret i64 0
rt_gc_find_node_b4:
  br label %rt_gc_find_node_b5
rt_gc_find_node_b5:
  %t34 = load i64, i64* %var_curr_ptr
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  %t36 = inttoptr i64 %t35 to i64*
  %t37 = load i64, i64* %t36
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %reg_16_ptr
  store i64 %t38, i64* %var_node_ptr_ptr
  %t39 = load i64, i64* %var_node_ptr_ptr
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i64, i64* %var_ptr_ptr
  store i64 %t40, i64* %reg_18_ptr
  %t41 = load i64, i64* %reg_17_ptr
  %t42 = load i64, i64* %reg_18_ptr
  %t43 = icmp eq i64 %t41, %t42
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %rt_gc_find_node_b6, label %rt_gc_find_node_b7
rt_gc_find_node_b6:
  %t49 = load i64, i64* %var_curr_ptr
  store i64 %t49, i64* %reg_20_ptr
  %t50 = load i64, i64* %reg_20_ptr
  ret i64 %t50
rt_gc_find_node_b7:
  br label %rt_gc_find_node_b8
rt_gc_find_node_b8:
  %t51 = load i64, i64* %var_curr_ptr
  store i64 %t51, i64* %reg_21_ptr
  %t52 = load i64, i64* %reg_21_ptr
  %t53 = add i64 %t52, 24
  store i64 %t53, i64* %reg_22_ptr
  %t54 = load i64, i64* %reg_22_ptr
  %t55 = inttoptr i64 %t54 to i64*
  %t56 = load i64, i64* %t55
  store i64 %t56, i64* %reg_23_ptr
  %t57 = load i64, i64* %reg_23_ptr
  store i64 %t57, i64* %var_curr_ptr
  br label %rt_gc_find_node_b1
}

define void @rt_gc_push_root(i64 %arg0, i64 %arg1) {
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
  %var_top_ptr = alloca i64
  %var_slot_ptr = alloca i64
  %var_roots_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_slot_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = add i64 %t3, 32
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = inttoptr i64 %t5 to i64*
  %t7 = load i64, i64* %t6
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  store i64 %t8, i64* %var_top_ptr
  %t9 = load i64, i64* %var_top_ptr
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  %t11 = icmp sge i64 %t10, 4096
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_6_ptr
  %t13 = load i64, i64* %reg_6_ptr
  %t15 = icmp ne i64 %t13, 0
  %t16 = zext i1 %t15 to i64
  %t14 = icmp ne i64 %t16, 0
  br i1 %t14, label %rt_gc_push_root_b1, label %rt_gc_push_root_b2
rt_gc_push_root_b1:
  ret void
rt_gc_push_root_b2:
  br label %rt_gc_push_root_b3
rt_gc_push_root_b3:
  %t17 = load i64, i64* %var_ctx_ptr
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  %t19 = add i64 %t18, 40
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = inttoptr i64 %t20 to i64*
  %t22 = load i64, i64* %t21
  store i64 %t22, i64* %reg_9_ptr
  %t23 = load i64, i64* %reg_9_ptr
  store i64 %t23, i64* %var_roots_ptr
  %t24 = load i64, i64* %var_roots_ptr
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %var_top_ptr
  store i64 %t25, i64* %reg_11_ptr
  %t26 = load i64, i64* %reg_11_ptr
  %t27 = mul i64 %t26, 8
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_10_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = add i64 %t28, %t29
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %var_slot_ptr
  store i64 %t31, i64* %reg_14_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t34 = inttoptr i64 %t32 to i64*
  store i64 %t33, i64* %t34
  store i64 0, i64* %reg_15_ptr
  %t35 = load i64, i64* %var_ctx_ptr
  store i64 %t35, i64* %reg_16_ptr
  %t36 = load i64, i64* %reg_16_ptr
  %t37 = add i64 %t36, 32
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i64, i64* %var_top_ptr
  store i64 %t38, i64* %reg_18_ptr
  %t39 = load i64, i64* %reg_18_ptr
  %t40 = add i64 %t39, 1
  store i64 %t40, i64* %reg_19_ptr
  %t41 = load i64, i64* %reg_17_ptr
  %t42 = load i64, i64* %reg_19_ptr
  %t43 = inttoptr i64 %t41 to i64*
  store i64 %t42, i64* %t43
  store i64 0, i64* %reg_20_ptr
  ret void
}

define void @rt_gc_pop_roots(i64 %arg0, i64 %arg1) {
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
  %var_top_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_n_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = add i64 %t3, 32
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = inttoptr i64 %t5 to i64*
  %t7 = load i64, i64* %t6
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  store i64 %t8, i64* %var_top_ptr
  %t9 = load i64, i64* %var_top_ptr
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %var_n_ptr
  store i64 %t10, i64* %reg_6_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = sub i64 %t11, %t12
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  store i64 %t14, i64* %var_top_ptr
  %t15 = load i64, i64* %var_top_ptr
  store i64 %t15, i64* %reg_8_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = icmp slt i64 %t16, 0
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_9_ptr
  %t19 = load i64, i64* %reg_9_ptr
  %t21 = icmp ne i64 %t19, 0
  %t22 = zext i1 %t21 to i64
  %t20 = icmp ne i64 %t22, 0
  br i1 %t20, label %rt_gc_pop_roots_b1, label %rt_gc_pop_roots_b2
rt_gc_pop_roots_b1:
  store i64 0, i64* %var_top_ptr
  br label %rt_gc_pop_roots_b3
rt_gc_pop_roots_b2:
  br label %rt_gc_pop_roots_b3
rt_gc_pop_roots_b3:
  %t23 = load i64, i64* %var_ctx_ptr
  store i64 %t23, i64* %reg_10_ptr
  %t24 = load i64, i64* %reg_10_ptr
  %t25 = add i64 %t24, 32
  store i64 %t25, i64* %reg_11_ptr
  %t26 = load i64, i64* %var_top_ptr
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_12_ptr
  %t29 = inttoptr i64 %t27 to i64*
  store i64 %t28, i64* %t29
  store i64 0, i64* %reg_13_ptr
  ret void
}

define void @rt_gc_pause(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = add i64 %t2, 24
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = inttoptr i64 %t4 to i64*
  store i64 1, i64* %t5
  store i64 0, i64* %reg_3_ptr
  ret void
}

define void @rt_gc_resume(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = add i64 %t2, 24
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = inttoptr i64 %t4 to i64*
  store i64 0, i64* %t5
  store i64 0, i64* %reg_3_ptr
  ret void
}

define void @rt_gc_mark_phase(i64 %arg0) {
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
  %reg_167_ptr = alloca i64
  %reg_168_ptr = alloca i64
  %reg_169_ptr = alloca i64
  %reg_170_ptr = alloca i64
  %reg_171_ptr = alloca i64
  %reg_172_ptr = alloca i64
  %reg_173_ptr = alloca i64
  %reg_174_ptr = alloca i64
  %reg_175_ptr = alloca i64
  %reg_176_ptr = alloca i64
  %reg_177_ptr = alloca i64
  %reg_178_ptr = alloca i64
  %reg_179_ptr = alloca i64
  %reg_180_ptr = alloca i64
  %reg_181_ptr = alloca i64
  %reg_182_ptr = alloca i64
  %reg_183_ptr = alloca i64
  %reg_184_ptr = alloca i64
  %reg_185_ptr = alloca i64
  %reg_186_ptr = alloca i64
  %reg_187_ptr = alloca i64
  %reg_188_ptr = alloca i64
  %reg_189_ptr = alloca i64
  %reg_190_ptr = alloca i64
  %reg_191_ptr = alloca i64
  %reg_192_ptr = alloca i64
  %reg_193_ptr = alloca i64
  %reg_194_ptr = alloca i64
  %reg_195_ptr = alloca i64
  %reg_196_ptr = alloca i64
  %reg_197_ptr = alloca i64
  %reg_198_ptr = alloca i64
  %reg_199_ptr = alloca i64
  %reg_200_ptr = alloca i64
  %reg_201_ptr = alloca i64
  %reg_202_ptr = alloca i64
  %reg_203_ptr = alloca i64
  %reg_204_ptr = alloca i64
  %reg_205_ptr = alloca i64
  %reg_206_ptr = alloca i64
  %reg_207_ptr = alloca i64
  %reg_208_ptr = alloca i64
  %reg_209_ptr = alloca i64
  %reg_210_ptr = alloca i64
  %reg_211_ptr = alloca i64
  %reg_212_ptr = alloca i64
  %reg_213_ptr = alloca i64
  %reg_214_ptr = alloca i64
  %reg_215_ptr = alloca i64
  %reg_216_ptr = alloca i64
  %reg_217_ptr = alloca i64
  %reg_218_ptr = alloca i64
  %reg_219_ptr = alloca i64
  %reg_220_ptr = alloca i64
  %reg_221_ptr = alloca i64
  %reg_222_ptr = alloca i64
  %reg_223_ptr = alloca i64
  %reg_224_ptr = alloca i64
  %reg_225_ptr = alloca i64
  %reg_226_ptr = alloca i64
  %reg_227_ptr = alloca i64
  %reg_228_ptr = alloca i64
  %reg_229_ptr = alloca i64
  %reg_230_ptr = alloca i64
  %reg_231_ptr = alloca i64
  %reg_232_ptr = alloca i64
  %reg_233_ptr = alloca i64
  %reg_234_ptr = alloca i64
  %reg_235_ptr = alloca i64
  %reg_236_ptr = alloca i64
  %reg_237_ptr = alloca i64
  %reg_238_ptr = alloca i64
  %reg_239_ptr = alloca i64
  %reg_240_ptr = alloca i64
  %reg_241_ptr = alloca i64
  %reg_242_ptr = alloca i64
  %reg_243_ptr = alloca i64
  %reg_244_ptr = alloca i64
  %reg_245_ptr = alloca i64
  %reg_246_ptr = alloca i64
  %reg_247_ptr = alloca i64
  %reg_248_ptr = alloca i64
  %reg_249_ptr = alloca i64
  %reg_250_ptr = alloca i64
  %reg_251_ptr = alloca i64
  %reg_252_ptr = alloca i64
  %reg_253_ptr = alloca i64
  %reg_254_ptr = alloca i64
  %reg_255_ptr = alloca i64
  %reg_256_ptr = alloca i64
  %reg_257_ptr = alloca i64
  %reg_258_ptr = alloca i64
  %reg_259_ptr = alloca i64
  %reg_260_ptr = alloca i64
  %reg_261_ptr = alloca i64
  %reg_262_ptr = alloca i64
  %reg_263_ptr = alloca i64
  %reg_264_ptr = alloca i64
  %reg_265_ptr = alloca i64
  %reg_266_ptr = alloca i64
  %reg_267_ptr = alloca i64
  %reg_268_ptr = alloca i64
  %reg_269_ptr = alloca i64
  %reg_270_ptr = alloca i64
  %reg_271_ptr = alloca i64
  %reg_272_ptr = alloca i64
  %reg_273_ptr = alloca i64
  %reg_274_ptr = alloca i64
  %reg_275_ptr = alloca i64
  %reg_276_ptr = alloca i64
  %reg_277_ptr = alloca i64
  %reg_278_ptr = alloca i64
  %reg_279_ptr = alloca i64
  %reg_280_ptr = alloca i64
  %reg_281_ptr = alloca i64
  %reg_282_ptr = alloca i64
  %reg_283_ptr = alloca i64
  %reg_284_ptr = alloca i64
  %reg_285_ptr = alloca i64
  %reg_286_ptr = alloca i64
  %reg_287_ptr = alloca i64
  %reg_288_ptr = alloca i64
  %reg_289_ptr = alloca i64
  %reg_290_ptr = alloca i64
  %reg_291_ptr = alloca i64
  %reg_292_ptr = alloca i64
  %reg_293_ptr = alloca i64
  %reg_294_ptr = alloca i64
  %reg_295_ptr = alloca i64
  %reg_296_ptr = alloca i64
  %reg_297_ptr = alloca i64
  %reg_298_ptr = alloca i64
  %reg_299_ptr = alloca i64
  %reg_300_ptr = alloca i64
  %reg_301_ptr = alloca i64
  %reg_302_ptr = alloca i64
  %reg_303_ptr = alloca i64
  %reg_304_ptr = alloca i64
  %reg_305_ptr = alloca i64
  %reg_306_ptr = alloca i64
  %reg_307_ptr = alloca i64
  %reg_308_ptr = alloca i64
  %reg_309_ptr = alloca i64
  %reg_310_ptr = alloca i64
  %reg_311_ptr = alloca i64
  %reg_312_ptr = alloca i64
  %reg_313_ptr = alloca i64
  %reg_314_ptr = alloca i64
  %reg_315_ptr = alloca i64
  %reg_316_ptr = alloca i64
  %reg_317_ptr = alloca i64
  %reg_318_ptr = alloca i64
  %reg_319_ptr = alloca i64
  %reg_320_ptr = alloca i64
  %reg_321_ptr = alloca i64
  %reg_322_ptr = alloca i64
  %reg_323_ptr = alloca i64
  %reg_324_ptr = alloca i64
  %reg_325_ptr = alloca i64
  %reg_326_ptr = alloca i64
  %reg_327_ptr = alloca i64
  %reg_328_ptr = alloca i64
  %reg_329_ptr = alloca i64
  %reg_330_ptr = alloca i64
  %reg_331_ptr = alloca i64
  %reg_332_ptr = alloca i64
  %reg_333_ptr = alloca i64
  %reg_334_ptr = alloca i64
  %reg_335_ptr = alloca i64
  %reg_336_ptr = alloca i64
  %reg_337_ptr = alloca i64
  %reg_338_ptr = alloca i64
  %reg_339_ptr = alloca i64
  %reg_340_ptr = alloca i64
  %reg_341_ptr = alloca i64
  %reg_342_ptr = alloca i64
  %reg_343_ptr = alloca i64
  %reg_344_ptr = alloca i64
  %reg_345_ptr = alloca i64
  %reg_346_ptr = alloca i64
  %reg_347_ptr = alloca i64
  %reg_348_ptr = alloca i64
  %reg_349_ptr = alloca i64
  %reg_350_ptr = alloca i64
  %reg_351_ptr = alloca i64
  %reg_352_ptr = alloca i64
  %reg_353_ptr = alloca i64
  %reg_354_ptr = alloca i64
  %reg_355_ptr = alloca i64
  %reg_356_ptr = alloca i64
  %reg_357_ptr = alloca i64
  %reg_358_ptr = alloca i64
  %reg_359_ptr = alloca i64
  %reg_360_ptr = alloca i64
  %reg_361_ptr = alloca i64
  %reg_362_ptr = alloca i64
  %reg_363_ptr = alloca i64
  %reg_364_ptr = alloca i64
  %reg_365_ptr = alloca i64
  %reg_366_ptr = alloca i64
  %reg_367_ptr = alloca i64
  %reg_368_ptr = alloca i64
  %reg_369_ptr = alloca i64
  %reg_370_ptr = alloca i64
  %reg_371_ptr = alloca i64
  %reg_372_ptr = alloca i64
  %reg_373_ptr = alloca i64
  %reg_374_ptr = alloca i64
  %reg_375_ptr = alloca i64
  %reg_376_ptr = alloca i64
  %reg_377_ptr = alloca i64
  %reg_378_ptr = alloca i64
  %reg_379_ptr = alloca i64
  %reg_380_ptr = alloca i64
  %reg_381_ptr = alloca i64
  %reg_382_ptr = alloca i64
  %reg_383_ptr = alloca i64
  %reg_384_ptr = alloca i64
  %reg_385_ptr = alloca i64
  %reg_386_ptr = alloca i64
  %reg_387_ptr = alloca i64
  %reg_388_ptr = alloca i64
  %reg_389_ptr = alloca i64
  %reg_390_ptr = alloca i64
  %reg_391_ptr = alloca i64
  %reg_392_ptr = alloca i64
  %reg_393_ptr = alloca i64
  %reg_394_ptr = alloca i64
  %reg_395_ptr = alloca i64
  %reg_396_ptr = alloca i64
  %reg_397_ptr = alloca i64
  %reg_398_ptr = alloca i64
  %reg_399_ptr = alloca i64
  %reg_400_ptr = alloca i64
  %reg_401_ptr = alloca i64
  %reg_402_ptr = alloca i64
  %reg_403_ptr = alloca i64
  %reg_404_ptr = alloca i64
  %reg_405_ptr = alloca i64
  %reg_406_ptr = alloca i64
  %reg_407_ptr = alloca i64
  %reg_408_ptr = alloca i64
  %reg_409_ptr = alloca i64
  %reg_410_ptr = alloca i64
  %reg_411_ptr = alloca i64
  %reg_412_ptr = alloca i64
  %reg_413_ptr = alloca i64
  %reg_414_ptr = alloca i64
  %reg_415_ptr = alloca i64
  %reg_416_ptr = alloca i64
  %reg_417_ptr = alloca i64
  %reg_418_ptr = alloca i64
  %reg_419_ptr = alloca i64
  %reg_420_ptr = alloca i64
  %reg_421_ptr = alloca i64
  %reg_422_ptr = alloca i64
  %reg_423_ptr = alloca i64
  %reg_424_ptr = alloca i64
  %reg_425_ptr = alloca i64
  %reg_426_ptr = alloca i64
  %reg_427_ptr = alloca i64
  %reg_428_ptr = alloca i64
  %reg_429_ptr = alloca i64
  %reg_430_ptr = alloca i64
  %reg_431_ptr = alloca i64
  %reg_432_ptr = alloca i64
  %reg_433_ptr = alloca i64
  %reg_434_ptr = alloca i64
  %reg_435_ptr = alloca i64
  %reg_436_ptr = alloca i64
  %reg_437_ptr = alloca i64
  %reg_438_ptr = alloca i64
  %reg_439_ptr = alloca i64
  %reg_440_ptr = alloca i64
  %reg_441_ptr = alloca i64
  %reg_442_ptr = alloca i64
  %reg_443_ptr = alloca i64
  %reg_444_ptr = alloca i64
  %reg_445_ptr = alloca i64
  %reg_446_ptr = alloca i64
  %reg_447_ptr = alloca i64
  %reg_448_ptr = alloca i64
  %reg_449_ptr = alloca i64
  %reg_450_ptr = alloca i64
  %reg_451_ptr = alloca i64
  %reg_452_ptr = alloca i64
  %reg_453_ptr = alloca i64
  %reg_454_ptr = alloca i64
  %reg_455_ptr = alloca i64
  %reg_456_ptr = alloca i64
  %reg_457_ptr = alloca i64
  %reg_458_ptr = alloca i64
  %reg_459_ptr = alloca i64
  %reg_460_ptr = alloca i64
  %reg_461_ptr = alloca i64
  %reg_462_ptr = alloca i64
  %reg_463_ptr = alloca i64
  %reg_464_ptr = alloca i64
  %reg_465_ptr = alloca i64
  %reg_466_ptr = alloca i64
  %reg_467_ptr = alloca i64
  %reg_468_ptr = alloca i64
  %reg_469_ptr = alloca i64
  %reg_470_ptr = alloca i64
  %reg_471_ptr = alloca i64
  %reg_472_ptr = alloca i64
  %reg_473_ptr = alloca i64
  %reg_474_ptr = alloca i64
  %reg_475_ptr = alloca i64
  %reg_476_ptr = alloca i64
  %reg_477_ptr = alloca i64
  %reg_478_ptr = alloca i64
  %reg_479_ptr = alloca i64
  %reg_480_ptr = alloca i64
  %reg_481_ptr = alloca i64
  %reg_482_ptr = alloca i64
  %reg_483_ptr = alloca i64
  %reg_484_ptr = alloca i64
  %reg_485_ptr = alloca i64
  %reg_486_ptr = alloca i64
  %reg_487_ptr = alloca i64
  %reg_488_ptr = alloca i64
  %reg_489_ptr = alloca i64
  %reg_490_ptr = alloca i64
  %reg_491_ptr = alloca i64
  %reg_492_ptr = alloca i64
  %reg_493_ptr = alloca i64
  %reg_494_ptr = alloca i64
  %reg_495_ptr = alloca i64
  %reg_496_ptr = alloca i64
  %reg_497_ptr = alloca i64
  %reg_498_ptr = alloca i64
  %reg_499_ptr = alloca i64
  %reg_500_ptr = alloca i64
  %reg_501_ptr = alloca i64
  %reg_502_ptr = alloca i64
  %reg_503_ptr = alloca i64
  %reg_504_ptr = alloca i64
  %reg_505_ptr = alloca i64
  %reg_506_ptr = alloca i64
  %reg_507_ptr = alloca i64
  %reg_508_ptr = alloca i64
  %reg_509_ptr = alloca i64
  %reg_510_ptr = alloca i64
  %reg_511_ptr = alloca i64
  %reg_512_ptr = alloca i64
  %reg_513_ptr = alloca i64
  %reg_514_ptr = alloca i64
  %reg_515_ptr = alloca i64
  %reg_516_ptr = alloca i64
  %reg_517_ptr = alloca i64
  %reg_518_ptr = alloca i64
  %reg_519_ptr = alloca i64
  %reg_520_ptr = alloca i64
  %reg_521_ptr = alloca i64
  %reg_522_ptr = alloca i64
  %reg_523_ptr = alloca i64
  %reg_524_ptr = alloca i64
  %reg_525_ptr = alloca i64
  %reg_526_ptr = alloca i64
  %reg_527_ptr = alloca i64
  %reg_528_ptr = alloca i64
  %reg_529_ptr = alloca i64
  %reg_530_ptr = alloca i64
  %reg_531_ptr = alloca i64
  %reg_532_ptr = alloca i64
  %reg_533_ptr = alloca i64
  %reg_534_ptr = alloca i64
  %reg_535_ptr = alloca i64
  %reg_536_ptr = alloca i64
  %reg_537_ptr = alloca i64
  %reg_538_ptr = alloca i64
  %reg_539_ptr = alloca i64
  %reg_540_ptr = alloca i64
  %reg_541_ptr = alloca i64
  %reg_542_ptr = alloca i64
  %reg_543_ptr = alloca i64
  %reg_544_ptr = alloca i64
  %reg_545_ptr = alloca i64
  %reg_546_ptr = alloca i64
  %reg_547_ptr = alloca i64
  %reg_548_ptr = alloca i64
  %reg_549_ptr = alloca i64
  %reg_550_ptr = alloca i64
  %reg_551_ptr = alloca i64
  %reg_552_ptr = alloca i64
  %reg_553_ptr = alloca i64
  %reg_554_ptr = alloca i64
  %reg_555_ptr = alloca i64
  %reg_556_ptr = alloca i64
  %reg_557_ptr = alloca i64
  %reg_558_ptr = alloca i64
  %reg_559_ptr = alloca i64
  %reg_560_ptr = alloca i64
  %reg_561_ptr = alloca i64
  %reg_562_ptr = alloca i64
  %reg_563_ptr = alloca i64
  %reg_564_ptr = alloca i64
  %reg_565_ptr = alloca i64
  %reg_566_ptr = alloca i64
  %reg_567_ptr = alloca i64
  %reg_568_ptr = alloca i64
  %reg_569_ptr = alloca i64
  %reg_570_ptr = alloca i64
  %reg_571_ptr = alloca i64
  %reg_572_ptr = alloca i64
  %reg_573_ptr = alloca i64
  %reg_574_ptr = alloca i64
  %reg_575_ptr = alloca i64
  %reg_576_ptr = alloca i64
  %reg_577_ptr = alloca i64
  %reg_578_ptr = alloca i64
  %reg_579_ptr = alloca i64
  %reg_580_ptr = alloca i64
  %reg_581_ptr = alloca i64
  %reg_582_ptr = alloca i64
  %reg_583_ptr = alloca i64
  %reg_584_ptr = alloca i64
  %reg_585_ptr = alloca i64
  %reg_586_ptr = alloca i64
  %reg_587_ptr = alloca i64
  %reg_588_ptr = alloca i64
  %reg_589_ptr = alloca i64
  %reg_590_ptr = alloca i64
  %reg_591_ptr = alloca i64
  %reg_592_ptr = alloca i64
  %reg_593_ptr = alloca i64
  %reg_594_ptr = alloca i64
  %reg_595_ptr = alloca i64
  %reg_596_ptr = alloca i64
  %reg_597_ptr = alloca i64
  %reg_598_ptr = alloca i64
  %reg_599_ptr = alloca i64
  %var_queue_ptr = alloca i64
  %var_nslots_ptr = alloca i64
  %var_payload_ptr = alloca i64
  %var_mark_val_ptr = alloca i64
  %var_kind_val_ptr = alloca i64
  %var_ml_len_ptr = alloca i64
  %var_ipay_ptr = alloca i64
  %var_vtag_ptr = alloca i64
  %var_qcap_ptr = alloca i64
  %var_mk_ptr = alloca i64
  %var_top_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_nq_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_etag_ptr = alloca i64
  %var_p_ptr = alloca i64
  %var_qlen_ptr = alloca i64
  %var_val_ptr = alloca i64
  %var_itag_ptr = alloca i64
  %var_slot_ptr = alloca i64
  %var_stag_ptr = alloca i64
  %var_qi_ptr = alloca i64
  %var_closure_ptr_ptr = alloca i64
  %var_roots_ptr = alloca i64
  %var_entry_ptr = alloca i64
  %var_epay_ptr = alloca i64
  %var_vpay_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_item_base_ptr = alloca i64
  %var_j_ptr = alloca i64
  %var_slot_base_ptr = alloca i64
  %var_fields_ptr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  store i64 64, i64* %var_qcap_ptr
  %t1 = load i64, i64* %var_qcap_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = mul i64 %t2, 8
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = call i64 @__sys_pointer_alloc(i64 %t4)
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  store i64 %t6, i64* %var_queue_ptr
  %t7 = load i64, i64* %var_queue_ptr
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = icmp eq i64 %t8, 0
  %t10 = zext i1 %t9 to i64
  store i64 %t10, i64* %reg_5_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t13 = icmp ne i64 %t11, 0
  %t14 = zext i1 %t13 to i64
  %t12 = icmp ne i64 %t14, 0
  br i1 %t12, label %rt_gc_mark_phase_b1, label %rt_gc_mark_phase_b2
rt_gc_mark_phase_b1:
  ret void
rt_gc_mark_phase_b2:
  br label %rt_gc_mark_phase_b3
rt_gc_mark_phase_b3:
  store i64 0, i64* %var_qlen_ptr
  %t15 = load i64, i64* %var_ctx_ptr
  store i64 %t15, i64* %reg_6_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = add i64 %t16, 32
  store i64 %t17, i64* %reg_7_ptr
  %t18 = load i64, i64* %reg_7_ptr
  %t19 = inttoptr i64 %t18 to i64*
  %t20 = load i64, i64* %t19
  store i64 %t20, i64* %reg_8_ptr
  %t21 = load i64, i64* %reg_8_ptr
  store i64 %t21, i64* %var_top_ptr
  %t22 = load i64, i64* %var_ctx_ptr
  store i64 %t22, i64* %reg_9_ptr
  %t23 = load i64, i64* %reg_9_ptr
  %t24 = add i64 %t23, 40
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  %t26 = inttoptr i64 %t25 to i64*
  %t27 = load i64, i64* %t26
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_11_ptr
  store i64 %t28, i64* %var_roots_ptr
  store i64 0, i64* %var_i_ptr
  br label %rt_gc_mark_phase_b4
rt_gc_mark_phase_b4:
  %t29 = load i64, i64* %var_i_ptr
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %var_top_ptr
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = icmp sge i64 %t31, %t32
  %t34 = zext i1 %t33 to i64
  store i64 %t34, i64* %reg_14_ptr
  %t35 = load i64, i64* %reg_14_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %rt_gc_mark_phase_b6, label %rt_gc_mark_phase_b7
rt_gc_mark_phase_b5:
  store i64 0, i64* %var_qi_ptr
  br label %rt_gc_mark_phase_b21
rt_gc_mark_phase_b6:
  br label %rt_gc_mark_phase_b5
rt_gc_mark_phase_b7:
  br label %rt_gc_mark_phase_b8
rt_gc_mark_phase_b8:
  %t39 = load i64, i64* %var_roots_ptr
  store i64 %t39, i64* %reg_15_ptr
  %t40 = load i64, i64* %var_i_ptr
  store i64 %t40, i64* %reg_16_ptr
  %t41 = load i64, i64* %reg_16_ptr
  %t42 = mul i64 %t41, 8
  store i64 %t42, i64* %reg_17_ptr
  %t43 = load i64, i64* %reg_15_ptr
  %t44 = load i64, i64* %reg_17_ptr
  %t45 = add i64 %t43, %t44
  store i64 %t45, i64* %reg_18_ptr
  %t46 = load i64, i64* %reg_18_ptr
  %t47 = inttoptr i64 %t46 to i64*
  %t48 = load i64, i64* %t47
  store i64 %t48, i64* %reg_19_ptr
  %t49 = load i64, i64* %reg_19_ptr
  store i64 %t49, i64* %var_slot_ptr
  %t50 = load i64, i64* %var_slot_ptr
  store i64 %t50, i64* %reg_20_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t52 = icmp ne i64 %t51, 0
  %t53 = zext i1 %t52 to i64
  store i64 %t53, i64* %reg_21_ptr
  %t54 = load i64, i64* %reg_21_ptr
  %t56 = icmp ne i64 %t54, 0
  %t57 = zext i1 %t56 to i64
  %t55 = icmp ne i64 %t57, 0
  br i1 %t55, label %rt_gc_mark_phase_b9, label %rt_gc_mark_phase_b10
rt_gc_mark_phase_b9:
  %t58 = load i64, i64* %var_slot_ptr
  store i64 %t58, i64* %reg_22_ptr
  %t59 = load i64, i64* %reg_22_ptr
  %t60 = inttoptr i64 %t59 to i64*
  %t61 = load i64, i64* %t60
  store i64 %t61, i64* %reg_23_ptr
  %t62 = load i64, i64* %reg_23_ptr
  store i64 %t62, i64* %var_val_ptr
  %t63 = load i64, i64* %var_val_ptr
  store i64 %t63, i64* %reg_24_ptr
  %t64 = load i64, i64* %reg_24_ptr
  %t65 = icmp ne i64 %t64, 0
  %t66 = zext i1 %t65 to i64
  store i64 %t66, i64* %reg_25_ptr
  %t67 = load i64, i64* %reg_25_ptr
  %t69 = icmp ne i64 %t67, 0
  %t70 = zext i1 %t69 to i64
  %t68 = icmp ne i64 %t70, 0
  br i1 %t68, label %rt_gc_mark_phase_b12, label %rt_gc_mark_phase_b13
rt_gc_mark_phase_b10:
  br label %rt_gc_mark_phase_b11
rt_gc_mark_phase_b11:
  %t71 = load i64, i64* %var_i_ptr
  store i64 %t71, i64* %reg_52_ptr
  %t72 = load i64, i64* %reg_52_ptr
  %t73 = add i64 %t72, 1
  store i64 %t73, i64* %reg_53_ptr
  %t74 = load i64, i64* %reg_53_ptr
  store i64 %t74, i64* %var_i_ptr
  br label %rt_gc_mark_phase_b4
rt_gc_mark_phase_b12:
  %t75 = load i64, i64* %var_qlen_ptr
  store i64 %t75, i64* %reg_26_ptr
  %t76 = load i64, i64* %var_qcap_ptr
  store i64 %t76, i64* %reg_27_ptr
  %t77 = load i64, i64* %reg_26_ptr
  %t78 = load i64, i64* %reg_27_ptr
  %t79 = icmp sge i64 %t77, %t78
  %t80 = zext i1 %t79 to i64
  store i64 %t80, i64* %reg_28_ptr
  %t81 = load i64, i64* %reg_28_ptr
  %t83 = icmp ne i64 %t81, 0
  %t84 = zext i1 %t83 to i64
  %t82 = icmp ne i64 %t84, 0
  br i1 %t82, label %rt_gc_mark_phase_b15, label %rt_gc_mark_phase_b16
rt_gc_mark_phase_b13:
  br label %rt_gc_mark_phase_b14
rt_gc_mark_phase_b14:
  br label %rt_gc_mark_phase_b11
rt_gc_mark_phase_b15:
  %t85 = load i64, i64* %var_qcap_ptr
  store i64 %t85, i64* %reg_29_ptr
  %t86 = load i64, i64* %reg_29_ptr
  %t87 = mul i64 %t86, 2
  store i64 %t87, i64* %reg_30_ptr
  %t88 = load i64, i64* %reg_30_ptr
  store i64 %t88, i64* %var_qcap_ptr
  %t89 = load i64, i64* %var_qcap_ptr
  store i64 %t89, i64* %reg_31_ptr
  %t90 = load i64, i64* %reg_31_ptr
  %t91 = mul i64 %t90, 8
  store i64 %t91, i64* %reg_32_ptr
  %t92 = load i64, i64* %reg_32_ptr
  %t93 = call i64 @__sys_pointer_alloc(i64 %t92)
  store i64 %t93, i64* %reg_33_ptr
  %t94 = load i64, i64* %reg_33_ptr
  store i64 %t94, i64* %var_nq_ptr
  %t95 = load i64, i64* %var_nq_ptr
  store i64 %t95, i64* %reg_34_ptr
  %t96 = load i64, i64* %reg_34_ptr
  %t97 = icmp ne i64 %t96, 0
  %t98 = zext i1 %t97 to i64
  store i64 %t98, i64* %reg_35_ptr
  %t99 = load i64, i64* %reg_35_ptr
  %t101 = icmp ne i64 %t99, 0
  %t102 = zext i1 %t101 to i64
  %t100 = icmp ne i64 %t102, 0
  br i1 %t100, label %rt_gc_mark_phase_b18, label %rt_gc_mark_phase_b19
rt_gc_mark_phase_b16:
  br label %rt_gc_mark_phase_b17
rt_gc_mark_phase_b17:
  %t103 = load i64, i64* %var_queue_ptr
  store i64 %t103, i64* %reg_44_ptr
  %t104 = load i64, i64* %var_qlen_ptr
  store i64 %t104, i64* %reg_45_ptr
  %t105 = load i64, i64* %reg_45_ptr
  %t106 = mul i64 %t105, 8
  store i64 %t106, i64* %reg_46_ptr
  %t107 = load i64, i64* %reg_44_ptr
  %t108 = load i64, i64* %reg_46_ptr
  %t109 = add i64 %t107, %t108
  store i64 %t109, i64* %reg_47_ptr
  %t110 = load i64, i64* %var_val_ptr
  store i64 %t110, i64* %reg_48_ptr
  %t111 = load i64, i64* %reg_47_ptr
  %t112 = load i64, i64* %reg_48_ptr
  %t113 = inttoptr i64 %t111 to i64*
  store i64 %t112, i64* %t113
  store i64 0, i64* %reg_49_ptr
  %t114 = load i64, i64* %var_qlen_ptr
  store i64 %t114, i64* %reg_50_ptr
  %t115 = load i64, i64* %reg_50_ptr
  %t116 = add i64 %t115, 1
  store i64 %t116, i64* %reg_51_ptr
  %t117 = load i64, i64* %reg_51_ptr
  store i64 %t117, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b14
rt_gc_mark_phase_b18:
  %t118 = load i64, i64* %var_nq_ptr
  store i64 %t118, i64* %reg_36_ptr
  %t119 = load i64, i64* %var_queue_ptr
  store i64 %t119, i64* %reg_37_ptr
  %t120 = load i64, i64* %var_qlen_ptr
  store i64 %t120, i64* %reg_38_ptr
  %t121 = load i64, i64* %reg_38_ptr
  %t122 = mul i64 %t121, 8
  store i64 %t122, i64* %reg_39_ptr
  %t123 = load i64, i64* %reg_36_ptr
  %t124 = load i64, i64* %reg_37_ptr
  %t125 = load i64, i64* %reg_39_ptr
  %t126 = inttoptr i64 %t123 to i8*
  %t127 = inttoptr i64 %t124 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t126, i8* %t127, i64 %t125, i1 false)
  store i64 0, i64* %reg_40_ptr
  %t128 = load i64, i64* %var_queue_ptr
  store i64 %t128, i64* %reg_41_ptr
  %t129 = load i64, i64* %reg_41_ptr
  %t130 = call i64 @__sys_pointer_free(i64 %t129)
  store i64 %t130, i64* %reg_42_ptr
  %t131 = load i64, i64* %var_nq_ptr
  store i64 %t131, i64* %reg_43_ptr
  %t132 = load i64, i64* %reg_43_ptr
  store i64 %t132, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b20
rt_gc_mark_phase_b19:
  br label %rt_gc_mark_phase_b20
rt_gc_mark_phase_b20:
  br label %rt_gc_mark_phase_b17
rt_gc_mark_phase_b21:
  %t133 = load i64, i64* %var_qi_ptr
  store i64 %t133, i64* %reg_54_ptr
  %t134 = load i64, i64* %var_qlen_ptr
  store i64 %t134, i64* %reg_55_ptr
  %t135 = load i64, i64* %reg_54_ptr
  %t136 = load i64, i64* %reg_55_ptr
  %t137 = icmp sge i64 %t135, %t136
  %t138 = zext i1 %t137 to i64
  store i64 %t138, i64* %reg_56_ptr
  %t139 = load i64, i64* %reg_56_ptr
  %t141 = icmp ne i64 %t139, 0
  %t142 = zext i1 %t141 to i64
  %t140 = icmp ne i64 %t142, 0
  br i1 %t140, label %rt_gc_mark_phase_b23, label %rt_gc_mark_phase_b24
rt_gc_mark_phase_b22:
  %t143 = load i64, i64* %var_queue_ptr
  store i64 %t143, i64* %reg_598_ptr
  %t144 = load i64, i64* %reg_598_ptr
  %t145 = call i64 @__sys_pointer_free(i64 %t144)
  store i64 %t145, i64* %reg_599_ptr
  ret void
rt_gc_mark_phase_b23:
  br label %rt_gc_mark_phase_b22
rt_gc_mark_phase_b24:
  br label %rt_gc_mark_phase_b25
rt_gc_mark_phase_b25:
  %t146 = load i64, i64* %var_queue_ptr
  store i64 %t146, i64* %reg_57_ptr
  %t147 = load i64, i64* %var_qi_ptr
  store i64 %t147, i64* %reg_58_ptr
  %t148 = load i64, i64* %reg_58_ptr
  %t149 = mul i64 %t148, 8
  store i64 %t149, i64* %reg_59_ptr
  %t150 = load i64, i64* %reg_57_ptr
  %t151 = load i64, i64* %reg_59_ptr
  %t152 = add i64 %t150, %t151
  store i64 %t152, i64* %reg_60_ptr
  %t153 = load i64, i64* %reg_60_ptr
  %t154 = inttoptr i64 %t153 to i64*
  %t155 = load i64, i64* %t154
  store i64 %t155, i64* %reg_61_ptr
  %t156 = load i64, i64* %reg_61_ptr
  store i64 %t156, i64* %var_p_ptr
  %t157 = load i64, i64* %var_qi_ptr
  store i64 %t157, i64* %reg_62_ptr
  %t158 = load i64, i64* %reg_62_ptr
  %t159 = add i64 %t158, 1
  store i64 %t159, i64* %reg_63_ptr
  %t160 = load i64, i64* %reg_63_ptr
  store i64 %t160, i64* %var_qi_ptr
  %t161 = load i64, i64* %var_ctx_ptr
  store i64 %t161, i64* %reg_64_ptr
  %t162 = load i64, i64* %var_p_ptr
  store i64 %t162, i64* %reg_65_ptr
  %t163 = load i64, i64* %reg_64_ptr
  %t164 = load i64, i64* %reg_65_ptr
  %t165 = call i64 @rt_gc_find_node(i64 %t163, i64 %t164)
  store i64 %t165, i64* %reg_66_ptr
  %t166 = load i64, i64* %reg_66_ptr
  store i64 %t166, i64* %var_node_ptr
  %t167 = load i64, i64* %var_node_ptr
  store i64 %t167, i64* %reg_67_ptr
  %t168 = load i64, i64* %reg_67_ptr
  %t169 = icmp ne i64 %t168, 0
  %t170 = zext i1 %t169 to i64
  store i64 %t170, i64* %reg_68_ptr
  %t171 = load i64, i64* %reg_68_ptr
  %t173 = icmp ne i64 %t171, 0
  %t174 = zext i1 %t173 to i64
  %t172 = icmp ne i64 %t174, 0
  br i1 %t172, label %rt_gc_mark_phase_b26, label %rt_gc_mark_phase_b27
rt_gc_mark_phase_b26:
  %t175 = load i64, i64* %var_node_ptr
  store i64 %t175, i64* %reg_69_ptr
  %t176 = load i64, i64* %reg_69_ptr
  %t177 = add i64 %t176, 8
  store i64 %t177, i64* %reg_70_ptr
  %t178 = load i64, i64* %reg_70_ptr
  %t179 = inttoptr i64 %t178 to i64*
  %t180 = load i64, i64* %t179
  store i64 %t180, i64* %reg_71_ptr
  %t181 = load i64, i64* %reg_71_ptr
  store i64 %t181, i64* %var_mk_ptr
  %t182 = load i64, i64* %var_mk_ptr
  store i64 %t182, i64* %reg_72_ptr
  %t183 = load i64, i64* %reg_72_ptr
  %t184 = ashr i64 %t183, 8
  store i64 %t184, i64* %reg_73_ptr
  %t185 = load i64, i64* %reg_73_ptr
  %t186 = and i64 %t185, 255
  store i64 %t186, i64* %reg_74_ptr
  %t187 = load i64, i64* %reg_74_ptr
  store i64 %t187, i64* %var_mark_val_ptr
  %t188 = load i64, i64* %var_mark_val_ptr
  store i64 %t188, i64* %reg_75_ptr
  %t189 = load i64, i64* %reg_75_ptr
  %t190 = icmp ne i64 %t189, 2
  %t191 = zext i1 %t190 to i64
  store i64 %t191, i64* %reg_76_ptr
  %t192 = load i64, i64* %reg_76_ptr
  %t194 = icmp ne i64 %t192, 0
  %t195 = zext i1 %t194 to i64
  %t193 = icmp ne i64 %t195, 0
  br i1 %t193, label %rt_gc_mark_phase_b29, label %rt_gc_mark_phase_b30
rt_gc_mark_phase_b27:
  br label %rt_gc_mark_phase_b28
rt_gc_mark_phase_b28:
  br label %rt_gc_mark_phase_b21
rt_gc_mark_phase_b29:
  %t196 = load i64, i64* %var_mk_ptr
  store i64 %t196, i64* %reg_77_ptr
  %t197 = load i64, i64* %reg_77_ptr
  %t198 = and i64 %t197, 255
  store i64 %t198, i64* %reg_78_ptr
  %t199 = load i64, i64* %reg_78_ptr
  store i64 %t199, i64* %var_kind_val_ptr
  %t200 = load i64, i64* %var_kind_val_ptr
  store i64 %t200, i64* %reg_79_ptr
  %t201 = mul i64 2, 256
  store i64 %t201, i64* %reg_80_ptr
  %t202 = load i64, i64* %reg_79_ptr
  %t203 = load i64, i64* %reg_80_ptr
  %t204 = or i64 %t202, %t203
  store i64 %t204, i64* %reg_81_ptr
  %t205 = load i64, i64* %reg_81_ptr
  store i64 %t205, i64* %var_mk_ptr
  %t206 = load i64, i64* %var_node_ptr
  store i64 %t206, i64* %reg_82_ptr
  %t207 = load i64, i64* %reg_82_ptr
  %t208 = add i64 %t207, 8
  store i64 %t208, i64* %reg_83_ptr
  %t209 = load i64, i64* %var_mk_ptr
  store i64 %t209, i64* %reg_84_ptr
  %t210 = load i64, i64* %reg_83_ptr
  %t211 = load i64, i64* %reg_84_ptr
  %t212 = inttoptr i64 %t210 to i64*
  store i64 %t211, i64* %t212
  store i64 0, i64* %reg_85_ptr
  %t213 = load i64, i64* %var_kind_val_ptr
  store i64 %t213, i64* %reg_86_ptr
  %t214 = load i64, i64* %reg_86_ptr
  %t215 = icmp eq i64 %t214, 3
  %t216 = zext i1 %t215 to i64
  store i64 %t216, i64* %reg_87_ptr
  %t217 = load i64, i64* %reg_87_ptr
  %t219 = icmp ne i64 %t217, 0
  %t220 = zext i1 %t219 to i64
  %t218 = icmp ne i64 %t220, 0
  br i1 %t218, label %rt_gc_mark_phase_b32, label %rt_gc_mark_phase_b33
rt_gc_mark_phase_b30:
  br label %rt_gc_mark_phase_b31
rt_gc_mark_phase_b31:
  br label %rt_gc_mark_phase_b28
rt_gc_mark_phase_b32:
  %t221 = load i64, i64* %var_p_ptr
  store i64 %t221, i64* %reg_88_ptr
  %t222 = load i64, i64* %reg_88_ptr
  %t223 = add i64 %t222, 16
  store i64 %t223, i64* %reg_89_ptr
  %t224 = load i64, i64* %reg_89_ptr
  %t225 = inttoptr i64 %t224 to i64*
  %t226 = load i64, i64* %t225
  store i64 %t226, i64* %reg_90_ptr
  %t227 = load i64, i64* %reg_90_ptr
  store i64 %t227, i64* %var_fields_ptr_ptr
  %t228 = load i64, i64* %var_fields_ptr_ptr
  store i64 %t228, i64* %reg_91_ptr
  %t229 = load i64, i64* %reg_91_ptr
  %t230 = icmp ne i64 %t229, 0
  %t231 = zext i1 %t230 to i64
  store i64 %t231, i64* %reg_92_ptr
  %t232 = load i64, i64* %reg_92_ptr
  %t234 = icmp ne i64 %t232, 0
  %t235 = zext i1 %t234 to i64
  %t233 = icmp ne i64 %t235, 0
  br i1 %t233, label %rt_gc_mark_phase_b35, label %rt_gc_mark_phase_b36
rt_gc_mark_phase_b33:
  br label %rt_gc_mark_phase_b34
rt_gc_mark_phase_b34:
  %t236 = load i64, i64* %var_kind_val_ptr
  store i64 %t236, i64* %reg_119_ptr
  %t237 = load i64, i64* %reg_119_ptr
  %t238 = icmp eq i64 %t237, 9
  %t239 = zext i1 %t238 to i64
  store i64 %t239, i64* %reg_120_ptr
  %t240 = load i64, i64* %reg_120_ptr
  %t242 = icmp ne i64 %t240, 0
  %t243 = zext i1 %t242 to i64
  %t241 = icmp ne i64 %t243, 0
  br i1 %t241, label %rt_gc_mark_phase_b44, label %rt_gc_mark_phase_b45
rt_gc_mark_phase_b35:
  %t244 = load i64, i64* %var_qlen_ptr
  store i64 %t244, i64* %reg_93_ptr
  %t245 = load i64, i64* %var_qcap_ptr
  store i64 %t245, i64* %reg_94_ptr
  %t246 = load i64, i64* %reg_93_ptr
  %t247 = load i64, i64* %reg_94_ptr
  %t248 = icmp sge i64 %t246, %t247
  %t249 = zext i1 %t248 to i64
  store i64 %t249, i64* %reg_95_ptr
  %t250 = load i64, i64* %reg_95_ptr
  %t252 = icmp ne i64 %t250, 0
  %t253 = zext i1 %t252 to i64
  %t251 = icmp ne i64 %t253, 0
  br i1 %t251, label %rt_gc_mark_phase_b38, label %rt_gc_mark_phase_b39
rt_gc_mark_phase_b36:
  br label %rt_gc_mark_phase_b37
rt_gc_mark_phase_b37:
  br label %rt_gc_mark_phase_b34
rt_gc_mark_phase_b38:
  %t254 = load i64, i64* %var_qcap_ptr
  store i64 %t254, i64* %reg_96_ptr
  %t255 = load i64, i64* %reg_96_ptr
  %t256 = mul i64 %t255, 2
  store i64 %t256, i64* %reg_97_ptr
  %t257 = load i64, i64* %reg_97_ptr
  store i64 %t257, i64* %var_qcap_ptr
  %t258 = load i64, i64* %var_qcap_ptr
  store i64 %t258, i64* %reg_98_ptr
  %t259 = load i64, i64* %reg_98_ptr
  %t260 = mul i64 %t259, 8
  store i64 %t260, i64* %reg_99_ptr
  %t261 = load i64, i64* %reg_99_ptr
  %t262 = call i64 @__sys_pointer_alloc(i64 %t261)
  store i64 %t262, i64* %reg_100_ptr
  %t263 = load i64, i64* %reg_100_ptr
  store i64 %t263, i64* %var_nq_ptr
  %t264 = load i64, i64* %var_nq_ptr
  store i64 %t264, i64* %reg_101_ptr
  %t265 = load i64, i64* %reg_101_ptr
  %t266 = icmp ne i64 %t265, 0
  %t267 = zext i1 %t266 to i64
  store i64 %t267, i64* %reg_102_ptr
  %t268 = load i64, i64* %reg_102_ptr
  %t270 = icmp ne i64 %t268, 0
  %t271 = zext i1 %t270 to i64
  %t269 = icmp ne i64 %t271, 0
  br i1 %t269, label %rt_gc_mark_phase_b41, label %rt_gc_mark_phase_b42
rt_gc_mark_phase_b39:
  br label %rt_gc_mark_phase_b40
rt_gc_mark_phase_b40:
  %t272 = load i64, i64* %var_queue_ptr
  store i64 %t272, i64* %reg_111_ptr
  %t273 = load i64, i64* %var_qlen_ptr
  store i64 %t273, i64* %reg_112_ptr
  %t274 = load i64, i64* %reg_112_ptr
  %t275 = mul i64 %t274, 8
  store i64 %t275, i64* %reg_113_ptr
  %t276 = load i64, i64* %reg_111_ptr
  %t277 = load i64, i64* %reg_113_ptr
  %t278 = add i64 %t276, %t277
  store i64 %t278, i64* %reg_114_ptr
  %t279 = load i64, i64* %var_fields_ptr_ptr
  store i64 %t279, i64* %reg_115_ptr
  %t280 = load i64, i64* %reg_114_ptr
  %t281 = load i64, i64* %reg_115_ptr
  %t282 = inttoptr i64 %t280 to i64*
  store i64 %t281, i64* %t282
  store i64 0, i64* %reg_116_ptr
  %t283 = load i64, i64* %var_qlen_ptr
  store i64 %t283, i64* %reg_117_ptr
  %t284 = load i64, i64* %reg_117_ptr
  %t285 = add i64 %t284, 1
  store i64 %t285, i64* %reg_118_ptr
  %t286 = load i64, i64* %reg_118_ptr
  store i64 %t286, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b37
rt_gc_mark_phase_b41:
  %t287 = load i64, i64* %var_nq_ptr
  store i64 %t287, i64* %reg_103_ptr
  %t288 = load i64, i64* %var_queue_ptr
  store i64 %t288, i64* %reg_104_ptr
  %t289 = load i64, i64* %var_qlen_ptr
  store i64 %t289, i64* %reg_105_ptr
  %t290 = load i64, i64* %reg_105_ptr
  %t291 = mul i64 %t290, 8
  store i64 %t291, i64* %reg_106_ptr
  %t292 = load i64, i64* %reg_103_ptr
  %t293 = load i64, i64* %reg_104_ptr
  %t294 = load i64, i64* %reg_106_ptr
  %t295 = inttoptr i64 %t292 to i8*
  %t296 = inttoptr i64 %t293 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t295, i8* %t296, i64 %t294, i1 false)
  store i64 0, i64* %reg_107_ptr
  %t297 = load i64, i64* %var_queue_ptr
  store i64 %t297, i64* %reg_108_ptr
  %t298 = load i64, i64* %reg_108_ptr
  %t299 = call i64 @__sys_pointer_free(i64 %t298)
  store i64 %t299, i64* %reg_109_ptr
  %t300 = load i64, i64* %var_nq_ptr
  store i64 %t300, i64* %reg_110_ptr
  %t301 = load i64, i64* %reg_110_ptr
  store i64 %t301, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b43
rt_gc_mark_phase_b42:
  br label %rt_gc_mark_phase_b43
rt_gc_mark_phase_b43:
  br label %rt_gc_mark_phase_b40
rt_gc_mark_phase_b44:
  %t302 = load i64, i64* %var_p_ptr
  store i64 %t302, i64* %reg_121_ptr
  %t303 = load i64, i64* %reg_121_ptr
  %t304 = add i64 %t303, 16
  store i64 %t304, i64* %reg_122_ptr
  %t305 = load i64, i64* %reg_122_ptr
  %t306 = inttoptr i64 %t305 to i32*
  %t307 = load i32, i32* %t306
  %t308 = zext i32 %t307 to i64
  store i64 %t308, i64* %reg_123_ptr
  %t309 = load i64, i64* %reg_123_ptr
  store i64 %t309, i64* %var_nslots_ptr
  store i64 0, i64* %var_j_ptr
  br label %rt_gc_mark_phase_b47
rt_gc_mark_phase_b45:
  br label %rt_gc_mark_phase_b46
rt_gc_mark_phase_b46:
  %t310 = load i64, i64* %var_kind_val_ptr
  store i64 %t310, i64* %reg_235_ptr
  %t311 = load i64, i64* %reg_235_ptr
  %t312 = icmp eq i64 %t311, 2
  %t313 = zext i1 %t312 to i64
  store i64 %t313, i64* %reg_236_ptr
  %t314 = load i64, i64* %reg_236_ptr
  %t316 = icmp ne i64 %t314, 0
  %t317 = zext i1 %t316 to i64
  %t315 = icmp ne i64 %t317, 0
  br i1 %t315, label %rt_gc_mark_phase_b88, label %rt_gc_mark_phase_b89
rt_gc_mark_phase_b47:
  %t318 = load i64, i64* %var_j_ptr
  store i64 %t318, i64* %reg_124_ptr
  %t319 = load i64, i64* %var_nslots_ptr
  store i64 %t319, i64* %reg_125_ptr
  %t320 = load i64, i64* %reg_124_ptr
  %t321 = load i64, i64* %reg_125_ptr
  %t322 = icmp sge i64 %t320, %t321
  %t323 = zext i1 %t322 to i64
  store i64 %t323, i64* %reg_126_ptr
  %t324 = load i64, i64* %reg_126_ptr
  %t326 = icmp ne i64 %t324, 0
  %t327 = zext i1 %t326 to i64
  %t325 = icmp ne i64 %t327, 0
  br i1 %t325, label %rt_gc_mark_phase_b49, label %rt_gc_mark_phase_b50
rt_gc_mark_phase_b48:
  br label %rt_gc_mark_phase_b46
rt_gc_mark_phase_b49:
  br label %rt_gc_mark_phase_b48
rt_gc_mark_phase_b50:
  br label %rt_gc_mark_phase_b51
rt_gc_mark_phase_b51:
  %t328 = load i64, i64* %var_p_ptr
  store i64 %t328, i64* %reg_127_ptr
  %t329 = load i64, i64* %reg_127_ptr
  %t330 = add i64 %t329, 32
  store i64 %t330, i64* %reg_128_ptr
  %t331 = load i64, i64* %var_j_ptr
  store i64 %t331, i64* %reg_129_ptr
  %t332 = load i64, i64* %reg_129_ptr
  %t333 = mul i64 %t332, 16
  store i64 %t333, i64* %reg_130_ptr
  %t334 = load i64, i64* %reg_128_ptr
  %t335 = load i64, i64* %reg_130_ptr
  %t336 = add i64 %t334, %t335
  store i64 %t336, i64* %reg_131_ptr
  %t337 = load i64, i64* %reg_131_ptr
  store i64 %t337, i64* %var_slot_base_ptr
  %t338 = load i64, i64* %var_slot_base_ptr
  store i64 %t338, i64* %reg_132_ptr
  %t339 = load i64, i64* %reg_132_ptr
  %t340 = inttoptr i64 %t339 to i64*
  %t341 = load i64, i64* %t340
  store i64 %t341, i64* %reg_133_ptr
  %t342 = load i64, i64* %reg_133_ptr
  store i64 %t342, i64* %var_stag_ptr
  %t343 = load i64, i64* %var_stag_ptr
  store i64 %t343, i64* %reg_134_ptr
  %t344 = load i64, i64* %reg_134_ptr
  %t345 = icmp eq i64 %t344, 2
  %t346 = zext i1 %t345 to i64
  store i64 %t346, i64* %reg_135_ptr
  %t347 = load i64, i64* %reg_135_ptr
  %t349 = icmp ne i64 %t347, 0
  %t350 = zext i1 %t349 to i64
  %t348 = icmp ne i64 %t350, 0
  br i1 %t348, label %rt_gc_mark_phase_b52, label %rt_gc_mark_phase_b53
rt_gc_mark_phase_b52:
  %t351 = load i64, i64* %var_slot_base_ptr
  store i64 %t351, i64* %reg_136_ptr
  %t352 = load i64, i64* %reg_136_ptr
  %t353 = add i64 %t352, 8
  store i64 %t353, i64* %reg_137_ptr
  %t354 = load i64, i64* %reg_137_ptr
  %t355 = inttoptr i64 %t354 to i64*
  %t356 = load i64, i64* %t355
  store i64 %t356, i64* %reg_138_ptr
  %t357 = load i64, i64* %reg_138_ptr
  store i64 %t357, i64* %var_payload_ptr
  %t358 = load i64, i64* %var_payload_ptr
  store i64 %t358, i64* %reg_139_ptr
  %t359 = load i64, i64* %reg_139_ptr
  %t360 = icmp ne i64 %t359, 0
  %t361 = zext i1 %t360 to i64
  store i64 %t361, i64* %reg_140_ptr
  %t362 = load i64, i64* %reg_140_ptr
  %t364 = icmp ne i64 %t362, 0
  %t365 = zext i1 %t364 to i64
  %t363 = icmp ne i64 %t365, 0
  br i1 %t363, label %rt_gc_mark_phase_b55, label %rt_gc_mark_phase_b56
rt_gc_mark_phase_b53:
  br label %rt_gc_mark_phase_b54
rt_gc_mark_phase_b54:
  %t366 = load i64, i64* %var_stag_ptr
  store i64 %t366, i64* %reg_167_ptr
  %t367 = load i64, i64* %reg_167_ptr
  %t368 = icmp eq i64 %t367, 3
  %t369 = zext i1 %t368 to i64
  store i64 %t369, i64* %reg_168_ptr
  %t370 = load i64, i64* %reg_168_ptr
  %t372 = icmp ne i64 %t370, 0
  %t373 = zext i1 %t372 to i64
  %t371 = icmp ne i64 %t373, 0
  br i1 %t371, label %rt_gc_mark_phase_b64, label %rt_gc_mark_phase_b65
rt_gc_mark_phase_b55:
  %t374 = load i64, i64* %var_qlen_ptr
  store i64 %t374, i64* %reg_141_ptr
  %t375 = load i64, i64* %var_qcap_ptr
  store i64 %t375, i64* %reg_142_ptr
  %t376 = load i64, i64* %reg_141_ptr
  %t377 = load i64, i64* %reg_142_ptr
  %t378 = icmp sge i64 %t376, %t377
  %t379 = zext i1 %t378 to i64
  store i64 %t379, i64* %reg_143_ptr
  %t380 = load i64, i64* %reg_143_ptr
  %t382 = icmp ne i64 %t380, 0
  %t383 = zext i1 %t382 to i64
  %t381 = icmp ne i64 %t383, 0
  br i1 %t381, label %rt_gc_mark_phase_b58, label %rt_gc_mark_phase_b59
rt_gc_mark_phase_b56:
  br label %rt_gc_mark_phase_b57
rt_gc_mark_phase_b57:
  br label %rt_gc_mark_phase_b54
rt_gc_mark_phase_b58:
  %t384 = load i64, i64* %var_qcap_ptr
  store i64 %t384, i64* %reg_144_ptr
  %t385 = load i64, i64* %reg_144_ptr
  %t386 = mul i64 %t385, 2
  store i64 %t386, i64* %reg_145_ptr
  %t387 = load i64, i64* %reg_145_ptr
  store i64 %t387, i64* %var_qcap_ptr
  %t388 = load i64, i64* %var_qcap_ptr
  store i64 %t388, i64* %reg_146_ptr
  %t389 = load i64, i64* %reg_146_ptr
  %t390 = mul i64 %t389, 8
  store i64 %t390, i64* %reg_147_ptr
  %t391 = load i64, i64* %reg_147_ptr
  %t392 = call i64 @__sys_pointer_alloc(i64 %t391)
  store i64 %t392, i64* %reg_148_ptr
  %t393 = load i64, i64* %reg_148_ptr
  store i64 %t393, i64* %var_nq_ptr
  %t394 = load i64, i64* %var_nq_ptr
  store i64 %t394, i64* %reg_149_ptr
  %t395 = load i64, i64* %reg_149_ptr
  %t396 = icmp ne i64 %t395, 0
  %t397 = zext i1 %t396 to i64
  store i64 %t397, i64* %reg_150_ptr
  %t398 = load i64, i64* %reg_150_ptr
  %t400 = icmp ne i64 %t398, 0
  %t401 = zext i1 %t400 to i64
  %t399 = icmp ne i64 %t401, 0
  br i1 %t399, label %rt_gc_mark_phase_b61, label %rt_gc_mark_phase_b62
rt_gc_mark_phase_b59:
  br label %rt_gc_mark_phase_b60
rt_gc_mark_phase_b60:
  %t402 = load i64, i64* %var_queue_ptr
  store i64 %t402, i64* %reg_159_ptr
  %t403 = load i64, i64* %var_qlen_ptr
  store i64 %t403, i64* %reg_160_ptr
  %t404 = load i64, i64* %reg_160_ptr
  %t405 = mul i64 %t404, 8
  store i64 %t405, i64* %reg_161_ptr
  %t406 = load i64, i64* %reg_159_ptr
  %t407 = load i64, i64* %reg_161_ptr
  %t408 = add i64 %t406, %t407
  store i64 %t408, i64* %reg_162_ptr
  %t409 = load i64, i64* %var_payload_ptr
  store i64 %t409, i64* %reg_163_ptr
  %t410 = load i64, i64* %reg_162_ptr
  %t411 = load i64, i64* %reg_163_ptr
  %t412 = inttoptr i64 %t410 to i64*
  store i64 %t411, i64* %t412
  store i64 0, i64* %reg_164_ptr
  %t413 = load i64, i64* %var_qlen_ptr
  store i64 %t413, i64* %reg_165_ptr
  %t414 = load i64, i64* %reg_165_ptr
  %t415 = add i64 %t414, 1
  store i64 %t415, i64* %reg_166_ptr
  %t416 = load i64, i64* %reg_166_ptr
  store i64 %t416, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b57
rt_gc_mark_phase_b61:
  %t417 = load i64, i64* %var_nq_ptr
  store i64 %t417, i64* %reg_151_ptr
  %t418 = load i64, i64* %var_queue_ptr
  store i64 %t418, i64* %reg_152_ptr
  %t419 = load i64, i64* %var_qlen_ptr
  store i64 %t419, i64* %reg_153_ptr
  %t420 = load i64, i64* %reg_153_ptr
  %t421 = mul i64 %t420, 8
  store i64 %t421, i64* %reg_154_ptr
  %t422 = load i64, i64* %reg_151_ptr
  %t423 = load i64, i64* %reg_152_ptr
  %t424 = load i64, i64* %reg_154_ptr
  %t425 = inttoptr i64 %t422 to i8*
  %t426 = inttoptr i64 %t423 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t425, i8* %t426, i64 %t424, i1 false)
  store i64 0, i64* %reg_155_ptr
  %t427 = load i64, i64* %var_queue_ptr
  store i64 %t427, i64* %reg_156_ptr
  %t428 = load i64, i64* %reg_156_ptr
  %t429 = call i64 @__sys_pointer_free(i64 %t428)
  store i64 %t429, i64* %reg_157_ptr
  %t430 = load i64, i64* %var_nq_ptr
  store i64 %t430, i64* %reg_158_ptr
  %t431 = load i64, i64* %reg_158_ptr
  store i64 %t431, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b63
rt_gc_mark_phase_b62:
  br label %rt_gc_mark_phase_b63
rt_gc_mark_phase_b63:
  br label %rt_gc_mark_phase_b60
rt_gc_mark_phase_b64:
  %t432 = load i64, i64* %var_slot_base_ptr
  store i64 %t432, i64* %reg_169_ptr
  %t433 = load i64, i64* %reg_169_ptr
  %t434 = add i64 %t433, 8
  store i64 %t434, i64* %reg_170_ptr
  %t435 = load i64, i64* %reg_170_ptr
  %t436 = inttoptr i64 %t435 to i64*
  %t437 = load i64, i64* %t436
  store i64 %t437, i64* %reg_171_ptr
  %t438 = load i64, i64* %reg_171_ptr
  store i64 %t438, i64* %var_payload_ptr
  %t439 = load i64, i64* %var_payload_ptr
  store i64 %t439, i64* %reg_172_ptr
  %t440 = load i64, i64* %reg_172_ptr
  %t441 = icmp ne i64 %t440, 0
  %t442 = zext i1 %t441 to i64
  store i64 %t442, i64* %reg_173_ptr
  %t443 = load i64, i64* %reg_173_ptr
  %t445 = icmp ne i64 %t443, 0
  %t446 = zext i1 %t445 to i64
  %t444 = icmp ne i64 %t446, 0
  br i1 %t444, label %rt_gc_mark_phase_b67, label %rt_gc_mark_phase_b68
rt_gc_mark_phase_b65:
  br label %rt_gc_mark_phase_b66
rt_gc_mark_phase_b66:
  %t447 = load i64, i64* %var_stag_ptr
  store i64 %t447, i64* %reg_200_ptr
  %t448 = load i64, i64* %reg_200_ptr
  %t449 = icmp eq i64 %t448, 4
  %t450 = zext i1 %t449 to i64
  store i64 %t450, i64* %reg_201_ptr
  %t451 = load i64, i64* %reg_201_ptr
  %t453 = icmp ne i64 %t451, 0
  %t454 = zext i1 %t453 to i64
  %t452 = icmp ne i64 %t454, 0
  br i1 %t452, label %rt_gc_mark_phase_b76, label %rt_gc_mark_phase_b77
rt_gc_mark_phase_b67:
  %t455 = load i64, i64* %var_qlen_ptr
  store i64 %t455, i64* %reg_174_ptr
  %t456 = load i64, i64* %var_qcap_ptr
  store i64 %t456, i64* %reg_175_ptr
  %t457 = load i64, i64* %reg_174_ptr
  %t458 = load i64, i64* %reg_175_ptr
  %t459 = icmp sge i64 %t457, %t458
  %t460 = zext i1 %t459 to i64
  store i64 %t460, i64* %reg_176_ptr
  %t461 = load i64, i64* %reg_176_ptr
  %t463 = icmp ne i64 %t461, 0
  %t464 = zext i1 %t463 to i64
  %t462 = icmp ne i64 %t464, 0
  br i1 %t462, label %rt_gc_mark_phase_b70, label %rt_gc_mark_phase_b71
rt_gc_mark_phase_b68:
  br label %rt_gc_mark_phase_b69
rt_gc_mark_phase_b69:
  br label %rt_gc_mark_phase_b66
rt_gc_mark_phase_b70:
  %t465 = load i64, i64* %var_qcap_ptr
  store i64 %t465, i64* %reg_177_ptr
  %t466 = load i64, i64* %reg_177_ptr
  %t467 = mul i64 %t466, 2
  store i64 %t467, i64* %reg_178_ptr
  %t468 = load i64, i64* %reg_178_ptr
  store i64 %t468, i64* %var_qcap_ptr
  %t469 = load i64, i64* %var_qcap_ptr
  store i64 %t469, i64* %reg_179_ptr
  %t470 = load i64, i64* %reg_179_ptr
  %t471 = mul i64 %t470, 8
  store i64 %t471, i64* %reg_180_ptr
  %t472 = load i64, i64* %reg_180_ptr
  %t473 = call i64 @__sys_pointer_alloc(i64 %t472)
  store i64 %t473, i64* %reg_181_ptr
  %t474 = load i64, i64* %reg_181_ptr
  store i64 %t474, i64* %var_nq_ptr
  %t475 = load i64, i64* %var_nq_ptr
  store i64 %t475, i64* %reg_182_ptr
  %t476 = load i64, i64* %reg_182_ptr
  %t477 = icmp ne i64 %t476, 0
  %t478 = zext i1 %t477 to i64
  store i64 %t478, i64* %reg_183_ptr
  %t479 = load i64, i64* %reg_183_ptr
  %t481 = icmp ne i64 %t479, 0
  %t482 = zext i1 %t481 to i64
  %t480 = icmp ne i64 %t482, 0
  br i1 %t480, label %rt_gc_mark_phase_b73, label %rt_gc_mark_phase_b74
rt_gc_mark_phase_b71:
  br label %rt_gc_mark_phase_b72
rt_gc_mark_phase_b72:
  %t483 = load i64, i64* %var_queue_ptr
  store i64 %t483, i64* %reg_192_ptr
  %t484 = load i64, i64* %var_qlen_ptr
  store i64 %t484, i64* %reg_193_ptr
  %t485 = load i64, i64* %reg_193_ptr
  %t486 = mul i64 %t485, 8
  store i64 %t486, i64* %reg_194_ptr
  %t487 = load i64, i64* %reg_192_ptr
  %t488 = load i64, i64* %reg_194_ptr
  %t489 = add i64 %t487, %t488
  store i64 %t489, i64* %reg_195_ptr
  %t490 = load i64, i64* %var_payload_ptr
  store i64 %t490, i64* %reg_196_ptr
  %t491 = load i64, i64* %reg_195_ptr
  %t492 = load i64, i64* %reg_196_ptr
  %t493 = inttoptr i64 %t491 to i64*
  store i64 %t492, i64* %t493
  store i64 0, i64* %reg_197_ptr
  %t494 = load i64, i64* %var_qlen_ptr
  store i64 %t494, i64* %reg_198_ptr
  %t495 = load i64, i64* %reg_198_ptr
  %t496 = add i64 %t495, 1
  store i64 %t496, i64* %reg_199_ptr
  %t497 = load i64, i64* %reg_199_ptr
  store i64 %t497, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b69
rt_gc_mark_phase_b73:
  %t498 = load i64, i64* %var_nq_ptr
  store i64 %t498, i64* %reg_184_ptr
  %t499 = load i64, i64* %var_queue_ptr
  store i64 %t499, i64* %reg_185_ptr
  %t500 = load i64, i64* %var_qlen_ptr
  store i64 %t500, i64* %reg_186_ptr
  %t501 = load i64, i64* %reg_186_ptr
  %t502 = mul i64 %t501, 8
  store i64 %t502, i64* %reg_187_ptr
  %t503 = load i64, i64* %reg_184_ptr
  %t504 = load i64, i64* %reg_185_ptr
  %t505 = load i64, i64* %reg_187_ptr
  %t506 = inttoptr i64 %t503 to i8*
  %t507 = inttoptr i64 %t504 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t506, i8* %t507, i64 %t505, i1 false)
  store i64 0, i64* %reg_188_ptr
  %t508 = load i64, i64* %var_queue_ptr
  store i64 %t508, i64* %reg_189_ptr
  %t509 = load i64, i64* %reg_189_ptr
  %t510 = call i64 @__sys_pointer_free(i64 %t509)
  store i64 %t510, i64* %reg_190_ptr
  %t511 = load i64, i64* %var_nq_ptr
  store i64 %t511, i64* %reg_191_ptr
  %t512 = load i64, i64* %reg_191_ptr
  store i64 %t512, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b75
rt_gc_mark_phase_b74:
  br label %rt_gc_mark_phase_b75
rt_gc_mark_phase_b75:
  br label %rt_gc_mark_phase_b72
rt_gc_mark_phase_b76:
  %t513 = load i64, i64* %var_slot_base_ptr
  store i64 %t513, i64* %reg_202_ptr
  %t514 = load i64, i64* %reg_202_ptr
  %t515 = add i64 %t514, 8
  store i64 %t515, i64* %reg_203_ptr
  %t516 = load i64, i64* %reg_203_ptr
  %t517 = inttoptr i64 %t516 to i64*
  %t518 = load i64, i64* %t517
  store i64 %t518, i64* %reg_204_ptr
  %t519 = load i64, i64* %reg_204_ptr
  store i64 %t519, i64* %var_payload_ptr
  %t520 = load i64, i64* %var_payload_ptr
  store i64 %t520, i64* %reg_205_ptr
  %t521 = load i64, i64* %reg_205_ptr
  %t522 = icmp ne i64 %t521, 0
  %t523 = zext i1 %t522 to i64
  store i64 %t523, i64* %reg_206_ptr
  %t524 = load i64, i64* %reg_206_ptr
  %t526 = icmp ne i64 %t524, 0
  %t527 = zext i1 %t526 to i64
  %t525 = icmp ne i64 %t527, 0
  br i1 %t525, label %rt_gc_mark_phase_b79, label %rt_gc_mark_phase_b80
rt_gc_mark_phase_b77:
  br label %rt_gc_mark_phase_b78
rt_gc_mark_phase_b78:
  %t528 = load i64, i64* %var_j_ptr
  store i64 %t528, i64* %reg_233_ptr
  %t529 = load i64, i64* %reg_233_ptr
  %t530 = add i64 %t529, 1
  store i64 %t530, i64* %reg_234_ptr
  %t531 = load i64, i64* %reg_234_ptr
  store i64 %t531, i64* %var_j_ptr
  br label %rt_gc_mark_phase_b47
rt_gc_mark_phase_b79:
  %t532 = load i64, i64* %var_qlen_ptr
  store i64 %t532, i64* %reg_207_ptr
  %t533 = load i64, i64* %var_qcap_ptr
  store i64 %t533, i64* %reg_208_ptr
  %t534 = load i64, i64* %reg_207_ptr
  %t535 = load i64, i64* %reg_208_ptr
  %t536 = icmp sge i64 %t534, %t535
  %t537 = zext i1 %t536 to i64
  store i64 %t537, i64* %reg_209_ptr
  %t538 = load i64, i64* %reg_209_ptr
  %t540 = icmp ne i64 %t538, 0
  %t541 = zext i1 %t540 to i64
  %t539 = icmp ne i64 %t541, 0
  br i1 %t539, label %rt_gc_mark_phase_b82, label %rt_gc_mark_phase_b83
rt_gc_mark_phase_b80:
  br label %rt_gc_mark_phase_b81
rt_gc_mark_phase_b81:
  br label %rt_gc_mark_phase_b78
rt_gc_mark_phase_b82:
  %t542 = load i64, i64* %var_qcap_ptr
  store i64 %t542, i64* %reg_210_ptr
  %t543 = load i64, i64* %reg_210_ptr
  %t544 = mul i64 %t543, 2
  store i64 %t544, i64* %reg_211_ptr
  %t545 = load i64, i64* %reg_211_ptr
  store i64 %t545, i64* %var_qcap_ptr
  %t546 = load i64, i64* %var_qcap_ptr
  store i64 %t546, i64* %reg_212_ptr
  %t547 = load i64, i64* %reg_212_ptr
  %t548 = mul i64 %t547, 8
  store i64 %t548, i64* %reg_213_ptr
  %t549 = load i64, i64* %reg_213_ptr
  %t550 = call i64 @__sys_pointer_alloc(i64 %t549)
  store i64 %t550, i64* %reg_214_ptr
  %t551 = load i64, i64* %reg_214_ptr
  store i64 %t551, i64* %var_nq_ptr
  %t552 = load i64, i64* %var_nq_ptr
  store i64 %t552, i64* %reg_215_ptr
  %t553 = load i64, i64* %reg_215_ptr
  %t554 = icmp ne i64 %t553, 0
  %t555 = zext i1 %t554 to i64
  store i64 %t555, i64* %reg_216_ptr
  %t556 = load i64, i64* %reg_216_ptr
  %t558 = icmp ne i64 %t556, 0
  %t559 = zext i1 %t558 to i64
  %t557 = icmp ne i64 %t559, 0
  br i1 %t557, label %rt_gc_mark_phase_b85, label %rt_gc_mark_phase_b86
rt_gc_mark_phase_b83:
  br label %rt_gc_mark_phase_b84
rt_gc_mark_phase_b84:
  %t560 = load i64, i64* %var_queue_ptr
  store i64 %t560, i64* %reg_225_ptr
  %t561 = load i64, i64* %var_qlen_ptr
  store i64 %t561, i64* %reg_226_ptr
  %t562 = load i64, i64* %reg_226_ptr
  %t563 = mul i64 %t562, 8
  store i64 %t563, i64* %reg_227_ptr
  %t564 = load i64, i64* %reg_225_ptr
  %t565 = load i64, i64* %reg_227_ptr
  %t566 = add i64 %t564, %t565
  store i64 %t566, i64* %reg_228_ptr
  %t567 = load i64, i64* %var_payload_ptr
  store i64 %t567, i64* %reg_229_ptr
  %t568 = load i64, i64* %reg_228_ptr
  %t569 = load i64, i64* %reg_229_ptr
  %t570 = inttoptr i64 %t568 to i64*
  store i64 %t569, i64* %t570
  store i64 0, i64* %reg_230_ptr
  %t571 = load i64, i64* %var_qlen_ptr
  store i64 %t571, i64* %reg_231_ptr
  %t572 = load i64, i64* %reg_231_ptr
  %t573 = add i64 %t572, 1
  store i64 %t573, i64* %reg_232_ptr
  %t574 = load i64, i64* %reg_232_ptr
  store i64 %t574, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b81
rt_gc_mark_phase_b85:
  %t575 = load i64, i64* %var_nq_ptr
  store i64 %t575, i64* %reg_217_ptr
  %t576 = load i64, i64* %var_queue_ptr
  store i64 %t576, i64* %reg_218_ptr
  %t577 = load i64, i64* %var_qlen_ptr
  store i64 %t577, i64* %reg_219_ptr
  %t578 = load i64, i64* %reg_219_ptr
  %t579 = mul i64 %t578, 8
  store i64 %t579, i64* %reg_220_ptr
  %t580 = load i64, i64* %reg_217_ptr
  %t581 = load i64, i64* %reg_218_ptr
  %t582 = load i64, i64* %reg_220_ptr
  %t583 = inttoptr i64 %t580 to i8*
  %t584 = inttoptr i64 %t581 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t583, i8* %t584, i64 %t582, i1 false)
  store i64 0, i64* %reg_221_ptr
  %t585 = load i64, i64* %var_queue_ptr
  store i64 %t585, i64* %reg_222_ptr
  %t586 = load i64, i64* %reg_222_ptr
  %t587 = call i64 @__sys_pointer_free(i64 %t586)
  store i64 %t587, i64* %reg_223_ptr
  %t588 = load i64, i64* %var_nq_ptr
  store i64 %t588, i64* %reg_224_ptr
  %t589 = load i64, i64* %reg_224_ptr
  store i64 %t589, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b87
rt_gc_mark_phase_b86:
  br label %rt_gc_mark_phase_b87
rt_gc_mark_phase_b87:
  br label %rt_gc_mark_phase_b84
rt_gc_mark_phase_b88:
  %t590 = load i64, i64* %var_p_ptr
  store i64 %t590, i64* %reg_237_ptr
  %t591 = load i64, i64* %reg_237_ptr
  %t592 = add i64 %t591, 24
  store i64 %t592, i64* %reg_238_ptr
  %t593 = load i64, i64* %reg_238_ptr
  %t594 = inttoptr i64 %t593 to i64*
  %t595 = load i64, i64* %t594
  store i64 %t595, i64* %reg_239_ptr
  %t596 = load i64, i64* %reg_239_ptr
  store i64 %t596, i64* %var_entry_ptr
  br label %rt_gc_mark_phase_b91
rt_gc_mark_phase_b89:
  br label %rt_gc_mark_phase_b90
rt_gc_mark_phase_b90:
  %t597 = load i64, i64* %var_kind_val_ptr
  store i64 %t597, i64* %reg_347_ptr
  %t598 = load i64, i64* %reg_347_ptr
  %t599 = icmp eq i64 %t598, 4
  %t600 = zext i1 %t599 to i64
  store i64 %t600, i64* %reg_348_ptr
  %t601 = load i64, i64* %reg_348_ptr
  %t603 = icmp ne i64 %t601, 0
  %t604 = zext i1 %t603 to i64
  %t602 = icmp ne i64 %t604, 0
  br i1 %t602, label %rt_gc_mark_phase_b132, label %rt_gc_mark_phase_b133
rt_gc_mark_phase_b91:
  %t605 = load i64, i64* %var_entry_ptr
  store i64 %t605, i64* %reg_240_ptr
  %t606 = load i64, i64* %reg_240_ptr
  %t607 = icmp eq i64 %t606, 0
  %t608 = zext i1 %t607 to i64
  store i64 %t608, i64* %reg_241_ptr
  %t609 = load i64, i64* %reg_241_ptr
  %t611 = icmp ne i64 %t609, 0
  %t612 = zext i1 %t611 to i64
  %t610 = icmp ne i64 %t612, 0
  br i1 %t610, label %rt_gc_mark_phase_b93, label %rt_gc_mark_phase_b94
rt_gc_mark_phase_b92:
  br label %rt_gc_mark_phase_b90
rt_gc_mark_phase_b93:
  br label %rt_gc_mark_phase_b92
rt_gc_mark_phase_b94:
  br label %rt_gc_mark_phase_b95
rt_gc_mark_phase_b95:
  %t613 = load i64, i64* %var_entry_ptr
  store i64 %t613, i64* %reg_242_ptr
  %t614 = load i64, i64* %reg_242_ptr
  %t615 = add i64 %t614, 8
  store i64 %t615, i64* %reg_243_ptr
  %t616 = load i64, i64* %reg_243_ptr
  %t617 = inttoptr i64 %t616 to i64*
  %t618 = load i64, i64* %t617
  store i64 %t618, i64* %reg_244_ptr
  %t619 = load i64, i64* %reg_244_ptr
  store i64 %t619, i64* %var_etag_ptr
  %t620 = load i64, i64* %var_etag_ptr
  store i64 %t620, i64* %reg_245_ptr
  %t621 = load i64, i64* %reg_245_ptr
  %t622 = icmp eq i64 %t621, 2
  %t623 = zext i1 %t622 to i64
  store i64 %t623, i64* %reg_246_ptr
  %t624 = load i64, i64* %reg_246_ptr
  %t626 = icmp ne i64 %t624, 0
  %t627 = zext i1 %t626 to i64
  %t625 = icmp ne i64 %t627, 0
  br i1 %t625, label %rt_gc_mark_phase_b96, label %rt_gc_mark_phase_b97
rt_gc_mark_phase_b96:
  %t628 = load i64, i64* %var_entry_ptr
  store i64 %t628, i64* %reg_247_ptr
  %t629 = load i64, i64* %reg_247_ptr
  %t630 = add i64 %t629, 16
  store i64 %t630, i64* %reg_248_ptr
  %t631 = load i64, i64* %reg_248_ptr
  %t632 = inttoptr i64 %t631 to i64*
  %t633 = load i64, i64* %t632
  store i64 %t633, i64* %reg_249_ptr
  %t634 = load i64, i64* %reg_249_ptr
  store i64 %t634, i64* %var_epay_ptr
  %t635 = load i64, i64* %var_epay_ptr
  store i64 %t635, i64* %reg_250_ptr
  %t636 = load i64, i64* %reg_250_ptr
  %t637 = icmp ne i64 %t636, 0
  %t638 = zext i1 %t637 to i64
  store i64 %t638, i64* %reg_251_ptr
  %t639 = load i64, i64* %reg_251_ptr
  %t641 = icmp ne i64 %t639, 0
  %t642 = zext i1 %t641 to i64
  %t640 = icmp ne i64 %t642, 0
  br i1 %t640, label %rt_gc_mark_phase_b99, label %rt_gc_mark_phase_b100
rt_gc_mark_phase_b97:
  br label %rt_gc_mark_phase_b98
rt_gc_mark_phase_b98:
  %t643 = load i64, i64* %var_etag_ptr
  store i64 %t643, i64* %reg_278_ptr
  %t644 = load i64, i64* %reg_278_ptr
  %t645 = icmp eq i64 %t644, 3
  %t646 = zext i1 %t645 to i64
  store i64 %t646, i64* %reg_279_ptr
  %t647 = load i64, i64* %reg_279_ptr
  %t649 = icmp ne i64 %t647, 0
  %t650 = zext i1 %t649 to i64
  %t648 = icmp ne i64 %t650, 0
  br i1 %t648, label %rt_gc_mark_phase_b108, label %rt_gc_mark_phase_b109
rt_gc_mark_phase_b99:
  %t651 = load i64, i64* %var_qlen_ptr
  store i64 %t651, i64* %reg_252_ptr
  %t652 = load i64, i64* %var_qcap_ptr
  store i64 %t652, i64* %reg_253_ptr
  %t653 = load i64, i64* %reg_252_ptr
  %t654 = load i64, i64* %reg_253_ptr
  %t655 = icmp sge i64 %t653, %t654
  %t656 = zext i1 %t655 to i64
  store i64 %t656, i64* %reg_254_ptr
  %t657 = load i64, i64* %reg_254_ptr
  %t659 = icmp ne i64 %t657, 0
  %t660 = zext i1 %t659 to i64
  %t658 = icmp ne i64 %t660, 0
  br i1 %t658, label %rt_gc_mark_phase_b102, label %rt_gc_mark_phase_b103
rt_gc_mark_phase_b100:
  br label %rt_gc_mark_phase_b101
rt_gc_mark_phase_b101:
  br label %rt_gc_mark_phase_b98
rt_gc_mark_phase_b102:
  %t661 = load i64, i64* %var_qcap_ptr
  store i64 %t661, i64* %reg_255_ptr
  %t662 = load i64, i64* %reg_255_ptr
  %t663 = mul i64 %t662, 2
  store i64 %t663, i64* %reg_256_ptr
  %t664 = load i64, i64* %reg_256_ptr
  store i64 %t664, i64* %var_qcap_ptr
  %t665 = load i64, i64* %var_qcap_ptr
  store i64 %t665, i64* %reg_257_ptr
  %t666 = load i64, i64* %reg_257_ptr
  %t667 = mul i64 %t666, 8
  store i64 %t667, i64* %reg_258_ptr
  %t668 = load i64, i64* %reg_258_ptr
  %t669 = call i64 @__sys_pointer_alloc(i64 %t668)
  store i64 %t669, i64* %reg_259_ptr
  %t670 = load i64, i64* %reg_259_ptr
  store i64 %t670, i64* %var_nq_ptr
  %t671 = load i64, i64* %var_nq_ptr
  store i64 %t671, i64* %reg_260_ptr
  %t672 = load i64, i64* %reg_260_ptr
  %t673 = icmp ne i64 %t672, 0
  %t674 = zext i1 %t673 to i64
  store i64 %t674, i64* %reg_261_ptr
  %t675 = load i64, i64* %reg_261_ptr
  %t677 = icmp ne i64 %t675, 0
  %t678 = zext i1 %t677 to i64
  %t676 = icmp ne i64 %t678, 0
  br i1 %t676, label %rt_gc_mark_phase_b105, label %rt_gc_mark_phase_b106
rt_gc_mark_phase_b103:
  br label %rt_gc_mark_phase_b104
rt_gc_mark_phase_b104:
  %t679 = load i64, i64* %var_queue_ptr
  store i64 %t679, i64* %reg_270_ptr
  %t680 = load i64, i64* %var_qlen_ptr
  store i64 %t680, i64* %reg_271_ptr
  %t681 = load i64, i64* %reg_271_ptr
  %t682 = mul i64 %t681, 8
  store i64 %t682, i64* %reg_272_ptr
  %t683 = load i64, i64* %reg_270_ptr
  %t684 = load i64, i64* %reg_272_ptr
  %t685 = add i64 %t683, %t684
  store i64 %t685, i64* %reg_273_ptr
  %t686 = load i64, i64* %var_epay_ptr
  store i64 %t686, i64* %reg_274_ptr
  %t687 = load i64, i64* %reg_273_ptr
  %t688 = load i64, i64* %reg_274_ptr
  %t689 = inttoptr i64 %t687 to i64*
  store i64 %t688, i64* %t689
  store i64 0, i64* %reg_275_ptr
  %t690 = load i64, i64* %var_qlen_ptr
  store i64 %t690, i64* %reg_276_ptr
  %t691 = load i64, i64* %reg_276_ptr
  %t692 = add i64 %t691, 1
  store i64 %t692, i64* %reg_277_ptr
  %t693 = load i64, i64* %reg_277_ptr
  store i64 %t693, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b101
rt_gc_mark_phase_b105:
  %t694 = load i64, i64* %var_nq_ptr
  store i64 %t694, i64* %reg_262_ptr
  %t695 = load i64, i64* %var_queue_ptr
  store i64 %t695, i64* %reg_263_ptr
  %t696 = load i64, i64* %var_qlen_ptr
  store i64 %t696, i64* %reg_264_ptr
  %t697 = load i64, i64* %reg_264_ptr
  %t698 = mul i64 %t697, 8
  store i64 %t698, i64* %reg_265_ptr
  %t699 = load i64, i64* %reg_262_ptr
  %t700 = load i64, i64* %reg_263_ptr
  %t701 = load i64, i64* %reg_265_ptr
  %t702 = inttoptr i64 %t699 to i8*
  %t703 = inttoptr i64 %t700 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t702, i8* %t703, i64 %t701, i1 false)
  store i64 0, i64* %reg_266_ptr
  %t704 = load i64, i64* %var_queue_ptr
  store i64 %t704, i64* %reg_267_ptr
  %t705 = load i64, i64* %reg_267_ptr
  %t706 = call i64 @__sys_pointer_free(i64 %t705)
  store i64 %t706, i64* %reg_268_ptr
  %t707 = load i64, i64* %var_nq_ptr
  store i64 %t707, i64* %reg_269_ptr
  %t708 = load i64, i64* %reg_269_ptr
  store i64 %t708, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b107
rt_gc_mark_phase_b106:
  br label %rt_gc_mark_phase_b107
rt_gc_mark_phase_b107:
  br label %rt_gc_mark_phase_b104
rt_gc_mark_phase_b108:
  %t709 = load i64, i64* %var_entry_ptr
  store i64 %t709, i64* %reg_280_ptr
  %t710 = load i64, i64* %reg_280_ptr
  %t711 = add i64 %t710, 16
  store i64 %t711, i64* %reg_281_ptr
  %t712 = load i64, i64* %reg_281_ptr
  %t713 = inttoptr i64 %t712 to i64*
  %t714 = load i64, i64* %t713
  store i64 %t714, i64* %reg_282_ptr
  %t715 = load i64, i64* %reg_282_ptr
  store i64 %t715, i64* %var_epay_ptr
  %t716 = load i64, i64* %var_epay_ptr
  store i64 %t716, i64* %reg_283_ptr
  %t717 = load i64, i64* %reg_283_ptr
  %t718 = icmp ne i64 %t717, 0
  %t719 = zext i1 %t718 to i64
  store i64 %t719, i64* %reg_284_ptr
  %t720 = load i64, i64* %reg_284_ptr
  %t722 = icmp ne i64 %t720, 0
  %t723 = zext i1 %t722 to i64
  %t721 = icmp ne i64 %t723, 0
  br i1 %t721, label %rt_gc_mark_phase_b111, label %rt_gc_mark_phase_b112
rt_gc_mark_phase_b109:
  br label %rt_gc_mark_phase_b110
rt_gc_mark_phase_b110:
  %t724 = load i64, i64* %var_etag_ptr
  store i64 %t724, i64* %reg_311_ptr
  %t725 = load i64, i64* %reg_311_ptr
  %t726 = icmp eq i64 %t725, 4
  %t727 = zext i1 %t726 to i64
  store i64 %t727, i64* %reg_312_ptr
  %t728 = load i64, i64* %reg_312_ptr
  %t730 = icmp ne i64 %t728, 0
  %t731 = zext i1 %t730 to i64
  %t729 = icmp ne i64 %t731, 0
  br i1 %t729, label %rt_gc_mark_phase_b120, label %rt_gc_mark_phase_b121
rt_gc_mark_phase_b111:
  %t732 = load i64, i64* %var_qlen_ptr
  store i64 %t732, i64* %reg_285_ptr
  %t733 = load i64, i64* %var_qcap_ptr
  store i64 %t733, i64* %reg_286_ptr
  %t734 = load i64, i64* %reg_285_ptr
  %t735 = load i64, i64* %reg_286_ptr
  %t736 = icmp sge i64 %t734, %t735
  %t737 = zext i1 %t736 to i64
  store i64 %t737, i64* %reg_287_ptr
  %t738 = load i64, i64* %reg_287_ptr
  %t740 = icmp ne i64 %t738, 0
  %t741 = zext i1 %t740 to i64
  %t739 = icmp ne i64 %t741, 0
  br i1 %t739, label %rt_gc_mark_phase_b114, label %rt_gc_mark_phase_b115
rt_gc_mark_phase_b112:
  br label %rt_gc_mark_phase_b113
rt_gc_mark_phase_b113:
  br label %rt_gc_mark_phase_b110
rt_gc_mark_phase_b114:
  %t742 = load i64, i64* %var_qcap_ptr
  store i64 %t742, i64* %reg_288_ptr
  %t743 = load i64, i64* %reg_288_ptr
  %t744 = mul i64 %t743, 2
  store i64 %t744, i64* %reg_289_ptr
  %t745 = load i64, i64* %reg_289_ptr
  store i64 %t745, i64* %var_qcap_ptr
  %t746 = load i64, i64* %var_qcap_ptr
  store i64 %t746, i64* %reg_290_ptr
  %t747 = load i64, i64* %reg_290_ptr
  %t748 = mul i64 %t747, 8
  store i64 %t748, i64* %reg_291_ptr
  %t749 = load i64, i64* %reg_291_ptr
  %t750 = call i64 @__sys_pointer_alloc(i64 %t749)
  store i64 %t750, i64* %reg_292_ptr
  %t751 = load i64, i64* %reg_292_ptr
  store i64 %t751, i64* %var_nq_ptr
  %t752 = load i64, i64* %var_nq_ptr
  store i64 %t752, i64* %reg_293_ptr
  %t753 = load i64, i64* %reg_293_ptr
  %t754 = icmp ne i64 %t753, 0
  %t755 = zext i1 %t754 to i64
  store i64 %t755, i64* %reg_294_ptr
  %t756 = load i64, i64* %reg_294_ptr
  %t758 = icmp ne i64 %t756, 0
  %t759 = zext i1 %t758 to i64
  %t757 = icmp ne i64 %t759, 0
  br i1 %t757, label %rt_gc_mark_phase_b117, label %rt_gc_mark_phase_b118
rt_gc_mark_phase_b115:
  br label %rt_gc_mark_phase_b116
rt_gc_mark_phase_b116:
  %t760 = load i64, i64* %var_queue_ptr
  store i64 %t760, i64* %reg_303_ptr
  %t761 = load i64, i64* %var_qlen_ptr
  store i64 %t761, i64* %reg_304_ptr
  %t762 = load i64, i64* %reg_304_ptr
  %t763 = mul i64 %t762, 8
  store i64 %t763, i64* %reg_305_ptr
  %t764 = load i64, i64* %reg_303_ptr
  %t765 = load i64, i64* %reg_305_ptr
  %t766 = add i64 %t764, %t765
  store i64 %t766, i64* %reg_306_ptr
  %t767 = load i64, i64* %var_epay_ptr
  store i64 %t767, i64* %reg_307_ptr
  %t768 = load i64, i64* %reg_306_ptr
  %t769 = load i64, i64* %reg_307_ptr
  %t770 = inttoptr i64 %t768 to i64*
  store i64 %t769, i64* %t770
  store i64 0, i64* %reg_308_ptr
  %t771 = load i64, i64* %var_qlen_ptr
  store i64 %t771, i64* %reg_309_ptr
  %t772 = load i64, i64* %reg_309_ptr
  %t773 = add i64 %t772, 1
  store i64 %t773, i64* %reg_310_ptr
  %t774 = load i64, i64* %reg_310_ptr
  store i64 %t774, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b113
rt_gc_mark_phase_b117:
  %t775 = load i64, i64* %var_nq_ptr
  store i64 %t775, i64* %reg_295_ptr
  %t776 = load i64, i64* %var_queue_ptr
  store i64 %t776, i64* %reg_296_ptr
  %t777 = load i64, i64* %var_qlen_ptr
  store i64 %t777, i64* %reg_297_ptr
  %t778 = load i64, i64* %reg_297_ptr
  %t779 = mul i64 %t778, 8
  store i64 %t779, i64* %reg_298_ptr
  %t780 = load i64, i64* %reg_295_ptr
  %t781 = load i64, i64* %reg_296_ptr
  %t782 = load i64, i64* %reg_298_ptr
  %t783 = inttoptr i64 %t780 to i8*
  %t784 = inttoptr i64 %t781 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t783, i8* %t784, i64 %t782, i1 false)
  store i64 0, i64* %reg_299_ptr
  %t785 = load i64, i64* %var_queue_ptr
  store i64 %t785, i64* %reg_300_ptr
  %t786 = load i64, i64* %reg_300_ptr
  %t787 = call i64 @__sys_pointer_free(i64 %t786)
  store i64 %t787, i64* %reg_301_ptr
  %t788 = load i64, i64* %var_nq_ptr
  store i64 %t788, i64* %reg_302_ptr
  %t789 = load i64, i64* %reg_302_ptr
  store i64 %t789, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b119
rt_gc_mark_phase_b118:
  br label %rt_gc_mark_phase_b119
rt_gc_mark_phase_b119:
  br label %rt_gc_mark_phase_b116
rt_gc_mark_phase_b120:
  %t790 = load i64, i64* %var_entry_ptr
  store i64 %t790, i64* %reg_313_ptr
  %t791 = load i64, i64* %reg_313_ptr
  %t792 = add i64 %t791, 16
  store i64 %t792, i64* %reg_314_ptr
  %t793 = load i64, i64* %reg_314_ptr
  %t794 = inttoptr i64 %t793 to i64*
  %t795 = load i64, i64* %t794
  store i64 %t795, i64* %reg_315_ptr
  %t796 = load i64, i64* %reg_315_ptr
  store i64 %t796, i64* %var_epay_ptr
  %t797 = load i64, i64* %var_epay_ptr
  store i64 %t797, i64* %reg_316_ptr
  %t798 = load i64, i64* %reg_316_ptr
  %t799 = icmp ne i64 %t798, 0
  %t800 = zext i1 %t799 to i64
  store i64 %t800, i64* %reg_317_ptr
  %t801 = load i64, i64* %reg_317_ptr
  %t803 = icmp ne i64 %t801, 0
  %t804 = zext i1 %t803 to i64
  %t802 = icmp ne i64 %t804, 0
  br i1 %t802, label %rt_gc_mark_phase_b123, label %rt_gc_mark_phase_b124
rt_gc_mark_phase_b121:
  br label %rt_gc_mark_phase_b122
rt_gc_mark_phase_b122:
  %t805 = load i64, i64* %var_entry_ptr
  store i64 %t805, i64* %reg_344_ptr
  %t806 = load i64, i64* %reg_344_ptr
  %t807 = add i64 %t806, 32
  store i64 %t807, i64* %reg_345_ptr
  %t808 = load i64, i64* %reg_345_ptr
  %t809 = inttoptr i64 %t808 to i64*
  %t810 = load i64, i64* %t809
  store i64 %t810, i64* %reg_346_ptr
  %t811 = load i64, i64* %reg_346_ptr
  store i64 %t811, i64* %var_entry_ptr
  br label %rt_gc_mark_phase_b91
rt_gc_mark_phase_b123:
  %t812 = load i64, i64* %var_qlen_ptr
  store i64 %t812, i64* %reg_318_ptr
  %t813 = load i64, i64* %var_qcap_ptr
  store i64 %t813, i64* %reg_319_ptr
  %t814 = load i64, i64* %reg_318_ptr
  %t815 = load i64, i64* %reg_319_ptr
  %t816 = icmp sge i64 %t814, %t815
  %t817 = zext i1 %t816 to i64
  store i64 %t817, i64* %reg_320_ptr
  %t818 = load i64, i64* %reg_320_ptr
  %t820 = icmp ne i64 %t818, 0
  %t821 = zext i1 %t820 to i64
  %t819 = icmp ne i64 %t821, 0
  br i1 %t819, label %rt_gc_mark_phase_b126, label %rt_gc_mark_phase_b127
rt_gc_mark_phase_b124:
  br label %rt_gc_mark_phase_b125
rt_gc_mark_phase_b125:
  br label %rt_gc_mark_phase_b122
rt_gc_mark_phase_b126:
  %t822 = load i64, i64* %var_qcap_ptr
  store i64 %t822, i64* %reg_321_ptr
  %t823 = load i64, i64* %reg_321_ptr
  %t824 = mul i64 %t823, 2
  store i64 %t824, i64* %reg_322_ptr
  %t825 = load i64, i64* %reg_322_ptr
  store i64 %t825, i64* %var_qcap_ptr
  %t826 = load i64, i64* %var_qcap_ptr
  store i64 %t826, i64* %reg_323_ptr
  %t827 = load i64, i64* %reg_323_ptr
  %t828 = mul i64 %t827, 8
  store i64 %t828, i64* %reg_324_ptr
  %t829 = load i64, i64* %reg_324_ptr
  %t830 = call i64 @__sys_pointer_alloc(i64 %t829)
  store i64 %t830, i64* %reg_325_ptr
  %t831 = load i64, i64* %reg_325_ptr
  store i64 %t831, i64* %var_nq_ptr
  %t832 = load i64, i64* %var_nq_ptr
  store i64 %t832, i64* %reg_326_ptr
  %t833 = load i64, i64* %reg_326_ptr
  %t834 = icmp ne i64 %t833, 0
  %t835 = zext i1 %t834 to i64
  store i64 %t835, i64* %reg_327_ptr
  %t836 = load i64, i64* %reg_327_ptr
  %t838 = icmp ne i64 %t836, 0
  %t839 = zext i1 %t838 to i64
  %t837 = icmp ne i64 %t839, 0
  br i1 %t837, label %rt_gc_mark_phase_b129, label %rt_gc_mark_phase_b130
rt_gc_mark_phase_b127:
  br label %rt_gc_mark_phase_b128
rt_gc_mark_phase_b128:
  %t840 = load i64, i64* %var_queue_ptr
  store i64 %t840, i64* %reg_336_ptr
  %t841 = load i64, i64* %var_qlen_ptr
  store i64 %t841, i64* %reg_337_ptr
  %t842 = load i64, i64* %reg_337_ptr
  %t843 = mul i64 %t842, 8
  store i64 %t843, i64* %reg_338_ptr
  %t844 = load i64, i64* %reg_336_ptr
  %t845 = load i64, i64* %reg_338_ptr
  %t846 = add i64 %t844, %t845
  store i64 %t846, i64* %reg_339_ptr
  %t847 = load i64, i64* %var_epay_ptr
  store i64 %t847, i64* %reg_340_ptr
  %t848 = load i64, i64* %reg_339_ptr
  %t849 = load i64, i64* %reg_340_ptr
  %t850 = inttoptr i64 %t848 to i64*
  store i64 %t849, i64* %t850
  store i64 0, i64* %reg_341_ptr
  %t851 = load i64, i64* %var_qlen_ptr
  store i64 %t851, i64* %reg_342_ptr
  %t852 = load i64, i64* %reg_342_ptr
  %t853 = add i64 %t852, 1
  store i64 %t853, i64* %reg_343_ptr
  %t854 = load i64, i64* %reg_343_ptr
  store i64 %t854, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b125
rt_gc_mark_phase_b129:
  %t855 = load i64, i64* %var_nq_ptr
  store i64 %t855, i64* %reg_328_ptr
  %t856 = load i64, i64* %var_queue_ptr
  store i64 %t856, i64* %reg_329_ptr
  %t857 = load i64, i64* %var_qlen_ptr
  store i64 %t857, i64* %reg_330_ptr
  %t858 = load i64, i64* %reg_330_ptr
  %t859 = mul i64 %t858, 8
  store i64 %t859, i64* %reg_331_ptr
  %t860 = load i64, i64* %reg_328_ptr
  %t861 = load i64, i64* %reg_329_ptr
  %t862 = load i64, i64* %reg_331_ptr
  %t863 = inttoptr i64 %t860 to i8*
  %t864 = inttoptr i64 %t861 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t863, i8* %t864, i64 %t862, i1 false)
  store i64 0, i64* %reg_332_ptr
  %t865 = load i64, i64* %var_queue_ptr
  store i64 %t865, i64* %reg_333_ptr
  %t866 = load i64, i64* %reg_333_ptr
  %t867 = call i64 @__sys_pointer_free(i64 %t866)
  store i64 %t867, i64* %reg_334_ptr
  %t868 = load i64, i64* %var_nq_ptr
  store i64 %t868, i64* %reg_335_ptr
  %t869 = load i64, i64* %reg_335_ptr
  store i64 %t869, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b131
rt_gc_mark_phase_b130:
  br label %rt_gc_mark_phase_b131
rt_gc_mark_phase_b131:
  br label %rt_gc_mark_phase_b128
rt_gc_mark_phase_b132:
  %t870 = load i64, i64* %var_p_ptr
  store i64 %t870, i64* %reg_349_ptr
  %t871 = load i64, i64* %reg_349_ptr
  %t872 = inttoptr i64 %t871 to i64*
  %t873 = load i64, i64* %t872
  store i64 %t873, i64* %reg_350_ptr
  %t874 = load i64, i64* %reg_350_ptr
  store i64 %t874, i64* %var_ml_len_ptr
  store i64 0, i64* %var_j_ptr
  br label %rt_gc_mark_phase_b135
rt_gc_mark_phase_b133:
  br label %rt_gc_mark_phase_b134
rt_gc_mark_phase_b134:
  %t875 = load i64, i64* %var_kind_val_ptr
  store i64 %t875, i64* %reg_462_ptr
  %t876 = load i64, i64* %reg_462_ptr
  %t877 = icmp eq i64 %t876, 6
  %t878 = zext i1 %t877 to i64
  store i64 %t878, i64* %reg_463_ptr
  %t879 = load i64, i64* %reg_463_ptr
  %t881 = icmp ne i64 %t879, 0
  %t882 = zext i1 %t881 to i64
  %t880 = icmp ne i64 %t882, 0
  br i1 %t880, label %rt_gc_mark_phase_b176, label %rt_gc_mark_phase_b177
rt_gc_mark_phase_b135:
  %t883 = load i64, i64* %var_j_ptr
  store i64 %t883, i64* %reg_351_ptr
  %t884 = load i64, i64* %var_ml_len_ptr
  store i64 %t884, i64* %reg_352_ptr
  %t885 = load i64, i64* %reg_351_ptr
  %t886 = load i64, i64* %reg_352_ptr
  %t887 = icmp sge i64 %t885, %t886
  %t888 = zext i1 %t887 to i64
  store i64 %t888, i64* %reg_353_ptr
  %t889 = load i64, i64* %reg_353_ptr
  %t891 = icmp ne i64 %t889, 0
  %t892 = zext i1 %t891 to i64
  %t890 = icmp ne i64 %t892, 0
  br i1 %t890, label %rt_gc_mark_phase_b137, label %rt_gc_mark_phase_b138
rt_gc_mark_phase_b136:
  br label %rt_gc_mark_phase_b134
rt_gc_mark_phase_b137:
  br label %rt_gc_mark_phase_b136
rt_gc_mark_phase_b138:
  br label %rt_gc_mark_phase_b139
rt_gc_mark_phase_b139:
  %t893 = load i64, i64* %var_p_ptr
  store i64 %t893, i64* %reg_354_ptr
  %t894 = load i64, i64* %reg_354_ptr
  %t895 = add i64 %t894, 16
  store i64 %t895, i64* %reg_355_ptr
  %t896 = load i64, i64* %var_j_ptr
  store i64 %t896, i64* %reg_356_ptr
  %t897 = load i64, i64* %reg_356_ptr
  %t898 = mul i64 %t897, 16
  store i64 %t898, i64* %reg_357_ptr
  %t899 = load i64, i64* %reg_355_ptr
  %t900 = load i64, i64* %reg_357_ptr
  %t901 = add i64 %t899, %t900
  store i64 %t901, i64* %reg_358_ptr
  %t902 = load i64, i64* %reg_358_ptr
  store i64 %t902, i64* %var_item_base_ptr
  %t903 = load i64, i64* %var_item_base_ptr
  store i64 %t903, i64* %reg_359_ptr
  %t904 = load i64, i64* %reg_359_ptr
  %t905 = inttoptr i64 %t904 to i64*
  %t906 = load i64, i64* %t905
  store i64 %t906, i64* %reg_360_ptr
  %t907 = load i64, i64* %reg_360_ptr
  store i64 %t907, i64* %var_itag_ptr
  %t908 = load i64, i64* %var_itag_ptr
  store i64 %t908, i64* %reg_361_ptr
  %t909 = load i64, i64* %reg_361_ptr
  %t910 = icmp eq i64 %t909, 2
  %t911 = zext i1 %t910 to i64
  store i64 %t911, i64* %reg_362_ptr
  %t912 = load i64, i64* %reg_362_ptr
  %t914 = icmp ne i64 %t912, 0
  %t915 = zext i1 %t914 to i64
  %t913 = icmp ne i64 %t915, 0
  br i1 %t913, label %rt_gc_mark_phase_b140, label %rt_gc_mark_phase_b141
rt_gc_mark_phase_b140:
  %t916 = load i64, i64* %var_item_base_ptr
  store i64 %t916, i64* %reg_363_ptr
  %t917 = load i64, i64* %reg_363_ptr
  %t918 = add i64 %t917, 8
  store i64 %t918, i64* %reg_364_ptr
  %t919 = load i64, i64* %reg_364_ptr
  %t920 = inttoptr i64 %t919 to i64*
  %t921 = load i64, i64* %t920
  store i64 %t921, i64* %reg_365_ptr
  %t922 = load i64, i64* %reg_365_ptr
  store i64 %t922, i64* %var_ipay_ptr
  %t923 = load i64, i64* %var_ipay_ptr
  store i64 %t923, i64* %reg_366_ptr
  %t924 = load i64, i64* %reg_366_ptr
  %t925 = icmp ne i64 %t924, 0
  %t926 = zext i1 %t925 to i64
  store i64 %t926, i64* %reg_367_ptr
  %t927 = load i64, i64* %reg_367_ptr
  %t929 = icmp ne i64 %t927, 0
  %t930 = zext i1 %t929 to i64
  %t928 = icmp ne i64 %t930, 0
  br i1 %t928, label %rt_gc_mark_phase_b143, label %rt_gc_mark_phase_b144
rt_gc_mark_phase_b141:
  br label %rt_gc_mark_phase_b142
rt_gc_mark_phase_b142:
  %t931 = load i64, i64* %var_itag_ptr
  store i64 %t931, i64* %reg_394_ptr
  %t932 = load i64, i64* %reg_394_ptr
  %t933 = icmp eq i64 %t932, 3
  %t934 = zext i1 %t933 to i64
  store i64 %t934, i64* %reg_395_ptr
  %t935 = load i64, i64* %reg_395_ptr
  %t937 = icmp ne i64 %t935, 0
  %t938 = zext i1 %t937 to i64
  %t936 = icmp ne i64 %t938, 0
  br i1 %t936, label %rt_gc_mark_phase_b152, label %rt_gc_mark_phase_b153
rt_gc_mark_phase_b143:
  %t939 = load i64, i64* %var_qlen_ptr
  store i64 %t939, i64* %reg_368_ptr
  %t940 = load i64, i64* %var_qcap_ptr
  store i64 %t940, i64* %reg_369_ptr
  %t941 = load i64, i64* %reg_368_ptr
  %t942 = load i64, i64* %reg_369_ptr
  %t943 = icmp sge i64 %t941, %t942
  %t944 = zext i1 %t943 to i64
  store i64 %t944, i64* %reg_370_ptr
  %t945 = load i64, i64* %reg_370_ptr
  %t947 = icmp ne i64 %t945, 0
  %t948 = zext i1 %t947 to i64
  %t946 = icmp ne i64 %t948, 0
  br i1 %t946, label %rt_gc_mark_phase_b146, label %rt_gc_mark_phase_b147
rt_gc_mark_phase_b144:
  br label %rt_gc_mark_phase_b145
rt_gc_mark_phase_b145:
  br label %rt_gc_mark_phase_b142
rt_gc_mark_phase_b146:
  %t949 = load i64, i64* %var_qcap_ptr
  store i64 %t949, i64* %reg_371_ptr
  %t950 = load i64, i64* %reg_371_ptr
  %t951 = mul i64 %t950, 2
  store i64 %t951, i64* %reg_372_ptr
  %t952 = load i64, i64* %reg_372_ptr
  store i64 %t952, i64* %var_qcap_ptr
  %t953 = load i64, i64* %var_qcap_ptr
  store i64 %t953, i64* %reg_373_ptr
  %t954 = load i64, i64* %reg_373_ptr
  %t955 = mul i64 %t954, 8
  store i64 %t955, i64* %reg_374_ptr
  %t956 = load i64, i64* %reg_374_ptr
  %t957 = call i64 @__sys_pointer_alloc(i64 %t956)
  store i64 %t957, i64* %reg_375_ptr
  %t958 = load i64, i64* %reg_375_ptr
  store i64 %t958, i64* %var_nq_ptr
  %t959 = load i64, i64* %var_nq_ptr
  store i64 %t959, i64* %reg_376_ptr
  %t960 = load i64, i64* %reg_376_ptr
  %t961 = icmp ne i64 %t960, 0
  %t962 = zext i1 %t961 to i64
  store i64 %t962, i64* %reg_377_ptr
  %t963 = load i64, i64* %reg_377_ptr
  %t965 = icmp ne i64 %t963, 0
  %t966 = zext i1 %t965 to i64
  %t964 = icmp ne i64 %t966, 0
  br i1 %t964, label %rt_gc_mark_phase_b149, label %rt_gc_mark_phase_b150
rt_gc_mark_phase_b147:
  br label %rt_gc_mark_phase_b148
rt_gc_mark_phase_b148:
  %t967 = load i64, i64* %var_queue_ptr
  store i64 %t967, i64* %reg_386_ptr
  %t968 = load i64, i64* %var_qlen_ptr
  store i64 %t968, i64* %reg_387_ptr
  %t969 = load i64, i64* %reg_387_ptr
  %t970 = mul i64 %t969, 8
  store i64 %t970, i64* %reg_388_ptr
  %t971 = load i64, i64* %reg_386_ptr
  %t972 = load i64, i64* %reg_388_ptr
  %t973 = add i64 %t971, %t972
  store i64 %t973, i64* %reg_389_ptr
  %t974 = load i64, i64* %var_ipay_ptr
  store i64 %t974, i64* %reg_390_ptr
  %t975 = load i64, i64* %reg_389_ptr
  %t976 = load i64, i64* %reg_390_ptr
  %t977 = inttoptr i64 %t975 to i64*
  store i64 %t976, i64* %t977
  store i64 0, i64* %reg_391_ptr
  %t978 = load i64, i64* %var_qlen_ptr
  store i64 %t978, i64* %reg_392_ptr
  %t979 = load i64, i64* %reg_392_ptr
  %t980 = add i64 %t979, 1
  store i64 %t980, i64* %reg_393_ptr
  %t981 = load i64, i64* %reg_393_ptr
  store i64 %t981, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b145
rt_gc_mark_phase_b149:
  %t982 = load i64, i64* %var_nq_ptr
  store i64 %t982, i64* %reg_378_ptr
  %t983 = load i64, i64* %var_queue_ptr
  store i64 %t983, i64* %reg_379_ptr
  %t984 = load i64, i64* %var_qlen_ptr
  store i64 %t984, i64* %reg_380_ptr
  %t985 = load i64, i64* %reg_380_ptr
  %t986 = mul i64 %t985, 8
  store i64 %t986, i64* %reg_381_ptr
  %t987 = load i64, i64* %reg_378_ptr
  %t988 = load i64, i64* %reg_379_ptr
  %t989 = load i64, i64* %reg_381_ptr
  %t990 = inttoptr i64 %t987 to i8*
  %t991 = inttoptr i64 %t988 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t990, i8* %t991, i64 %t989, i1 false)
  store i64 0, i64* %reg_382_ptr
  %t992 = load i64, i64* %var_queue_ptr
  store i64 %t992, i64* %reg_383_ptr
  %t993 = load i64, i64* %reg_383_ptr
  %t994 = call i64 @__sys_pointer_free(i64 %t993)
  store i64 %t994, i64* %reg_384_ptr
  %t995 = load i64, i64* %var_nq_ptr
  store i64 %t995, i64* %reg_385_ptr
  %t996 = load i64, i64* %reg_385_ptr
  store i64 %t996, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b151
rt_gc_mark_phase_b150:
  br label %rt_gc_mark_phase_b151
rt_gc_mark_phase_b151:
  br label %rt_gc_mark_phase_b148
rt_gc_mark_phase_b152:
  %t997 = load i64, i64* %var_item_base_ptr
  store i64 %t997, i64* %reg_396_ptr
  %t998 = load i64, i64* %reg_396_ptr
  %t999 = add i64 %t998, 8
  store i64 %t999, i64* %reg_397_ptr
  %t1000 = load i64, i64* %reg_397_ptr
  %t1001 = inttoptr i64 %t1000 to i64*
  %t1002 = load i64, i64* %t1001
  store i64 %t1002, i64* %reg_398_ptr
  %t1003 = load i64, i64* %reg_398_ptr
  store i64 %t1003, i64* %var_ipay_ptr
  %t1004 = load i64, i64* %var_ipay_ptr
  store i64 %t1004, i64* %reg_399_ptr
  %t1005 = load i64, i64* %reg_399_ptr
  %t1006 = icmp ne i64 %t1005, 0
  %t1007 = zext i1 %t1006 to i64
  store i64 %t1007, i64* %reg_400_ptr
  %t1008 = load i64, i64* %reg_400_ptr
  %t1010 = icmp ne i64 %t1008, 0
  %t1011 = zext i1 %t1010 to i64
  %t1009 = icmp ne i64 %t1011, 0
  br i1 %t1009, label %rt_gc_mark_phase_b155, label %rt_gc_mark_phase_b156
rt_gc_mark_phase_b153:
  br label %rt_gc_mark_phase_b154
rt_gc_mark_phase_b154:
  %t1012 = load i64, i64* %var_itag_ptr
  store i64 %t1012, i64* %reg_427_ptr
  %t1013 = load i64, i64* %reg_427_ptr
  %t1014 = icmp eq i64 %t1013, 4
  %t1015 = zext i1 %t1014 to i64
  store i64 %t1015, i64* %reg_428_ptr
  %t1016 = load i64, i64* %reg_428_ptr
  %t1018 = icmp ne i64 %t1016, 0
  %t1019 = zext i1 %t1018 to i64
  %t1017 = icmp ne i64 %t1019, 0
  br i1 %t1017, label %rt_gc_mark_phase_b164, label %rt_gc_mark_phase_b165
rt_gc_mark_phase_b155:
  %t1020 = load i64, i64* %var_qlen_ptr
  store i64 %t1020, i64* %reg_401_ptr
  %t1021 = load i64, i64* %var_qcap_ptr
  store i64 %t1021, i64* %reg_402_ptr
  %t1022 = load i64, i64* %reg_401_ptr
  %t1023 = load i64, i64* %reg_402_ptr
  %t1024 = icmp sge i64 %t1022, %t1023
  %t1025 = zext i1 %t1024 to i64
  store i64 %t1025, i64* %reg_403_ptr
  %t1026 = load i64, i64* %reg_403_ptr
  %t1028 = icmp ne i64 %t1026, 0
  %t1029 = zext i1 %t1028 to i64
  %t1027 = icmp ne i64 %t1029, 0
  br i1 %t1027, label %rt_gc_mark_phase_b158, label %rt_gc_mark_phase_b159
rt_gc_mark_phase_b156:
  br label %rt_gc_mark_phase_b157
rt_gc_mark_phase_b157:
  br label %rt_gc_mark_phase_b154
rt_gc_mark_phase_b158:
  %t1030 = load i64, i64* %var_qcap_ptr
  store i64 %t1030, i64* %reg_404_ptr
  %t1031 = load i64, i64* %reg_404_ptr
  %t1032 = mul i64 %t1031, 2
  store i64 %t1032, i64* %reg_405_ptr
  %t1033 = load i64, i64* %reg_405_ptr
  store i64 %t1033, i64* %var_qcap_ptr
  %t1034 = load i64, i64* %var_qcap_ptr
  store i64 %t1034, i64* %reg_406_ptr
  %t1035 = load i64, i64* %reg_406_ptr
  %t1036 = mul i64 %t1035, 8
  store i64 %t1036, i64* %reg_407_ptr
  %t1037 = load i64, i64* %reg_407_ptr
  %t1038 = call i64 @__sys_pointer_alloc(i64 %t1037)
  store i64 %t1038, i64* %reg_408_ptr
  %t1039 = load i64, i64* %reg_408_ptr
  store i64 %t1039, i64* %var_nq_ptr
  %t1040 = load i64, i64* %var_nq_ptr
  store i64 %t1040, i64* %reg_409_ptr
  %t1041 = load i64, i64* %reg_409_ptr
  %t1042 = icmp ne i64 %t1041, 0
  %t1043 = zext i1 %t1042 to i64
  store i64 %t1043, i64* %reg_410_ptr
  %t1044 = load i64, i64* %reg_410_ptr
  %t1046 = icmp ne i64 %t1044, 0
  %t1047 = zext i1 %t1046 to i64
  %t1045 = icmp ne i64 %t1047, 0
  br i1 %t1045, label %rt_gc_mark_phase_b161, label %rt_gc_mark_phase_b162
rt_gc_mark_phase_b159:
  br label %rt_gc_mark_phase_b160
rt_gc_mark_phase_b160:
  %t1048 = load i64, i64* %var_queue_ptr
  store i64 %t1048, i64* %reg_419_ptr
  %t1049 = load i64, i64* %var_qlen_ptr
  store i64 %t1049, i64* %reg_420_ptr
  %t1050 = load i64, i64* %reg_420_ptr
  %t1051 = mul i64 %t1050, 8
  store i64 %t1051, i64* %reg_421_ptr
  %t1052 = load i64, i64* %reg_419_ptr
  %t1053 = load i64, i64* %reg_421_ptr
  %t1054 = add i64 %t1052, %t1053
  store i64 %t1054, i64* %reg_422_ptr
  %t1055 = load i64, i64* %var_ipay_ptr
  store i64 %t1055, i64* %reg_423_ptr
  %t1056 = load i64, i64* %reg_422_ptr
  %t1057 = load i64, i64* %reg_423_ptr
  %t1058 = inttoptr i64 %t1056 to i64*
  store i64 %t1057, i64* %t1058
  store i64 0, i64* %reg_424_ptr
  %t1059 = load i64, i64* %var_qlen_ptr
  store i64 %t1059, i64* %reg_425_ptr
  %t1060 = load i64, i64* %reg_425_ptr
  %t1061 = add i64 %t1060, 1
  store i64 %t1061, i64* %reg_426_ptr
  %t1062 = load i64, i64* %reg_426_ptr
  store i64 %t1062, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b157
rt_gc_mark_phase_b161:
  %t1063 = load i64, i64* %var_nq_ptr
  store i64 %t1063, i64* %reg_411_ptr
  %t1064 = load i64, i64* %var_queue_ptr
  store i64 %t1064, i64* %reg_412_ptr
  %t1065 = load i64, i64* %var_qlen_ptr
  store i64 %t1065, i64* %reg_413_ptr
  %t1066 = load i64, i64* %reg_413_ptr
  %t1067 = mul i64 %t1066, 8
  store i64 %t1067, i64* %reg_414_ptr
  %t1068 = load i64, i64* %reg_411_ptr
  %t1069 = load i64, i64* %reg_412_ptr
  %t1070 = load i64, i64* %reg_414_ptr
  %t1071 = inttoptr i64 %t1068 to i8*
  %t1072 = inttoptr i64 %t1069 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1071, i8* %t1072, i64 %t1070, i1 false)
  store i64 0, i64* %reg_415_ptr
  %t1073 = load i64, i64* %var_queue_ptr
  store i64 %t1073, i64* %reg_416_ptr
  %t1074 = load i64, i64* %reg_416_ptr
  %t1075 = call i64 @__sys_pointer_free(i64 %t1074)
  store i64 %t1075, i64* %reg_417_ptr
  %t1076 = load i64, i64* %var_nq_ptr
  store i64 %t1076, i64* %reg_418_ptr
  %t1077 = load i64, i64* %reg_418_ptr
  store i64 %t1077, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b163
rt_gc_mark_phase_b162:
  br label %rt_gc_mark_phase_b163
rt_gc_mark_phase_b163:
  br label %rt_gc_mark_phase_b160
rt_gc_mark_phase_b164:
  %t1078 = load i64, i64* %var_item_base_ptr
  store i64 %t1078, i64* %reg_429_ptr
  %t1079 = load i64, i64* %reg_429_ptr
  %t1080 = add i64 %t1079, 8
  store i64 %t1080, i64* %reg_430_ptr
  %t1081 = load i64, i64* %reg_430_ptr
  %t1082 = inttoptr i64 %t1081 to i64*
  %t1083 = load i64, i64* %t1082
  store i64 %t1083, i64* %reg_431_ptr
  %t1084 = load i64, i64* %reg_431_ptr
  store i64 %t1084, i64* %var_ipay_ptr
  %t1085 = load i64, i64* %var_ipay_ptr
  store i64 %t1085, i64* %reg_432_ptr
  %t1086 = load i64, i64* %reg_432_ptr
  %t1087 = icmp ne i64 %t1086, 0
  %t1088 = zext i1 %t1087 to i64
  store i64 %t1088, i64* %reg_433_ptr
  %t1089 = load i64, i64* %reg_433_ptr
  %t1091 = icmp ne i64 %t1089, 0
  %t1092 = zext i1 %t1091 to i64
  %t1090 = icmp ne i64 %t1092, 0
  br i1 %t1090, label %rt_gc_mark_phase_b167, label %rt_gc_mark_phase_b168
rt_gc_mark_phase_b165:
  br label %rt_gc_mark_phase_b166
rt_gc_mark_phase_b166:
  %t1093 = load i64, i64* %var_j_ptr
  store i64 %t1093, i64* %reg_460_ptr
  %t1094 = load i64, i64* %reg_460_ptr
  %t1095 = add i64 %t1094, 1
  store i64 %t1095, i64* %reg_461_ptr
  %t1096 = load i64, i64* %reg_461_ptr
  store i64 %t1096, i64* %var_j_ptr
  br label %rt_gc_mark_phase_b135
rt_gc_mark_phase_b167:
  %t1097 = load i64, i64* %var_qlen_ptr
  store i64 %t1097, i64* %reg_434_ptr
  %t1098 = load i64, i64* %var_qcap_ptr
  store i64 %t1098, i64* %reg_435_ptr
  %t1099 = load i64, i64* %reg_434_ptr
  %t1100 = load i64, i64* %reg_435_ptr
  %t1101 = icmp sge i64 %t1099, %t1100
  %t1102 = zext i1 %t1101 to i64
  store i64 %t1102, i64* %reg_436_ptr
  %t1103 = load i64, i64* %reg_436_ptr
  %t1105 = icmp ne i64 %t1103, 0
  %t1106 = zext i1 %t1105 to i64
  %t1104 = icmp ne i64 %t1106, 0
  br i1 %t1104, label %rt_gc_mark_phase_b170, label %rt_gc_mark_phase_b171
rt_gc_mark_phase_b168:
  br label %rt_gc_mark_phase_b169
rt_gc_mark_phase_b169:
  br label %rt_gc_mark_phase_b166
rt_gc_mark_phase_b170:
  %t1107 = load i64, i64* %var_qcap_ptr
  store i64 %t1107, i64* %reg_437_ptr
  %t1108 = load i64, i64* %reg_437_ptr
  %t1109 = mul i64 %t1108, 2
  store i64 %t1109, i64* %reg_438_ptr
  %t1110 = load i64, i64* %reg_438_ptr
  store i64 %t1110, i64* %var_qcap_ptr
  %t1111 = load i64, i64* %var_qcap_ptr
  store i64 %t1111, i64* %reg_439_ptr
  %t1112 = load i64, i64* %reg_439_ptr
  %t1113 = mul i64 %t1112, 8
  store i64 %t1113, i64* %reg_440_ptr
  %t1114 = load i64, i64* %reg_440_ptr
  %t1115 = call i64 @__sys_pointer_alloc(i64 %t1114)
  store i64 %t1115, i64* %reg_441_ptr
  %t1116 = load i64, i64* %reg_441_ptr
  store i64 %t1116, i64* %var_nq_ptr
  %t1117 = load i64, i64* %var_nq_ptr
  store i64 %t1117, i64* %reg_442_ptr
  %t1118 = load i64, i64* %reg_442_ptr
  %t1119 = icmp ne i64 %t1118, 0
  %t1120 = zext i1 %t1119 to i64
  store i64 %t1120, i64* %reg_443_ptr
  %t1121 = load i64, i64* %reg_443_ptr
  %t1123 = icmp ne i64 %t1121, 0
  %t1124 = zext i1 %t1123 to i64
  %t1122 = icmp ne i64 %t1124, 0
  br i1 %t1122, label %rt_gc_mark_phase_b173, label %rt_gc_mark_phase_b174
rt_gc_mark_phase_b171:
  br label %rt_gc_mark_phase_b172
rt_gc_mark_phase_b172:
  %t1125 = load i64, i64* %var_queue_ptr
  store i64 %t1125, i64* %reg_452_ptr
  %t1126 = load i64, i64* %var_qlen_ptr
  store i64 %t1126, i64* %reg_453_ptr
  %t1127 = load i64, i64* %reg_453_ptr
  %t1128 = mul i64 %t1127, 8
  store i64 %t1128, i64* %reg_454_ptr
  %t1129 = load i64, i64* %reg_452_ptr
  %t1130 = load i64, i64* %reg_454_ptr
  %t1131 = add i64 %t1129, %t1130
  store i64 %t1131, i64* %reg_455_ptr
  %t1132 = load i64, i64* %var_ipay_ptr
  store i64 %t1132, i64* %reg_456_ptr
  %t1133 = load i64, i64* %reg_455_ptr
  %t1134 = load i64, i64* %reg_456_ptr
  %t1135 = inttoptr i64 %t1133 to i64*
  store i64 %t1134, i64* %t1135
  store i64 0, i64* %reg_457_ptr
  %t1136 = load i64, i64* %var_qlen_ptr
  store i64 %t1136, i64* %reg_458_ptr
  %t1137 = load i64, i64* %reg_458_ptr
  %t1138 = add i64 %t1137, 1
  store i64 %t1138, i64* %reg_459_ptr
  %t1139 = load i64, i64* %reg_459_ptr
  store i64 %t1139, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b169
rt_gc_mark_phase_b173:
  %t1140 = load i64, i64* %var_nq_ptr
  store i64 %t1140, i64* %reg_444_ptr
  %t1141 = load i64, i64* %var_queue_ptr
  store i64 %t1141, i64* %reg_445_ptr
  %t1142 = load i64, i64* %var_qlen_ptr
  store i64 %t1142, i64* %reg_446_ptr
  %t1143 = load i64, i64* %reg_446_ptr
  %t1144 = mul i64 %t1143, 8
  store i64 %t1144, i64* %reg_447_ptr
  %t1145 = load i64, i64* %reg_444_ptr
  %t1146 = load i64, i64* %reg_445_ptr
  %t1147 = load i64, i64* %reg_447_ptr
  %t1148 = inttoptr i64 %t1145 to i8*
  %t1149 = inttoptr i64 %t1146 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1148, i8* %t1149, i64 %t1147, i1 false)
  store i64 0, i64* %reg_448_ptr
  %t1150 = load i64, i64* %var_queue_ptr
  store i64 %t1150, i64* %reg_449_ptr
  %t1151 = load i64, i64* %reg_449_ptr
  %t1152 = call i64 @__sys_pointer_free(i64 %t1151)
  store i64 %t1152, i64* %reg_450_ptr
  %t1153 = load i64, i64* %var_nq_ptr
  store i64 %t1153, i64* %reg_451_ptr
  %t1154 = load i64, i64* %reg_451_ptr
  store i64 %t1154, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b175
rt_gc_mark_phase_b174:
  br label %rt_gc_mark_phase_b175
rt_gc_mark_phase_b175:
  br label %rt_gc_mark_phase_b172
rt_gc_mark_phase_b176:
  %t1155 = load i64, i64* %var_p_ptr
  store i64 %t1155, i64* %reg_464_ptr
  %t1156 = load i64, i64* %reg_464_ptr
  %t1157 = inttoptr i64 %t1156 to i64*
  %t1158 = load i64, i64* %t1157
  store i64 %t1158, i64* %reg_465_ptr
  %t1159 = load i64, i64* %reg_465_ptr
  store i64 %t1159, i64* %var_vtag_ptr
  %t1160 = load i64, i64* %var_vtag_ptr
  store i64 %t1160, i64* %reg_466_ptr
  %t1161 = load i64, i64* %reg_466_ptr
  %t1162 = icmp eq i64 %t1161, 2
  %t1163 = zext i1 %t1162 to i64
  store i64 %t1163, i64* %reg_467_ptr
  %t1164 = load i64, i64* %reg_467_ptr
  %t1166 = icmp ne i64 %t1164, 0
  %t1167 = zext i1 %t1166 to i64
  %t1165 = icmp ne i64 %t1167, 0
  br i1 %t1165, label %rt_gc_mark_phase_b179, label %rt_gc_mark_phase_b180
rt_gc_mark_phase_b177:
  br label %rt_gc_mark_phase_b178
rt_gc_mark_phase_b178:
  %t1168 = load i64, i64* %var_kind_val_ptr
  store i64 %t1168, i64* %reg_565_ptr
  %t1169 = load i64, i64* %reg_565_ptr
  %t1170 = icmp eq i64 %t1169, 7
  %t1171 = zext i1 %t1170 to i64
  store i64 %t1171, i64* %reg_566_ptr
  %t1172 = load i64, i64* %reg_566_ptr
  %t1174 = icmp ne i64 %t1172, 0
  %t1175 = zext i1 %t1174 to i64
  %t1173 = icmp ne i64 %t1175, 0
  br i1 %t1173, label %rt_gc_mark_phase_b215, label %rt_gc_mark_phase_b216
rt_gc_mark_phase_b179:
  %t1176 = load i64, i64* %var_p_ptr
  store i64 %t1176, i64* %reg_468_ptr
  %t1177 = load i64, i64* %reg_468_ptr
  %t1178 = add i64 %t1177, 8
  store i64 %t1178, i64* %reg_469_ptr
  %t1179 = load i64, i64* %reg_469_ptr
  %t1180 = inttoptr i64 %t1179 to i64*
  %t1181 = load i64, i64* %t1180
  store i64 %t1181, i64* %reg_470_ptr
  %t1182 = load i64, i64* %reg_470_ptr
  store i64 %t1182, i64* %var_vpay_ptr
  %t1183 = load i64, i64* %var_vpay_ptr
  store i64 %t1183, i64* %reg_471_ptr
  %t1184 = load i64, i64* %reg_471_ptr
  %t1185 = icmp ne i64 %t1184, 0
  %t1186 = zext i1 %t1185 to i64
  store i64 %t1186, i64* %reg_472_ptr
  %t1187 = load i64, i64* %reg_472_ptr
  %t1189 = icmp ne i64 %t1187, 0
  %t1190 = zext i1 %t1189 to i64
  %t1188 = icmp ne i64 %t1190, 0
  br i1 %t1188, label %rt_gc_mark_phase_b182, label %rt_gc_mark_phase_b183
rt_gc_mark_phase_b180:
  br label %rt_gc_mark_phase_b181
rt_gc_mark_phase_b181:
  %t1191 = load i64, i64* %var_vtag_ptr
  store i64 %t1191, i64* %reg_499_ptr
  %t1192 = load i64, i64* %reg_499_ptr
  %t1193 = icmp eq i64 %t1192, 3
  %t1194 = zext i1 %t1193 to i64
  store i64 %t1194, i64* %reg_500_ptr
  %t1195 = load i64, i64* %reg_500_ptr
  %t1197 = icmp ne i64 %t1195, 0
  %t1198 = zext i1 %t1197 to i64
  %t1196 = icmp ne i64 %t1198, 0
  br i1 %t1196, label %rt_gc_mark_phase_b191, label %rt_gc_mark_phase_b192
rt_gc_mark_phase_b182:
  %t1199 = load i64, i64* %var_qlen_ptr
  store i64 %t1199, i64* %reg_473_ptr
  %t1200 = load i64, i64* %var_qcap_ptr
  store i64 %t1200, i64* %reg_474_ptr
  %t1201 = load i64, i64* %reg_473_ptr
  %t1202 = load i64, i64* %reg_474_ptr
  %t1203 = icmp sge i64 %t1201, %t1202
  %t1204 = zext i1 %t1203 to i64
  store i64 %t1204, i64* %reg_475_ptr
  %t1205 = load i64, i64* %reg_475_ptr
  %t1207 = icmp ne i64 %t1205, 0
  %t1208 = zext i1 %t1207 to i64
  %t1206 = icmp ne i64 %t1208, 0
  br i1 %t1206, label %rt_gc_mark_phase_b185, label %rt_gc_mark_phase_b186
rt_gc_mark_phase_b183:
  br label %rt_gc_mark_phase_b184
rt_gc_mark_phase_b184:
  br label %rt_gc_mark_phase_b181
rt_gc_mark_phase_b185:
  %t1209 = load i64, i64* %var_qcap_ptr
  store i64 %t1209, i64* %reg_476_ptr
  %t1210 = load i64, i64* %reg_476_ptr
  %t1211 = mul i64 %t1210, 2
  store i64 %t1211, i64* %reg_477_ptr
  %t1212 = load i64, i64* %reg_477_ptr
  store i64 %t1212, i64* %var_qcap_ptr
  %t1213 = load i64, i64* %var_qcap_ptr
  store i64 %t1213, i64* %reg_478_ptr
  %t1214 = load i64, i64* %reg_478_ptr
  %t1215 = mul i64 %t1214, 8
  store i64 %t1215, i64* %reg_479_ptr
  %t1216 = load i64, i64* %reg_479_ptr
  %t1217 = call i64 @__sys_pointer_alloc(i64 %t1216)
  store i64 %t1217, i64* %reg_480_ptr
  %t1218 = load i64, i64* %reg_480_ptr
  store i64 %t1218, i64* %var_nq_ptr
  %t1219 = load i64, i64* %var_nq_ptr
  store i64 %t1219, i64* %reg_481_ptr
  %t1220 = load i64, i64* %reg_481_ptr
  %t1221 = icmp ne i64 %t1220, 0
  %t1222 = zext i1 %t1221 to i64
  store i64 %t1222, i64* %reg_482_ptr
  %t1223 = load i64, i64* %reg_482_ptr
  %t1225 = icmp ne i64 %t1223, 0
  %t1226 = zext i1 %t1225 to i64
  %t1224 = icmp ne i64 %t1226, 0
  br i1 %t1224, label %rt_gc_mark_phase_b188, label %rt_gc_mark_phase_b189
rt_gc_mark_phase_b186:
  br label %rt_gc_mark_phase_b187
rt_gc_mark_phase_b187:
  %t1227 = load i64, i64* %var_queue_ptr
  store i64 %t1227, i64* %reg_491_ptr
  %t1228 = load i64, i64* %var_qlen_ptr
  store i64 %t1228, i64* %reg_492_ptr
  %t1229 = load i64, i64* %reg_492_ptr
  %t1230 = mul i64 %t1229, 8
  store i64 %t1230, i64* %reg_493_ptr
  %t1231 = load i64, i64* %reg_491_ptr
  %t1232 = load i64, i64* %reg_493_ptr
  %t1233 = add i64 %t1231, %t1232
  store i64 %t1233, i64* %reg_494_ptr
  %t1234 = load i64, i64* %var_vpay_ptr
  store i64 %t1234, i64* %reg_495_ptr
  %t1235 = load i64, i64* %reg_494_ptr
  %t1236 = load i64, i64* %reg_495_ptr
  %t1237 = inttoptr i64 %t1235 to i64*
  store i64 %t1236, i64* %t1237
  store i64 0, i64* %reg_496_ptr
  %t1238 = load i64, i64* %var_qlen_ptr
  store i64 %t1238, i64* %reg_497_ptr
  %t1239 = load i64, i64* %reg_497_ptr
  %t1240 = add i64 %t1239, 1
  store i64 %t1240, i64* %reg_498_ptr
  %t1241 = load i64, i64* %reg_498_ptr
  store i64 %t1241, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b184
rt_gc_mark_phase_b188:
  %t1242 = load i64, i64* %var_nq_ptr
  store i64 %t1242, i64* %reg_483_ptr
  %t1243 = load i64, i64* %var_queue_ptr
  store i64 %t1243, i64* %reg_484_ptr
  %t1244 = load i64, i64* %var_qlen_ptr
  store i64 %t1244, i64* %reg_485_ptr
  %t1245 = load i64, i64* %reg_485_ptr
  %t1246 = mul i64 %t1245, 8
  store i64 %t1246, i64* %reg_486_ptr
  %t1247 = load i64, i64* %reg_483_ptr
  %t1248 = load i64, i64* %reg_484_ptr
  %t1249 = load i64, i64* %reg_486_ptr
  %t1250 = inttoptr i64 %t1247 to i8*
  %t1251 = inttoptr i64 %t1248 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1250, i8* %t1251, i64 %t1249, i1 false)
  store i64 0, i64* %reg_487_ptr
  %t1252 = load i64, i64* %var_queue_ptr
  store i64 %t1252, i64* %reg_488_ptr
  %t1253 = load i64, i64* %reg_488_ptr
  %t1254 = call i64 @__sys_pointer_free(i64 %t1253)
  store i64 %t1254, i64* %reg_489_ptr
  %t1255 = load i64, i64* %var_nq_ptr
  store i64 %t1255, i64* %reg_490_ptr
  %t1256 = load i64, i64* %reg_490_ptr
  store i64 %t1256, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b190
rt_gc_mark_phase_b189:
  br label %rt_gc_mark_phase_b190
rt_gc_mark_phase_b190:
  br label %rt_gc_mark_phase_b187
rt_gc_mark_phase_b191:
  %t1257 = load i64, i64* %var_p_ptr
  store i64 %t1257, i64* %reg_501_ptr
  %t1258 = load i64, i64* %reg_501_ptr
  %t1259 = add i64 %t1258, 8
  store i64 %t1259, i64* %reg_502_ptr
  %t1260 = load i64, i64* %reg_502_ptr
  %t1261 = inttoptr i64 %t1260 to i64*
  %t1262 = load i64, i64* %t1261
  store i64 %t1262, i64* %reg_503_ptr
  %t1263 = load i64, i64* %reg_503_ptr
  store i64 %t1263, i64* %var_vpay_ptr
  %t1264 = load i64, i64* %var_vpay_ptr
  store i64 %t1264, i64* %reg_504_ptr
  %t1265 = load i64, i64* %reg_504_ptr
  %t1266 = icmp ne i64 %t1265, 0
  %t1267 = zext i1 %t1266 to i64
  store i64 %t1267, i64* %reg_505_ptr
  %t1268 = load i64, i64* %reg_505_ptr
  %t1270 = icmp ne i64 %t1268, 0
  %t1271 = zext i1 %t1270 to i64
  %t1269 = icmp ne i64 %t1271, 0
  br i1 %t1269, label %rt_gc_mark_phase_b194, label %rt_gc_mark_phase_b195
rt_gc_mark_phase_b192:
  br label %rt_gc_mark_phase_b193
rt_gc_mark_phase_b193:
  %t1272 = load i64, i64* %var_vtag_ptr
  store i64 %t1272, i64* %reg_532_ptr
  %t1273 = load i64, i64* %reg_532_ptr
  %t1274 = icmp eq i64 %t1273, 4
  %t1275 = zext i1 %t1274 to i64
  store i64 %t1275, i64* %reg_533_ptr
  %t1276 = load i64, i64* %reg_533_ptr
  %t1278 = icmp ne i64 %t1276, 0
  %t1279 = zext i1 %t1278 to i64
  %t1277 = icmp ne i64 %t1279, 0
  br i1 %t1277, label %rt_gc_mark_phase_b203, label %rt_gc_mark_phase_b204
rt_gc_mark_phase_b194:
  %t1280 = load i64, i64* %var_qlen_ptr
  store i64 %t1280, i64* %reg_506_ptr
  %t1281 = load i64, i64* %var_qcap_ptr
  store i64 %t1281, i64* %reg_507_ptr
  %t1282 = load i64, i64* %reg_506_ptr
  %t1283 = load i64, i64* %reg_507_ptr
  %t1284 = icmp sge i64 %t1282, %t1283
  %t1285 = zext i1 %t1284 to i64
  store i64 %t1285, i64* %reg_508_ptr
  %t1286 = load i64, i64* %reg_508_ptr
  %t1288 = icmp ne i64 %t1286, 0
  %t1289 = zext i1 %t1288 to i64
  %t1287 = icmp ne i64 %t1289, 0
  br i1 %t1287, label %rt_gc_mark_phase_b197, label %rt_gc_mark_phase_b198
rt_gc_mark_phase_b195:
  br label %rt_gc_mark_phase_b196
rt_gc_mark_phase_b196:
  br label %rt_gc_mark_phase_b193
rt_gc_mark_phase_b197:
  %t1290 = load i64, i64* %var_qcap_ptr
  store i64 %t1290, i64* %reg_509_ptr
  %t1291 = load i64, i64* %reg_509_ptr
  %t1292 = mul i64 %t1291, 2
  store i64 %t1292, i64* %reg_510_ptr
  %t1293 = load i64, i64* %reg_510_ptr
  store i64 %t1293, i64* %var_qcap_ptr
  %t1294 = load i64, i64* %var_qcap_ptr
  store i64 %t1294, i64* %reg_511_ptr
  %t1295 = load i64, i64* %reg_511_ptr
  %t1296 = mul i64 %t1295, 8
  store i64 %t1296, i64* %reg_512_ptr
  %t1297 = load i64, i64* %reg_512_ptr
  %t1298 = call i64 @__sys_pointer_alloc(i64 %t1297)
  store i64 %t1298, i64* %reg_513_ptr
  %t1299 = load i64, i64* %reg_513_ptr
  store i64 %t1299, i64* %var_nq_ptr
  %t1300 = load i64, i64* %var_nq_ptr
  store i64 %t1300, i64* %reg_514_ptr
  %t1301 = load i64, i64* %reg_514_ptr
  %t1302 = icmp ne i64 %t1301, 0
  %t1303 = zext i1 %t1302 to i64
  store i64 %t1303, i64* %reg_515_ptr
  %t1304 = load i64, i64* %reg_515_ptr
  %t1306 = icmp ne i64 %t1304, 0
  %t1307 = zext i1 %t1306 to i64
  %t1305 = icmp ne i64 %t1307, 0
  br i1 %t1305, label %rt_gc_mark_phase_b200, label %rt_gc_mark_phase_b201
rt_gc_mark_phase_b198:
  br label %rt_gc_mark_phase_b199
rt_gc_mark_phase_b199:
  %t1308 = load i64, i64* %var_queue_ptr
  store i64 %t1308, i64* %reg_524_ptr
  %t1309 = load i64, i64* %var_qlen_ptr
  store i64 %t1309, i64* %reg_525_ptr
  %t1310 = load i64, i64* %reg_525_ptr
  %t1311 = mul i64 %t1310, 8
  store i64 %t1311, i64* %reg_526_ptr
  %t1312 = load i64, i64* %reg_524_ptr
  %t1313 = load i64, i64* %reg_526_ptr
  %t1314 = add i64 %t1312, %t1313
  store i64 %t1314, i64* %reg_527_ptr
  %t1315 = load i64, i64* %var_vpay_ptr
  store i64 %t1315, i64* %reg_528_ptr
  %t1316 = load i64, i64* %reg_527_ptr
  %t1317 = load i64, i64* %reg_528_ptr
  %t1318 = inttoptr i64 %t1316 to i64*
  store i64 %t1317, i64* %t1318
  store i64 0, i64* %reg_529_ptr
  %t1319 = load i64, i64* %var_qlen_ptr
  store i64 %t1319, i64* %reg_530_ptr
  %t1320 = load i64, i64* %reg_530_ptr
  %t1321 = add i64 %t1320, 1
  store i64 %t1321, i64* %reg_531_ptr
  %t1322 = load i64, i64* %reg_531_ptr
  store i64 %t1322, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b196
rt_gc_mark_phase_b200:
  %t1323 = load i64, i64* %var_nq_ptr
  store i64 %t1323, i64* %reg_516_ptr
  %t1324 = load i64, i64* %var_queue_ptr
  store i64 %t1324, i64* %reg_517_ptr
  %t1325 = load i64, i64* %var_qlen_ptr
  store i64 %t1325, i64* %reg_518_ptr
  %t1326 = load i64, i64* %reg_518_ptr
  %t1327 = mul i64 %t1326, 8
  store i64 %t1327, i64* %reg_519_ptr
  %t1328 = load i64, i64* %reg_516_ptr
  %t1329 = load i64, i64* %reg_517_ptr
  %t1330 = load i64, i64* %reg_519_ptr
  %t1331 = inttoptr i64 %t1328 to i8*
  %t1332 = inttoptr i64 %t1329 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1331, i8* %t1332, i64 %t1330, i1 false)
  store i64 0, i64* %reg_520_ptr
  %t1333 = load i64, i64* %var_queue_ptr
  store i64 %t1333, i64* %reg_521_ptr
  %t1334 = load i64, i64* %reg_521_ptr
  %t1335 = call i64 @__sys_pointer_free(i64 %t1334)
  store i64 %t1335, i64* %reg_522_ptr
  %t1336 = load i64, i64* %var_nq_ptr
  store i64 %t1336, i64* %reg_523_ptr
  %t1337 = load i64, i64* %reg_523_ptr
  store i64 %t1337, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b202
rt_gc_mark_phase_b201:
  br label %rt_gc_mark_phase_b202
rt_gc_mark_phase_b202:
  br label %rt_gc_mark_phase_b199
rt_gc_mark_phase_b203:
  %t1338 = load i64, i64* %var_p_ptr
  store i64 %t1338, i64* %reg_534_ptr
  %t1339 = load i64, i64* %reg_534_ptr
  %t1340 = add i64 %t1339, 8
  store i64 %t1340, i64* %reg_535_ptr
  %t1341 = load i64, i64* %reg_535_ptr
  %t1342 = inttoptr i64 %t1341 to i64*
  %t1343 = load i64, i64* %t1342
  store i64 %t1343, i64* %reg_536_ptr
  %t1344 = load i64, i64* %reg_536_ptr
  store i64 %t1344, i64* %var_vpay_ptr
  %t1345 = load i64, i64* %var_vpay_ptr
  store i64 %t1345, i64* %reg_537_ptr
  %t1346 = load i64, i64* %reg_537_ptr
  %t1347 = icmp ne i64 %t1346, 0
  %t1348 = zext i1 %t1347 to i64
  store i64 %t1348, i64* %reg_538_ptr
  %t1349 = load i64, i64* %reg_538_ptr
  %t1351 = icmp ne i64 %t1349, 0
  %t1352 = zext i1 %t1351 to i64
  %t1350 = icmp ne i64 %t1352, 0
  br i1 %t1350, label %rt_gc_mark_phase_b206, label %rt_gc_mark_phase_b207
rt_gc_mark_phase_b204:
  br label %rt_gc_mark_phase_b205
rt_gc_mark_phase_b205:
  br label %rt_gc_mark_phase_b178
rt_gc_mark_phase_b206:
  %t1353 = load i64, i64* %var_qlen_ptr
  store i64 %t1353, i64* %reg_539_ptr
  %t1354 = load i64, i64* %var_qcap_ptr
  store i64 %t1354, i64* %reg_540_ptr
  %t1355 = load i64, i64* %reg_539_ptr
  %t1356 = load i64, i64* %reg_540_ptr
  %t1357 = icmp sge i64 %t1355, %t1356
  %t1358 = zext i1 %t1357 to i64
  store i64 %t1358, i64* %reg_541_ptr
  %t1359 = load i64, i64* %reg_541_ptr
  %t1361 = icmp ne i64 %t1359, 0
  %t1362 = zext i1 %t1361 to i64
  %t1360 = icmp ne i64 %t1362, 0
  br i1 %t1360, label %rt_gc_mark_phase_b209, label %rt_gc_mark_phase_b210
rt_gc_mark_phase_b207:
  br label %rt_gc_mark_phase_b208
rt_gc_mark_phase_b208:
  br label %rt_gc_mark_phase_b205
rt_gc_mark_phase_b209:
  %t1363 = load i64, i64* %var_qcap_ptr
  store i64 %t1363, i64* %reg_542_ptr
  %t1364 = load i64, i64* %reg_542_ptr
  %t1365 = mul i64 %t1364, 2
  store i64 %t1365, i64* %reg_543_ptr
  %t1366 = load i64, i64* %reg_543_ptr
  store i64 %t1366, i64* %var_qcap_ptr
  %t1367 = load i64, i64* %var_qcap_ptr
  store i64 %t1367, i64* %reg_544_ptr
  %t1368 = load i64, i64* %reg_544_ptr
  %t1369 = mul i64 %t1368, 8
  store i64 %t1369, i64* %reg_545_ptr
  %t1370 = load i64, i64* %reg_545_ptr
  %t1371 = call i64 @__sys_pointer_alloc(i64 %t1370)
  store i64 %t1371, i64* %reg_546_ptr
  %t1372 = load i64, i64* %reg_546_ptr
  store i64 %t1372, i64* %var_nq_ptr
  %t1373 = load i64, i64* %var_nq_ptr
  store i64 %t1373, i64* %reg_547_ptr
  %t1374 = load i64, i64* %reg_547_ptr
  %t1375 = icmp ne i64 %t1374, 0
  %t1376 = zext i1 %t1375 to i64
  store i64 %t1376, i64* %reg_548_ptr
  %t1377 = load i64, i64* %reg_548_ptr
  %t1379 = icmp ne i64 %t1377, 0
  %t1380 = zext i1 %t1379 to i64
  %t1378 = icmp ne i64 %t1380, 0
  br i1 %t1378, label %rt_gc_mark_phase_b212, label %rt_gc_mark_phase_b213
rt_gc_mark_phase_b210:
  br label %rt_gc_mark_phase_b211
rt_gc_mark_phase_b211:
  %t1381 = load i64, i64* %var_queue_ptr
  store i64 %t1381, i64* %reg_557_ptr
  %t1382 = load i64, i64* %var_qlen_ptr
  store i64 %t1382, i64* %reg_558_ptr
  %t1383 = load i64, i64* %reg_558_ptr
  %t1384 = mul i64 %t1383, 8
  store i64 %t1384, i64* %reg_559_ptr
  %t1385 = load i64, i64* %reg_557_ptr
  %t1386 = load i64, i64* %reg_559_ptr
  %t1387 = add i64 %t1385, %t1386
  store i64 %t1387, i64* %reg_560_ptr
  %t1388 = load i64, i64* %var_vpay_ptr
  store i64 %t1388, i64* %reg_561_ptr
  %t1389 = load i64, i64* %reg_560_ptr
  %t1390 = load i64, i64* %reg_561_ptr
  %t1391 = inttoptr i64 %t1389 to i64*
  store i64 %t1390, i64* %t1391
  store i64 0, i64* %reg_562_ptr
  %t1392 = load i64, i64* %var_qlen_ptr
  store i64 %t1392, i64* %reg_563_ptr
  %t1393 = load i64, i64* %reg_563_ptr
  %t1394 = add i64 %t1393, 1
  store i64 %t1394, i64* %reg_564_ptr
  %t1395 = load i64, i64* %reg_564_ptr
  store i64 %t1395, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b208
rt_gc_mark_phase_b212:
  %t1396 = load i64, i64* %var_nq_ptr
  store i64 %t1396, i64* %reg_549_ptr
  %t1397 = load i64, i64* %var_queue_ptr
  store i64 %t1397, i64* %reg_550_ptr
  %t1398 = load i64, i64* %var_qlen_ptr
  store i64 %t1398, i64* %reg_551_ptr
  %t1399 = load i64, i64* %reg_551_ptr
  %t1400 = mul i64 %t1399, 8
  store i64 %t1400, i64* %reg_552_ptr
  %t1401 = load i64, i64* %reg_549_ptr
  %t1402 = load i64, i64* %reg_550_ptr
  %t1403 = load i64, i64* %reg_552_ptr
  %t1404 = inttoptr i64 %t1401 to i8*
  %t1405 = inttoptr i64 %t1402 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1404, i8* %t1405, i64 %t1403, i1 false)
  store i64 0, i64* %reg_553_ptr
  %t1406 = load i64, i64* %var_queue_ptr
  store i64 %t1406, i64* %reg_554_ptr
  %t1407 = load i64, i64* %reg_554_ptr
  %t1408 = call i64 @__sys_pointer_free(i64 %t1407)
  store i64 %t1408, i64* %reg_555_ptr
  %t1409 = load i64, i64* %var_nq_ptr
  store i64 %t1409, i64* %reg_556_ptr
  %t1410 = load i64, i64* %reg_556_ptr
  store i64 %t1410, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b214
rt_gc_mark_phase_b213:
  br label %rt_gc_mark_phase_b214
rt_gc_mark_phase_b214:
  br label %rt_gc_mark_phase_b211
rt_gc_mark_phase_b215:
  %t1411 = load i64, i64* %var_p_ptr
  store i64 %t1411, i64* %reg_567_ptr
  %t1412 = load i64, i64* %reg_567_ptr
  %t1413 = add i64 %t1412, 8
  store i64 %t1413, i64* %reg_568_ptr
  %t1414 = load i64, i64* %reg_568_ptr
  %t1415 = inttoptr i64 %t1414 to i64*
  %t1416 = load i64, i64* %t1415
  store i64 %t1416, i64* %reg_569_ptr
  %t1417 = load i64, i64* %reg_569_ptr
  store i64 %t1417, i64* %var_closure_ptr_ptr
  %t1418 = load i64, i64* %var_closure_ptr_ptr
  store i64 %t1418, i64* %reg_570_ptr
  %t1419 = load i64, i64* %reg_570_ptr
  %t1420 = icmp ne i64 %t1419, 0
  %t1421 = zext i1 %t1420 to i64
  store i64 %t1421, i64* %reg_571_ptr
  %t1422 = load i64, i64* %reg_571_ptr
  %t1424 = icmp ne i64 %t1422, 0
  %t1425 = zext i1 %t1424 to i64
  %t1423 = icmp ne i64 %t1425, 0
  br i1 %t1423, label %rt_gc_mark_phase_b218, label %rt_gc_mark_phase_b219
rt_gc_mark_phase_b216:
  br label %rt_gc_mark_phase_b217
rt_gc_mark_phase_b217:
  br label %rt_gc_mark_phase_b31
rt_gc_mark_phase_b218:
  %t1426 = load i64, i64* %var_qlen_ptr
  store i64 %t1426, i64* %reg_572_ptr
  %t1427 = load i64, i64* %var_qcap_ptr
  store i64 %t1427, i64* %reg_573_ptr
  %t1428 = load i64, i64* %reg_572_ptr
  %t1429 = load i64, i64* %reg_573_ptr
  %t1430 = icmp sge i64 %t1428, %t1429
  %t1431 = zext i1 %t1430 to i64
  store i64 %t1431, i64* %reg_574_ptr
  %t1432 = load i64, i64* %reg_574_ptr
  %t1434 = icmp ne i64 %t1432, 0
  %t1435 = zext i1 %t1434 to i64
  %t1433 = icmp ne i64 %t1435, 0
  br i1 %t1433, label %rt_gc_mark_phase_b221, label %rt_gc_mark_phase_b222
rt_gc_mark_phase_b219:
  br label %rt_gc_mark_phase_b220
rt_gc_mark_phase_b220:
  br label %rt_gc_mark_phase_b217
rt_gc_mark_phase_b221:
  %t1436 = load i64, i64* %var_qcap_ptr
  store i64 %t1436, i64* %reg_575_ptr
  %t1437 = load i64, i64* %reg_575_ptr
  %t1438 = mul i64 %t1437, 2
  store i64 %t1438, i64* %reg_576_ptr
  %t1439 = load i64, i64* %reg_576_ptr
  store i64 %t1439, i64* %var_qcap_ptr
  %t1440 = load i64, i64* %var_qcap_ptr
  store i64 %t1440, i64* %reg_577_ptr
  %t1441 = load i64, i64* %reg_577_ptr
  %t1442 = mul i64 %t1441, 8
  store i64 %t1442, i64* %reg_578_ptr
  %t1443 = load i64, i64* %reg_578_ptr
  %t1444 = call i64 @__sys_pointer_alloc(i64 %t1443)
  store i64 %t1444, i64* %reg_579_ptr
  %t1445 = load i64, i64* %reg_579_ptr
  store i64 %t1445, i64* %var_nq_ptr
  %t1446 = load i64, i64* %var_nq_ptr
  store i64 %t1446, i64* %reg_580_ptr
  %t1447 = load i64, i64* %reg_580_ptr
  %t1448 = icmp ne i64 %t1447, 0
  %t1449 = zext i1 %t1448 to i64
  store i64 %t1449, i64* %reg_581_ptr
  %t1450 = load i64, i64* %reg_581_ptr
  %t1452 = icmp ne i64 %t1450, 0
  %t1453 = zext i1 %t1452 to i64
  %t1451 = icmp ne i64 %t1453, 0
  br i1 %t1451, label %rt_gc_mark_phase_b224, label %rt_gc_mark_phase_b225
rt_gc_mark_phase_b222:
  br label %rt_gc_mark_phase_b223
rt_gc_mark_phase_b223:
  %t1454 = load i64, i64* %var_queue_ptr
  store i64 %t1454, i64* %reg_590_ptr
  %t1455 = load i64, i64* %var_qlen_ptr
  store i64 %t1455, i64* %reg_591_ptr
  %t1456 = load i64, i64* %reg_591_ptr
  %t1457 = mul i64 %t1456, 8
  store i64 %t1457, i64* %reg_592_ptr
  %t1458 = load i64, i64* %reg_590_ptr
  %t1459 = load i64, i64* %reg_592_ptr
  %t1460 = add i64 %t1458, %t1459
  store i64 %t1460, i64* %reg_593_ptr
  %t1461 = load i64, i64* %var_closure_ptr_ptr
  store i64 %t1461, i64* %reg_594_ptr
  %t1462 = load i64, i64* %reg_593_ptr
  %t1463 = load i64, i64* %reg_594_ptr
  %t1464 = inttoptr i64 %t1462 to i64*
  store i64 %t1463, i64* %t1464
  store i64 0, i64* %reg_595_ptr
  %t1465 = load i64, i64* %var_qlen_ptr
  store i64 %t1465, i64* %reg_596_ptr
  %t1466 = load i64, i64* %reg_596_ptr
  %t1467 = add i64 %t1466, 1
  store i64 %t1467, i64* %reg_597_ptr
  %t1468 = load i64, i64* %reg_597_ptr
  store i64 %t1468, i64* %var_qlen_ptr
  br label %rt_gc_mark_phase_b220
rt_gc_mark_phase_b224:
  %t1469 = load i64, i64* %var_nq_ptr
  store i64 %t1469, i64* %reg_582_ptr
  %t1470 = load i64, i64* %var_queue_ptr
  store i64 %t1470, i64* %reg_583_ptr
  %t1471 = load i64, i64* %var_qlen_ptr
  store i64 %t1471, i64* %reg_584_ptr
  %t1472 = load i64, i64* %reg_584_ptr
  %t1473 = mul i64 %t1472, 8
  store i64 %t1473, i64* %reg_585_ptr
  %t1474 = load i64, i64* %reg_582_ptr
  %t1475 = load i64, i64* %reg_583_ptr
  %t1476 = load i64, i64* %reg_585_ptr
  %t1477 = inttoptr i64 %t1474 to i8*
  %t1478 = inttoptr i64 %t1475 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %t1477, i8* %t1478, i64 %t1476, i1 false)
  store i64 0, i64* %reg_586_ptr
  %t1479 = load i64, i64* %var_queue_ptr
  store i64 %t1479, i64* %reg_587_ptr
  %t1480 = load i64, i64* %reg_587_ptr
  %t1481 = call i64 @__sys_pointer_free(i64 %t1480)
  store i64 %t1481, i64* %reg_588_ptr
  %t1482 = load i64, i64* %var_nq_ptr
  store i64 %t1482, i64* %reg_589_ptr
  %t1483 = load i64, i64* %reg_589_ptr
  store i64 %t1483, i64* %var_queue_ptr
  br label %rt_gc_mark_phase_b226
rt_gc_mark_phase_b225:
  br label %rt_gc_mark_phase_b226
rt_gc_mark_phase_b226:
  br label %rt_gc_mark_phase_b223
}

define void @rt_gc_free_object(i64 %arg0) {
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
  %reg_167_ptr = alloca i64
  %reg_168_ptr = alloca i64
  %reg_169_ptr = alloca i64
  %reg_170_ptr = alloca i64
  %reg_171_ptr = alloca i64
  %reg_172_ptr = alloca i64
  %reg_173_ptr = alloca i64
  %reg_174_ptr = alloca i64
  %reg_175_ptr = alloca i64
  %reg_176_ptr = alloca i64
  %reg_177_ptr = alloca i64
  %reg_178_ptr = alloca i64
  %reg_179_ptr = alloca i64
  %reg_180_ptr = alloca i64
  %reg_181_ptr = alloca i64
  %reg_182_ptr = alloca i64
  %var_vtag_ptr = alloca i64
  %var_item_base_ptr = alloca i64
  %var_entry_ptr = alloca i64
  %var_tname_ptr = alloca i64
  %var_vstr_ptr = alloca i64
  %var_stag_ptr = alloca i64
  %var_kind_val_ptr = alloca i64
  %var_p_ptr = alloca i64
  %var_fields_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_nxt_ptr = alloca i64
  %var_etag_ptr = alloca i64
  %var_j_ptr = alloca i64
  %var_istr_ptr = alloca i64
  %var_fnames_ptr = alloca i64
  %var_ml_len_ptr = alloca i64
  %var_itag_ptr = alloca i64
  %var_slot_base_ptr = alloca i64
  %var_sstr_ptr = alloca i64
  %var_mk_ptr = alloca i64
  %var_nslots_ptr = alloca i64
  %var_buckets_ptr = alloca i64
  %var_estr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_node_ptr
  %t1 = load i64, i64* %var_node_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = inttoptr i64 %t2 to i64*
  %t4 = load i64, i64* %t3
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_p_ptr
  %t6 = load i64, i64* %var_node_ptr
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = add i64 %t7, 8
  store i64 %t8, i64* %reg_4_ptr
  %t9 = load i64, i64* %reg_4_ptr
  %t10 = inttoptr i64 %t9 to i64*
  %t11 = load i64, i64* %t10
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  store i64 %t12, i64* %var_mk_ptr
  %t13 = load i64, i64* %var_mk_ptr
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_6_ptr
  %t15 = and i64 %t14, 255
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_7_ptr
  store i64 %t16, i64* %var_kind_val_ptr
  %t17 = load i64, i64* %var_kind_val_ptr
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  %t19 = icmp eq i64 %t18, 0
  %t20 = zext i1 %t19 to i64
  store i64 %t20, i64* %reg_9_ptr
  %t21 = load i64, i64* %reg_9_ptr
  %t23 = icmp ne i64 %t21, 0
  %t24 = zext i1 %t23 to i64
  %t22 = icmp ne i64 %t24, 0
  br i1 %t22, label %rt_gc_free_object_b1, label %rt_gc_free_object_b2
rt_gc_free_object_b1:
  %t25 = load i64, i64* %var_p_ptr
  store i64 %t25, i64* %reg_10_ptr
  %t26 = load i64, i64* %reg_10_ptr
  %t27 = call i64 @__sys_pointer_free(i64 %t26)
  store i64 %t27, i64* %reg_11_ptr
  ret void
rt_gc_free_object_b2:
  br label %rt_gc_free_object_b3
rt_gc_free_object_b3:
  %t28 = load i64, i64* %var_kind_val_ptr
  store i64 %t28, i64* %reg_12_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = icmp eq i64 %t29, 1
  %t31 = zext i1 %t30 to i64
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t34 = icmp ne i64 %t32, 0
  %t35 = zext i1 %t34 to i64
  %t33 = icmp ne i64 %t35, 0
  br i1 %t33, label %rt_gc_free_object_b4, label %rt_gc_free_object_b5
rt_gc_free_object_b4:
  %t36 = load i64, i64* %var_p_ptr
  store i64 %t36, i64* %reg_14_ptr
  %t37 = load i64, i64* %reg_14_ptr
  %t38 = call i64 @__sys_pointer_free(i64 %t37)
  store i64 %t38, i64* %reg_15_ptr
  ret void
rt_gc_free_object_b5:
  br label %rt_gc_free_object_b6
rt_gc_free_object_b6:
  %t39 = load i64, i64* %var_kind_val_ptr
  store i64 %t39, i64* %reg_16_ptr
  %t40 = load i64, i64* %reg_16_ptr
  %t41 = icmp eq i64 %t40, 5
  %t42 = zext i1 %t41 to i64
  store i64 %t42, i64* %reg_17_ptr
  %t43 = load i64, i64* %reg_17_ptr
  %t45 = icmp ne i64 %t43, 0
  %t46 = zext i1 %t45 to i64
  %t44 = icmp ne i64 %t46, 0
  br i1 %t44, label %rt_gc_free_object_b7, label %rt_gc_free_object_b8
rt_gc_free_object_b7:
  %t47 = load i64, i64* %var_p_ptr
  store i64 %t47, i64* %reg_18_ptr
  %t48 = load i64, i64* %reg_18_ptr
  %t49 = call i64 @__sys_pointer_free(i64 %t48)
  store i64 %t49, i64* %reg_19_ptr
  ret void
rt_gc_free_object_b8:
  br label %rt_gc_free_object_b9
rt_gc_free_object_b9:
  %t50 = load i64, i64* %var_kind_val_ptr
  store i64 %t50, i64* %reg_20_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t52 = icmp eq i64 %t51, 8
  %t53 = zext i1 %t52 to i64
  store i64 %t53, i64* %reg_21_ptr
  %t54 = load i64, i64* %reg_21_ptr
  %t56 = icmp ne i64 %t54, 0
  %t57 = zext i1 %t56 to i64
  %t55 = icmp ne i64 %t57, 0
  br i1 %t55, label %rt_gc_free_object_b10, label %rt_gc_free_object_b11
rt_gc_free_object_b10:
  %t58 = load i64, i64* %var_p_ptr
  store i64 %t58, i64* %reg_22_ptr
  %t59 = load i64, i64* %reg_22_ptr
  %t60 = call i64 @__sys_pointer_free(i64 %t59)
  store i64 %t60, i64* %reg_23_ptr
  ret void
rt_gc_free_object_b11:
  br label %rt_gc_free_object_b12
rt_gc_free_object_b12:
  %t61 = load i64, i64* %var_kind_val_ptr
  store i64 %t61, i64* %reg_24_ptr
  %t62 = load i64, i64* %reg_24_ptr
  %t63 = icmp eq i64 %t62, 2
  %t64 = zext i1 %t63 to i64
  store i64 %t64, i64* %reg_25_ptr
  %t65 = load i64, i64* %reg_25_ptr
  %t67 = icmp ne i64 %t65, 0
  %t68 = zext i1 %t67 to i64
  %t66 = icmp ne i64 %t68, 0
  br i1 %t66, label %rt_gc_free_object_b13, label %rt_gc_free_object_b14
rt_gc_free_object_b13:
  %t69 = load i64, i64* %var_p_ptr
  store i64 %t69, i64* %reg_26_ptr
  %t70 = load i64, i64* %reg_26_ptr
  %t71 = add i64 %t70, 24
  store i64 %t71, i64* %reg_27_ptr
  %t72 = load i64, i64* %reg_27_ptr
  %t73 = inttoptr i64 %t72 to i64*
  %t74 = load i64, i64* %t73
  store i64 %t74, i64* %reg_28_ptr
  %t75 = load i64, i64* %reg_28_ptr
  store i64 %t75, i64* %var_entry_ptr
  br label %rt_gc_free_object_b16
rt_gc_free_object_b14:
  br label %rt_gc_free_object_b15
rt_gc_free_object_b15:
  %t76 = load i64, i64* %var_kind_val_ptr
  store i64 %t76, i64* %reg_57_ptr
  %t77 = load i64, i64* %reg_57_ptr
  %t78 = icmp eq i64 %t77, 3
  %t79 = zext i1 %t78 to i64
  store i64 %t79, i64* %reg_58_ptr
  %t80 = load i64, i64* %reg_58_ptr
  %t82 = icmp ne i64 %t80, 0
  %t83 = zext i1 %t82 to i64
  %t81 = icmp ne i64 %t83, 0
  br i1 %t81, label %rt_gc_free_object_b30, label %rt_gc_free_object_b31
rt_gc_free_object_b16:
  %t84 = load i64, i64* %var_entry_ptr
  store i64 %t84, i64* %reg_29_ptr
  %t85 = load i64, i64* %reg_29_ptr
  %t86 = icmp eq i64 %t85, 0
  %t87 = zext i1 %t86 to i64
  store i64 %t87, i64* %reg_30_ptr
  %t88 = load i64, i64* %reg_30_ptr
  %t90 = icmp ne i64 %t88, 0
  %t91 = zext i1 %t90 to i64
  %t89 = icmp ne i64 %t91, 0
  br i1 %t89, label %rt_gc_free_object_b18, label %rt_gc_free_object_b19
rt_gc_free_object_b17:
  %t92 = load i64, i64* %var_p_ptr
  store i64 %t92, i64* %reg_49_ptr
  %t93 = load i64, i64* %reg_49_ptr
  %t94 = inttoptr i64 %t93 to i64*
  %t95 = load i64, i64* %t94
  store i64 %t95, i64* %reg_50_ptr
  %t96 = load i64, i64* %reg_50_ptr
  store i64 %t96, i64* %var_buckets_ptr
  %t97 = load i64, i64* %var_buckets_ptr
  store i64 %t97, i64* %reg_51_ptr
  %t98 = load i64, i64* %reg_51_ptr
  %t99 = icmp ne i64 %t98, 0
  %t100 = zext i1 %t99 to i64
  store i64 %t100, i64* %reg_52_ptr
  %t101 = load i64, i64* %reg_52_ptr
  %t103 = icmp ne i64 %t101, 0
  %t104 = zext i1 %t103 to i64
  %t102 = icmp ne i64 %t104, 0
  br i1 %t102, label %rt_gc_free_object_b27, label %rt_gc_free_object_b28
rt_gc_free_object_b18:
  br label %rt_gc_free_object_b17
rt_gc_free_object_b19:
  br label %rt_gc_free_object_b20
rt_gc_free_object_b20:
  %t105 = load i64, i64* %var_entry_ptr
  store i64 %t105, i64* %reg_31_ptr
  %t106 = load i64, i64* %reg_31_ptr
  %t107 = add i64 %t106, 32
  store i64 %t107, i64* %reg_32_ptr
  %t108 = load i64, i64* %reg_32_ptr
  %t109 = inttoptr i64 %t108 to i64*
  %t110 = load i64, i64* %t109
  store i64 %t110, i64* %reg_33_ptr
  %t111 = load i64, i64* %reg_33_ptr
  store i64 %t111, i64* %var_nxt_ptr
  %t112 = load i64, i64* %var_entry_ptr
  store i64 %t112, i64* %reg_34_ptr
  %t113 = load i64, i64* %reg_34_ptr
  %t114 = add i64 %t113, 8
  store i64 %t114, i64* %reg_35_ptr
  %t115 = load i64, i64* %reg_35_ptr
  %t116 = inttoptr i64 %t115 to i64*
  %t117 = load i64, i64* %t116
  store i64 %t117, i64* %reg_36_ptr
  %t118 = load i64, i64* %reg_36_ptr
  store i64 %t118, i64* %var_etag_ptr
  %t119 = load i64, i64* %var_etag_ptr
  store i64 %t119, i64* %reg_37_ptr
  %t120 = load i64, i64* %reg_37_ptr
  %t121 = icmp eq i64 %t120, 1
  %t122 = zext i1 %t121 to i64
  store i64 %t122, i64* %reg_38_ptr
  %t123 = load i64, i64* %reg_38_ptr
  %t125 = icmp ne i64 %t123, 0
  %t126 = zext i1 %t125 to i64
  %t124 = icmp ne i64 %t126, 0
  br i1 %t124, label %rt_gc_free_object_b21, label %rt_gc_free_object_b22
rt_gc_free_object_b21:
  %t127 = load i64, i64* %var_entry_ptr
  store i64 %t127, i64* %reg_39_ptr
  %t128 = load i64, i64* %reg_39_ptr
  %t129 = add i64 %t128, 16
  store i64 %t129, i64* %reg_40_ptr
  %t130 = load i64, i64* %reg_40_ptr
  %t131 = inttoptr i64 %t130 to i64*
  %t132 = load i64, i64* %t131
  store i64 %t132, i64* %reg_41_ptr
  %t133 = load i64, i64* %reg_41_ptr
  store i64 %t133, i64* %var_estr_ptr
  %t134 = load i64, i64* %var_estr_ptr
  store i64 %t134, i64* %reg_42_ptr
  %t135 = load i64, i64* %reg_42_ptr
  %t136 = icmp ne i64 %t135, 0
  %t137 = zext i1 %t136 to i64
  store i64 %t137, i64* %reg_43_ptr
  %t138 = load i64, i64* %reg_43_ptr
  %t140 = icmp ne i64 %t138, 0
  %t141 = zext i1 %t140 to i64
  %t139 = icmp ne i64 %t141, 0
  br i1 %t139, label %rt_gc_free_object_b24, label %rt_gc_free_object_b25
rt_gc_free_object_b22:
  br label %rt_gc_free_object_b23
rt_gc_free_object_b23:
  %t142 = load i64, i64* %var_entry_ptr
  store i64 %t142, i64* %reg_46_ptr
  %t143 = load i64, i64* %reg_46_ptr
  %t144 = call i64 @__sys_pointer_free(i64 %t143)
  store i64 %t144, i64* %reg_47_ptr
  %t145 = load i64, i64* %var_nxt_ptr
  store i64 %t145, i64* %reg_48_ptr
  %t146 = load i64, i64* %reg_48_ptr
  store i64 %t146, i64* %var_entry_ptr
  br label %rt_gc_free_object_b16
rt_gc_free_object_b24:
  %t147 = load i64, i64* %var_estr_ptr
  store i64 %t147, i64* %reg_44_ptr
  %t148 = load i64, i64* %reg_44_ptr
  %t149 = call i64 @__sys_pointer_free(i64 %t148)
  store i64 %t149, i64* %reg_45_ptr
  br label %rt_gc_free_object_b26
rt_gc_free_object_b25:
  br label %rt_gc_free_object_b26
rt_gc_free_object_b26:
  br label %rt_gc_free_object_b23
rt_gc_free_object_b27:
  %t150 = load i64, i64* %var_buckets_ptr
  store i64 %t150, i64* %reg_53_ptr
  %t151 = load i64, i64* %reg_53_ptr
  %t152 = call i64 @__sys_pointer_free(i64 %t151)
  store i64 %t152, i64* %reg_54_ptr
  br label %rt_gc_free_object_b29
rt_gc_free_object_b28:
  br label %rt_gc_free_object_b29
rt_gc_free_object_b29:
  %t153 = load i64, i64* %var_p_ptr
  store i64 %t153, i64* %reg_55_ptr
  %t154 = load i64, i64* %reg_55_ptr
  %t155 = call i64 @__sys_pointer_free(i64 %t154)
  store i64 %t155, i64* %reg_56_ptr
  ret void
rt_gc_free_object_b30:
  %t156 = load i64, i64* %var_p_ptr
  store i64 %t156, i64* %reg_59_ptr
  %t157 = load i64, i64* %reg_59_ptr
  %t158 = add i64 %t157, 8
  store i64 %t158, i64* %reg_60_ptr
  %t159 = load i64, i64* %reg_60_ptr
  %t160 = inttoptr i64 %t159 to i64*
  %t161 = load i64, i64* %t160
  store i64 %t161, i64* %reg_61_ptr
  %t162 = load i64, i64* %reg_61_ptr
  store i64 %t162, i64* %var_tname_ptr
  %t163 = load i64, i64* %var_tname_ptr
  store i64 %t163, i64* %reg_62_ptr
  %t164 = load i64, i64* %reg_62_ptr
  %t165 = icmp ne i64 %t164, 0
  %t166 = zext i1 %t165 to i64
  store i64 %t166, i64* %reg_63_ptr
  %t167 = load i64, i64* %reg_63_ptr
  %t169 = icmp ne i64 %t167, 0
  %t170 = zext i1 %t169 to i64
  %t168 = icmp ne i64 %t170, 0
  br i1 %t168, label %rt_gc_free_object_b33, label %rt_gc_free_object_b34
rt_gc_free_object_b31:
  br label %rt_gc_free_object_b32
rt_gc_free_object_b32:
  %t171 = load i64, i64* %var_kind_val_ptr
  store i64 %t171, i64* %reg_104_ptr
  %t172 = load i64, i64* %reg_104_ptr
  %t173 = icmp eq i64 %t172, 4
  %t174 = zext i1 %t173 to i64
  store i64 %t174, i64* %reg_105_ptr
  %t175 = load i64, i64* %reg_105_ptr
  %t177 = icmp ne i64 %t175, 0
  %t178 = zext i1 %t177 to i64
  %t176 = icmp ne i64 %t178, 0
  br i1 %t176, label %rt_gc_free_object_b53, label %rt_gc_free_object_b54
rt_gc_free_object_b33:
  %t179 = load i64, i64* %var_tname_ptr
  store i64 %t179, i64* %reg_64_ptr
  %t180 = load i64, i64* %reg_64_ptr
  %t181 = call i64 @__sys_pointer_free(i64 %t180)
  store i64 %t181, i64* %reg_65_ptr
  br label %rt_gc_free_object_b35
rt_gc_free_object_b34:
  br label %rt_gc_free_object_b35
rt_gc_free_object_b35:
  %t182 = load i64, i64* %var_p_ptr
  store i64 %t182, i64* %reg_66_ptr
  %t183 = load i64, i64* %reg_66_ptr
  %t184 = add i64 %t183, 16
  store i64 %t184, i64* %reg_67_ptr
  %t185 = load i64, i64* %reg_67_ptr
  %t186 = inttoptr i64 %t185 to i64*
  %t187 = load i64, i64* %t186
  store i64 %t187, i64* %reg_68_ptr
  %t188 = load i64, i64* %reg_68_ptr
  store i64 %t188, i64* %var_fields_ptr
  %t189 = load i64, i64* %var_fields_ptr
  store i64 %t189, i64* %reg_69_ptr
  %t190 = load i64, i64* %reg_69_ptr
  %t191 = icmp ne i64 %t190, 0
  %t192 = zext i1 %t191 to i64
  store i64 %t192, i64* %reg_70_ptr
  %t193 = load i64, i64* %reg_70_ptr
  %t195 = icmp ne i64 %t193, 0
  %t196 = zext i1 %t195 to i64
  %t194 = icmp ne i64 %t196, 0
  br i1 %t194, label %rt_gc_free_object_b36, label %rt_gc_free_object_b37
rt_gc_free_object_b36:
  %t197 = load i64, i64* %var_fields_ptr
  store i64 %t197, i64* %reg_71_ptr
  %t198 = load i64, i64* %reg_71_ptr
  %t199 = add i64 %t198, 24
  store i64 %t199, i64* %reg_72_ptr
  %t200 = load i64, i64* %reg_72_ptr
  %t201 = inttoptr i64 %t200 to i64*
  %t202 = load i64, i64* %t201
  store i64 %t202, i64* %reg_73_ptr
  %t203 = load i64, i64* %reg_73_ptr
  store i64 %t203, i64* %var_entry_ptr
  br label %rt_gc_free_object_b39
rt_gc_free_object_b37:
  br label %rt_gc_free_object_b38
rt_gc_free_object_b38:
  %t204 = load i64, i64* %var_p_ptr
  store i64 %t204, i64* %reg_102_ptr
  %t205 = load i64, i64* %reg_102_ptr
  %t206 = call i64 @__sys_pointer_free(i64 %t205)
  store i64 %t206, i64* %reg_103_ptr
  ret void
rt_gc_free_object_b39:
  %t207 = load i64, i64* %var_entry_ptr
  store i64 %t207, i64* %reg_74_ptr
  %t208 = load i64, i64* %reg_74_ptr
  %t209 = icmp eq i64 %t208, 0
  %t210 = zext i1 %t209 to i64
  store i64 %t210, i64* %reg_75_ptr
  %t211 = load i64, i64* %reg_75_ptr
  %t213 = icmp ne i64 %t211, 0
  %t214 = zext i1 %t213 to i64
  %t212 = icmp ne i64 %t214, 0
  br i1 %t212, label %rt_gc_free_object_b41, label %rt_gc_free_object_b42
rt_gc_free_object_b40:
  %t215 = load i64, i64* %var_fields_ptr
  store i64 %t215, i64* %reg_94_ptr
  %t216 = load i64, i64* %reg_94_ptr
  %t217 = inttoptr i64 %t216 to i64*
  %t218 = load i64, i64* %t217
  store i64 %t218, i64* %reg_95_ptr
  %t219 = load i64, i64* %reg_95_ptr
  store i64 %t219, i64* %var_buckets_ptr
  %t220 = load i64, i64* %var_buckets_ptr
  store i64 %t220, i64* %reg_96_ptr
  %t221 = load i64, i64* %reg_96_ptr
  %t222 = icmp ne i64 %t221, 0
  %t223 = zext i1 %t222 to i64
  store i64 %t223, i64* %reg_97_ptr
  %t224 = load i64, i64* %reg_97_ptr
  %t226 = icmp ne i64 %t224, 0
  %t227 = zext i1 %t226 to i64
  %t225 = icmp ne i64 %t227, 0
  br i1 %t225, label %rt_gc_free_object_b50, label %rt_gc_free_object_b51
rt_gc_free_object_b41:
  br label %rt_gc_free_object_b40
rt_gc_free_object_b42:
  br label %rt_gc_free_object_b43
rt_gc_free_object_b43:
  %t228 = load i64, i64* %var_entry_ptr
  store i64 %t228, i64* %reg_76_ptr
  %t229 = load i64, i64* %reg_76_ptr
  %t230 = add i64 %t229, 32
  store i64 %t230, i64* %reg_77_ptr
  %t231 = load i64, i64* %reg_77_ptr
  %t232 = inttoptr i64 %t231 to i64*
  %t233 = load i64, i64* %t232
  store i64 %t233, i64* %reg_78_ptr
  %t234 = load i64, i64* %reg_78_ptr
  store i64 %t234, i64* %var_nxt_ptr
  %t235 = load i64, i64* %var_entry_ptr
  store i64 %t235, i64* %reg_79_ptr
  %t236 = load i64, i64* %reg_79_ptr
  %t237 = add i64 %t236, 8
  store i64 %t237, i64* %reg_80_ptr
  %t238 = load i64, i64* %reg_80_ptr
  %t239 = inttoptr i64 %t238 to i64*
  %t240 = load i64, i64* %t239
  store i64 %t240, i64* %reg_81_ptr
  %t241 = load i64, i64* %reg_81_ptr
  store i64 %t241, i64* %var_etag_ptr
  %t242 = load i64, i64* %var_etag_ptr
  store i64 %t242, i64* %reg_82_ptr
  %t243 = load i64, i64* %reg_82_ptr
  %t244 = icmp eq i64 %t243, 1
  %t245 = zext i1 %t244 to i64
  store i64 %t245, i64* %reg_83_ptr
  %t246 = load i64, i64* %reg_83_ptr
  %t248 = icmp ne i64 %t246, 0
  %t249 = zext i1 %t248 to i64
  %t247 = icmp ne i64 %t249, 0
  br i1 %t247, label %rt_gc_free_object_b44, label %rt_gc_free_object_b45
rt_gc_free_object_b44:
  %t250 = load i64, i64* %var_entry_ptr
  store i64 %t250, i64* %reg_84_ptr
  %t251 = load i64, i64* %reg_84_ptr
  %t252 = add i64 %t251, 16
  store i64 %t252, i64* %reg_85_ptr
  %t253 = load i64, i64* %reg_85_ptr
  %t254 = inttoptr i64 %t253 to i64*
  %t255 = load i64, i64* %t254
  store i64 %t255, i64* %reg_86_ptr
  %t256 = load i64, i64* %reg_86_ptr
  store i64 %t256, i64* %var_estr_ptr
  %t257 = load i64, i64* %var_estr_ptr
  store i64 %t257, i64* %reg_87_ptr
  %t258 = load i64, i64* %reg_87_ptr
  %t259 = icmp ne i64 %t258, 0
  %t260 = zext i1 %t259 to i64
  store i64 %t260, i64* %reg_88_ptr
  %t261 = load i64, i64* %reg_88_ptr
  %t263 = icmp ne i64 %t261, 0
  %t264 = zext i1 %t263 to i64
  %t262 = icmp ne i64 %t264, 0
  br i1 %t262, label %rt_gc_free_object_b47, label %rt_gc_free_object_b48
rt_gc_free_object_b45:
  br label %rt_gc_free_object_b46
rt_gc_free_object_b46:
  %t265 = load i64, i64* %var_entry_ptr
  store i64 %t265, i64* %reg_91_ptr
  %t266 = load i64, i64* %reg_91_ptr
  %t267 = call i64 @__sys_pointer_free(i64 %t266)
  store i64 %t267, i64* %reg_92_ptr
  %t268 = load i64, i64* %var_nxt_ptr
  store i64 %t268, i64* %reg_93_ptr
  %t269 = load i64, i64* %reg_93_ptr
  store i64 %t269, i64* %var_entry_ptr
  br label %rt_gc_free_object_b39
rt_gc_free_object_b47:
  %t270 = load i64, i64* %var_estr_ptr
  store i64 %t270, i64* %reg_89_ptr
  %t271 = load i64, i64* %reg_89_ptr
  %t272 = call i64 @__sys_pointer_free(i64 %t271)
  store i64 %t272, i64* %reg_90_ptr
  br label %rt_gc_free_object_b49
rt_gc_free_object_b48:
  br label %rt_gc_free_object_b49
rt_gc_free_object_b49:
  br label %rt_gc_free_object_b46
rt_gc_free_object_b50:
  %t273 = load i64, i64* %var_buckets_ptr
  store i64 %t273, i64* %reg_98_ptr
  %t274 = load i64, i64* %reg_98_ptr
  %t275 = call i64 @__sys_pointer_free(i64 %t274)
  store i64 %t275, i64* %reg_99_ptr
  br label %rt_gc_free_object_b52
rt_gc_free_object_b51:
  br label %rt_gc_free_object_b52
rt_gc_free_object_b52:
  %t276 = load i64, i64* %var_fields_ptr
  store i64 %t276, i64* %reg_100_ptr
  %t277 = load i64, i64* %reg_100_ptr
  %t278 = call i64 @__sys_pointer_free(i64 %t277)
  store i64 %t278, i64* %reg_101_ptr
  br label %rt_gc_free_object_b38
rt_gc_free_object_b53:
  %t279 = load i64, i64* %var_p_ptr
  store i64 %t279, i64* %reg_106_ptr
  %t280 = load i64, i64* %reg_106_ptr
  %t281 = inttoptr i64 %t280 to i64*
  %t282 = load i64, i64* %t281
  store i64 %t282, i64* %reg_107_ptr
  %t283 = load i64, i64* %reg_107_ptr
  store i64 %t283, i64* %var_ml_len_ptr
  store i64 0, i64* %var_j_ptr
  br label %rt_gc_free_object_b56
rt_gc_free_object_b54:
  br label %rt_gc_free_object_b55
rt_gc_free_object_b55:
  %t284 = load i64, i64* %var_kind_val_ptr
  store i64 %t284, i64* %reg_131_ptr
  %t285 = load i64, i64* %reg_131_ptr
  %t286 = icmp eq i64 %t285, 6
  %t287 = zext i1 %t286 to i64
  store i64 %t287, i64* %reg_132_ptr
  %t288 = load i64, i64* %reg_132_ptr
  %t290 = icmp ne i64 %t288, 0
  %t291 = zext i1 %t290 to i64
  %t289 = icmp ne i64 %t291, 0
  br i1 %t289, label %rt_gc_free_object_b67, label %rt_gc_free_object_b68
rt_gc_free_object_b56:
  %t292 = load i64, i64* %var_j_ptr
  store i64 %t292, i64* %reg_108_ptr
  %t293 = load i64, i64* %var_ml_len_ptr
  store i64 %t293, i64* %reg_109_ptr
  %t294 = load i64, i64* %reg_108_ptr
  %t295 = load i64, i64* %reg_109_ptr
  %t296 = icmp sge i64 %t294, %t295
  %t297 = zext i1 %t296 to i64
  store i64 %t297, i64* %reg_110_ptr
  %t298 = load i64, i64* %reg_110_ptr
  %t300 = icmp ne i64 %t298, 0
  %t301 = zext i1 %t300 to i64
  %t299 = icmp ne i64 %t301, 0
  br i1 %t299, label %rt_gc_free_object_b58, label %rt_gc_free_object_b59
rt_gc_free_object_b57:
  %t302 = load i64, i64* %var_p_ptr
  store i64 %t302, i64* %reg_129_ptr
  %t303 = load i64, i64* %reg_129_ptr
  %t304 = call i64 @__sys_pointer_free(i64 %t303)
  store i64 %t304, i64* %reg_130_ptr
  ret void
rt_gc_free_object_b58:
  br label %rt_gc_free_object_b57
rt_gc_free_object_b59:
  br label %rt_gc_free_object_b60
rt_gc_free_object_b60:
  %t305 = load i64, i64* %var_p_ptr
  store i64 %t305, i64* %reg_111_ptr
  %t306 = load i64, i64* %reg_111_ptr
  %t307 = add i64 %t306, 16
  store i64 %t307, i64* %reg_112_ptr
  %t308 = load i64, i64* %var_j_ptr
  store i64 %t308, i64* %reg_113_ptr
  %t309 = load i64, i64* %reg_113_ptr
  %t310 = mul i64 %t309, 16
  store i64 %t310, i64* %reg_114_ptr
  %t311 = load i64, i64* %reg_112_ptr
  %t312 = load i64, i64* %reg_114_ptr
  %t313 = add i64 %t311, %t312
  store i64 %t313, i64* %reg_115_ptr
  %t314 = load i64, i64* %reg_115_ptr
  store i64 %t314, i64* %var_item_base_ptr
  %t315 = load i64, i64* %var_item_base_ptr
  store i64 %t315, i64* %reg_116_ptr
  %t316 = load i64, i64* %reg_116_ptr
  %t317 = inttoptr i64 %t316 to i64*
  %t318 = load i64, i64* %t317
  store i64 %t318, i64* %reg_117_ptr
  %t319 = load i64, i64* %reg_117_ptr
  store i64 %t319, i64* %var_itag_ptr
  %t320 = load i64, i64* %var_itag_ptr
  store i64 %t320, i64* %reg_118_ptr
  %t321 = load i64, i64* %reg_118_ptr
  %t322 = icmp eq i64 %t321, 1
  %t323 = zext i1 %t322 to i64
  store i64 %t323, i64* %reg_119_ptr
  %t324 = load i64, i64* %reg_119_ptr
  %t326 = icmp ne i64 %t324, 0
  %t327 = zext i1 %t326 to i64
  %t325 = icmp ne i64 %t327, 0
  br i1 %t325, label %rt_gc_free_object_b61, label %rt_gc_free_object_b62
rt_gc_free_object_b61:
  %t328 = load i64, i64* %var_item_base_ptr
  store i64 %t328, i64* %reg_120_ptr
  %t329 = load i64, i64* %reg_120_ptr
  %t330 = add i64 %t329, 8
  store i64 %t330, i64* %reg_121_ptr
  %t331 = load i64, i64* %reg_121_ptr
  %t332 = inttoptr i64 %t331 to i64*
  %t333 = load i64, i64* %t332
  store i64 %t333, i64* %reg_122_ptr
  %t334 = load i64, i64* %reg_122_ptr
  store i64 %t334, i64* %var_istr_ptr
  %t335 = load i64, i64* %var_istr_ptr
  store i64 %t335, i64* %reg_123_ptr
  %t336 = load i64, i64* %reg_123_ptr
  %t337 = icmp ne i64 %t336, 0
  %t338 = zext i1 %t337 to i64
  store i64 %t338, i64* %reg_124_ptr
  %t339 = load i64, i64* %reg_124_ptr
  %t341 = icmp ne i64 %t339, 0
  %t342 = zext i1 %t341 to i64
  %t340 = icmp ne i64 %t342, 0
  br i1 %t340, label %rt_gc_free_object_b64, label %rt_gc_free_object_b65
rt_gc_free_object_b62:
  br label %rt_gc_free_object_b63
rt_gc_free_object_b63:
  %t343 = load i64, i64* %var_j_ptr
  store i64 %t343, i64* %reg_127_ptr
  %t344 = load i64, i64* %reg_127_ptr
  %t345 = add i64 %t344, 1
  store i64 %t345, i64* %reg_128_ptr
  %t346 = load i64, i64* %reg_128_ptr
  store i64 %t346, i64* %var_j_ptr
  br label %rt_gc_free_object_b56
rt_gc_free_object_b64:
  %t347 = load i64, i64* %var_istr_ptr
  store i64 %t347, i64* %reg_125_ptr
  %t348 = load i64, i64* %reg_125_ptr
  %t349 = call i64 @__sys_pointer_free(i64 %t348)
  store i64 %t349, i64* %reg_126_ptr
  br label %rt_gc_free_object_b66
rt_gc_free_object_b65:
  br label %rt_gc_free_object_b66
rt_gc_free_object_b66:
  br label %rt_gc_free_object_b63
rt_gc_free_object_b67:
  %t350 = load i64, i64* %var_p_ptr
  store i64 %t350, i64* %reg_133_ptr
  %t351 = load i64, i64* %reg_133_ptr
  %t352 = inttoptr i64 %t351 to i64*
  %t353 = load i64, i64* %t352
  store i64 %t353, i64* %reg_134_ptr
  %t354 = load i64, i64* %reg_134_ptr
  store i64 %t354, i64* %var_vtag_ptr
  %t355 = load i64, i64* %var_vtag_ptr
  store i64 %t355, i64* %reg_135_ptr
  %t356 = load i64, i64* %reg_135_ptr
  %t357 = icmp eq i64 %t356, 1
  %t358 = zext i1 %t357 to i64
  store i64 %t358, i64* %reg_136_ptr
  %t359 = load i64, i64* %reg_136_ptr
  %t361 = icmp ne i64 %t359, 0
  %t362 = zext i1 %t361 to i64
  %t360 = icmp ne i64 %t362, 0
  br i1 %t360, label %rt_gc_free_object_b70, label %rt_gc_free_object_b71
rt_gc_free_object_b68:
  br label %rt_gc_free_object_b69
rt_gc_free_object_b69:
  %t363 = load i64, i64* %var_kind_val_ptr
  store i64 %t363, i64* %reg_146_ptr
  %t364 = load i64, i64* %reg_146_ptr
  %t365 = icmp eq i64 %t364, 9
  %t366 = zext i1 %t365 to i64
  store i64 %t366, i64* %reg_147_ptr
  %t367 = load i64, i64* %reg_147_ptr
  %t369 = icmp ne i64 %t367, 0
  %t370 = zext i1 %t369 to i64
  %t368 = icmp ne i64 %t370, 0
  br i1 %t368, label %rt_gc_free_object_b76, label %rt_gc_free_object_b77
rt_gc_free_object_b70:
  %t371 = load i64, i64* %var_p_ptr
  store i64 %t371, i64* %reg_137_ptr
  %t372 = load i64, i64* %reg_137_ptr
  %t373 = add i64 %t372, 8
  store i64 %t373, i64* %reg_138_ptr
  %t374 = load i64, i64* %reg_138_ptr
  %t375 = inttoptr i64 %t374 to i64*
  %t376 = load i64, i64* %t375
  store i64 %t376, i64* %reg_139_ptr
  %t377 = load i64, i64* %reg_139_ptr
  store i64 %t377, i64* %var_vstr_ptr
  %t378 = load i64, i64* %var_vstr_ptr
  store i64 %t378, i64* %reg_140_ptr
  %t379 = load i64, i64* %reg_140_ptr
  %t380 = icmp ne i64 %t379, 0
  %t381 = zext i1 %t380 to i64
  store i64 %t381, i64* %reg_141_ptr
  %t382 = load i64, i64* %reg_141_ptr
  %t384 = icmp ne i64 %t382, 0
  %t385 = zext i1 %t384 to i64
  %t383 = icmp ne i64 %t385, 0
  br i1 %t383, label %rt_gc_free_object_b73, label %rt_gc_free_object_b74
rt_gc_free_object_b71:
  br label %rt_gc_free_object_b72
rt_gc_free_object_b72:
  %t386 = load i64, i64* %var_p_ptr
  store i64 %t386, i64* %reg_144_ptr
  %t387 = load i64, i64* %reg_144_ptr
  %t388 = call i64 @__sys_pointer_free(i64 %t387)
  store i64 %t388, i64* %reg_145_ptr
  ret void
rt_gc_free_object_b73:
  %t389 = load i64, i64* %var_vstr_ptr
  store i64 %t389, i64* %reg_142_ptr
  %t390 = load i64, i64* %reg_142_ptr
  %t391 = call i64 @__sys_pointer_free(i64 %t390)
  store i64 %t391, i64* %reg_143_ptr
  br label %rt_gc_free_object_b75
rt_gc_free_object_b74:
  br label %rt_gc_free_object_b75
rt_gc_free_object_b75:
  br label %rt_gc_free_object_b72
rt_gc_free_object_b76:
  %t392 = load i64, i64* %var_p_ptr
  store i64 %t392, i64* %reg_148_ptr
  %t393 = load i64, i64* %reg_148_ptr
  %t394 = add i64 %t393, 24
  store i64 %t394, i64* %reg_149_ptr
  %t395 = load i64, i64* %reg_149_ptr
  %t396 = inttoptr i64 %t395 to i64*
  %t397 = load i64, i64* %t396
  store i64 %t397, i64* %reg_150_ptr
  %t398 = load i64, i64* %reg_150_ptr
  store i64 %t398, i64* %var_fnames_ptr
  %t399 = load i64, i64* %var_fnames_ptr
  store i64 %t399, i64* %reg_151_ptr
  %t400 = load i64, i64* %reg_151_ptr
  %t401 = icmp ne i64 %t400, 0
  %t402 = zext i1 %t401 to i64
  store i64 %t402, i64* %reg_152_ptr
  %t403 = load i64, i64* %reg_152_ptr
  %t405 = icmp ne i64 %t403, 0
  %t406 = zext i1 %t405 to i64
  %t404 = icmp ne i64 %t406, 0
  br i1 %t404, label %rt_gc_free_object_b79, label %rt_gc_free_object_b80
rt_gc_free_object_b77:
  br label %rt_gc_free_object_b78
rt_gc_free_object_b78:
  %t407 = load i64, i64* %var_p_ptr
  store i64 %t407, i64* %reg_181_ptr
  %t408 = load i64, i64* %reg_181_ptr
  %t409 = call i64 @__sys_pointer_free(i64 %t408)
  store i64 %t409, i64* %reg_182_ptr
  ret void
rt_gc_free_object_b79:
  %t410 = load i64, i64* %var_fnames_ptr
  store i64 %t410, i64* %reg_153_ptr
  %t411 = load i64, i64* %reg_153_ptr
  %t412 = call i64 @__sys_pointer_free(i64 %t411)
  store i64 %t412, i64* %reg_154_ptr
  br label %rt_gc_free_object_b81
rt_gc_free_object_b80:
  br label %rt_gc_free_object_b81
rt_gc_free_object_b81:
  %t413 = load i64, i64* %var_p_ptr
  store i64 %t413, i64* %reg_155_ptr
  %t414 = load i64, i64* %reg_155_ptr
  %t415 = add i64 %t414, 16
  store i64 %t415, i64* %reg_156_ptr
  %t416 = load i64, i64* %reg_156_ptr
  %t417 = inttoptr i64 %t416 to i32*
  %t418 = load i32, i32* %t417
  %t419 = zext i32 %t418 to i64
  store i64 %t419, i64* %reg_157_ptr
  %t420 = load i64, i64* %reg_157_ptr
  store i64 %t420, i64* %var_nslots_ptr
  store i64 0, i64* %var_j_ptr
  br label %rt_gc_free_object_b82
rt_gc_free_object_b82:
  %t421 = load i64, i64* %var_j_ptr
  store i64 %t421, i64* %reg_158_ptr
  %t422 = load i64, i64* %var_nslots_ptr
  store i64 %t422, i64* %reg_159_ptr
  %t423 = load i64, i64* %reg_158_ptr
  %t424 = load i64, i64* %reg_159_ptr
  %t425 = icmp sge i64 %t423, %t424
  %t426 = zext i1 %t425 to i64
  store i64 %t426, i64* %reg_160_ptr
  %t427 = load i64, i64* %reg_160_ptr
  %t429 = icmp ne i64 %t427, 0
  %t430 = zext i1 %t429 to i64
  %t428 = icmp ne i64 %t430, 0
  br i1 %t428, label %rt_gc_free_object_b84, label %rt_gc_free_object_b85
rt_gc_free_object_b83:
  %t431 = load i64, i64* %var_p_ptr
  store i64 %t431, i64* %reg_179_ptr
  %t432 = load i64, i64* %reg_179_ptr
  %t433 = call i64 @__sys_pointer_free(i64 %t432)
  store i64 %t433, i64* %reg_180_ptr
  ret void
rt_gc_free_object_b84:
  br label %rt_gc_free_object_b83
rt_gc_free_object_b85:
  br label %rt_gc_free_object_b86
rt_gc_free_object_b86:
  %t434 = load i64, i64* %var_p_ptr
  store i64 %t434, i64* %reg_161_ptr
  %t435 = load i64, i64* %reg_161_ptr
  %t436 = add i64 %t435, 32
  store i64 %t436, i64* %reg_162_ptr
  %t437 = load i64, i64* %var_j_ptr
  store i64 %t437, i64* %reg_163_ptr
  %t438 = load i64, i64* %reg_163_ptr
  %t439 = mul i64 %t438, 16
  store i64 %t439, i64* %reg_164_ptr
  %t440 = load i64, i64* %reg_162_ptr
  %t441 = load i64, i64* %reg_164_ptr
  %t442 = add i64 %t440, %t441
  store i64 %t442, i64* %reg_165_ptr
  %t443 = load i64, i64* %reg_165_ptr
  store i64 %t443, i64* %var_slot_base_ptr
  %t444 = load i64, i64* %var_slot_base_ptr
  store i64 %t444, i64* %reg_166_ptr
  %t445 = load i64, i64* %reg_166_ptr
  %t446 = inttoptr i64 %t445 to i64*
  %t447 = load i64, i64* %t446
  store i64 %t447, i64* %reg_167_ptr
  %t448 = load i64, i64* %reg_167_ptr
  store i64 %t448, i64* %var_stag_ptr
  %t449 = load i64, i64* %var_stag_ptr
  store i64 %t449, i64* %reg_168_ptr
  %t450 = load i64, i64* %reg_168_ptr
  %t451 = icmp eq i64 %t450, 1
  %t452 = zext i1 %t451 to i64
  store i64 %t452, i64* %reg_169_ptr
  %t453 = load i64, i64* %reg_169_ptr
  %t455 = icmp ne i64 %t453, 0
  %t456 = zext i1 %t455 to i64
  %t454 = icmp ne i64 %t456, 0
  br i1 %t454, label %rt_gc_free_object_b87, label %rt_gc_free_object_b88
rt_gc_free_object_b87:
  %t457 = load i64, i64* %var_slot_base_ptr
  store i64 %t457, i64* %reg_170_ptr
  %t458 = load i64, i64* %reg_170_ptr
  %t459 = add i64 %t458, 8
  store i64 %t459, i64* %reg_171_ptr
  %t460 = load i64, i64* %reg_171_ptr
  %t461 = inttoptr i64 %t460 to i64*
  %t462 = load i64, i64* %t461
  store i64 %t462, i64* %reg_172_ptr
  %t463 = load i64, i64* %reg_172_ptr
  store i64 %t463, i64* %var_sstr_ptr
  %t464 = load i64, i64* %var_sstr_ptr
  store i64 %t464, i64* %reg_173_ptr
  %t465 = load i64, i64* %reg_173_ptr
  %t466 = icmp ne i64 %t465, 0
  %t467 = zext i1 %t466 to i64
  store i64 %t467, i64* %reg_174_ptr
  %t468 = load i64, i64* %reg_174_ptr
  %t470 = icmp ne i64 %t468, 0
  %t471 = zext i1 %t470 to i64
  %t469 = icmp ne i64 %t471, 0
  br i1 %t469, label %rt_gc_free_object_b90, label %rt_gc_free_object_b91
rt_gc_free_object_b88:
  br label %rt_gc_free_object_b89
rt_gc_free_object_b89:
  %t472 = load i64, i64* %var_j_ptr
  store i64 %t472, i64* %reg_177_ptr
  %t473 = load i64, i64* %reg_177_ptr
  %t474 = add i64 %t473, 1
  store i64 %t474, i64* %reg_178_ptr
  %t475 = load i64, i64* %reg_178_ptr
  store i64 %t475, i64* %var_j_ptr
  br label %rt_gc_free_object_b82
rt_gc_free_object_b90:
  %t476 = load i64, i64* %var_sstr_ptr
  store i64 %t476, i64* %reg_175_ptr
  %t477 = load i64, i64* %reg_175_ptr
  %t478 = call i64 @__sys_pointer_free(i64 %t477)
  store i64 %t478, i64* %reg_176_ptr
  br label %rt_gc_free_object_b92
rt_gc_free_object_b91:
  br label %rt_gc_free_object_b92
rt_gc_free_object_b92:
  br label %rt_gc_free_object_b89
}

define void @rt_gc_collect(i64 %arg0) {
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
  %var_prev_addr_ptr = alloca i64
  %var_curr_ptr = alloca i64
  %var_mark_val_ptr = alloca i64
  %var_mk_ptr = alloca i64
  %var_ac_ptr = alloca i64
  %var_nxt_ptr = alloca i64
  %var_kind_val_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = call i64 @rt_gc_mark_phase(i64 %t2)
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %var_ctx_ptr
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  store i64 %t5, i64* %var_prev_addr_ptr
  %t6 = load i64, i64* %var_ctx_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i64*
  %t9 = load i64, i64* %t8
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_curr_ptr
  br label %rt_gc_collect_b1
rt_gc_collect_b1:
  %t11 = load i64, i64* %var_curr_ptr
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = icmp eq i64 %t12, 0
  %t14 = zext i1 %t13 to i64
  store i64 %t14, i64* %reg_7_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t17 = icmp ne i64 %t15, 0
  %t18 = zext i1 %t17 to i64
  %t16 = icmp ne i64 %t18, 0
  br i1 %t16, label %rt_gc_collect_b3, label %rt_gc_collect_b4
rt_gc_collect_b2:
  ret void
rt_gc_collect_b3:
  br label %rt_gc_collect_b2
rt_gc_collect_b4:
  br label %rt_gc_collect_b5
rt_gc_collect_b5:
  %t19 = load i64, i64* %var_curr_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = add i64 %t20, 8
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t23 = inttoptr i64 %t22 to i64*
  %t24 = load i64, i64* %t23
  store i64 %t24, i64* %reg_10_ptr
  %t25 = load i64, i64* %reg_10_ptr
  store i64 %t25, i64* %var_mk_ptr
  %t26 = load i64, i64* %var_mk_ptr
  store i64 %t26, i64* %reg_11_ptr
  %t27 = load i64, i64* %reg_11_ptr
  %t28 = ashr i64 %t27, 8
  store i64 %t28, i64* %reg_12_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = and i64 %t29, 255
  store i64 %t30, i64* %reg_13_ptr
  %t31 = load i64, i64* %reg_13_ptr
  store i64 %t31, i64* %var_mark_val_ptr
  %t32 = load i64, i64* %var_curr_ptr
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t34 = add i64 %t33, 16
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  %t36 = inttoptr i64 %t35 to i64*
  %t37 = load i64, i64* %t36
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %reg_16_ptr
  store i64 %t38, i64* %var_nxt_ptr
  %t39 = load i64, i64* %var_mark_val_ptr
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_17_ptr
  %t41 = icmp eq i64 %t40, 0
  %t42 = zext i1 %t41 to i64
  store i64 %t42, i64* %reg_18_ptr
  %t43 = load i64, i64* %reg_18_ptr
  %t45 = icmp ne i64 %t43, 0
  %t46 = zext i1 %t45 to i64
  %t44 = icmp ne i64 %t46, 0
  br i1 %t44, label %rt_gc_collect_b6, label %rt_gc_collect_b7
rt_gc_collect_b6:
  %t47 = load i64, i64* %var_prev_addr_ptr
  store i64 %t47, i64* %reg_19_ptr
  %t48 = load i64, i64* %var_nxt_ptr
  store i64 %t48, i64* %reg_20_ptr
  %t49 = load i64, i64* %reg_19_ptr
  %t50 = load i64, i64* %reg_20_ptr
  %t51 = inttoptr i64 %t49 to i64*
  store i64 %t50, i64* %t51
  store i64 0, i64* %reg_21_ptr
  %t52 = load i64, i64* %var_ctx_ptr
  store i64 %t52, i64* %reg_22_ptr
  %t53 = load i64, i64* %var_curr_ptr
  store i64 %t53, i64* %reg_23_ptr
  %t54 = load i64, i64* %reg_22_ptr
  %t55 = load i64, i64* %reg_23_ptr
  %t56 = call i64 @rt_gc_ht_remove(i64 %t54, i64 %t55)
  store i64 %t56, i64* %reg_24_ptr
  %t57 = load i64, i64* %var_curr_ptr
  store i64 %t57, i64* %reg_25_ptr
  %t58 = load i64, i64* %reg_25_ptr
  %t59 = call i64 @rt_gc_free_object(i64 %t58)
  store i64 %t59, i64* %reg_26_ptr
  %t60 = load i64, i64* %var_ctx_ptr
  store i64 %t60, i64* %reg_27_ptr
  %t61 = load i64, i64* %var_curr_ptr
  store i64 %t61, i64* %reg_28_ptr
  %t62 = load i64, i64* %reg_27_ptr
  %t63 = load i64, i64* %reg_28_ptr
  %t64 = call i64 @rt_gc_node_free(i64 %t62, i64 %t63)
  store i64 %t64, i64* %reg_29_ptr
  %t65 = load i64, i64* %var_ctx_ptr
  store i64 %t65, i64* %reg_30_ptr
  %t66 = load i64, i64* %reg_30_ptr
  %t67 = add i64 %t66, 8
  store i64 %t67, i64* %reg_31_ptr
  %t68 = load i64, i64* %reg_31_ptr
  %t69 = inttoptr i64 %t68 to i64*
  %t70 = load i64, i64* %t69
  store i64 %t70, i64* %reg_32_ptr
  %t71 = load i64, i64* %reg_32_ptr
  store i64 %t71, i64* %var_ac_ptr
  %t72 = load i64, i64* %var_ctx_ptr
  store i64 %t72, i64* %reg_33_ptr
  %t73 = load i64, i64* %reg_33_ptr
  %t74 = add i64 %t73, 8
  store i64 %t74, i64* %reg_34_ptr
  %t75 = load i64, i64* %var_ac_ptr
  store i64 %t75, i64* %reg_35_ptr
  %t76 = load i64, i64* %reg_35_ptr
  %t77 = sub i64 %t76, 1
  store i64 %t77, i64* %reg_36_ptr
  %t78 = load i64, i64* %reg_34_ptr
  %t79 = load i64, i64* %reg_36_ptr
  %t80 = inttoptr i64 %t78 to i64*
  store i64 %t79, i64* %t80
  store i64 0, i64* %reg_37_ptr
  %t81 = load i64, i64* %var_nxt_ptr
  store i64 %t81, i64* %reg_38_ptr
  %t82 = load i64, i64* %reg_38_ptr
  store i64 %t82, i64* %var_curr_ptr
  br label %rt_gc_collect_b8
rt_gc_collect_b7:
  %t83 = load i64, i64* %var_mk_ptr
  store i64 %t83, i64* %reg_39_ptr
  %t84 = load i64, i64* %reg_39_ptr
  %t85 = and i64 %t84, 255
  store i64 %t85, i64* %reg_40_ptr
  %t86 = load i64, i64* %reg_40_ptr
  store i64 %t86, i64* %var_kind_val_ptr
  %t87 = load i64, i64* %var_curr_ptr
  store i64 %t87, i64* %reg_41_ptr
  %t88 = load i64, i64* %reg_41_ptr
  %t89 = add i64 %t88, 8
  store i64 %t89, i64* %reg_42_ptr
  %t90 = load i64, i64* %var_kind_val_ptr
  store i64 %t90, i64* %reg_43_ptr
  %t91 = load i64, i64* %reg_42_ptr
  %t92 = load i64, i64* %reg_43_ptr
  %t93 = inttoptr i64 %t91 to i64*
  store i64 %t92, i64* %t93
  store i64 0, i64* %reg_44_ptr
  %t94 = load i64, i64* %var_curr_ptr
  store i64 %t94, i64* %reg_45_ptr
  %t95 = load i64, i64* %reg_45_ptr
  %t96 = add i64 %t95, 16
  store i64 %t96, i64* %reg_46_ptr
  %t97 = load i64, i64* %reg_46_ptr
  store i64 %t97, i64* %var_prev_addr_ptr
  %t98 = load i64, i64* %var_nxt_ptr
  store i64 %t98, i64* %reg_47_ptr
  %t99 = load i64, i64* %reg_47_ptr
  store i64 %t99, i64* %var_curr_ptr
  br label %rt_gc_collect_b8
rt_gc_collect_b8:
  br label %rt_gc_collect_b1
}

define void @rt_gc_register(i64 %arg0, i64 %arg1, i64 %arg2) {
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
  %var_paused_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  %var_thresh_ptr = alloca i64
  %var_head_ptr = alloca i64
  %var_kind_ptr = alloca i64
  %var_ac2_ptr = alloca i64
  %var_ac_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_kind_ptr
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
  br i1 %t8, label %rt_gc_register_b1, label %rt_gc_register_b2
rt_gc_register_b1:
  ret void
rt_gc_register_b2:
  br label %rt_gc_register_b3
rt_gc_register_b3:
  %t11 = load i64, i64* %var_ctx_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t13 = add i64 %t12, 24
  store i64 %t13, i64* %reg_6_ptr
  %t14 = load i64, i64* %reg_6_ptr
  %t15 = inttoptr i64 %t14 to i64*
  %t16 = load i64, i64* %t15
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i64, i64* %reg_7_ptr
  store i64 %t17, i64* %var_paused_ptr
  %t18 = load i64, i64* %var_paused_ptr
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  %t20 = icmp ne i64 %t19, 0
  %t21 = zext i1 %t20 to i64
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  %t24 = icmp ne i64 %t22, 0
  %t25 = zext i1 %t24 to i64
  %t23 = icmp ne i64 %t25, 0
  br i1 %t23, label %rt_gc_register_b4, label %rt_gc_register_b5
rt_gc_register_b4:
  ret void
rt_gc_register_b5:
  br label %rt_gc_register_b6
rt_gc_register_b6:
  %t26 = load i64, i64* %var_ctx_ptr
  store i64 %t26, i64* %reg_10_ptr
  %t27 = load i64, i64* %reg_10_ptr
  %t28 = call i64 @rt_gc_node_alloc(i64 %t27)
  store i64 %t28, i64* %reg_11_ptr
  %t29 = load i64, i64* %reg_11_ptr
  store i64 %t29, i64* %var_node_ptr
  %t30 = load i64, i64* %var_node_ptr
  store i64 %t30, i64* %reg_12_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = icmp eq i64 %t31, 0
  %t33 = zext i1 %t32 to i64
  store i64 %t33, i64* %reg_13_ptr
  %t34 = load i64, i64* %reg_13_ptr
  %t36 = icmp ne i64 %t34, 0
  %t37 = zext i1 %t36 to i64
  %t35 = icmp ne i64 %t37, 0
  br i1 %t35, label %rt_gc_register_b7, label %rt_gc_register_b8
rt_gc_register_b7:
  ret void
rt_gc_register_b8:
  br label %rt_gc_register_b9
rt_gc_register_b9:
  %t38 = load i64, i64* %var_node_ptr
  store i64 %t38, i64* %reg_14_ptr
  %t39 = load i64, i64* %var_ptr_ptr
  store i64 %t39, i64* %reg_15_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t41 = load i64, i64* %reg_15_ptr
  %t42 = inttoptr i64 %t40 to i64*
  store i64 %t41, i64* %t42
  store i64 0, i64* %reg_16_ptr
  %t43 = load i64, i64* %var_node_ptr
  store i64 %t43, i64* %reg_17_ptr
  %t44 = load i64, i64* %reg_17_ptr
  %t45 = add i64 %t44, 8
  store i64 %t45, i64* %reg_18_ptr
  %t46 = load i64, i64* %var_kind_ptr
  store i64 %t46, i64* %reg_19_ptr
  %t47 = load i64, i64* %reg_19_ptr
  %t48 = or i64 %t47, 256
  store i64 %t48, i64* %reg_20_ptr
  %t49 = load i64, i64* %reg_18_ptr
  %t50 = load i64, i64* %reg_20_ptr
  %t51 = inttoptr i64 %t49 to i64*
  store i64 %t50, i64* %t51
  store i64 0, i64* %reg_21_ptr
  %t52 = load i64, i64* %var_ctx_ptr
  store i64 %t52, i64* %reg_22_ptr
  %t53 = load i64, i64* %reg_22_ptr
  %t54 = inttoptr i64 %t53 to i64*
  %t55 = load i64, i64* %t54
  store i64 %t55, i64* %reg_23_ptr
  %t56 = load i64, i64* %reg_23_ptr
  store i64 %t56, i64* %var_head_ptr
  %t57 = load i64, i64* %var_node_ptr
  store i64 %t57, i64* %reg_24_ptr
  %t58 = load i64, i64* %reg_24_ptr
  %t59 = add i64 %t58, 16
  store i64 %t59, i64* %reg_25_ptr
  %t60 = load i64, i64* %var_head_ptr
  store i64 %t60, i64* %reg_26_ptr
  %t61 = load i64, i64* %reg_25_ptr
  %t62 = load i64, i64* %reg_26_ptr
  %t63 = inttoptr i64 %t61 to i64*
  store i64 %t62, i64* %t63
  store i64 0, i64* %reg_27_ptr
  %t64 = load i64, i64* %var_ctx_ptr
  store i64 %t64, i64* %reg_28_ptr
  %t65 = load i64, i64* %var_node_ptr
  store i64 %t65, i64* %reg_29_ptr
  %t66 = load i64, i64* %reg_28_ptr
  %t67 = load i64, i64* %reg_29_ptr
  %t68 = inttoptr i64 %t66 to i64*
  store i64 %t67, i64* %t68
  store i64 0, i64* %reg_30_ptr
  %t69 = load i64, i64* %var_ctx_ptr
  store i64 %t69, i64* %reg_31_ptr
  %t70 = load i64, i64* %var_node_ptr
  store i64 %t70, i64* %reg_32_ptr
  %t71 = load i64, i64* %reg_31_ptr
  %t72 = load i64, i64* %reg_32_ptr
  %t73 = call i64 @rt_gc_ht_insert(i64 %t71, i64 %t72)
  store i64 %t73, i64* %reg_33_ptr
  %t74 = load i64, i64* %var_ctx_ptr
  store i64 %t74, i64* %reg_34_ptr
  %t75 = load i64, i64* %reg_34_ptr
  %t76 = add i64 %t75, 8
  store i64 %t76, i64* %reg_35_ptr
  %t77 = load i64, i64* %reg_35_ptr
  %t78 = inttoptr i64 %t77 to i64*
  %t79 = load i64, i64* %t78
  store i64 %t79, i64* %reg_36_ptr
  %t80 = load i64, i64* %reg_36_ptr
  %t81 = add i64 %t80, 1
  store i64 %t81, i64* %reg_37_ptr
  %t82 = load i64, i64* %reg_37_ptr
  store i64 %t82, i64* %var_ac_ptr
  %t83 = load i64, i64* %var_ctx_ptr
  store i64 %t83, i64* %reg_38_ptr
  %t84 = load i64, i64* %reg_38_ptr
  %t85 = add i64 %t84, 8
  store i64 %t85, i64* %reg_39_ptr
  %t86 = load i64, i64* %var_ac_ptr
  store i64 %t86, i64* %reg_40_ptr
  %t87 = load i64, i64* %reg_39_ptr
  %t88 = load i64, i64* %reg_40_ptr
  %t89 = inttoptr i64 %t87 to i64*
  store i64 %t88, i64* %t89
  store i64 0, i64* %reg_41_ptr
  %t90 = load i64, i64* %var_ctx_ptr
  store i64 %t90, i64* %reg_42_ptr
  %t91 = load i64, i64* %reg_42_ptr
  %t92 = add i64 %t91, 16
  store i64 %t92, i64* %reg_43_ptr
  %t93 = load i64, i64* %reg_43_ptr
  %t94 = inttoptr i64 %t93 to i64*
  %t95 = load i64, i64* %t94
  store i64 %t95, i64* %reg_44_ptr
  %t96 = load i64, i64* %reg_44_ptr
  store i64 %t96, i64* %var_thresh_ptr
  %t97 = load i64, i64* %var_ac_ptr
  store i64 %t97, i64* %reg_45_ptr
  %t98 = load i64, i64* %var_thresh_ptr
  store i64 %t98, i64* %reg_46_ptr
  %t99 = load i64, i64* %reg_45_ptr
  %t100 = load i64, i64* %reg_46_ptr
  %t101 = icmp sgt i64 %t99, %t100
  %t102 = zext i1 %t101 to i64
  store i64 %t102, i64* %reg_47_ptr
  %t103 = load i64, i64* %reg_47_ptr
  %t105 = icmp ne i64 %t103, 0
  %t106 = zext i1 %t105 to i64
  %t104 = icmp ne i64 %t106, 0
  br i1 %t104, label %rt_gc_register_b10, label %rt_gc_register_b11
rt_gc_register_b10:
  %t107 = load i64, i64* %var_ctx_ptr
  store i64 %t107, i64* %reg_48_ptr
  %t108 = load i64, i64* %reg_48_ptr
  %t109 = call i64 @rt_gc_collect(i64 %t108)
  store i64 %t109, i64* %reg_49_ptr
  %t110 = load i64, i64* %var_ctx_ptr
  store i64 %t110, i64* %reg_50_ptr
  %t111 = load i64, i64* %reg_50_ptr
  %t112 = add i64 %t111, 8
  store i64 %t112, i64* %reg_51_ptr
  %t113 = load i64, i64* %reg_51_ptr
  %t114 = inttoptr i64 %t113 to i64*
  %t115 = load i64, i64* %t114
  store i64 %t115, i64* %reg_52_ptr
  %t116 = load i64, i64* %reg_52_ptr
  store i64 %t116, i64* %var_ac2_ptr
  %t117 = load i64, i64* %var_ac2_ptr
  store i64 %t117, i64* %reg_53_ptr
  %t118 = load i64, i64* %var_thresh_ptr
  store i64 %t118, i64* %reg_54_ptr
  %t119 = load i64, i64* %reg_54_ptr
  %t120 = call i64 @obo_safe_div(i64 %t119, i64 2)
  store i64 %t120, i64* %reg_55_ptr
  %t121 = load i64, i64* %reg_53_ptr
  %t122 = load i64, i64* %reg_55_ptr
  %t123 = icmp sgt i64 %t121, %t122
  %t124 = zext i1 %t123 to i64
  store i64 %t124, i64* %reg_56_ptr
  %t125 = load i64, i64* %reg_56_ptr
  %t127 = icmp ne i64 %t125, 0
  %t128 = zext i1 %t127 to i64
  %t126 = icmp ne i64 %t128, 0
  br i1 %t126, label %rt_gc_register_b13, label %rt_gc_register_b14
rt_gc_register_b11:
  br label %rt_gc_register_b12
rt_gc_register_b12:
  ret void
rt_gc_register_b13:
  %t129 = load i64, i64* %var_ctx_ptr
  store i64 %t129, i64* %reg_57_ptr
  %t130 = load i64, i64* %reg_57_ptr
  %t131 = add i64 %t130, 16
  store i64 %t131, i64* %reg_58_ptr
  %t132 = load i64, i64* %var_thresh_ptr
  store i64 %t132, i64* %reg_59_ptr
  %t133 = load i64, i64* %reg_59_ptr
  %t134 = mul i64 %t133, 2
  store i64 %t134, i64* %reg_60_ptr
  %t135 = load i64, i64* %reg_58_ptr
  %t136 = load i64, i64* %reg_60_ptr
  %t137 = inttoptr i64 %t135 to i64*
  store i64 %t136, i64* %t137
  store i64 0, i64* %reg_61_ptr
  br label %rt_gc_register_b15
rt_gc_register_b14:
  br label %rt_gc_register_b15
rt_gc_register_b15:
  br label %rt_gc_register_b12
}

define void @rt_gc_register_opaque(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %var_ptr_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = call i64 @rt_gc_register(i64 %t4, i64 %t5, i64 8)
  store i64 %t6, i64* %reg_4_ptr
  ret void
}

define void @rt_gc_track_string(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %var_ptr_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = call i64 @rt_gc_register(i64 %t4, i64 %t5, i64 0)
  store i64 %t6, i64* %reg_4_ptr
  ret void
}

define void @rt_gc_free_all(i64 %arg0) {
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
  %var_nxt_ptr = alloca i64
  %var_chunk_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_curr_ptr = alloca i64
  %var_ht_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = inttoptr i64 %t2 to i64*
  %t4 = load i64, i64* %t3
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_curr_ptr
  br label %rt_gc_free_all_b1
rt_gc_free_all_b1:
  %t6 = load i64, i64* %var_curr_ptr
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = icmp eq i64 %t7, 0
  %t9 = zext i1 %t8 to i64
  store i64 %t9, i64* %reg_4_ptr
  %t10 = load i64, i64* %reg_4_ptr
  %t12 = icmp ne i64 %t10, 0
  %t13 = zext i1 %t12 to i64
  %t11 = icmp ne i64 %t13, 0
  br i1 %t11, label %rt_gc_free_all_b3, label %rt_gc_free_all_b4
rt_gc_free_all_b2:
  %t14 = load i64, i64* %var_ctx_ptr
  store i64 %t14, i64* %reg_11_ptr
  %t15 = load i64, i64* %reg_11_ptr
  %t16 = inttoptr i64 %t15 to i64*
  store i64 0, i64* %t16
  store i64 0, i64* %reg_12_ptr
  %t17 = load i64, i64* %var_ctx_ptr
  store i64 %t17, i64* %reg_13_ptr
  %t18 = load i64, i64* %reg_13_ptr
  %t19 = add i64 %t18, 8
  store i64 %t19, i64* %reg_14_ptr
  %t20 = load i64, i64* %reg_14_ptr
  %t21 = inttoptr i64 %t20 to i64*
  store i64 0, i64* %t21
  store i64 0, i64* %reg_15_ptr
  %t22 = load i64, i64* %var_ctx_ptr
  store i64 %t22, i64* %reg_16_ptr
  %t23 = load i64, i64* %reg_16_ptr
  %t24 = add i64 %t23, 56
  store i64 %t24, i64* %reg_17_ptr
  %t25 = load i64, i64* %reg_17_ptr
  %t26 = inttoptr i64 %t25 to i64*
  %t27 = load i64, i64* %t26
  store i64 %t27, i64* %reg_18_ptr
  %t28 = load i64, i64* %reg_18_ptr
  store i64 %t28, i64* %var_chunk_ptr
  br label %rt_gc_free_all_b6
rt_gc_free_all_b3:
  br label %rt_gc_free_all_b2
rt_gc_free_all_b4:
  br label %rt_gc_free_all_b5
rt_gc_free_all_b5:
  %t29 = load i64, i64* %var_curr_ptr
  store i64 %t29, i64* %reg_5_ptr
  %t30 = load i64, i64* %reg_5_ptr
  %t31 = add i64 %t30, 16
  store i64 %t31, i64* %reg_6_ptr
  %t32 = load i64, i64* %reg_6_ptr
  %t33 = inttoptr i64 %t32 to i64*
  %t34 = load i64, i64* %t33
  store i64 %t34, i64* %reg_7_ptr
  %t35 = load i64, i64* %reg_7_ptr
  store i64 %t35, i64* %var_nxt_ptr
  %t36 = load i64, i64* %var_curr_ptr
  store i64 %t36, i64* %reg_8_ptr
  %t37 = load i64, i64* %reg_8_ptr
  %t38 = call i64 @rt_gc_free_object(i64 %t37)
  store i64 %t38, i64* %reg_9_ptr
  %t39 = load i64, i64* %var_nxt_ptr
  store i64 %t39, i64* %reg_10_ptr
  %t40 = load i64, i64* %reg_10_ptr
  store i64 %t40, i64* %var_curr_ptr
  br label %rt_gc_free_all_b1
rt_gc_free_all_b6:
  %t41 = load i64, i64* %var_chunk_ptr
  store i64 %t41, i64* %reg_19_ptr
  %t42 = load i64, i64* %reg_19_ptr
  %t43 = icmp eq i64 %t42, 0
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_20_ptr
  %t45 = load i64, i64* %reg_20_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %rt_gc_free_all_b8, label %rt_gc_free_all_b9
rt_gc_free_all_b7:
  %t49 = load i64, i64* %var_ctx_ptr
  store i64 %t49, i64* %reg_26_ptr
  %t50 = load i64, i64* %reg_26_ptr
  %t51 = add i64 %t50, 56
  store i64 %t51, i64* %reg_27_ptr
  %t52 = load i64, i64* %reg_27_ptr
  %t53 = inttoptr i64 %t52 to i64*
  store i64 0, i64* %t53
  store i64 0, i64* %reg_28_ptr
  %t54 = load i64, i64* %var_ctx_ptr
  store i64 %t54, i64* %reg_29_ptr
  %t55 = load i64, i64* %reg_29_ptr
  %t56 = add i64 %t55, 64
  store i64 %t56, i64* %reg_30_ptr
  %t57 = load i64, i64* %reg_30_ptr
  %t58 = inttoptr i64 %t57 to i64*
  store i64 4096, i64* %t58
  store i64 0, i64* %reg_31_ptr
  %t59 = load i64, i64* %var_ctx_ptr
  store i64 %t59, i64* %reg_32_ptr
  %t60 = load i64, i64* %reg_32_ptr
  %t61 = add i64 %t60, 72
  store i64 %t61, i64* %reg_33_ptr
  %t62 = load i64, i64* %reg_33_ptr
  %t63 = inttoptr i64 %t62 to i64*
  store i64 0, i64* %t63
  store i64 0, i64* %reg_34_ptr
  %t64 = load i64, i64* %var_ctx_ptr
  store i64 %t64, i64* %reg_35_ptr
  %t65 = load i64, i64* %reg_35_ptr
  %t66 = add i64 %t65, 48
  store i64 %t66, i64* %reg_36_ptr
  %t67 = load i64, i64* %reg_36_ptr
  %t68 = inttoptr i64 %t67 to i64*
  %t69 = load i64, i64* %t68
  store i64 %t69, i64* %reg_37_ptr
  %t70 = load i64, i64* %reg_37_ptr
  store i64 %t70, i64* %var_ht_ptr
  %t71 = load i64, i64* %var_ht_ptr
  store i64 %t71, i64* %reg_38_ptr
  %t72 = load i64, i64* %reg_38_ptr
  %t73 = icmp ne i64 %t72, 0
  %t74 = zext i1 %t73 to i64
  store i64 %t74, i64* %reg_39_ptr
  %t75 = load i64, i64* %reg_39_ptr
  %t77 = icmp ne i64 %t75, 0
  %t78 = zext i1 %t77 to i64
  %t76 = icmp ne i64 %t78, 0
  br i1 %t76, label %rt_gc_free_all_b11, label %rt_gc_free_all_b12
rt_gc_free_all_b8:
  br label %rt_gc_free_all_b7
rt_gc_free_all_b9:
  br label %rt_gc_free_all_b10
rt_gc_free_all_b10:
  %t79 = load i64, i64* %var_chunk_ptr
  store i64 %t79, i64* %reg_21_ptr
  %t80 = load i64, i64* %reg_21_ptr
  %t81 = inttoptr i64 %t80 to i64*
  %t82 = load i64, i64* %t81
  store i64 %t82, i64* %reg_22_ptr
  %t83 = load i64, i64* %reg_22_ptr
  store i64 %t83, i64* %var_nxt_ptr
  %t84 = load i64, i64* %var_chunk_ptr
  store i64 %t84, i64* %reg_23_ptr
  %t85 = load i64, i64* %reg_23_ptr
  %t86 = call i64 @__sys_pointer_free(i64 %t85)
  store i64 %t86, i64* %reg_24_ptr
  %t87 = load i64, i64* %var_nxt_ptr
  store i64 %t87, i64* %reg_25_ptr
  %t88 = load i64, i64* %reg_25_ptr
  store i64 %t88, i64* %var_chunk_ptr
  br label %rt_gc_free_all_b6
rt_gc_free_all_b11:
  %t89 = load i64, i64* %var_ht_ptr
  store i64 %t89, i64* %reg_40_ptr
  %t90 = load i64, i64* %reg_40_ptr
  %t91 = inttoptr i64 %t90 to i8*
  call void @llvm.memset.p0i8.i64(i8* %t91, i8 0, i64 131072, i1 false)
  store i64 0, i64* %reg_41_ptr
  br label %rt_gc_free_all_b13
rt_gc_free_all_b12:
  br label %rt_gc_free_all_b13
rt_gc_free_all_b13:
  ret void
}

define void @rt_gc_destroy(i64 %arg0) {
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
  %var_ht_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  %var_roots_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = call i64 @rt_gc_free_all(i64 %t2)
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %var_ctx_ptr
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = add i64 %t5, 40
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i64*
  %t9 = load i64, i64* %t8
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_roots_ptr
  %t11 = load i64, i64* %var_roots_ptr
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t13 = icmp ne i64 %t12, 0
  %t14 = zext i1 %t13 to i64
  store i64 %t14, i64* %reg_7_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t17 = icmp ne i64 %t15, 0
  %t18 = zext i1 %t17 to i64
  %t16 = icmp ne i64 %t18, 0
  br i1 %t16, label %rt_gc_destroy_b1, label %rt_gc_destroy_b2
rt_gc_destroy_b1:
  %t19 = load i64, i64* %var_roots_ptr
  store i64 %t19, i64* %reg_8_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = call i64 @__sys_pointer_free(i64 %t20)
  store i64 %t21, i64* %reg_9_ptr
  br label %rt_gc_destroy_b3
rt_gc_destroy_b2:
  br label %rt_gc_destroy_b3
rt_gc_destroy_b3:
  %t22 = load i64, i64* %var_ctx_ptr
  store i64 %t22, i64* %reg_10_ptr
  %t23 = load i64, i64* %reg_10_ptr
  %t24 = add i64 %t23, 48
  store i64 %t24, i64* %reg_11_ptr
  %t25 = load i64, i64* %reg_11_ptr
  %t26 = inttoptr i64 %t25 to i64*
  %t27 = load i64, i64* %t26
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_12_ptr
  store i64 %t28, i64* %var_ht_ptr
  %t29 = load i64, i64* %var_ht_ptr
  store i64 %t29, i64* %reg_13_ptr
  %t30 = load i64, i64* %reg_13_ptr
  %t31 = icmp ne i64 %t30, 0
  %t32 = zext i1 %t31 to i64
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %rt_gc_destroy_b4, label %rt_gc_destroy_b5
rt_gc_destroy_b4:
  %t37 = load i64, i64* %var_ht_ptr
  store i64 %t37, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_15_ptr
  %t39 = call i64 @__sys_pointer_free(i64 %t38)
  store i64 %t39, i64* %reg_16_ptr
  br label %rt_gc_destroy_b6
rt_gc_destroy_b5:
  br label %rt_gc_destroy_b6
rt_gc_destroy_b6:
  %t40 = load i64, i64* %var_ctx_ptr
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i64, i64* %reg_17_ptr
  %t42 = call i64 @__sys_pointer_free(i64 %t41)
  store i64 %t42, i64* %reg_18_ptr
  ret void
}

define i64 @rt_gc_alloc_count(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = add i64 %t2, 8
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = inttoptr i64 %t4 to i64*
  %t6 = load i64, i64* %t5
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  ret i64 %t7
}

define i64 @rt_gc_threshold(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %var_ctx_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = add i64 %t2, 16
  store i64 %t3, i64* %reg_2_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = inttoptr i64 %t4 to i64*
  %t6 = load i64, i64* %t5
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  ret i64 %t7
}

define i64 @rt_gc_is_tracked(i64 %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %var_ptr_ptr = alloca i64
  %var_node_ptr = alloca i64
  %var_ctx_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_ctx_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_ptr_ptr
  %t2 = load i64, i64* %var_ctx_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %var_ptr_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = call i64 @rt_gc_find_node(i64 %t4, i64 %t5)
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  store i64 %t7, i64* %var_node_ptr
  %t8 = load i64, i64* %var_node_ptr
  store i64 %t8, i64* %reg_5_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = icmp ne i64 %t9, 0
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t14 = icmp ne i64 %t12, 0
  %t15 = zext i1 %t14 to i64
  %t13 = icmp ne i64 %t15, 0
  br i1 %t13, label %rt_gc_is_tracked_b1, label %rt_gc_is_tracked_b2
rt_gc_is_tracked_b1:
  ret i64 1
rt_gc_is_tracked_b2:
  br label %rt_gc_is_tracked_b3
rt_gc_is_tracked_b3:
  ret i64 0
}

