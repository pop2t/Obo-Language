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

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }

@obo.str.0 = private unnamed_addr constant [13 x i8] c"before add: \00"
@obo.str.1 = private unnamed_addr constant [12 x i8] c"after add: \00"
@obo.str.2 = private unnamed_addr constant [17 x i8] c"after add(5,6): \00"
@obo.str.3 = private unnamed_addr constant [20 x i8] c"after removeAt(0): \00"
@obo.str.4 = private unnamed_addr constant [22 x i8] c"after insert(0, 99): \00"
@obo.str.5 = private unnamed_addr constant [18 x i8] c"after remove(3): \00"
@obo.str.6 = private unnamed_addr constant [6 x i8] c"Alice\00"
@obo.str.7 = private unnamed_addr constant [4 x i8] c"Bob\00"
@obo.str.8 = private unnamed_addr constant [13 x i8] c"before set: \00"
@obo.str.9 = private unnamed_addr constant [8 x i8] c"Charlie\00"
@obo.str.10 = private unnamed_addr constant [12 x i8] c"after set: \00"
@obo.str.11 = private unnamed_addr constant [15 x i8] c"after remove: \00"
@obo.str.12 = private unnamed_addr constant [15 x i8] c"queue before: \00"
@obo.str.13 = private unnamed_addr constant [19 x i8] c"queue after push: \00"
@obo.str.14 = private unnamed_addr constant [15 x i8] c"stack before: \00"
@obo.str.15 = private unnamed_addr constant [19 x i8] c"stack after push: \00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i8*
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i8*
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i8*
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i8*
  %var_q_ptr = alloca i8*
  %var_st_ptr = alloca i8*
  %var_items_ptr = alloca i64
  %var_scores_ptr = alloca i64
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_34_ptr)
  call void @obo_gc_push_root(i8** %reg_35_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_37_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_39_ptr)
  call void @obo_gc_push_root(i8** %reg_40_ptr)
  call void @obo_gc_push_root(i8** %reg_41_ptr)
  call void @obo_gc_push_root(i8** %reg_42_ptr)
  call void @obo_gc_push_root(i8** %reg_43_ptr)
  call void @obo_gc_push_root(i8** %reg_44_ptr)
  call void @obo_gc_push_root(i8** %reg_45_ptr)
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %var_q_ptr)
  call void @obo_gc_push_root(i8** %var_st_ptr)
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
  store i8* %t6, i8** %var_items_ptr
  %t7 = load i64, i64* %var_items_ptr
  store i64 %t7, i64* %reg_1_ptr
  %t8 = load i8*, i8** %reg_1_ptr
  %t9 = call i8* @obo_format_list_string(i8* %t8)
  %t10 = call i8* @obo_str_concat(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @obo.str.0, i64 0, i64 0), i8* %t9)
  store i8* %t10, i8** %reg_2_ptr
  %t11 = load i8*, i8** %reg_2_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t11)
  %t12 = load i64, i64* %var_items_ptr
  store i64 %t12, i64* %reg_3_ptr
  %t13 = load i8*, i8** %reg_3_ptr
  %t14 = call i64 @obo_list_add(i8* %t13, i64 4)
  store i64 %t14, i64* %reg_4_ptr
  %t15 = load i64, i64* %reg_4_ptr
  store i64 %t15, i64* %var_items_ptr
  %t16 = load i64, i64* %var_items_ptr
  store i64 %t16, i64* %reg_5_ptr
  %t17 = load i64, i64* %reg_5_ptr
  %t18 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.1, i64 0, i64 0), i64 %t17)
  store i8* %t18, i8** %reg_6_ptr
  %t19 = load i8*, i8** %reg_6_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t19)
  %t20 = load i64, i64* %var_items_ptr
  store i64 %t20, i64* %reg_7_ptr
  %t21 = load i64, i64* %reg_7_ptr
  %t22 = call i64 @obo_list_add(i64 %t21, i64 5, i64 6)
  store i64 %t22, i64* %reg_8_ptr
  %t23 = load i64, i64* %reg_8_ptr
  store i64 %t23, i64* %var_items_ptr
  %t24 = load i64, i64* %var_items_ptr
  store i64 %t24, i64* %reg_9_ptr
  %t25 = load i64, i64* %reg_9_ptr
  %t26 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.2, i64 0, i64 0), i64 %t25)
  store i8* %t26, i8** %reg_10_ptr
  %t27 = load i8*, i8** %reg_10_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t27)
  %t28 = load i64, i64* %var_items_ptr
  store i64 %t28, i64* %reg_11_ptr
  %t29 = load i64, i64* %reg_11_ptr
  %t30 = call i64 @obo_list_removeAt(i64 %t29, i64 0)
  store i64 %t30, i64* %reg_12_ptr
  %t31 = load i64, i64* %reg_12_ptr
  store i64 %t31, i64* %var_items_ptr
  %t32 = load i64, i64* %var_items_ptr
  store i64 %t32, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_13_ptr
  %t34 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @obo.str.3, i64 0, i64 0), i64 %t33)
  store i8* %t34, i8** %reg_14_ptr
  %t35 = load i8*, i8** %reg_14_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t35)
  %t36 = load i64, i64* %var_items_ptr
  store i64 %t36, i64* %reg_15_ptr
  %t37 = load i64, i64* %reg_15_ptr
  %t38 = call i64 @obo_list_insert(i64 %t37, i64 0, i64 99)
  store i64 %t38, i64* %reg_16_ptr
  %t39 = load i64, i64* %reg_16_ptr
  store i64 %t39, i64* %var_items_ptr
  %t40 = load i64, i64* %var_items_ptr
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i64, i64* %reg_17_ptr
  %t42 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @obo.str.4, i64 0, i64 0), i64 %t41)
  store i8* %t42, i8** %reg_18_ptr
  %t43 = load i8*, i8** %reg_18_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t43)
  %t44 = load i64, i64* %var_items_ptr
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %reg_19_ptr
  %t46 = call i64 @obo_list_remove(i64 %t45, i64 3)
  store i64 %t46, i64* %reg_20_ptr
  %t47 = load i64, i64* %reg_20_ptr
  store i64 %t47, i64* %var_items_ptr
  %t48 = load i64, i64* %var_items_ptr
  store i64 %t48, i64* %reg_21_ptr
  %t49 = load i64, i64* %reg_21_ptr
  %t50 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @obo.str.5, i64 0, i64 0), i64 %t49)
  store i8* %t50, i8** %reg_22_ptr
  %t51 = load i8*, i8** %reg_22_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t51)
  %t52 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t52, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0), i64 95)
  call void @obo_map_put_i64(i8* %t52, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.7, i64 0, i64 0), i64 87)
  store i8* %t52, i8** %reg_23_ptr
  %t53 = load i8*, i8** %reg_23_ptr
  store i8* %t53, i8** %var_scores_ptr
  %t54 = load i64, i64* %var_scores_ptr
  store i64 %t54, i64* %reg_24_ptr
  %t55 = load i8*, i8** %reg_24_ptr
  %t56 = call i8* @obo_format_map_string(i8* %t55)
  %t57 = call i8* @obo_str_concat(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @obo.str.8, i64 0, i64 0), i8* %t56)
  store i8* %t57, i8** %reg_25_ptr
  %t58 = load i8*, i8** %reg_25_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t58)
  %t59 = load i64, i64* %var_scores_ptr
  store i64 %t59, i64* %reg_26_ptr
  %t60 = load i8*, i8** %reg_26_ptr
  %t61 = call i64 @obo_map_set(i8* %t60, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.9, i64 0, i64 0), i64 92)
  store i64 %t61, i64* %reg_27_ptr
  %t62 = load i64, i64* %reg_27_ptr
  store i64 %t62, i64* %var_scores_ptr
  %t63 = load i64, i64* %var_scores_ptr
  store i64 %t63, i64* %reg_28_ptr
  %t64 = load i64, i64* %reg_28_ptr
  %t65 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.10, i64 0, i64 0), i64 %t64)
  store i8* %t65, i8** %reg_29_ptr
  %t66 = load i8*, i8** %reg_29_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t66)
  %t67 = load i64, i64* %var_scores_ptr
  store i64 %t67, i64* %reg_30_ptr
  %t68 = load i64, i64* %reg_30_ptr
  %t69 = call i64 @obo_map_remove(i64 %t68, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.7, i64 0, i64 0))
  store i64 %t69, i64* %reg_31_ptr
  %t70 = load i64, i64* %reg_31_ptr
  store i64 %t70, i64* %var_scores_ptr
  %t71 = load i64, i64* %var_scores_ptr
  store i64 %t71, i64* %reg_32_ptr
  %t72 = load i64, i64* %reg_32_ptr
  %t73 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.11, i64 0, i64 0), i64 %t72)
  store i8* %t73, i8** %reg_33_ptr
  %t74 = load i8*, i8** %reg_33_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t74)
  %t75 = alloca [3 x i64]
  %t76 = getelementptr inbounds [3 x i64], [3 x i64]* %t75, i64 0, i64 0
  store i64 10, i64* %t76
  %t77 = getelementptr inbounds [3 x i64], [3 x i64]* %t75, i64 0, i64 1
  store i64 20, i64* %t77
  %t78 = getelementptr inbounds [3 x i64], [3 x i64]* %t75, i64 0, i64 2
  store i64 30, i64* %t78
  %t79 = getelementptr inbounds [3 x i64], [3 x i64]* %t75, i64 0, i64 0
  %t80 = call i8* @obo_list_new_i64(i64 3, i64* %t79)
  store i8* %t80, i8** %reg_34_ptr
  %t81 = load i8*, i8** %reg_34_ptr
  store i8* %t81, i8** %var_q_ptr
  %t82 = load i8*, i8** %var_q_ptr
  store i8* %t82, i8** %reg_35_ptr
  %t83 = load i8*, i8** %reg_35_ptr
  %t84 = call i8* @obo_format_list_string(i8* %t83)
  %t85 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.12, i64 0, i64 0), i8* %t84)
  store i8* %t85, i8** %reg_36_ptr
  %t86 = load i8*, i8** %reg_36_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t86)
  %t87 = load i8*, i8** %var_q_ptr
  store i8* %t87, i8** %reg_37_ptr
  %t88 = load i8*, i8** %reg_37_ptr
  %t89 = call i8* @obo_queue_push(i8* %t88, i64 40)
  store i8* %t89, i8** %reg_38_ptr
  %t90 = load i8*, i8** %reg_38_ptr
  store i8* %t90, i8** %var_q_ptr
  %t91 = load i8*, i8** %var_q_ptr
  store i8* %t91, i8** %reg_39_ptr
  %t92 = load i8*, i8** %reg_39_ptr
  %t93 = call i8* @obo_format_list_string(i8* %t92)
  %t94 = call i8* @obo_str_concat(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @obo.str.13, i64 0, i64 0), i8* %t93)
  store i8* %t94, i8** %reg_40_ptr
  %t95 = load i8*, i8** %reg_40_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t95)
  %t96 = alloca [3 x i64]
  %t97 = getelementptr inbounds [3 x i64], [3 x i64]* %t96, i64 0, i64 0
  store i64 1, i64* %t97
  %t98 = getelementptr inbounds [3 x i64], [3 x i64]* %t96, i64 0, i64 1
  store i64 2, i64* %t98
  %t99 = getelementptr inbounds [3 x i64], [3 x i64]* %t96, i64 0, i64 2
  store i64 3, i64* %t99
  %t100 = getelementptr inbounds [3 x i64], [3 x i64]* %t96, i64 0, i64 0
  %t101 = call i8* @obo_list_new_i64(i64 3, i64* %t100)
  store i8* %t101, i8** %reg_41_ptr
  %t102 = load i8*, i8** %reg_41_ptr
  store i8* %t102, i8** %var_st_ptr
  %t103 = load i8*, i8** %var_st_ptr
  store i8* %t103, i8** %reg_42_ptr
  %t104 = load i8*, i8** %reg_42_ptr
  %t105 = call i8* @obo_format_list_string(i8* %t104)
  %t106 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.14, i64 0, i64 0), i8* %t105)
  store i8* %t106, i8** %reg_43_ptr
  %t107 = load i8*, i8** %reg_43_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t107)
  %t108 = load i8*, i8** %var_st_ptr
  store i8* %t108, i8** %reg_44_ptr
  %t109 = load i8*, i8** %reg_44_ptr
  %t110 = call i8* @obo_stack_push(i8* %t109, i64 4)
  store i8* %t110, i8** %reg_45_ptr
  %t111 = load i8*, i8** %reg_45_ptr
  store i8* %t111, i8** %var_st_ptr
  %t112 = load i8*, i8** %var_st_ptr
  store i8* %t112, i8** %reg_46_ptr
  %t113 = load i8*, i8** %reg_46_ptr
  %t114 = call i8* @obo_format_list_string(i8* %t113)
  %t115 = call i8* @obo_str_concat(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @obo.str.15, i64 0, i64 0), i8* %t114)
  store i8* %t115, i8** %reg_47_ptr
  %t116 = load i8*, i8** %reg_47_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t116)
  call void @obo_gc_pop_roots(i64 28)
  call void @obo_arena_free_all()
  ret i32 0
}

