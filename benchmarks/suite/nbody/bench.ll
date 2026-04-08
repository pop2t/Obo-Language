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

@obo.str.0 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.1 = private unnamed_addr constant [2 x i8] c"y\00"
@obo.str.2 = private unnamed_addr constant [2 x i8] c"z\00"
@obo.str.3 = private unnamed_addr constant [3 x i8] c"vx\00"
@obo.str.4 = private unnamed_addr constant [5 x i8] c"mass\00"
@obo.str.5 = private unnamed_addr constant [3 x i8] c"vy\00"
@obo.str.6 = private unnamed_addr constant [3 x i8] c"vz\00"
@obo.str.7 = private unnamed_addr constant [5 x i8] c"Body\00"

define internal i64 @advance(i8* %arg0, i64 %arg1, double %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca double
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
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
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca double
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca i8*
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
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca double
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca double
  %reg_49_ptr = alloca double
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca double
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca double
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca double
  %reg_57_ptr = alloca double
  %reg_58_ptr = alloca double
  %reg_59_ptr = alloca double
  %reg_60_ptr = alloca double
  %reg_61_ptr = alloca i8*
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca double
  %reg_65_ptr = alloca i8*
  %reg_66_ptr = alloca double
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca double
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca i8*
  %reg_73_ptr = alloca double
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca i8*
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca double
  %reg_78_ptr = alloca double
  %reg_79_ptr = alloca double
  %reg_80_ptr = alloca double
  %reg_81_ptr = alloca i8*
  %reg_82_ptr = alloca i8*
  %reg_83_ptr = alloca double
  %reg_84_ptr = alloca double
  %reg_85_ptr = alloca i8*
  %reg_86_ptr = alloca double
  %reg_87_ptr = alloca double
  %reg_88_ptr = alloca double
  %reg_89_ptr = alloca double
  %reg_90_ptr = alloca double
  %reg_91_ptr = alloca i8*
  %reg_92_ptr = alloca i8*
  %reg_93_ptr = alloca double
  %reg_94_ptr = alloca double
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca double
  %reg_97_ptr = alloca double
  %reg_98_ptr = alloca double
  %reg_99_ptr = alloca double
  %reg_100_ptr = alloca double
  %reg_101_ptr = alloca i8*
  %reg_102_ptr = alloca i8*
  %reg_103_ptr = alloca double
  %reg_104_ptr = alloca double
  %reg_105_ptr = alloca i8*
  %reg_106_ptr = alloca double
  %reg_107_ptr = alloca double
  %reg_108_ptr = alloca double
  %reg_109_ptr = alloca double
  %reg_110_ptr = alloca double
  %reg_111_ptr = alloca i8*
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i64
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca i64
  %reg_116_ptr = alloca i64
  %reg_117_ptr = alloca i64
  %reg_118_ptr = alloca i64
  %reg_119_ptr = alloca i64
  %reg_120_ptr = alloca i8*
  %reg_121_ptr = alloca i64
  %reg_122_ptr = alloca i8*
  %reg_123_ptr = alloca i8*
  %reg_124_ptr = alloca double
  %reg_125_ptr = alloca double
  %reg_126_ptr = alloca i8*
  %reg_127_ptr = alloca double
  %reg_128_ptr = alloca double
  %reg_129_ptr = alloca double
  %reg_130_ptr = alloca i8*
  %reg_131_ptr = alloca i8*
  %reg_132_ptr = alloca double
  %reg_133_ptr = alloca double
  %reg_134_ptr = alloca i8*
  %reg_135_ptr = alloca double
  %reg_136_ptr = alloca double
  %reg_137_ptr = alloca double
  %reg_138_ptr = alloca i8*
  %reg_139_ptr = alloca i8*
  %reg_140_ptr = alloca double
  %reg_141_ptr = alloca double
  %reg_142_ptr = alloca i8*
  %reg_143_ptr = alloca double
  %reg_144_ptr = alloca double
  %reg_145_ptr = alloca double
  %reg_146_ptr = alloca i8*
  %reg_147_ptr = alloca i64
  %reg_148_ptr = alloca i64
  %var_bj_ptr = alloca i8*
  %var_j_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_bodies_ptr = alloca i8*
  %var_dx_ptr = alloca double
  %var_bi_ptr = alloca i8*
  %var_dz_ptr = alloca double
  %var_mag_ptr = alloca double
  %var_nbodies_ptr = alloca i64
  %var_dy_ptr = alloca double
  %var_dist_ptr = alloca double
  %var_dist2_ptr = alloca double
  %var_dt_ptr = alloca double
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store double %arg2, double* %reg_2_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_bodies_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_nbodies_ptr
  %t2 = load double, double* %reg_2_ptr
  store double %t2, double* %var_dt_ptr
  store i64 0, i64* %var_i_ptr
  %t3 = load i64, i64* %var_nbodies_ptr
  store i64 %t3, i64* %reg_3_ptr
  store i64 1, i64* %reg_4_ptr
  br label %advance_b1
advance_b1:
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
  br i1 %t10, label %advance_b2, label %advance_b4
advance_b2:
  %t13 = load i8*, i8** %var_bodies_ptr
  store i8* %t13, i8** %reg_7_ptr
  %t14 = load i64, i64* %var_i_ptr
  store i64 %t14, i64* %reg_8_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = mul i64 %t16, 16
  %t18 = add i64 %t17, 16
  %t19 = getelementptr i8, i8* %t15, i64 %t18
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %reg_9_ptr
  store i8* %t20, i8** %var_bi_ptr
  %t21 = load i64, i64* %var_i_ptr
  store i64 %t21, i64* %reg_10_ptr
  %t22 = load i64, i64* %reg_10_ptr
  %t23 = add i64 %t22, 1
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  store i64 %t24, i64* %var_j_ptr
  %t25 = load i64, i64* %var_nbodies_ptr
  store i64 %t25, i64* %reg_12_ptr
  store i64 1, i64* %reg_13_ptr
  br label %advance_b5
advance_b3:
  %t26 = load i64, i64* %var_i_ptr
  store i64 %t26, i64* %reg_114_ptr
  %t27 = load i64, i64* %reg_114_ptr
  %t28 = load i64, i64* %reg_4_ptr
  %t29 = add i64 %t27, %t28
  store i64 %t29, i64* %reg_115_ptr
  %t30 = load i64, i64* %reg_115_ptr
  store i64 %t30, i64* %var_i_ptr
  br label %advance_b1
advance_b4:
  store i64 0, i64* %var_i_ptr
  %t31 = load i64, i64* %var_nbodies_ptr
  store i64 %t31, i64* %reg_116_ptr
  store i64 1, i64* %reg_117_ptr
  br label %advance_b9
advance_b5:
  %t32 = load i64, i64* %var_j_ptr
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t34 = load i64, i64* %reg_12_ptr
  %t35 = icmp slt i64 %t33, %t34
  %t36 = zext i1 %t35 to i64
  store i64 %t36, i64* %reg_15_ptr
  %t37 = load i64, i64* %reg_15_ptr
  %t39 = icmp ne i64 %t37, 0
  %t40 = zext i1 %t39 to i64
  %t38 = icmp ne i64 %t40, 0
  br i1 %t38, label %advance_b6, label %advance_b8
advance_b6:
  %t41 = load i8*, i8** %var_bodies_ptr
  store i8* %t41, i8** %reg_16_ptr
  %t42 = load i64, i64* %var_j_ptr
  store i64 %t42, i64* %reg_17_ptr
  %t43 = load i8*, i8** %reg_16_ptr
  %t44 = load i64, i64* %reg_17_ptr
  %t45 = mul i64 %t44, 16
  %t46 = add i64 %t45, 16
  %t47 = getelementptr i8, i8* %t43, i64 %t46
  store i8* %t47, i8** %reg_18_ptr
  %t48 = load i8*, i8** %reg_18_ptr
  store i8* %t48, i8** %var_bj_ptr
  %t49 = load i8*, i8** %var_bi_ptr
  store i8* %t49, i8** %reg_19_ptr
  %t50 = load i8*, i8** %reg_19_ptr
  %t52 = getelementptr i8, i8* %t50, i64 8
  %t53 = bitcast i8* %t52 to i8**
  %t51 = load i8*, i8** %t53
  %t54 = getelementptr i8, i8* %t51, i64 40
  %t55 = bitcast i8* %t54 to double*
  %t56 = load double, double* %t55
  store double %t56, double* %reg_20_ptr
  %t57 = load i8*, i8** %var_bj_ptr
  store i8* %t57, i8** %reg_21_ptr
  %t58 = load i8*, i8** %reg_21_ptr
  %t60 = getelementptr i8, i8* %t58, i64 8
  %t61 = bitcast i8* %t60 to i8**
  %t59 = load i8*, i8** %t61
  %t62 = getelementptr i8, i8* %t59, i64 40
  %t63 = bitcast i8* %t62 to double*
  %t64 = load double, double* %t63
  store double %t64, double* %reg_22_ptr
  %t65 = load double, double* %reg_20_ptr
  %t66 = load double, double* %reg_22_ptr
  %t67 = fsub contract double %t65, %t66
  store double %t67, double* %reg_23_ptr
  %t68 = load double, double* %reg_23_ptr
  store double %t68, double* %var_dx_ptr
  %t69 = load i8*, i8** %var_bi_ptr
  store i8* %t69, i8** %reg_24_ptr
  %t70 = load i8*, i8** %reg_24_ptr
  %t71 = getelementptr i8, i8* %t51, i64 56
  %t72 = bitcast i8* %t71 to double*
  %t73 = load double, double* %t72
  store double %t73, double* %reg_25_ptr
  %t74 = load i8*, i8** %var_bj_ptr
  store i8* %t74, i8** %reg_26_ptr
  %t75 = load i8*, i8** %reg_26_ptr
  %t76 = getelementptr i8, i8* %t59, i64 56
  %t77 = bitcast i8* %t76 to double*
  %t78 = load double, double* %t77
  store double %t78, double* %reg_27_ptr
  %t79 = load double, double* %reg_25_ptr
  %t80 = load double, double* %reg_27_ptr
  %t81 = fsub contract double %t79, %t80
  store double %t81, double* %reg_28_ptr
  %t82 = load double, double* %reg_28_ptr
  store double %t82, double* %var_dy_ptr
  %t83 = load i8*, i8** %var_bi_ptr
  store i8* %t83, i8** %reg_29_ptr
  %t84 = load i8*, i8** %reg_29_ptr
  %t85 = getelementptr i8, i8* %t51, i64 72
  %t86 = bitcast i8* %t85 to double*
  %t87 = load double, double* %t86
  store double %t87, double* %reg_30_ptr
  %t88 = load i8*, i8** %var_bj_ptr
  store i8* %t88, i8** %reg_31_ptr
  %t89 = load i8*, i8** %reg_31_ptr
  %t90 = getelementptr i8, i8* %t59, i64 72
  %t91 = bitcast i8* %t90 to double*
  %t92 = load double, double* %t91
  store double %t92, double* %reg_32_ptr
  %t93 = load double, double* %reg_30_ptr
  %t94 = load double, double* %reg_32_ptr
  %t95 = fsub contract double %t93, %t94
  store double %t95, double* %reg_33_ptr
  %t96 = load double, double* %reg_33_ptr
  store double %t96, double* %var_dz_ptr
  %t97 = load double, double* %var_dx_ptr
  store double %t97, double* %reg_34_ptr
  %t98 = load double, double* %var_dx_ptr
  store double %t98, double* %reg_35_ptr
  %t99 = load double, double* %reg_34_ptr
  %t100 = load double, double* %reg_35_ptr
  %t101 = fmul contract double %t99, %t100
  store double %t101, double* %reg_36_ptr
  %t102 = load double, double* %var_dy_ptr
  store double %t102, double* %reg_37_ptr
  %t103 = load double, double* %var_dy_ptr
  store double %t103, double* %reg_38_ptr
  %t104 = load double, double* %reg_37_ptr
  %t105 = load double, double* %reg_38_ptr
  %t106 = fmul contract double %t104, %t105
  store double %t106, double* %reg_39_ptr
  %t107 = load double, double* %reg_36_ptr
  %t108 = load double, double* %reg_39_ptr
  %t109 = fadd contract double %t107, %t108
  store double %t109, double* %reg_40_ptr
  %t110 = load double, double* %var_dz_ptr
  store double %t110, double* %reg_41_ptr
  %t111 = load double, double* %var_dz_ptr
  store double %t111, double* %reg_42_ptr
  %t112 = load double, double* %reg_41_ptr
  %t113 = load double, double* %reg_42_ptr
  %t114 = fmul contract double %t112, %t113
  store double %t114, double* %reg_43_ptr
  %t115 = load double, double* %reg_40_ptr
  %t116 = load double, double* %reg_43_ptr
  %t117 = fadd contract double %t115, %t116
  store double %t117, double* %reg_44_ptr
  %t118 = load double, double* %reg_44_ptr
  store double %t118, double* %var_dist2_ptr
  %t119 = load double, double* %var_dist2_ptr
  store double %t119, double* %reg_45_ptr
  %t120 = load double, double* %reg_45_ptr
  %t121 = call double @__sys_Math_sqrt(double %t120)
  store double %t121, double* %reg_46_ptr
  %t122 = load double, double* %reg_46_ptr
  store double %t122, double* %var_dist_ptr
  %t123 = load double, double* %var_dt_ptr
  store double %t123, double* %reg_47_ptr
  %t124 = load double, double* %var_dist2_ptr
  store double %t124, double* %reg_48_ptr
  %t125 = load double, double* %var_dist_ptr
  store double %t125, double* %reg_49_ptr
  %t126 = load double, double* %reg_48_ptr
  %t127 = load double, double* %reg_49_ptr
  %t128 = fmul contract double %t126, %t127
  store double %t128, double* %reg_50_ptr
  %t129 = load double, double* %reg_47_ptr
  %t130 = load double, double* %reg_50_ptr
  %t131 = fdiv contract double %t129, %t130
  store double %t131, double* %reg_51_ptr
  %t132 = load double, double* %reg_51_ptr
  store double %t132, double* %var_mag_ptr
  %t133 = load i8*, i8** %var_bi_ptr
  store i8* %t133, i8** %reg_52_ptr
  %t134 = load i8*, i8** %reg_52_ptr
  %t135 = getelementptr i8, i8* %t51, i64 88
  %t136 = bitcast i8* %t135 to double*
  %t137 = load double, double* %t136
  store double %t137, double* %reg_53_ptr
  %t138 = load double, double* %var_dx_ptr
  store double %t138, double* %reg_54_ptr
  %t139 = load i8*, i8** %var_bj_ptr
  store i8* %t139, i8** %reg_55_ptr
  %t140 = load i8*, i8** %reg_55_ptr
  %t141 = getelementptr i8, i8* %t59, i64 136
  %t142 = bitcast i8* %t141 to double*
  %t143 = load double, double* %t142
  store double %t143, double* %reg_56_ptr
  %t144 = load double, double* %reg_54_ptr
  %t145 = load double, double* %reg_56_ptr
  %t146 = fmul contract double %t144, %t145
  store double %t146, double* %reg_57_ptr
  %t147 = load double, double* %var_mag_ptr
  store double %t147, double* %reg_58_ptr
  %t148 = load double, double* %reg_57_ptr
  %t149 = load double, double* %reg_58_ptr
  %t150 = fmul contract double %t148, %t149
  store double %t150, double* %reg_59_ptr
  %t151 = load double, double* %reg_53_ptr
  %t152 = load double, double* %reg_59_ptr
  %t153 = fsub contract double %t151, %t152
  store double %t153, double* %reg_60_ptr
  %t154 = load i8*, i8** %var_bi_ptr
  store i8* %t154, i8** %reg_61_ptr
  %t155 = load i8*, i8** %reg_61_ptr
  %t156 = load double, double* %reg_60_ptr
  %t157 = getelementptr i8, i8* %t51, i64 88
  %t158 = bitcast i8* %t157 to double*
  store double %t156, double* %t158
  %t159 = load i8*, i8** %var_bi_ptr
  store i8* %t159, i8** %reg_62_ptr
  %t160 = load i8*, i8** %reg_62_ptr
  %t161 = getelementptr i8, i8* %t51, i64 104
  %t162 = bitcast i8* %t161 to double*
  %t163 = load double, double* %t162
  store double %t163, double* %reg_63_ptr
  %t164 = load double, double* %var_dy_ptr
  store double %t164, double* %reg_64_ptr
  %t165 = load i8*, i8** %var_bj_ptr
  store i8* %t165, i8** %reg_65_ptr
  %t166 = load i8*, i8** %reg_65_ptr
  %t167 = getelementptr i8, i8* %t59, i64 136
  %t168 = bitcast i8* %t167 to double*
  %t169 = load double, double* %t168
  store double %t169, double* %reg_66_ptr
  %t170 = load double, double* %reg_64_ptr
  %t171 = load double, double* %reg_66_ptr
  %t172 = fmul contract double %t170, %t171
  store double %t172, double* %reg_67_ptr
  %t173 = load double, double* %var_mag_ptr
  store double %t173, double* %reg_68_ptr
  %t174 = load double, double* %reg_67_ptr
  %t175 = load double, double* %reg_68_ptr
  %t176 = fmul contract double %t174, %t175
  store double %t176, double* %reg_69_ptr
  %t177 = load double, double* %reg_63_ptr
  %t178 = load double, double* %reg_69_ptr
  %t179 = fsub contract double %t177, %t178
  store double %t179, double* %reg_70_ptr
  %t180 = load i8*, i8** %var_bi_ptr
  store i8* %t180, i8** %reg_71_ptr
  %t181 = load i8*, i8** %reg_71_ptr
  %t182 = load double, double* %reg_70_ptr
  %t183 = getelementptr i8, i8* %t51, i64 104
  %t184 = bitcast i8* %t183 to double*
  store double %t182, double* %t184
  %t185 = load i8*, i8** %var_bi_ptr
  store i8* %t185, i8** %reg_72_ptr
  %t186 = load i8*, i8** %reg_72_ptr
  %t187 = getelementptr i8, i8* %t51, i64 120
  %t188 = bitcast i8* %t187 to double*
  %t189 = load double, double* %t188
  store double %t189, double* %reg_73_ptr
  %t190 = load double, double* %var_dz_ptr
  store double %t190, double* %reg_74_ptr
  %t191 = load i8*, i8** %var_bj_ptr
  store i8* %t191, i8** %reg_75_ptr
  %t192 = load i8*, i8** %reg_75_ptr
  %t193 = getelementptr i8, i8* %t59, i64 136
  %t194 = bitcast i8* %t193 to double*
  %t195 = load double, double* %t194
  store double %t195, double* %reg_76_ptr
  %t196 = load double, double* %reg_74_ptr
  %t197 = load double, double* %reg_76_ptr
  %t198 = fmul contract double %t196, %t197
  store double %t198, double* %reg_77_ptr
  %t199 = load double, double* %var_mag_ptr
  store double %t199, double* %reg_78_ptr
  %t200 = load double, double* %reg_77_ptr
  %t201 = load double, double* %reg_78_ptr
  %t202 = fmul contract double %t200, %t201
  store double %t202, double* %reg_79_ptr
  %t203 = load double, double* %reg_73_ptr
  %t204 = load double, double* %reg_79_ptr
  %t205 = fsub contract double %t203, %t204
  store double %t205, double* %reg_80_ptr
  %t206 = load i8*, i8** %var_bi_ptr
  store i8* %t206, i8** %reg_81_ptr
  %t207 = load i8*, i8** %reg_81_ptr
  %t208 = load double, double* %reg_80_ptr
  %t209 = getelementptr i8, i8* %t51, i64 120
  %t210 = bitcast i8* %t209 to double*
  store double %t208, double* %t210
  %t211 = load i8*, i8** %var_bj_ptr
  store i8* %t211, i8** %reg_82_ptr
  %t212 = load i8*, i8** %reg_82_ptr
  %t213 = getelementptr i8, i8* %t59, i64 88
  %t214 = bitcast i8* %t213 to double*
  %t215 = load double, double* %t214
  store double %t215, double* %reg_83_ptr
  %t216 = load double, double* %var_dx_ptr
  store double %t216, double* %reg_84_ptr
  %t217 = load i8*, i8** %var_bi_ptr
  store i8* %t217, i8** %reg_85_ptr
  %t218 = load i8*, i8** %reg_85_ptr
  %t219 = getelementptr i8, i8* %t51, i64 136
  %t220 = bitcast i8* %t219 to double*
  %t221 = load double, double* %t220
  store double %t221, double* %reg_86_ptr
  %t222 = load double, double* %reg_84_ptr
  %t223 = load double, double* %reg_86_ptr
  %t224 = fmul contract double %t222, %t223
  store double %t224, double* %reg_87_ptr
  %t225 = load double, double* %var_mag_ptr
  store double %t225, double* %reg_88_ptr
  %t226 = load double, double* %reg_87_ptr
  %t227 = load double, double* %reg_88_ptr
  %t228 = fmul contract double %t226, %t227
  store double %t228, double* %reg_89_ptr
  %t229 = load double, double* %reg_83_ptr
  %t230 = load double, double* %reg_89_ptr
  %t231 = fadd contract double %t229, %t230
  store double %t231, double* %reg_90_ptr
  %t232 = load i8*, i8** %var_bj_ptr
  store i8* %t232, i8** %reg_91_ptr
  %t233 = load i8*, i8** %reg_91_ptr
  %t234 = load double, double* %reg_90_ptr
  %t235 = getelementptr i8, i8* %t59, i64 88
  %t236 = bitcast i8* %t235 to double*
  store double %t234, double* %t236
  %t237 = load i8*, i8** %var_bj_ptr
  store i8* %t237, i8** %reg_92_ptr
  %t238 = load i8*, i8** %reg_92_ptr
  %t239 = getelementptr i8, i8* %t59, i64 104
  %t240 = bitcast i8* %t239 to double*
  %t241 = load double, double* %t240
  store double %t241, double* %reg_93_ptr
  %t242 = load double, double* %var_dy_ptr
  store double %t242, double* %reg_94_ptr
  %t243 = load i8*, i8** %var_bi_ptr
  store i8* %t243, i8** %reg_95_ptr
  %t244 = load i8*, i8** %reg_95_ptr
  %t245 = getelementptr i8, i8* %t51, i64 136
  %t246 = bitcast i8* %t245 to double*
  %t247 = load double, double* %t246
  store double %t247, double* %reg_96_ptr
  %t248 = load double, double* %reg_94_ptr
  %t249 = load double, double* %reg_96_ptr
  %t250 = fmul contract double %t248, %t249
  store double %t250, double* %reg_97_ptr
  %t251 = load double, double* %var_mag_ptr
  store double %t251, double* %reg_98_ptr
  %t252 = load double, double* %reg_97_ptr
  %t253 = load double, double* %reg_98_ptr
  %t254 = fmul contract double %t252, %t253
  store double %t254, double* %reg_99_ptr
  %t255 = load double, double* %reg_93_ptr
  %t256 = load double, double* %reg_99_ptr
  %t257 = fadd contract double %t255, %t256
  store double %t257, double* %reg_100_ptr
  %t258 = load i8*, i8** %var_bj_ptr
  store i8* %t258, i8** %reg_101_ptr
  %t259 = load i8*, i8** %reg_101_ptr
  %t260 = load double, double* %reg_100_ptr
  %t261 = getelementptr i8, i8* %t59, i64 104
  %t262 = bitcast i8* %t261 to double*
  store double %t260, double* %t262
  %t263 = load i8*, i8** %var_bj_ptr
  store i8* %t263, i8** %reg_102_ptr
  %t264 = load i8*, i8** %reg_102_ptr
  %t265 = getelementptr i8, i8* %t59, i64 120
  %t266 = bitcast i8* %t265 to double*
  %t267 = load double, double* %t266
  store double %t267, double* %reg_103_ptr
  %t268 = load double, double* %var_dz_ptr
  store double %t268, double* %reg_104_ptr
  %t269 = load i8*, i8** %var_bi_ptr
  store i8* %t269, i8** %reg_105_ptr
  %t270 = load i8*, i8** %reg_105_ptr
  %t271 = getelementptr i8, i8* %t51, i64 136
  %t272 = bitcast i8* %t271 to double*
  %t273 = load double, double* %t272
  store double %t273, double* %reg_106_ptr
  %t274 = load double, double* %reg_104_ptr
  %t275 = load double, double* %reg_106_ptr
  %t276 = fmul contract double %t274, %t275
  store double %t276, double* %reg_107_ptr
  %t277 = load double, double* %var_mag_ptr
  store double %t277, double* %reg_108_ptr
  %t278 = load double, double* %reg_107_ptr
  %t279 = load double, double* %reg_108_ptr
  %t280 = fmul contract double %t278, %t279
  store double %t280, double* %reg_109_ptr
  %t281 = load double, double* %reg_103_ptr
  %t282 = load double, double* %reg_109_ptr
  %t283 = fadd contract double %t281, %t282
  store double %t283, double* %reg_110_ptr
  %t284 = load i8*, i8** %var_bj_ptr
  store i8* %t284, i8** %reg_111_ptr
  %t285 = load i8*, i8** %reg_111_ptr
  %t286 = load double, double* %reg_110_ptr
  %t287 = getelementptr i8, i8* %t59, i64 120
  %t288 = bitcast i8* %t287 to double*
  store double %t286, double* %t288
  br label %advance_b7
advance_b7:
  %t289 = load i64, i64* %var_j_ptr
  store i64 %t289, i64* %reg_112_ptr
  %t290 = load i64, i64* %reg_112_ptr
  %t291 = load i64, i64* %reg_13_ptr
  %t292 = add i64 %t290, %t291
  store i64 %t292, i64* %reg_113_ptr
  %t293 = load i64, i64* %reg_113_ptr
  store i64 %t293, i64* %var_j_ptr
  br label %advance_b5
advance_b8:
  br label %advance_b3
advance_b9:
  %t294 = load i64, i64* %var_i_ptr
  store i64 %t294, i64* %reg_118_ptr
  %t295 = load i64, i64* %reg_118_ptr
  %t296 = load i64, i64* %reg_116_ptr
  %t297 = icmp slt i64 %t295, %t296
  %t298 = zext i1 %t297 to i64
  store i64 %t298, i64* %reg_119_ptr
  %t299 = load i64, i64* %reg_119_ptr
  %t301 = icmp ne i64 %t299, 0
  %t302 = zext i1 %t301 to i64
  %t300 = icmp ne i64 %t302, 0
  br i1 %t300, label %advance_b10, label %advance_b12
advance_b10:
  %t303 = load i8*, i8** %var_bodies_ptr
  store i8* %t303, i8** %reg_120_ptr
  %t304 = load i64, i64* %var_i_ptr
  store i64 %t304, i64* %reg_121_ptr
  %t305 = load i8*, i8** %reg_120_ptr
  %t306 = load i64, i64* %reg_121_ptr
  %t307 = mul i64 %t306, 16
  %t308 = add i64 %t307, 16
  %t309 = getelementptr i8, i8* %t305, i64 %t308
  store i8* %t309, i8** %reg_122_ptr
  %t310 = load i8*, i8** %reg_122_ptr
  store i8* %t310, i8** %var_bi_ptr
  %t311 = load i8*, i8** %var_bi_ptr
  store i8* %t311, i8** %reg_123_ptr
  %t312 = load i8*, i8** %reg_123_ptr
  %t314 = getelementptr i8, i8* %t312, i64 8
  %t315 = bitcast i8* %t314 to i8**
  %t313 = load i8*, i8** %t315
  %t316 = getelementptr i8, i8* %t313, i64 40
  %t317 = bitcast i8* %t316 to double*
  %t318 = load double, double* %t317
  store double %t318, double* %reg_124_ptr
  %t319 = load double, double* %var_dt_ptr
  store double %t319, double* %reg_125_ptr
  %t320 = load i8*, i8** %var_bi_ptr
  store i8* %t320, i8** %reg_126_ptr
  %t321 = load i8*, i8** %reg_126_ptr
  %t322 = getelementptr i8, i8* %t313, i64 88
  %t323 = bitcast i8* %t322 to double*
  %t324 = load double, double* %t323
  store double %t324, double* %reg_127_ptr
  %t325 = load double, double* %reg_125_ptr
  %t326 = load double, double* %reg_127_ptr
  %t327 = fmul contract double %t325, %t326
  store double %t327, double* %reg_128_ptr
  %t328 = load double, double* %reg_124_ptr
  %t329 = load double, double* %reg_128_ptr
  %t330 = fadd contract double %t328, %t329
  store double %t330, double* %reg_129_ptr
  %t331 = load i8*, i8** %var_bi_ptr
  store i8* %t331, i8** %reg_130_ptr
  %t332 = load i8*, i8** %reg_130_ptr
  %t333 = load double, double* %reg_129_ptr
  %t334 = getelementptr i8, i8* %t313, i64 40
  %t335 = bitcast i8* %t334 to double*
  store double %t333, double* %t335
  %t336 = load i8*, i8** %var_bi_ptr
  store i8* %t336, i8** %reg_131_ptr
  %t337 = load i8*, i8** %reg_131_ptr
  %t338 = getelementptr i8, i8* %t313, i64 56
  %t339 = bitcast i8* %t338 to double*
  %t340 = load double, double* %t339
  store double %t340, double* %reg_132_ptr
  %t341 = load double, double* %var_dt_ptr
  store double %t341, double* %reg_133_ptr
  %t342 = load i8*, i8** %var_bi_ptr
  store i8* %t342, i8** %reg_134_ptr
  %t343 = load i8*, i8** %reg_134_ptr
  %t344 = getelementptr i8, i8* %t313, i64 104
  %t345 = bitcast i8* %t344 to double*
  %t346 = load double, double* %t345
  store double %t346, double* %reg_135_ptr
  %t347 = load double, double* %reg_133_ptr
  %t348 = load double, double* %reg_135_ptr
  %t349 = fmul contract double %t347, %t348
  store double %t349, double* %reg_136_ptr
  %t350 = load double, double* %reg_132_ptr
  %t351 = load double, double* %reg_136_ptr
  %t352 = fadd contract double %t350, %t351
  store double %t352, double* %reg_137_ptr
  %t353 = load i8*, i8** %var_bi_ptr
  store i8* %t353, i8** %reg_138_ptr
  %t354 = load i8*, i8** %reg_138_ptr
  %t355 = load double, double* %reg_137_ptr
  %t356 = getelementptr i8, i8* %t313, i64 56
  %t357 = bitcast i8* %t356 to double*
  store double %t355, double* %t357
  %t358 = load i8*, i8** %var_bi_ptr
  store i8* %t358, i8** %reg_139_ptr
  %t359 = load i8*, i8** %reg_139_ptr
  %t360 = getelementptr i8, i8* %t313, i64 72
  %t361 = bitcast i8* %t360 to double*
  %t362 = load double, double* %t361
  store double %t362, double* %reg_140_ptr
  %t363 = load double, double* %var_dt_ptr
  store double %t363, double* %reg_141_ptr
  %t364 = load i8*, i8** %var_bi_ptr
  store i8* %t364, i8** %reg_142_ptr
  %t365 = load i8*, i8** %reg_142_ptr
  %t366 = getelementptr i8, i8* %t313, i64 120
  %t367 = bitcast i8* %t366 to double*
  %t368 = load double, double* %t367
  store double %t368, double* %reg_143_ptr
  %t369 = load double, double* %reg_141_ptr
  %t370 = load double, double* %reg_143_ptr
  %t371 = fmul contract double %t369, %t370
  store double %t371, double* %reg_144_ptr
  %t372 = load double, double* %reg_140_ptr
  %t373 = load double, double* %reg_144_ptr
  %t374 = fadd contract double %t372, %t373
  store double %t374, double* %reg_145_ptr
  %t375 = load i8*, i8** %var_bi_ptr
  store i8* %t375, i8** %reg_146_ptr
  %t376 = load i8*, i8** %reg_146_ptr
  %t377 = load double, double* %reg_145_ptr
  %t378 = getelementptr i8, i8* %t313, i64 72
  %t379 = bitcast i8* %t378 to double*
  store double %t377, double* %t379
  br label %advance_b11
advance_b11:
  %t380 = load i64, i64* %var_i_ptr
  store i64 %t380, i64* %reg_147_ptr
  %t381 = load i64, i64* %reg_147_ptr
  %t382 = load i64, i64* %reg_117_ptr
  %t383 = add i64 %t381, %t382
  store i64 %t383, i64* %reg_148_ptr
  %t384 = load i64, i64* %reg_148_ptr
  store i64 %t384, i64* %var_i_ptr
  br label %advance_b9
advance_b12:
  ret i64 0
}

