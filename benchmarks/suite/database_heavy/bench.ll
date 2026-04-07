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

@obo.str.0 = private unnamed_addr constant [4 x i8] c"add\00"
@obo.str.1 = private unnamed_addr constant [9 x i8] c"removeAt\00"
@obo.str.2 = private unnamed_addr constant [9 x i8] c"__init__\00"
@obo.str.3 = private unnamed_addr constant [1 x i8] c"\00"
@obo.str.4 = private unnamed_addr constant [4 x i8] c"has\00"
@obo.str.5 = private unnamed_addr constant [7 x i8] c"remove\00"
@obo.str.6 = private unnamed_addr constant [4 x i8] c"set\00"
@obo.str.7 = private unnamed_addr constant [7 x i8] c"filter\00"
@obo.str.8 = private unnamed_addr constant [12 x i8] c"Engineering\00"
@obo.str.9 = private unnamed_addr constant [10 x i8] c"Marketing\00"
@obo.str.10 = private unnamed_addr constant [3 x i8] c"HR\00"
@obo.str.11 = private unnamed_addr constant [8 x i8] c"Finance\00"
@obo.str.12 = private unnamed_addr constant [6 x i8] c"Sales\00"
@obo.str.13 = private unnamed_addr constant [8 x i8] c"Support\00"
@obo.str.14 = private unnamed_addr constant [6 x i8] c"Legal\00"
@obo.str.15 = private unnamed_addr constant [4 x i8] c"R&D\00"
@obo.str.16 = private unnamed_addr constant [7 x i8] c"Junior\00"
@obo.str.17 = private unnamed_addr constant [4 x i8] c"Mid\00"
@obo.str.18 = private unnamed_addr constant [7 x i8] c"Senior\00"
@obo.str.19 = private unnamed_addr constant [5 x i8] c"Lead\00"
@obo.str.20 = private unnamed_addr constant [10 x i8] c"Principal\00"
@obo.str.21 = private unnamed_addr constant [5 x i8] c"name\00"
@obo.str.22 = private unnamed_addr constant [11 x i8] c"department\00"
@obo.str.23 = private unnamed_addr constant [7 x i8] c"salary\00"
@obo.str.24 = private unnamed_addr constant [4 x i8] c"age\00"
@obo.str.25 = private unnamed_addr constant [6 x i8] c"level\00"
@obo.str.26 = private unnamed_addr constant [10 x i8] c"employees\00"
@obo.str.27 = private unnamed_addr constant [5 x i8] c"emp_\00"
@obo.str.28 = private unnamed_addr constant [7 x i8] c"insert\00"
@obo.str.29 = private unnamed_addr constant [6 x i8] c"where\00"
@obo.str.30 = private unnamed_addr constant [9 x i8] c"order_by\00"
@obo.str.31 = private unnamed_addr constant [11 x i8] c"find_first\00"
@obo.str.32 = private unnamed_addr constant [21 x i8] c"Building table with \00"
@obo.str.33 = private unnamed_addr constant [9 x i8] c" rows...\00"
@obo.str.34 = private unnamed_addr constant [9 x i8] c"Running \00"
@obo.str.35 = private unnamed_addr constant [21 x i8] c" query iterations...\00"
@obo.str.36 = private unnamed_addr constant [13 x i8] c"update_where\00"
@obo.str.37 = private unnamed_addr constant [13 x i8] c"delete_where\00"
@obo.str.38 = private unnamed_addr constant [17 x i8] c"Total checksum: \00"
@obo.str.39 = private unnamed_addr constant [25 x i8] c"Database heavy complete.\00"
@obo.str.40 = private unnamed_addr constant [7 x i8] c"emp_42\00"
@obo.str.41 = private unnamed_addr constant [6 x i8] c"count\00"
@obo.str.42 = private unnamed_addr constant [5 x i8] c"data\00"
@obo.str.43 = private unnamed_addr constant [6 x i8] c"Table\00"
@obo.str.44 = private unnamed_addr constant [8 x i8] c"columns\00"
@obo.str.45 = private unnamed_addr constant [5 x i8] c"rows\00"
@obo.str.46 = private unnamed_addr constant [8 x i8] c"next_id\00"
@obo.str.47 = private unnamed_addr constant [4 x i8] c"Row\00"
@obo.str.48 = private unnamed_addr constant [3 x i8] c"id\00"

