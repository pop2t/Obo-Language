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
declare void @obo_metal_enter() nounwind
declare void @obo_metal_exit() nounwind
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

@obo.str.0 = private unnamed_addr constant [2 x i8] c"a\00"
@obo.str.1 = private unnamed_addr constant [6 x i8] c"hello\00"
@obo.str.2 = private unnamed_addr constant [4 x i8] c"add\00"
@obo.str.3 = private unnamed_addr constant [4 x i8] c"set\00"
@obo.str.4 = private unnamed_addr constant [2 x i8] c"b\00"
@obo.str.5 = private unnamed_addr constant [7 x i8] c" world\00"
@obo.str.6 = private unnamed_addr constant [21 x i8] c"mutated_list first: \00"
@obo.str.7 = private unnamed_addr constant [17 x i8] c"list_out count: \00"
@obo.str.8 = private unnamed_addr constant [16 x i8] c"map_out count: \00"
@obo.str.9 = private unnamed_addr constant [11 x i8] c"text_out: \00"
@obo.str.10 = private unnamed_addr constant [6 x i8] c"upper\00"
@obo.str.11 = private unnamed_addr constant [6 x i8] c"count\00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i8*
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i8*
  %var_map_out_ptr = alloca i8*
  %var___metal_expr_22_ptr = alloca i8*
  %var_info_ptr = alloca i8*
  %var___metal_expr_8_ptr = alloca i8*
  %var_nums_ptr = alloca i8*
  %var___metal_expr_15_ptr = alloca i8*
  %var_list_out_ptr = alloca i8*
  %var_info2_ptr = alloca i8*
  %var_nums2_ptr = alloca i8*
  %var___metal_expr_2_ptr = alloca i8*
  %var_text_out_ptr = alloca i8*
  %var_msg_ptr = alloca i8*
  %var_mutated_list_ptr = alloca i8*
  %gc_root_arr = alloca i8**, i64 38
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_4_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_5_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_7_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_10_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_11_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_12_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_14_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_17_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_18_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %reg_19_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %reg_21_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %reg_24_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %reg_25_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %reg_26_ptr, i8*** %gc_root_gep_13
  %gc_root_gep_14 = getelementptr i8**, i8*** %gc_root_arr, i64 14
  store i8** %reg_27_ptr, i8*** %gc_root_gep_14
  %gc_root_gep_15 = getelementptr i8**, i8*** %gc_root_arr, i64 15
  store i8** %reg_28_ptr, i8*** %gc_root_gep_15
  %gc_root_gep_16 = getelementptr i8**, i8*** %gc_root_arr, i64 16
  store i8** %reg_30_ptr, i8*** %gc_root_gep_16
  %gc_root_gep_17 = getelementptr i8**, i8*** %gc_root_arr, i64 17
  store i8** %reg_31_ptr, i8*** %gc_root_gep_17
  %gc_root_gep_18 = getelementptr i8**, i8*** %gc_root_arr, i64 18
  store i8** %reg_33_ptr, i8*** %gc_root_gep_18
  %gc_root_gep_19 = getelementptr i8**, i8*** %gc_root_arr, i64 19
  store i8** %reg_34_ptr, i8*** %gc_root_gep_19
  %gc_root_gep_20 = getelementptr i8**, i8*** %gc_root_arr, i64 20
  store i8** %reg_36_ptr, i8*** %gc_root_gep_20
  %gc_root_gep_21 = getelementptr i8**, i8*** %gc_root_arr, i64 21
  store i8** %reg_37_ptr, i8*** %gc_root_gep_21
  %gc_root_gep_22 = getelementptr i8**, i8*** %gc_root_arr, i64 22
  store i8** %reg_39_ptr, i8*** %gc_root_gep_22
  %gc_root_gep_23 = getelementptr i8**, i8*** %gc_root_arr, i64 23
  store i8** %reg_40_ptr, i8*** %gc_root_gep_23
  %gc_root_gep_24 = getelementptr i8**, i8*** %gc_root_arr, i64 24
  store i8** %reg_41_ptr, i8*** %gc_root_gep_24
  %gc_root_gep_25 = getelementptr i8**, i8*** %gc_root_arr, i64 25
  store i8** %var_map_out_ptr, i8*** %gc_root_gep_25
  %gc_root_gep_26 = getelementptr i8**, i8*** %gc_root_arr, i64 26
  store i8** %var___metal_expr_22_ptr, i8*** %gc_root_gep_26
  %gc_root_gep_27 = getelementptr i8**, i8*** %gc_root_arr, i64 27
  store i8** %var_info_ptr, i8*** %gc_root_gep_27
  %gc_root_gep_28 = getelementptr i8**, i8*** %gc_root_arr, i64 28
  store i8** %var___metal_expr_8_ptr, i8*** %gc_root_gep_28
  %gc_root_gep_29 = getelementptr i8**, i8*** %gc_root_arr, i64 29
  store i8** %var_nums_ptr, i8*** %gc_root_gep_29
  %gc_root_gep_30 = getelementptr i8**, i8*** %gc_root_arr, i64 30
  store i8** %var___metal_expr_15_ptr, i8*** %gc_root_gep_30
  %gc_root_gep_31 = getelementptr i8**, i8*** %gc_root_arr, i64 31
  store i8** %var_list_out_ptr, i8*** %gc_root_gep_31
  %gc_root_gep_32 = getelementptr i8**, i8*** %gc_root_arr, i64 32
  store i8** %var_info2_ptr, i8*** %gc_root_gep_32
  %gc_root_gep_33 = getelementptr i8**, i8*** %gc_root_arr, i64 33
  store i8** %var_nums2_ptr, i8*** %gc_root_gep_33
  %gc_root_gep_34 = getelementptr i8**, i8*** %gc_root_arr, i64 34
  store i8** %var___metal_expr_2_ptr, i8*** %gc_root_gep_34
  %gc_root_gep_35 = getelementptr i8**, i8*** %gc_root_arr, i64 35
  store i8** %var_text_out_ptr, i8*** %gc_root_gep_35
  %gc_root_gep_36 = getelementptr i8**, i8*** %gc_root_arr, i64 36
  store i8** %var_msg_ptr, i8*** %gc_root_gep_36
  %gc_root_gep_37 = getelementptr i8**, i8*** %gc_root_arr, i64 37
  store i8** %var_mutated_list_ptr, i8*** %gc_root_gep_37
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 38)
  %t0 = alloca [3 x i64]
  %t1 = getelementptr inbounds [3 x i64], [3 x i64]* %t0, i64 0, i64 0
  store i64 1, i64* %t1
  %t2 = getelementptr inbounds [3 x i64], [3 x i64]* %t0, i64 0, i64 1
  store i64 2, i64* %t2
  %t3 = getelementptr inbounds [3 x i64], [3 x i64]* %t0, i64 0, i64 2
  store i64 3, i64* %t3
  %t4 = getelementptr inbounds [3 x i64], [3 x i64]* %t0, i64 0, i64 0
  %t5 = call i8* @obo_list_new_i64(i64 3, i64* %t4)
  store i8* %t5, i8** %reg_0_ptr
  %t6 = load i8*, i8** %reg_0_ptr
  store i8* %t6, i8** %var_nums_ptr
  %t7 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0), i64 1)
  store i8* %t7, i8** %reg_1_ptr
  %t8 = load i8*, i8** %reg_1_ptr
  store i8* %t8, i8** %var_info_ptr
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.1, i64 0, i64 0), i8** %var_msg_ptr
  store i64 0, i64* %var___metal_expr_2_ptr
  call void @obo_metal_enter()
  store i64 0, i64* %reg_3_ptr
  %t9 = load i8*, i8** %var_nums_ptr
  store i8* %t9, i8** %reg_4_ptr
  %t10 = load i8*, i8** %reg_4_ptr
  %t11 = mul i64 0, 8
  %t12 = add i64 %t11, 16
  %t13 = getelementptr i8, i8* %t10, i64 %t12
  %t14 = bitcast i8* %t13 to i64*
  store i64 99, i64* %t14
  %t15 = load i8*, i8** %var_nums_ptr
  store i8* %t15, i8** %reg_5_ptr
  %t16 = load i8*, i8** %reg_5_ptr
  store i8* %t16, i8** %var___metal_expr_2_ptr
  br label %main_b1