define internal double @energy(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca double
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca double
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca double
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca double
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca double
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca double
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca i8*
  %reg_49_ptr = alloca double
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca double
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca double
  %reg_56_ptr = alloca double
  %reg_57_ptr = alloca double
  %reg_58_ptr = alloca double
  %reg_59_ptr = alloca double
  %reg_60_ptr = alloca double
  %reg_61_ptr = alloca double
  %reg_62_ptr = alloca double
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca double
  %reg_65_ptr = alloca double
  %reg_66_ptr = alloca double
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca i8*
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca double
  %reg_73_ptr = alloca double
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca double
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca i64
  %reg_78_ptr = alloca i64
  %reg_79_ptr = alloca i64
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca double
  %var_e_ptr = alloca double
  %var_bi_ptr = alloca i8*
  %var_bodies_ptr = alloca i8*
  %var_dy_ptr = alloca double
  %var_i_ptr = alloca i64
  %var_nbodies_ptr = alloca i64
  %var_dx_ptr = alloca double
  %var_dist_ptr = alloca double
  %var_j_ptr = alloca i64
  %var_bj_ptr = alloca i8*
  %var_dz_ptr = alloca double
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_bodies_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_nbodies_ptr
  store double 0x0000000000000000, double* %var_e_ptr
  store i64 0, i64* %var_i_ptr
  %t2 = load i64, i64* %var_nbodies_ptr
  store i64 %t2, i64* %reg_2_ptr
  store i64 1, i64* %reg_3_ptr
  br label %energy_b1
energy_b1:
  %t3 = load i64, i64* %var_i_ptr
  store i64 %t3, i64* %reg_4_ptr
  %t4 = load i64, i64* %reg_4_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t6 = icmp slt i64 %t4, %t5
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_5_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %energy_b2, label %energy_b4
energy_b2:
  %t12 = load i8*, i8** %var_bodies_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i64, i64* %var_i_ptr
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i8*, i8** %reg_6_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = mul i64 %t15, 16
  %t17 = add i64 %t16, 16
  %t18 = getelementptr i8, i8* %t14, i64 %t17
  store i8* %t18, i8** %reg_8_ptr
  %t19 = load i8*, i8** %reg_8_ptr
  store i8* %t19, i8** %var_bi_ptr
  %t20 = load double, double* %var_e_ptr
  store double %t20, double* %reg_9_ptr
  %t21 = load i8*, i8** %var_bi_ptr
  store i8* %t21, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_10_ptr
  %t24 = getelementptr i8, i8* %t22, i64 8
  %t25 = bitcast i8* %t24 to i8**
  %t23 = load i8*, i8** %t25
  %t26 = getelementptr i8, i8* %t23, i64 136
  %t27 = bitcast i8* %t26 to double*
  %t28 = load double, double* %t27
  store double %t28, double* %reg_11_ptr
  %t29 = load double, double* %reg_11_ptr
  %t30 = fmul contract double 0x3FE0000000000000, %t29
  store double %t30, double* %reg_12_ptr
  %t31 = load i8*, i8** %var_bi_ptr
  store i8* %t31, i8** %reg_13_ptr
  %t32 = load i8*, i8** %reg_13_ptr
  %t33 = getelementptr i8, i8* %t23, i64 88
  %t34 = bitcast i8* %t33 to double*
  %t35 = load double, double* %t34
  store double %t35, double* %reg_14_ptr
  %t36 = load i8*, i8** %var_bi_ptr
  store i8* %t36, i8** %reg_15_ptr
  %t37 = load i8*, i8** %reg_15_ptr
  %t38 = getelementptr i8, i8* %t23, i64 88
  %t39 = bitcast i8* %t38 to double*
  %t40 = load double, double* %t39
  store double %t40, double* %reg_16_ptr
  %t41 = load double, double* %reg_14_ptr
  %t42 = load double, double* %reg_16_ptr
  %t43 = fmul contract double %t41, %t42
  store double %t43, double* %reg_17_ptr
  %t44 = load i8*, i8** %var_bi_ptr
  store i8* %t44, i8** %reg_18_ptr
  %t45 = load i8*, i8** %reg_18_ptr
  %t46 = getelementptr i8, i8* %t23, i64 104
  %t47 = bitcast i8* %t46 to double*
  %t48 = load double, double* %t47
  store double %t48, double* %reg_19_ptr
  %t49 = load i8*, i8** %var_bi_ptr
  store i8* %t49, i8** %reg_20_ptr
  %t50 = load i8*, i8** %reg_20_ptr
  %t51 = getelementptr i8, i8* %t23, i64 104
  %t52 = bitcast i8* %t51 to double*
  %t53 = load double, double* %t52
  store double %t53, double* %reg_21_ptr
  %t54 = load double, double* %reg_19_ptr
  %t55 = load double, double* %reg_21_ptr
  %t56 = fmul contract double %t54, %t55
  store double %t56, double* %reg_22_ptr
  %t57 = load double, double* %reg_17_ptr
  %t58 = load double, double* %reg_22_ptr
  %t59 = fadd contract double %t57, %t58
  store double %t59, double* %reg_23_ptr
  %t60 = load i8*, i8** %var_bi_ptr
  store i8* %t60, i8** %reg_24_ptr
  %t61 = load i8*, i8** %reg_24_ptr
  %t62 = getelementptr i8, i8* %t23, i64 120
  %t63 = bitcast i8* %t62 to double*
  %t64 = load double, double* %t63
  store double %t64, double* %reg_25_ptr
  %t65 = load i8*, i8** %var_bi_ptr
  store i8* %t65, i8** %reg_26_ptr
  %t66 = load i8*, i8** %reg_26_ptr
  %t67 = getelementptr i8, i8* %t23, i64 120
  %t68 = bitcast i8* %t67 to double*
  %t69 = load double, double* %t68
  store double %t69, double* %reg_27_ptr
  %t70 = load double, double* %reg_25_ptr
  %t71 = load double, double* %reg_27_ptr
  %t72 = fmul contract double %t70, %t71
  store double %t72, double* %reg_28_ptr
  %t73 = load double, double* %reg_23_ptr
  %t74 = load double, double* %reg_28_ptr
  %t75 = fadd contract double %t73, %t74
  store double %t75, double* %reg_29_ptr
  %t76 = load double, double* %reg_12_ptr
  %t77 = load double, double* %reg_29_ptr
  %t78 = fmul contract double %t76, %t77
  store double %t78, double* %reg_30_ptr
  %t79 = load double, double* %reg_9_ptr
  %t80 = load double, double* %reg_30_ptr
  %t81 = fadd contract double %t79, %t80
  store double %t81, double* %reg_31_ptr
  %t82 = load double, double* %reg_31_ptr
  store double %t82, double* %var_e_ptr
  %t83 = load i64, i64* %var_i_ptr
  store i64 %t83, i64* %reg_32_ptr
  %t84 = load i64, i64* %reg_32_ptr
  %t85 = add i64 %t84, 1
  store i64 %t85, i64* %reg_33_ptr
  %t86 = load i64, i64* %reg_33_ptr
  store i64 %t86, i64* %var_j_ptr
  %t87 = load i64, i64* %var_nbodies_ptr
  store i64 %t87, i64* %reg_34_ptr
  store i64 1, i64* %reg_35_ptr
  br label %energy_b5
energy_b3:
  %t88 = load i64, i64* %var_i_ptr
  store i64 %t88, i64* %reg_79_ptr
  %t89 = load i64, i64* %reg_79_ptr
  %t90 = load i64, i64* %reg_3_ptr
  %t91 = add i64 %t89, %t90
  store i64 %t91, i64* %reg_80_ptr
  %t92 = load i64, i64* %reg_80_ptr
  store i64 %t92, i64* %var_i_ptr
  br label %energy_b1
energy_b4:
  %t93 = load double, double* %var_e_ptr
  store double %t93, double* %reg_81_ptr
  %t94 = load double, double* %reg_81_ptr
  ret double %t94
energy_b5:
  %t95 = load i64, i64* %var_j_ptr
  store i64 %t95, i64* %reg_36_ptr
  %t96 = load i64, i64* %reg_36_ptr
  %t97 = load i64, i64* %reg_34_ptr
  %t98 = icmp slt i64 %t96, %t97
  %t99 = zext i1 %t98 to i64
  store i64 %t99, i64* %reg_37_ptr
  %t100 = load i64, i64* %reg_37_ptr
  %t102 = icmp ne i64 %t100, 0
  %t103 = zext i1 %t102 to i64
  %t101 = icmp ne i64 %t103, 0
  br i1 %t101, label %energy_b6, label %energy_b8
energy_b6:
  %t104 = load i8*, i8** %var_bodies_ptr
  store i8* %t104, i8** %reg_38_ptr
  %t105 = load i64, i64* %var_j_ptr
  store i64 %t105, i64* %reg_39_ptr
  %t106 = load i8*, i8** %reg_38_ptr
  %t107 = load i64, i64* %reg_39_ptr
  %t108 = mul i64 %t107, 16
  %t109 = add i64 %t108, 16
  %t110 = getelementptr i8, i8* %t106, i64 %t109
  store i8* %t110, i8** %reg_40_ptr
  %t111 = load i8*, i8** %reg_40_ptr
  store i8* %t111, i8** %var_bj_ptr
  %t112 = load i8*, i8** %var_bi_ptr
  store i8* %t112, i8** %reg_41_ptr
  %t113 = load i8*, i8** %reg_41_ptr
  %t115 = getelementptr i8, i8* %t113, i64 8
  %t116 = bitcast i8* %t115 to i8**
  %t114 = load i8*, i8** %t116
  %t117 = getelementptr i8, i8* %t114, i64 40
  %t118 = bitcast i8* %t117 to double*
  %t119 = load double, double* %t118
  store double %t119, double* %reg_42_ptr
  %t120 = load i8*, i8** %var_bj_ptr
  store i8* %t120, i8** %reg_43_ptr
  %t121 = load i8*, i8** %reg_43_ptr
  %t123 = getelementptr i8, i8* %t121, i64 8
  %t124 = bitcast i8* %t123 to i8**
  %t122 = load i8*, i8** %t124
  %t125 = getelementptr i8, i8* %t122, i64 40
  %t126 = bitcast i8* %t125 to double*
  %t127 = load double, double* %t126
  store double %t127, double* %reg_44_ptr
  %t128 = load double, double* %reg_42_ptr
  %t129 = load double, double* %reg_44_ptr
  %t130 = fsub contract double %t128, %t129
  store double %t130, double* %reg_45_ptr
  %t131 = load double, double* %reg_45_ptr
  store double %t131, double* %var_dx_ptr
  %t132 = load i8*, i8** %var_bi_ptr
  store i8* %t132, i8** %reg_46_ptr
  %t133 = load i8*, i8** %reg_46_ptr
  %t134 = getelementptr i8, i8* %t114, i64 56
  %t135 = bitcast i8* %t134 to double*
  %t136 = load double, double* %t135
  store double %t136, double* %reg_47_ptr
  %t137 = load i8*, i8** %var_bj_ptr
  store i8* %t137, i8** %reg_48_ptr
  %t138 = load i8*, i8** %reg_48_ptr
  %t139 = getelementptr i8, i8* %t122, i64 56
  %t140 = bitcast i8* %t139 to double*
  %t141 = load double, double* %t140
  store double %t141, double* %reg_49_ptr
  %t142 = load double, double* %reg_47_ptr
  %t143 = load double, double* %reg_49_ptr
  %t144 = fsub contract double %t142, %t143
  store double %t144, double* %reg_50_ptr
  %t145 = load double, double* %reg_50_ptr
  store double %t145, double* %var_dy_ptr
  %t146 = load i8*, i8** %var_bi_ptr
  store i8* %t146, i8** %reg_51_ptr
  %t147 = load i8*, i8** %reg_51_ptr
  %t148 = getelementptr i8, i8* %t114, i64 72
  %t149 = bitcast i8* %t148 to double*
  %t150 = load double, double* %t149
  store double %t150, double* %reg_52_ptr
  %t151 = load i8*, i8** %var_bj_ptr
  store i8* %t151, i8** %reg_53_ptr
  %t152 = load i8*, i8** %reg_53_ptr
  %t153 = getelementptr i8, i8* %t122, i64 72
  %t154 = bitcast i8* %t153 to double*
  %t155 = load double, double* %t154
  store double %t155, double* %reg_54_ptr
  %t156 = load double, double* %reg_52_ptr
  %t157 = load double, double* %reg_54_ptr
  %t158 = fsub contract double %t156, %t157
  store double %t158, double* %reg_55_ptr
  %t159 = load double, double* %reg_55_ptr
  store double %t159, double* %var_dz_ptr
  %t160 = load double, double* %var_dx_ptr
  store double %t160, double* %reg_56_ptr
  %t161 = load double, double* %var_dx_ptr
  store double %t161, double* %reg_57_ptr
  %t162 = load double, double* %reg_56_ptr
  %t163 = load double, double* %reg_57_ptr
  %t164 = fmul contract double %t162, %t163
  store double %t164, double* %reg_58_ptr
  %t165 = load double, double* %var_dy_ptr
  store double %t165, double* %reg_59_ptr
  %t166 = load double, double* %var_dy_ptr
  store double %t166, double* %reg_60_ptr
  %t167 = load double, double* %reg_59_ptr
  %t168 = load double, double* %reg_60_ptr
  %t169 = fmul contract double %t167, %t168
  store double %t169, double* %reg_61_ptr
  %t170 = load double, double* %reg_58_ptr
  %t171 = load double, double* %reg_61_ptr
  %t172 = fadd contract double %t170, %t171
  store double %t172, double* %reg_62_ptr
  %t173 = load double, double* %var_dz_ptr
  store double %t173, double* %reg_63_ptr
  %t174 = load double, double* %var_dz_ptr
  store double %t174, double* %reg_64_ptr
  %t175 = load double, double* %reg_63_ptr
  %t176 = load double, double* %reg_64_ptr
  %t177 = fmul contract double %t175, %t176
  store double %t177, double* %reg_65_ptr
  %t178 = load double, double* %reg_62_ptr
  %t179 = load double, double* %reg_65_ptr
  %t180 = fadd contract double %t178, %t179
  store double %t180, double* %reg_66_ptr
  %t181 = load double, double* %reg_66_ptr
  %t182 = call double @__sys_Math_sqrt(double %t181)
  store double %t182, double* %reg_67_ptr
  %t183 = load double, double* %reg_67_ptr
  store double %t183, double* %var_dist_ptr
  %t184 = load double, double* %var_e_ptr
  store double %t184, double* %reg_68_ptr
  %t185 = load i8*, i8** %var_bi_ptr
  store i8* %t185, i8** %reg_69_ptr
  %t186 = load i8*, i8** %reg_69_ptr
  %t187 = getelementptr i8, i8* %t114, i64 136
  %t188 = bitcast i8* %t187 to double*
  %t189 = load double, double* %t188
  store double %t189, double* %reg_70_ptr
  %t190 = load i8*, i8** %var_bj_ptr
  store i8* %t190, i8** %reg_71_ptr
  %t191 = load i8*, i8** %reg_71_ptr
  %t192 = getelementptr i8, i8* %t122, i64 136
  %t193 = bitcast i8* %t192 to double*
  %t194 = load double, double* %t193
  store double %t194, double* %reg_72_ptr
  %t195 = load double, double* %reg_70_ptr
  %t196 = load double, double* %reg_72_ptr
  %t197 = fmul contract double %t195, %t196
  store double %t197, double* %reg_73_ptr
  %t198 = load double, double* %var_dist_ptr
  store double %t198, double* %reg_74_ptr
  %t199 = load double, double* %reg_73_ptr
  %t200 = load double, double* %reg_74_ptr
  %t201 = fdiv contract double %t199, %t200
  store double %t201, double* %reg_75_ptr
  %t202 = load double, double* %reg_68_ptr
  %t203 = load double, double* %reg_75_ptr
  %t204 = fsub contract double %t202, %t203
  store double %t204, double* %reg_76_ptr
  %t205 = load double, double* %reg_76_ptr
  store double %t205, double* %var_e_ptr
  br label %energy_b7
energy_b7:
  %t206 = load i64, i64* %var_j_ptr
  store i64 %t206, i64* %reg_77_ptr
  %t207 = load i64, i64* %reg_77_ptr
  %t208 = load i64, i64* %reg_35_ptr
  %t209 = add i64 %t207, %t208
  store i64 %t209, i64* %reg_78_ptr
  %t210 = load i64, i64* %reg_78_ptr
  store i64 %t210, i64* %var_j_ptr
  br label %energy_b5
energy_b8:
  br label %energy_b3
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca double
  %reg_1_ptr = alloca double
  %reg_2_ptr = alloca double
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca double
  %reg_5_ptr = alloca double
  %reg_6_ptr = alloca double
  %reg_7_ptr = alloca double
  %reg_8_ptr = alloca double
  %reg_9_ptr = alloca double
  %reg_10_ptr = alloca double
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca double
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca double
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca double
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca double
  %reg_21_ptr = alloca double
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca double
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca double
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca double
  %reg_32_ptr = alloca double
  %reg_33_ptr = alloca double
  %reg_34_ptr = alloca double
  %reg_35_ptr = alloca double
  %reg_36_ptr = alloca double
  %reg_37_ptr = alloca double
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca double
  %reg_41_ptr = alloca double
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca double
  %reg_44_ptr = alloca double
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca double
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca double
  %reg_49_ptr = alloca i8*
  %reg_50_ptr = alloca i8*
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i8*
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i64
  %reg_57_ptr = alloca i64
  %reg_58_ptr = alloca i64
  %reg_59_ptr = alloca i64
  %reg_60_ptr = alloca i8*
  %reg_61_ptr = alloca i64
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca i8*
  %reg_65_ptr = alloca double
  %reg_66_ptr = alloca i8*
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca double
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca double
  %reg_73_ptr = alloca i8*
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca double
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca double
  %reg_78_ptr = alloca i8*
  %reg_79_ptr = alloca double
  %reg_80_ptr = alloca i8*
  %reg_81_ptr = alloca double
  %reg_82_ptr = alloca double
  %reg_83_ptr = alloca double
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i64
  %reg_86_ptr = alloca double
  %reg_87_ptr = alloca double
  %reg_88_ptr = alloca double
  %reg_89_ptr = alloca double
  %reg_90_ptr = alloca i8*
  %reg_91_ptr = alloca double
  %reg_92_ptr = alloca double
  %reg_93_ptr = alloca double
  %reg_94_ptr = alloca double
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca double
  %reg_97_ptr = alloca double
  %reg_98_ptr = alloca double
  %reg_99_ptr = alloca double
  %reg_100_ptr = alloca i8*
  %reg_101_ptr = alloca i8*
  %reg_102_ptr = alloca i64
  %reg_103_ptr = alloca double
  %reg_104_ptr = alloca i64
  %reg_105_ptr = alloca i64
  %reg_106_ptr = alloca i64
  %reg_107_ptr = alloca i64
  %reg_108_ptr = alloca i8*
  %reg_109_ptr = alloca i64
  %reg_110_ptr = alloca i64
  %reg_111_ptr = alloca i64
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i8*
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca double
  %var_uranus_ptr = alloca i8*
  %var_sun_ptr = alloca i8*
  %var_i_ptr = alloca i64
  %var_py_ptr = alloca double
  %var_nbodies_ptr = alloca i64
  %var_saturn_ptr = alloca i8*
  %var_px_ptr = alloca double
  %var_b_ptr = alloca i8*
  %var_n_ptr = alloca i64
  %var_pz_ptr = alloca double
  %var_days_per_year_ptr = alloca double
  %var_jupiter_ptr = alloca i8*
  %var_neptune_ptr = alloca i8*
  %var_bodies_ptr = alloca i8*
  %var_solar_mass_ptr = alloca double
  %gc_root_arr = alloca i8**, i64 7
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %var_uranus_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %var_sun_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_saturn_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_b_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_jupiter_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %var_neptune_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %var_bodies_ptr, i8*** %gc_root_gep_6
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 7)
  %t0 = fmul contract double 0x4010000000000000, 0x400921FB54442D18
  store double %t0, double* %reg_0_ptr
  %t1 = load double, double* %reg_0_ptr
  %t2 = fmul contract double %t1, 0x400921FB54442D18
  store double %t2, double* %reg_1_ptr
  %t3 = load double, double* %reg_1_ptr
  store double %t3, double* %var_solar_mass_ptr
  store double 0x4076D3D70A3D70A4, double* %var_days_per_year_ptr
  %t4 = load double, double* %var_solar_mass_ptr
  store double %t4, double* %reg_2_ptr
  %t5 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t5, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t6 = getelementptr i8, i8* %t5, i64 32
  store i8 5, i8* %t6
  %t7 = getelementptr i8, i8* %t5, i64 40
  %t8 = bitcast i8* %t7 to double*
  store double 0x0000000000000000, double* %t8
  %t9 = getelementptr i8, i8* %t5, i64 48
  store i8 5, i8* %t9
  %t10 = getelementptr i8, i8* %t5, i64 56
  %t11 = bitcast i8* %t10 to double*
  store double 0x0000000000000000, double* %t11
  %t12 = getelementptr i8, i8* %t5, i64 64
  store i8 5, i8* %t12
  %t13 = getelementptr i8, i8* %t5, i64 72
  %t14 = bitcast i8* %t13 to double*
  store double 0x0000000000000000, double* %t14
  %t15 = getelementptr i8, i8* %t5, i64 80
  store i8 5, i8* %t15
  %t16 = getelementptr i8, i8* %t5, i64 88
  %t17 = bitcast i8* %t16 to double*
  store double 0x0000000000000000, double* %t17
  %t18 = getelementptr i8, i8* %t5, i64 96
  store i8 5, i8* %t18
  %t19 = getelementptr i8, i8* %t5, i64 104
  %t20 = bitcast i8* %t19 to double*
  store double 0x0000000000000000, double* %t20
  %t21 = getelementptr i8, i8* %t5, i64 112
  store i8 5, i8* %t21
  %t22 = getelementptr i8, i8* %t5, i64 120
  %t23 = bitcast i8* %t22 to double*
  store double 0x0000000000000000, double* %t23
  %t24 = load double, double* %reg_2_ptr
  %t25 = getelementptr i8, i8* %t5, i64 128
  store i8 5, i8* %t25
  %t26 = getelementptr i8, i8* %t5, i64 136
  %t27 = bitcast i8* %t26 to double*
  store double %t24, double* %t27
  store i8* %t5, i8** %reg_3_ptr
  %t28 = load i8*, i8** %reg_3_ptr
  store i8* %t28, i8** %var_sun_ptr
  %t29 = fsub double 0.0, 0x3FF290ABC01FDB7C
  store double %t29, double* %reg_4_ptr
  %t30 = fsub double 0.0, 0x3FBA86F96C25EBF0
  store double %t30, double* %reg_5_ptr
  %t31 = load double, double* %var_days_per_year_ptr
  store double %t31, double* %reg_6_ptr
  %t32 = load double, double* %reg_6_ptr
  %t33 = fmul contract double 0x3F5B32DDB8EC9209, %t32
  store double %t33, double* %reg_7_ptr
  %t34 = load double, double* %var_days_per_year_ptr
  store double %t34, double* %reg_8_ptr
  %t35 = load double, double* %reg_8_ptr
  %t36 = fmul contract double 0x3F7F88FF93F670B6, %t35
  store double %t36, double* %reg_9_ptr
  %t37 = fsub double 0.0, 0x3F12199946DEBD80
  store double %t37, double* %reg_10_ptr
  %t38 = load double, double* %var_days_per_year_ptr
  store double %t38, double* %reg_11_ptr
  %t39 = load double, double* %reg_10_ptr
  %t40 = load double, double* %reg_11_ptr
  %t41 = fmul contract double %t39, %t40
  store double %t41, double* %reg_12_ptr
  %t42 = load double, double* %var_solar_mass_ptr
  store double %t42, double* %reg_13_ptr
  %t43 = load double, double* %reg_13_ptr
  %t44 = fmul contract double 0x3F4F49601333C135, %t43
  store double %t44, double* %reg_14_ptr
  %t45 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t45, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t46 = getelementptr i8, i8* %t45, i64 32
  store i8 5, i8* %t46
  %t47 = getelementptr i8, i8* %t45, i64 40
  %t48 = bitcast i8* %t47 to double*
  store double 0x40135DA0343CD92C, double* %t48
  %t49 = load double, double* %reg_4_ptr
  %t50 = getelementptr i8, i8* %t45, i64 48
  store i8 5, i8* %t50
  %t51 = getelementptr i8, i8* %t45, i64 56
  %t52 = bitcast i8* %t51 to double*
  store double %t49, double* %t52
  %t53 = load double, double* %reg_5_ptr
  %t54 = getelementptr i8, i8* %t45, i64 64
  store i8 5, i8* %t54
  %t55 = getelementptr i8, i8* %t45, i64 72
  %t56 = bitcast i8* %t55 to double*
  store double %t53, double* %t56
  %t57 = load double, double* %reg_7_ptr
  %t58 = getelementptr i8, i8* %t45, i64 80
  store i8 5, i8* %t58
  %t59 = getelementptr i8, i8* %t45, i64 88
  %t60 = bitcast i8* %t59 to double*
  store double %t57, double* %t60
  %t61 = load double, double* %reg_9_ptr
  %t62 = getelementptr i8, i8* %t45, i64 96
  store i8 5, i8* %t62
  %t63 = getelementptr i8, i8* %t45, i64 104
  %t64 = bitcast i8* %t63 to double*
  store double %t61, double* %t64
  %t65 = load double, double* %reg_12_ptr
  %t66 = getelementptr i8, i8* %t45, i64 112
  store i8 5, i8* %t66
  %t67 = getelementptr i8, i8* %t45, i64 120
  %t68 = bitcast i8* %t67 to double*
  store double %t65, double* %t68
  %t69 = load double, double* %reg_14_ptr
  %t70 = getelementptr i8, i8* %t45, i64 128
  store i8 5, i8* %t70
  %t71 = getelementptr i8, i8* %t45, i64 136
  %t72 = bitcast i8* %t71 to double*
  store double %t69, double* %t72
  store i8* %t45, i8** %reg_15_ptr
  %t73 = load i8*, i8** %reg_15_ptr
  store i8* %t73, i8** %var_jupiter_ptr
  %t74 = fsub double 0.0, 0x3FD9D353E1EB467C
  store double %t74, double* %reg_16_ptr
  %t75 = fsub double 0.0, 0x3F66ABB60A8E1D76
  store double %t75, double* %reg_17_ptr
  %t76 = load double, double* %var_days_per_year_ptr
  store double %t76, double* %reg_18_ptr
  %t77 = load double, double* %reg_17_ptr
  %t78 = load double, double* %reg_18_ptr
  %t79 = fmul contract double %t77, %t78
  store double %t79, double* %reg_19_ptr
  %t80 = load double, double* %var_days_per_year_ptr
  store double %t80, double* %reg_20_ptr
  %t81 = load double, double* %reg_20_ptr
  %t82 = fmul contract double 0x3F747956257578B8, %t81
  store double %t82, double* %reg_21_ptr
  %t83 = load double, double* %var_days_per_year_ptr
  store double %t83, double* %reg_22_ptr
  %t84 = load double, double* %reg_22_ptr
  %t85 = fmul contract double 0x3EF829379CAD4AC0, %t84
  store double %t85, double* %reg_23_ptr
  %t86 = load double, double* %var_solar_mass_ptr
  store double %t86, double* %reg_24_ptr
  %t87 = load double, double* %reg_24_ptr
  %t88 = fmul contract double 0x3F32BC5EEFF5E6F8, %t87
  store double %t88, double* %reg_25_ptr
  %t89 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t89, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t90 = getelementptr i8, i8* %t89, i64 32
  store i8 5, i8* %t90
  %t91 = getelementptr i8, i8* %t89, i64 40
  %t92 = bitcast i8* %t91 to double*
  store double 0x4020AFCDC332CA67, double* %t92
  %t93 = getelementptr i8, i8* %t89, i64 48
  store i8 5, i8* %t93
  %t94 = getelementptr i8, i8* %t89, i64 56
  %t95 = bitcast i8* %t94 to double*
  store double 0x40107FCB31DE01B0, double* %t95
  %t96 = load double, double* %reg_16_ptr
  %t97 = getelementptr i8, i8* %t89, i64 64
  store i8 5, i8* %t97
  %t98 = getelementptr i8, i8* %t89, i64 72
  %t99 = bitcast i8* %t98 to double*
  store double %t96, double* %t99
  %t100 = load double, double* %reg_19_ptr
  %t101 = getelementptr i8, i8* %t89, i64 80
  store i8 5, i8* %t101
  %t102 = getelementptr i8, i8* %t89, i64 88
  %t103 = bitcast i8* %t102 to double*
  store double %t100, double* %t103
  %t104 = load double, double* %reg_21_ptr
  %t105 = getelementptr i8, i8* %t89, i64 96
  store i8 5, i8* %t105
  %t106 = getelementptr i8, i8* %t89, i64 104
  %t107 = bitcast i8* %t106 to double*
  store double %t104, double* %t107
  %t108 = load double, double* %reg_23_ptr
  %t109 = getelementptr i8, i8* %t89, i64 112
  store i8 5, i8* %t109
  %t110 = getelementptr i8, i8* %t89, i64 120
  %t111 = bitcast i8* %t110 to double*
  store double %t108, double* %t111
  %t112 = load double, double* %reg_25_ptr
  %t113 = getelementptr i8, i8* %t89, i64 128
  store i8 5, i8* %t113
  %t114 = getelementptr i8, i8* %t89, i64 136
  %t115 = bitcast i8* %t114 to double*
  store double %t112, double* %t115
  store i8* %t89, i8** %reg_26_ptr
  %t116 = load i8*, i8** %reg_26_ptr
  store i8* %t116, i8** %var_saturn_ptr
  %t117 = fsub double 0.0, 0x402E38E8D626667E
  store double %t117, double* %reg_27_ptr
  %t118 = fsub double 0.0, 0x3FCC9557BE257DA0
  store double %t118, double* %reg_28_ptr
  %t119 = load double, double* %var_days_per_year_ptr
  store double %t119, double* %reg_29_ptr
  %t120 = load double, double* %reg_29_ptr
  %t121 = fmul contract double 0x3F6849383E87D954, %t120
  store double %t121, double* %reg_30_ptr
  %t122 = load double, double* %var_days_per_year_ptr
  store double %t122, double* %reg_31_ptr
  %t123 = load double, double* %reg_31_ptr
  %t124 = fmul contract double 0x3F637C044AC0ACE1, %t123
  store double %t124, double* %reg_32_ptr
  %t125 = fsub double 0.0, 0x3EFF1983FEDBFAA0
  store double %t125, double* %reg_33_ptr
  %t126 = load double, double* %var_days_per_year_ptr
  store double %t126, double* %reg_34_ptr
  %t127 = load double, double* %reg_33_ptr
  %t128 = load double, double* %reg_34_ptr
  %t129 = fmul contract double %t127, %t128
  store double %t129, double* %reg_35_ptr
  %t130 = load double, double* %var_solar_mass_ptr
  store double %t130, double* %reg_36_ptr
  %t131 = load double, double* %reg_36_ptr
  %t132 = fmul contract double 0x3F06E44607A13BD6, %t131
  store double %t132, double* %reg_37_ptr
  %t133 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t133, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t134 = getelementptr i8, i8* %t133, i64 32
  store i8 5, i8* %t134
  %t135 = getelementptr i8, i8* %t133, i64 40
  %t136 = bitcast i8* %t135 to double*
  store double 0x4029C9EACEA7D9CF, double* %t136
  %t137 = load double, double* %reg_27_ptr
  %t138 = getelementptr i8, i8* %t133, i64 48
  store i8 5, i8* %t138
  %t139 = getelementptr i8, i8* %t133, i64 56
  %t140 = bitcast i8* %t139 to double*
  store double %t137, double* %t140
  %t141 = load double, double* %reg_28_ptr
  %t142 = getelementptr i8, i8* %t133, i64 64
  store i8 5, i8* %t142
  %t143 = getelementptr i8, i8* %t133, i64 72
  %t144 = bitcast i8* %t143 to double*
  store double %t141, double* %t144
  %t145 = load double, double* %reg_30_ptr
  %t146 = getelementptr i8, i8* %t133, i64 80
  store i8 5, i8* %t146
  %t147 = getelementptr i8, i8* %t133, i64 88
  %t148 = bitcast i8* %t147 to double*
  store double %t145, double* %t148
  %t149 = load double, double* %reg_32_ptr
  %t150 = getelementptr i8, i8* %t133, i64 96
  store i8 5, i8* %t150
  %t151 = getelementptr i8, i8* %t133, i64 104
  %t152 = bitcast i8* %t151 to double*
  store double %t149, double* %t152
  %t153 = load double, double* %reg_35_ptr
  %t154 = getelementptr i8, i8* %t133, i64 112
  store i8 5, i8* %t154
  %t155 = getelementptr i8, i8* %t133, i64 120
  %t156 = bitcast i8* %t155 to double*
  store double %t153, double* %t156
  %t157 = load double, double* %reg_37_ptr
  %t158 = getelementptr i8, i8* %t133, i64 128
  store i8 5, i8* %t158
  %t159 = getelementptr i8, i8* %t133, i64 136
  %t160 = bitcast i8* %t159 to double*
  store double %t157, double* %t160
  store i8* %t133, i8** %reg_38_ptr
  %t161 = load i8*, i8** %reg_38_ptr
  store i8* %t161, i8** %var_uranus_ptr
  %t162 = fsub double 0.0, 0x4039EB5833C8A220
  store double %t162, double* %reg_39_ptr
  %t163 = load double, double* %var_days_per_year_ptr
  store double %t163, double* %reg_40_ptr
  %t164 = load double, double* %reg_40_ptr
  %t165 = fmul contract double 0x3F65F5C9E51B4320, %t164
  store double %t165, double* %reg_41_ptr
  %t166 = load double, double* %var_days_per_year_ptr
  store double %t166, double* %reg_42_ptr
  %t167 = load double, double* %reg_42_ptr
  %t168 = fmul contract double 0x3F5AAD5736999D88, %t167
  store double %t168, double* %reg_43_ptr
  %t169 = fsub double 0.0, 0x3F18F2070B7F9750
  store double %t169, double* %reg_44_ptr
  %t170 = load double, double* %var_days_per_year_ptr
  store double %t170, double* %reg_45_ptr
  %t171 = load double, double* %reg_44_ptr
  %t172 = load double, double* %reg_45_ptr
  %t173 = fmul contract double %t171, %t172
  store double %t173, double* %reg_46_ptr
  %t174 = load double, double* %var_solar_mass_ptr
  store double %t174, double* %reg_47_ptr
  %t175 = load double, double* %reg_47_ptr
  %t176 = fmul contract double 0x3F0B0213CA2D0EEC, %t175
  store double %t176, double* %reg_48_ptr
  %t177 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t177, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t178 = getelementptr i8, i8* %t177, i64 32
  store i8 5, i8* %t178
  %t179 = getelementptr i8, i8* %t177, i64 40
  %t180 = bitcast i8* %t179 to double*
  store double 0x402EC267A905572A, double* %t180
  %t181 = load double, double* %reg_39_ptr
  %t182 = getelementptr i8, i8* %t177, i64 48
  store i8 5, i8* %t182
  %t183 = getelementptr i8, i8* %t177, i64 56
  %t184 = bitcast i8* %t183 to double*
  store double %t181, double* %t184
  %t185 = getelementptr i8, i8* %t177, i64 64
  store i8 5, i8* %t185
  %t186 = getelementptr i8, i8* %t177, i64 72
  %t187 = bitcast i8* %t186 to double*
  store double 0x3FC6F1F393ABE540, double* %t187
  %t188 = load double, double* %reg_41_ptr
  %t189 = getelementptr i8, i8* %t177, i64 80
  store i8 5, i8* %t189
  %t190 = getelementptr i8, i8* %t177, i64 88
  %t191 = bitcast i8* %t190 to double*
  store double %t188, double* %t191
  %t192 = load double, double* %reg_43_ptr
  %t193 = getelementptr i8, i8* %t177, i64 96
  store i8 5, i8* %t193
  %t194 = getelementptr i8, i8* %t177, i64 104
  %t195 = bitcast i8* %t194 to double*
  store double %t192, double* %t195
  %t196 = load double, double* %reg_46_ptr
  %t197 = getelementptr i8, i8* %t177, i64 112
  store i8 5, i8* %t197
  %t198 = getelementptr i8, i8* %t177, i64 120
  %t199 = bitcast i8* %t198 to double*
  store double %t196, double* %t199
  %t200 = load double, double* %reg_48_ptr
  %t201 = getelementptr i8, i8* %t177, i64 128
  store i8 5, i8* %t201
  %t202 = getelementptr i8, i8* %t177, i64 136
  %t203 = bitcast i8* %t202 to double*
  store double %t200, double* %t203
  store i8* %t177, i8** %reg_49_ptr
  %t204 = load i8*, i8** %reg_49_ptr
  store i8* %t204, i8** %var_neptune_ptr
  %t205 = load i8*, i8** %var_sun_ptr
  store i8* %t205, i8** %reg_50_ptr
  %t206 = load i8*, i8** %var_jupiter_ptr
  store i8* %t206, i8** %reg_51_ptr
  %t207 = load i8*, i8** %var_saturn_ptr
  store i8* %t207, i8** %reg_52_ptr
  %t208 = load i8*, i8** %var_uranus_ptr
  store i8* %t208, i8** %reg_53_ptr
  %t209 = load i8*, i8** %var_neptune_ptr
  store i8* %t209, i8** %reg_54_ptr
  %t210 = call i8* @obo_mixed_list_new(i64 5)
  %t211 = load i8*, i8** %reg_50_ptr
  %t212 = call i8* @obo_box_entity(i8* %t211)
  call void @obo_mixed_list_set(i8* %t210, i64 0, i8* %t212)
  %t213 = load i8*, i8** %reg_51_ptr
  %t214 = call i8* @obo_box_entity(i8* %t213)
  call void @obo_mixed_list_set(i8* %t210, i64 1, i8* %t214)
  %t215 = load i8*, i8** %reg_52_ptr
  %t216 = call i8* @obo_box_entity(i8* %t215)
  call void @obo_mixed_list_set(i8* %t210, i64 2, i8* %t216)
  %t217 = load i8*, i8** %reg_53_ptr
  %t218 = call i8* @obo_box_entity(i8* %t217)
  call void @obo_mixed_list_set(i8* %t210, i64 3, i8* %t218)
  %t219 = load i8*, i8** %reg_54_ptr
  %t220 = call i8* @obo_box_entity(i8* %t219)
  call void @obo_mixed_list_set(i8* %t210, i64 4, i8* %t220)
  store i8* %t210, i8** %reg_55_ptr
  %t221 = load i8*, i8** %reg_55_ptr
  store i8* %t221, i8** %var_bodies_ptr
  store i64 5, i64* %var_nbodies_ptr
  store double 0x0000000000000000, double* %var_px_ptr
  store double 0x0000000000000000, double* %var_py_ptr
  store double 0x0000000000000000, double* %var_pz_ptr
  store i64 0, i64* %var_i_ptr
  %t222 = load i64, i64* %var_nbodies_ptr
  store i64 %t222, i64* %reg_56_ptr
  store i64 1, i64* %reg_57_ptr
  br label %main_b1
