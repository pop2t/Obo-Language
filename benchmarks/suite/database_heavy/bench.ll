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

@obo.str.0 = private unnamed_addr constant [1 x i8] c"\00"
@obo.str.1 = private unnamed_addr constant [4 x i8] c"has\00"
@obo.str.2 = private unnamed_addr constant [4 x i8] c"add\00"
@obo.str.3 = private unnamed_addr constant [4 x i8] c"set\00"
@obo.str.4 = private unnamed_addr constant [7 x i8] c"filter\00"
@obo.str.5 = private unnamed_addr constant [7 x i8] c"sortBy\00"
@obo.str.6 = private unnamed_addr constant [12 x i8] c"Engineering\00"
@obo.str.7 = private unnamed_addr constant [10 x i8] c"Marketing\00"
@obo.str.8 = private unnamed_addr constant [3 x i8] c"HR\00"
@obo.str.9 = private unnamed_addr constant [8 x i8] c"Finance\00"
@obo.str.10 = private unnamed_addr constant [6 x i8] c"Sales\00"
@obo.str.11 = private unnamed_addr constant [8 x i8] c"Support\00"
@obo.str.12 = private unnamed_addr constant [6 x i8] c"Legal\00"
@obo.str.13 = private unnamed_addr constant [4 x i8] c"R&D\00"
@obo.str.14 = private unnamed_addr constant [7 x i8] c"Junior\00"
@obo.str.15 = private unnamed_addr constant [4 x i8] c"Mid\00"
@obo.str.16 = private unnamed_addr constant [7 x i8] c"Senior\00"
@obo.str.17 = private unnamed_addr constant [5 x i8] c"Lead\00"
@obo.str.18 = private unnamed_addr constant [10 x i8] c"Principal\00"
@obo.str.19 = private unnamed_addr constant [5 x i8] c"name\00"
@obo.str.20 = private unnamed_addr constant [11 x i8] c"department\00"
@obo.str.21 = private unnamed_addr constant [7 x i8] c"salary\00"
@obo.str.22 = private unnamed_addr constant [4 x i8] c"age\00"
@obo.str.23 = private unnamed_addr constant [6 x i8] c"level\00"
@obo.str.24 = private unnamed_addr constant [10 x i8] c"employees\00"
@obo.str.25 = private unnamed_addr constant [5 x i8] c"emp_\00"
@obo.str.26 = private unnamed_addr constant [7 x i8] c"insert\00"
@obo.str.27 = private unnamed_addr constant [6 x i8] c"where\00"
@obo.str.28 = private unnamed_addr constant [9 x i8] c"order_by\00"
@obo.str.29 = private unnamed_addr constant [11 x i8] c"find_first\00"
@obo.str.30 = private unnamed_addr constant [21 x i8] c"Building table with \00"
@obo.str.31 = private unnamed_addr constant [9 x i8] c" rows...\00"
@obo.str.32 = private unnamed_addr constant [9 x i8] c"Running \00"
@obo.str.33 = private unnamed_addr constant [21 x i8] c" query iterations...\00"
@obo.str.34 = private unnamed_addr constant [13 x i8] c"update_where\00"
@obo.str.35 = private unnamed_addr constant [13 x i8] c"delete_where\00"
@obo.str.36 = private unnamed_addr constant [17 x i8] c"Total checksum: \00"
@obo.str.37 = private unnamed_addr constant [25 x i8] c"Database heavy complete.\00"
@obo.str.38 = private unnamed_addr constant [7 x i8] c"emp_42\00"
@obo.str.39 = private unnamed_addr constant [6 x i8] c"count\00"
@obo.str.40 = private unnamed_addr constant [5 x i8] c"data\00"
@obo.str.41 = private unnamed_addr constant [6 x i8] c"Table\00"
@obo.str.42 = private unnamed_addr constant [8 x i8] c"columns\00"
@obo.str.43 = private unnamed_addr constant [5 x i8] c"rows\00"
@obo.str.44 = private unnamed_addr constant [8 x i8] c"next_id\00"
@obo.str.45 = private unnamed_addr constant [4 x i8] c"Row\00"
@obo.str.46 = private unnamed_addr constant [3 x i8] c"id\00"

define internal i64 @sum_of(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_total_ptr = alloca i64
  %var_row_ptr = alloca i8*
  %var___iter_idx_3_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  store i64 0, i64* %var_total_ptr
  %t2 = load i8*, i8** %var_rows_ptr
  store i8* %t2, i8** %reg_2_ptr
  store i64 0, i64* %var___iter_idx_3_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i64 @obo_value_len(i8* %t3)
  store i64 %t4, i64* %reg_3_ptr
  br label %sum_of_b1
sum_of_b1:
  %t5 = load i64, i64* %var___iter_idx_3_ptr
  store i64 %t5, i64* %reg_4_ptr
  %t6 = load i64, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = icmp slt i64 %t6, %t7
  %t9 = zext i1 %t8 to i64
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  %t12 = icmp ne i64 %t10, 0
  %t13 = zext i1 %t12 to i64
  %t11 = icmp ne i64 %t13, 0
  br i1 %t11, label %sum_of_b2, label %sum_of_b4
sum_of_b2:
  %t14 = load i64, i64* %var___iter_idx_3_ptr
  store i64 %t14, i64* %reg_6_ptr
  %t15 = load i8*, i8** %reg_2_ptr
  %t16 = load i64, i64* %reg_6_ptr
  %t17 = call i8* @obo_value_as_mixed_list_ptr(i8* %t15)
  %t18 = mul i64 %t16, 16
  %t19 = add i64 %t18, 16
  %t20 = getelementptr i8, i8* %t17, i64 %t19
  store i8* %t20, i8** %reg_7_ptr
  %t21 = load i8*, i8** %reg_7_ptr
  store i8* %t21, i8** %var_row_ptr
  %t22 = load i64, i64* %var_total_ptr
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i8*, i8** %var_row_ptr
  store i8* %t23, i8** %reg_9_ptr
  %t24 = load i8*, i8** %reg_9_ptr
  %t26 = getelementptr i8, i8* %t24, i64 8
  %t27 = bitcast i8* %t26 to i8**
  %t25 = load i8*, i8** %t27
  %t28 = getelementptr i8, i8* %t25, i64 48
  store i8* %t28, i8** %reg_10_ptr
  %t29 = load i8*, i8** %var_column_ptr
  store i8* %t29, i8** %reg_11_ptr
  %t30 = load i8*, i8** %reg_10_ptr
  %t31 = load i8*, i8** %reg_11_ptr
  %t33 = call i8* @obo_value_as_map_ptr(i8* %t30)
  %t32 = call i8* @obo_map_get_boxed(i8* %t33, i8* %t31)
  store i8* %t32, i8** %reg_12_ptr
  %t34 = load i64, i64* %reg_8_ptr
  %t35 = load i8*, i8** %reg_12_ptr
  %t36 = call i64 @obo_value_as_i64(i8* %t35)
  %t37 = add i64 %t34, %t36
  store i64 %t37, i64* %reg_13_ptr
  %t38 = load i64, i64* %reg_13_ptr
  store i64 %t38, i64* %var_total_ptr
  br label %sum_of_b3
sum_of_b3:
  %t39 = load i64, i64* %var___iter_idx_3_ptr
  store i64 %t39, i64* %reg_14_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t41 = add i64 %t40, 1
  store i64 %t41, i64* %reg_15_ptr
  %t42 = load i64, i64* %reg_15_ptr
  store i64 %t42, i64* %var___iter_idx_3_ptr
  br label %sum_of_b1
sum_of_b4:
  %t43 = load i64, i64* %var_total_ptr
  store i64 %t43, i64* %reg_16_ptr
  %t44 = load i64, i64* %reg_16_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i64 %t44
}

define internal i64 @avg_of(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i8*, i8** %var_rows_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i64 @obo_value_len(i8* %t3)
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp eq i64 %t5, 0
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %avg_of_b1, label %avg_of_b2
avg_of_b1:
  call void @obo_gc_pop_roots(i64 3)
  ret i64 0
avg_of_b2:
  br label %avg_of_b3
avg_of_b3:
  %t12 = load i8*, i8** %var_rows_ptr
  store i8* %t12, i8** %reg_5_ptr
  %t13 = load i8*, i8** %var_column_ptr
  store i8* %t13, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = load i8*, i8** %reg_6_ptr
  %t16 = call i64 @sum_of(i8* %t14, i8* %t15)
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i8*, i8** %var_rows_ptr
  store i8* %t17, i8** %reg_8_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i64 @obo_value_len(i8* %t18)
  store i64 %t19, i64* %reg_9_ptr
  %t20 = load i64, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_9_ptr
  %t22 = call i64 @obo_safe_div(i64 %t20, i64 %t21)
  store i64 %t22, i64* %reg_10_ptr
  %t23 = load i64, i64* %reg_10_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i64 %t23
}

define internal i8* @min_of(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_best_ptr = alloca i8*
  %var_v_ptr = alloca i8*
  %var___iter_idx_11_ptr = alloca i64
  %var_row_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 5
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %var_rows_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %var_column_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_best_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_v_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_row_ptr, i8*** %gc_root_gep_4
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 5)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i8*, i8** %var_rows_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i64 @obo_value_len(i8* %t3)
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp eq i64 %t5, 0
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %min_of_b1, label %min_of_b2
min_of_b1:
  %t12 = call i8* @obo_box_null()
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t12
min_of_b2:
  br label %min_of_b3
min_of_b3:
  %t13 = load i8*, i8** %var_rows_ptr
  store i8* %t13, i8** %reg_5_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @obo_value_as_mixed_list_ptr(i8* %t14)
  %t16 = mul i64 0, 16
  %t17 = add i64 %t16, 16
  %t18 = getelementptr i8, i8* %t15, i64 %t17
  store i8* %t18, i8** %reg_6_ptr
  %t19 = load i8*, i8** %reg_6_ptr
  %t21 = getelementptr i8, i8* %t19, i64 8
  %t22 = bitcast i8* %t21 to i8**
  %t20 = load i8*, i8** %t22
  %t23 = getelementptr i8, i8* %t20, i64 48
  store i8* %t23, i8** %reg_7_ptr
  %t24 = load i8*, i8** %var_column_ptr
  store i8* %t24, i8** %reg_8_ptr
  %t25 = load i8*, i8** %reg_7_ptr
  %t26 = load i8*, i8** %reg_8_ptr
  %t28 = call i8* @obo_value_as_map_ptr(i8* %t25)
  %t27 = call i8* @obo_map_get_boxed(i8* %t28, i8* %t26)
  store i8* %t27, i8** %reg_9_ptr
  %t29 = load i8*, i8** %reg_9_ptr
  store i8* %t29, i8** %var_best_ptr
  %t30 = load i8*, i8** %var_rows_ptr
  store i8* %t30, i8** %reg_10_ptr
  store i64 0, i64* %var___iter_idx_11_ptr
  %t31 = load i8*, i8** %reg_10_ptr
  %t32 = call i64 @obo_value_len(i8* %t31)
  store i64 %t32, i64* %reg_11_ptr
  br label %min_of_b4
min_of_b4:
  %t33 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t33, i64* %reg_12_ptr
  %t34 = load i64, i64* %reg_12_ptr
  %t35 = load i64, i64* %reg_11_ptr
  %t36 = icmp slt i64 %t34, %t35
  %t37 = zext i1 %t36 to i64
  store i64 %t37, i64* %reg_13_ptr
  %t38 = load i64, i64* %reg_13_ptr
  %t40 = icmp ne i64 %t38, 0
  %t41 = zext i1 %t40 to i64
  %t39 = icmp ne i64 %t41, 0
  br i1 %t39, label %min_of_b5, label %min_of_b7
min_of_b5:
  %t42 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t42, i64* %reg_14_ptr
  %t43 = load i8*, i8** %reg_10_ptr
  %t44 = load i64, i64* %reg_14_ptr
  %t45 = call i8* @obo_value_as_mixed_list_ptr(i8* %t43)
  %t46 = mul i64 %t44, 16
  %t47 = add i64 %t46, 16
  %t48 = getelementptr i8, i8* %t45, i64 %t47
  store i8* %t48, i8** %reg_15_ptr
  %t49 = load i8*, i8** %reg_15_ptr
  store i8* %t49, i8** %var_row_ptr
  %t50 = load i8*, i8** %var_row_ptr
  store i8* %t50, i8** %reg_16_ptr
  %t51 = load i8*, i8** %reg_16_ptr
  %t53 = getelementptr i8, i8* %t51, i64 8
  %t54 = bitcast i8* %t53 to i8**
  %t52 = load i8*, i8** %t54
  %t55 = getelementptr i8, i8* %t52, i64 48
  store i8* %t55, i8** %reg_17_ptr
  %t56 = load i8*, i8** %var_column_ptr
  store i8* %t56, i8** %reg_18_ptr
  %t57 = load i8*, i8** %reg_17_ptr
  %t58 = load i8*, i8** %reg_18_ptr
  %t60 = call i8* @obo_value_as_map_ptr(i8* %t57)
  %t59 = call i8* @obo_map_get_boxed(i8* %t60, i8* %t58)
  store i8* %t59, i8** %reg_19_ptr
  %t61 = load i8*, i8** %reg_19_ptr
  store i8* %t61, i8** %var_v_ptr
  %t62 = load i8*, i8** %var_v_ptr
  store i8* %t62, i8** %reg_20_ptr
  %t63 = load i8*, i8** %var_best_ptr
  store i8* %t63, i8** %reg_21_ptr
  %t64 = load i8*, i8** %reg_20_ptr
  %t65 = load i8*, i8** %reg_21_ptr
  %t66 = call i64 @obo_value_compare(i8* %t64, i8* %t65)
  %t67 = icmp slt i64 %t66, 0
  %t68 = zext i1 %t67 to i64
  store i64 %t68, i64* %reg_22_ptr
  %t69 = load i64, i64* %reg_22_ptr
  %t71 = icmp ne i64 %t69, 0
  %t72 = zext i1 %t71 to i64
  %t70 = icmp ne i64 %t72, 0
  br i1 %t70, label %min_of_b8, label %min_of_b9
min_of_b6:
  %t73 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t73, i64* %reg_24_ptr
  %t74 = load i64, i64* %reg_24_ptr
  %t75 = add i64 %t74, 1
  store i64 %t75, i64* %reg_25_ptr
  %t76 = load i64, i64* %reg_25_ptr
  store i64 %t76, i64* %var___iter_idx_11_ptr
  br label %min_of_b4
min_of_b7:
  %t77 = load i8*, i8** %var_best_ptr
  store i8* %t77, i8** %reg_26_ptr
  %t78 = load i8*, i8** %reg_26_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t78
min_of_b8:
  %t79 = load i8*, i8** %var_v_ptr
  store i8* %t79, i8** %reg_23_ptr
  %t80 = load i8*, i8** %reg_23_ptr
  store i8* %t80, i8** %var_best_ptr
  br label %min_of_b10
min_of_b9:
  br label %min_of_b10
min_of_b10:
  br label %min_of_b6
}

