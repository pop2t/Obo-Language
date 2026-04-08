; OBO native codegen (Phase 7)
declare i32 @printf(i8*, ...)
declare i32 @strcmp(i8*, i8*)
declare i8* @obo_str_concat(i8*, i8*)
declare i8* @obo_str_concat_int(i8*, i64)
declare i8* @obo_i64_to_str(i64)
declare i8* @obo_list_new_i64(i64, i64*)
declare i64 @obo_list_len(i8*)
declare i64 @obo_list_get(i8*, i64)
declare void @obo_list_set_i64(i8*, i64, i64)
declare void @obo_list_print(i8*)
declare i8* @obo_map_new()
declare i64 @obo_map_len(i8*)
declare void @obo_map_put_i64(i8*, i8*, i64)
declare void @obo_map_put_str(i8*, i8*, i8*)
declare void @obo_map_put_f64(i8*, i8*, double)
declare void @obo_map_put_bool(i8*, i8*, i64)
declare void @obo_map_put_null(i8*, i8*)
declare void @obo_map_put_list(i8*, i8*, i8*)
declare void @obo_map_put_map(i8*, i8*, i8*)
declare void @obo_map_put_entity(i8*, i8*, i8*)
declare void @obo_map_put_boxed(i8*, i8*, i8*)
declare i8* @obo_map_get_boxed(i8*, i8*)
declare void @obo_map_print(i8*)
declare i8* @obo_entity_new(i8*)
declare void @obo_entity_put_i64(i8*, i8*, i64)
declare void @obo_entity_put_str(i8*, i8*, i8*)
declare void @obo_entity_put_f64(i8*, i8*, double)
declare void @obo_entity_put_bool(i8*, i8*, i64)
declare void @obo_entity_put_null(i8*, i8*)
declare void @obo_entity_put_list(i8*, i8*, i8*)
declare void @obo_entity_put_map(i8*, i8*, i8*)
declare void @obo_entity_put_entity(i8*, i8*, i8*)
declare void @obo_entity_put_boxed(i8*, i8*, i8*)
declare i8* @obo_entity_get_boxed(i8*, i8*)
declare void @obo_entity_print(i8*)
declare i8* @obo_entity_new_slotted(i8*, i32)
declare void @obo_entity_set_field_name(i8*, i32, i8*)
declare i8* @obo_entity_get_slot(i8*, i32)
declare void @obo_entity_set_slot_i64(i8*, i32, i64)
declare void @obo_entity_set_slot_f64(i8*, i32, double)
declare void @obo_entity_set_slot_str(i8*, i32, i8*)
declare void @obo_entity_set_slot_bool(i8*, i32, i64)
declare void @obo_entity_set_slot_null(i8*, i32)
declare void @obo_entity_set_slot_list(i8*, i32, i8*)
declare void @obo_entity_set_slot_map(i8*, i32, i8*)
declare void @obo_entity_set_slot_entity(i8*, i32, i8*)
declare void @obo_entity_set_slot_boxed(i8*, i32, i8*)
declare i8* @obo_entity_gfs(i8*, i32, i8*)
declare void @obo_entity_sfs_i64(i8*, i32, i8*, i64)
declare void @obo_entity_sfs_f64(i8*, i32, i8*, double)
declare void @obo_entity_sfs_str(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_bool(i8*, i32, i8*, i64)
declare void @obo_entity_sfs_null(i8*, i32, i8*)
declare void @obo_entity_sfs_list(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_map(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_entity(i8*, i32, i8*, i8*)
declare void @obo_entity_sfs_boxed(i8*, i32, i8*, i8*)
declare void @obo_value_print(i8*)
declare i8* @obo_set_new(i8*)
declare i8* @obo_set_add(i8*, i64)
declare i8* @obo_set_remove(i8*, i64)
declare i64 @obo_set_has(i8*, i64)
declare i8* @obo_set_union(i8*, i8*)
declare i8* @obo_set_intersect(i8*, i8*)
declare i8* @obo_set_difference(i8*, i8*)
declare i8* @obo_queue_push(i8*, i64)
declare i64 @obo_queue_peek(i8*)
declare i8* @obo_queue_pop(i8*)
declare i8* @obo_stack_push(i8*, i64)
declare i64 @obo_stack_peek(i8*)
declare i8* @obo_stack_pop(i8*)
declare i8* @obo_buffer_new(i64)
declare i64 @obo_buffer_length(i8*)
declare i64 @obo_buffer_get(i8*, i64)
declare i8* @obo_buffer_set(i8*, i64, i64)
declare i8* @obo_buffer_toList(i8*)
declare i8* @obo_textbuilder_new(i64)
declare i8* @obo_textbuilder_append(i8*, i8*)
declare i8* @obo_textbuilder_appendChar(i8*, i64)
declare i8* @obo_textbuilder_appendInt(i8*, i64)
declare i8* @obo_textbuilder_build(i8*)
declare i64 @obo_textbuilder_length(i8*)
declare i8* @obo_textbuilder_clear(i8*)
declare i8* @obo_textbuilder_toString(i8*)
declare i8* @obo_arena_create(i64)
declare i64 @obo_arena_alloc(i8*, i64)
declare i64 @obo_arena_reset(i8*)
declare i64 @obo_arena_destroy(i8*)
declare i64 @obo_arena_used(i8*)
declare i64 @obo_arena_capacity(i8*)
declare i64 @obo_arena_write_i64(i64, i64)
declare i64 @obo_arena_write_f64(i64, double)
declare i64 @obo_arena_read_i64(i64)
declare double @obo_arena_read_f64(i64)
declare i8* @obo_bag_add(i8*, i64)
declare i64 @obo_bag_has(i8*, i64)
declare i8* @obo_bag_remove(i8*, i64)
declare i8* @obo_grid2d_new(i64, i64, i64)
declare i64 @obo_grid2d_rows(i8*)
declare i64 @obo_grid2d_cols(i8*)
declare i64 @obo_grid2d_count(i8*)
declare i64 @obo_grid2d_get(i8*, i64, i64)
declare i8* @obo_grid2d_set(i8*, i64, i64, i64)
declare i8* @obo_grid2d_fill(i8*, i64)
declare i8* @obo_grid2d_row(i8*, i64)
declare i8* @obo_grid2d_col(i8*, i64)
declare i8* @obo_grid2d_toList(i8*)
declare i8* @obo_grid3d_new(i64, i64, i64, i64)
declare i64 @obo_grid3d_x(i8*)
declare i64 @obo_grid3d_y(i8*)
declare i64 @obo_grid3d_z(i8*)
declare i64 @obo_grid3d_count(i8*)
declare i64 @obo_grid3d_get(i8*, i64, i64, i64)
declare i8* @obo_grid3d_set(i8*, i64, i64, i64, i64)
declare i8* @obo_grid3d_fill(i8*, i64)
declare i8* @obo_grid3d_toList(i8*)
declare i8* @obo_assert_fail(i8*)
declare i8* @obo_reflect(i8*)
declare i64 @obo_value_as_i64(i8*)
declare i64 @obo_value_truthy(i8*)
declare i64 @obo_value_len(i8*)
declare i64 @obo_value_empty(i8*)
declare i8* @obo_value_keys(i8*)
declare i8* @obo_value_as_list_ptr(i8*)
declare i8* @obo_value_as_mixed_list_ptr(i8*)
declare i8* @obo_value_as_map_ptr(i8*)
declare i8* @obo_value_as_entity_ptr(i8*)
declare i64 @__sys_Math_abs(i64)
declare i64 @__sys_Math_floor(double)
declare i64 @__sys_Math_ceil(double)
declare i64 @__sys_Math_round(double)
declare i64 @__sys_Math_min(i64, i64)
declare i64 @__sys_Math_max(i64, i64)
declare i64 @__sys_Math_sign(i64)
declare i64 @__sys_Math_maxNumber()
declare i64 @__sys_Math_minNumber()
declare i64 @__sys_Time_now()
declare i64 @__sys_Time_nowSeconds()
declare i64 @__sys_Time_sleep(i64)
declare i8* @__sys_File_read(i8*)
declare i64 @__sys_File_exists(i8*)
declare i64 @__sys_Convert_toNumber(i8*)
declare i8* @__sys_Convert_toText(i64)
declare i64 @obo_native_call_method_i64(i8*, i8*, i64, i64*)
declare i64 @obo_str_truthy(i8*)
declare void @obo_print_bool(i64)
declare void @obo_print_double(double)
declare i8* @obo_prompt(i8*)
declare i8* @obo_f64_to_str(double)
declare i64 @obo_call_indirect_i64(i8*, i64, i64*)
declare double @__sys_Math_pi()
declare double @__sys_Math_e()
declare double @__sys_Math_infinity()
declare double @__sys_Math_sqrt(double)
declare double @__sys_Math_pow(double, double)
declare double @__sys_Math_sin(double)
declare double @__sys_Math_cos(double)
declare double @__sys_Math_tan(double)
declare double @__sys_Math_asin(double)
declare double @__sys_Math_acos(double)
declare double @__sys_Math_atan(double)
declare double @__sys_Math_atan2(double, double)
declare double @__sys_Math_log(double)
declare double @__sys_Math_log10(double)
declare double @__sys_Math_lerp(double, double, double)
declare double @__sys_Math_clamp(double, double, double)
declare double @__sys_Math_random()
declare i64 @__sys_Math_randomInt(i64, i64)
declare i64 @__sys_File_write(i8*, i8*)
declare i64 @__sys_File_append(i8*, i8*)
declare i64 @__sys_File_delete(i8*)
declare i8* @__sys_File_readLines(i8*)
declare double @__sys_Convert_toDecimal(i8*)
declare i64 @__sys_Convert_toFlag(i64)
declare i64 @__sys_Convert_toChar(i64)
declare double @__sys_Time_measure()
declare i64 @__sys_Time_startTimer()
declare i64 @__sys_Time_stopTimer()
declare i64 @__sys_pointer_alloc(i64)
declare i64 @__sys_pointer_free(i64)
declare i64 @__text_length(i8*)
declare i64 @__text_empty(i8*)
declare i8* @__text_upper(i8*)
declare i8* @__text_lower(i8*)
declare i8* @__text_trim(i8*)
declare i8* @__text_trimStart(i8*)
declare i8* @__text_trimEnd(i8*)
declare i8* @__text_reversed(i8*)
declare i64 @__text_contains(i8*, i8*)
declare i64 @__text_startsWith(i8*, i8*)
declare i64 @__text_endsWith(i8*, i8*)
declare i64 @__text_indexOf(i8*, i8*)
declare i8* @__text_replace(i8*, i8*, i8*)
declare i8* @__text_substring(i8*, i64, i64)
declare i8* @__text_repeat(i8*, i64)
declare i8* @__text_padLeft(i8*, i64, i8*)
declare i8* @__text_padRight(i8*, i64, i8*)
declare i64 @__text_toNumber(i8*)
declare double @__text_toDecimal(i8*)
declare i8* @__text_split(i8*, i8*)
declare i8* @obo_list_add(i8*, i64)
declare i64 @obo_list_first(i8*)
declare i64 @obo_list_last(i8*)
declare i64 @obo_list_empty(i8*)
declare i64 @obo_list_contains(i8*, i64)
declare i64 @obo_list_indexOf(i8*, i64)
declare i8* @obo_list_sort(i8*)
declare i8* @obo_list_reverse(i8*)
declare i8* @obo_list_take(i8*, i64)
declare i8* @obo_list_skip(i8*, i64)
declare i8* @obo_list_slice(i8*, i64, i64)
declare i8* @obo_list_remove(i8*, i64)
declare i8* @obo_list_removeAt(i8*, i64)
declare i8* @obo_list_insert(i8*, i64, i64)
declare i8* @obo_list_join(i8*, i8*)
declare i8* @obo_list_distinct(i8*)
declare i64 @obo_map_empty(i8*)
declare i64 @obo_map_has(i8*, i8*)
declare i8* @obo_map_set(i8*, i8*, i64)
declare i8* @obo_map_remove(i8*, i8*)
declare i8* @obo_map_set_int(i8*, i64, i64)
declare i8* @obo_map_set_int_str(i8*, i64, i8*)
declare i8* @obo_map_set_int_boxed(i8*, i64, i8*)
declare i64 @obo_map_get_int(i8*, i64)
declare i8* @obo_map_get_int_boxed(i8*, i64)
declare i64 @obo_map_has_int(i8*, i64)
declare i8* @obo_map_remove_int(i8*, i64)
declare i64 @obo_type_check(i8*, i8*)
declare void @obo_arena_register(i8*)
declare void @obo_arena_free_all()
declare void @obo_gc_push_root(i8**)
declare void @obo_gc_pop_roots(i64)
declare void @obo_gc_collect()
declare void @obo_gc_pause()
declare void @obo_gc_resume()
declare i8* @obo_closure_new(i8*, i64)
declare void @obo_closure_set_capture(i8*, i64, i64)
declare i64 @obo_closure_get_capture(i8*, i64)
declare i64 @obo_closure_call_0(i8*)
declare i64 @obo_closure_call_1(i8*, i64)
declare i64 @obo_closure_call_2(i8*, i64, i64)
declare i64 @obo_closure_call_3(i8*, i64, i64, i64)
declare i8* @obo_event_listen(i8*, i8*, i8*)
declare i8* @obo_event_emit(i8*, i8*, i8*)
declare i8* @obo_task_spawn(i8*)
declare void @obo_task_wait(i8*)
declare void @obo_task_wait_all()
declare i8* @obo_channel_create()
declare void @obo_channel_send(i8*, i64)
declare i64 @obo_channel_receive(i8*)
declare i8* @obo_atomic_create(i64)
declare i64 @obo_atomic_load(i8*)
declare void @obo_atomic_store(i8*, i64)
declare i64 @obo_atomic_add(i8*, i64)
declare i64 @obo_atomic_sub(i8*, i64)
declare i8* @obo_possible_push()
declare i64 @obo_possible_pop()
declare void @obo_throw(i8*)
declare i8* @obo_possible_get_error()
declare i64 @obo_safe_div(i64, i64)
declare i64 @obo_safe_mod(i64, i64)
declare i8* @obo_range(i64, i64, i64)
declare i32 @_setjmp(i8*) #0
declare i8* @malloc(i64)
declare i8* @obo_list_filter(i8*, i8*)
declare i8* @obo_list_map(i8*, i8*)
declare i64 @obo_list_reduce(i8*, i64, i8*)
declare i64 @obo_list_any(i8*, i8*)
declare i64 @obo_list_all(i8*, i8*)
declare i8* @obo_mixed_list_new(i64)
declare void @obo_mixed_list_set(i8*, i64, i8*)
declare i8* @obo_mixed_list_get(i8*, i64)
declare i64 @obo_mixed_list_len(i8*)
declare void @obo_mixed_list_print(i8*)
declare i8* @obo_mixed_list_filter(i8*, i8*)
declare i8* @obo_mixed_list_map(i8*, i8*)
declare void @obo_mixed_list_each(i8*, i8*)
declare i8* @obo_mixed_list_add(i8*, i8*)
declare i8* @obo_mixed_list_removeAt(i8*, i64)
declare i8* @obo_mixed_list_join(i8*, i8*)
declare i64 @obo_mixed_list_contains(i8*, i8*)
declare i8* @obo_mixed_list_reduce(i8*, i8*, i8*)
declare i64 @obo_mixed_list_any(i8*, i8*)
declare i64 @obo_mixed_list_all(i8*, i8*)
declare i8* @obo_box_i64(i64)
declare i8* @obo_box_f64(double)
declare i8* @obo_box_str(i8*)
declare i8* @obo_box_bool(i64)
declare i8* @obo_box_null()
declare i8* @obo_box_list(i8*)
declare i8* @obo_box_map(i8*)
declare i8* @obo_box_entity(i8*)
declare double @obo_value_as_f64(i8*)
declare i8* @obo_value_as_str(i8*)
declare i64 @obo_value_compare(i8*, i8*)
declare i8* @obo_dyn_arith(i8*, i8*, i32)
declare i64 @obo_value_to_closure_arg_boxed(i8*)
declare i8* @obo_value_to_str(i8*)
declare i8* @obo_format_list_string(i8*)
declare i8* @obo_format_map_string(i8*)
declare i8* @obo_format_entity_string(i8*)

declare i8* @cogal_mtl_create_device()
declare i64 @cogal_mtl_release_device(i8*)
declare i8* @cogal_mtl_create_command_queue(i8*)
declare i64 @cogal_mtl_release_command_queue(i8*)
declare i8* @cogal_mtl_create_buffer(i8*, i64, i32)
declare i8* @cogal_mtl_buffer_contents(i8*)
declare i64 @cogal_mtl_buffer_length(i8*)
declare i64 @cogal_mtl_release_buffer(i8*)
declare i8* @cogal_mtl_create_library_from_source(i8*, i8*)
declare i8* @cogal_mtl_create_function(i8*, i8*)
declare i8* @cogal_mtl_create_compute_pipeline(i8*, i8*)
declare i64 @cogal_mtl_release_pipeline(i8*)
declare i8* @cogal_mtl_create_command_buffer(i8*)
declare i8* @cogal_mtl_create_compute_encoder(i8*)
declare i64 @cogal_mtl_encoder_set_pipeline(i8*, i8*)
declare i64 @cogal_mtl_encoder_set_buffer(i8*, i8*, i64, i32)
declare i64 @cogal_mtl_encoder_dispatch(i8*, i64, i64, i64)
declare i64 @cogal_mtl_encoder_end(i8*)
declare i64 @cogal_mtl_commit_and_wait(i8*)

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }

@obo.str.0 = private unnamed_addr constant [18 x i8] c"add_arrays_shader\00"
@obo.str.1 = private unnamed_addr constant [11 x i8] c"add_arrays\00"
@obo.str.2 = private unnamed_addr constant [21 x i8] c"GPU compute complete\00"
@obo.str.3 = private unnamed_addr constant [5 x i8] c"done\00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
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
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i8*
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca i64
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i64
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i64
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i8*
  %reg_50_ptr = alloca i64
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i64
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i64
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var_queue_ptr = alloca i8*
  %var_lib_ptr = alloca i8*
  %var_cmdbuf_ptr = alloca i8*
  %var_buf_a_ptr = alloca i8*
  %var_encoder_ptr = alloca i8*
  %var_buf_b_ptr = alloca i8*
  %var_buf_c_ptr = alloca i8*
  %var_func_ptr = alloca i8*
  %var_pipeline_ptr = alloca i8*
  %var_dev_ptr = alloca i8*
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_35_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_41_ptr)
  call void @obo_gc_push_root(i8** %reg_43_ptr)
  call void @obo_gc_push_root(i8** %reg_45_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %reg_49_ptr)
  call void @obo_gc_push_root(i8** %reg_51_ptr)
  call void @obo_gc_push_root(i8** %reg_53_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %var_queue_ptr)
  call void @obo_gc_push_root(i8** %var_lib_ptr)
  call void @obo_gc_push_root(i8** %var_cmdbuf_ptr)
  call void @obo_gc_push_root(i8** %var_buf_a_ptr)
  call void @obo_gc_push_root(i8** %var_encoder_ptr)
  call void @obo_gc_push_root(i8** %var_buf_b_ptr)
  call void @obo_gc_push_root(i8** %var_buf_c_ptr)
  call void @obo_gc_push_root(i8** %var_func_ptr)
  call void @obo_gc_push_root(i8** %var_pipeline_ptr)
  call void @obo_gc_push_root(i8** %var_dev_ptr)
  store i64 1024, i64* %var_n_ptr
  %t0 = call i8* @cogal_mtl_create_device()
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_dev_ptr
  %t2 = load i8*, i8** %var_dev_ptr
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  %t4 = call i8* @cogal_mtl_create_command_queue(i8* %t3)
  store i8* %t4, i8** %reg_2_ptr
  %t5 = load i8*, i8** %reg_2_ptr
  store i8* %t5, i8** %var_queue_ptr
  %t6 = load i8*, i8** %var_dev_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i64, i64* %var_n_ptr
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = mul i64 %t8, 4
  store i64 %t9, i64* %reg_5_ptr
  %t10 = load i8*, i8** %reg_3_ptr
  %t11 = load i64, i64* %reg_5_ptr
  %t12 = call i8* @cogal_mtl_create_buffer(i8* %t10, i64 %t11, i64 0)
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  store i8* %t13, i8** %var_buf_a_ptr
  %t14 = load i8*, i8** %var_dev_ptr
  store i8* %t14, i8** %reg_7_ptr
  %t15 = load i64, i64* %var_n_ptr
  store i64 %t15, i64* %reg_8_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = mul i64 %t16, 4
  store i64 %t17, i64* %reg_9_ptr
  %t18 = load i8*, i8** %reg_7_ptr
  %t19 = load i64, i64* %reg_9_ptr
  %t20 = call i8* @cogal_mtl_create_buffer(i8* %t18, i64 %t19, i64 0)
  store i8* %t20, i8** %reg_10_ptr
  %t21 = load i8*, i8** %reg_10_ptr
  store i8* %t21, i8** %var_buf_b_ptr
  %t22 = load i8*, i8** %var_dev_ptr
  store i8* %t22, i8** %reg_11_ptr
  %t23 = load i64, i64* %var_n_ptr
  store i64 %t23, i64* %reg_12_ptr
  %t24 = load i64, i64* %reg_12_ptr
  %t25 = mul i64 %t24, 4
  store i64 %t25, i64* %reg_13_ptr
  %t26 = load i8*, i8** %reg_11_ptr
  %t27 = load i64, i64* %reg_13_ptr
  %t28 = call i8* @cogal_mtl_create_buffer(i8* %t26, i64 %t27, i64 0)
  store i8* %t28, i8** %reg_14_ptr
  %t29 = load i8*, i8** %reg_14_ptr
  store i8* %t29, i8** %var_buf_c_ptr
  %t30 = load i8*, i8** %var_dev_ptr
  store i8* %t30, i8** %reg_15_ptr
  %t31 = load i8*, i8** %reg_15_ptr
  %t32 = call i8* @obo_box_str(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @obo.str.0, i64 0, i64 0))
  %t33 = call i8* @cogal_mtl_create_library_from_source(i8* %t31, i8* %t32)
  store i8* %t33, i8** %reg_16_ptr
  %t34 = load i8*, i8** %reg_16_ptr
  store i8* %t34, i8** %var_lib_ptr
  %t35 = load i8*, i8** %var_lib_ptr
  store i8* %t35, i8** %reg_17_ptr
  %t36 = load i8*, i8** %reg_17_ptr
  %t37 = call i8* @obo_box_str(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.1, i64 0, i64 0))
  %t38 = call i8* @cogal_mtl_create_function(i8* %t36, i8* %t37)
  store i8* %t38, i8** %reg_18_ptr
  %t39 = load i8*, i8** %reg_18_ptr
  store i8* %t39, i8** %var_func_ptr
  %t40 = load i8*, i8** %var_dev_ptr
  store i8* %t40, i8** %reg_19_ptr
  %t41 = load i8*, i8** %var_func_ptr
  store i8* %t41, i8** %reg_20_ptr
  %t42 = load i8*, i8** %reg_19_ptr
  %t43 = load i8*, i8** %reg_20_ptr
  %t44 = call i8* @cogal_mtl_create_compute_pipeline(i8* %t42, i8* %t43)
  store i8* %t44, i8** %reg_21_ptr
  %t45 = load i8*, i8** %reg_21_ptr
  store i8* %t45, i8** %var_pipeline_ptr
  %t46 = load i8*, i8** %var_queue_ptr
  store i8* %t46, i8** %reg_22_ptr
  %t47 = load i8*, i8** %reg_22_ptr
  %t48 = call i8* @cogal_mtl_create_command_buffer(i8* %t47)
  store i8* %t48, i8** %reg_23_ptr
  %t49 = load i8*, i8** %reg_23_ptr
  store i8* %t49, i8** %var_cmdbuf_ptr
  %t50 = load i8*, i8** %var_cmdbuf_ptr
  store i8* %t50, i8** %reg_24_ptr
  %t51 = load i8*, i8** %reg_24_ptr
  %t52 = call i8* @cogal_mtl_create_compute_encoder(i8* %t51)
  store i8* %t52, i8** %reg_25_ptr
  %t53 = load i8*, i8** %reg_25_ptr
  store i8* %t53, i8** %var_encoder_ptr
  %t54 = load i8*, i8** %var_encoder_ptr
  store i8* %t54, i8** %reg_26_ptr
  %t55 = load i8*, i8** %var_pipeline_ptr
  store i8* %t55, i8** %reg_27_ptr
  %t56 = load i8*, i8** %reg_26_ptr
  %t57 = load i8*, i8** %reg_27_ptr
  %t58 = call i64 @cogal_mtl_encoder_set_pipeline(i8* %t56, i8* %t57)
  store i64 %t58, i64* %reg_28_ptr
  %t59 = load i8*, i8** %var_encoder_ptr
  store i8* %t59, i8** %reg_29_ptr
  %t60 = load i8*, i8** %var_buf_a_ptr
  store i8* %t60, i8** %reg_30_ptr
  %t61 = load i8*, i8** %reg_29_ptr
  %t62 = load i8*, i8** %reg_30_ptr
  %t63 = call i64 @cogal_mtl_encoder_set_buffer(i8* %t61, i8* %t62, i64 0, i64 0)
  store i64 %t63, i64* %reg_31_ptr
  %t64 = load i8*, i8** %var_encoder_ptr
  store i8* %t64, i8** %reg_32_ptr
  %t65 = load i8*, i8** %var_buf_b_ptr
  store i8* %t65, i8** %reg_33_ptr
  %t66 = load i8*, i8** %reg_32_ptr
  %t67 = load i8*, i8** %reg_33_ptr
  %t68 = call i64 @cogal_mtl_encoder_set_buffer(i8* %t66, i8* %t67, i64 0, i64 1)
  store i64 %t68, i64* %reg_34_ptr
  %t69 = load i8*, i8** %var_encoder_ptr
  store i8* %t69, i8** %reg_35_ptr
  %t70 = load i8*, i8** %var_buf_c_ptr
  store i8* %t70, i8** %reg_36_ptr
  %t71 = load i8*, i8** %reg_35_ptr
  %t72 = load i8*, i8** %reg_36_ptr
  %t73 = call i64 @cogal_mtl_encoder_set_buffer(i8* %t71, i8* %t72, i64 0, i64 2)
  store i64 %t73, i64* %reg_37_ptr
  %t74 = load i8*, i8** %var_encoder_ptr
  store i8* %t74, i8** %reg_38_ptr
  %t75 = load i64, i64* %var_n_ptr
  store i64 %t75, i64* %reg_39_ptr
  %t76 = load i8*, i8** %reg_38_ptr
  %t77 = load i64, i64* %reg_39_ptr
  %t78 = call i64 @cogal_mtl_encoder_dispatch(i8* %t76, i64 %t77, i64 1, i64 1)
  store i64 %t78, i64* %reg_40_ptr
  %t79 = load i8*, i8** %var_encoder_ptr
  store i8* %t79, i8** %reg_41_ptr
  %t80 = load i8*, i8** %reg_41_ptr
  %t81 = call i64 @cogal_mtl_encoder_end(i8* %t80)
  store i64 %t81, i64* %reg_42_ptr
  %t82 = load i8*, i8** %var_cmdbuf_ptr
  store i8* %t82, i8** %reg_43_ptr
  %t83 = load i8*, i8** %reg_43_ptr
  %t84 = call i64 @cogal_mtl_commit_and_wait(i8* %t83)
  store i64 %t84, i64* %reg_44_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.2, i64 0, i64 0))
  %t85 = load i8*, i8** %var_pipeline_ptr
  store i8* %t85, i8** %reg_45_ptr
  %t86 = load i8*, i8** %reg_45_ptr
  %t87 = call i64 @cogal_mtl_release_pipeline(i8* %t86)
  store i64 %t87, i64* %reg_46_ptr
  %t88 = load i8*, i8** %var_queue_ptr
  store i8* %t88, i8** %reg_47_ptr
  %t89 = load i8*, i8** %reg_47_ptr
  %t90 = call i64 @cogal_mtl_release_command_queue(i8* %t89)
  store i64 %t90, i64* %reg_48_ptr
  %t91 = load i8*, i8** %var_dev_ptr
  store i8* %t91, i8** %reg_49_ptr
  %t92 = load i8*, i8** %reg_49_ptr
  %t93 = call i64 @cogal_mtl_release_device(i8* %t92)
  store i64 %t93, i64* %reg_50_ptr
  %t94 = load i8*, i8** %var_buf_c_ptr
  store i8* %t94, i8** %reg_51_ptr
  %t95 = load i8*, i8** %reg_51_ptr
  %t96 = call i64 @obo_value_as_i64(i8* %t95)
  %t97 = call i64 @__sys_pointer_free(i64 %t96)
  store i64 %t97, i64* %reg_52_ptr
  %t98 = load i8*, i8** %var_buf_b_ptr
  store i8* %t98, i8** %reg_53_ptr
  %t99 = load i8*, i8** %reg_53_ptr
  %t100 = call i64 @obo_value_as_i64(i8* %t99)
  %t101 = call i64 @__sys_pointer_free(i64 %t100)
  store i64 %t101, i64* %reg_54_ptr
  %t102 = load i8*, i8** %var_buf_a_ptr
  store i8* %t102, i8** %reg_55_ptr
  %t103 = load i8*, i8** %reg_55_ptr
  %t104 = call i64 @obo_value_as_i64(i8* %t103)
  %t105 = call i64 @__sys_pointer_free(i64 %t104)
  store i64 %t105, i64* %reg_56_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_gc_pop_roots(i64 47)
  call void @obo_arena_free_all()
  ret i32 0
}

