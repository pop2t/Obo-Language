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
@obo.str.1 = private unnamed_addr constant [6 x i8] c"count\00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca double
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca double
  %var_nums_ptr = alloca i8*
  %var_items_ptr = alloca i8*
  %gc_root_arr = alloca i8**, i64 17
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_2_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_3_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_4_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_5_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_6_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_7_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_9_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_11_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_13_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %reg_15_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %reg_16_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %reg_18_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %reg_19_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %reg_21_ptr, i8*** %gc_root_gep_13
  %gc_root_gep_14 = getelementptr i8**, i8*** %gc_root_arr, i64 14
  store i8** %reg_23_ptr, i8*** %gc_root_gep_14
  %gc_root_gep_15 = getelementptr i8**, i8*** %gc_root_arr, i64 15
  store i8** %var_nums_ptr, i8*** %gc_root_gep_15
  %gc_root_gep_16 = getelementptr i8**, i8*** %gc_root_arr, i64 16
  store i8** %var_items_ptr, i8*** %gc_root_gep_16
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 17)
  %t0 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_items_ptr
  %t2 = load i8*, i8** %var_items_ptr
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  %t4 = fptosi double 0x3FF8000000000000 to i64
  %t5 = call i8* @obo_list_add(i8* %t3, i64 %t4)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %reg_2_ptr
  store i8* %t6, i8** %var_items_ptr
  %t7 = load i8*, i8** %var_items_ptr
  store i8* %t7, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_3_ptr
  %t9 = call i8* @obo_f64_list_add(i8* %t8, double 0x4004000000000000)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = load i8*, i8** %reg_4_ptr
  store i8* %t10, i8** %var_items_ptr
  %t11 = load i8*, i8** %var_items_ptr
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %reg_5_ptr
  %t13 = call i8* @obo_f64_list_add(i8* %t12, double 0x4008000000000000)
  store i8* %t13, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_6_ptr
  store i8* %t14, i8** %var_items_ptr
  %t15 = load i8*, i8** %var_items_ptr
  store i8* %t15, i8** %reg_7_ptr
  %t16 = load i8*, i8** %reg_7_ptr
  %t17 = bitcast i8* %t16 to i64*
  %t18 = load i64, i64* %t17
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t19)
  %t20 = load i8*, i8** %var_items_ptr
  store i8* %t20, i8** %reg_9_ptr
  %t21 = load i8*, i8** %reg_9_ptr
  %t22 = mul i64 0, 8
  %t23 = add i64 %t22, 16
  %t24 = getelementptr i8, i8* %t21, i64 %t23
  %t25 = bitcast i8* %t24 to double*
  %t26 = load double, double* %t25
  store double %t26, double* %reg_10_ptr
  %t27 = load double, double* %reg_10_ptr
  call void @obo_print_double(double %t27)
  %t28 = load i8*, i8** %var_items_ptr
  store i8* %t28, i8** %reg_11_ptr
  %t29 = load i8*, i8** %reg_11_ptr
  %t30 = mul i64 1, 8
  %t31 = add i64 %t30, 16
  %t32 = getelementptr i8, i8* %t29, i64 %t31
  %t33 = bitcast i8* %t32 to double*
  %t34 = load double, double* %t33
  store double %t34, double* %reg_12_ptr
  %t35 = load double, double* %reg_12_ptr
  call void @obo_print_double(double %t35)
  %t36 = load i8*, i8** %var_items_ptr
  store i8* %t36, i8** %reg_13_ptr
  %t37 = load i8*, i8** %reg_13_ptr
  %t38 = mul i64 2, 8
  %t39 = add i64 %t38, 16
  %t40 = getelementptr i8, i8* %t37, i64 %t39
  %t41 = bitcast i8* %t40 to double*
  %t42 = load double, double* %t41
  store double %t42, double* %reg_14_ptr
  %t43 = load double, double* %reg_14_ptr
  call void @obo_print_double(double %t43)
  %t44 = load i8*, i8** %var_items_ptr
  store i8* %t44, i8** %reg_15_ptr
  %t45 = load i8*, i8** %reg_15_ptr
  %t46 = mul i64 1, 8
  %t47 = add i64 %t46, 16
  %t48 = getelementptr i8, i8* %t45, i64 %t47
  %t49 = bitcast i8* %t48 to double*
  store double 0x4025000000000000, double* %t49
  %t50 = load i8*, i8** %var_items_ptr
  store i8* %t50, i8** %reg_16_ptr
  %t51 = load i8*, i8** %reg_16_ptr
  %t52 = mul i64 1, 8
  %t53 = add i64 %t52, 16
  %t54 = getelementptr i8, i8* %t51, i64 %t53
  %t55 = bitcast i8* %t54 to double*
  %t56 = load double, double* %t55
  store double %t56, double* %reg_17_ptr
  %t57 = load double, double* %reg_17_ptr
  call void @obo_print_double(double %t57)
  %t58 = alloca [5 x double]
  %t59 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 0
  store double 0x3FF0000000000000, double* %t59
  %t60 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 1
  store double 0x4000000000000000, double* %t60
  %t61 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 2
  store double 0x4008000000000000, double* %t61
  %t62 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 3
  store double 0x4010000000000000, double* %t62
  %t63 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 4
  store double 0x4014000000000000, double* %t63
  %t64 = getelementptr inbounds [5 x double], [5 x double]* %t58, i64 0, i64 0
  %t65 = call i8* @obo_f64_list_new(i64 5, double* %t64)
  store i8* %t65, i8** %reg_18_ptr
  %t66 = load i8*, i8** %reg_18_ptr
  store i8* %t66, i8** %var_nums_ptr
  %t67 = load i8*, i8** %var_nums_ptr
  store i8* %t67, i8** %reg_19_ptr
  %t68 = load i8*, i8** %reg_19_ptr
  %t69 = bitcast i8* %t68 to i64*
  %t70 = load i64, i64* %t69
  store i64 %t70, i64* %reg_20_ptr
  %t71 = load i64, i64* %reg_20_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t71)
  %t72 = load i8*, i8** %var_nums_ptr
  store i8* %t72, i8** %reg_21_ptr
  %t73 = load i8*, i8** %reg_21_ptr
  %t74 = mul i64 0, 8
  %t75 = add i64 %t74, 16
  %t76 = getelementptr i8, i8* %t73, i64 %t75
  %t77 = bitcast i8* %t76 to double*
  %t78 = load double, double* %t77
  store double %t78, double* %reg_22_ptr
  %t79 = load double, double* %reg_22_ptr
  call void @obo_print_double(double %t79)
  %t80 = load i8*, i8** %var_nums_ptr
  store i8* %t80, i8** %reg_23_ptr
  %t81 = load i8*, i8** %reg_23_ptr
  %t82 = mul i64 4, 8
  %t83 = add i64 %t82, 16
  %t84 = getelementptr i8, i8* %t81, i64 %t83
  %t85 = bitcast i8* %t84 to double*
  %t86 = load double, double* %t85
  store double %t86, double* %reg_24_ptr
  %t87 = load double, double* %reg_24_ptr
  call void @obo_print_double(double %t87)
  call void @obo_gc_pop_roots(i64 17)
  call void @obo_arena_free_all()
  ret i32 0
}