define internal i8* @max_of(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_best_ptr = alloca i8*
  %var___iter_idx_11_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_v_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 5
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %var_rows_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %var_best_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_column_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_v_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_row_ptr, i8*** %gc_root_gep_4
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 5)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i8*, i8** %var_rows_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i64 @obo_value_len(i8* %t3)
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp eq i64 %t5, 0
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %max_of_b1, label %max_of_b2
max_of_b1:
  %t12 = call i8* @obo_box_null()
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t12
max_of_b2:
  br label %max_of_b3
max_of_b3:
  %t13 = load i8*, i8** %var_rows_ptr
  store i8* %t13, i8** %reg_5_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @obo_value_as_mixed_list_ptr(i8* %t14)
  %t16 = mul i64 0, 16
  %t17 = add i64 %t16, 16
  %t18 = getelementptr i8, i8* %t15, i64 %t17
  store i8* %t18, i8** %reg_6_ptr
  %t19 = load i8*, i8** %reg_6_ptr
  %t21 = getelementptr i8, i8* %t19, i64 8
  %t22 = bitcast i8* %t21 to i8**
  %t20 = load i8*, i8** %t22
  %t23 = getelementptr i8, i8* %t20, i64 48
  store i8* %t23, i8** %reg_7_ptr
  %t24 = load i8*, i8** %var_column_ptr
  store i8* %t24, i8** %reg_8_ptr
  %t25 = load i8*, i8** %reg_7_ptr
  %t26 = load i8*, i8** %reg_8_ptr
  %t28 = call i8* @obo_value_as_map_ptr(i8* %t25)
  %t27 = call i8* @obo_map_get_boxed(i8* %t28, i8* %t26)
  store i8* %t27, i8** %reg_9_ptr
  %t29 = load i8*, i8** %reg_9_ptr
  store i8* %t29, i8** %var_best_ptr
  %t30 = load i8*, i8** %var_rows_ptr
  store i8* %t30, i8** %reg_10_ptr
  store i64 0, i64* %var___iter_idx_11_ptr
  %t31 = load i8*, i8** %reg_10_ptr
  %t32 = call i64 @obo_value_len(i8* %t31)
  store i64 %t32, i64* %reg_11_ptr
  br label %max_of_b4
max_of_b4:
  %t33 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t33, i64* %reg_12_ptr
  %t34 = load i64, i64* %reg_12_ptr
  %t35 = load i64, i64* %reg_11_ptr
  %t36 = icmp slt i64 %t34, %t35
  %t37 = zext i1 %t36 to i64
  store i64 %t37, i64* %reg_13_ptr
  %t38 = load i64, i64* %reg_13_ptr
  %t40 = icmp ne i64 %t38, 0
  %t41 = zext i1 %t40 to i64
  %t39 = icmp ne i64 %t41, 0
  br i1 %t39, label %max_of_b5, label %max_of_b7
max_of_b5:
  %t42 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t42, i64* %reg_14_ptr
  %t43 = load i8*, i8** %reg_10_ptr
  %t44 = load i64, i64* %reg_14_ptr
  %t45 = call i8* @obo_value_as_mixed_list_ptr(i8* %t43)
  %t46 = mul i64 %t44, 16
  %t47 = add i64 %t46, 16
  %t48 = getelementptr i8, i8* %t45, i64 %t47
  store i8* %t48, i8** %reg_15_ptr
  %t49 = load i8*, i8** %reg_15_ptr
  store i8* %t49, i8** %var_row_ptr
  %t50 = load i8*, i8** %var_row_ptr
  store i8* %t50, i8** %reg_16_ptr
  %t51 = load i8*, i8** %reg_16_ptr
  %t53 = getelementptr i8, i8* %t51, i64 8
  %t54 = bitcast i8* %t53 to i8**
  %t52 = load i8*, i8** %t54
  %t55 = getelementptr i8, i8* %t52, i64 48
  store i8* %t55, i8** %reg_17_ptr
  %t56 = load i8*, i8** %var_column_ptr
  store i8* %t56, i8** %reg_18_ptr
  %t57 = load i8*, i8** %reg_17_ptr
  %t58 = load i8*, i8** %reg_18_ptr
  %t60 = call i8* @obo_value_as_map_ptr(i8* %t57)
  %t59 = call i8* @obo_map_get_boxed(i8* %t60, i8* %t58)
  store i8* %t59, i8** %reg_19_ptr
  %t61 = load i8*, i8** %reg_19_ptr
  store i8* %t61, i8** %var_v_ptr
  %t62 = load i8*, i8** %var_v_ptr
  store i8* %t62, i8** %reg_20_ptr
  %t63 = load i8*, i8** %var_best_ptr
  store i8* %t63, i8** %reg_21_ptr
  %t64 = load i8*, i8** %reg_20_ptr
  %t65 = load i8*, i8** %reg_21_ptr
  %t66 = call i64 @obo_value_compare(i8* %t64, i8* %t65)
  %t67 = icmp sgt i64 %t66, 0
  %t68 = zext i1 %t67 to i64
  store i64 %t68, i64* %reg_22_ptr
  %t69 = load i64, i64* %reg_22_ptr
  %t71 = icmp ne i64 %t69, 0
  %t72 = zext i1 %t71 to i64
  %t70 = icmp ne i64 %t72, 0
  br i1 %t70, label %max_of_b8, label %max_of_b9
max_of_b6:
  %t73 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t73, i64* %reg_24_ptr
  %t74 = load i64, i64* %reg_24_ptr
  %t75 = add i64 %t74, 1
  store i64 %t75, i64* %reg_25_ptr
  %t76 = load i64, i64* %reg_25_ptr
  store i64 %t76, i64* %var___iter_idx_11_ptr
  br label %max_of_b4
max_of_b7:
  %t77 = load i8*, i8** %var_best_ptr
  store i8* %t77, i8** %reg_26_ptr
  %t78 = load i8*, i8** %reg_26_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t78
max_of_b8:
  %t79 = load i8*, i8** %var_v_ptr
  store i8* %t79, i8** %reg_23_ptr
  %t80 = load i8*, i8** %reg_23_ptr
  store i8* %t80, i8** %var_best_ptr
  br label %max_of_b10
max_of_b9:
  br label %max_of_b10
max_of_b10:
  br label %max_of_b6
}

define internal i8* @group_by(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %var_key_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  %var_groups_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
  %var___iter_idx_5_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 14
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_18_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_23_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_24_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_25_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_30_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_31_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_32_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_33_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %var_key_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %var_row_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %var_groups_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %var_column_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %var_rows_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %var_keys_ptr, i8*** %gc_root_gep_13
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 14)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = call i8* @obo_map_new()
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  store i8* %t3, i8** %var_groups_ptr
  %t4 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  store i8* %t5, i8** %var_keys_ptr
  %t6 = load i8*, i8** %var_rows_ptr
  store i8* %t6, i8** %reg_4_ptr
  store i64 0, i64* %var___iter_idx_5_ptr
  %t7 = load i8*, i8** %reg_4_ptr
  %t8 = call i64 @obo_value_len(i8* %t7)
  store i64 %t8, i64* %reg_5_ptr
  br label %group_by_b1
group_by_b1:
  %t9 = load i64, i64* %var___iter_idx_5_ptr
  store i64 %t9, i64* %reg_6_ptr
  %t10 = load i64, i64* %reg_6_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t12 = icmp slt i64 %t10, %t11
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  %t16 = icmp ne i64 %t14, 0
  %t17 = zext i1 %t16 to i64
  %t15 = icmp ne i64 %t17, 0
  br i1 %t15, label %group_by_b2, label %group_by_b4
group_by_b2:
  %t18 = load i64, i64* %var___iter_idx_5_ptr
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i8*, i8** %reg_4_ptr
  %t20 = load i64, i64* %reg_8_ptr
  %t21 = call i8* @obo_value_as_mixed_list_ptr(i8* %t19)
  %t22 = mul i64 %t20, 16
  %t23 = add i64 %t22, 16
  %t24 = getelementptr i8, i8* %t21, i64 %t23
  store i8* %t24, i8** %reg_9_ptr
  %t25 = load i8*, i8** %reg_9_ptr
  store i8* %t25, i8** %var_row_ptr
  %t26 = load i8*, i8** %var_row_ptr
  store i8* %t26, i8** %reg_10_ptr
  %t27 = load i8*, i8** %reg_10_ptr
  %t29 = getelementptr i8, i8* %t27, i64 8
  %t30 = bitcast i8* %t29 to i8**
  %t28 = load i8*, i8** %t30
  %t31 = getelementptr i8, i8* %t28, i64 48
  store i8* %t31, i8** %reg_11_ptr
  %t32 = load i8*, i8** %var_column_ptr
  store i8* %t32, i8** %reg_12_ptr
  %t33 = load i8*, i8** %reg_11_ptr
  %t34 = load i8*, i8** %reg_12_ptr
  %t36 = call i8* @obo_value_as_map_ptr(i8* %t33)
  %t35 = call i8* @obo_map_get_boxed(i8* %t36, i8* %t34)
  store i8* %t35, i8** %reg_13_ptr
  %t37 = load i8*, i8** %reg_13_ptr
  %t38 = call i8* @obo_value_to_str(i8* %t37)
  %t39 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.0, i64 0, i64 0), i8* %t38)
  store i8* %t39, i8** %reg_14_ptr
  %t40 = load i8*, i8** %reg_14_ptr
  store i8* %t40, i8** %var_key_ptr
  %t41 = load i8*, i8** %var_key_ptr
  store i8* %t41, i8** %reg_15_ptr
  %t42 = load i8*, i8** %var_groups_ptr
  store i8* %t42, i8** %reg_16_ptr
  %t43 = load i8*, i8** %reg_16_ptr
  %t44 = load i8*, i8** %reg_15_ptr
  %t45 = call i64 @obo_map_has(i8* %t43, i8* %t44)
  store i64 %t45, i64* %reg_17_ptr
  %t46 = load i64, i64* %reg_17_ptr
  %t48 = icmp ne i64 %t46, 0
  %t49 = zext i1 %t48 to i64
  %t47 = icmp ne i64 %t49, 0
  br i1 %t47, label %group_by_b5, label %group_by_b6
group_by_b3:
  %t50 = load i64, i64* %var___iter_idx_5_ptr
  store i64 %t50, i64* %reg_34_ptr
  %t51 = load i64, i64* %reg_34_ptr
  %t52 = add i64 %t51, 1
  store i64 %t52, i64* %reg_35_ptr
  %t53 = load i64, i64* %reg_35_ptr
  store i64 %t53, i64* %var___iter_idx_5_ptr
  br label %group_by_b1
group_by_b4:
  %t54 = load i8*, i8** %var_groups_ptr
  store i8* %t54, i8** %reg_36_ptr
  %t55 = load i8*, i8** %var_keys_ptr
  store i8* %t55, i8** %reg_37_ptr
  %t56 = call i8* @obo_mixed_list_new(i64 2)
  %t57 = load i8*, i8** %reg_36_ptr
  %t58 = call i8* @obo_box_map(i8* %t57)
  call void @obo_mixed_list_set(i8* %t56, i64 0, i8* %t58)
  %t59 = load i8*, i8** %reg_37_ptr
  %t60 = call i8* @obo_box_list(i8* %t59)
  call void @obo_mixed_list_set(i8* %t56, i64 1, i8* %t60)
  call void @obo_gc_pop_roots(i64 14)
  ret i8* %t56
group_by_b5:
  %t61 = load i8*, i8** %var_key_ptr
  store i8* %t61, i8** %reg_18_ptr
  %t62 = load i8*, i8** %var_row_ptr
  store i8* %t62, i8** %reg_19_ptr
  %t63 = load i8*, i8** %var_groups_ptr
  store i8* %t63, i8** %reg_20_ptr
  %t64 = load i8*, i8** %var_key_ptr
  store i8* %t64, i8** %reg_21_ptr
  %t65 = load i8*, i8** %reg_20_ptr
  %t66 = load i8*, i8** %reg_21_ptr
  %t67 = call i8* @obo_map_get_boxed(i8* %t65, i8* %t66)
  store i8* %t67, i8** %reg_22_ptr
  %t68 = load i8*, i8** %reg_22_ptr
  %t69 = call i8* @obo_value_as_mixed_list_ptr(i8* %t68)
  %t70 = load i8*, i8** %reg_19_ptr
  %t71 = call i8* @obo_mixed_list_add(i8* %t69, i8* %t70)
  %t72 = call i8* @obo_box_list(i8* %t71)
  store i8* %t72, i8** %reg_23_ptr
  %t73 = load i8*, i8** %var_groups_ptr
  store i8* %t73, i8** %reg_24_ptr
  %t74 = load i8*, i8** %reg_24_ptr
  %t75 = load i8*, i8** %reg_18_ptr
  %t76 = load i8*, i8** %reg_23_ptr
  call void @obo_map_put_boxed(i8* %t74, i8* %t75, i8* %t76)
  store i8* %t74, i8** %reg_25_ptr
  %t77 = load i8*, i8** %reg_25_ptr
  store i8* %t77, i8** %var_groups_ptr
  br label %group_by_b7
group_by_b6:
  %t78 = load i8*, i8** %var_key_ptr
  store i8* %t78, i8** %reg_26_ptr
  %t79 = load i8*, i8** %var_row_ptr
  store i8* %t79, i8** %reg_27_ptr
  %t80 = call i8* @obo_mixed_list_new(i64 1)
  %t81 = load i8*, i8** %reg_27_ptr
  call void @obo_mixed_list_set(i8* %t80, i64 0, i8* %t81)
  store i8* %t80, i8** %reg_28_ptr
  %t83 = load i8*, i8** %var_groups_ptr
  store i8* %t83, i8** %reg_29_ptr
  %t84 = load i8*, i8** %reg_29_ptr
  %t85 = load i8*, i8** %reg_26_ptr
  %t86 = load i8*, i8** %reg_28_ptr
  call void @obo_map_put_list(i8* %t84, i8* %t85, i8* %t86)
  store i8* %t84, i8** %reg_30_ptr
  %t87 = load i8*, i8** %reg_30_ptr
  store i8* %t87, i8** %var_groups_ptr
  %t88 = load i8*, i8** %var_key_ptr
  store i8* %t88, i8** %reg_31_ptr
  %t89 = load i8*, i8** %var_keys_ptr
  store i8* %t89, i8** %reg_32_ptr
  %t90 = load i8*, i8** %reg_32_ptr
  %t91 = load i8*, i8** %reg_31_ptr
  %t92 = call i8* @obo_box_str(i8* %t91)
  %t93 = call i8* @obo_mixed_list_add(i8* %t90, i8* %t92)
  store i8* %t93, i8** %reg_33_ptr
  %t94 = load i8*, i8** %reg_33_ptr
  store i8* %t94, i8** %var_keys_ptr
  br label %group_by_b7
group_by_b7:
  br label %group_by_b3
}

