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

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }

@obo.str.0 = private unnamed_addr constant [23 x i8] c"stretch tree of depth \00"
@obo.str.1 = private unnamed_addr constant [10 x i8] c"\09 check: \00"
@obo.str.2 = private unnamed_addr constant [26 x i8] c"long lived tree of depth \00"
@obo.str.3 = private unnamed_addr constant [1 x i8] c"\00"
@obo.str.4 = private unnamed_addr constant [18 x i8] c"\09 trees of depth \00"
@obo.str.5 = private unnamed_addr constant [9 x i8] c"TreeNode\00"
@obo.str.6 = private unnamed_addr constant [5 x i8] c"left\00"
@obo.str.7 = private unnamed_addr constant [6 x i8] c"right\00"

define internal i8* @make_tree(i64 %arg0) {
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
  %t9 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.5, i64 0, i64 0), i32 2)
  call void @obo_entity_set_field_name(i8* %t9, i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t9, i32 1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0))
  %t10 = getelementptr i8, i8* %t9, i64 32
  store i8 7, i8* %t10
  %t11 = getelementptr i8, i8* %t9, i64 40
  %t12 = bitcast i8* %t11 to i64*
  store i64 0, i64* %t12
  %t13 = getelementptr i8, i8* %t9, i64 48
  store i8 7, i8* %t13
  %t14 = getelementptr i8, i8* %t9, i64 56
  %t15 = bitcast i8* %t14 to i64*
  store i64 0, i64* %t15
  store i8* %t9, i8** %reg_3_ptr
  %t16 = load i8*, i8** %reg_3_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i8* %t16
make_tree_b2:
  br label %make_tree_b3
make_tree_b3:
  %t17 = load i64, i64* %var_depth_ptr
  store i64 %t17, i64* %reg_4_ptr
  %t18 = load i64, i64* %reg_4_ptr
  %t19 = sub i64 %t18, 1
  store i64 %t19, i64* %reg_5_ptr
  %t20 = load i64, i64* %reg_5_ptr
  %t21 = call i8* @make_tree(i64 %t20)
  store i8* %t21, i8** %reg_6_ptr
  %t22 = load i64, i64* %var_depth_ptr
  store i64 %t22, i64* %reg_7_ptr
  %t23 = load i64, i64* %reg_7_ptr
  %t24 = sub i64 %t23, 1
  store i64 %t24, i64* %reg_8_ptr
  %t25 = load i64, i64* %reg_8_ptr
  %t26 = call i8* @make_tree(i64 %t25)
  store i8* %t26, i8** %reg_9_ptr
  %t27 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.5, i64 0, i64 0), i32 2)
  call void @obo_entity_set_field_name(i8* %t27, i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t27, i32 1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0))
  %t28 = load i8*, i8** %reg_6_ptr
  %t29 = getelementptr i8, i8* %t27, i64 32
  store i8 4, i8* %t29
  %t30 = getelementptr i8, i8* %t27, i64 40
  %t31 = bitcast i8* %t30 to i8**
  store i8* %t28, i8** %t31
  %t32 = load i8*, i8** %reg_9_ptr
  %t33 = getelementptr i8, i8* %t27, i64 48
  store i8 4, i8* %t33
  %t34 = getelementptr i8, i8* %t27, i64 56
  %t35 = bitcast i8* %t34 to i8**
  store i8* %t32, i8** %t35
  store i8* %t27, i8** %reg_10_ptr
  %t36 = load i8*, i8** %reg_10_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i8* %t36
}

