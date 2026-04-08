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

@obo.str.0 = private unnamed_addr constant [14 x i8] c"Primes up to \00"
@obo.str.1 = private unnamed_addr constant [3 x i8] c": \00"

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
  %reg_58_ptr = alloca i8*
  %reg_59_ptr = alloca i8*
  %reg_60_ptr = alloca i64
  %reg_61_ptr = alloca i8*
  %var_j_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_buf_ptr = alloca i64
  %var_total_ptr = alloca i64
  %var_i_ptr = alloca i64
  call void @obo_gc_push_root(i8** %reg_58_ptr)
  call void @obo_gc_push_root(i8** %reg_59_ptr)
  call void @obo_gc_push_root(i8** %reg_61_ptr)
  store i64 10000000, i64* %var_n_ptr
  %t0 = load i64, i64* %var_n_ptr
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  %t2 = call i64 @__sys_pointer_alloc(i64 %t1)
  store i64 %t2, i64* %reg_1_ptr
  %t3 = load i64, i64* %reg_1_ptr
  store i64 %t3, i64* %var_buf_ptr
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
  %t14 = load i64, i64* %var_buf_ptr
  store i64 %t14, i64* %reg_6_ptr
  %t15 = load i64, i64* %var_i_ptr
  store i64 %t15, i64* %reg_7_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = load i64, i64* %reg_7_ptr
  %t18 = add i64 %t16, %t17
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  %t20 = inttoptr i64 %t19 to i8*
  %t21 = trunc i64 1 to i8
  store i8 %t21, i8* %t20
  store i64 0, i64* %reg_9_ptr
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
  %t27 = load i64, i64* %var_buf_ptr
  store i64 %t27, i64* %reg_12_ptr
  %t28 = load i64, i64* %reg_12_ptr
  %t29 = inttoptr i64 %t28 to i8*
  %t30 = trunc i64 0 to i8
  store i8 %t30, i8* %t29
  store i64 0, i64* %reg_13_ptr
  %t31 = load i64, i64* %var_buf_ptr
  store i64 %t31, i64* %reg_14_ptr
  %t32 = load i64, i64* %reg_14_ptr
  %t33 = add i64 %t32, 1
  store i64 %t33, i64* %reg_15_ptr
  %t34 = load i64, i64* %reg_15_ptr
  %t35 = inttoptr i64 %t34 to i8*
  %t36 = trunc i64 0 to i8
  store i8 %t36, i8* %t35
  store i64 0, i64* %reg_16_ptr
  store i64 2, i64* %var_i_ptr
  br label %main_b5
main_b5:
  %t37 = load i64, i64* %var_i_ptr
  store i64 %t37, i64* %reg_17_ptr
  %t38 = load i64, i64* %var_i_ptr
  store i64 %t38, i64* %reg_18_ptr
  %t39 = load i64, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_18_ptr
  %t41 = mul i64 %t39, %t40
  store i64 %t41, i64* %reg_19_ptr
  %t42 = load i64, i64* %var_n_ptr
  store i64 %t42, i64* %reg_20_ptr
  %t43 = load i64, i64* %reg_19_ptr
  %t44 = load i64, i64* %reg_20_ptr
  %t45 = icmp slt i64 %t43, %t44
  %t46 = zext i1 %t45 to i64
  store i64 %t46, i64* %reg_21_ptr
  %t47 = load i64, i64* %reg_21_ptr
  %t49 = icmp ne i64 %t47, 0
  %t50 = zext i1 %t49 to i64
  %t48 = icmp ne i64 %t50, 0
  br i1 %t48, label %main_b6, label %main_b7