define internal i8* @Table_create(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %var_cols_ptr = alloca i8*
  %var_tname_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %var_cols_ptr)
  call void @obo_gc_push_root(i8** %var_tname_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_tname_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_cols_ptr
  %t2 = load i8*, i8** %var_tname_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %var_cols_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t4, i8** %reg_4_ptr
  %t5 = call i8* @obo_entity_new(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.41, i64 0, i64 0))
  %t6 = load i8*, i8** %reg_2_ptr
  call void @obo_entity_put_str(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0), i8* %t6)
  %t7 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.42, i64 0, i64 0), i8* %t7)
  %t8 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t8)
  call void @obo_entity_put_i64(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0), i64 1)
  store i8* %t5, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  call void @obo_gc_pop_roots(i64 2)
  ret i8* %t9
}

define i8* @Table_insert(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_r_ptr = alloca i8*
  %var_record_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 9
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_9_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_10_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_11_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_14_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_15_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_16_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %var_self_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %var_r_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %var_record_ptr, i8*** %gc_root_gep_8
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 9)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_record_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %var_record_ptr
  store i8* %t5, i8** %reg_4_ptr
  %t6 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.45, i64 0, i64 0), i32 2)
  call void @obo_entity_set_field_name(i8* %t6, i32 0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.46, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t6, i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.40, i64 0, i64 0))
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = getelementptr i8, i8* %t6, i64 32
  store i8 0, i8* %t8
  %t9 = getelementptr i8, i8* %t6, i64 40
  %t10 = bitcast i8* %t9 to i64*
  store i64 %t7, i64* %t10
  %t11 = load i8*, i8** %reg_4_ptr
  %t12 = getelementptr i8, i8* %t6, i64 48
  store i8 3, i8* %t12
  %t13 = getelementptr i8, i8* %t6, i64 56
  %t14 = bitcast i8* %t13 to i8**
  store i8* %t11, i8** %t14
  store i8* %t6, i8** %reg_5_ptr
  %t15 = load i8*, i8** %reg_5_ptr
  store i8* %t15, i8** %var_r_ptr
  %t16 = load i8*, i8** %var_r_ptr
  store i8* %t16, i8** %reg_6_ptr
  %t17 = load i8*, i8** %var_self_ptr
  store i8* %t17, i8** %reg_7_ptr
  %t18 = load i8*, i8** %reg_7_ptr
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t19, i8** %reg_8_ptr
  %t20 = load i8*, i8** %reg_8_ptr
  %t21 = call i8* @obo_value_as_mixed_list_ptr(i8* %t20)
  %t22 = load i8*, i8** %reg_6_ptr
  %t23 = call i8* @obo_box_entity(i8* %t22)
  %t24 = call i8* @obo_mixed_list_add(i8* %t21, i8* %t23)
  %t25 = call i8* @obo_box_list(i8* %t24)
  store i8* %t25, i8** %reg_9_ptr
  %t26 = load i8*, i8** %var_self_ptr
  store i8* %t26, i8** %reg_10_ptr
  %t27 = load i8*, i8** %reg_10_ptr
  %t28 = load i8*, i8** %reg_9_ptr
  call void @obo_entity_put_boxed(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t28)
  %t29 = load i8*, i8** %var_self_ptr
  store i8* %t29, i8** %reg_11_ptr
  %t30 = load i8*, i8** %reg_11_ptr
  %t31 = call i8* @obo_entity_get_boxed(i8* %t30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t31, i8** %reg_12_ptr
  %t32 = load i64, i64* %reg_12_ptr
  %t33 = add i64 %t32, 1
  store i64 %t33, i64* %reg_13_ptr
  %t34 = load i8*, i8** %var_self_ptr
  store i8* %t34, i8** %reg_14_ptr
  %t35 = load i8*, i8** %reg_14_ptr
  %t36 = load i64, i64* %reg_13_ptr
  call void @obo_entity_put_i64(i8* %t35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0), i64 %t36)
  %t37 = load i8*, i8** %var_r_ptr
  store i8* %t37, i8** %reg_15_ptr
  %t38 = load i8*, i8** %reg_15_ptr
  %t39 = getelementptr i8, i8* %t38, i64 32
  store i8* %t39, i8** %reg_16_ptr
  %t40 = load i8*, i8** %reg_16_ptr
  call void @obo_gc_pop_roots(i64 9)
  ret i8* %t40
}

define i8* @Table_where(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %var_current_ptr = alloca i8*
  %var_filtered_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_result_table_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 14
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_6_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_7_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_8_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_9_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_10_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_11_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_12_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_13_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_14_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %var_current_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %var_filtered_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %var_self_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %var_result_table_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %var_pred_ptr, i8*** %gc_root_gep_13
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 14)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  store i8* %t5, i8** %var_current_ptr
  %t6 = load i8*, i8** %var_pred_ptr
  store i8* %t6, i8** %reg_4_ptr
  %t7 = load i8*, i8** %var_current_ptr
  store i8* %t7, i8** %reg_5_ptr
  %t8 = load i8*, i8** %reg_5_ptr
  %t9 = call i8* @obo_value_as_mixed_list_ptr(i8* %t8)
  %t10 = load i8*, i8** %reg_4_ptr
  %t11 = call i8* @obo_mixed_list_filter(i8* %t9, i8* %t10)
  %t12 = call i8* @obo_box_list(i8* %t11)
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  store i8* %t13, i8** %var_filtered_ptr
  %t14 = load i8*, i8** %var_self_ptr
  store i8* %t14, i8** %reg_7_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  %t16 = call i8* @obo_entity_get_boxed(i8* %t15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0))
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %var_self_ptr
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %reg_8_ptr
  %t21 = call i8* @obo_value_to_str(i8* %t20)
  %t22 = load i8*, i8** %reg_10_ptr
  %t23 = call i8* @obo_value_as_mixed_list_ptr(i8* %t22)
  %t24 = call i8* @Table_create(i8* %t21, i8* %t23)
  store i8* %t24, i8** %reg_11_ptr
  %t25 = load i8*, i8** %reg_11_ptr
  store i8* %t25, i8** %var_result_table_ptr
  %t26 = load i8*, i8** %var_filtered_ptr
  store i8* %t26, i8** %reg_12_ptr
  %t27 = load i8*, i8** %var_result_table_ptr
  store i8* %t27, i8** %reg_13_ptr
  %t28 = load i8*, i8** %reg_13_ptr
  %t29 = load i8*, i8** %reg_12_ptr
  call void @obo_entity_put_boxed(i8* %t28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t29)
  %t30 = load i8*, i8** %var_result_table_ptr
  store i8* %t30, i8** %reg_14_ptr
  %t31 = load i8*, i8** %reg_14_ptr
  call void @obo_gc_pop_roots(i64 14)
  ret i8* %t31
}

define i8* @Table_order_by(i8* %arg0, i8* %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
  %var_ascending_ptr = alloca i64
  %var_va_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_result_table_ptr = alloca i8*
  %var_vb_ptr = alloca i64
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 13
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_10_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_11_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_12_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_13_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_14_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_15_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_16_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_17_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_18_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %var_sorted_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %var_column_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %var_result_table_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %var_self_ptr, i8*** %gc_root_gep_12
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 13)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_ascending_ptr
  %t3 = load i64, i64* %var_ascending_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i8*, i8** %var_column_ptr
  store i8* %t4, i8** %reg_4_ptr
  %t5 = load i64, i64* %var_va_ptr
  store i64 %t5, i64* %reg_5_ptr
  %t6 = load i64, i64* %var_vb_ptr
  store i64 %t6, i64* %reg_6_ptr
  %t7 = bitcast i64 (i8*, i64, i64)* @__closure_0 to i8*
  %t8 = call i8* @obo_closure_new(i8* %t7, i64 4)
  %t9 = load i64, i64* %reg_3_ptr
  call void @obo_closure_set_capture(i8* %t8, i64 0, i64 %t9)
  %t10 = load i8*, i8** %reg_4_ptr
  %t11 = ptrtoint i8* %t10 to i64
  call void @obo_closure_set_capture(i8* %t8, i64 1, i64 %t11)
  %t12 = load i64, i64* %reg_5_ptr
  call void @obo_closure_set_capture(i8* %t8, i64 2, i64 %t12)
  %t13 = load i64, i64* %reg_6_ptr
  call void @obo_closure_set_capture(i8* %t8, i64 3, i64 %t13)
  store i8* %t8, i8** %reg_7_ptr
  %t14 = load i8*, i8** %var_self_ptr
  store i8* %t14, i8** %reg_8_ptr
  %t15 = load i8*, i8** %reg_8_ptr
  %t16 = call i8* @obo_entity_get_boxed(i8* %t15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = call i8* @obo_value_as_mixed_list_ptr(i8* %t17)
  %t19 = load i8*, i8** %reg_7_ptr
  %t20 = call i8* @obo_mixed_list_sort_by(i8* %t18, i8* %t19)
  %t21 = call i8* @obo_box_list(i8* %t20)
  store i8* %t21, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_10_ptr
  store i8* %t22, i8** %var_sorted_ptr
  %t23 = load i8*, i8** %var_self_ptr
  store i8* %t23, i8** %reg_11_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @obo_entity_get_boxed(i8* %t24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0))
  store i8* %t25, i8** %reg_12_ptr
  %t26 = load i8*, i8** %var_self_ptr
  store i8* %t26, i8** %reg_13_ptr
  %t27 = load i8*, i8** %reg_13_ptr
  %t28 = call i8* @obo_entity_get_boxed(i8* %t27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t28, i8** %reg_14_ptr
  %t29 = load i8*, i8** %reg_12_ptr
  %t30 = call i8* @obo_value_to_str(i8* %t29)
  %t31 = load i8*, i8** %reg_14_ptr
  %t32 = call i8* @obo_value_as_mixed_list_ptr(i8* %t31)
  %t33 = call i8* @Table_create(i8* %t30, i8* %t32)
  store i8* %t33, i8** %reg_15_ptr
  %t34 = load i8*, i8** %reg_15_ptr
  store i8* %t34, i8** %var_result_table_ptr
  %t35 = load i8*, i8** %var_sorted_ptr
  store i8* %t35, i8** %reg_16_ptr
  %t36 = load i8*, i8** %var_result_table_ptr
  store i8* %t36, i8** %reg_17_ptr
  %t37 = load i8*, i8** %reg_17_ptr
  %t38 = load i8*, i8** %reg_16_ptr
  call void @obo_entity_put_boxed(i8* %t37, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t38)
  %t39 = load i8*, i8** %var_result_table_ptr
  store i8* %t39, i8** %reg_18_ptr
  %t40 = load i8*, i8** %reg_18_ptr
  call void @obo_gc_pop_roots(i64 13)
  ret i8* %t40
}

define i64 @Table_update_where(i8* %arg0, i8* %arg1, i8* %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i64
  %var_self_ptr = alloca i8*
  %var_current_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var_updater_ptr = alloca i8*
  %var_new_rows_ptr = alloca i8*
  %var_changed_ptr = alloca i64
  %var_new_data_ptr = alloca i8*
  %var___iter_idx_7_ptr = alloca i64
  %var_r_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 15
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_18_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_19_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_20_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_21_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_22_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_23_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_24_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_29_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %var_self_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %var_current_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %var_pred_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %var_updater_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %var_new_rows_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %var_new_data_ptr, i8*** %gc_root_gep_13
  %gc_root_gep_14 = getelementptr i8**, i8*** %gc_root_arr, i64 14
  store i8** %var_r_ptr, i8*** %gc_root_gep_14
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 15)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_updater_ptr
  %t3 = load i8*, i8** %var_self_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t5, i8** %reg_4_ptr
  %t6 = load i8*, i8** %reg_4_ptr
  store i8* %t6, i8** %var_current_ptr
  %t7 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t7, i8** %reg_5_ptr
  %t8 = load i8*, i8** %reg_5_ptr
  store i8* %t8, i8** %var_new_rows_ptr
  store i64 0, i64* %var_changed_ptr
  %t9 = load i8*, i8** %var_current_ptr
  store i8* %t9, i8** %reg_6_ptr
  store i64 0, i64* %var___iter_idx_7_ptr
  %t10 = load i8*, i8** %reg_6_ptr
  %t11 = call i64 @obo_value_len(i8* %t10)
  store i64 %t11, i64* %reg_7_ptr
  br label %Table_update_where_b1
Table_update_where_b1:
  %t12 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t12, i64* %reg_8_ptr
  %t13 = load i64, i64* %reg_8_ptr
  %t14 = load i64, i64* %reg_7_ptr
  %t15 = icmp slt i64 %t13, %t14
  %t16 = zext i1 %t15 to i64
  store i64 %t16, i64* %reg_9_ptr
  %t17 = load i64, i64* %reg_9_ptr
  %t19 = icmp ne i64 %t17, 0
  %t20 = zext i1 %t19 to i64
  %t18 = icmp ne i64 %t20, 0
  br i1 %t18, label %Table_update_where_b2, label %Table_update_where_b4
Table_update_where_b2:
  %t21 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t21, i64* %reg_10_ptr
  %t22 = load i8*, i8** %reg_6_ptr
  %t23 = load i64, i64* %reg_10_ptr
  %t24 = call i8* @obo_value_as_mixed_list_ptr(i8* %t22)
  %t25 = mul i64 %t23, 16
  %t26 = add i64 %t25, 16
  %t27 = getelementptr i8, i8* %t24, i64 %t26
  store i8* %t27, i8** %reg_11_ptr
  %t28 = load i8*, i8** %reg_11_ptr
  store i8* %t28, i8** %var_r_ptr
  %t29 = load i8*, i8** %var_r_ptr
  store i8* %t29, i8** %reg_12_ptr
  %t30 = load i8*, i8** %var_pred_ptr
  store i8* %t30, i8** %reg_13_ptr
  %t31 = load i8*, i8** %reg_13_ptr
  %t32 = load i8*, i8** %reg_12_ptr
  %t33 = call i64 @obo_value_to_closure_arg_boxed(i8* %t32)
  %t34 = call i64 @obo_closure_call_1(i8* %t31, i64 %t33)
  store i64 %t34, i64* %reg_14_ptr
  %t35 = load i64, i64* %reg_14_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %Table_update_where_b5, label %Table_update_where_b6
Table_update_where_b3:
  %t39 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t39, i64* %reg_30_ptr
  %t40 = load i64, i64* %reg_30_ptr
  %t41 = add i64 %t40, 1
  store i64 %t41, i64* %reg_31_ptr
  %t42 = load i64, i64* %reg_31_ptr
  store i64 %t42, i64* %var___iter_idx_7_ptr
  br label %Table_update_where_b1
Table_update_where_b4:
  %t43 = load i8*, i8** %var_new_rows_ptr
  store i8* %t43, i8** %reg_32_ptr
  %t44 = load i8*, i8** %var_self_ptr
  store i8* %t44, i8** %reg_33_ptr
  %t45 = load i8*, i8** %reg_33_ptr
  %t46 = load i8*, i8** %reg_32_ptr
  call void @obo_entity_put_list(i8* %t45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t46)
  %t47 = load i64, i64* %var_changed_ptr
  store i64 %t47, i64* %reg_34_ptr
  %t48 = load i64, i64* %reg_34_ptr
  call void @obo_gc_pop_roots(i64 15)
  ret i64 %t48