define internal i64 @check_tree(i8* %arg0) {
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
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %var_node_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_node_ptr
  %t1 = load i8*, i8** %var_node_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = load i8*, i8** %reg_1_ptr
  %t3 = call i8* @obo_value_as_entity_ptr(i8* %t2)
  %t4 = getelementptr i8, i8* %t3, i64 32
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
  call void @obo_gc_pop_roots(i64 3)
  ret i64 1
check_tree_b2:
  br label %check_tree_b3
check_tree_b3:
  %t14 = load i8*, i8** %var_node_ptr
  store i8* %t14, i8** %reg_4_ptr
  %t15 = load i8*, i8** %reg_4_ptr
  %t16 = call i8* @obo_value_as_entity_ptr(i8* %t15)
  %t17 = getelementptr i8, i8* %t16, i64 32
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
  %t24 = getelementptr i8, i8* %t16, i64 48
  store i8* %t24, i8** %reg_9_ptr
  %t25 = load i8*, i8** %reg_9_ptr
  %t26 = call i64 @check_tree(i8* %t25)
  store i64 %t26, i64* %reg_10_ptr
  %t27 = load i64, i64* %reg_7_ptr
  %t28 = load i64, i64* %reg_10_ptr
  %t29 = add i64 %t27, %t28
  store i64 %t29, i64* %reg_11_ptr
  %t30 = load i64, i64* %reg_11_ptr
  call void @obo_gc_pop_roots(i64 3)
  ret i64 %t30
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i8*
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
  %reg_35_ptr = alloca i8*
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i64
  %reg_44_ptr = alloca i8*
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i64
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca i64
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i64
  %reg_55_ptr = alloca i8*
  %var_chk_ptr = alloca i64
  %var_max_depth_ptr = alloca i64
  %var_d_ptr = alloca i64
  %var_min_depth_ptr = alloca i64
  %var_stretch_depth_ptr = alloca i64
  %var_j_ptr = alloca i64
  %var_iterations_ptr = alloca i64
  %var_stretch_ptr = alloca i8*
  %var_long_lived_ptr = alloca i8*
  %var_i_ptr = alloca i64
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_35_ptr)
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %var_stretch_ptr)
  call void @obo_gc_push_root(i8** %var_long_lived_ptr)
  store i64 4, i64* %var_min_depth_ptr
  store i64 10, i64* %var_max_depth_ptr
  %t0 = load i64, i64* %var_max_depth_ptr
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  %t2 = add i64 %t1, 1
  store i64 %t2, i64* %reg_1_ptr
  %t3 = load i64, i64* %reg_1_ptr
  store i64 %t3, i64* %var_stretch_depth_ptr
  %t4 = load i64, i64* %var_stretch_depth_ptr
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t6 = call i8* @make_tree(i64 %t5)
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  store i8* %t7, i8** %var_stretch_ptr
  %t8 = load i64, i64* %var_stretch_depth_ptr
  store i64 %t8, i64* %reg_4_ptr
  %t9 = load i64, i64* %reg_4_ptr
  %t10 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @obo.str.0, i64 0, i64 0), i64 %t9)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %reg_5_ptr
  %t12 = call i8* @obo_str_concat(i8* %t11, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %var_stretch_ptr
  store i8* %t13, i8** %reg_7_ptr
  %t14 = load i8*, i8** %reg_7_ptr
  %t15 = call i8* @obo_box_entity(i8* %t14)
  %t16 = call i64 @check_tree(i8* %t15)
  store i64 %t16, i64* %reg_8_ptr
  %t17 = load i8*, i8** %reg_6_ptr
  %t18 = load i64, i64* %reg_8_ptr
  %t19 = call i8* @obo_str_concat_int(i8* %t17, i64 %t18)
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %reg_9_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t20)
  %t21 = load i64, i64* %var_max_depth_ptr
  store i64 %t21, i64* %reg_10_ptr
  %t22 = load i64, i64* %reg_10_ptr
  %t23 = call i8* @make_tree(i64 %t22)
  store i8* %t23, i8** %reg_11_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  store i8* %t24, i8** %var_long_lived_ptr
  %t25 = load i64, i64* %var_min_depth_ptr
  store i64 %t25, i64* %reg_12_ptr
  %t26 = load i64, i64* %reg_12_ptr
  store i64 %t26, i64* %var_d_ptr
  br label %main_b1
main_b1:
  %t27 = load i64, i64* %var_d_ptr
  store i64 %t27, i64* %reg_13_ptr
  %t28 = load i64, i64* %var_max_depth_ptr
  store i64 %t28, i64* %reg_14_ptr
  %t29 = load i64, i64* %reg_13_ptr
  %t30 = load i64, i64* %reg_14_ptr
  %t31 = icmp sle i64 %t29, %t30
  %t32 = zext i1 %t31 to i64
  store i64 %t32, i64* %reg_15_ptr
  %t33 = load i64, i64* %reg_15_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %main_b2, label %main_b3
