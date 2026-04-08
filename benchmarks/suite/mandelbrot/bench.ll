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

@obo.str.0 = private unnamed_addr constant [12 x i8] c"Mandelbrot \00"
@obo.str.1 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.2 = private unnamed_addr constant [3 x i8] c": \00"

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
  %reg_9_ptr = alloca double
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca double
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca double
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca double
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca double
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca double
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca double
  %reg_32_ptr = alloca double
  %reg_33_ptr = alloca double
  %reg_34_ptr = alloca double
  %reg_35_ptr = alloca double
  %reg_36_ptr = alloca double
  %reg_37_ptr = alloca double
  %reg_38_ptr = alloca double
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca double
  %reg_41_ptr = alloca double
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca double
  %reg_44_ptr = alloca double
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
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i8*
  %reg_57_ptr = alloca i64
  %reg_58_ptr = alloca i8*
  %reg_59_ptr = alloca i8*
  %reg_60_ptr = alloca i64
  %reg_61_ptr = alloca i8*
  %var_y0_ptr = alloca double
  %var_y_ptr = alloca double
  %var_max_iter_ptr = alloca i64
  %var_total_ptr = alloca i64
  %var_size_ptr = alloca i64
  %var_x0_ptr = alloca double
  %var_px_ptr = alloca i64
  %var_py_ptr = alloca i64
  %var_iter_ptr = alloca i64
  %var_xt_ptr = alloca double
  %var_x_ptr = alloca double
  store i64 2000, i64* %var_size_ptr
  store i64 50, i64* %var_max_iter_ptr
  store i64 0, i64* %var_total_ptr
  store i64 0, i64* %var_py_ptr
  %t0 = load i64, i64* %var_size_ptr
  store i64 %t0, i64* %reg_0_ptr
  store i64 1, i64* %reg_1_ptr
  br label %main_b1
main_b1:
  %t1 = load i64, i64* %var_py_ptr
  store i64 %t1, i64* %reg_2_ptr
  %t2 = load i64, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_0_ptr
  %t4 = icmp slt i64 %t2, %t3
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t8 = icmp ne i64 %t6, 0
  %t9 = zext i1 %t8 to i64
  %t7 = icmp ne i64 %t9, 0
  br i1 %t7, label %main_b2, label %main_b4
main_b2:
  store i64 0, i64* %var_px_ptr
  %t10 = load i64, i64* %var_size_ptr
  store i64 %t10, i64* %reg_4_ptr
  store i64 1, i64* %reg_5_ptr
  br label %main_b5
main_b3:
  %t11 = load i64, i64* %var_py_ptr
  store i64 %t11, i64* %reg_52_ptr
  %t12 = load i64, i64* %reg_52_ptr
  %t13 = load i64, i64* %reg_1_ptr
  %t14 = add i64 %t12, %t13
  store i64 %t14, i64* %reg_53_ptr
  %t15 = load i64, i64* %reg_53_ptr
  store i64 %t15, i64* %var_py_ptr
  br label %main_b1
main_b4:
  %t16 = load i64, i64* %var_size_ptr
  store i64 %t16, i64* %reg_54_ptr
  %t17 = load i64, i64* %reg_54_ptr
  %t18 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.0, i64 0, i64 0), i64 %t17)
  store i8* %t18, i8** %reg_55_ptr
  %t19 = load i8*, i8** %reg_55_ptr
  %t20 = call i8* @obo_str_concat(i8* %t19, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t20, i8** %reg_56_ptr
  %t21 = load i64, i64* %var_size_ptr
  store i64 %t21, i64* %reg_57_ptr
  %t22 = load i8*, i8** %reg_56_ptr
  %t23 = load i64, i64* %reg_57_ptr
  %t24 = call i8* @obo_str_concat_int(i8* %t22, i64 %t23)
  store i8* %t24, i8** %reg_58_ptr
  %t25 = load i8*, i8** %reg_58_ptr
  %t26 = call i8* @obo_str_concat(i8* %t25, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.2, i64 0, i64 0))
  store i8* %t26, i8** %reg_59_ptr
  %t27 = load i64, i64* %var_total_ptr
  store i64 %t27, i64* %reg_60_ptr
  %t28 = load i8*, i8** %reg_59_ptr
  %t29 = load i64, i64* %reg_60_ptr
  %t30 = call i8* @obo_str_concat_int(i8* %t28, i64 %t29)
  store i8* %t30, i8** %reg_61_ptr
  %t31 = load i8*, i8** %reg_61_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t31)
  call void @obo_arena_free_all()
  ret i32 0