Table_update_where_b5:
  %t49 = load i8*, i8** %var_r_ptr
  store i8* %t49, i8** %reg_15_ptr
  %t50 = load i8*, i8** %reg_15_ptr
  %t52 = getelementptr i8, i8* %t50, i64 8
  %t53 = bitcast i8* %t52 to i8**
  %t51 = load i8*, i8** %t53
  %t54 = getelementptr i8, i8* %t51, i64 48
  store i8* %t54, i8** %reg_16_ptr
  %t55 = load i8*, i8** %var_updater_ptr
  store i8* %t55, i8** %reg_17_ptr
  %t56 = load i8*, i8** %reg_17_ptr
  %t57 = load i8*, i8** %reg_16_ptr
  %t58 = call i64 @obo_value_to_closure_arg_boxed(i8* %t57)
  %t59 = call i64 @obo_closure_call_1(i8* %t56, i64 %t58)
  %t60 = inttoptr i64 %t59 to i8*
  store i8* %t60, i8** %reg_18_ptr
  %t61 = load i8*, i8** %reg_18_ptr
  store i8* %t61, i8** %var_new_data_ptr
  %t62 = load i8*, i8** %var_r_ptr
  store i8* %t62, i8** %reg_19_ptr
  %t63 = load i8*, i8** %reg_19_ptr
  %t64 = getelementptr i8, i8* %t51, i64 32
  store i8* %t64, i8** %reg_20_ptr
  %t65 = load i8*, i8** %var_new_data_ptr
  store i8* %t65, i8** %reg_21_ptr
  %t66 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.45, i64 0, i64 0), i32 2)
  call void @obo_entity_set_field_name(i8* %t66, i32 0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.46, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t66, i32 1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.40, i64 0, i64 0))
  %t67 = load i8*, i8** %reg_20_ptr
  %t68 = load i8, i8* %t67
  %t69 = getelementptr i8, i8* %t67, i64 8
  %t70 = bitcast i8* %t69 to i64*
  %t71 = load i64, i64* %t70
  %t72 = getelementptr i8, i8* %t66, i64 32
  store i8 %t68, i8* %t72
  %t73 = getelementptr i8, i8* %t66, i64 40
  %t74 = bitcast i8* %t73 to i64*
  store i64 %t71, i64* %t74
  %t75 = load i8*, i8** %reg_21_ptr
  %t76 = getelementptr i8, i8* %t66, i64 48
  store i8 3, i8* %t76
  %t77 = getelementptr i8, i8* %t66, i64 56
  %t78 = bitcast i8* %t77 to i8**
  store i8* %t75, i8** %t78
  store i8* %t66, i8** %reg_22_ptr
  %t79 = load i8*, i8** %var_new_rows_ptr
  store i8* %t79, i8** %reg_23_ptr
  %t80 = load i8*, i8** %reg_23_ptr
  %t81 = load i8*, i8** %reg_22_ptr
  %t82 = call i8* @obo_box_entity(i8* %t81)
  %t83 = call i8* @obo_mixed_list_add(i8* %t80, i8* %t82)
  store i8* %t83, i8** %reg_24_ptr
  %t84 = load i8*, i8** %reg_24_ptr
  store i8* %t84, i8** %var_new_rows_ptr
  %t85 = load i64, i64* %var_changed_ptr
  store i64 %t85, i64* %reg_25_ptr
  %t86 = load i64, i64* %reg_25_ptr
  %t87 = add i64 %t86, 1
  store i64 %t87, i64* %reg_26_ptr
  %t88 = load i64, i64* %reg_26_ptr
  store i64 %t88, i64* %var_changed_ptr
  br label %Table_update_where_b7
Table_update_where_b6:
  %t89 = load i8*, i8** %var_r_ptr
  store i8* %t89, i8** %reg_27_ptr
  %t90 = load i8*, i8** %var_new_rows_ptr
  store i8* %t90, i8** %reg_28_ptr
  %t91 = load i8*, i8** %reg_28_ptr
  %t92 = load i8*, i8** %reg_27_ptr
  %t93 = call i8* @obo_mixed_list_add(i8* %t91, i8* %t92)
  store i8* %t93, i8** %reg_29_ptr
  %t94 = load i8*, i8** %reg_29_ptr
  store i8* %t94, i8** %var_new_rows_ptr
  br label %Table_update_where_b7
Table_update_where_b7:
  br label %Table_update_where_b3
}

define i64 @Table_delete_where(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i64
  %var___iter_idx_9_ptr = alloca i64
  %var_current_ptr = alloca i8*
  %var_kept_ptr = alloca i8*
  %var_r_ptr = alloca i8*
  %var_before_ptr = alloca i64
  %var_self_ptr = alloca i8*
  %var_match_ptr = alloca i64
  %var_pred_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  %gc_root_arr = alloca i8**, i64 6
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_21_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %var_current_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_kept_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_r_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %var_self_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %var_pred_ptr, i8*** %gc_root_gep_5
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 6)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  %t6 = call i64 @obo_value_len(i8* %t5)
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  store i64 %t7, i64* %var_before_ptr
  %t8 = load i8*, i8** %var_self_ptr
  store i8* %t8, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  %t10 = call i8* @obo_entity_get_boxed(i8* %t9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t10, i8** %reg_6_ptr
  %t11 = load i8*, i8** %reg_6_ptr
  store i8* %t11, i8** %var_current_ptr
  %t12 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t12, i8** %reg_7_ptr
  %t13 = load i8*, i8** %reg_7_ptr
  store i8* %t13, i8** %var_kept_ptr
  %t14 = load i8*, i8** %var_current_ptr
  store i8* %t14, i8** %reg_8_ptr
  store i64 0, i64* %var___iter_idx_9_ptr
  %t15 = load i8*, i8** %reg_8_ptr
  %t16 = call i64 @obo_value_len(i8* %t15)
  store i64 %t16, i64* %reg_9_ptr
  br label %Table_delete_where_b1
Table_delete_where_b1:
  %t17 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t17, i64* %reg_10_ptr
  %t18 = load i64, i64* %reg_10_ptr
  %t19 = load i64, i64* %reg_9_ptr
  %t20 = icmp slt i64 %t18, %t19
  %t21 = zext i1 %t20 to i64
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_11_ptr
  %t24 = icmp ne i64 %t22, 0
  %t25 = zext i1 %t24 to i64
  %t23 = icmp ne i64 %t25, 0
  br i1 %t23, label %Table_delete_where_b2, label %Table_delete_where_b4
Table_delete_where_b2:
  %t26 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i8*, i8** %reg_8_ptr
  %t28 = load i64, i64* %reg_12_ptr
  %t29 = call i8* @obo_value_as_mixed_list_ptr(i8* %t27)
  %t30 = mul i64 %t28, 16
  %t31 = add i64 %t30, 16
  %t32 = getelementptr i8, i8* %t29, i64 %t31
  store i8* %t32, i8** %reg_13_ptr
  %t33 = load i8*, i8** %reg_13_ptr
  store i8* %t33, i8** %var_r_ptr
  %t34 = load i8*, i8** %var_r_ptr
  store i8* %t34, i8** %reg_14_ptr
  %t35 = load i8*, i8** %var_pred_ptr
  store i8* %t35, i8** %reg_15_ptr
  %t36 = load i8*, i8** %reg_15_ptr
  %t37 = load i8*, i8** %reg_14_ptr
  %t38 = call i64 @obo_value_to_closure_arg_boxed(i8* %t37)
  %t39 = call i64 @obo_closure_call_1(i8* %t36, i64 %t38)
  store i64 %t39, i64* %reg_16_ptr
  %t40 = load i64, i64* %reg_16_ptr
  store i64 %t40, i64* %var_match_ptr
  %t41 = load i64, i64* %var_match_ptr
  store i64 %t41, i64* %reg_17_ptr
  %t42 = load i64, i64* %reg_17_ptr
  %t43 = icmp ne i64 %t42, 0
  %t44 = zext i1 %t43 to i64
  %t45 = icmp eq i64 %t44, 0
  %t46 = zext i1 %t45 to i64
  store i64 %t46, i64* %reg_18_ptr
  %t47 = load i64, i64* %reg_18_ptr
  %t49 = icmp ne i64 %t47, 0
  %t50 = zext i1 %t49 to i64
  %t48 = icmp ne i64 %t50, 0
  br i1 %t48, label %Table_delete_where_b5, label %Table_delete_where_b6
Table_delete_where_b3:
  %t51 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t51, i64* %reg_22_ptr
  %t52 = load i64, i64* %reg_22_ptr
  %t53 = add i64 %t52, 1
  store i64 %t53, i64* %reg_23_ptr
  %t54 = load i64, i64* %reg_23_ptr
  store i64 %t54, i64* %var___iter_idx_9_ptr
  br label %Table_delete_where_b1
Table_delete_where_b4:
  %t55 = load i8*, i8** %var_kept_ptr
  store i8* %t55, i8** %reg_24_ptr
  %t56 = load i8*, i8** %var_self_ptr
  store i8* %t56, i8** %reg_25_ptr
  %t57 = load i8*, i8** %reg_25_ptr
  %t58 = load i8*, i8** %reg_24_ptr
  call void @obo_entity_put_list(i8* %t57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0), i8* %t58)
  %t59 = load i64, i64* %var_before_ptr
  store i64 %t59, i64* %reg_26_ptr
  %t60 = load i8*, i8** %var_self_ptr
  store i8* %t60, i8** %reg_27_ptr
  %t61 = load i8*, i8** %reg_27_ptr
  %t62 = call i8* @obo_entity_get_boxed(i8* %t61, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t62, i8** %reg_28_ptr
  %t63 = load i8*, i8** %reg_28_ptr
  %t64 = call i64 @obo_value_len(i8* %t63)
  store i64 %t64, i64* %reg_29_ptr
  %t65 = load i64, i64* %reg_26_ptr
  %t66 = load i64, i64* %reg_29_ptr
  %t67 = sub i64 %t65, %t66
  store i64 %t67, i64* %reg_30_ptr
  %t68 = load i64, i64* %reg_30_ptr
  call void @obo_gc_pop_roots(i64 6)
  ret i64 %t68
Table_delete_where_b5:
  %t69 = load i8*, i8** %var_r_ptr
  store i8* %t69, i8** %reg_19_ptr
  %t70 = load i8*, i8** %var_kept_ptr
  store i8* %t70, i8** %reg_20_ptr
  %t71 = load i8*, i8** %reg_20_ptr
  %t72 = load i8*, i8** %reg_19_ptr
  %t73 = call i8* @obo_mixed_list_add(i8* %t71, i8* %t72)
  store i8* %t73, i8** %reg_21_ptr
  %t74 = load i8*, i8** %reg_21_ptr
  store i8* %t74, i8** %var_kept_ptr
  br label %Table_delete_where_b7
Table_delete_where_b6:
  br label %Table_delete_where_b7
Table_delete_where_b7:
  br label %Table_delete_where_b3
}

define i8* @Table_find_first(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %var___iter_idx_4_ptr = alloca i64
  %var_r_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  store i64 0, i64* %var___iter_idx_4_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  %t6 = call i64 @obo_value_len(i8* %t5)
  store i64 %t6, i64* %reg_4_ptr
  br label %Table_find_first_b1
Table_find_first_b1:
  %t7 = load i64, i64* %var___iter_idx_4_ptr
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_5_ptr
  %t9 = load i64, i64* %reg_4_ptr
  %t10 = icmp slt i64 %t8, %t9
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  %t14 = icmp ne i64 %t12, 0
  %t15 = zext i1 %t14 to i64
  %t13 = icmp ne i64 %t15, 0
  br i1 %t13, label %Table_find_first_b2, label %Table_find_first_b4
Table_find_first_b2:
  %t16 = load i64, i64* %var___iter_idx_4_ptr
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i8*, i8** %reg_3_ptr
  %t18 = load i64, i64* %reg_7_ptr
  %t19 = call i8* @obo_value_as_mixed_list_ptr(i8* %t17)
  %t20 = mul i64 %t18, 16
  %t21 = add i64 %t20, 16
  %t22 = getelementptr i8, i8* %t19, i64 %t21
  store i8* %t22, i8** %reg_8_ptr
  %t23 = load i8*, i8** %reg_8_ptr
  store i8* %t23, i8** %var_r_ptr
  %t24 = load i8*, i8** %var_r_ptr
  store i8* %t24, i8** %reg_9_ptr
  %t25 = load i8*, i8** %var_pred_ptr
  store i8* %t25, i8** %reg_10_ptr
  %t26 = load i8*, i8** %reg_10_ptr
  %t27 = load i8*, i8** %reg_9_ptr
  %t28 = call i64 @obo_value_to_closure_arg_boxed(i8* %t27)
  %t29 = call i64 @obo_closure_call_1(i8* %t26, i64 %t28)
  store i64 %t29, i64* %reg_11_ptr
  %t30 = load i64, i64* %reg_11_ptr
  %t32 = icmp ne i64 %t30, 0
  %t33 = zext i1 %t32 to i64
  %t31 = icmp ne i64 %t33, 0
  br i1 %t31, label %Table_find_first_b5, label %Table_find_first_b6
Table_find_first_b3:
  %t34 = load i64, i64* %var___iter_idx_4_ptr
  store i64 %t34, i64* %reg_13_ptr
  %t35 = load i64, i64* %reg_13_ptr
  %t36 = add i64 %t35, 1
  store i64 %t36, i64* %reg_14_ptr
  %t37 = load i64, i64* %reg_14_ptr
  store i64 %t37, i64* %var___iter_idx_4_ptr
  br label %Table_find_first_b1
Table_find_first_b4:
  %t38 = call i8* @obo_box_null()
  call void @obo_gc_pop_roots(i64 3)
  ret i8* %t38
Table_find_first_b5:
  %t39 = load i8*, i8** %var_r_ptr
  store i8* %t39, i8** %reg_12_ptr
  %t40 = load i8*, i8** %reg_12_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i8* %t40
Table_find_first_b6:
  br label %Table_find_first_b7
Table_find_first_b7:
  br label %Table_find_first_b3
}