main_b1:
  %t223 = load i64, i64* %var_i_ptr
  store i64 %t223, i64* %reg_58_ptr
  %t224 = load i64, i64* %reg_58_ptr
  %t225 = load i64, i64* %reg_56_ptr
  %t226 = icmp slt i64 %t224, %t225
  %t227 = zext i1 %t226 to i64
  store i64 %t227, i64* %reg_59_ptr
  %t228 = load i64, i64* %reg_59_ptr
  %t230 = icmp ne i64 %t228, 0
  %t231 = zext i1 %t230 to i64
  %t229 = icmp ne i64 %t231, 0
  br i1 %t229, label %main_b2, label %main_b4
main_b2:
  %t232 = load i8*, i8** %var_bodies_ptr
  store i8* %t232, i8** %reg_60_ptr
  %t233 = load i64, i64* %var_i_ptr
  store i64 %t233, i64* %reg_61_ptr
  %t234 = load i8*, i8** %reg_60_ptr
  %t235 = load i64, i64* %reg_61_ptr
  %t236 = mul i64 %t235, 16
  %t237 = add i64 %t236, 16
  %t238 = getelementptr i8, i8* %t234, i64 %t237
  %t239 = getelementptr i8, i8* %t238, i64 8
  %t240 = bitcast i8* %t239 to i8**
  %t241 = load i8*, i8** %t240
  store i8* %t241, i8** %reg_62_ptr
  %t242 = load i8*, i8** %reg_62_ptr
  store i8* %t242, i8** %var_b_ptr
  %t243 = load double, double* %var_px_ptr
  store double %t243, double* %reg_63_ptr
  %t244 = load i8*, i8** %var_b_ptr
  store i8* %t244, i8** %reg_64_ptr
  %t245 = load i8*, i8** %reg_64_ptr
  %t246 = getelementptr i8, i8* %t245, i64 88
  %t247 = bitcast i8* %t246 to double*
  %t248 = load double, double* %t247
  store double %t248, double* %reg_65_ptr
  %t249 = load i8*, i8** %var_b_ptr
  store i8* %t249, i8** %reg_66_ptr
  %t250 = load i8*, i8** %reg_66_ptr
  %t251 = getelementptr i8, i8* %t250, i64 136
  %t252 = bitcast i8* %t251 to double*
  %t253 = load double, double* %t252
  store double %t253, double* %reg_67_ptr
  %t254 = load double, double* %reg_65_ptr
  %t255 = load double, double* %reg_67_ptr
  %t256 = fmul contract double %t254, %t255
  store double %t256, double* %reg_68_ptr
  %t257 = load double, double* %reg_63_ptr
  %t258 = load double, double* %reg_68_ptr
  %t259 = fadd contract double %t257, %t258
  store double %t259, double* %reg_69_ptr
  %t260 = load double, double* %reg_69_ptr
  store double %t260, double* %var_px_ptr
  %t261 = load double, double* %var_py_ptr
  store double %t261, double* %reg_70_ptr
  %t262 = load i8*, i8** %var_b_ptr
  store i8* %t262, i8** %reg_71_ptr
  %t263 = load i8*, i8** %reg_71_ptr
  %t264 = getelementptr i8, i8* %t263, i64 104
  %t265 = bitcast i8* %t264 to double*
  %t266 = load double, double* %t265
  store double %t266, double* %reg_72_ptr
  %t267 = load i8*, i8** %var_b_ptr
  store i8* %t267, i8** %reg_73_ptr
  %t268 = load i8*, i8** %reg_73_ptr
  %t269 = getelementptr i8, i8* %t268, i64 136
  %t270 = bitcast i8* %t269 to double*
  %t271 = load double, double* %t270
  store double %t271, double* %reg_74_ptr
  %t272 = load double, double* %reg_72_ptr
  %t273 = load double, double* %reg_74_ptr
  %t274 = fmul contract double %t272, %t273
  store double %t274, double* %reg_75_ptr
  %t275 = load double, double* %reg_70_ptr
  %t276 = load double, double* %reg_75_ptr
  %t277 = fadd contract double %t275, %t276
  store double %t277, double* %reg_76_ptr
  %t278 = load double, double* %reg_76_ptr
  store double %t278, double* %var_py_ptr
  %t279 = load double, double* %var_pz_ptr
  store double %t279, double* %reg_77_ptr
  %t280 = load i8*, i8** %var_b_ptr
  store i8* %t280, i8** %reg_78_ptr
  %t281 = load i8*, i8** %reg_78_ptr
  %t282 = getelementptr i8, i8* %t281, i64 120
  %t283 = bitcast i8* %t282 to double*
  %t284 = load double, double* %t283
  store double %t284, double* %reg_79_ptr
  %t285 = load i8*, i8** %var_b_ptr
  store i8* %t285, i8** %reg_80_ptr
  %t286 = load i8*, i8** %reg_80_ptr
  %t287 = getelementptr i8, i8* %t286, i64 136
  %t288 = bitcast i8* %t287 to double*
  %t289 = load double, double* %t288
  store double %t289, double* %reg_81_ptr
  %t290 = load double, double* %reg_79_ptr
  %t291 = load double, double* %reg_81_ptr
  %t292 = fmul contract double %t290, %t291
  store double %t292, double* %reg_82_ptr
  %t293 = load double, double* %reg_77_ptr
  %t294 = load double, double* %reg_82_ptr
  %t295 = fadd contract double %t293, %t294
  store double %t295, double* %reg_83_ptr
  %t296 = load double, double* %reg_83_ptr
  store double %t296, double* %var_pz_ptr
  br label %main_b3
