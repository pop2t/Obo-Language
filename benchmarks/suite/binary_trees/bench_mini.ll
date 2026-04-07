; OBO native codegen (Phase 7)
declare i32 @printf(i8*, ...)
declare i32 @strcmp(i8*, i8*)
declare i8* @obo_str_concat(i8*, i8*)
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

@obo.str.0 = private unnamed_addr constant [11 x i8] c"tree built\00"
@obo.str.1 = private unnamed_addr constant [8 x i8] c"check: \00"
@obo.str.2 = private unnamed_addr constant [9 x i8] c"TreeNode\00"
@obo.str.3 = private unnamed_addr constant [5 x i8] c"left\00"
@obo.str.4 = private unnamed_addr constant [6 x i8] c"right\00"

define i8* @make_tree(i64 %arg0) {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %var_depth_ptr = alloca i64
  store i64 %arg0, i64* %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_depth_ptr
  %t1 = load i64, i64* %var_depth_ptr
  store i64 %t1, i64* %reg_1_ptr
  %t2 = load i64, i64* %reg_1_ptr
  %t3 = icmp eq i64 %t2, 0
  %t4 = zext i1 %t3 to i64
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t7 = icmp ne i64 %t5, 0
  %t8 = zext i1 %t7 to i64
  %t6 = icmp ne i64 %t8, 0
  br i1 %t6, label %make_tree_b1, label %make_tree_b2
make_tree_b1:
  %t9 = call i8* @obo_entity_new(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_put_null(i8* %t9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_put_null(i8* %t9, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.4, i64 0, i64 0))
  store i8* %t9, i8** %reg_3_ptr
  %t10 = load i8*, i8** %reg_3_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i8* %t10
make_tree_b2:
  br label %make_tree_b3
make_tree_b3:
  %t11 = load i64, i64* %var_depth_ptr
  store i64 %t11, i64* %reg_4_ptr
  %t12 = load i64, i64* %reg_4_ptr
  %t13 = sub i64 %t12, 1
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  %t15 = call i8* @make_tree(i64 %t14)
  store i8* %t15, i8** %reg_6_ptr
  %t16 = load i64, i64* %var_depth_ptr
  store i64 %t16, i64* %reg_7_ptr
  %t17 = load i64, i64* %reg_7_ptr
  %t18 = sub i64 %t17, 1
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  %t20 = call i8* @make_tree(i64 %t19)
  store i8* %t20, i8** %reg_9_ptr
  %t21 = call i8* @obo_entity_new(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.2, i64 0, i64 0))
  %t22 = load i8*, i8** %reg_6_ptr
  call void @obo_entity_put_entity(i8* %t21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.3, i64 0, i64 0), i8* %t22)
  %t23 = load i8*, i8** %reg_9_ptr
  call void @obo_entity_put_entity(i8* %t21, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.4, i64 0, i64 0), i8* %t23)
  store i8* %t21, i8** %reg_10_ptr
  %t24 = load i8*, i8** %reg_10_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i8* %t24
}

define i64 @check_tree(i8* %arg0) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %var_node_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %var_node_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_node_ptr
  %t1 = load i8*, i8** %var_node_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = load i8*, i8** %reg_1_ptr
  %t3 = call i8* @obo_value_as_entity_ptr(i8* %t2)
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t4, i8** %reg_2_ptr
  %t5 = load i8*, i8** %reg_2_ptr
  %t6 = call i8* @obo_box_null()
  %t7 = call i64 @obo_value_compare(i8* %t5, i8* %t6)
  %t8 = icmp eq i64 %t7, 0
  %t9 = zext i1 %t8 to i64
  store i64 %t9, i64* %reg_3_ptr
  %t10 = load i64, i64* %reg_3_ptr
  %t12 = icmp ne i64 %t10, 0
  %t13 = zext i1 %t12 to i64
  %t11 = icmp ne i64 %t13, 0
  br i1 %t11, label %check_tree_b1, label %check_tree_b2
check_tree_b1:
  call void @obo_gc_pop_roots(i64 8)
  ret i64 1
check_tree_b2:
  br label %check_tree_b3
check_tree_b3:
  %t14 = load i8*, i8** %var_node_ptr
  store i8* %t14, i8** %reg_4_ptr
  %t15 = load i8*, i8** %reg_4_ptr
  %t16 = call i8* @obo_value_as_entity_ptr(i8* %t15)
  %t17 = call i8* @obo_entity_get_boxed(i8* %t16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t17, i8** %reg_5_ptr
  %t18 = load i8*, i8** %reg_5_ptr
  %t19 = call i64 @check_tree(i8* %t18)
  store i64 %t19, i64* %reg_6_ptr
  %t20 = load i64, i64* %reg_6_ptr
  %t21 = add i64 1, %t20
  store i64 %t21, i64* %reg_7_ptr
  %t22 = load i8*, i8** %var_node_ptr
  store i8* %t22, i8** %reg_8_ptr
  %t23 = load i8*, i8** %reg_8_ptr
  %t24 = call i8* @obo_value_as_entity_ptr(i8* %t23)
  %t25 = call i8* @obo_entity_get_boxed(i8* %t24, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.4, i64 0, i64 0))
  store i8* %t25, i8** %reg_9_ptr
  %t26 = load i8*, i8** %reg_9_ptr
  %t27 = call i64 @check_tree(i8* %t26)
  store i64 %t27, i64* %reg_10_ptr
  %t28 = load i64, i64* %reg_7_ptr
  %t29 = load i64, i64* %reg_10_ptr
  %t30 = add i64 %t28, %t29
  store i64 %t30, i64* %reg_11_ptr
  %t31 = load i64, i64* %reg_11_ptr
  call void @obo_gc_pop_roots(i64 8)
  ret i64 %t31
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %var_tree_ptr = alloca i8*
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %var_tree_ptr)
  %t0 = call i8* @make_tree(i64 12)
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_tree_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.0, i64 0, i64 0))
  %t2 = load i8*, i8** %var_tree_ptr
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  %t4 = call i8* @obo_box_entity(i8* %t3)
  %t5 = call i64 @check_tree(i8* %t4)
  store i64 %t5, i64* %reg_2_ptr
  %t6 = load i64, i64* %reg_2_ptr
  %t7 = call i8* @obo_i64_to_str(i64 %t6)
  %t8 = call i8* @obo_str_concat(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.1, i64 0, i64 0), i8* %t7)
  store i8* %t8, i8** %reg_3_ptr
  %t9 = load i8*, i8** %reg_3_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t9)
  call void @obo_gc_pop_roots(i64 4)
  call void @obo_arena_free_all()
  ret i32 0
}