main_b6:
  %t51 = load i64, i64* %var_buf_ptr
  store i64 %t51, i64* %reg_22_ptr
  %t52 = load i64, i64* %var_i_ptr
  store i64 %t52, i64* %reg_23_ptr
  %t53 = load i64, i64* %reg_22_ptr
  %t54 = load i64, i64* %reg_23_ptr
  %t55 = add i64 %t53, %t54
  store i64 %t55, i64* %reg_24_ptr
  %t56 = load i64, i64* %reg_24_ptr
  %t57 = inttoptr i64 %t56 to i8*
  %t58 = load i8, i8* %t57
  %t59 = zext i8 %t58 to i64
  store i64 %t59, i64* %reg_25_ptr
  %t60 = load i64, i64* %reg_25_ptr
  %t61 = icmp eq i64 %t60, 1
  %t62 = zext i1 %t61 to i64
  store i64 %t62, i64* %reg_26_ptr
  %t63 = load i64, i64* %reg_26_ptr
  %t65 = icmp ne i64 %t63, 0
  %t66 = zext i1 %t65 to i64
  %t64 = icmp ne i64 %t66, 0
  br i1 %t64, label %main_b8, label %main_b9
main_b7:
  store i64 0, i64* %var_total_ptr
  store i64 0, i64* %var_i_ptr
  %t67 = load i64, i64* %var_n_ptr
  store i64 %t67, i64* %reg_42_ptr
  store i64 1, i64* %reg_43_ptr
  br label %main_b14
main_b8:
  %t68 = load i64, i64* %var_i_ptr
  store i64 %t68, i64* %reg_27_ptr
  %t69 = load i64, i64* %var_i_ptr
  store i64 %t69, i64* %reg_28_ptr
  %t70 = load i64, i64* %reg_27_ptr
  %t71 = load i64, i64* %reg_28_ptr
  %t72 = mul i64 %t70, %t71
  store i64 %t72, i64* %reg_29_ptr
  %t73 = load i64, i64* %reg_29_ptr
  store i64 %t73, i64* %var_j_ptr
  br label %main_b11
main_b9:
  br label %main_b10
main_b10:
  %t74 = load i64, i64* %var_i_ptr
  store i64 %t74, i64* %reg_40_ptr
  %t75 = load i64, i64* %reg_40_ptr
  %t76 = add i64 %t75, 1
  store i64 %t76, i64* %reg_41_ptr
  %t77 = load i64, i64* %reg_41_ptr
  store i64 %t77, i64* %var_i_ptr
  br label %main_b5
main_b11:
  %t78 = load i64, i64* %var_j_ptr
  store i64 %t78, i64* %reg_30_ptr
  %t79 = load i64, i64* %var_n_ptr
  store i64 %t79, i64* %reg_31_ptr
  %t80 = load i64, i64* %reg_30_ptr
  %t81 = load i64, i64* %reg_31_ptr
  %t82 = icmp slt i64 %t80, %t81
  %t83 = zext i1 %t82 to i64
  store i64 %t83, i64* %reg_32_ptr
  %t84 = load i64, i64* %reg_32_ptr
  %t86 = icmp ne i64 %t84, 0
  %t87 = zext i1 %t86 to i64
  %t85 = icmp ne i64 %t87, 0
  br i1 %t85, label %main_b12, label %main_b13
main_b12:
  %t88 = load i64, i64* %var_buf_ptr
  store i64 %t88, i64* %reg_33_ptr
  %t89 = load i64, i64* %var_j_ptr
  store i64 %t89, i64* %reg_34_ptr
  %t90 = load i64, i64* %reg_33_ptr
  %t91 = load i64, i64* %reg_34_ptr
  %t92 = add i64 %t90, %t91
  store i64 %t92, i64* %reg_35_ptr
  %t93 = load i64, i64* %reg_35_ptr
  %t94 = inttoptr i64 %t93 to i8*
  %t95 = trunc i64 0 to i8
  store i8 %t95, i8* %t94
  store i64 0, i64* %reg_36_ptr
  %t96 = load i64, i64* %var_j_ptr
  store i64 %t96, i64* %reg_37_ptr
  %t97 = load i64, i64* %var_i_ptr
  store i64 %t97, i64* %reg_38_ptr
  %t98 = load i64, i64* %reg_37_ptr
  %t99 = load i64, i64* %reg_38_ptr
  %t100 = add i64 %t98, %t99
  store i64 %t100, i64* %reg_39_ptr
  %t101 = load i64, i64* %reg_39_ptr
  store i64 %t101, i64* %var_j_ptr
  br label %main_b11
main_b13:
  br label %main_b10