define i8* @sort_rows(i8* %arg0, i8* %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i64
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i8*
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i8*
  %var_best_ptr = alloca i64
  %var_remaining_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_ascending_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_i_ptr = alloca i64
  %var_a_ptr = alloca i8*
  %var_b_ptr = alloca i8*
  %var_result_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_39_ptr)
  call void @obo_gc_push_root(i8** %reg_40_ptr)
  call void @obo_gc_push_root(i8** %reg_42_ptr)
  call void @obo_gc_push_root(i8** %reg_43_ptr)
  call void @obo_gc_push_root(i8** %reg_44_ptr)
  call void @obo_gc_push_root(i8** %var_remaining_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_a_ptr)
  call void @obo_gc_push_root(i8** %var_b_ptr)
  call void @obo_gc_push_root(i8** %var_result_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_ascending_ptr
  %t3 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  store i8* %t4, i8** %var_result_ptr
  %t5 = load i8*, i8** %var_rows_ptr
  store i8* %t5, i8** %reg_4_ptr
  %t6 = load i8*, i8** %reg_4_ptr
  store i8* %t6, i8** %var_remaining_ptr
  br label %sort_rows_b1
sort_rows_b1:
  %t7 = load i8*, i8** %var_remaining_ptr
  store i8* %t7, i8** %reg_5_ptr
  %t8 = load i8*, i8** %reg_5_ptr
  %t9 = call i64 @obo_value_len(i8* %t8)
  store i64 %t9, i64* %reg_6_ptr
  %t10 = load i64, i64* %reg_6_ptr
  %t11 = icmp sgt i64 %t10, 0
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_7_ptr
  %t13 = load i64, i64* %reg_7_ptr
  %t15 = icmp ne i64 %t13, 0
  %t16 = zext i1 %t15 to i64
  %t14 = icmp ne i64 %t16, 0
  br i1 %t14, label %sort_rows_b2, label %sort_rows_b3
sort_rows_b2:
  store i64 0, i64* %var_best_ptr
  store i64 1, i64* %var_i_ptr
  %t17 = load i8*, i8** %var_remaining_ptr
  store i8* %t17, i8** %reg_8_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i64 @obo_value_len(i8* %t18)
  store i64 %t19, i64* %reg_9_ptr
  store i64 1, i64* %reg_10_ptr
  br label %sort_rows_b4
sort_rows_b3:
  %t20 = load i8*, i8** %var_result_ptr
  store i8* %t20, i8** %reg_44_ptr
  %t21 = load i8*, i8** %reg_44_ptr
  call void @obo_gc_pop_roots(i64 33)
  ret i8* %t21
sort_rows_b4:
  %t22 = load i64, i64* %var_i_ptr
  store i64 %t22, i64* %reg_11_ptr
  %t23 = load i64, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_9_ptr
  %t25 = icmp slt i64 %t23, %t24
  %t26 = zext i1 %t25 to i64
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t29 = icmp ne i64 %t27, 0
  %t30 = zext i1 %t29 to i64
  %t28 = icmp ne i64 %t30, 0
  br i1 %t28, label %sort_rows_b5, label %sort_rows_b7
sort_rows_b5:
  %t31 = load i8*, i8** %var_remaining_ptr
  store i8* %t31, i8** %reg_13_ptr
  %t32 = load i64, i64* %var_i_ptr
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i8*, i8** %reg_13_ptr
  %t34 = load i64, i64* %reg_14_ptr
  %t36 = call i8* @obo_value_as_mixed_list_ptr(i8* %t33)
  %t35 = call i8* @obo_mixed_list_get(i8* %t36, i64 %t34)
  store i8* %t35, i8** %reg_15_ptr
  %t37 = load i8*, i8** %reg_15_ptr
  %t38 = call i8* @obo_value_as_entity_ptr(i8* %t37)
  %t39 = call i8* @obo_entity_get_boxed(i8* %t38, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t39, i8** %reg_16_ptr
  %t40 = load i8*, i8** %var_column_ptr
  store i8* %t40, i8** %reg_17_ptr
  %t41 = load i8*, i8** %reg_16_ptr
  %t42 = load i8*, i8** %reg_17_ptr
  %t44 = call i8* @obo_value_as_map_ptr(i8* %t41)
  %t43 = call i8* @obo_map_get_boxed(i8* %t44, i8* %t42)
  store i8* %t43, i8** %reg_18_ptr
  %t45 = load i8*, i8** %reg_18_ptr
  store i8* %t45, i8** %var_a_ptr
  %t46 = load i8*, i8** %var_remaining_ptr
  store i8* %t46, i8** %reg_19_ptr
  %t47 = load i64, i64* %var_best_ptr
  store i64 %t47, i64* %reg_20_ptr
  %t48 = load i8*, i8** %reg_19_ptr
  %t49 = load i64, i64* %reg_20_ptr
  %t51 = call i8* @obo_value_as_mixed_list_ptr(i8* %t48)
  %t50 = call i8* @obo_mixed_list_get(i8* %t51, i64 %t49)
  store i8* %t50, i8** %reg_21_ptr
  %t52 = load i8*, i8** %reg_21_ptr
  %t53 = call i8* @obo_value_as_entity_ptr(i8* %t52)
  %t54 = call i8* @obo_entity_get_boxed(i8* %t53, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t54, i8** %reg_22_ptr
  %t55 = load i8*, i8** %var_column_ptr
  store i8* %t55, i8** %reg_23_ptr
  %t56 = load i8*, i8** %reg_22_ptr
  %t57 = load i8*, i8** %reg_23_ptr
  %t59 = call i8* @obo_value_as_map_ptr(i8* %t56)
  %t58 = call i8* @obo_map_get_boxed(i8* %t59, i8* %t57)
  store i8* %t58, i8** %reg_24_ptr
  %t60 = load i8*, i8** %reg_24_ptr
  store i8* %t60, i8** %var_b_ptr
  %t61 = load i64, i64* %var_ascending_ptr
  store i64 %t61, i64* %reg_25_ptr
  %t62 = load i64, i64* %reg_25_ptr
  %t64 = icmp ne i64 %t62, 0
  %t65 = zext i1 %t64 to i64
  %t63 = icmp ne i64 %t65, 0
  br i1 %t63, label %sort_rows_b8, label %sort_rows_b9
sort_rows_b6:
  %t66 = load i64, i64* %var_i_ptr
  store i64 %t66, i64* %reg_34_ptr
  %t67 = load i64, i64* %reg_34_ptr
  %t68 = load i64, i64* %reg_10_ptr
  %t69 = add i64 %t67, %t68
  store i64 %t69, i64* %reg_35_ptr
  %t70 = load i64, i64* %reg_35_ptr
  store i64 %t70, i64* %var_i_ptr
  br label %sort_rows_b4
sort_rows_b7:
  %t71 = load i8*, i8** %var_remaining_ptr
  store i8* %t71, i8** %reg_36_ptr
  %t72 = load i64, i64* %var_best_ptr
  store i64 %t72, i64* %reg_37_ptr
  %t73 = load i8*, i8** %reg_36_ptr
  %t74 = load i64, i64* %reg_37_ptr
  %t76 = call i8* @obo_value_as_mixed_list_ptr(i8* %t73)
  %t75 = call i8* @obo_mixed_list_get(i8* %t76, i64 %t74)
  store i8* %t75, i8** %reg_38_ptr
  %t77 = load i8*, i8** %var_result_ptr
  store i8* %t77, i8** %reg_39_ptr
  %t78 = load i8*, i8** %reg_39_ptr
  %t79 = load i8*, i8** %reg_38_ptr
  %t80 = call i8* @obo_mixed_list_add(i8* %t78, i8* %t79)
  store i8* %t80, i8** %reg_40_ptr
  %t81 = load i8*, i8** %reg_40_ptr
  store i8* %t81, i8** %var_result_ptr
  %t82 = load i64, i64* %var_best_ptr
  store i64 %t82, i64* %reg_41_ptr
  %t83 = load i8*, i8** %var_remaining_ptr
  store i8* %t83, i8** %reg_42_ptr
  %t84 = load i8*, i8** %reg_42_ptr
  %t85 = call i8* @obo_value_as_mixed_list_ptr(i8* %t84)
  %t86 = load i64, i64* %reg_41_ptr
  %t87 = call i8* @obo_mixed_list_removeAt(i8* %t85, i64 %t86)
  %t88 = call i8* @obo_box_list(i8* %t87)
  store i8* %t88, i8** %reg_43_ptr
  %t89 = load i8*, i8** %reg_43_ptr
  store i8* %t89, i8** %var_remaining_ptr
  br label %sort_rows_b1
sort_rows_b8:
  %t90 = load i8*, i8** %var_a_ptr
  store i8* %t90, i8** %reg_26_ptr
  %t91 = load i8*, i8** %var_b_ptr
  store i8* %t91, i8** %reg_27_ptr
  %t92 = load i8*, i8** %reg_26_ptr
  %t93 = load i8*, i8** %reg_27_ptr
  %t94 = load i64, i64* %reg_28_ptr
  %t96 = icmp ne i64 %t94, 0
  %t97 = zext i1 %t96 to i64
  %t95 = icmp ne i64 %t97, 0
  br i1 %t95, label %sort_rows_b11, label %sort_rows_b12
sort_rows_b9:
  %t98 = load i8*, i8** %var_b_ptr
  store i8* %t98, i8** %reg_30_ptr
  %t99 = load i8*, i8** %var_a_ptr
  store i8* %t99, i8** %reg_31_ptr
  %t100 = load i8*, i8** %reg_30_ptr
  %t101 = load i8*, i8** %reg_31_ptr
  %t102 = load i64, i64* %reg_32_ptr
  %t104 = icmp ne i64 %t102, 0
  %t105 = zext i1 %t104 to i64
  %t103 = icmp ne i64 %t105, 0
  br i1 %t103, label %sort_rows_b14, label %sort_rows_b15
sort_rows_b10:
  br label %sort_rows_b6
sort_rows_b11:
  %t106 = load i64, i64* %var_i_ptr
  store i64 %t106, i64* %reg_29_ptr
  %t107 = load i64, i64* %reg_29_ptr
  store i64 %t107, i64* %var_best_ptr
  br label %sort_rows_b13
sort_rows_b12:
  br label %sort_rows_b13
sort_rows_b13:
  br label %sort_rows_b10
sort_rows_b14:
  %t108 = load i64, i64* %var_i_ptr
  store i64 %t108, i64* %reg_33_ptr
  %t109 = load i64, i64* %reg_33_ptr
  store i64 %t109, i64* %var_best_ptr
  br label %sort_rows_b16
sort_rows_b15:
  br label %sort_rows_b16
sort_rows_b16:
  br label %sort_rows_b10
}

define i64 @sum_of(i8* %arg0, i8* %arg1) {
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
  %var_row_ptr = alloca i8*
  %var___iter_idx_3_ptr = alloca i64
  %var_total_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
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
  %t18 = call i8* @obo_value_as_mixed_list_ptr(i8* %t15)
  %t17 = call i8* @obo_mixed_list_get(i8* %t18, i64 %t16)
  store i8* %t17, i8** %reg_7_ptr
  %t19 = load i8*, i8** %reg_7_ptr
  store i8* %t19, i8** %var_row_ptr
  %t20 = load i64, i64* %var_total_ptr
  store i64 %t20, i64* %reg_8_ptr
  %t21 = load i8*, i8** %var_row_ptr
  store i8* %t21, i8** %reg_9_ptr
  %t22 = load i8*, i8** %reg_9_ptr
  %t23 = call i8* @obo_value_as_entity_ptr(i8* %t22)
  %t24 = call i8* @obo_entity_get_boxed(i8* %t23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t24, i8** %reg_10_ptr
  %t25 = load i8*, i8** %var_column_ptr
  store i8* %t25, i8** %reg_11_ptr
  %t26 = load i8*, i8** %reg_10_ptr
  %t27 = load i8*, i8** %reg_11_ptr
  %t29 = call i8* @obo_value_as_map_ptr(i8* %t26)
  %t28 = call i8* @obo_map_get_boxed(i8* %t29, i8* %t27)
  store i8* %t28, i8** %reg_12_ptr
  %t30 = load i64, i64* %reg_8_ptr
  %t31 = load i8*, i8** %reg_12_ptr
  %t32 = call i64 @obo_value_as_i64(i8* %t31)
  %t33 = add i64 %t30, %t32
  store i64 %t33, i64* %reg_13_ptr
  %t34 = load i64, i64* %reg_13_ptr
  store i64 %t34, i64* %var_total_ptr
  br label %sum_of_b3
sum_of_b3:
  %t35 = load i64, i64* %var___iter_idx_3_ptr
  store i64 %t35, i64* %reg_14_ptr
  %t36 = load i64, i64* %reg_14_ptr
  %t37 = add i64 %t36, 1
  store i64 %t37, i64* %reg_15_ptr
  %t38 = load i64, i64* %reg_15_ptr
  store i64 %t38, i64* %var___iter_idx_3_ptr
  br label %sum_of_b1
sum_of_b4:
  %t39 = load i64, i64* %var_total_ptr
  store i64 %t39, i64* %reg_16_ptr
  %t40 = load i64, i64* %reg_16_ptr
  call void @obo_gc_pop_roots(i64 11)
  ret i64 %t40
}

define i64 @avg_of(i8* %arg0, i8* %arg1) {
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
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
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
  call void @obo_gc_pop_roots(i64 8)
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
  call void @obo_gc_pop_roots(i64 8)
  ret i64 %t23
}

define i8* @min_of(i8* %arg0, i8* %arg1) {
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
  %var___iter_idx_11_ptr = alloca i64
  %var_best_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  %var_v_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %var_best_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_v_ptr)
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
  call void @obo_gc_pop_roots(i64 23)
  ret i8* %t12
min_of_b2:
  br label %min_of_b3
min_of_b3:
  %t13 = load i8*, i8** %var_rows_ptr
  store i8* %t13, i8** %reg_5_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t16 = call i8* @obo_value_as_mixed_list_ptr(i8* %t14)
  %t15 = call i8* @obo_mixed_list_get(i8* %t16, i64 0)
  store i8* %t15, i8** %reg_6_ptr
  %t17 = load i8*, i8** %reg_6_ptr
  %t18 = call i8* @obo_value_as_entity_ptr(i8* %t17)
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t19, i8** %reg_7_ptr
  %t20 = load i8*, i8** %var_column_ptr
  store i8* %t20, i8** %reg_8_ptr
  %t21 = load i8*, i8** %reg_7_ptr
  %t22 = load i8*, i8** %reg_8_ptr
  %t24 = call i8* @obo_value_as_map_ptr(i8* %t21)
  %t23 = call i8* @obo_map_get_boxed(i8* %t24, i8* %t22)
  store i8* %t23, i8** %reg_9_ptr
  %t25 = load i8*, i8** %reg_9_ptr
  store i8* %t25, i8** %var_best_ptr
  %t26 = load i8*, i8** %var_rows_ptr
  store i8* %t26, i8** %reg_10_ptr
  store i64 0, i64* %var___iter_idx_11_ptr
  %t27 = load i8*, i8** %reg_10_ptr
  %t28 = call i64 @obo_value_len(i8* %t27)
  store i64 %t28, i64* %reg_11_ptr
  br label %min_of_b4
min_of_b4:
  %t29 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t29, i64* %reg_12_ptr
  %t30 = load i64, i64* %reg_12_ptr
  %t31 = load i64, i64* %reg_11_ptr
  %t32 = icmp slt i64 %t30, %t31
  %t33 = zext i1 %t32 to i64
  store i64 %t33, i64* %reg_13_ptr
  %t34 = load i64, i64* %reg_13_ptr
  %t36 = icmp ne i64 %t34, 0
  %t37 = zext i1 %t36 to i64
  %t35 = icmp ne i64 %t37, 0
  br i1 %t35, label %min_of_b5, label %min_of_b7
min_of_b5:
  %t38 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t38, i64* %reg_14_ptr
  %t39 = load i8*, i8** %reg_10_ptr
  %t40 = load i64, i64* %reg_14_ptr
  %t42 = call i8* @obo_value_as_mixed_list_ptr(i8* %t39)
  %t41 = call i8* @obo_mixed_list_get(i8* %t42, i64 %t40)
  store i8* %t41, i8** %reg_15_ptr
  %t43 = load i8*, i8** %reg_15_ptr
  store i8* %t43, i8** %var_row_ptr
  %t44 = load i8*, i8** %var_row_ptr
  store i8* %t44, i8** %reg_16_ptr
  %t45 = load i8*, i8** %reg_16_ptr
  %t46 = call i8* @obo_value_as_entity_ptr(i8* %t45)
  %t47 = call i8* @obo_entity_get_boxed(i8* %t46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t47, i8** %reg_17_ptr
  %t48 = load i8*, i8** %var_column_ptr
  store i8* %t48, i8** %reg_18_ptr
  %t49 = load i8*, i8** %reg_17_ptr
  %t50 = load i8*, i8** %reg_18_ptr
  %t52 = call i8* @obo_value_as_map_ptr(i8* %t49)
  %t51 = call i8* @obo_map_get_boxed(i8* %t52, i8* %t50)
  store i8* %t51, i8** %reg_19_ptr
  %t53 = load i8*, i8** %reg_19_ptr
  store i8* %t53, i8** %var_v_ptr
  %t54 = load i8*, i8** %var_v_ptr
  store i8* %t54, i8** %reg_20_ptr
  %t55 = load i8*, i8** %var_best_ptr
  store i8* %t55, i8** %reg_21_ptr
  %t56 = load i8*, i8** %reg_20_ptr
  %t57 = load i8*, i8** %reg_21_ptr
  %t58 = load i64, i64* %reg_22_ptr
  %t60 = icmp ne i64 %t58, 0
  %t61 = zext i1 %t60 to i64
  %t59 = icmp ne i64 %t61, 0
  br i1 %t59, label %min_of_b8, label %min_of_b9
min_of_b6:
  %t62 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t62, i64* %reg_24_ptr
  %t63 = load i64, i64* %reg_24_ptr
  %t64 = add i64 %t63, 1
  store i64 %t64, i64* %reg_25_ptr
  %t65 = load i64, i64* %reg_25_ptr
  store i64 %t65, i64* %var___iter_idx_11_ptr
  br label %min_of_b4
min_of_b7:
  %t66 = load i8*, i8** %var_best_ptr
  store i8* %t66, i8** %reg_26_ptr
  %t67 = load i8*, i8** %reg_26_ptr
  call void @obo_gc_pop_roots(i64 23)
  ret i8* %t67
min_of_b8:
  %t68 = load i8*, i8** %var_v_ptr
  store i8* %t68, i8** %reg_23_ptr
  %t69 = load i8*, i8** %reg_23_ptr
  store i8* %t69, i8** %var_best_ptr
  br label %min_of_b10
min_of_b9:
  br label %min_of_b10
min_of_b10:
  br label %min_of_b6
}

define i64 @max_of(i8* %arg0, i8* %arg1) {
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
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %var_v_ptr = alloca i64
  %var_best_ptr = alloca i64
  %var_rows_ptr = alloca i8*
  %var___iter_idx_12_ptr = alloca i64
  %var_row_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
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
  call void @obo_gc_pop_roots(i64 17)
  ret i64 0
max_of_b2:
  br label %max_of_b3
max_of_b3:
  %t12 = load i8*, i8** %var_rows_ptr
  store i8* %t12, i8** %reg_5_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @obo_value_as_mixed_list_ptr(i8* %t13)
  %t14 = call i8* @obo_mixed_list_get(i8* %t15, i64 0)
  store i8* %t14, i8** %reg_6_ptr
  %t16 = load i8*, i8** %reg_6_ptr
  %t17 = call i8* @obo_value_as_entity_ptr(i8* %t16)
  %t18 = call i8* @obo_entity_get_boxed(i8* %t17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t18, i8** %reg_7_ptr
  %t19 = load i8*, i8** %var_column_ptr
  store i8* %t19, i8** %reg_8_ptr
  %t20 = load i8*, i8** %reg_7_ptr
  %t21 = load i8*, i8** %reg_8_ptr
  %t23 = call i8* @obo_value_as_map_ptr(i8* %t20)
  %t22 = call i8* @obo_map_get_boxed(i8* %t23, i8* %t21)
  store i8* %t22, i8** %reg_9_ptr
  %t24 = load i8*, i8** %reg_9_ptr
  %t25 = call i64 @obo_value_as_i64(i8* %t24)
  %t26 = sub i64 0, %t25
  store i64 %t26, i64* %reg_10_ptr
  %t27 = load i64, i64* %reg_10_ptr
  store i64 %t27, i64* %var_best_ptr
  %t28 = load i8*, i8** %var_rows_ptr
  store i8* %t28, i8** %reg_11_ptr
  store i64 0, i64* %var___iter_idx_12_ptr
  %t29 = load i8*, i8** %reg_11_ptr
  %t30 = call i64 @obo_value_len(i8* %t29)
  store i64 %t30, i64* %reg_12_ptr
  br label %max_of_b4
max_of_b4:
  %t31 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t31, i64* %reg_13_ptr
  %t32 = load i64, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_12_ptr
  %t34 = icmp slt i64 %t32, %t33
  %t35 = zext i1 %t34 to i64
  store i64 %t35, i64* %reg_14_ptr
  %t36 = load i64, i64* %reg_14_ptr
  %t38 = icmp ne i64 %t36, 0
  %t39 = zext i1 %t38 to i64
  %t37 = icmp ne i64 %t39, 0
  br i1 %t37, label %max_of_b5, label %max_of_b7
max_of_b5:
  %t40 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t40, i64* %reg_15_ptr
  %t41 = load i8*, i8** %reg_11_ptr
  %t42 = load i64, i64* %reg_15_ptr
  %t44 = call i8* @obo_value_as_mixed_list_ptr(i8* %t41)
  %t43 = call i8* @obo_mixed_list_get(i8* %t44, i64 %t42)
  store i8* %t43, i8** %reg_16_ptr
  %t45 = load i8*, i8** %reg_16_ptr
  store i8* %t45, i8** %var_row_ptr
  %t46 = load i8*, i8** %var_row_ptr
  store i8* %t46, i8** %reg_17_ptr
  %t47 = load i8*, i8** %reg_17_ptr
  %t48 = call i8* @obo_value_as_entity_ptr(i8* %t47)
  %t49 = call i8* @obo_entity_get_boxed(i8* %t48, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t49, i8** %reg_18_ptr
  %t50 = load i8*, i8** %var_column_ptr
  store i8* %t50, i8** %reg_19_ptr
  %t51 = load i8*, i8** %reg_18_ptr
  %t52 = load i8*, i8** %reg_19_ptr
  %t54 = call i8* @obo_value_as_map_ptr(i8* %t51)
  %t53 = call i8* @obo_map_get_boxed(i8* %t54, i8* %t52)
  store i8* %t53, i8** %reg_20_ptr
  %t55 = load i8*, i8** %reg_20_ptr
  %t56 = call i64 @obo_value_as_i64(i8* %t55)
  %t57 = sub i64 0, %t56
  store i64 %t57, i64* %reg_21_ptr
  %t58 = load i64, i64* %reg_21_ptr
  store i64 %t58, i64* %var_v_ptr
  %t59 = load i64, i64* %var_v_ptr
  store i64 %t59, i64* %reg_22_ptr
  %t60 = load i64, i64* %var_best_ptr
  store i64 %t60, i64* %reg_23_ptr
  %t61 = load i64, i64* %reg_22_ptr
  %t62 = load i64, i64* %reg_23_ptr
  %t63 = icmp slt i64 %t61, %t62
  %t64 = zext i1 %t63 to i64
  store i64 %t64, i64* %reg_24_ptr
  %t65 = load i64, i64* %reg_24_ptr
  %t67 = icmp ne i64 %t65, 0
  %t68 = zext i1 %t67 to i64
  %t66 = icmp ne i64 %t68, 0
  br i1 %t66, label %max_of_b8, label %max_of_b9
max_of_b6:
  %t69 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t69, i64* %reg_26_ptr
  %t70 = load i64, i64* %reg_26_ptr
  %t71 = add i64 %t70, 1
  store i64 %t71, i64* %reg_27_ptr
  %t72 = load i64, i64* %reg_27_ptr
  store i64 %t72, i64* %var___iter_idx_12_ptr
  br label %max_of_b4
max_of_b7:
  %t73 = load i64, i64* %var_best_ptr
  store i64 %t73, i64* %reg_28_ptr
  %t74 = load i64, i64* %reg_28_ptr
  %t75 = sub i64 0, %t74
  store i64 %t75, i64* %reg_29_ptr
  %t76 = load i64, i64* %reg_29_ptr
  call void @obo_gc_pop_roots(i64 17)
  ret i64 %t76
max_of_b8:
  %t77 = load i64, i64* %var_v_ptr
  store i64 %t77, i64* %reg_25_ptr
  %t78 = load i64, i64* %reg_25_ptr
  store i64 %t78, i64* %var_best_ptr
  br label %max_of_b10
max_of_b9:
  br label %max_of_b10
max_of_b10:
  br label %max_of_b6
}

define i8* @group_by(i8* %arg0, i8* %arg1) {
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
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i8*
  %var_key_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  %var___iter_idx_5_ptr = alloca i64
  %var_groups_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
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
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_37_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_39_ptr)
  call void @obo_gc_push_root(i8** %var_key_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_groups_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_keys_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_rows_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.2, i64 0, i64 0), i64 0)
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
  %t22 = call i8* @obo_value_as_mixed_list_ptr(i8* %t19)
  %t21 = call i8* @obo_mixed_list_get(i8* %t22, i64 %t20)
  store i8* %t21, i8** %reg_9_ptr
  %t23 = load i8*, i8** %reg_9_ptr
  store i8* %t23, i8** %var_row_ptr
  %t24 = load i8*, i8** %var_row_ptr
  store i8* %t24, i8** %reg_10_ptr
  %t25 = load i8*, i8** %reg_10_ptr
  %t26 = call i8* @obo_value_as_entity_ptr(i8* %t25)
  %t27 = call i8* @obo_entity_get_boxed(i8* %t26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t27, i8** %reg_11_ptr
  %t28 = load i8*, i8** %var_column_ptr
  store i8* %t28, i8** %reg_12_ptr
  %t29 = load i8*, i8** %reg_11_ptr
  %t30 = load i8*, i8** %reg_12_ptr
  %t32 = call i8* @obo_value_as_map_ptr(i8* %t29)
  %t31 = call i8* @obo_map_get_boxed(i8* %t32, i8* %t30)
  store i8* %t31, i8** %reg_13_ptr
  %t33 = load i8*, i8** %reg_13_ptr
  %t34 = call i8* @obo_value_to_str(i8* %t33)
  %t35 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t34)
  store i8* %t35, i8** %reg_14_ptr
  %t36 = load i8*, i8** %reg_14_ptr
  store i8* %t36, i8** %var_key_ptr
  %t37 = load i8*, i8** %var_key_ptr
  store i8* %t37, i8** %reg_15_ptr
  %t38 = load i8*, i8** %var_groups_ptr
  store i8* %t38, i8** %reg_16_ptr
  %t39 = load i8*, i8** %reg_16_ptr
  %t40 = load i8*, i8** %reg_15_ptr
  %t41 = call i64 @obo_map_has(i8* %t39, i8* %t40)
  store i64 %t41, i64* %reg_17_ptr
  %t42 = load i64, i64* %reg_17_ptr
  %t44 = icmp ne i64 %t42, 0
  %t45 = zext i1 %t44 to i64
  %t43 = icmp ne i64 %t45, 0
  br i1 %t43, label %group_by_b5, label %group_by_b6
group_by_b3:
  %t46 = load i64, i64* %var___iter_idx_5_ptr
  store i64 %t46, i64* %reg_34_ptr
  %t47 = load i64, i64* %reg_34_ptr
  %t48 = add i64 %t47, 1
  store i64 %t48, i64* %reg_35_ptr
  %t49 = load i64, i64* %reg_35_ptr
  store i64 %t49, i64* %var___iter_idx_5_ptr
  br label %group_by_b1
group_by_b4:
  %t50 = load i8*, i8** %var_groups_ptr
  store i8* %t50, i8** %reg_36_ptr
  %t51 = load i8*, i8** %reg_36_ptr
  %t52 = call i8* @obo_map_remove(i8* %t51, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.2, i64 0, i64 0))
  store i8* %t52, i8** %reg_37_ptr
  %t53 = load i8*, i8** %reg_37_ptr
  store i8* %t53, i8** %var_groups_ptr
  %t54 = load i8*, i8** %var_groups_ptr
  store i8* %t54, i8** %reg_38_ptr
  %t55 = load i8*, i8** %var_keys_ptr
  store i8* %t55, i8** %reg_39_ptr
  %t56 = call i8* @obo_mixed_list_new(i64 2)
  %t57 = load i8*, i8** %reg_38_ptr
  %t58 = call i8* @obo_box_map(i8* %t57)
  call void @obo_mixed_list_set(i8* %t56, i64 0, i8* %t58)
  %t59 = load i8*, i8** %reg_39_ptr
  %t60 = call i8* @obo_box_list(i8* %t59)
  call void @obo_mixed_list_set(i8* %t56, i64 1, i8* %t60)
  call void @obo_gc_pop_roots(i64 39)
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

define i8* @Table_create(i8* %arg0, i8* %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %var_tname_ptr = alloca i8*
  %var_cols_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %var_tname_ptr)
  call void @obo_gc_push_root(i8** %var_cols_ptr)
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
  %t5 = call i8* @obo_entity_new(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.43, i64 0, i64 0))
  %t6 = load i8*, i8** %reg_2_ptr
  call void @obo_entity_put_boxed(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0), i8* %t6)
  %t7 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_boxed(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0), i8* %t7)
  %t8 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t8)
  call void @obo_entity_put_i64(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.46, i64 0, i64 0), i64 1)
  store i8* %t5, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  call void @obo_gc_pop_roots(i64 8)
  ret i8* %t9
}