define internal i8* @build_table(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_levels_ptr = alloca i8*
  %var_n_ptr = alloca i64
  %var_departments_ptr = alloca i8*
  %var_i_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  %gc_root_arr = alloca i8**, i64 4
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_4_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %var_t_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %var_levels_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %var_departments_ptr, i8*** %gc_root_gep_3
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 4)
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_n_ptr
  %t1 = call i8* @obo_mixed_list_new(i64 8)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 0, i8* %t2)
  %t3 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.7, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 1, i8* %t3)
  %t4 = call i8* @obo_box_str(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.8, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 2, i8* %t4)
  %t5 = call i8* @obo_box_str(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.9, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 3, i8* %t5)
  %t6 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.10, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 4, i8* %t6)
  %t7 = call i8* @obo_box_str(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.11, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 5, i8* %t7)
  %t8 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.12, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 6, i8* %t8)
  %t9 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.13, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 7, i8* %t9)
  store i8* %t1, i8** %reg_1_ptr
  %t10 = load i8*, i8** %reg_1_ptr
  store i8* %t10, i8** %var_departments_ptr
  %t11 = call i8* @obo_mixed_list_new(i64 5)
  %t12 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.14, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 0, i8* %t12)
  %t13 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.15, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 1, i8* %t13)
  %t14 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.16, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 2, i8* %t14)
  %t15 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.17, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 3, i8* %t15)
  %t16 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.18, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 4, i8* %t16)
  store i8* %t11, i8** %reg_2_ptr
  %t17 = load i8*, i8** %reg_2_ptr
  store i8* %t17, i8** %var_levels_ptr
  %t18 = call i8* @obo_mixed_list_new(i64 5)
  %t19 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 0, i8* %t19)
  %t20 = call i8* @obo_box_str(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.20, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 1, i8* %t20)
  %t21 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 2, i8* %t21)
  %t22 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.22, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 3, i8* %t22)
  %t23 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.23, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 4, i8* %t23)
  store i8* %t18, i8** %reg_3_ptr
  %t24 = load i8*, i8** %reg_3_ptr
  %t25 = call i8* @Table_create(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.24, i64 0, i64 0), i8* %t24)
  store i8* %t25, i8** %reg_4_ptr
  %t26 = load i8*, i8** %reg_4_ptr
  store i8* %t26, i8** %var_t_ptr
  store i64 0, i64* %var_i_ptr
  %t27 = load i64, i64* %var_n_ptr
  store i64 %t27, i64* %reg_5_ptr
  store i64 1, i64* %reg_6_ptr
  br label %build_table_b1
build_table_b1:
  %t28 = load i64, i64* %var_i_ptr
  store i64 %t28, i64* %reg_7_ptr
  %t29 = load i64, i64* %reg_7_ptr
  %t30 = load i64, i64* %reg_5_ptr
  %t31 = icmp slt i64 %t29, %t30
  %t32 = zext i1 %t31 to i64
  store i64 %t32, i64* %reg_8_ptr
  %t33 = load i64, i64* %reg_8_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %build_table_b2, label %build_table_b4
build_table_b2:
  %t37 = load i64, i64* %var_i_ptr
  store i64 %t37, i64* %reg_9_ptr
  %t38 = load i64, i64* %reg_9_ptr
  %t39 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.25, i64 0, i64 0), i64 %t38)
  store i8* %t39, i8** %reg_10_ptr
  %t40 = load i8*, i8** %var_departments_ptr
  store i8* %t40, i8** %reg_11_ptr
  %t41 = load i64, i64* %var_i_ptr
  store i64 %t41, i64* %reg_12_ptr
  %t42 = load i64, i64* %reg_12_ptr
  %t43 = call i64 @obo_safe_mod(i64 %t42, i64 8)
  store i64 %t43, i64* %reg_13_ptr
  %t44 = load i8*, i8** %reg_11_ptr
  %t45 = load i64, i64* %reg_13_ptr
  %t46 = mul i64 %t45, 16
  %t47 = add i64 %t46, 16
  %t48 = getelementptr i8, i8* %t44, i64 %t47
  store i8* %t48, i8** %reg_14_ptr
  %t49 = load i64, i64* %var_i_ptr
  store i64 %t49, i64* %reg_15_ptr
  %t50 = load i64, i64* %reg_15_ptr
  %t51 = mul i64 %t50, 37
  store i64 %t51, i64* %reg_16_ptr
  %t52 = load i64, i64* %reg_16_ptr
  %t53 = add i64 %t52, 17
  store i64 %t53, i64* %reg_17_ptr
  %t54 = load i64, i64* %reg_17_ptr
  %t55 = call i64 @obo_safe_mod(i64 %t54, i64 80000)
  store i64 %t55, i64* %reg_18_ptr
  %t56 = load i64, i64* %reg_18_ptr
  %t57 = add i64 40000, %t56
  store i64 %t57, i64* %reg_19_ptr
  %t58 = load i64, i64* %var_i_ptr
  store i64 %t58, i64* %reg_20_ptr
  %t59 = load i64, i64* %reg_20_ptr
  %t60 = call i64 @obo_safe_mod(i64 %t59, i64 30)
  store i64 %t60, i64* %reg_21_ptr
  %t61 = load i64, i64* %reg_21_ptr
  %t62 = add i64 22, %t61
  store i64 %t62, i64* %reg_22_ptr
  %t63 = load i8*, i8** %var_levels_ptr
  store i8* %t63, i8** %reg_23_ptr
  %t64 = load i64, i64* %var_i_ptr
  store i64 %t64, i64* %reg_24_ptr
  %t65 = load i64, i64* %reg_24_ptr
  %t66 = call i64 @obo_safe_mod(i64 %t65, i64 5)
  store i64 %t66, i64* %reg_25_ptr
  %t67 = load i8*, i8** %reg_23_ptr
  %t68 = load i64, i64* %reg_25_ptr
  %t69 = mul i64 %t68, 16
  %t70 = add i64 %t69, 16
  %t71 = getelementptr i8, i8* %t67, i64 %t70
  store i8* %t71, i8** %reg_26_ptr
  %t72 = call i8* @obo_map_new()
  %t73 = load i8*, i8** %reg_10_ptr
  call void @obo_map_put_str(i8* %t72, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0), i8* %t73)
  %t74 = load i8*, i8** %reg_14_ptr
  call void @obo_map_put_boxed(i8* %t72, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.20, i64 0, i64 0), i8* %t74)
  %t75 = load i64, i64* %reg_19_ptr
  call void @obo_map_put_i64(i8* %t72, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0), i64 %t75)
  %t76 = load i64, i64* %reg_22_ptr
  call void @obo_map_put_i64(i8* %t72, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.22, i64 0, i64 0), i64 %t76)
  %t77 = load i8*, i8** %reg_26_ptr
  call void @obo_map_put_boxed(i8* %t72, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.23, i64 0, i64 0), i8* %t77)
  store i8* %t72, i8** %reg_27_ptr
  %t78 = load i8*, i8** %var_t_ptr
  store i8* %t78, i8** %reg_28_ptr
  %t79 = load i8*, i8** %reg_28_ptr
  %t80 = load i8*, i8** %reg_27_ptr
  %t81 = call i8* @Table_insert(i8* %t79, i8* %t80)
  store i8* %t81, i8** %reg_29_ptr
  br label %build_table_b3
build_table_b3:
  %t82 = load i64, i64* %var_i_ptr
  store i64 %t82, i64* %reg_30_ptr
  %t83 = load i64, i64* %reg_30_ptr
  %t84 = load i64, i64* %reg_6_ptr
  %t85 = add i64 %t83, %t84
  store i64 %t85, i64* %reg_31_ptr
  %t86 = load i64, i64* %reg_31_ptr
  store i64 %t86, i64* %var_i_ptr
  br label %build_table_b1
build_table_b4:
  %t87 = load i8*, i8** %var_t_ptr
  store i8* %t87, i8** %reg_32_ptr
  %t88 = load i8*, i8** %reg_32_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i8* %t88
}