main_b3:
  %t297 = load i64, i64* %var_i_ptr
  store i64 %t297, i64* %reg_84_ptr
  %t298 = load i64, i64* %reg_84_ptr
  %t299 = load i64, i64* %reg_57_ptr
  %t300 = add i64 %t298, %t299
  store i64 %t300, i64* %reg_85_ptr
  %t301 = load i64, i64* %reg_85_ptr
  store i64 %t301, i64* %var_i_ptr
  br label %main_b1
main_b4:
  %t302 = load double, double* %var_px_ptr
  store double %t302, double* %reg_86_ptr
  %t303 = load double, double* %var_solar_mass_ptr
  store double %t303, double* %reg_87_ptr
  %t304 = load double, double* %reg_86_ptr
  %t305 = load double, double* %reg_87_ptr
  %t306 = fdiv contract double %t304, %t305
  store double %t306, double* %reg_88_ptr
  %t307 = load double, double* %reg_88_ptr
  %t308 = fsub contract double 0x0000000000000000, %t307
  store double %t308, double* %reg_89_ptr
  %t309 = load i8*, i8** %var_sun_ptr
  store i8* %t309, i8** %reg_90_ptr
  %t310 = load i8*, i8** %reg_90_ptr
  %t311 = load double, double* %reg_89_ptr
  %t312 = getelementptr i8, i8* %t310, i64 88
  %t313 = bitcast i8* %t312 to double*
  store double %t311, double* %t313
  %t314 = load double, double* %var_py_ptr
  store double %t314, double* %reg_91_ptr
  %t315 = load double, double* %var_solar_mass_ptr
  store double %t315, double* %reg_92_ptr
  %t316 = load double, double* %reg_91_ptr
  %t317 = load double, double* %reg_92_ptr
  %t318 = fdiv contract double %t316, %t317
  store double %t318, double* %reg_93_ptr
  %t319 = load double, double* %reg_93_ptr
  %t320 = fsub contract double 0x0000000000000000, %t319
  store double %t320, double* %reg_94_ptr
  %t321 = load i8*, i8** %var_sun_ptr
  store i8* %t321, i8** %reg_95_ptr
  %t322 = load i8*, i8** %reg_95_ptr
  %t323 = load double, double* %reg_94_ptr
  %t324 = getelementptr i8, i8* %t322, i64 104
  %t325 = bitcast i8* %t324 to double*
  store double %t323, double* %t325
  %t326 = load double, double* %var_pz_ptr
  store double %t326, double* %reg_96_ptr
  %t327 = load double, double* %var_solar_mass_ptr
  store double %t327, double* %reg_97_ptr
  %t328 = load double, double* %reg_96_ptr
  %t329 = load double, double* %reg_97_ptr
  %t330 = fdiv contract double %t328, %t329
  store double %t330, double* %reg_98_ptr
  %t331 = load double, double* %reg_98_ptr
  %t332 = fsub contract double 0x0000000000000000, %t331
  store double %t332, double* %reg_99_ptr
  %t333 = load i8*, i8** %var_sun_ptr
  store i8* %t333, i8** %reg_100_ptr
  %t334 = load i8*, i8** %reg_100_ptr
  %t335 = load double, double* %reg_99_ptr
  %t336 = getelementptr i8, i8* %t334, i64 120
  %t337 = bitcast i8* %t336 to double*
  store double %t335, double* %t337
  store i64 500000, i64* %var_n_ptr
  %t338 = load i8*, i8** %var_bodies_ptr
  store i8* %t338, i8** %reg_101_ptr
  %t339 = load i64, i64* %var_nbodies_ptr
  store i64 %t339, i64* %reg_102_ptr
  %t340 = load i8*, i8** %reg_101_ptr
  %t341 = load i64, i64* %reg_102_ptr
  %t342 = call double @energy(i8* %t340, i64 %t341)
  store double %t342, double* %reg_103_ptr
  %t343 = load double, double* %reg_103_ptr
  call void @obo_print_double(double %t343)
  store i64 0, i64* %var_i_ptr
  %t344 = load i64, i64* %var_n_ptr
  store i64 %t344, i64* %reg_104_ptr
  store i64 1, i64* %reg_105_ptr
  br label %main_b5
