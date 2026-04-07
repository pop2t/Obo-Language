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

@obo.str.0 = private unnamed_addr constant [5 x i8] c"a.x=\00"
@obo.str.1 = private unnamed_addr constant [6 x i8] c" a.y=\00"
@obo.str.2 = private unnamed_addr constant [5 x i8] c"b.x=\00"
@obo.str.3 = private unnamed_addr constant [6 x i8] c" b.y=\00"
@obo.str.4 = private unnamed_addr constant [6 x i8] c"diff=\00"
@obo.str.5 = private unnamed_addr constant [6 x i8] c"p1.x=\00"
@obo.str.6 = private unnamed_addr constant [6 x i8] c"p2.x=\00"
@obo.str.7 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.8 = private unnamed_addr constant [2 x i8] c"y\00"
@obo.str.9 = private unnamed_addr constant [3 x i8] c"Pt\00"

define i64 @test(i8* %arg0) {
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
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %var_b_ptr = alloca i8*
  %var_a_ptr = alloca i8*
  %var_pts_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %var_b_ptr)
  call void @obo_gc_push_root(i8** %var_a_ptr)
  call void @obo_gc_push_root(i8** %var_pts_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_pts_ptr
  %t1 = load i8*, i8** %var_pts_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = load i8*, i8** %reg_1_ptr
  %t3 = call i8* @obo_mixed_list_get(i8* %t2, i64 0)
  store i8* %t3, i8** %reg_2_ptr
  %t4 = load i8*, i8** %reg_2_ptr
  store i8* %t4, i8** %var_a_ptr
  %t5 = load i8*, i8** %var_pts_ptr
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = call i8* @obo_mixed_list_get(i8* %t6, i64 1)
  store i8* %t7, i8** %reg_4_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  store i8* %t8, i8** %var_b_ptr
  %t9 = load i8*, i8** %var_a_ptr
  store i8* %t9, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  %t11 = call i8* @obo_value_as_entity_ptr(i8* %t10)
  %t12 = call i8* @obo_entity_get_boxed(i8* %t11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = call i8* @obo_value_to_str(i8* %t13)
  %t15 = call i8* @obo_str_concat(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.0, i64 0, i64 0), i8* %t14)
  store i8* %t15, i8** %reg_7_ptr
  %t16 = load i8*, i8** %reg_7_ptr
  %t17 = call i8* @obo_str_concat(i8* %t16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.1, i64 0, i64 0))
  store i8* %t17, i8** %reg_8_ptr
  %t18 = load i8*, i8** %var_a_ptr
  store i8* %t18, i8** %reg_9_ptr
  %t19 = load i8*, i8** %reg_9_ptr
  %t20 = call i8* @obo_value_as_entity_ptr(i8* %t19)
  %t21 = call i8* @obo_entity_get_boxed(i8* %t20, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.8, i64 0, i64 0))
  store i8* %t21, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_8_ptr
  %t23 = load i8*, i8** %reg_10_ptr
  %t24 = call i8* @obo_value_to_str(i8* %t23)
  %t25 = call i8* @obo_str_concat(i8* %t22, i8* %t24)
  store i8* %t25, i8** %reg_11_ptr
  %t26 = load i8*, i8** %reg_11_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t26)
  %t27 = load i8*, i8** %var_b_ptr
  store i8* %t27, i8** %reg_12_ptr
  %t28 = load i8*, i8** %reg_12_ptr
  %t29 = call i8* @obo_value_as_entity_ptr(i8* %t28)
  %t30 = call i8* @obo_entity_get_boxed(i8* %t29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t30, i8** %reg_13_ptr
  %t31 = load i8*, i8** %reg_13_ptr
  %t32 = call i8* @obo_value_to_str(i8* %t31)
  %t33 = call i8* @obo_str_concat(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.2, i64 0, i64 0), i8* %t32)
  store i8* %t33, i8** %reg_14_ptr
  %t34 = load i8*, i8** %reg_14_ptr
  %t35 = call i8* @obo_str_concat(i8* %t34, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t35, i8** %reg_15_ptr
  %t36 = load i8*, i8** %var_b_ptr
  store i8* %t36, i8** %reg_16_ptr
  %t37 = load i8*, i8** %reg_16_ptr
  %t38 = call i8* @obo_value_as_entity_ptr(i8* %t37)
  %t39 = call i8* @obo_entity_get_boxed(i8* %t38, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.8, i64 0, i64 0))
  store i8* %t39, i8** %reg_17_ptr
  %t40 = load i8*, i8** %reg_15_ptr
  %t41 = load i8*, i8** %reg_17_ptr
  %t42 = call i8* @obo_value_to_str(i8* %t41)
  %t43 = call i8* @obo_str_concat(i8* %t40, i8* %t42)
  store i8* %t43, i8** %reg_18_ptr
  %t44 = load i8*, i8** %reg_18_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t44)
  %t45 = load i8*, i8** %var_a_ptr
  store i8* %t45, i8** %reg_19_ptr
  %t46 = load i8*, i8** %reg_19_ptr
  %t47 = call i8* @obo_value_as_entity_ptr(i8* %t46)
  %t48 = call i8* @obo_entity_get_boxed(i8* %t47, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t48, i8** %reg_20_ptr
  %t49 = load i8*, i8** %var_b_ptr
  store i8* %t49, i8** %reg_21_ptr
  %t50 = load i8*, i8** %reg_21_ptr
  %t51 = call i8* @obo_value_as_entity_ptr(i8* %t50)
  %t52 = call i8* @obo_entity_get_boxed(i8* %t51, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t52, i8** %reg_22_ptr
  %t53 = load i8*, i8** %reg_20_ptr
  %t54 = load i8*, i8** %reg_22_ptr
  %t55 = call i8* @obo_dyn_arith(i8* %t53, i8* %t54, i32 1)
  store i8* %t55, i8** %reg_23_ptr
  %t56 = load i64, i64* %reg_23_ptr
  %t57 = call i8* @obo_i64_to_str(i64 %t56)
  %t58 = call i8* @obo_str_concat(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.4, i64 0, i64 0), i8* %t57)
  store i8* %t58, i8** %reg_24_ptr
  %t59 = load i8*, i8** %reg_24_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t59)
  call void @obo_gc_pop_roots(i64 27)
  ret i64 0
}

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
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %var_pts_ptr = alloca i8*
  %var_p2_ptr = alloca i8*
  %var_p1_ptr = alloca i8*
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %var_pts_ptr)
  call void @obo_gc_push_root(i8** %var_p2_ptr)
  call void @obo_gc_push_root(i8** %var_p1_ptr)
  %t0 = call i8* @obo_entity_new(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.9, i64 0, i64 0))
  call void @obo_entity_put_f64(i8* %t0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0), double 0x4025000000000000)
  call void @obo_entity_put_f64(i8* %t0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.8, i64 0, i64 0), double 0x4034800000000000)
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_p1_ptr
  %t2 = call i8* @obo_entity_new(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.9, i64 0, i64 0))
  call void @obo_entity_put_f64(i8* %t2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0), double 0x4008000000000000)
  call void @obo_entity_put_f64(i8* %t2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.8, i64 0, i64 0), double 0x4010000000000000)
  store i8* %t2, i8** %reg_1_ptr
  %t3 = load i8*, i8** %reg_1_ptr
  store i8* %t3, i8** %var_p2_ptr
  %t4 = load i8*, i8** %var_p1_ptr
  store i8* %t4, i8** %reg_2_ptr
  %t5 = load i8*, i8** %reg_2_ptr
  %t6 = call i8* @obo_entity_get_boxed(i8* %t5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_to_str(i8* %t7)
  %t9 = call i8* @obo_str_concat(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0), i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = load i8*, i8** %reg_4_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t10)
  %t11 = load i8*, i8** %var_p2_ptr
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %reg_5_ptr
  %t13 = call i8* @obo_entity_get_boxed(i8* %t12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t13, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_6_ptr
  %t15 = call i8* @obo_value_to_str(i8* %t14)
  %t16 = call i8* @obo_str_concat(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0), i8* %t15)
  store i8* %t16, i8** %reg_7_ptr
  %t17 = load i8*, i8** %reg_7_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t17)
  %t18 = load i8*, i8** %var_p1_ptr
  store i8* %t18, i8** %reg_8_ptr
  %t19 = load i8*, i8** %var_p2_ptr
  store i8* %t19, i8** %reg_9_ptr
  %t20 = call i8* @obo_mixed_list_new(i64 2)
  %t21 = load i8*, i8** %reg_8_ptr
  %t22 = call i8* @obo_box_entity(i8* %t21)
  call void @obo_mixed_list_set(i8* %t20, i64 0, i8* %t22)
  %t23 = load i8*, i8** %reg_9_ptr
  %t24 = call i8* @obo_box_entity(i8* %t23)
  call void @obo_mixed_list_set(i8* %t20, i64 1, i8* %t24)
  store i8* %t20, i8** %reg_10_ptr
  %t25 = load i8*, i8** %reg_10_ptr
  store i8* %t25, i8** %var_pts_ptr
  %t26 = load i8*, i8** %var_pts_ptr
  store i8* %t26, i8** %reg_11_ptr
  %t27 = load i8*, i8** %reg_11_ptr
  %t28 = call i64 @test(i8* %t27)
  store i64 %t28, i64* %reg_12_ptr
  call void @obo_gc_pop_roots(i64 15)
  call void @obo_arena_free_all()
  ret i32 0
}