define internal i64 @run_queries(i8* %arg0) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i64
  %reg_44_ptr = alloca i64
  %reg_45_ptr = alloca i64
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca i64
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i64
  %reg_55_ptr = alloca i64
  %reg_56_ptr = alloca i8*
  %reg_57_ptr = alloca i8*
  %reg_58_ptr = alloca i8*
  %reg_59_ptr = alloca i64
  %reg_60_ptr = alloca i8*
  %reg_61_ptr = alloca i8*
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca i8*
  %reg_64_ptr = alloca i8*
  %reg_65_ptr = alloca i8*
  %reg_66_ptr = alloca i64
  %reg_67_ptr = alloca i64
  %reg_68_ptr = alloca i64
  %reg_69_ptr = alloca i64
  %reg_70_ptr = alloca i8*
  %reg_71_ptr = alloca i64
  %reg_72_ptr = alloca i8*
  %reg_73_ptr = alloca i8*
  %reg_74_ptr = alloca i8*
  %reg_75_ptr = alloca i64
  %reg_76_ptr = alloca i64
  %reg_77_ptr = alloca i64
  %reg_78_ptr = alloca i64
  %reg_79_ptr = alloca i8*
  %reg_80_ptr = alloca i8*
  %reg_81_ptr = alloca i8*
  %reg_82_ptr = alloca i8*
  %reg_83_ptr = alloca i64
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i8*
  %reg_86_ptr = alloca i8*
  %reg_87_ptr = alloca i8*
  %reg_88_ptr = alloca i64
  %reg_89_ptr = alloca i8*
  %reg_90_ptr = alloca i8*
  %reg_91_ptr = alloca i64
  %reg_92_ptr = alloca i64
  %reg_93_ptr = alloca i8*
  %reg_94_ptr = alloca i8*
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca i64
  %reg_97_ptr = alloca i8*
  %reg_98_ptr = alloca i8*
  %reg_99_ptr = alloca i64
  %reg_100_ptr = alloca i64
  %reg_101_ptr = alloca i64
  %var_sorted_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_groups_ptr = alloca i8*
  %var_eng_sorted_ptr = alloca i8*
  %var_eng_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
  %var___iter_idx_66_ptr = alloca i64
  %var_dept_ptr = alloca i8*
  %var_checksum_ptr = alloca i64
  %var_found_ptr = alloca i8*
  %var_above_ptr = alloca i8*
  %var_avg_ptr = alloca i64
  %var_high_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  %gc_root_arr = alloca i8**, i64 54
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_3_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_5_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_6_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_9_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_10_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_11_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_13_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_14_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_17_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %reg_18_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %reg_20_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %reg_21_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %reg_24_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %reg_25_ptr, i8*** %gc_root_gep_13
  %gc_root_gep_14 = getelementptr i8**, i8*** %gc_root_arr, i64 14
  store i8** %reg_29_ptr, i8*** %gc_root_gep_14
  %gc_root_gep_15 = getelementptr i8**, i8*** %gc_root_arr, i64 15
  store i8** %reg_30_ptr, i8*** %gc_root_gep_15
  %gc_root_gep_16 = getelementptr i8**, i8*** %gc_root_arr, i64 16
  store i8** %reg_31_ptr, i8*** %gc_root_gep_16
  %gc_root_gep_17 = getelementptr i8**, i8*** %gc_root_arr, i64 17
  store i8** %reg_33_ptr, i8*** %gc_root_gep_17
  %gc_root_gep_18 = getelementptr i8**, i8*** %gc_root_arr, i64 18
  store i8** %reg_34_ptr, i8*** %gc_root_gep_18
  %gc_root_gep_19 = getelementptr i8**, i8*** %gc_root_arr, i64 19
  store i8** %reg_36_ptr, i8*** %gc_root_gep_19
  %gc_root_gep_20 = getelementptr i8**, i8*** %gc_root_arr, i64 20
  store i8** %reg_37_ptr, i8*** %gc_root_gep_20
  %gc_root_gep_21 = getelementptr i8**, i8*** %gc_root_arr, i64 21
  store i8** %reg_41_ptr, i8*** %gc_root_gep_21
  %gc_root_gep_22 = getelementptr i8**, i8*** %gc_root_arr, i64 22
  store i8** %reg_42_ptr, i8*** %gc_root_gep_22
  %gc_root_gep_23 = getelementptr i8**, i8*** %gc_root_arr, i64 23
  store i8** %reg_46_ptr, i8*** %gc_root_gep_23
  %gc_root_gep_24 = getelementptr i8**, i8*** %gc_root_arr, i64 24
  store i8** %reg_47_ptr, i8*** %gc_root_gep_24
  %gc_root_gep_25 = getelementptr i8**, i8*** %gc_root_arr, i64 25
  store i8** %reg_51_ptr, i8*** %gc_root_gep_25
  %gc_root_gep_26 = getelementptr i8**, i8*** %gc_root_arr, i64 26
  store i8** %reg_52_ptr, i8*** %gc_root_gep_26
  %gc_root_gep_27 = getelementptr i8**, i8*** %gc_root_arr, i64 27
  store i8** %reg_53_ptr, i8*** %gc_root_gep_27
  %gc_root_gep_28 = getelementptr i8**, i8*** %gc_root_arr, i64 28
  store i8** %reg_56_ptr, i8*** %gc_root_gep_28
  %gc_root_gep_29 = getelementptr i8**, i8*** %gc_root_arr, i64 29
  store i8** %reg_57_ptr, i8*** %gc_root_gep_29
  %gc_root_gep_30 = getelementptr i8**, i8*** %gc_root_arr, i64 30
  store i8** %reg_58_ptr, i8*** %gc_root_gep_30
  %gc_root_gep_31 = getelementptr i8**, i8*** %gc_root_arr, i64 31
  store i8** %reg_60_ptr, i8*** %gc_root_gep_31
  %gc_root_gep_32 = getelementptr i8**, i8*** %gc_root_arr, i64 32
  store i8** %reg_61_ptr, i8*** %gc_root_gep_32
  %gc_root_gep_33 = getelementptr i8**, i8*** %gc_root_arr, i64 33
  store i8** %reg_62_ptr, i8*** %gc_root_gep_33
  %gc_root_gep_34 = getelementptr i8**, i8*** %gc_root_arr, i64 34
  store i8** %reg_63_ptr, i8*** %gc_root_gep_34
  %gc_root_gep_35 = getelementptr i8**, i8*** %gc_root_arr, i64 35
  store i8** %reg_64_ptr, i8*** %gc_root_gep_35
  %gc_root_gep_36 = getelementptr i8**, i8*** %gc_root_arr, i64 36
  store i8** %reg_65_ptr, i8*** %gc_root_gep_36
  %gc_root_gep_37 = getelementptr i8**, i8*** %gc_root_arr, i64 37
  store i8** %reg_81_ptr, i8*** %gc_root_gep_37
  %gc_root_gep_38 = getelementptr i8**, i8*** %gc_root_arr, i64 38
  store i8** %reg_82_ptr, i8*** %gc_root_gep_38
  %gc_root_gep_39 = getelementptr i8**, i8*** %gc_root_arr, i64 39
  store i8** %reg_93_ptr, i8*** %gc_root_gep_39
  %gc_root_gep_40 = getelementptr i8**, i8*** %gc_root_arr, i64 40
  store i8** %reg_94_ptr, i8*** %gc_root_gep_40
  %gc_root_gep_41 = getelementptr i8**, i8*** %gc_root_arr, i64 41
  store i8** %reg_95_ptr, i8*** %gc_root_gep_41
  %gc_root_gep_42 = getelementptr i8**, i8*** %gc_root_arr, i64 42
  store i8** %reg_97_ptr, i8*** %gc_root_gep_42
  %gc_root_gep_43 = getelementptr i8**, i8*** %gc_root_arr, i64 43
  store i8** %reg_98_ptr, i8*** %gc_root_gep_43
  %gc_root_gep_44 = getelementptr i8**, i8*** %gc_root_arr, i64 44
  store i8** %var_sorted_ptr, i8*** %gc_root_gep_44
  %gc_root_gep_45 = getelementptr i8**, i8*** %gc_root_arr, i64 45
  store i8** %var_t_ptr, i8*** %gc_root_gep_45
  %gc_root_gep_46 = getelementptr i8**, i8*** %gc_root_arr, i64 46
  store i8** %var_groups_ptr, i8*** %gc_root_gep_46
  %gc_root_gep_47 = getelementptr i8**, i8*** %gc_root_arr, i64 47
  store i8** %var_eng_sorted_ptr, i8*** %gc_root_gep_47
  %gc_root_gep_48 = getelementptr i8**, i8*** %gc_root_arr, i64 48
  store i8** %var_eng_ptr, i8*** %gc_root_gep_48
  %gc_root_gep_49 = getelementptr i8**, i8*** %gc_root_arr, i64 49
  store i8** %var_keys_ptr, i8*** %gc_root_gep_49
  %gc_root_gep_50 = getelementptr i8**, i8*** %gc_root_arr, i64 50
  store i8** %var_dept_ptr, i8*** %gc_root_gep_50
  %gc_root_gep_51 = getelementptr i8**, i8*** %gc_root_arr, i64 51
  store i8** %var_found_ptr, i8*** %gc_root_gep_51
  %gc_root_gep_52 = getelementptr i8**, i8*** %gc_root_arr, i64 52
  store i8** %var_above_ptr, i8*** %gc_root_gep_52
  %gc_root_gep_53 = getelementptr i8**, i8*** %gc_root_arr, i64 53
  store i8** %var_high_ptr, i8*** %gc_root_gep_53
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 54)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_t_ptr
  store i64 0, i64* %var_checksum_ptr
  %t1 = bitcast i64 (i8*, i64)* @__closure_1 to i8*
  %t2 = call i8* @obo_closure_new(i8* %t1, i64 0)
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %var_t_ptr
  store i8* %t3, i8** %reg_2_ptr
  %t4 = load i8*, i8** %reg_2_ptr
  %t5 = load i8*, i8** %reg_1_ptr
  %t6 = call i8* @Table_where(i8* %t4, i8* %t5)
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  store i8* %t7, i8** %var_high_ptr
  %t8 = load i64, i64* %var_checksum_ptr
  store i64 %t8, i64* %reg_4_ptr
  %t9 = load i8*, i8** %var_high_ptr
  store i8* %t9, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  %t11 = call i8* @obo_entity_get_boxed(i8* %t10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = call i64 @obo_value_len(i8* %t12)
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_4_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = add i64 %t14, %t15
  store i64 %t16, i64* %reg_8_ptr
  %t17 = load i64, i64* %reg_8_ptr
  store i64 %t17, i64* %var_checksum_ptr
  %t18 = bitcast i64 (i8*, i64)* @__closure_2 to i8*
  %t19 = call i8* @obo_closure_new(i8* %t18, i64 0)
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %var_t_ptr
  store i8* %t20, i8** %reg_10_ptr
  %t21 = load i8*, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_9_ptr
  %t23 = call i8* @Table_where(i8* %t21, i8* %t22)
  store i8* %t23, i8** %reg_11_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  store i8* %t24, i8** %var_eng_ptr
  %t25 = load i64, i64* %var_checksum_ptr
  store i64 %t25, i64* %reg_12_ptr
  %t26 = load i8*, i8** %var_eng_ptr
  store i8* %t26, i8** %reg_13_ptr
  %t27 = load i8*, i8** %reg_13_ptr
  %t28 = call i8* @obo_entity_get_boxed(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t28, i8** %reg_14_ptr
  %t29 = load i8*, i8** %reg_14_ptr
  %t30 = call i64 @obo_value_len(i8* %t29)
  store i64 %t30, i64* %reg_15_ptr
  %t31 = load i64, i64* %reg_12_ptr
  %t32 = load i64, i64* %reg_15_ptr
  %t33 = add i64 %t31, %t32
  store i64 %t33, i64* %reg_16_ptr
  %t34 = load i64, i64* %reg_16_ptr
  store i64 %t34, i64* %var_checksum_ptr
  %t35 = load i8*, i8** %var_t_ptr
  store i8* %t35, i8** %reg_17_ptr
  %t36 = load i8*, i8** %reg_17_ptr
  %t37 = call i8* @Table_order_by(i8* %t36, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0), i64 1)
  store i8* %t37, i8** %reg_18_ptr
  %t38 = load i8*, i8** %reg_18_ptr
  store i8* %t38, i8** %var_sorted_ptr
  %t39 = load i64, i64* %var_checksum_ptr
  store i64 %t39, i64* %reg_19_ptr
  %t40 = load i8*, i8** %var_sorted_ptr
  store i8* %t40, i8** %reg_20_ptr
  %t41 = load i8*, i8** %reg_20_ptr
  %t42 = call i8* @obo_entity_get_boxed(i8* %t41, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t42, i8** %reg_21_ptr
  %t43 = load i8*, i8** %reg_21_ptr
  %t44 = call i64 @obo_value_len(i8* %t43)
  store i64 %t44, i64* %reg_22_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t46 = load i64, i64* %reg_22_ptr
  %t47 = add i64 %t45, %t46
  store i64 %t47, i64* %reg_23_ptr
  %t48 = load i8*, i8** %var_t_ptr
  store i8* %t48, i8** %reg_24_ptr
  %t49 = load i8*, i8** %reg_24_ptr
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t50, i8** %reg_25_ptr
  %t51 = load i8*, i8** %reg_25_ptr
  %t52 = call i64 @obo_value_len(i8* %t51)
  store i64 %t52, i64* %reg_26_ptr
  %t53 = load i64, i64* %reg_23_ptr
  %t54 = load i64, i64* %reg_26_ptr
  %t55 = sub i64 %t53, %t54
  store i64 %t55, i64* %reg_27_ptr
  %t56 = load i64, i64* %reg_27_ptr
  store i64 %t56, i64* %var_checksum_ptr
  %t57 = load i64, i64* %var_checksum_ptr
  store i64 %t57, i64* %reg_28_ptr
  %t58 = load i8*, i8** %var_t_ptr
  store i8* %t58, i8** %reg_29_ptr
  %t59 = load i8*, i8** %reg_29_ptr
  %t60 = call i8* @obo_entity_get_boxed(i8* %t59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t60, i8** %reg_30_ptr
  %t61 = load i8*, i8** %reg_30_ptr
  %t62 = call i8* @max_of(i8* %t61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t62, i8** %reg_31_ptr
  %t63 = load i64, i64* %reg_28_ptr
  %t64 = load i8*, i8** %reg_31_ptr
  %t65 = call i64 @obo_value_as_i64(i8* %t64)
  %t66 = add i64 %t63, %t65
  store i64 %t66, i64* %reg_32_ptr
  %t67 = load i64, i64* %reg_32_ptr
  store i64 %t67, i64* %var_checksum_ptr
  %t68 = load i8*, i8** %var_eng_ptr
  store i8* %t68, i8** %reg_33_ptr
  %t69 = load i8*, i8** %reg_33_ptr
  %t70 = call i8* @Table_order_by(i8* %t69, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0), i64 1)
  store i8* %t70, i8** %reg_34_ptr
  %t71 = load i8*, i8** %reg_34_ptr
  store i8* %t71, i8** %var_eng_sorted_ptr
  %t72 = load i64, i64* %var_checksum_ptr
  store i64 %t72, i64* %reg_35_ptr
  %t73 = load i8*, i8** %var_eng_sorted_ptr
  store i8* %t73, i8** %reg_36_ptr
  %t74 = load i8*, i8** %reg_36_ptr
  %t75 = call i8* @obo_entity_get_boxed(i8* %t74, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t75, i8** %reg_37_ptr
  %t76 = load i8*, i8** %reg_37_ptr
  %t77 = call i64 @obo_value_len(i8* %t76)
  store i64 %t77, i64* %reg_38_ptr
  %t78 = load i64, i64* %reg_35_ptr
  %t79 = load i64, i64* %reg_38_ptr
  %t80 = add i64 %t78, %t79
  store i64 %t80, i64* %reg_39_ptr
  %t81 = load i64, i64* %reg_39_ptr
  store i64 %t81, i64* %var_checksum_ptr
  %t82 = load i64, i64* %var_checksum_ptr
  store i64 %t82, i64* %reg_40_ptr
  %t83 = load i8*, i8** %var_t_ptr
  store i8* %t83, i8** %reg_41_ptr
  %t84 = load i8*, i8** %reg_41_ptr
  %t85 = call i8* @obo_entity_get_boxed(i8* %t84, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t85, i8** %reg_42_ptr
  %t86 = load i8*, i8** %reg_42_ptr
  %t87 = call i64 @sum_of(i8* %t86, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i64 %t87, i64* %reg_43_ptr
  %t88 = load i64, i64* %reg_40_ptr
  %t89 = load i64, i64* %reg_43_ptr
  %t90 = add i64 %t88, %t89
  store i64 %t90, i64* %reg_44_ptr
  %t91 = load i64, i64* %reg_44_ptr
  store i64 %t91, i64* %var_checksum_ptr
  %t92 = load i64, i64* %var_checksum_ptr
  store i64 %t92, i64* %reg_45_ptr
  %t93 = load i8*, i8** %var_t_ptr
  store i8* %t93, i8** %reg_46_ptr
  %t94 = load i8*, i8** %reg_46_ptr
  %t95 = call i8* @obo_entity_get_boxed(i8* %t94, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t95, i8** %reg_47_ptr
  %t96 = load i8*, i8** %reg_47_ptr
  %t97 = call i64 @avg_of(i8* %t96, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i64 %t97, i64* %reg_48_ptr
  %t98 = load i64, i64* %reg_45_ptr
  %t99 = load i64, i64* %reg_48_ptr
  %t100 = add i64 %t98, %t99
  store i64 %t100, i64* %reg_49_ptr
  %t101 = load i64, i64* %reg_49_ptr
  store i64 %t101, i64* %var_checksum_ptr
  %t102 = load i64, i64* %var_checksum_ptr
  store i64 %t102, i64* %reg_50_ptr
  %t103 = load i8*, i8** %var_t_ptr
  store i8* %t103, i8** %reg_51_ptr
  %t104 = load i8*, i8** %reg_51_ptr
  %t105 = call i8* @obo_entity_get_boxed(i8* %t104, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t105, i8** %reg_52_ptr
  %t106 = load i8*, i8** %reg_52_ptr
  %t107 = call i8* @min_of(i8* %t106, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t107, i8** %reg_53_ptr
  %t108 = load i64, i64* %reg_50_ptr
  %t109 = load i8*, i8** %reg_53_ptr
  %t110 = call i64 @obo_value_as_i64(i8* %t109)
  %t111 = add i64 %t108, %t110
  store i64 %t111, i64* %reg_54_ptr
  %t112 = load i64, i64* %reg_54_ptr
  store i64 %t112, i64* %var_checksum_ptr
  %t113 = load i64, i64* %var_checksum_ptr
  store i64 %t113, i64* %reg_55_ptr
  %t114 = load i8*, i8** %var_t_ptr
  store i8* %t114, i8** %reg_56_ptr
  %t115 = load i8*, i8** %reg_56_ptr
  %t116 = call i8* @obo_entity_get_boxed(i8* %t115, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t116, i8** %reg_57_ptr
  %t117 = load i8*, i8** %reg_57_ptr
  %t118 = call i8* @max_of(i8* %t117, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t118, i8** %reg_58_ptr
  %t119 = load i64, i64* %reg_55_ptr
  %t120 = load i8*, i8** %reg_58_ptr
  %t121 = call i64 @obo_value_as_i64(i8* %t120)
  %t122 = add i64 %t119, %t121
  store i64 %t122, i64* %reg_59_ptr
  %t123 = load i64, i64* %reg_59_ptr
  store i64 %t123, i64* %var_checksum_ptr
  %t124 = load i8*, i8** %var_t_ptr
  store i8* %t124, i8** %reg_60_ptr
  %t125 = load i8*, i8** %reg_60_ptr
  %t126 = call i8* @obo_entity_get_boxed(i8* %t125, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t126, i8** %reg_61_ptr
  %t127 = load i8*, i8** %reg_61_ptr
  %t128 = call i8* @group_by(i8* %t127, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.20, i64 0, i64 0))
  store i8* %t128, i8** %reg_62_ptr
  %t129 = load i8*, i8** %reg_62_ptr
  %t130 = mul i64 0, 16
  %t131 = add i64 %t130, 16
  %t132 = getelementptr i8, i8* %t129, i64 %t131
  store i8* %t132, i8** %reg_63_ptr
  %t133 = load i8*, i8** %reg_63_ptr
  store i8* %t133, i8** %var_groups_ptr
  %t134 = load i8*, i8** %reg_62_ptr
  %t135 = mul i64 1, 16
  %t136 = add i64 %t135, 16
  %t137 = getelementptr i8, i8* %t134, i64 %t136
  store i8* %t137, i8** %reg_64_ptr
  %t138 = load i8*, i8** %reg_64_ptr
  store i8* %t138, i8** %var_keys_ptr
  %t139 = load i8*, i8** %var_keys_ptr
  store i8* %t139, i8** %reg_65_ptr
  store i64 0, i64* %var___iter_idx_66_ptr
  %t140 = load i8*, i8** %reg_65_ptr
  %t141 = call i64 @obo_value_len(i8* %t140)
  store i64 %t141, i64* %reg_66_ptr
  br label %run_queries_b1
run_queries_b1:
  %t142 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t142, i64* %reg_67_ptr
  %t143 = load i64, i64* %reg_67_ptr
  %t144 = load i64, i64* %reg_66_ptr
  %t145 = icmp slt i64 %t143, %t144
  %t146 = zext i1 %t145 to i64
  store i64 %t146, i64* %reg_68_ptr
  %t147 = load i64, i64* %reg_68_ptr
  %t149 = icmp ne i64 %t147, 0
  %t150 = zext i1 %t149 to i64
  %t148 = icmp ne i64 %t150, 0
  br i1 %t148, label %run_queries_b2, label %run_queries_b4
run_queries_b2:
  %t151 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t151, i64* %reg_69_ptr
  %t152 = load i8*, i8** %reg_65_ptr
  %t153 = load i64, i64* %reg_69_ptr
  %t154 = call i8* @obo_value_as_mixed_list_ptr(i8* %t152)
  %t155 = mul i64 %t153, 16
  %t156 = add i64 %t155, 16
  %t157 = getelementptr i8, i8* %t154, i64 %t156
  store i8* %t157, i8** %reg_70_ptr
  %t158 = load i8*, i8** %reg_70_ptr
  store i8* %t158, i8** %var_dept_ptr
  %t159 = load i64, i64* %var_checksum_ptr
  store i64 %t159, i64* %reg_71_ptr
  %t160 = load i8*, i8** %var_groups_ptr
  store i8* %t160, i8** %reg_72_ptr
  %t161 = load i8*, i8** %var_dept_ptr
  store i8* %t161, i8** %reg_73_ptr
  %t162 = load i8*, i8** %reg_72_ptr
  %t163 = load i8*, i8** %reg_73_ptr
  %t164 = call i8* @obo_value_to_str(i8* %t163)
  %t166 = call i8* @obo_value_as_map_ptr(i8* %t162)
  %t165 = call i8* @obo_map_get_boxed(i8* %t166, i8* %t164)
  store i8* %t165, i8** %reg_74_ptr
  %t167 = load i8*, i8** %reg_74_ptr
  %t168 = call i64 @obo_value_len(i8* %t167)
  store i64 %t168, i64* %reg_75_ptr
  %t169 = load i64, i64* %reg_71_ptr
  %t170 = load i64, i64* %reg_75_ptr
  %t171 = add i64 %t169, %t170
  store i64 %t171, i64* %reg_76_ptr
  %t172 = load i64, i64* %reg_76_ptr
  store i64 %t172, i64* %var_checksum_ptr
  br label %run_queries_b3
run_queries_b3:
  %t173 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t173, i64* %reg_77_ptr
  %t174 = load i64, i64* %reg_77_ptr
  %t175 = add i64 %t174, 1
  store i64 %t175, i64* %reg_78_ptr
  %t176 = load i64, i64* %reg_78_ptr
  store i64 %t176, i64* %var___iter_idx_66_ptr
  br label %run_queries_b1
run_queries_b4:
  %t177 = bitcast i64 (i8*, i64)* @__closure_3 to i8*
  %t178 = call i8* @obo_closure_new(i8* %t177, i64 0)
  store i8* %t178, i8** %reg_79_ptr
  %t179 = load i8*, i8** %var_t_ptr
  store i8* %t179, i8** %reg_80_ptr
  %t180 = load i8*, i8** %reg_80_ptr
  %t181 = load i8*, i8** %reg_79_ptr
  %t182 = call i8* @Table_find_first(i8* %t180, i8* %t181)
  store i8* %t182, i8** %reg_81_ptr
  %t183 = load i8*, i8** %reg_81_ptr
  store i8* %t183, i8** %var_found_ptr
  %t184 = load i8*, i8** %var_found_ptr
  store i8* %t184, i8** %reg_82_ptr
  %t185 = load i8*, i8** %reg_82_ptr
  %t186 = call i8* @obo_box_null()
  %t187 = call i64 @obo_value_compare(i8* %t185, i8* %t186)
  %t188 = icmp ne i64 %t187, 0
  %t189 = zext i1 %t188 to i64
  store i64 %t189, i64* %reg_83_ptr
  %t190 = load i64, i64* %reg_83_ptr
  %t192 = icmp ne i64 %t190, 0
  %t193 = zext i1 %t192 to i64
  %t191 = icmp ne i64 %t193, 0
  br i1 %t191, label %run_queries_b5, label %run_queries_b6
run_queries_b5:
  %t194 = load i64, i64* %var_checksum_ptr
  store i64 %t194, i64* %reg_84_ptr
  %t195 = load i8*, i8** %var_found_ptr
  store i8* %t195, i8** %reg_85_ptr
  %t196 = load i8*, i8** %reg_85_ptr
  %t198 = getelementptr i8, i8* %t196, i64 8
  %t199 = bitcast i8* %t198 to i8**
  %t197 = load i8*, i8** %t199
  %t200 = getelementptr i8, i8* %t197, i64 48
  store i8* %t200, i8** %reg_86_ptr
  %t201 = load i8*, i8** %reg_86_ptr
  %t203 = call i8* @obo_value_as_map_ptr(i8* %t201)
  %t202 = call i8* @obo_map_get_boxed(i8* %t203, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t202, i8** %reg_87_ptr
  %t204 = load i64, i64* %reg_84_ptr
  %t205 = load i8*, i8** %reg_87_ptr
  %t206 = call i64 @obo_value_as_i64(i8* %t205)
  %t207 = add i64 %t204, %t206
  store i64 %t207, i64* %reg_88_ptr
  %t208 = load i64, i64* %reg_88_ptr
  store i64 %t208, i64* %var_checksum_ptr
  br label %run_queries_b7
run_queries_b6:
  br label %run_queries_b7
run_queries_b7:
  %t209 = load i8*, i8** %var_t_ptr
  store i8* %t209, i8** %reg_89_ptr
  %t210 = load i8*, i8** %reg_89_ptr
  %t211 = call i8* @obo_entity_get_boxed(i8* %t210, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t211, i8** %reg_90_ptr
  %t212 = load i8*, i8** %reg_90_ptr
  %t213 = call i64 @avg_of(i8* %t212, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i64 %t213, i64* %reg_91_ptr
  %t214 = load i64, i64* %reg_91_ptr
  store i64 %t214, i64* %var_avg_ptr
  %t215 = load i64, i64* %var_avg_ptr
  store i64 %t215, i64* %reg_92_ptr
  %t216 = bitcast i64 (i8*, i64)* @__closure_4 to i8*
  %t217 = call i8* @obo_closure_new(i8* %t216, i64 1)
  %t218 = load i64, i64* %reg_92_ptr
  call void @obo_closure_set_capture(i8* %t217, i64 0, i64 %t218)
  store i8* %t217, i8** %reg_93_ptr
  %t219 = load i8*, i8** %var_t_ptr
  store i8* %t219, i8** %reg_94_ptr
  %t220 = load i8*, i8** %reg_94_ptr
  %t221 = load i8*, i8** %reg_93_ptr
  %t222 = call i8* @Table_where(i8* %t220, i8* %t221)
  store i8* %t222, i8** %reg_95_ptr
  %t223 = load i8*, i8** %reg_95_ptr
  store i8* %t223, i8** %var_above_ptr
  %t224 = load i64, i64* %var_checksum_ptr
  store i64 %t224, i64* %reg_96_ptr
  %t225 = load i8*, i8** %var_above_ptr
  store i8* %t225, i8** %reg_97_ptr
  %t226 = load i8*, i8** %reg_97_ptr
  %t227 = call i8* @obo_entity_get_boxed(i8* %t226, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t227, i8** %reg_98_ptr
  %t228 = load i8*, i8** %reg_98_ptr
  %t229 = call i64 @obo_value_len(i8* %t228)
  store i64 %t229, i64* %reg_99_ptr
  %t230 = load i64, i64* %reg_96_ptr
  %t231 = load i64, i64* %reg_99_ptr
  %t232 = add i64 %t230, %t231
  store i64 %t232, i64* %reg_100_ptr
  %t233 = load i64, i64* %reg_100_ptr
  store i64 %t233, i64* %var_checksum_ptr
  %t234 = load i64, i64* %var_checksum_ptr
  store i64 %t234, i64* %reg_101_ptr
  %t235 = load i64, i64* %reg_101_ptr
  call void @obo_gc_pop_roots(i64 54)
  ret i64 %t235
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i8*
  %var_checksum_ptr = alloca i64
  %var_total_checksum_ptr = alloca i64
  %var_removed_ptr = alloca i64
  %var_iter_ptr = alloca i64
  %var_t2_ptr = alloca i8*
  %var_iterations_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var__t_ptr = alloca i8*
  %gc_root_arr = alloca i8**, i64 16
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_4_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_6_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_7_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_13_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_14_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_16_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_17_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %reg_18_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %reg_21_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %reg_22_ptr, i8*** %gc_root_gep_9
  %gc_root_gep_10 = getelementptr i8**, i8*** %gc_root_arr, i64 10
  store i8** %reg_25_ptr, i8*** %gc_root_gep_10
  %gc_root_gep_11 = getelementptr i8**, i8*** %gc_root_arr, i64 11
  store i8** %reg_26_ptr, i8*** %gc_root_gep_11
  %gc_root_gep_12 = getelementptr i8**, i8*** %gc_root_arr, i64 12
  store i8** %reg_32_ptr, i8*** %gc_root_gep_12
  %gc_root_gep_13 = getelementptr i8**, i8*** %gc_root_arr, i64 13
  store i8** %reg_33_ptr, i8*** %gc_root_gep_13
  %gc_root_gep_14 = getelementptr i8**, i8*** %gc_root_arr, i64 14
  store i8** %var_t2_ptr, i8*** %gc_root_gep_14
  %gc_root_gep_15 = getelementptr i8**, i8*** %gc_root_arr, i64 15
  store i8** %var__t_ptr, i8*** %gc_root_gep_15
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 16)
  store i64 500, i64* %var_n_ptr
  store i64 20, i64* %var_iterations_ptr
  %t0 = load i64, i64* %var_n_ptr
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  %t2 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.30, i64 0, i64 0), i64 %t1)
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  %t4 = call i8* @obo_str_concat(i8* %t3, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t4, i8** %reg_2_ptr
  %t5 = load i8*, i8** %reg_2_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t5)
  %t6 = load i64, i64* %var_n_ptr
  store i64 %t6, i64* %reg_3_ptr
  %t7 = load i64, i64* %reg_3_ptr
  %t8 = call i8* @build_table(i64 %t7)
  store i8* %t8, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  store i8* %t9, i8** %var__t_ptr
  %t10 = load i64, i64* %var_iterations_ptr
  store i64 %t10, i64* %reg_5_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t12 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.32, i64 0, i64 0), i64 %t11)
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = call i8* @obo_str_concat(i8* %t13, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.33, i64 0, i64 0))
  store i8* %t14, i8** %reg_7_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t15)
  store i64 0, i64* %var_total_checksum_ptr
  store i64 0, i64* %var_iter_ptr
  %t16 = load i64, i64* %var_iterations_ptr
  store i64 %t16, i64* %reg_8_ptr
  store i64 1, i64* %reg_9_ptr
  br label %main_b1
main_b1:
  %t17 = load i64, i64* %var_iter_ptr
  store i64 %t17, i64* %reg_10_ptr
  %t18 = load i64, i64* %reg_10_ptr
  %t19 = load i64, i64* %reg_8_ptr
  %t20 = icmp slt i64 %t18, %t19
  %t21 = zext i1 %t20 to i64
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_11_ptr
  %t24 = icmp ne i64 %t22, 0
  %t25 = zext i1 %t24 to i64
  %t23 = icmp ne i64 %t25, 0
  br i1 %t23, label %main_b2, label %main_b4
main_b2:
  %t26 = load i64, i64* %var_n_ptr
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t28 = call i8* @build_table(i64 %t27)
  store i8* %t28, i8** %reg_13_ptr
  %t29 = load i8*, i8** %reg_13_ptr
  store i8* %t29, i8** %var_t2_ptr
  %t30 = load i8*, i8** %var_t2_ptr
  store i8* %t30, i8** %reg_14_ptr
  %t31 = load i8*, i8** %reg_14_ptr
  %t32 = call i64 @run_queries(i8* %t31)
  store i64 %t32, i64* %reg_15_ptr
  %t33 = load i64, i64* %reg_15_ptr
  store i64 %t33, i64* %var_checksum_ptr
  %t34 = bitcast i64 (i8*, i64)* @__closure_5 to i8*
  %t35 = call i8* @obo_closure_new(i8* %t34, i64 0)
  store i8* %t35, i8** %reg_16_ptr
  %t36 = bitcast i64 (i8*, i64)* @__closure_6 to i8*
  %t37 = call i8* @obo_closure_new(i8* %t36, i64 0)
  store i8* %t37, i8** %reg_17_ptr
  %t38 = load i8*, i8** %var_t2_ptr
  store i8* %t38, i8** %reg_18_ptr
  %t39 = load i8*, i8** %reg_18_ptr
  %t40 = load i8*, i8** %reg_16_ptr
  %t41 = load i8*, i8** %reg_17_ptr
  %t42 = call i64 @Table_update_where(i8* %t39, i8* %t40, i8* %t41)
  store i64 %t42, i64* %reg_19_ptr
  %t43 = load i64, i64* %var_checksum_ptr
  store i64 %t43, i64* %reg_20_ptr
  %t44 = load i8*, i8** %var_t2_ptr
  store i8* %t44, i8** %reg_21_ptr
  %t45 = load i8*, i8** %reg_21_ptr
  %t46 = call i8* @obo_entity_get_boxed(i8* %t45, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t46, i8** %reg_22_ptr
  %t47 = load i8*, i8** %reg_22_ptr
  %t48 = call i64 @sum_of(i8* %t47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i64 %t48, i64* %reg_23_ptr
  %t49 = load i64, i64* %reg_20_ptr
  %t50 = load i64, i64* %reg_23_ptr
  %t51 = add i64 %t49, %t50
  store i64 %t51, i64* %reg_24_ptr
  %t52 = load i64, i64* %reg_24_ptr
  store i64 %t52, i64* %var_checksum_ptr
  %t53 = bitcast i64 (i8*, i64)* @__closure_7 to i8*
  %t54 = call i8* @obo_closure_new(i8* %t53, i64 0)
  store i8* %t54, i8** %reg_25_ptr
  %t55 = load i8*, i8** %var_t2_ptr
  store i8* %t55, i8** %reg_26_ptr
  %t56 = load i8*, i8** %reg_26_ptr
  %t57 = load i8*, i8** %reg_25_ptr
  %t58 = call i64 @Table_delete_where(i8* %t56, i8* %t57)
  store i64 %t58, i64* %reg_27_ptr
  %t59 = load i64, i64* %reg_27_ptr
  store i64 %t59, i64* %var_removed_ptr
  %t60 = load i64, i64* %var_checksum_ptr
  store i64 %t60, i64* %reg_28_ptr
  %t61 = load i64, i64* %var_removed_ptr
  store i64 %t61, i64* %reg_29_ptr
  %t62 = load i64, i64* %reg_28_ptr
  %t63 = load i64, i64* %reg_29_ptr
  %t64 = add i64 %t62, %t63
  store i64 %t64, i64* %reg_30_ptr
  %t65 = load i64, i64* %reg_30_ptr
  store i64 %t65, i64* %var_checksum_ptr
  %t66 = load i64, i64* %var_checksum_ptr
  store i64 %t66, i64* %reg_31_ptr
  %t67 = load i8*, i8** %var_t2_ptr
  store i8* %t67, i8** %reg_32_ptr
  %t68 = load i8*, i8** %reg_32_ptr
  %t69 = call i8* @obo_entity_get_boxed(i8* %t68, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.43, i64 0, i64 0))
  store i8* %t69, i8** %reg_33_ptr
  %t70 = load i8*, i8** %reg_33_ptr
  %t71 = call i64 @obo_value_len(i8* %t70)
  store i64 %t71, i64* %reg_34_ptr
  %t72 = load i64, i64* %reg_31_ptr
  %t73 = load i64, i64* %reg_34_ptr
  %t74 = add i64 %t72, %t73
  store i64 %t74, i64* %reg_35_ptr
  %t75 = load i64, i64* %reg_35_ptr
  store i64 %t75, i64* %var_checksum_ptr
  %t76 = load i64, i64* %var_total_checksum_ptr
  store i64 %t76, i64* %reg_36_ptr
  %t77 = load i64, i64* %var_checksum_ptr
  store i64 %t77, i64* %reg_37_ptr
  %t78 = load i64, i64* %reg_36_ptr
  %t79 = load i64, i64* %reg_37_ptr
  %t80 = add i64 %t78, %t79
  store i64 %t80, i64* %reg_38_ptr
  %t81 = load i64, i64* %reg_38_ptr
  store i64 %t81, i64* %var_total_checksum_ptr
  br label %main_b3
main_b3:
  %t82 = load i64, i64* %var_iter_ptr
  store i64 %t82, i64* %reg_39_ptr
  %t83 = load i64, i64* %reg_39_ptr
  %t84 = load i64, i64* %reg_9_ptr
  %t85 = add i64 %t83, %t84
  store i64 %t85, i64* %reg_40_ptr
  %t86 = load i64, i64* %reg_40_ptr
  store i64 %t86, i64* %var_iter_ptr
  br label %main_b1
main_b4:
  %t87 = load i64, i64* %var_total_checksum_ptr
  store i64 %t87, i64* %reg_41_ptr
  %t88 = load i64, i64* %reg_41_ptr
  %t89 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.36, i64 0, i64 0), i64 %t88)
  store i8* %t89, i8** %reg_42_ptr
  %t90 = load i8*, i8** %reg_42_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t90)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @obo.str.37, i64 0, i64 0))
  call void @obo_gc_pop_roots(i64 16)
  call void @obo_arena_free_all()
  ret i32 0
}

define internal i64 @__closure_0(i8* %arg0, i64 %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i64
  %var_va_ptr = alloca i8*
  %var_ascending_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_b_ptr = alloca i64
  %var_a_ptr = alloca i64
  %var_vb_ptr = alloca i8*
  %var_column_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %gc_root_arr = alloca i8**, i64 10
  %gc_root_gep_0 = getelementptr i8**, i8*** %gc_root_arr, i64 0
  store i8** %reg_6_ptr, i8*** %gc_root_gep_0
  %gc_root_gep_1 = getelementptr i8**, i8*** %gc_root_arr, i64 1
  store i8** %reg_8_ptr, i8*** %gc_root_gep_1
  %gc_root_gep_2 = getelementptr i8**, i8*** %gc_root_arr, i64 2
  store i8** %reg_10_ptr, i8*** %gc_root_gep_2
  %gc_root_gep_3 = getelementptr i8**, i8*** %gc_root_arr, i64 3
  store i8** %reg_12_ptr, i8*** %gc_root_gep_3
  %gc_root_gep_4 = getelementptr i8**, i8*** %gc_root_arr, i64 4
  store i8** %reg_14_ptr, i8*** %gc_root_gep_4
  %gc_root_gep_5 = getelementptr i8**, i8*** %gc_root_arr, i64 5
  store i8** %reg_16_ptr, i8*** %gc_root_gep_5
  %gc_root_gep_6 = getelementptr i8**, i8*** %gc_root_arr, i64 6
  store i8** %reg_18_ptr, i8*** %gc_root_gep_6
  %gc_root_gep_7 = getelementptr i8**, i8*** %gc_root_arr, i64 7
  store i8** %var_va_ptr, i8*** %gc_root_gep_7
  %gc_root_gep_8 = getelementptr i8**, i8*** %gc_root_arr, i64 8
  store i8** %var___closure_self_ptr, i8*** %gc_root_gep_8
  %gc_root_gep_9 = getelementptr i8**, i8*** %gc_root_arr, i64 9
  store i8** %var_vb_ptr, i8*** %gc_root_gep_9
  call void @obo_gc_push_roots_bulk(i8*** %gc_root_arr, i64 10)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_a_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_b_ptr
  %t3 = load i8*, i8** %var___closure_self_ptr
  store i8* %t3, i8** %reg_4_ptr
  %t4 = load i8*, i8** %reg_4_ptr
  %t5 = call i64 @obo_closure_get_capture(i8* %t4, i64 0)
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  store i64 %t6, i64* %var_ascending_ptr
  %t7 = load i8*, i8** %var___closure_self_ptr
  store i8* %t7, i8** %reg_6_ptr
  %t8 = load i8*, i8** %reg_6_ptr
  %t9 = call i64 @obo_closure_get_capture(i8* %t8, i64 1)
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i64, i64* %reg_5_ptr
  store i64 %t10, i64* %var_column_ptr
  %t11 = load i8*, i8** %var___closure_self_ptr
  store i8* %t11, i8** %reg_8_ptr
  %t12 = load i8*, i8** %reg_8_ptr
  %t13 = call i64 @obo_closure_get_capture(i8* %t12, i64 2)
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i64, i64* %reg_7_ptr
  store i64 %t14, i64* %var_va_ptr
  %t15 = load i8*, i8** %var___closure_self_ptr
  store i8* %t15, i8** %reg_10_ptr
  %t16 = load i8*, i8** %reg_10_ptr
  %t17 = call i64 @obo_closure_get_capture(i8* %t16, i64 3)
  store i64 %t17, i64* %reg_9_ptr
  %t18 = load i64, i64* %reg_9_ptr
  store i64 %t18, i64* %var_vb_ptr
  %t19 = load i64, i64* %var_a_ptr
  store i64 %t19, i64* %reg_11_ptr
  %t20 = load i64, i64* %reg_11_ptr
  %t21 = inttoptr i64 %t20 to i8*
  %t22 = getelementptr i8, i8* %t21, i64 48
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i64, i64* %var_column_ptr
  store i64 %t23, i64* %reg_13_ptr
  %t24 = load i8*, i8** %reg_12_ptr
  %t25 = load i64, i64* %reg_13_ptr
  %t26 = call i8* @obo_dyn_index(i8* %t24, i64 %t25)
  store i8* %t26, i8** %reg_14_ptr
  %t27 = load i8*, i8** %reg_14_ptr
  store i8* %t27, i8** %var_va_ptr
  %t28 = load i64, i64* %var_b_ptr
  store i64 %t28, i64* %reg_15_ptr
  %t29 = load i64, i64* %reg_15_ptr
  %t30 = inttoptr i64 %t29 to i8*
  %t31 = getelementptr i8, i8* %t30, i64 48
  store i8* %t31, i8** %reg_16_ptr
  %t32 = load i64, i64* %var_column_ptr
  store i64 %t32, i64* %reg_17_ptr
  %t33 = load i8*, i8** %reg_16_ptr
  %t34 = load i64, i64* %reg_17_ptr
  %t35 = call i8* @obo_dyn_index(i8* %t33, i64 %t34)
  store i8* %t35, i8** %reg_18_ptr
  %t36 = load i8*, i8** %reg_18_ptr
  store i8* %t36, i8** %var_vb_ptr
  %t37 = load i64, i64* %var_ascending_ptr
  store i64 %t37, i64* %reg_19_ptr
  %t38 = load i64, i64* %reg_19_ptr
  %t40 = icmp ne i64 %t38, 0
  %t41 = zext i1 %t40 to i64
  %t39 = icmp ne i64 %t41, 0
  br i1 %t39, label %__closure_0_b1, label %__closure_0_b2
__closure_0_b1:
  %t42 = load i8*, i8** %var_va_ptr
  store i8* %t42, i8** %reg_20_ptr
  %t43 = load i8*, i8** %var_vb_ptr
  store i8* %t43, i8** %reg_21_ptr
  %t44 = load i8*, i8** %reg_20_ptr
  %t45 = load i8*, i8** %reg_21_ptr
  %t46 = call i64 @obo_value_compare(i8* %t44, i8* %t45)
  %t47 = icmp slt i64 %t46, 0
  %t48 = zext i1 %t47 to i64
  store i64 %t48, i64* %reg_22_ptr
  %t49 = load i64, i64* %reg_22_ptr
  %t51 = icmp ne i64 %t49, 0
  %t52 = zext i1 %t51 to i64
  %t50 = icmp ne i64 %t52, 0
  br i1 %t50, label %__closure_0_b4, label %__closure_0_b5
__closure_0_b2:
  %t53 = load i8*, i8** %var_vb_ptr
  store i8* %t53, i8** %reg_27_ptr
  %t54 = load i8*, i8** %var_va_ptr
  store i8* %t54, i8** %reg_28_ptr
  %t55 = load i8*, i8** %reg_27_ptr
  %t56 = load i8*, i8** %reg_28_ptr
  %t57 = call i64 @obo_value_compare(i8* %t55, i8* %t56)
  %t58 = icmp slt i64 %t57, 0
  %t59 = zext i1 %t58 to i64
  store i64 %t59, i64* %reg_29_ptr
  %t60 = load i64, i64* %reg_29_ptr
  %t62 = icmp ne i64 %t60, 0
  %t63 = zext i1 %t62 to i64
  %t61 = icmp ne i64 %t63, 0
  br i1 %t61, label %__closure_0_b10, label %__closure_0_b11
__closure_0_b3:
  call void @obo_gc_pop_roots(i64 10)
  ret i64 0
__closure_0_b4:
  %t64 = sub i64 0, 1
  store i64 %t64, i64* %reg_23_ptr
  %t65 = load i64, i64* %reg_23_ptr
  call void @obo_gc_pop_roots(i64 10)
  ret i64 %t65
__closure_0_b5:
  br label %__closure_0_b6
__closure_0_b6:
  %t66 = load i8*, i8** %var_va_ptr
  store i8* %t66, i8** %reg_24_ptr
  %t67 = load i8*, i8** %var_vb_ptr
  store i8* %t67, i8** %reg_25_ptr
  %t68 = load i8*, i8** %reg_24_ptr
  %t69 = load i8*, i8** %reg_25_ptr
  %t70 = call i64 @obo_value_compare(i8* %t68, i8* %t69)
  %t71 = icmp sgt i64 %t70, 0
  %t72 = zext i1 %t71 to i64
  store i64 %t72, i64* %reg_26_ptr
  %t73 = load i64, i64* %reg_26_ptr
  %t75 = icmp ne i64 %t73, 0
  %t76 = zext i1 %t75 to i64
  %t74 = icmp ne i64 %t76, 0
  br i1 %t74, label %__closure_0_b7, label %__closure_0_b8
__closure_0_b7:
  call void @obo_gc_pop_roots(i64 10)
  ret i64 1
__closure_0_b8:
  br label %__closure_0_b9
__closure_0_b9:
  call void @obo_gc_pop_roots(i64 10)
  ret i64 0
__closure_0_b10:
  %t77 = sub i64 0, 1
  store i64 %t77, i64* %reg_30_ptr
  %t78 = load i64, i64* %reg_30_ptr
  call void @obo_gc_pop_roots(i64 10)
  ret i64 %t78
__closure_0_b11:
  br label %__closure_0_b12
__closure_0_b12:
  %t79 = load i8*, i8** %var_vb_ptr
  store i8* %t79, i8** %reg_31_ptr
  %t80 = load i8*, i8** %var_va_ptr
  store i8* %t80, i8** %reg_32_ptr
  %t81 = load i8*, i8** %reg_31_ptr
  %t82 = load i8*, i8** %reg_32_ptr
  %t83 = call i64 @obo_value_compare(i8* %t81, i8* %t82)
  %t84 = icmp sgt i64 %t83, 0
  %t85 = zext i1 %t84 to i64
  store i64 %t85, i64* %reg_33_ptr
  %t86 = load i64, i64* %reg_33_ptr
  %t88 = icmp ne i64 %t86, 0
  %t89 = zext i1 %t88 to i64
  %t87 = icmp ne i64 %t89, 0
  br i1 %t87, label %__closure_0_b13, label %__closure_0_b14
__closure_0_b13:
  call void @obo_gc_pop_roots(i64 10)
  ret i64 1
__closure_0_b14:
  br label %__closure_0_b15
__closure_0_b15:
  call void @obo_gc_pop_roots(i64 10)
  ret i64 0
}

define internal i64 @__closure_1(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = getelementptr i8, i8* %t4, i64 48
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_dyn_index_str(i8* %t6, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = call i64 @obo_value_as_i64(i8* %t8)
  %t10 = icmp slt i64 80000, %t9
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t12
}

define internal i64 @__closure_2(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = getelementptr i8, i8* %t4, i64 48
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_dyn_index_str(i8* %t6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.20, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = call i8* @obo_value_to_str(i8* %t8)
  %t10 = call i32 @strcmp(i8* %t9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.6, i64 0, i64 0))
  %t11 = icmp eq i32 %t10, 0
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t13
}

define internal i64 @__closure_3(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = getelementptr i8, i8* %t4, i64 48
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_dyn_index_str(i8* %t6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = call i8* @obo_value_to_str(i8* %t8)
  %t10 = call i32 @strcmp(i8* %t9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0))
  %t11 = icmp eq i32 %t10, 0
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t13
}

define internal i64 @__closure_4(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_avg_ptr = alloca i64
  %var_r_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i8*, i8** %var___closure_self_ptr
  store i8* %t2, i8** %reg_3_ptr
  %t3 = load i8*, i8** %reg_3_ptr
  %t4 = call i64 @obo_closure_get_capture(i8* %t3, i64 0)
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_avg_ptr
  %t6 = load i64, i64* %var_avg_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %var_r_ptr
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_5_ptr
  %t9 = inttoptr i64 %t8 to i8*
  %t10 = getelementptr i8, i8* %t9, i64 48
  store i8* %t10, i8** %reg_6_ptr
  %t11 = load i8*, i8** %reg_6_ptr
  %t12 = call i8* @obo_dyn_index_str(i8* %t11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t12, i8** %reg_7_ptr
  %t13 = load i64, i64* %reg_4_ptr
  %t14 = load i8*, i8** %reg_7_ptr
  %t15 = call i64 @obo_value_as_i64(i8* %t14)
  %t16 = icmp slt i64 %t13, %t15
  %t17 = zext i1 %t16 to i64
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i64 %t18
}

define internal i64 @__closure_5(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = getelementptr i8, i8* %t4, i64 48
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_dyn_index_str(i8* %t6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.20, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = call i8* @obo_value_to_str(i8* %t8)
  %t10 = call i32 @strcmp(i8* %t9, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.6, i64 0, i64 0))
  %t11 = icmp eq i32 %t10, 0
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t13
}

define internal i64 @__closure_6(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %var_d_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_d_ptr
  %t2 = load i64, i64* %var_d_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_map_get_boxed(i8* %t4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i64, i64* %var_d_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i8*
  %t9 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t9, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  %t11 = call i64 @obo_value_as_i64(i8* %t10)
  %t12 = call i64 @obo_safe_div(i64 %t11, i64 10)
  store i64 %t12, i64* %reg_6_ptr
  %t13 = load i8*, i8** %reg_3_ptr
  %t14 = load i64, i64* %reg_6_ptr
  %t15 = call i64 @obo_value_as_i64(i8* %t13)
  %t16 = add i64 %t15, %t14
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i64, i64* %var_d_ptr
  store i64 %t17, i64* %reg_8_ptr
  %t18 = load i64, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_7_ptr
  %t20 = inttoptr i64 %t18 to i8*
  call void @obo_map_put_i64(i8* %t20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.21, i64 0, i64 0), i64 %t19)
  %t21 = load i64, i64* %var_d_ptr
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t22
}

define internal i64 @__closure_7(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = getelementptr i8, i8* %t4, i64 48
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_dyn_index_str(i8* %t6, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.22, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = call i64 @obo_value_as_i64(i8* %t8)
  %t10 = icmp slt i64 %t9, 25
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 1)
  ret i64 %t12
}