main_b2:
  store i64 1, i64* %var_iterations_ptr
  store i64 0, i64* %var_j_ptr
  %t37 = load i64, i64* %var_max_depth_ptr
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %var_d_ptr
  store i64 %t38, i64* %reg_17_ptr
  %t39 = load i64, i64* %reg_16_ptr
  %t40 = load i64, i64* %reg_17_ptr
  %t41 = sub i64 %t39, %t40
  store i64 %t41, i64* %reg_18_ptr
  %t42 = load i64, i64* %var_min_depth_ptr
  store i64 %t42, i64* %reg_19_ptr
  %t43 = load i64, i64* %reg_18_ptr
  %t44 = load i64, i64* %reg_19_ptr
  %t45 = add i64 %t43, %t44
  store i64 %t45, i64* %reg_20_ptr
  store i64 1, i64* %reg_21_ptr
  br label %main_b4
main_b3:
  %t46 = load i64, i64* %var_max_depth_ptr
  store i64 %t46, i64* %reg_50_ptr
  %t47 = load i64, i64* %reg_50_ptr
  %t48 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @obo.str.2, i64 0, i64 0), i64 %t47)
  store i8* %t48, i8** %reg_51_ptr
  %t49 = load i8*, i8** %reg_51_ptr
  %t50 = call i8* @obo_str_concat(i8* %t49, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t50, i8** %reg_52_ptr
  %t51 = load i8*, i8** %var_long_lived_ptr
  store i8* %t51, i8** %reg_53_ptr
  %t52 = load i8*, i8** %reg_53_ptr
  %t53 = call i8* @obo_box_entity(i8* %t52)
  %t54 = call i64 @check_tree(i8* %t53)
  store i64 %t54, i64* %reg_54_ptr
  %t55 = load i8*, i8** %reg_52_ptr
  %t56 = load i64, i64* %reg_54_ptr
  %t57 = call i8* @obo_str_concat_int(i8* %t55, i64 %t56)
  store i8* %t57, i8** %reg_55_ptr
  %t58 = load i8*, i8** %reg_55_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t58)
  call void @obo_gc_pop_roots(i64 11)
  call void @obo_arena_free_all()
  ret i32 0
main_b4:
  %t59 = load i64, i64* %var_j_ptr
  store i64 %t59, i64* %reg_22_ptr
  %t60 = load i64, i64* %reg_22_ptr
  %t61 = load i64, i64* %reg_20_ptr
  %t62 = icmp slt i64 %t60, %t61
  %t63 = zext i1 %t62 to i64
  store i64 %t63, i64* %reg_23_ptr
  %t64 = load i64, i64* %reg_23_ptr
  %t66 = icmp ne i64 %t64, 0
  %t67 = zext i1 %t66 to i64
  %t65 = icmp ne i64 %t67, 0
  br i1 %t65, label %main_b5, label %main_b7
main_b5:
  %t68 = load i64, i64* %var_iterations_ptr
  store i64 %t68, i64* %reg_24_ptr
  %t69 = load i64, i64* %reg_24_ptr
  %t70 = mul i64 %t69, 2
  store i64 %t70, i64* %reg_25_ptr
  %t71 = load i64, i64* %reg_25_ptr
  store i64 %t71, i64* %var_iterations_ptr
  br label %main_b6
main_b6:
  %t72 = load i64, i64* %var_j_ptr
  store i64 %t72, i64* %reg_26_ptr
  %t73 = load i64, i64* %reg_26_ptr
  %t74 = load i64, i64* %reg_21_ptr
  %t75 = add i64 %t73, %t74
  store i64 %t75, i64* %reg_27_ptr
  %t76 = load i64, i64* %reg_27_ptr
  store i64 %t76, i64* %var_j_ptr
  br label %main_b4
main_b7:
  store i64 0, i64* %var_chk_ptr
  store i64 1, i64* %var_i_ptr
  %t77 = load i64, i64* %var_iterations_ptr
  store i64 %t77, i64* %reg_28_ptr
  %t78 = load i64, i64* %reg_28_ptr
  %t79 = add i64 %t78, 1
  store i64 %t79, i64* %reg_29_ptr
  store i64 1, i64* %reg_30_ptr
  br label %main_b8