define i8* @Table_insert(i8* %arg0, i8* %arg1) {
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
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %var_record_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_r_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
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
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %var_record_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_record_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.46, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %var_record_ptr
  store i8* %t5, i8** %reg_4_ptr
  %t6 = call i8* @obo_entity_new(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.47, i64 0, i64 0))
  %t7 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_boxed(i8* %t6, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.48, i64 0, i64 0), i8* %t7)
  %t8 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_map(i8* %t6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0), i8* %t8)
  store i8* %t6, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  store i8* %t9, i8** %var_r_ptr
  %t10 = load i8*, i8** %var_r_ptr
  store i8* %t10, i8** %reg_6_ptr
  %t11 = load i8*, i8** %var_self_ptr
  store i8* %t11, i8** %reg_7_ptr
  %t12 = load i8*, i8** %reg_7_ptr
  %t13 = call i8* @obo_entity_get_boxed(i8* %t12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t13, i8** %reg_8_ptr
  %t14 = load i8*, i8** %reg_8_ptr
  %t15 = call i8* @obo_value_as_mixed_list_ptr(i8* %t14)
  %t16 = load i8*, i8** %reg_6_ptr
  %t17 = call i8* @obo_box_entity(i8* %t16)
  %t18 = call i8* @obo_mixed_list_add(i8* %t15, i8* %t17)
  %t19 = call i8* @obo_box_list(i8* %t18)
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %var_self_ptr
  store i8* %t20, i8** %reg_10_ptr
  %t21 = load i8*, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_9_ptr
  call void @obo_entity_put_boxed(i8* %t21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t22)
  %t23 = load i8*, i8** %var_self_ptr
  store i8* %t23, i8** %reg_11_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @obo_entity_get_boxed(i8* %t24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.46, i64 0, i64 0))
  store i8* %t25, i8** %reg_12_ptr
  %t26 = load i8*, i8** %reg_12_ptr
  %t27 = call i64 @obo_value_as_i64(i8* %t26)
  %t28 = add i64 %t27, 1
  store i64 %t28, i64* %reg_13_ptr
  %t29 = load i8*, i8** %var_self_ptr
  store i8* %t29, i8** %reg_14_ptr
  %t30 = load i8*, i8** %reg_14_ptr
  %t31 = load i64, i64* %reg_13_ptr
  call void @obo_entity_put_i64(i8* %t30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.46, i64 0, i64 0), i64 %t31)
  %t32 = load i8*, i8** %var_r_ptr
  store i8* %t32, i8** %reg_15_ptr
  %t33 = load i8*, i8** %reg_15_ptr
  %t34 = call i8* @obo_entity_get_boxed(i8* %t33, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t34, i8** %reg_16_ptr
  %t35 = load i8*, i8** %reg_16_ptr
  call void @obo_gc_pop_roots(i64 19)
  ret i8* %t35
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
  %var_pred_ptr = alloca i8*
  %var_result_table_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_filtered_ptr = alloca i8*
  %var_current_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
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
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_result_table_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_filtered_ptr)
  call void @obo_gc_push_root(i8** %var_current_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t16 = call i8* @obo_entity_get_boxed(i8* %t15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %var_self_ptr
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %reg_8_ptr
  %t21 = load i8*, i8** %reg_10_ptr
  %t22 = call i8* @Table_create(i8* %t20, i8* %t21)
  store i8* %t22, i8** %reg_11_ptr
  %t23 = load i8*, i8** %reg_11_ptr
  store i8* %t23, i8** %var_result_table_ptr
  %t24 = load i8*, i8** %var_filtered_ptr
  store i8* %t24, i8** %reg_12_ptr
  %t25 = load i8*, i8** %var_result_table_ptr
  store i8* %t25, i8** %reg_13_ptr
  %t26 = load i8*, i8** %reg_13_ptr
  %t27 = load i8*, i8** %reg_12_ptr
  call void @obo_entity_put_boxed(i8* %t26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t27)
  %t28 = load i8*, i8** %var_result_table_ptr
  store i8* %t28, i8** %reg_14_ptr
  %t29 = load i8*, i8** %reg_14_ptr
  call void @obo_gc_pop_roots(i64 20)
  ret i8* %t29
}

define i8* @Table_order_by(i8* %arg0, i8* %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
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
  %var_ascending_ptr = alloca i64
  %var_column_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
  %var_result_table_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_sorted_ptr)
  call void @obo_gc_push_root(i8** %var_result_table_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_column_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_ascending_ptr
  %t3 = load i8*, i8** %var_self_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t5, i8** %reg_4_ptr
  %t6 = load i8*, i8** %var_column_ptr
  store i8* %t6, i8** %reg_5_ptr
  %t7 = load i64, i64* %var_ascending_ptr
  store i64 %t7, i64* %reg_6_ptr
  %t8 = load i8*, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  %t10 = load i64, i64* %reg_6_ptr
  %t11 = call i8* @sort_rows(i8* %t8, i8* %t9, i64 %t10)
  store i8* %t11, i8** %reg_7_ptr
  %t12 = load i8*, i8** %reg_7_ptr
  store i8* %t12, i8** %var_sorted_ptr
  %t13 = load i8*, i8** %var_self_ptr
  store i8* %t13, i8** %reg_8_ptr
  %t14 = load i8*, i8** %reg_8_ptr
  %t15 = call i8* @obo_entity_get_boxed(i8* %t14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t15, i8** %reg_9_ptr
  %t16 = load i8*, i8** %var_self_ptr
  store i8* %t16, i8** %reg_10_ptr
  %t17 = load i8*, i8** %reg_10_ptr
  %t18 = call i8* @obo_entity_get_boxed(i8* %t17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t18, i8** %reg_11_ptr
  %t19 = load i8*, i8** %reg_9_ptr
  %t20 = load i8*, i8** %reg_11_ptr
  %t21 = call i8* @Table_create(i8* %t19, i8* %t20)
  store i8* %t21, i8** %reg_12_ptr
  %t22 = load i8*, i8** %reg_12_ptr
  store i8* %t22, i8** %var_result_table_ptr
  %t23 = load i8*, i8** %var_sorted_ptr
  store i8* %t23, i8** %reg_13_ptr
  %t24 = load i8*, i8** %var_result_table_ptr
  store i8* %t24, i8** %reg_14_ptr
  %t25 = load i8*, i8** %reg_14_ptr
  %t26 = load i8*, i8** %reg_13_ptr
  call void @obo_entity_put_list(i8* %t25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t26)
  %t27 = load i8*, i8** %var_result_table_ptr
  store i8* %t27, i8** %reg_15_ptr
  %t28 = load i8*, i8** %reg_15_ptr
  call void @obo_gc_pop_roots(i64 18)
  ret i8* %t28
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
  %var_updater_ptr = alloca i8*
  %var_current_ptr = alloca i8*
  %var___iter_idx_7_ptr = alloca i64
  %var_r_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_new_rows_ptr = alloca i8*
  %var_changed_ptr = alloca i64
  %var_new_data_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
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
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %var_updater_ptr)
  call void @obo_gc_push_root(i8** %var_current_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_new_rows_ptr)
  call void @obo_gc_push_root(i8** %var_new_data_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_updater_ptr
  %t3 = load i8*, i8** %var_self_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t25 = call i8* @obo_value_as_mixed_list_ptr(i8* %t22)
  %t24 = call i8* @obo_mixed_list_get(i8* %t25, i64 %t23)
  store i8* %t24, i8** %reg_11_ptr
  %t26 = load i8*, i8** %reg_11_ptr
  store i8* %t26, i8** %var_r_ptr
  %t27 = load i8*, i8** %var_r_ptr
  store i8* %t27, i8** %reg_12_ptr
  %t28 = load i8*, i8** %var_pred_ptr
  store i8* %t28, i8** %reg_13_ptr
  %t29 = load i8*, i8** %reg_13_ptr
  %t30 = load i8*, i8** %reg_12_ptr
  %t31 = call i64 @obo_value_to_closure_arg_boxed(i8* %t30)
  %t32 = call i64 @obo_closure_call_1(i8* %t29, i64 %t31)
  store i64 %t32, i64* %reg_14_ptr
  %t33 = load i64, i64* %reg_14_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %Table_update_where_b5, label %Table_update_where_b6
Table_update_where_b3:
  %t37 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t37, i64* %reg_30_ptr
  %t38 = load i64, i64* %reg_30_ptr
  %t39 = add i64 %t38, 1
  store i64 %t39, i64* %reg_31_ptr
  %t40 = load i64, i64* %reg_31_ptr
  store i64 %t40, i64* %var___iter_idx_7_ptr
  br label %Table_update_where_b1
Table_update_where_b4:
  %t41 = load i8*, i8** %var_new_rows_ptr
  store i8* %t41, i8** %reg_32_ptr
  %t42 = load i8*, i8** %var_self_ptr
  store i8* %t42, i8** %reg_33_ptr
  %t43 = load i8*, i8** %reg_33_ptr
  %t44 = load i8*, i8** %reg_32_ptr
  call void @obo_entity_put_list(i8* %t43, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t44)
  %t45 = load i64, i64* %var_changed_ptr
  store i64 %t45, i64* %reg_34_ptr
  %t46 = load i64, i64* %reg_34_ptr
  call void @obo_gc_pop_roots(i64 32)
  ret i64 %t46
Table_update_where_b5:
  %t47 = load i8*, i8** %var_r_ptr
  store i8* %t47, i8** %reg_15_ptr
  %t48 = load i8*, i8** %reg_15_ptr
  %t49 = call i8* @obo_value_as_entity_ptr(i8* %t48)
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t50, i8** %reg_16_ptr
  %t51 = load i8*, i8** %var_updater_ptr
  store i8* %t51, i8** %reg_17_ptr
  %t52 = load i8*, i8** %reg_17_ptr
  %t53 = load i8*, i8** %reg_16_ptr
  %t54 = call i64 @obo_value_to_closure_arg_boxed(i8* %t53)
  %t55 = call i64 @obo_closure_call_1(i8* %t52, i64 %t54)
  %t56 = inttoptr i64 %t55 to i8*
  store i8* %t56, i8** %reg_18_ptr
  %t57 = load i8*, i8** %reg_18_ptr
  store i8* %t57, i8** %var_new_data_ptr
  %t58 = load i8*, i8** %var_r_ptr
  store i8* %t58, i8** %reg_19_ptr
  %t59 = load i8*, i8** %reg_19_ptr
  %t60 = call i8* @obo_value_as_entity_ptr(i8* %t59)
  %t61 = call i8* @obo_entity_get_boxed(i8* %t60, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t61, i8** %reg_20_ptr
  %t62 = load i8*, i8** %var_new_data_ptr
  store i8* %t62, i8** %reg_21_ptr
  %t63 = call i8* @obo_entity_new(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.47, i64 0, i64 0))
  %t64 = load i8*, i8** %reg_20_ptr
  call void @obo_entity_put_boxed(i8* %t63, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.48, i64 0, i64 0), i8* %t64)
  %t65 = load i8*, i8** %reg_21_ptr
  call void @obo_entity_put_map(i8* %t63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0), i8* %t65)
  store i8* %t63, i8** %reg_22_ptr
  %t66 = load i8*, i8** %var_new_rows_ptr
  store i8* %t66, i8** %reg_23_ptr
  %t67 = load i8*, i8** %reg_23_ptr
  %t68 = load i8*, i8** %reg_22_ptr
  %t69 = call i8* @obo_box_entity(i8* %t68)
  %t70 = call i8* @obo_mixed_list_add(i8* %t67, i8* %t69)
  store i8* %t70, i8** %reg_24_ptr
  %t71 = load i8*, i8** %reg_24_ptr
  store i8* %t71, i8** %var_new_rows_ptr
  %t72 = load i64, i64* %var_changed_ptr
  store i64 %t72, i64* %reg_25_ptr
  %t73 = load i64, i64* %reg_25_ptr
  %t74 = add i64 %t73, 1
  store i64 %t74, i64* %reg_26_ptr
  %t75 = load i64, i64* %reg_26_ptr
  store i64 %t75, i64* %var_changed_ptr
  br label %Table_update_where_b7
Table_update_where_b6:
  %t76 = load i8*, i8** %var_r_ptr
  store i8* %t76, i8** %reg_27_ptr
  %t77 = load i8*, i8** %var_new_rows_ptr
  store i8* %t77, i8** %reg_28_ptr
  %t78 = load i8*, i8** %reg_28_ptr
  %t79 = load i8*, i8** %reg_27_ptr
  %t80 = call i8* @obo_mixed_list_add(i8* %t78, i8* %t79)
  store i8* %t80, i8** %reg_29_ptr
  %t81 = load i8*, i8** %reg_29_ptr
  store i8* %t81, i8** %var_new_rows_ptr
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
  %var_before_ptr = alloca i64
  %var_current_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var___iter_idx_9_ptr = alloca i64
  %var_match_ptr = alloca i64
  %var_kept_ptr = alloca i8*
  %var_r_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %var_current_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_kept_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  %t6 = call i64 @obo_value_len(i8* %t5)
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  store i64 %t7, i64* %var_before_ptr
  %t8 = load i8*, i8** %var_self_ptr
  store i8* %t8, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  %t10 = call i8* @obo_entity_get_boxed(i8* %t9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t30 = call i8* @obo_value_as_mixed_list_ptr(i8* %t27)
  %t29 = call i8* @obo_mixed_list_get(i8* %t30, i64 %t28)
  store i8* %t29, i8** %reg_13_ptr
  %t31 = load i8*, i8** %reg_13_ptr
  store i8* %t31, i8** %var_r_ptr
  %t32 = load i8*, i8** %var_r_ptr
  store i8* %t32, i8** %reg_14_ptr
  %t33 = load i8*, i8** %var_pred_ptr
  store i8* %t33, i8** %reg_15_ptr
  %t34 = load i8*, i8** %reg_15_ptr
  %t35 = load i8*, i8** %reg_14_ptr
  %t36 = call i64 @obo_value_to_closure_arg_boxed(i8* %t35)
  %t37 = call i64 @obo_closure_call_1(i8* %t34, i64 %t36)
  store i64 %t37, i64* %reg_16_ptr
  %t38 = load i64, i64* %reg_16_ptr
  store i64 %t38, i64* %var_match_ptr
  %t39 = load i64, i64* %var_match_ptr
  store i64 %t39, i64* %reg_17_ptr
  %t40 = load i64, i64* %reg_17_ptr
  %t41 = icmp ne i64 %t40, 0
  %t42 = zext i1 %t41 to i64
  %t43 = icmp eq i64 %t42, 0
  %t44 = zext i1 %t43 to i64
  store i64 %t44, i64* %reg_18_ptr
  %t45 = load i64, i64* %reg_18_ptr
  %t47 = icmp ne i64 %t45, 0
  %t48 = zext i1 %t47 to i64
  %t46 = icmp ne i64 %t48, 0
  br i1 %t46, label %Table_delete_where_b5, label %Table_delete_where_b6
Table_delete_where_b3:
  %t49 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t49, i64* %reg_22_ptr
  %t50 = load i64, i64* %reg_22_ptr
  %t51 = add i64 %t50, 1
  store i64 %t51, i64* %reg_23_ptr
  %t52 = load i64, i64* %reg_23_ptr
  store i64 %t52, i64* %var___iter_idx_9_ptr
  br label %Table_delete_where_b1
Table_delete_where_b4:
  %t53 = load i8*, i8** %var_kept_ptr
  store i8* %t53, i8** %reg_24_ptr
  %t54 = load i8*, i8** %var_self_ptr
  store i8* %t54, i8** %reg_25_ptr
  %t55 = load i8*, i8** %reg_25_ptr
  %t56 = load i8*, i8** %reg_24_ptr
  call void @obo_entity_put_list(i8* %t55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0), i8* %t56)
  %t57 = load i64, i64* %var_before_ptr
  store i64 %t57, i64* %reg_26_ptr
  %t58 = load i8*, i8** %var_self_ptr
  store i8* %t58, i8** %reg_27_ptr
  %t59 = load i8*, i8** %reg_27_ptr
  %t60 = call i8* @obo_entity_get_boxed(i8* %t59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t60, i8** %reg_28_ptr
  %t61 = load i8*, i8** %reg_28_ptr
  %t62 = call i64 @obo_value_len(i8* %t61)
  store i64 %t62, i64* %reg_29_ptr
  %t63 = load i64, i64* %reg_26_ptr
  %t64 = load i64, i64* %reg_29_ptr
  %t65 = sub i64 %t63, %t64
  store i64 %t65, i64* %reg_30_ptr
  %t66 = load i64, i64* %reg_30_ptr
  call void @obo_gc_pop_roots(i64 23)
  ret i64 %t66
Table_delete_where_b5:
  %t67 = load i8*, i8** %var_r_ptr
  store i8* %t67, i8** %reg_19_ptr
  %t68 = load i8*, i8** %var_kept_ptr
  store i8* %t68, i8** %reg_20_ptr
  %t69 = load i8*, i8** %reg_20_ptr
  %t70 = load i8*, i8** %reg_19_ptr
  %t71 = call i8* @obo_mixed_list_add(i8* %t69, i8* %t70)
  store i8* %t71, i8** %reg_21_ptr
  %t72 = load i8*, i8** %reg_21_ptr
  store i8* %t72, i8** %var_kept_ptr
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
  %var_self_ptr = alloca i8*
  %var_r_ptr = alloca i8*
  %var___iter_idx_4_ptr = alloca i64
  %var_pred_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t20 = call i8* @obo_value_as_mixed_list_ptr(i8* %t17)
  %t19 = call i8* @obo_mixed_list_get(i8* %t20, i64 %t18)
  store i8* %t19, i8** %reg_8_ptr
  %t21 = load i8*, i8** %reg_8_ptr
  store i8* %t21, i8** %var_r_ptr
  %t22 = load i8*, i8** %var_r_ptr
  store i8* %t22, i8** %reg_9_ptr
  %t23 = load i8*, i8** %var_pred_ptr
  store i8* %t23, i8** %reg_10_ptr
  %t24 = load i8*, i8** %reg_10_ptr
  %t25 = load i8*, i8** %reg_9_ptr
  %t26 = call i64 @obo_value_to_closure_arg_boxed(i8* %t25)
  %t27 = call i64 @obo_closure_call_1(i8* %t24, i64 %t26)
  store i64 %t27, i64* %reg_11_ptr
  %t28 = load i64, i64* %reg_11_ptr
  %t30 = icmp ne i64 %t28, 0
  %t31 = zext i1 %t30 to i64
  %t29 = icmp ne i64 %t31, 0
  br i1 %t29, label %Table_find_first_b5, label %Table_find_first_b6
Table_find_first_b3:
  %t32 = load i64, i64* %var___iter_idx_4_ptr
  store i64 %t32, i64* %reg_13_ptr
  %t33 = load i64, i64* %reg_13_ptr
  %t34 = add i64 %t33, 1
  store i64 %t34, i64* %reg_14_ptr
  %t35 = load i64, i64* %reg_14_ptr
  store i64 %t35, i64* %var___iter_idx_4_ptr
  br label %Table_find_first_b1
Table_find_first_b4:
  %t36 = call i8* @obo_box_null()
  call void @obo_gc_pop_roots(i64 11)
  ret i8* %t36
Table_find_first_b5:
  %t37 = load i8*, i8** %var_r_ptr
  store i8* %t37, i8** %reg_12_ptr
  %t38 = load i8*, i8** %reg_12_ptr
  call void @obo_gc_pop_roots(i64 11)
  ret i8* %t38
Table_find_first_b6:
  br label %Table_find_first_b7
Table_find_first_b7:
  br label %Table_find_first_b3
}

define i8* @build_table(i64 %arg0) {
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
  %var_n_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_departments_ptr = alloca i8*
  %var_levels_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  store i64 %arg0, i64* %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %var_departments_ptr)
  call void @obo_gc_push_root(i8** %var_levels_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = load i64, i64* %reg_0_ptr
  store i64 %t0, i64* %var_n_ptr
  %t1 = call i8* @obo_mixed_list_new(i64 8)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.8, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 0, i8* %t2)
  %t3 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.9, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 1, i8* %t3)
  %t4 = call i8* @obo_box_str(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.10, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 2, i8* %t4)
  %t5 = call i8* @obo_box_str(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.11, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 3, i8* %t5)
  %t6 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.12, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 4, i8* %t6)
  %t7 = call i8* @obo_box_str(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.13, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 5, i8* %t7)
  %t8 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.14, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 6, i8* %t8)
  %t9 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.15, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t1, i64 7, i8* %t9)
  store i8* %t1, i8** %reg_1_ptr
  %t10 = load i8*, i8** %reg_1_ptr
  store i8* %t10, i8** %var_departments_ptr
  %t11 = call i8* @obo_mixed_list_new(i64 5)
  %t12 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.16, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 0, i8* %t12)
  %t13 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.17, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 1, i8* %t13)
  %t14 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.18, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 2, i8* %t14)
  %t15 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.19, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 3, i8* %t15)
  %t16 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.20, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t11, i64 4, i8* %t16)
  store i8* %t11, i8** %reg_2_ptr
  %t17 = load i8*, i8** %reg_2_ptr
  store i8* %t17, i8** %var_levels_ptr
  %t18 = call i8* @obo_mixed_list_new(i64 5)
  %t19 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 0, i8* %t19)
  %t20 = call i8* @obo_box_str(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.22, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 1, i8* %t20)
  %t21 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 2, i8* %t21)
  %t22 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.24, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 3, i8* %t22)
  %t23 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.25, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t18, i64 4, i8* %t23)
  store i8* %t18, i8** %reg_3_ptr
  %t24 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.26, i64 0, i64 0))
  %t25 = load i8*, i8** %reg_3_ptr
  %t26 = call i8* @obo_box_list(i8* %t25)
  %t27 = call i8* @Table_create(i8* %t24, i8* %t26)
  store i8* %t27, i8** %reg_4_ptr
  %t28 = load i8*, i8** %reg_4_ptr
  store i8* %t28, i8** %var_t_ptr
  store i64 0, i64* %var_i_ptr
  %t29 = load i64, i64* %var_n_ptr
  store i64 %t29, i64* %reg_5_ptr
  store i64 1, i64* %reg_6_ptr
  br label %build_table_b1