main_b5:
  %t32 = load i64, i64* %var_px_ptr
  store i64 %t32, i64* %reg_6_ptr
  %t33 = load i64, i64* %reg_6_ptr
  %t34 = load i64, i64* %reg_4_ptr
  %t35 = icmp slt i64 %t33, %t34
  %t36 = zext i1 %t35 to i64
  store i64 %t36, i64* %reg_7_ptr
  %t37 = load i64, i64* %reg_7_ptr
  %t39 = icmp ne i64 %t37, 0
  %t40 = zext i1 %t39 to i64
  %t38 = icmp ne i64 %t40, 0
  br i1 %t38, label %main_b6, label %main_b8
main_b6:
  %t41 = load i64, i64* %var_px_ptr
  store i64 %t41, i64* %reg_8_ptr
  %t42 = load i64, i64* %reg_8_ptr
  %t43 = sitofp i64 %t42 to double
  %t44 = fmul contract double %t43, 0x400C000000000000
  store double %t44, double* %reg_9_ptr
  %t45 = load i64, i64* %var_size_ptr
  store i64 %t45, i64* %reg_10_ptr
  %t46 = load double, double* %reg_9_ptr
  %t47 = load i64, i64* %reg_10_ptr
  %t48 = sitofp i64 %t47 to double
  %t49 = fdiv contract double %t46, %t48
  store double %t49, double* %reg_11_ptr
  %t50 = load double, double* %reg_11_ptr
  %t51 = fsub contract double %t50, 0x4004000000000000
  store double %t51, double* %reg_12_ptr
  %t52 = load double, double* %reg_12_ptr
  store double %t52, double* %var_x0_ptr
  %t53 = load i64, i64* %var_py_ptr
  store i64 %t53, i64* %reg_13_ptr
  %t54 = load i64, i64* %reg_13_ptr
  %t55 = sitofp i64 %t54 to double
  %t56 = fmul contract double %t55, 0x4000000000000000
  store double %t56, double* %reg_14_ptr
  %t57 = load i64, i64* %var_size_ptr
  store i64 %t57, i64* %reg_15_ptr
  %t58 = load double, double* %reg_14_ptr
  %t59 = load i64, i64* %reg_15_ptr
  %t60 = sitofp i64 %t59 to double
  %t61 = fdiv contract double %t58, %t60
  store double %t61, double* %reg_16_ptr
  %t62 = load double, double* %reg_16_ptr
  %t63 = fsub contract double %t62, 0x3FF0000000000000
  store double %t63, double* %reg_17_ptr
  %t64 = load double, double* %reg_17_ptr
  store double %t64, double* %var_y0_ptr
  store double 0x0000000000000000, double* %var_x_ptr
  store double 0x0000000000000000, double* %var_y_ptr
  store i64 0, i64* %var_iter_ptr
  br label %main_b9
main_b7:
  %t65 = load i64, i64* %var_px_ptr
  store i64 %t65, i64* %reg_50_ptr
  %t66 = load i64, i64* %reg_50_ptr
  %t67 = load i64, i64* %reg_5_ptr
  %t68 = add i64 %t66, %t67
  store i64 %t68, i64* %reg_51_ptr
  %t69 = load i64, i64* %reg_51_ptr
  store i64 %t69, i64* %var_px_ptr
  br label %main_b5
main_b8:
  br label %main_b3
main_b9:
  %t70 = load i64, i64* %var_iter_ptr
  store i64 %t70, i64* %reg_18_ptr
  %t71 = load i64, i64* %var_max_iter_ptr
  store i64 %t71, i64* %reg_19_ptr
  %t72 = load i64, i64* %reg_18_ptr
  %t73 = load i64, i64* %reg_19_ptr
  %t74 = icmp slt i64 %t72, %t73
  %t75 = zext i1 %t74 to i64
  store i64 %t75, i64* %reg_20_ptr
  %t76 = load i64, i64* %reg_20_ptr
  %t78 = icmp ne i64 %t76, 0
  %t79 = zext i1 %t78 to i64
  %t77 = icmp ne i64 %t79, 0
  br i1 %t77, label %main_b10, label %main_b11