main_b1:
  call void @obo_metal_exit()
  store i64 0, i64* %reg_6_ptr
  %t17 = load i8*, i8** %var___metal_expr_2_ptr
  store i8* %t17, i8** %reg_7_ptr
  %t18 = load i8*, i8** %reg_7_ptr
  store i8* %t18, i8** %var_mutated_list_ptr
  store i64 0, i64* %var___metal_expr_8_ptr
  call void @obo_metal_enter()
  store i64 0, i64* %reg_9_ptr
  %t19 = load i8*, i8** %var_nums_ptr
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %reg_10_ptr
  %t21 = call i8* @obo_list_add(i8* %t20, i64 4)
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %reg_11_ptr
  store i8* %t22, i8** %var_nums2_ptr
  %t23 = load i8*, i8** %var_nums2_ptr
  store i8* %t23, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_12_ptr
  store i8* %t24, i8** %var___metal_expr_8_ptr
  br label %main_b2
main_b2:
  call void @obo_metal_exit()
  store i64 0, i64* %reg_13_ptr
  %t25 = load i8*, i8** %var___metal_expr_8_ptr
  store i8* %t25, i8** %reg_14_ptr
  %t26 = load i8*, i8** %reg_14_ptr
  store i8* %t26, i8** %var_list_out_ptr
  store i64 0, i64* %var___metal_expr_15_ptr
  call void @obo_metal_enter()
  store i64 0, i64* %reg_16_ptr
  %t27 = load i8*, i8** %var_info_ptr
  store i8* %t27, i8** %reg_17_ptr
  %t28 = load i8*, i8** %reg_17_ptr
  call void @obo_map_put_i64(i8* %t28, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.4, i64 0, i64 0), i64 2)
  store i8* %t28, i8** %reg_18_ptr
  %t29 = load i8*, i8** %reg_18_ptr
  store i8* %t29, i8** %var_info2_ptr
  %t30 = load i8*, i8** %var_info2_ptr
  store i8* %t30, i8** %reg_19_ptr
  %t31 = load i8*, i8** %reg_19_ptr
  store i8* %t31, i8** %var___metal_expr_15_ptr
  br label %main_b3