build_table_b1:
  %t30 = load i64, i64* %var_i_ptr
  store i64 %t30, i64* %reg_7_ptr
  %t31 = load i64, i64* %reg_7_ptr
  %t32 = load i64, i64* %reg_5_ptr
  %t33 = icmp slt i64 %t31, %t32
  %t34 = zext i1 %t33 to i64
  store i64 %t34, i64* %reg_8_ptr
  %t35 = load i64, i64* %reg_8_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %build_table_b2, label %build_table_b4
build_table_b2:
  %t39 = load i64, i64* %var_i_ptr
  store i64 %t39, i64* %reg_9_ptr
  %t40 = load i64, i64* %reg_9_ptr
  %t41 = call i8* @obo_i64_to_str(i64 %t40)
  %t42 = call i8* @obo_str_concat(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.27, i64 0, i64 0), i8* %t41)
  store i8* %t42, i8** %reg_10_ptr
  %t43 = load i8*, i8** %var_departments_ptr
  store i8* %t43, i8** %reg_11_ptr
  %t44 = load i64, i64* %var_i_ptr
  store i64 %t44, i64* %reg_12_ptr
  %t45 = load i64, i64* %reg_12_ptr
  %t46 = call i64 @obo_safe_mod(i64 %t45, i64 8)
  store i64 %t46, i64* %reg_13_ptr
  %t47 = load i8*, i8** %reg_11_ptr
  %t48 = load i64, i64* %reg_13_ptr
  %t49 = call i8* @obo_mixed_list_get(i8* %t47, i64 %t48)
  store i8* %t49, i8** %reg_14_ptr
  %t50 = load i64, i64* %var_i_ptr
  store i64 %t50, i64* %reg_15_ptr
  %t51 = load i64, i64* %reg_15_ptr
  %t52 = mul i64 %t51, 37
  store i64 %t52, i64* %reg_16_ptr
  %t53 = load i64, i64* %reg_16_ptr
  %t54 = add i64 %t53, 17
  store i64 %t54, i64* %reg_17_ptr
  %t55 = load i64, i64* %reg_17_ptr
  %t56 = call i64 @obo_safe_mod(i64 %t55, i64 80000)
  store i64 %t56, i64* %reg_18_ptr
  %t57 = load i64, i64* %reg_18_ptr
  %t58 = add i64 40000, %t57
  store i64 %t58, i64* %reg_19_ptr
  %t59 = load i64, i64* %var_i_ptr
  store i64 %t59, i64* %reg_20_ptr
  %t60 = load i64, i64* %reg_20_ptr
  %t61 = call i64 @obo_safe_mod(i64 %t60, i64 30)
  store i64 %t61, i64* %reg_21_ptr
  %t62 = load i64, i64* %reg_21_ptr
  %t63 = add i64 22, %t62
  store i64 %t63, i64* %reg_22_ptr
  %t64 = load i8*, i8** %var_levels_ptr
  store i8* %t64, i8** %reg_23_ptr
  %t65 = load i64, i64* %var_i_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i64, i64* %reg_24_ptr
  %t67 = call i64 @obo_safe_mod(i64 %t66, i64 5)
  store i64 %t67, i64* %reg_25_ptr
  %t68 = load i8*, i8** %reg_23_ptr
  %t69 = load i64, i64* %reg_25_ptr
  %t70 = call i8* @obo_mixed_list_get(i8* %t68, i64 %t69)
  store i8* %t70, i8** %reg_26_ptr
  %t71 = call i8* @obo_map_new()
  %t72 = load i8*, i8** %reg_10_ptr
  call void @obo_map_put_str(i8* %t71, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0), i8* %t72)
  %t73 = load i8*, i8** %reg_14_ptr
  call void @obo_map_put_boxed(i8* %t71, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.22, i64 0, i64 0), i8* %t73)
  %t74 = load i64, i64* %reg_19_ptr
  call void @obo_map_put_i64(i8* %t71, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0), i64 %t74)
  %t75 = load i64, i64* %reg_22_ptr
  call void @obo_map_put_i64(i8* %t71, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.24, i64 0, i64 0), i64 %t75)
  %t76 = load i8*, i8** %reg_26_ptr
  call void @obo_map_put_boxed(i8* %t71, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.25, i64 0, i64 0), i8* %t76)
  store i8* %t71, i8** %reg_27_ptr
  %t77 = load i8*, i8** %var_t_ptr
  store i8* %t77, i8** %reg_28_ptr
  %t78 = load i8*, i8** %reg_28_ptr
  %t79 = load i8*, i8** %reg_27_ptr
  %t80 = call i8* @Table_insert(i8* %t78, i8* %t79)
  store i8* %t80, i8** %reg_29_ptr
  br label %build_table_b3