main_b14:
  %t102 = load i64, i64* %var_i_ptr
  store i64 %t102, i64* %reg_44_ptr
  %t103 = load i64, i64* %reg_44_ptr
  %t104 = load i64, i64* %reg_42_ptr
  %t105 = icmp slt i64 %t103, %t104
  %t106 = zext i1 %t105 to i64
  store i64 %t106, i64* %reg_45_ptr
  %t107 = load i64, i64* %reg_45_ptr
  %t109 = icmp ne i64 %t107, 0
  %t110 = zext i1 %t109 to i64
  %t108 = icmp ne i64 %t110, 0
  br i1 %t108, label %main_b15, label %main_b17
main_b15:
  %t111 = load i64, i64* %var_buf_ptr
  store i64 %t111, i64* %reg_46_ptr
  %t112 = load i64, i64* %var_i_ptr
  store i64 %t112, i64* %reg_47_ptr
  %t113 = load i64, i64* %reg_46_ptr
  %t114 = load i64, i64* %reg_47_ptr
  %t115 = add i64 %t113, %t114
  store i64 %t115, i64* %reg_48_ptr
  %t116 = load i64, i64* %reg_48_ptr
  %t117 = inttoptr i64 %t116 to i8*
  %t118 = load i8, i8* %t117
  %t119 = zext i8 %t118 to i64
  store i64 %t119, i64* %reg_49_ptr
  %t120 = load i64, i64* %reg_49_ptr
  %t121 = icmp eq i64 %t120, 1
  %t122 = zext i1 %t121 to i64
  store i64 %t122, i64* %reg_50_ptr
  %t123 = load i64, i64* %reg_50_ptr
  %t125 = icmp ne i64 %t123, 0
  %t126 = zext i1 %t125 to i64
  %t124 = icmp ne i64 %t126, 0
  br i1 %t124, label %main_b18, label %main_b19
main_b16:
  %t127 = load i64, i64* %var_i_ptr
  store i64 %t127, i64* %reg_53_ptr
  %t128 = load i64, i64* %reg_53_ptr
  %t129 = load i64, i64* %reg_43_ptr
  %t130 = add i64 %t128, %t129
  store i64 %t130, i64* %reg_54_ptr
  %t131 = load i64, i64* %reg_54_ptr
  store i64 %t131, i64* %var_i_ptr
  br label %main_b14
main_b17:
  %t132 = load i64, i64* %var_buf_ptr
  store i64 %t132, i64* %reg_55_ptr
  %t133 = load i64, i64* %reg_55_ptr
  %t134 = call i64 @__sys_pointer_free(i64 %t133)
  store i64 %t134, i64* %reg_56_ptr
  %t135 = load i64, i64* %var_n_ptr
  store i64 %t135, i64* %reg_57_ptr
  %t136 = load i64, i64* %reg_57_ptr
  %t137 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @obo.str.0, i64 0, i64 0), i64 %t136)
  store i8* %t137, i8** %reg_58_ptr
  %t138 = load i8*, i8** %reg_58_ptr
  %t139 = call i8* @obo_str_concat(i8* %t138, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t139, i8** %reg_59_ptr
  %t140 = load i64, i64* %var_total_ptr
  store i64 %t140, i64* %reg_60_ptr
  %t141 = load i8*, i8** %reg_59_ptr
  %t142 = load i64, i64* %reg_60_ptr
  %t143 = call i8* @obo_str_concat_int(i8* %t141, i64 %t142)
  store i8* %t143, i8** %reg_61_ptr
  %t144 = load i8*, i8** %reg_61_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t144)
  call void @obo_gc_pop_roots(i64 3)
  call void @obo_arena_free_all()
  ret i32 0
main_b18:
  %t145 = load i64, i64* %var_total_ptr
  store i64 %t145, i64* %reg_51_ptr
  %t146 = load i64, i64* %reg_51_ptr
  %t147 = add i64 %t146, 1
  store i64 %t147, i64* %reg_52_ptr
  %t148 = load i64, i64* %reg_52_ptr
  store i64 %t148, i64* %var_total_ptr
  br label %main_b20
main_b19:
  br label %main_b20
main_b20:
  br label %main_b16
}