main_b10:
  %t80 = load double, double* %var_x_ptr
  store double %t80, double* %reg_21_ptr
  %t81 = load double, double* %var_x_ptr
  store double %t81, double* %reg_22_ptr
  %t82 = load double, double* %reg_21_ptr
  %t83 = load double, double* %reg_22_ptr
  %t84 = fmul contract double %t82, %t83
  store double %t84, double* %reg_23_ptr
  %t85 = load double, double* %var_y_ptr
  store double %t85, double* %reg_24_ptr
  %t86 = load double, double* %var_y_ptr
  store double %t86, double* %reg_25_ptr
  %t87 = load double, double* %reg_24_ptr
  %t88 = load double, double* %reg_25_ptr
  %t89 = fmul contract double %t87, %t88
  store double %t89, double* %reg_26_ptr
  %t90 = load double, double* %reg_23_ptr
  %t91 = load double, double* %reg_26_ptr
  %t92 = fadd contract double %t90, %t91
  store double %t92, double* %reg_27_ptr
  %t93 = load double, double* %reg_27_ptr
  %t94 = fcmp ogt double %t93, 0x4010000000000000
  %t95 = zext i1 %t94 to i64
  store i64 %t95, i64* %reg_28_ptr
  %t96 = load i64, i64* %reg_28_ptr
  %t98 = icmp ne i64 %t96, 0
  %t99 = zext i1 %t98 to i64
  %t97 = icmp ne i64 %t99, 0
  br i1 %t97, label %main_b12, label %main_b13
main_b11:
  %t100 = load i64, i64* %var_total_ptr
  store i64 %t100, i64* %reg_47_ptr
  %t101 = load i64, i64* %var_iter_ptr
  store i64 %t101, i64* %reg_48_ptr
  %t102 = load i64, i64* %reg_47_ptr
  %t103 = load i64, i64* %reg_48_ptr
  %t104 = add i64 %t102, %t103
  store i64 %t104, i64* %reg_49_ptr
  %t105 = load i64, i64* %reg_49_ptr
  store i64 %t105, i64* %var_total_ptr
  br label %main_b7
main_b12:
  br label %main_b11
main_b13:
  br label %main_b14
main_b14:
  %t106 = load double, double* %var_x_ptr
  store double %t106, double* %reg_29_ptr
  %t107 = load double, double* %var_x_ptr
  store double %t107, double* %reg_30_ptr
  %t108 = load double, double* %reg_29_ptr
  %t109 = load double, double* %reg_30_ptr
  %t110 = fmul contract double %t108, %t109
  store double %t110, double* %reg_31_ptr
  %t111 = load double, double* %var_y_ptr
  store double %t111, double* %reg_32_ptr
  %t112 = load double, double* %var_y_ptr
  store double %t112, double* %reg_33_ptr
  %t113 = load double, double* %reg_32_ptr
  %t114 = load double, double* %reg_33_ptr
  %t115 = fmul contract double %t113, %t114
  store double %t115, double* %reg_34_ptr
  %t116 = load double, double* %reg_31_ptr
  %t117 = load double, double* %reg_34_ptr
  %t118 = fsub contract double %t116, %t117
  store double %t118, double* %reg_35_ptr
  %t119 = load double, double* %var_x0_ptr
  store double %t119, double* %reg_36_ptr
  %t120 = load double, double* %reg_35_ptr
  %t121 = load double, double* %reg_36_ptr
  %t122 = fadd contract double %t120, %t121
  store double %t122, double* %reg_37_ptr
  %t123 = load double, double* %reg_37_ptr
  store double %t123, double* %var_xt_ptr
  %t124 = load double, double* %var_x_ptr
  store double %t124, double* %reg_38_ptr
  %t125 = load double, double* %reg_38_ptr
  %t126 = fmul contract double 0x4000000000000000, %t125
  store double %t126, double* %reg_39_ptr
  %t127 = load double, double* %var_y_ptr
  store double %t127, double* %reg_40_ptr
  %t128 = load double, double* %reg_39_ptr
  %t129 = load double, double* %reg_40_ptr
  %t130 = fmul contract double %t128, %t129
  store double %t130, double* %reg_41_ptr
  %t131 = load double, double* %var_y0_ptr
  store double %t131, double* %reg_42_ptr
  %t132 = load double, double* %reg_41_ptr
  %t133 = load double, double* %reg_42_ptr
  %t134 = fadd contract double %t132, %t133
  store double %t134, double* %reg_43_ptr
  %t135 = load double, double* %reg_43_ptr
  store double %t135, double* %var_y_ptr
  %t136 = load double, double* %var_xt_ptr
  store double %t136, double* %reg_44_ptr
  %t137 = load double, double* %reg_44_ptr
  store double %t137, double* %var_x_ptr
  %t138 = load i64, i64* %var_iter_ptr
  store i64 %t138, i64* %reg_45_ptr
  %t139 = load i64, i64* %reg_45_ptr
  %t140 = add i64 %t139, 1
  store i64 %t140, i64* %reg_46_ptr
  %t141 = load i64, i64* %reg_46_ptr
  store i64 %t141, i64* %var_iter_ptr
  br label %main_b9
}