build_table_b3:
  %t81 = load i64, i64* %var_i_ptr
  store i64 %t81, i64* %reg_30_ptr
  %t82 = load i64, i64* %reg_30_ptr
  %t83 = load i64, i64* %reg_6_ptr
  %t84 = add i64 %t82, %t83
  store i64 %t84, i64* %reg_31_ptr
  %t85 = load i64, i64* %reg_31_ptr
  store i64 %t85, i64* %var_i_ptr
  br label %build_table_b1
build_table_b4:
  %t86 = load i8*, i8** %var_t_ptr
  store i8* %t86, i8** %reg_32_ptr
  %t87 = load i8*, i8** %reg_32_ptr
  call void @obo_gc_pop_roots(i64 16)
  ret i8* %t87
}

define i64 @run_queries(i8* %arg0) {
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
  %reg_31_ptr = alloca i64
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
  %reg_58_ptr = alloca i64
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
  %var_groups_ptr = alloca i8*
  %var_above_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var___iter_idx_66_ptr = alloca i64
  %var_found_ptr = alloca i8*
  %var_avg_ptr = alloca i64
  %var_dept_ptr = alloca i8*
  %var_checksum_ptr = alloca i64
  %var_high_ptr = alloca i8*
  %var_eng_sorted_ptr = alloca i8*
  %var_eng_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_34_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_37_ptr)
  call void @obo_gc_push_root(i8** %reg_41_ptr)
  call void @obo_gc_push_root(i8** %reg_42_ptr)
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %reg_51_ptr)
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_53_ptr)
  call void @obo_gc_push_root(i8** %reg_56_ptr)
  call void @obo_gc_push_root(i8** %reg_57_ptr)
  call void @obo_gc_push_root(i8** %reg_60_ptr)
  call void @obo_gc_push_root(i8** %reg_61_ptr)
  call void @obo_gc_push_root(i8** %reg_62_ptr)
  call void @obo_gc_push_root(i8** %reg_63_ptr)
  call void @obo_gc_push_root(i8** %reg_64_ptr)
  call void @obo_gc_push_root(i8** %reg_65_ptr)
  call void @obo_gc_push_root(i8** %reg_70_ptr)
  call void @obo_gc_push_root(i8** %reg_72_ptr)
  call void @obo_gc_push_root(i8** %reg_73_ptr)
  call void @obo_gc_push_root(i8** %reg_74_ptr)
  call void @obo_gc_push_root(i8** %reg_79_ptr)
  call void @obo_gc_push_root(i8** %reg_80_ptr)
  call void @obo_gc_push_root(i8** %reg_81_ptr)
  call void @obo_gc_push_root(i8** %reg_82_ptr)
  call void @obo_gc_push_root(i8** %reg_85_ptr)
  call void @obo_gc_push_root(i8** %reg_86_ptr)
  call void @obo_gc_push_root(i8** %reg_87_ptr)
  call void @obo_gc_push_root(i8** %reg_89_ptr)
  call void @obo_gc_push_root(i8** %reg_90_ptr)
  call void @obo_gc_push_root(i8** %reg_93_ptr)
  call void @obo_gc_push_root(i8** %reg_94_ptr)
  call void @obo_gc_push_root(i8** %reg_95_ptr)
  call void @obo_gc_push_root(i8** %reg_97_ptr)
  call void @obo_gc_push_root(i8** %reg_98_ptr)
  call void @obo_gc_push_root(i8** %var_groups_ptr)
  call void @obo_gc_push_root(i8** %var_above_ptr)
  call void @obo_gc_push_root(i8** %var_sorted_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_found_ptr)
  call void @obo_gc_push_root(i8** %var_dept_ptr)
  call void @obo_gc_push_root(i8** %var_high_ptr)
  call void @obo_gc_push_root(i8** %var_eng_sorted_ptr)
  call void @obo_gc_push_root(i8** %var_eng_ptr)
  call void @obo_gc_push_root(i8** %var_keys_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_t_ptr
  store i64 0, i64* %var_checksum_ptr
  %t1 = bitcast i64 (i8*, i64)* @__closure_0 to i8*
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
  %t11 = call i8* @obo_entity_get_boxed(i8* %t10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t18 = bitcast i64 (i8*, i64)* @__closure_1 to i8*
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
  %t28 = call i8* @obo_entity_get_boxed(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t37 = call i8* @Table_order_by(i8* %t36, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0), i64 1)
  store i8* %t37, i8** %reg_18_ptr
  %t38 = load i8*, i8** %reg_18_ptr
  store i8* %t38, i8** %var_sorted_ptr
  %t39 = load i64, i64* %var_checksum_ptr
  store i64 %t39, i64* %reg_19_ptr
  %t40 = load i8*, i8** %var_sorted_ptr
  store i8* %t40, i8** %reg_20_ptr
  %t41 = load i8*, i8** %reg_20_ptr
  %t42 = call i8* @obo_entity_get_boxed(i8* %t41, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
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
  %t60 = call i8* @obo_entity_get_boxed(i8* %t59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t60, i8** %reg_30_ptr
  %t61 = load i8*, i8** %reg_30_ptr
  %t62 = call i64 @max_of(i8* %t61, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t62, i64* %reg_31_ptr
  %t63 = load i64, i64* %reg_28_ptr
  %t64 = load i64, i64* %reg_31_ptr
  %t65 = add i64 %t63, %t64
  store i64 %t65, i64* %reg_32_ptr
  %t66 = load i64, i64* %reg_32_ptr
  store i64 %t66, i64* %var_checksum_ptr
  %t67 = load i8*, i8** %var_eng_ptr
  store i8* %t67, i8** %reg_33_ptr
  %t68 = load i8*, i8** %reg_33_ptr
  %t69 = call i8* @Table_order_by(i8* %t68, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0), i64 1)
  store i8* %t69, i8** %reg_34_ptr
  %t70 = load i8*, i8** %reg_34_ptr
  store i8* %t70, i8** %var_eng_sorted_ptr
  %t71 = load i64, i64* %var_checksum_ptr
  store i64 %t71, i64* %reg_35_ptr
  %t72 = load i8*, i8** %var_eng_sorted_ptr
  store i8* %t72, i8** %reg_36_ptr
  %t73 = load i8*, i8** %reg_36_ptr
  %t74 = call i8* @obo_entity_get_boxed(i8* %t73, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t74, i8** %reg_37_ptr
  %t75 = load i8*, i8** %reg_37_ptr
  %t76 = call i64 @obo_value_len(i8* %t75)
  store i64 %t76, i64* %reg_38_ptr
  %t77 = load i64, i64* %reg_35_ptr
  %t78 = load i64, i64* %reg_38_ptr
  %t79 = add i64 %t77, %t78
  store i64 %t79, i64* %reg_39_ptr
  %t80 = load i64, i64* %reg_39_ptr
  store i64 %t80, i64* %var_checksum_ptr
  %t81 = load i64, i64* %var_checksum_ptr
  store i64 %t81, i64* %reg_40_ptr
  %t82 = load i8*, i8** %var_t_ptr
  store i8* %t82, i8** %reg_41_ptr
  %t83 = load i8*, i8** %reg_41_ptr
  %t84 = call i8* @obo_entity_get_boxed(i8* %t83, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t84, i8** %reg_42_ptr
  %t85 = load i8*, i8** %reg_42_ptr
  %t86 = call i64 @sum_of(i8* %t85, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t86, i64* %reg_43_ptr
  %t87 = load i64, i64* %reg_40_ptr
  %t88 = load i64, i64* %reg_43_ptr
  %t89 = add i64 %t87, %t88
  store i64 %t89, i64* %reg_44_ptr
  %t90 = load i64, i64* %reg_44_ptr
  store i64 %t90, i64* %var_checksum_ptr
  %t91 = load i64, i64* %var_checksum_ptr
  store i64 %t91, i64* %reg_45_ptr
  %t92 = load i8*, i8** %var_t_ptr
  store i8* %t92, i8** %reg_46_ptr
  %t93 = load i8*, i8** %reg_46_ptr
  %t94 = call i8* @obo_entity_get_boxed(i8* %t93, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t94, i8** %reg_47_ptr
  %t95 = load i8*, i8** %reg_47_ptr
  %t96 = call i64 @avg_of(i8* %t95, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t96, i64* %reg_48_ptr
  %t97 = load i64, i64* %reg_45_ptr
  %t98 = load i64, i64* %reg_48_ptr
  %t99 = add i64 %t97, %t98
  store i64 %t99, i64* %reg_49_ptr
  %t100 = load i64, i64* %reg_49_ptr
  store i64 %t100, i64* %var_checksum_ptr
  %t101 = load i64, i64* %var_checksum_ptr
  store i64 %t101, i64* %reg_50_ptr
  %t102 = load i8*, i8** %var_t_ptr
  store i8* %t102, i8** %reg_51_ptr
  %t103 = load i8*, i8** %reg_51_ptr
  %t104 = call i8* @obo_entity_get_boxed(i8* %t103, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t104, i8** %reg_52_ptr
  %t105 = load i8*, i8** %reg_52_ptr
  %t106 = call i8* @min_of(i8* %t105, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i8* %t106, i8** %reg_53_ptr
  %t107 = load i64, i64* %reg_50_ptr
  %t108 = load i8*, i8** %reg_53_ptr
  %t109 = call i64 @obo_value_as_i64(i8* %t108)
  %t110 = add i64 %t107, %t109
  store i64 %t110, i64* %reg_54_ptr
  %t111 = load i64, i64* %reg_54_ptr
  store i64 %t111, i64* %var_checksum_ptr
  %t112 = load i64, i64* %var_checksum_ptr
  store i64 %t112, i64* %reg_55_ptr
  %t113 = load i8*, i8** %var_t_ptr
  store i8* %t113, i8** %reg_56_ptr
  %t114 = load i8*, i8** %reg_56_ptr
  %t115 = call i8* @obo_entity_get_boxed(i8* %t114, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t115, i8** %reg_57_ptr
  %t116 = load i8*, i8** %reg_57_ptr
  %t117 = call i64 @max_of(i8* %t116, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t117, i64* %reg_58_ptr
  %t118 = load i64, i64* %reg_55_ptr
  %t119 = load i64, i64* %reg_58_ptr
  %t120 = add i64 %t118, %t119
  store i64 %t120, i64* %reg_59_ptr
  %t121 = load i64, i64* %reg_59_ptr
  store i64 %t121, i64* %var_checksum_ptr
  %t122 = load i8*, i8** %var_t_ptr
  store i8* %t122, i8** %reg_60_ptr
  %t123 = load i8*, i8** %reg_60_ptr
  %t124 = call i8* @obo_entity_get_boxed(i8* %t123, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t124, i8** %reg_61_ptr
  %t125 = load i8*, i8** %reg_61_ptr
  %t126 = call i8* @group_by(i8* %t125, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.22, i64 0, i64 0))
  store i8* %t126, i8** %reg_62_ptr
  %t127 = load i8*, i8** %reg_62_ptr
  %t128 = call i8* @obo_mixed_list_get(i8* %t127, i64 0)
  store i8* %t128, i8** %reg_63_ptr
  %t129 = load i8*, i8** %reg_63_ptr
  store i8* %t129, i8** %var_groups_ptr
  %t130 = load i8*, i8** %reg_62_ptr
  %t131 = call i8* @obo_mixed_list_get(i8* %t130, i64 1)
  store i8* %t131, i8** %reg_64_ptr
  %t132 = load i8*, i8** %reg_64_ptr
  store i8* %t132, i8** %var_keys_ptr
  %t133 = load i8*, i8** %var_keys_ptr
  store i8* %t133, i8** %reg_65_ptr
  store i64 0, i64* %var___iter_idx_66_ptr
  %t134 = load i8*, i8** %reg_65_ptr
  %t135 = call i64 @obo_value_len(i8* %t134)
  store i64 %t135, i64* %reg_66_ptr
  br label %run_queries_b1
run_queries_b1:
  %t136 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t136, i64* %reg_67_ptr
  %t137 = load i64, i64* %reg_67_ptr
  %t138 = load i64, i64* %reg_66_ptr
  %t139 = icmp slt i64 %t137, %t138
  %t140 = zext i1 %t139 to i64
  store i64 %t140, i64* %reg_68_ptr
  %t141 = load i64, i64* %reg_68_ptr
  %t143 = icmp ne i64 %t141, 0
  %t144 = zext i1 %t143 to i64
  %t142 = icmp ne i64 %t144, 0
  br i1 %t142, label %run_queries_b2, label %run_queries_b4
run_queries_b2:
  %t145 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t145, i64* %reg_69_ptr
  %t146 = load i8*, i8** %reg_65_ptr
  %t147 = load i64, i64* %reg_69_ptr
  %t149 = call i8* @obo_value_as_mixed_list_ptr(i8* %t146)
  %t148 = call i8* @obo_mixed_list_get(i8* %t149, i64 %t147)
  store i8* %t148, i8** %reg_70_ptr
  %t150 = load i8*, i8** %reg_70_ptr
  store i8* %t150, i8** %var_dept_ptr
  %t151 = load i64, i64* %var_checksum_ptr
  store i64 %t151, i64* %reg_71_ptr
  %t152 = load i8*, i8** %var_groups_ptr
  store i8* %t152, i8** %reg_72_ptr
  %t153 = load i8*, i8** %var_dept_ptr
  store i8* %t153, i8** %reg_73_ptr
  %t154 = load i8*, i8** %reg_72_ptr
  %t155 = load i8*, i8** %reg_73_ptr
  %t156 = call i8* @obo_value_to_str(i8* %t155)
  %t158 = call i8* @obo_value_as_map_ptr(i8* %t154)
  %t157 = call i8* @obo_map_get_boxed(i8* %t158, i8* %t156)
  store i8* %t157, i8** %reg_74_ptr
  %t159 = load i8*, i8** %reg_74_ptr
  %t160 = call i64 @obo_value_len(i8* %t159)
  store i64 %t160, i64* %reg_75_ptr
  %t161 = load i64, i64* %reg_71_ptr
  %t162 = load i64, i64* %reg_75_ptr
  %t163 = add i64 %t161, %t162
  store i64 %t163, i64* %reg_76_ptr
  %t164 = load i64, i64* %reg_76_ptr
  store i64 %t164, i64* %var_checksum_ptr
  br label %run_queries_b3
run_queries_b3:
  %t165 = load i64, i64* %var___iter_idx_66_ptr
  store i64 %t165, i64* %reg_77_ptr
  %t166 = load i64, i64* %reg_77_ptr
  %t167 = add i64 %t166, 1
  store i64 %t167, i64* %reg_78_ptr
  %t168 = load i64, i64* %reg_78_ptr
  store i64 %t168, i64* %var___iter_idx_66_ptr
  br label %run_queries_b1
run_queries_b4:
  %t169 = bitcast i64 (i8*, i64)* @__closure_2 to i8*
  %t170 = call i8* @obo_closure_new(i8* %t169, i64 0)
  store i8* %t170, i8** %reg_79_ptr
  %t171 = load i8*, i8** %var_t_ptr
  store i8* %t171, i8** %reg_80_ptr
  %t172 = load i8*, i8** %reg_80_ptr
  %t173 = load i8*, i8** %reg_79_ptr
  %t174 = call i8* @Table_find_first(i8* %t172, i8* %t173)
  store i8* %t174, i8** %reg_81_ptr
  %t175 = load i8*, i8** %reg_81_ptr
  store i8* %t175, i8** %var_found_ptr
  %t176 = load i8*, i8** %var_found_ptr
  store i8* %t176, i8** %reg_82_ptr
  %t177 = load i8*, i8** %reg_82_ptr
  %t178 = call i8* @obo_box_null()
  %t179 = call i64 @obo_value_compare(i8* %t177, i8* %t178)
  %t180 = icmp ne i64 %t179, 0
  %t181 = zext i1 %t180 to i64
  store i64 %t181, i64* %reg_83_ptr
  %t182 = load i64, i64* %reg_83_ptr
  %t184 = icmp ne i64 %t182, 0
  %t185 = zext i1 %t184 to i64
  %t183 = icmp ne i64 %t185, 0
  br i1 %t183, label %run_queries_b5, label %run_queries_b6
run_queries_b5:
  %t186 = load i64, i64* %var_checksum_ptr
  store i64 %t186, i64* %reg_84_ptr
  %t187 = load i8*, i8** %var_found_ptr
  store i8* %t187, i8** %reg_85_ptr
  %t188 = load i8*, i8** %reg_85_ptr
  %t189 = call i8* @obo_value_as_entity_ptr(i8* %t188)
  %t190 = call i8* @obo_entity_get_boxed(i8* %t189, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t190, i8** %reg_86_ptr
  %t191 = load i8*, i8** %reg_86_ptr
  %t193 = call i8* @obo_value_as_map_ptr(i8* %t191)
  %t192 = call i8* @obo_map_get_boxed(i8* %t193, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i8* %t192, i8** %reg_87_ptr
  %t194 = load i64, i64* %reg_84_ptr
  %t195 = load i8*, i8** %reg_87_ptr
  %t196 = call i64 @obo_value_as_i64(i8* %t195)
  %t197 = add i64 %t194, %t196
  store i64 %t197, i64* %reg_88_ptr
  %t198 = load i64, i64* %reg_88_ptr
  store i64 %t198, i64* %var_checksum_ptr
  br label %run_queries_b7
run_queries_b6:
  br label %run_queries_b7
run_queries_b7:
  %t199 = load i8*, i8** %var_t_ptr
  store i8* %t199, i8** %reg_89_ptr
  %t200 = load i8*, i8** %reg_89_ptr
  %t201 = call i8* @obo_entity_get_boxed(i8* %t200, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t201, i8** %reg_90_ptr
  %t202 = load i8*, i8** %reg_90_ptr
  %t203 = call i64 @avg_of(i8* %t202, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t203, i64* %reg_91_ptr
  %t204 = load i64, i64* %reg_91_ptr
  store i64 %t204, i64* %var_avg_ptr
  %t205 = load i64, i64* %var_avg_ptr
  store i64 %t205, i64* %reg_92_ptr
  %t206 = bitcast i64 (i8*, i64)* @__closure_3 to i8*
  %t207 = call i8* @obo_closure_new(i8* %t206, i64 1)
  %t208 = load i64, i64* %reg_92_ptr
  call void @obo_closure_set_capture(i8* %t207, i64 0, i64 %t208)
  store i8* %t207, i8** %reg_93_ptr
  %t209 = load i8*, i8** %var_t_ptr
  store i8* %t209, i8** %reg_94_ptr
  %t210 = load i8*, i8** %reg_94_ptr
  %t211 = load i8*, i8** %reg_93_ptr
  %t212 = call i8* @Table_where(i8* %t210, i8* %t211)
  store i8* %t212, i8** %reg_95_ptr
  %t213 = load i8*, i8** %reg_95_ptr
  store i8* %t213, i8** %var_above_ptr
  %t214 = load i64, i64* %var_checksum_ptr
  store i64 %t214, i64* %reg_96_ptr
  %t215 = load i8*, i8** %var_above_ptr
  store i8* %t215, i8** %reg_97_ptr
  %t216 = load i8*, i8** %reg_97_ptr
  %t217 = call i8* @obo_entity_get_boxed(i8* %t216, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t217, i8** %reg_98_ptr
  %t218 = load i8*, i8** %reg_98_ptr
  %t219 = call i64 @obo_value_len(i8* %t218)
  store i64 %t219, i64* %reg_99_ptr
  %t220 = load i64, i64* %reg_96_ptr
  %t221 = load i64, i64* %reg_99_ptr
  %t222 = add i64 %t220, %t221
  store i64 %t222, i64* %reg_100_ptr
  %t223 = load i64, i64* %reg_100_ptr
  store i64 %t223, i64* %var_checksum_ptr
  %t224 = load i64, i64* %var_checksum_ptr
  store i64 %t224, i64* %reg_101_ptr
  %t225 = load i64, i64* %reg_101_ptr
  call void @obo_gc_pop_roots(i64 66)
  ret i64 %t225
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
  %var_iter_ptr = alloca i64
  %var__t_ptr = alloca i8*
  %var_removed_ptr = alloca i64
  %var_total_checksum_ptr = alloca i64
  %var_iterations_ptr = alloca i64
  %var_t2_ptr = alloca i8*
  %var_n_ptr = alloca i64
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_42_ptr)
  call void @obo_gc_push_root(i8** %var__t_ptr)
  call void @obo_gc_push_root(i8** %var_t2_ptr)
  store i64 500, i64* %var_n_ptr
  store i64 20, i64* %var_iterations_ptr
  %t0 = load i64, i64* %var_n_ptr
  store i64 %t0, i64* %reg_0_ptr
  %t1 = load i64, i64* %reg_0_ptr
  %t2 = call i8* @obo_i64_to_str(i64 %t1)
  %t3 = call i8* @obo_str_concat(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.32, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  %t5 = call i8* @obo_str_concat(i8* %t4, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.33, i64 0, i64 0))
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %reg_2_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t6)
  %t7 = load i64, i64* %var_n_ptr
  store i64 %t7, i64* %reg_3_ptr
  %t8 = load i64, i64* %reg_3_ptr
  %t9 = call i8* @build_table(i64 %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = load i8*, i8** %reg_4_ptr
  store i8* %t10, i8** %var__t_ptr
  %t11 = load i64, i64* %var_iterations_ptr
  store i64 %t11, i64* %reg_5_ptr
  %t12 = load i64, i64* %reg_5_ptr
  %t13 = call i8* @obo_i64_to_str(i64 %t12)
  %t14 = call i8* @obo_str_concat(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.34, i64 0, i64 0), i8* %t13)
  store i8* %t14, i8** %reg_6_ptr
  %t15 = load i8*, i8** %reg_6_ptr
  %t16 = call i8* @obo_str_concat(i8* %t15, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.35, i64 0, i64 0))
  store i8* %t16, i8** %reg_7_ptr
  %t17 = load i8*, i8** %reg_7_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t17)
  store i64 0, i64* %var_total_checksum_ptr
  store i64 0, i64* %var_iter_ptr
  %t18 = load i64, i64* %var_iterations_ptr
  store i64 %t18, i64* %reg_8_ptr
  store i64 1, i64* %reg_9_ptr
  br label %main_b1
main_b1:
  %t19 = load i64, i64* %var_iter_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_8_ptr
  %t22 = icmp slt i64 %t20, %t21
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %main_b2, label %main_b4
main_b2:
  %t28 = load i64, i64* %var_n_ptr
  store i64 %t28, i64* %reg_12_ptr
  %t29 = load i64, i64* %reg_12_ptr
  %t30 = call i8* @build_table(i64 %t29)
  store i8* %t30, i8** %reg_13_ptr
  %t31 = load i8*, i8** %reg_13_ptr
  store i8* %t31, i8** %var_t2_ptr
  %t32 = load i8*, i8** %var_t2_ptr
  store i8* %t32, i8** %reg_14_ptr
  %t33 = load i8*, i8** %reg_14_ptr
  %t34 = call i64 @run_queries(i8* %t33)
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  store i64 %t35, i64* %var_checksum_ptr
  %t36 = bitcast i64 (i8*, i64)* @__closure_4 to i8*
  %t37 = call i8* @obo_closure_new(i8* %t36, i64 0)
  store i8* %t37, i8** %reg_16_ptr
  %t38 = bitcast i64 (i8*, i64)* @__closure_5 to i8*
  %t39 = call i8* @obo_closure_new(i8* %t38, i64 0)
  store i8* %t39, i8** %reg_17_ptr
  %t40 = load i8*, i8** %var_t2_ptr
  store i8* %t40, i8** %reg_18_ptr
  %t41 = load i8*, i8** %reg_18_ptr
  %t42 = load i8*, i8** %reg_16_ptr
  %t43 = load i8*, i8** %reg_17_ptr
  %t44 = call i64 @Table_update_where(i8* %t41, i8* %t42, i8* %t43)
  store i64 %t44, i64* %reg_19_ptr
  %t45 = load i64, i64* %var_checksum_ptr
  store i64 %t45, i64* %reg_20_ptr
  %t46 = load i8*, i8** %var_t2_ptr
  store i8* %t46, i8** %reg_21_ptr
  %t47 = load i8*, i8** %reg_21_ptr
  %t48 = call i8* @obo_entity_get_boxed(i8* %t47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t48, i8** %reg_22_ptr
  %t49 = load i8*, i8** %reg_22_ptr
  %t50 = call i64 @sum_of(i8* %t49, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i64 %t50, i64* %reg_23_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t52 = load i64, i64* %reg_23_ptr
  %t53 = add i64 %t51, %t52
  store i64 %t53, i64* %reg_24_ptr
  %t54 = load i64, i64* %reg_24_ptr
  store i64 %t54, i64* %var_checksum_ptr
  %t55 = bitcast i64 (i8*, i64)* @__closure_6 to i8*
  %t56 = call i8* @obo_closure_new(i8* %t55, i64 0)
  store i8* %t56, i8** %reg_25_ptr
  %t57 = load i8*, i8** %var_t2_ptr
  store i8* %t57, i8** %reg_26_ptr
  %t58 = load i8*, i8** %reg_26_ptr
  %t59 = load i8*, i8** %reg_25_ptr
  %t60 = call i64 @Table_delete_where(i8* %t58, i8* %t59)
  store i64 %t60, i64* %reg_27_ptr
  %t61 = load i64, i64* %reg_27_ptr
  store i64 %t61, i64* %var_removed_ptr
  %t62 = load i64, i64* %var_checksum_ptr
  store i64 %t62, i64* %reg_28_ptr
  %t63 = load i64, i64* %var_removed_ptr
  store i64 %t63, i64* %reg_29_ptr
  %t64 = load i64, i64* %reg_28_ptr
  %t65 = load i64, i64* %reg_29_ptr
  %t66 = add i64 %t64, %t65
  store i64 %t66, i64* %reg_30_ptr
  %t67 = load i64, i64* %reg_30_ptr
  store i64 %t67, i64* %var_checksum_ptr
  %t68 = load i64, i64* %var_checksum_ptr
  store i64 %t68, i64* %reg_31_ptr
  %t69 = load i8*, i8** %var_t2_ptr
  store i8* %t69, i8** %reg_32_ptr
  %t70 = load i8*, i8** %reg_32_ptr
  %t71 = call i8* @obo_entity_get_boxed(i8* %t70, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.45, i64 0, i64 0))
  store i8* %t71, i8** %reg_33_ptr
  %t72 = load i8*, i8** %reg_33_ptr
  %t73 = call i64 @obo_value_len(i8* %t72)
  store i64 %t73, i64* %reg_34_ptr
  %t74 = load i64, i64* %reg_31_ptr
  %t75 = load i64, i64* %reg_34_ptr
  %t76 = add i64 %t74, %t75
  store i64 %t76, i64* %reg_35_ptr
  %t77 = load i64, i64* %reg_35_ptr
  store i64 %t77, i64* %var_checksum_ptr
  %t78 = load i64, i64* %var_total_checksum_ptr
  store i64 %t78, i64* %reg_36_ptr
  %t79 = load i64, i64* %var_checksum_ptr
  store i64 %t79, i64* %reg_37_ptr
  %t80 = load i64, i64* %reg_36_ptr
  %t81 = load i64, i64* %reg_37_ptr
  %t82 = add i64 %t80, %t81
  store i64 %t82, i64* %reg_38_ptr
  %t83 = load i64, i64* %reg_38_ptr
  store i64 %t83, i64* %var_total_checksum_ptr
  br label %main_b3
main_b3:
  %t84 = load i64, i64* %var_iter_ptr
  store i64 %t84, i64* %reg_39_ptr
  %t85 = load i64, i64* %reg_39_ptr
  %t86 = load i64, i64* %reg_9_ptr
  %t87 = add i64 %t85, %t86
  store i64 %t87, i64* %reg_40_ptr
  %t88 = load i64, i64* %reg_40_ptr
  store i64 %t88, i64* %var_iter_ptr
  br label %main_b1
main_b4:
  %t89 = load i64, i64* %var_total_checksum_ptr
  store i64 %t89, i64* %reg_41_ptr
  %t90 = load i64, i64* %reg_41_ptr
  %t91 = call i8* @obo_i64_to_str(i64 %t90)
  %t92 = call i8* @obo_str_concat(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.38, i64 0, i64 0), i8* %t91)
  store i8* %t92, i8** %reg_42_ptr
  %t93 = load i8*, i8** %reg_42_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t93)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @obo.str.39, i64 0, i64 0))
  call void @obo_gc_pop_roots(i64 19)
  call void @obo_arena_free_all()
  ret i32 0
}

define i64 @__closure_0(i8* %arg0, i64 %arg1) {
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
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp slt i64 80000, %t10
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t13
}

define i64 @__closure_1(i8* %arg0, i64 %arg1) {
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
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.22, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.8, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_2(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_r_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.40, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_3(i8* %arg0, i64 %arg1) {
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
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_avg_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
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
  %t10 = call i8* @obo_entity_get_boxed(i8* %t9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t10, i8** %reg_6_ptr
  %t11 = load i8*, i8** %reg_6_ptr
  %t13 = call i8* @obo_value_as_map_ptr(i8* %t11)
  %t12 = call i8* @obo_map_get_boxed(i8* %t13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i8* %t12, i8** %reg_7_ptr
  %t14 = load i64, i64* %reg_4_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  %t16 = call i64 @obo_value_as_i64(i8* %t15)
  %t17 = icmp slt i64 %t14, %t16
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i64 %t19
}

define i64 @__closure_4(i8* %arg0, i64 %arg1) {
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
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.22, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.8, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_5(i8* %arg0, i64 %arg1) {
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
  %var___closure_self_ptr = alloca i8*
  %var_d_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_d_ptr
  %t2 = load i64, i64* %var_d_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_map_get_boxed(i8* %t4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i64, i64* %var_d_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i8*
  %t9 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0))
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
  call void @obo_map_put_i64(i8* %t20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.23, i64 0, i64 0), i64 %t19)
  %t21 = load i64, i64* %var_d_ptr
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t22
}

define i64 @__closure_6(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_r_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_r_ptr
  %t2 = load i64, i64* %var_r_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.42, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.24, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp slt i64 %t10, 25
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t13
}