main_b3:
  call void @obo_metal_exit()
  store i64 0, i64* %reg_20_ptr
  %t32 = load i8*, i8** %var___metal_expr_15_ptr
  store i8* %t32, i8** %reg_21_ptr
  %t33 = load i8*, i8** %reg_21_ptr
  store i8* %t33, i8** %var_map_out_ptr
  store i64 0, i64* %var___metal_expr_22_ptr
  call void @obo_metal_enter()
  store i64 0, i64* %reg_23_ptr
  %t34 = load i8*, i8** %var_msg_ptr
  store i8* %t34, i8** %reg_24_ptr
  %t35 = load i8*, i8** %reg_24_ptr
  %t36 = call i8* @obo_str_concat(i8* %t35, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.5, i64 0, i64 0))
  store i8* %t36, i8** %reg_25_ptr
  %t37 = load i8*, i8** %reg_25_ptr
  store i8* %t37, i8** %var_msg_ptr
  %t38 = load i8*, i8** %var_msg_ptr
  store i8* %t38, i8** %reg_26_ptr
  %t39 = load i8*, i8** %reg_26_ptr
  %t40 = call i8* @__text_upper(i8* %t39)
  store i8* %t40, i8** %reg_27_ptr
  %t41 = load i8*, i8** %reg_27_ptr
  store i8* %t41, i8** %var_msg_ptr
  %t42 = load i8*, i8** %var_msg_ptr
  store i8* %t42, i8** %reg_28_ptr
  %t43 = load i8*, i8** %reg_28_ptr
  store i8* %t43, i8** %var___metal_expr_22_ptr
  br label %main_b4
main_b4:
  call void @obo_metal_exit()
  store i64 0, i64* %reg_29_ptr
  %t44 = load i8*, i8** %var___metal_expr_22_ptr
  store i8* %t44, i8** %reg_30_ptr
  %t45 = load i8*, i8** %reg_30_ptr
  store i8* %t45, i8** %var_text_out_ptr
  %t46 = load i8*, i8** %var_mutated_list_ptr
  store i8* %t46, i8** %reg_31_ptr
  %t47 = load i8*, i8** %reg_31_ptr
  %t48 = mul i64 0, 8
  %t49 = add i64 %t48, 16
  %t50 = getelementptr i8, i8* %t47, i64 %t49
  %t51 = bitcast i8* %t50 to i64*
  %t52 = load i64, i64* %t51
  store i64 %t52, i64* %reg_32_ptr
  %t53 = load i64, i64* %reg_32_ptr
  %t54 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.6, i64 0, i64 0), i64 %t53)
  store i8* %t54, i8** %reg_33_ptr
  %t55 = load i8*, i8** %reg_33_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t55)
  %t56 = load i8*, i8** %var_list_out_ptr
  store i8* %t56, i8** %reg_34_ptr
  %t57 = load i8*, i8** %reg_34_ptr
  %t58 = bitcast i8* %t57 to i64*
  %t59 = load i64, i64* %t58
  store i64 %t59, i64* %reg_35_ptr
  %t60 = load i64, i64* %reg_35_ptr
  %t61 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.7, i64 0, i64 0), i64 %t60)
  store i8* %t61, i8** %reg_36_ptr
  %t62 = load i8*, i8** %reg_36_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t62)
  %t63 = load i8*, i8** %var_map_out_ptr
  store i8* %t63, i8** %reg_37_ptr
  %t64 = load i8*, i8** %reg_37_ptr
  %t65 = call i64 @obo_map_len(i8* %t64)
  store i64 %t65, i64* %reg_38_ptr
  %t66 = load i64, i64* %reg_38_ptr
  %t67 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @obo.str.8, i64 0, i64 0), i64 %t66)
  store i8* %t67, i8** %reg_39_ptr
  %t68 = load i8*, i8** %reg_39_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t68)
  %t69 = load i8*, i8** %var_text_out_ptr
  store i8* %t69, i8** %reg_40_ptr
  %t70 = load i8*, i8** %reg_40_ptr
  %t71 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.9, i64 0, i64 0), i8* %t70)
  store i8* %t71, i8** %reg_41_ptr
  %t72 = load i8*, i8** %reg_41_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t72)
  call void @obo_gc_pop_roots(i64 38)
  call void @obo_arena_free_all()
  ret i32 0
}