main_b8:
  %t80 = load i64, i64* %var_i_ptr
  store i64 %t80, i64* %reg_31_ptr
  %t81 = load i64, i64* %reg_31_ptr
  %t82 = load i64, i64* %reg_29_ptr
  %t83 = icmp slt i64 %t81, %t82
  %t84 = zext i1 %t83 to i64
  store i64 %t84, i64* %reg_32_ptr
  %t85 = load i64, i64* %reg_32_ptr
  %t87 = icmp ne i64 %t85, 0
  %t88 = zext i1 %t87 to i64
  %t86 = icmp ne i64 %t88, 0
  br i1 %t86, label %main_b9, label %main_b11
main_b9:
  %t89 = load i64, i64* %var_chk_ptr
  store i64 %t89, i64* %reg_33_ptr
  %t90 = load i64, i64* %var_d_ptr
  store i64 %t90, i64* %reg_34_ptr
  %t91 = load i64, i64* %reg_34_ptr
  %t92 = call i8* @make_tree(i64 %t91)
  store i8* %t92, i8** %reg_35_ptr
  %t93 = load i8*, i8** %reg_35_ptr
  %t94 = call i8* @obo_box_entity(i8* %t93)
  %t95 = call i64 @check_tree(i8* %t94)
  store i64 %t95, i64* %reg_36_ptr
  %t96 = load i64, i64* %reg_33_ptr
  %t97 = load i64, i64* %reg_36_ptr
  %t98 = add i64 %t96, %t97
  store i64 %t98, i64* %reg_37_ptr
  %t99 = load i64, i64* %reg_37_ptr
  store i64 %t99, i64* %var_chk_ptr
  br label %main_b10
main_b10:
  %t100 = load i64, i64* %var_i_ptr
  store i64 %t100, i64* %reg_38_ptr
  %t101 = load i64, i64* %reg_38_ptr
  %t102 = load i64, i64* %reg_30_ptr
  %t103 = add i64 %t101, %t102
  store i64 %t103, i64* %reg_39_ptr
  %t104 = load i64, i64* %reg_39_ptr
  store i64 %t104, i64* %var_i_ptr
  br label %main_b8
main_b11:
  %t105 = load i64, i64* %var_iterations_ptr
  store i64 %t105, i64* %reg_40_ptr
  %t106 = load i64, i64* %reg_40_ptr
  %t107 = call i8* @obo_str_concat_int(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i64 %t106)
  store i8* %t107, i8** %reg_41_ptr
  %t108 = load i8*, i8** %reg_41_ptr
  %t109 = call i8* @obo_str_concat(i8* %t108, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @obo.str.4, i64 0, i64 0))
  store i8* %t109, i8** %reg_42_ptr
  %t110 = load i64, i64* %var_d_ptr
  store i64 %t110, i64* %reg_43_ptr
  %t111 = load i8*, i8** %reg_42_ptr
  %t112 = load i64, i64* %reg_43_ptr
  %t113 = call i8* @obo_str_concat_int(i8* %t111, i64 %t112)
  store i8* %t113, i8** %reg_44_ptr
  %t114 = load i8*, i8** %reg_44_ptr
  %t115 = call i8* @obo_str_concat(i8* %t114, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t115, i8** %reg_45_ptr
  %t116 = load i64, i64* %var_chk_ptr
  store i64 %t116, i64* %reg_46_ptr
  %t117 = load i8*, i8** %reg_45_ptr
  %t118 = load i64, i64* %reg_46_ptr
  %t119 = call i8* @obo_str_concat_int(i8* %t117, i64 %t118)
  store i8* %t119, i8** %reg_47_ptr
  %t120 = load i8*, i8** %reg_47_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t120)
  %t121 = load i64, i64* %var_d_ptr
  store i64 %t121, i64* %reg_48_ptr
  %t122 = load i64, i64* %reg_48_ptr
  %t123 = add i64 %t122, 2
  store i64 %t123, i64* %reg_49_ptr
  %t124 = load i64, i64* %reg_49_ptr
  store i64 %t124, i64* %var_d_ptr
  br label %main_b1
}