main_b5:
  %t345 = load i64, i64* %var_i_ptr
  store i64 %t345, i64* %reg_106_ptr
  %t346 = load i64, i64* %reg_106_ptr
  %t347 = load i64, i64* %reg_104_ptr
  %t348 = icmp slt i64 %t346, %t347
  %t349 = zext i1 %t348 to i64
  store i64 %t349, i64* %reg_107_ptr
  %t350 = load i64, i64* %reg_107_ptr
  %t352 = icmp ne i64 %t350, 0
  %t353 = zext i1 %t352 to i64
  %t351 = icmp ne i64 %t353, 0
  br i1 %t351, label %main_b6, label %main_b8
main_b6:
  %t354 = load i8*, i8** %var_bodies_ptr
  store i8* %t354, i8** %reg_108_ptr
  %t355 = load i64, i64* %var_nbodies_ptr
  store i64 %t355, i64* %reg_109_ptr
  %t356 = load i8*, i8** %reg_108_ptr
  %t357 = load i64, i64* %reg_109_ptr
  %t358 = call i64 @advance(i8* %t356, i64 %t357, double 0x3F847AE147AE147B)
  store i64 %t358, i64* %reg_110_ptr
  br label %main_b7
main_b7:
  %t359 = load i64, i64* %var_i_ptr
  store i64 %t359, i64* %reg_111_ptr
  %t360 = load i64, i64* %reg_111_ptr
  %t361 = load i64, i64* %reg_105_ptr
  %t362 = add i64 %t360, %t361
  store i64 %t362, i64* %reg_112_ptr
  %t363 = load i64, i64* %reg_112_ptr
  store i64 %t363, i64* %var_i_ptr
  br label %main_b5
main_b8:
  %t364 = load i8*, i8** %var_bodies_ptr
  store i8* %t364, i8** %reg_113_ptr
  %t365 = load i64, i64* %var_nbodies_ptr
  store i64 %t365, i64* %reg_114_ptr
  %t366 = load i8*, i8** %reg_113_ptr
  %t367 = load i64, i64* %reg_114_ptr
  %t368 = call double @energy(i8* %t366, i64 %t367)
  store double %t368, double* %reg_115_ptr
  %t369 = load double, double* %reg_115_ptr
  call void @obo_print_double(double %t369)
  call void @obo_gc_pop_roots(i64 7)
  call void @obo_arena_free_all()
  ret i32 0
}

