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

@obo.str.0 = private unnamed_addr constant [4 x i8] c"add\00"
@obo.str.1 = private unnamed_addr constant [9 x i8] c"removeAt\00"
@obo.str.2 = private unnamed_addr constant [9 x i8] c"__init__\00"
@obo.str.3 = private unnamed_addr constant [1 x i8] c"\00"
@obo.str.4 = private unnamed_addr constant [4 x i8] c"has\00"
@obo.str.5 = private unnamed_addr constant [7 x i8] c"remove\00"
@obo.str.6 = private unnamed_addr constant [4 x i8] c"set\00"
@obo.str.7 = private unnamed_addr constant [2 x i8] c".\00"
@obo.str.8 = private unnamed_addr constant [5 x i8] c"join\00"
@obo.str.9 = private unnamed_addr constant [2 x i8] c"_\00"
@obo.str.10 = private unnamed_addr constant [7 x i8] c"filter\00"
@obo.str.11 = private unnamed_addr constant [5 x i8] c"--- \00"
@obo.str.12 = private unnamed_addr constant [3 x i8] c" (\00"
@obo.str.13 = private unnamed_addr constant [11 x i8] c" rows) ---\00"
@obo.str.14 = private unnamed_addr constant [3 x i8] c"  \00"
@obo.str.15 = private unnamed_addr constant [9 x i8] c"padRight\00"
@obo.str.16 = private unnamed_addr constant [7 x i8] c"repeat\00"
@obo.str.17 = private unnamed_addr constant [2 x i8] c"-\00"
@obo.str.18 = private unnamed_addr constant [7 x i8] c"__init\00"
@obo.str.19 = private unnamed_addr constant [21 x i8] c"[DB] Created table: \00"
@obo.str.20 = private unnamed_addr constant [3 x i8] c", \00"
@obo.str.21 = private unnamed_addr constant [2 x i8] c")\00"
@obo.str.22 = private unnamed_addr constant [21 x i8] c"[DB] Dropped table: \00"
@obo.str.23 = private unnamed_addr constant [15 x i8] c"=== Database: \00"
@obo.str.24 = private unnamed_addr constant [5 x i8] c" ===\00"
@obo.str.25 = private unnamed_addr constant [3 x i8] c": \00"
@obo.str.26 = private unnamed_addr constant [6 x i8] c" rows\00"
@obo.str.27 = private unnamed_addr constant [41 x i8] c"========================================\00"
@obo.str.28 = private unnamed_addr constant [43 x i8] c"  OBO Mini Database Engine \E2\80\94 Benchmark  \00"
@obo.str.29 = private unnamed_addr constant [10 x i8] c"CompanyDB\00"
@obo.str.30 = private unnamed_addr constant [5 x i8] c"name\00"
@obo.str.31 = private unnamed_addr constant [11 x i8] c"department\00"
@obo.str.32 = private unnamed_addr constant [7 x i8] c"salary\00"
@obo.str.33 = private unnamed_addr constant [4 x i8] c"age\00"
@obo.str.34 = private unnamed_addr constant [6 x i8] c"level\00"
@obo.str.35 = private unnamed_addr constant [13 x i8] c"create_table\00"
@obo.str.36 = private unnamed_addr constant [10 x i8] c"employees\00"
@obo.str.37 = private unnamed_addr constant [10 x i8] c"dept_name\00"
@obo.str.38 = private unnamed_addr constant [7 x i8] c"budget\00"
@obo.str.39 = private unnamed_addr constant [5 x i8] c"head\00"
@obo.str.40 = private unnamed_addr constant [12 x i8] c"departments\00"
@obo.str.41 = private unnamed_addr constant [35 x i8] c"== INSERT: Populating employees ==\00"
@obo.str.42 = private unnamed_addr constant [6 x i8] c"Alice\00"
@obo.str.43 = private unnamed_addr constant [12 x i8] c"Engineering\00"
@obo.str.44 = private unnamed_addr constant [7 x i8] c"Senior\00"
@obo.str.45 = private unnamed_addr constant [7 x i8] c"insert\00"
@obo.str.46 = private unnamed_addr constant [4 x i8] c"Bob\00"
@obo.str.47 = private unnamed_addr constant [10 x i8] c"Marketing\00"
@obo.str.48 = private unnamed_addr constant [4 x i8] c"Mid\00"
@obo.str.49 = private unnamed_addr constant [8 x i8] c"Charlie\00"
@obo.str.50 = private unnamed_addr constant [5 x i8] c"Lead\00"
@obo.str.51 = private unnamed_addr constant [6 x i8] c"Diana\00"
@obo.str.52 = private unnamed_addr constant [3 x i8] c"HR\00"
@obo.str.53 = private unnamed_addr constant [7 x i8] c"Junior\00"
@obo.str.54 = private unnamed_addr constant [4 x i8] c"Eve\00"
@obo.str.55 = private unnamed_addr constant [6 x i8] c"Frank\00"
@obo.str.56 = private unnamed_addr constant [6 x i8] c"Grace\00"
@obo.str.57 = private unnamed_addr constant [5 x i8] c"Hank\00"
@obo.str.58 = private unnamed_addr constant [10 x i8] c"Principal\00"
@obo.str.59 = private unnamed_addr constant [4 x i8] c"Ivy\00"
@obo.str.60 = private unnamed_addr constant [5 x i8] c"Jack\00"
@obo.str.61 = private unnamed_addr constant [8 x i8] c"Finance\00"
@obo.str.62 = private unnamed_addr constant [6 x i8] c"Karen\00"
@obo.str.63 = private unnamed_addr constant [4 x i8] c"Leo\00"
@obo.str.64 = private unnamed_addr constant [10 x i8] c"Inserted \00"
@obo.str.65 = private unnamed_addr constant [11 x i8] c" employees\00"
@obo.str.66 = private unnamed_addr constant [13 x i8] c" departments\00"
@obo.str.67 = private unnamed_addr constant [39 x i8] c"== QUERY 1: SELECT * FROM employees ==\00"
@obo.str.68 = private unnamed_addr constant [8 x i8] c"display\00"
@obo.str.69 = private unnamed_addr constant [45 x i8] c"== QUERY 2: SELECT * WHERE salary > 90000 ==\00"
@obo.str.70 = private unnamed_addr constant [6 x i8] c"where\00"
@obo.str.71 = private unnamed_addr constant [57 x i8] c"== QUERY 3: SELECT * WHERE department = 'Engineering' ==\00"
@obo.str.72 = private unnamed_addr constant [45 x i8] c"== QUERY 4: SELECT * ORDER BY salary DESC ==\00"
@obo.str.73 = private unnamed_addr constant [9 x i8] c"order_by\00"
@obo.str.74 = private unnamed_addr constant [41 x i8] c"== QUERY 5: SELECT * ORDER BY age ASC ==\00"
@obo.str.75 = private unnamed_addr constant [58 x i8] c"== QUERY 6: Engineering employees ORDER BY salary DESC ==\00"
@obo.str.76 = private unnamed_addr constant [45 x i8] c"== QUERY 7: Aggregate functions on salary ==\00"
@obo.str.77 = private unnamed_addr constant [11 x i8] c"  COUNT:  \00"
@obo.str.78 = private unnamed_addr constant [11 x i8] c"  SUM:    \00"
@obo.str.79 = private unnamed_addr constant [11 x i8] c"  AVG:    \00"
@obo.str.80 = private unnamed_addr constant [11 x i8] c"  MIN:    \00"
@obo.str.81 = private unnamed_addr constant [11 x i8] c"  MAX:    \00"
@obo.str.82 = private unnamed_addr constant [35 x i8] c"== QUERY 8: GROUP BY department ==\00"
@obo.str.83 = private unnamed_addr constant [7 x i8] c"count=\00"
@obo.str.84 = private unnamed_addr constant [12 x i8] c"avg_salary=\00"
@obo.str.85 = private unnamed_addr constant [9 x i8] c"min_age=\00"
@obo.str.86 = private unnamed_addr constant [9 x i8] c"max_age=\00"
@obo.str.87 = private unnamed_addr constant [47 x i8] c"== QUERY 9: Find first employee named 'Eve' ==\00"
@obo.str.88 = private unnamed_addr constant [11 x i8] c"find_first\00"
@obo.str.89 = private unnamed_addr constant [10 x i8] c"  Found: \00"
@obo.str.90 = private unnamed_addr constant [9 x i8] c" | dept=\00"
@obo.str.91 = private unnamed_addr constant [12 x i8] c" | salary=$\00"
@obo.str.92 = private unnamed_addr constant [48 x i8] c"== QUERY 10: Employees earning above average ==\00"
@obo.str.93 = private unnamed_addr constant [19 x i8] c"  Average salary: \00"
@obo.str.94 = private unnamed_addr constant [45 x i8] c"== QUERY 11: JOIN employees x departments ==\00"
@obo.str.95 = private unnamed_addr constant [10 x i8] c"  Joined \00"
@obo.str.96 = private unnamed_addr constant [15 x i8] c"employees.name\00"
@obo.str.97 = private unnamed_addr constant [6 x i8] c"dept=\00"
@obo.str.98 = private unnamed_addr constant [21 x i8] c"employees.department\00"
@obo.str.99 = private unnamed_addr constant [8 x i8] c"salary=\00"
@obo.str.100 = private unnamed_addr constant [17 x i8] c"employees.salary\00"
@obo.str.101 = private unnamed_addr constant [8 x i8] c"budget=\00"
@obo.str.102 = private unnamed_addr constant [19 x i8] c"departments.budget\00"
@obo.str.103 = private unnamed_addr constant [6 x i8] c"head=\00"
@obo.str.104 = private unnamed_addr constant [17 x i8] c"departments.head\00"
@obo.str.105 = private unnamed_addr constant [53 x i8] c"== QUERY 12: UPDATE \E2\80\94 10% raise for Engineering ==\00"
@obo.str.106 = private unnamed_addr constant [13 x i8] c"update_where\00"
@obo.str.107 = private unnamed_addr constant [11 x i8] c"  Updated \00"
@obo.str.108 = private unnamed_addr constant [57 x i8] c"== QUERY 13: DELETE \E2\80\94 Remove employees under age 25 ==\00"
@obo.str.109 = private unnamed_addr constant [13 x i8] c"delete_where\00"
@obo.str.110 = private unnamed_addr constant [11 x i8] c"  Removed \00"
@obo.str.111 = private unnamed_addr constant [13 x i8] c"update_table\00"
@obo.str.112 = private unnamed_addr constant [5 x i8] c"info\00"
@obo.str.113 = private unnamed_addr constant [36 x i8] c"All queries completed successfully!\00"
@obo.str.114 = private unnamed_addr constant [2 x i8] c"a\00"
@obo.str.115 = private unnamed_addr constant [2 x i8] c"b\00"
@obo.str.116 = private unnamed_addr constant [5 x i8] c"test\00"
@obo.str.117 = private unnamed_addr constant [17 x i8] c"Assertion failed\00"
@obo.str.118 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.119 = private unnamed_addr constant [2 x i8] c"v\00"
@obo.str.120 = private unnamed_addr constant [6 x i8] c"score\00"
@obo.str.121 = private unnamed_addr constant [4 x i8] c"val\00"
@obo.str.122 = private unnamed_addr constant [2 x i8] c"n\00"
@obo.str.123 = private unnamed_addr constant [2 x i8] c"y\00"
@obo.str.124 = private unnamed_addr constant [2 x i8] c"z\00"
@obo.str.125 = private unnamed_addr constant [4 x i8] c"cat\00"
@obo.str.126 = private unnamed_addr constant [5 x i8] c"dept\00"
@obo.str.127 = private unnamed_addr constant [4 x i8] c"sal\00"
@obo.str.128 = private unnamed_addr constant [2 x i8] c"A\00"
@obo.str.129 = private unnamed_addr constant [2 x i8] c"B\00"
@obo.str.130 = private unnamed_addr constant [2 x i8] c"w\00"
@obo.str.131 = private unnamed_addr constant [6 x i8] c"count\00"
@obo.str.132 = private unnamed_addr constant [5 x i8] c"data\00"
@obo.str.133 = private unnamed_addr constant [8 x i8] c"columns\00"
@obo.str.134 = private unnamed_addr constant [5 x i8] c"rows\00"
@obo.str.135 = private unnamed_addr constant [4 x i8] c"Row\00"
@obo.str.136 = private unnamed_addr constant [3 x i8] c"id\00"
@obo.str.137 = private unnamed_addr constant [6 x i8] c"Table\00"
@obo.str.138 = private unnamed_addr constant [8 x i8] c"next_id\00"
@obo.str.139 = private unnamed_addr constant [9 x i8] c"Database\00"
@obo.str.140 = private unnamed_addr constant [7 x i8] c"tables\00"
@obo.str.141 = private unnamed_addr constant [5 x i8] c"keys\00"

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
  %reg_30_ptr = alloca i64
  %reg_31_ptr = alloca i64
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i64
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i8*
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i8*
  %reg_45_ptr = alloca i64
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i8*
  %var_remaining_ptr = alloca i8*
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_ascending_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_a_ptr = alloca i8*
  %var_result_ptr = alloca i8*
  %var_b_ptr = alloca i8*
  %var_best_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_34_ptr)
  call void @obo_gc_push_root(i8** %reg_40_ptr)
  call void @obo_gc_push_root(i8** %reg_42_ptr)
  call void @obo_gc_push_root(i8** %reg_43_ptr)
  call void @obo_gc_push_root(i8** %reg_44_ptr)
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %reg_48_ptr)
  call void @obo_gc_push_root(i8** %var_remaining_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_a_ptr)
  call void @obo_gc_push_root(i8** %var_result_ptr)
  call void @obo_gc_push_root(i8** %var_b_ptr)
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
  store i8* %t20, i8** %reg_48_ptr
  %t21 = load i8*, i8** %reg_48_ptr
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
  %t39 = call i8* @obo_entity_get_boxed(i8* %t38, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %t54 = call i8* @obo_entity_get_boxed(i8* %t53, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  br i1 %t63, label %sort_rows_b8, label %sort_rows_b22
sort_rows_b22:
  store i64 0, i64* %reg_29_ptr
  br label %sort_rows_b11
sort_rows_b6:
  %t66 = load i64, i64* %var_i_ptr
  store i64 %t66, i64* %reg_38_ptr
  %t67 = load i64, i64* %reg_38_ptr
  %t68 = load i64, i64* %reg_10_ptr
  %t69 = add i64 %t67, %t68
  store i64 %t69, i64* %reg_39_ptr
  %t70 = load i64, i64* %reg_39_ptr
  store i64 %t70, i64* %var_i_ptr
  br label %sort_rows_b4
sort_rows_b7:
  %t71 = load i8*, i8** %var_remaining_ptr
  store i8* %t71, i8** %reg_40_ptr
  %t72 = load i64, i64* %var_best_ptr
  store i64 %t72, i64* %reg_41_ptr
  %t73 = load i8*, i8** %reg_40_ptr
  %t74 = load i64, i64* %reg_41_ptr
  %t76 = call i8* @obo_value_as_mixed_list_ptr(i8* %t73)
  %t75 = call i8* @obo_mixed_list_get(i8* %t76, i64 %t74)
  store i8* %t75, i8** %reg_42_ptr
  %t77 = load i8*, i8** %var_result_ptr
  store i8* %t77, i8** %reg_43_ptr
  %t78 = load i8*, i8** %reg_43_ptr
  %t79 = load i8*, i8** %reg_42_ptr
  %t80 = call i8* @obo_mixed_list_add(i8* %t78, i8* %t79)
  store i8* %t80, i8** %reg_44_ptr
  %t81 = load i8*, i8** %reg_44_ptr
  store i8* %t81, i8** %var_result_ptr
  %t82 = load i64, i64* %var_best_ptr
  store i64 %t82, i64* %reg_45_ptr
  %t83 = load i8*, i8** %var_remaining_ptr
  store i8* %t83, i8** %reg_46_ptr
  %t84 = load i8*, i8** %reg_46_ptr
  %t85 = call i8* @obo_value_as_mixed_list_ptr(i8* %t84)
  %t86 = load i64, i64* %reg_45_ptr
  %t87 = call i8* @obo_mixed_list_removeAt(i8* %t85, i64 %t86)
  %t88 = call i8* @obo_box_list(i8* %t87)
  store i8* %t88, i8** %reg_47_ptr
  %t89 = load i8*, i8** %reg_47_ptr
  store i8* %t89, i8** %var_remaining_ptr
  br label %sort_rows_b1
sort_rows_b8:
  %t90 = load i8*, i8** %var_a_ptr
  store i8* %t90, i8** %reg_26_ptr
  %t91 = load i8*, i8** %var_b_ptr
  store i8* %t91, i8** %reg_27_ptr
  %t92 = load i8*, i8** %reg_26_ptr
  %t93 = load i8*, i8** %reg_27_ptr
  %t94 = call i64 @obo_value_compare(i8* %t92, i8* %t93)
  %t95 = icmp slt i64 %t94, 0
  %t96 = zext i1 %t95 to i64
  store i64 %t96, i64* %reg_28_ptr
  %t97 = load i64, i64* %reg_28_ptr
  %t99 = icmp ne i64 %t97, 0
  %t100 = zext i1 %t99 to i64
  %t98 = icmp ne i64 %t100, 0
  br i1 %t98, label %sort_rows_b9, label %sort_rows_b10
sort_rows_b9:
  store i64 1, i64* %reg_29_ptr
  br label %sort_rows_b11
sort_rows_b10:
  store i64 0, i64* %reg_29_ptr
  br label %sort_rows_b11
sort_rows_b11:
  %t101 = load i64, i64* %reg_29_ptr
  %t103 = icmp ne i64 %t101, 0
  %t104 = zext i1 %t103 to i64
  %t102 = icmp ne i64 %t104, 0
  br i1 %t102, label %sort_rows_b12, label %sort_rows_b13
sort_rows_b12:
  %t105 = load i64, i64* %var_i_ptr
  store i64 %t105, i64* %reg_30_ptr
  %t106 = load i64, i64* %reg_30_ptr
  store i64 %t106, i64* %var_best_ptr
  br label %sort_rows_b14
sort_rows_b13:
  br label %sort_rows_b14
sort_rows_b14:
  %t107 = load i64, i64* %var_ascending_ptr
  store i64 %t107, i64* %reg_31_ptr
  %t108 = load i64, i64* %reg_31_ptr
  %t109 = icmp ne i64 %t108, 0
  %t110 = zext i1 %t109 to i64
  %t111 = icmp eq i64 %t110, 0
  %t112 = zext i1 %t111 to i64
  store i64 %t112, i64* %reg_32_ptr
  %t113 = load i64, i64* %reg_32_ptr
  %t115 = icmp ne i64 %t113, 0
  %t116 = zext i1 %t115 to i64
  %t114 = icmp ne i64 %t116, 0
  br i1 %t114, label %sort_rows_b15, label %sort_rows_b23
sort_rows_b23:
  store i64 0, i64* %reg_36_ptr
  br label %sort_rows_b18
sort_rows_b15:
  %t117 = load i8*, i8** %var_a_ptr
  store i8* %t117, i8** %reg_33_ptr
  %t118 = load i8*, i8** %var_b_ptr
  store i8* %t118, i8** %reg_34_ptr
  %t119 = load i8*, i8** %reg_33_ptr
  %t120 = load i8*, i8** %reg_34_ptr
  %t121 = call i64 @obo_value_compare(i8* %t119, i8* %t120)
  %t122 = icmp sgt i64 %t121, 0
  %t123 = zext i1 %t122 to i64
  store i64 %t123, i64* %reg_35_ptr
  %t124 = load i64, i64* %reg_35_ptr
  %t126 = icmp ne i64 %t124, 0
  %t127 = zext i1 %t126 to i64
  %t125 = icmp ne i64 %t127, 0
  br i1 %t125, label %sort_rows_b16, label %sort_rows_b17
sort_rows_b16:
  store i64 1, i64* %reg_36_ptr
  br label %sort_rows_b18
sort_rows_b17:
  store i64 0, i64* %reg_36_ptr
  br label %sort_rows_b18
sort_rows_b18:
  %t128 = load i64, i64* %reg_36_ptr
  %t130 = icmp ne i64 %t128, 0
  %t131 = zext i1 %t130 to i64
  %t129 = icmp ne i64 %t131, 0
  br i1 %t129, label %sort_rows_b19, label %sort_rows_b20
sort_rows_b19:
  %t132 = load i64, i64* %var_i_ptr
  store i64 %t132, i64* %reg_37_ptr
  %t133 = load i64, i64* %reg_37_ptr
  store i64 %t133, i64* %var_best_ptr
  br label %sort_rows_b21
sort_rows_b20:
  br label %sort_rows_b21
sort_rows_b21:
  br label %sort_rows_b6
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
  %var_rows_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_total_ptr = alloca i64
  %var___iter_idx_3_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
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
  %t24 = call i8* @obo_entity_get_boxed(i8* %t23, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
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
  %var_row_ptr = alloca i8*
  %var_best_ptr = alloca i8*
  %var___iter_idx_11_ptr = alloca i64
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_best_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
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
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %t47 = call i8* @obo_entity_get_boxed(i8* %t46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %t58 = call i64 @obo_value_compare(i8* %t56, i8* %t57)
  %t59 = icmp slt i64 %t58, 0
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_22_ptr
  %t61 = load i64, i64* %reg_22_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %min_of_b8, label %min_of_b9
min_of_b6:
  %t65 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i64, i64* %reg_24_ptr
  %t67 = add i64 %t66, 1
  store i64 %t67, i64* %reg_25_ptr
  %t68 = load i64, i64* %reg_25_ptr
  store i64 %t68, i64* %var___iter_idx_11_ptr
  br label %min_of_b4
min_of_b7:
  %t69 = load i8*, i8** %var_best_ptr
  store i8* %t69, i8** %reg_26_ptr
  %t70 = load i8*, i8** %reg_26_ptr
  call void @obo_gc_pop_roots(i64 23)
  ret i8* %t70
min_of_b8:
  %t71 = load i8*, i8** %var_v_ptr
  store i8* %t71, i8** %reg_23_ptr
  %t72 = load i8*, i8** %reg_23_ptr
  store i8* %t72, i8** %var_best_ptr
  br label %min_of_b10
min_of_b9:
  br label %min_of_b10
min_of_b10:
  br label %min_of_b6
}

define i8* @max_of(i8* %arg0, i8* %arg1) {
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
  %var_row_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_best_ptr = alloca i8*
  %var___iter_idx_11_ptr = alloca i64
  %var_rows_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_best_ptr)
  call void @obo_gc_push_root(i8** %var_rows_ptr)
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
  br i1 %t9, label %max_of_b1, label %max_of_b2
max_of_b1:
  %t12 = call i8* @obo_box_null()
  call void @obo_gc_pop_roots(i64 23)
  ret i8* %t12
max_of_b2:
  br label %max_of_b3
max_of_b3:
  %t13 = load i8*, i8** %var_rows_ptr
  store i8* %t13, i8** %reg_5_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t16 = call i8* @obo_value_as_mixed_list_ptr(i8* %t14)
  %t15 = call i8* @obo_mixed_list_get(i8* %t16, i64 0)
  store i8* %t15, i8** %reg_6_ptr
  %t17 = load i8*, i8** %reg_6_ptr
  %t18 = call i8* @obo_value_as_entity_ptr(i8* %t17)
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  br label %max_of_b4
max_of_b4:
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
  br i1 %t35, label %max_of_b5, label %max_of_b7
max_of_b5:
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
  %t47 = call i8* @obo_entity_get_boxed(i8* %t46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %t58 = call i64 @obo_value_compare(i8* %t56, i8* %t57)
  %t59 = icmp sgt i64 %t58, 0
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_22_ptr
  %t61 = load i64, i64* %reg_22_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %max_of_b8, label %max_of_b9
max_of_b6:
  %t65 = load i64, i64* %var___iter_idx_11_ptr
  store i64 %t65, i64* %reg_24_ptr
  %t66 = load i64, i64* %reg_24_ptr
  %t67 = add i64 %t66, 1
  store i64 %t67, i64* %reg_25_ptr
  %t68 = load i64, i64* %reg_25_ptr
  store i64 %t68, i64* %var___iter_idx_11_ptr
  br label %max_of_b4
max_of_b7:
  %t69 = load i8*, i8** %var_best_ptr
  store i8* %t69, i8** %reg_26_ptr
  %t70 = load i8*, i8** %reg_26_ptr
  call void @obo_gc_pop_roots(i64 23)
  ret i8* %t70
max_of_b8:
  %t71 = load i8*, i8** %var_v_ptr
  store i8* %t71, i8** %reg_23_ptr
  %t72 = load i8*, i8** %reg_23_ptr
  store i8* %t72, i8** %var_best_ptr
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
  %var_rows_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var___iter_idx_5_ptr = alloca i64
  %var_keys_ptr = alloca i8*
  %var_groups_ptr = alloca i8*
  %var_row_ptr = alloca i8*
  %var_key_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_rows_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_keys_ptr)
  call void @obo_gc_push_root(i8** %var_groups_ptr)
  call void @obo_gc_push_root(i8** %var_row_ptr)
  call void @obo_gc_push_root(i8** %var_key_ptr)
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
  %t27 = call i8* @obo_entity_get_boxed(i8* %t26, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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

define i8* @inner_join(i8* %arg0, i8* %arg1, i8* %arg2, i8* %arg3) {
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
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i8*
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i64
  %reg_43_ptr = alloca i64
  %reg_44_ptr = alloca i8*
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i64
  %reg_48_ptr = alloca i64
  %reg_49_ptr = alloca i64
  %reg_50_ptr = alloca i64
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i8*
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i8*
  %reg_57_ptr = alloca i8*
  %reg_58_ptr = alloca i8*
  %reg_59_ptr = alloca i8*
  %reg_60_ptr = alloca i64
  %reg_61_ptr = alloca i8*
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca i8*
  %reg_64_ptr = alloca i64
  %reg_65_ptr = alloca i64
  %reg_66_ptr = alloca i64
  %reg_67_ptr = alloca i64
  %reg_68_ptr = alloca i8*
  %reg_69_ptr = alloca i8*
  %reg_70_ptr = alloca i8*
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca i8*
  %reg_73_ptr = alloca i8*
  %reg_74_ptr = alloca i8*
  %reg_75_ptr = alloca i8*
  %reg_76_ptr = alloca i8*
  %reg_77_ptr = alloca i8*
  %reg_78_ptr = alloca i8*
  %reg_79_ptr = alloca i64
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca i8*
  %reg_82_ptr = alloca i8*
  %reg_83_ptr = alloca i64
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i64
  %reg_86_ptr = alloca i64
  %reg_87_ptr = alloca i8*
  %reg_88_ptr = alloca i8*
  %reg_89_ptr = alloca i8*
  %reg_90_ptr = alloca i8*
  %reg_91_ptr = alloca i8*
  %reg_92_ptr = alloca i8*
  %reg_93_ptr = alloca i8*
  %reg_94_ptr = alloca i8*
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca i8*
  %reg_97_ptr = alloca i8*
  %reg_98_ptr = alloca i64
  %reg_99_ptr = alloca i64
  %reg_100_ptr = alloca i64
  %reg_101_ptr = alloca i8*
  %reg_102_ptr = alloca i8*
  %reg_103_ptr = alloca i8*
  %reg_104_ptr = alloca i8*
  %reg_105_ptr = alloca i64
  %reg_106_ptr = alloca i64
  %reg_107_ptr = alloca i64
  %reg_108_ptr = alloca i64
  %reg_109_ptr = alloca i64
  %reg_110_ptr = alloca i64
  %reg_111_ptr = alloca i8*
  %reg_112_ptr = alloca i8*
  %reg_113_ptr = alloca i8*
  %reg_114_ptr = alloca i8*
  %reg_115_ptr = alloca i8*
  %var___iter_idx_83_ptr = alloca i64
  %var_t1_ptr = alloca i8*
  %var___iter_idx_23_ptr = alloca i64
  %var_joined_ptr = alloca i8*
  %var_r2_ptr = alloca i8*
  %var_col1_ptr = alloca i8*
  %var_rid_ptr = alloca i64
  %var___iter_idx_64_ptr = alloca i64
  %var_t2_ptr = alloca i8*
  %var___iter_idx_40_ptr = alloca i64
  %var_r1_ptr = alloca i8*
  %var_merged_ptr = alloca i8*
  %var___iter_idx_7_ptr = alloca i64
  %var_result_rows_ptr = alloca i8*
  %var_c_ptr = alloca i8*
  %var___iter_idx_47_ptr = alloca i64
  %var_cols_ptr = alloca i8*
  %var_col2_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i8* %arg1, i8** %reg_1_ptr
  store i8* %arg2, i8** %reg_2_ptr
  store i8* %arg3, i8** %reg_3_ptr
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
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_34_ptr)
  call void @obo_gc_push_root(i8** %reg_37_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_39_ptr)
  call void @obo_gc_push_root(i8** %reg_44_ptr)
  call void @obo_gc_push_root(i8** %reg_45_ptr)
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_51_ptr)
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_53_ptr)
  call void @obo_gc_push_root(i8** %reg_54_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %reg_56_ptr)
  call void @obo_gc_push_root(i8** %reg_57_ptr)
  call void @obo_gc_push_root(i8** %reg_58_ptr)
  call void @obo_gc_push_root(i8** %reg_59_ptr)
  call void @obo_gc_push_root(i8** %reg_61_ptr)
  call void @obo_gc_push_root(i8** %reg_62_ptr)
  call void @obo_gc_push_root(i8** %reg_63_ptr)
  call void @obo_gc_push_root(i8** %reg_68_ptr)
  call void @obo_gc_push_root(i8** %reg_69_ptr)
  call void @obo_gc_push_root(i8** %reg_70_ptr)
  call void @obo_gc_push_root(i8** %reg_71_ptr)
  call void @obo_gc_push_root(i8** %reg_72_ptr)
  call void @obo_gc_push_root(i8** %reg_73_ptr)
  call void @obo_gc_push_root(i8** %reg_74_ptr)
  call void @obo_gc_push_root(i8** %reg_75_ptr)
  call void @obo_gc_push_root(i8** %reg_76_ptr)
  call void @obo_gc_push_root(i8** %reg_77_ptr)
  call void @obo_gc_push_root(i8** %reg_78_ptr)
  call void @obo_gc_push_root(i8** %reg_81_ptr)
  call void @obo_gc_push_root(i8** %reg_82_ptr)
  call void @obo_gc_push_root(i8** %reg_87_ptr)
  call void @obo_gc_push_root(i8** %reg_88_ptr)
  call void @obo_gc_push_root(i8** %reg_89_ptr)
  call void @obo_gc_push_root(i8** %reg_90_ptr)
  call void @obo_gc_push_root(i8** %reg_91_ptr)
  call void @obo_gc_push_root(i8** %reg_92_ptr)
  call void @obo_gc_push_root(i8** %reg_93_ptr)
  call void @obo_gc_push_root(i8** %reg_94_ptr)
  call void @obo_gc_push_root(i8** %reg_95_ptr)
  call void @obo_gc_push_root(i8** %reg_96_ptr)
  call void @obo_gc_push_root(i8** %reg_97_ptr)
  call void @obo_gc_push_root(i8** %reg_101_ptr)
  call void @obo_gc_push_root(i8** %reg_102_ptr)
  call void @obo_gc_push_root(i8** %reg_103_ptr)
  call void @obo_gc_push_root(i8** %reg_104_ptr)
  call void @obo_gc_push_root(i8** %reg_111_ptr)
  call void @obo_gc_push_root(i8** %reg_112_ptr)
  call void @obo_gc_push_root(i8** %reg_113_ptr)
  call void @obo_gc_push_root(i8** %reg_114_ptr)
  call void @obo_gc_push_root(i8** %reg_115_ptr)
  call void @obo_gc_push_root(i8** %var_t1_ptr)
  call void @obo_gc_push_root(i8** %var_joined_ptr)
  call void @obo_gc_push_root(i8** %var_r2_ptr)
  call void @obo_gc_push_root(i8** %var_col1_ptr)
  call void @obo_gc_push_root(i8** %var_t2_ptr)
  call void @obo_gc_push_root(i8** %var_r1_ptr)
  call void @obo_gc_push_root(i8** %var_merged_ptr)
  call void @obo_gc_push_root(i8** %var_result_rows_ptr)
  call void @obo_gc_push_root(i8** %var_c_ptr)
  call void @obo_gc_push_root(i8** %var_cols_ptr)
  call void @obo_gc_push_root(i8** %var_col2_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_t1_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_t2_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_col1_ptr
  %t3 = load i8*, i8** %reg_3_ptr
  store i8* %t3, i8** %var_col2_ptr
  %t4 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t4, i8** %reg_4_ptr
  %t5 = load i8*, i8** %reg_4_ptr
  store i8* %t5, i8** %var_cols_ptr
  %t6 = load i8*, i8** %var_t1_ptr
  store i8* %t6, i8** %reg_5_ptr
  %t7 = load i8*, i8** %reg_5_ptr
  %t8 = call i8* @obo_entity_get_boxed(i8* %t7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t8, i8** %reg_6_ptr
  store i64 0, i64* %var___iter_idx_7_ptr
  %t9 = load i8*, i8** %reg_6_ptr
  %t10 = call i64 @obo_value_len(i8* %t9)
  store i64 %t10, i64* %reg_7_ptr
  br label %inner_join_b1
inner_join_b1:
  %t11 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t11, i64* %reg_8_ptr
  %t12 = load i64, i64* %reg_8_ptr
  %t13 = load i64, i64* %reg_7_ptr
  %t14 = icmp slt i64 %t12, %t13
  %t15 = zext i1 %t14 to i64
  store i64 %t15, i64* %reg_9_ptr
  %t16 = load i64, i64* %reg_9_ptr
  %t18 = icmp ne i64 %t16, 0
  %t19 = zext i1 %t18 to i64
  %t17 = icmp ne i64 %t19, 0
  br i1 %t17, label %inner_join_b2, label %inner_join_b4
inner_join_b2:
  %t20 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t20, i64* %reg_10_ptr
  %t21 = load i8*, i8** %reg_6_ptr
  %t22 = load i64, i64* %reg_10_ptr
  %t24 = call i8* @obo_value_as_mixed_list_ptr(i8* %t21)
  %t23 = call i8* @obo_mixed_list_get(i8* %t24, i64 %t22)
  store i8* %t23, i8** %reg_11_ptr
  %t25 = load i8*, i8** %reg_11_ptr
  store i8* %t25, i8** %var_c_ptr
  %t26 = load i8*, i8** %var_t1_ptr
  store i8* %t26, i8** %reg_12_ptr
  %t27 = load i8*, i8** %reg_12_ptr
  %t28 = call i8* @obo_entity_get_boxed(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t28, i8** %reg_13_ptr
  %t29 = load i8*, i8** %reg_13_ptr
  %t30 = call i8* @obo_value_to_str(i8* %t29)
  %t31 = call i8* @obo_str_concat(i8* %t30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t31, i8** %reg_14_ptr
  %t32 = load i8*, i8** %var_c_ptr
  store i8* %t32, i8** %reg_15_ptr
  %t33 = load i8*, i8** %reg_14_ptr
  %t34 = load i8*, i8** %reg_15_ptr
  %t35 = call i8* @obo_value_to_str(i8* %t34)
  %t36 = call i8* @obo_str_concat(i8* %t33, i8* %t35)
  store i8* %t36, i8** %reg_16_ptr
  %t37 = load i8*, i8** %var_cols_ptr
  store i8* %t37, i8** %reg_17_ptr
  %t38 = load i8*, i8** %reg_17_ptr
  %t39 = load i8*, i8** %reg_16_ptr
  %t40 = call i8* @obo_box_str(i8* %t39)
  %t41 = call i8* @obo_mixed_list_add(i8* %t38, i8* %t40)
  store i8* %t41, i8** %reg_18_ptr
  %t42 = load i8*, i8** %reg_18_ptr
  store i8* %t42, i8** %var_cols_ptr
  br label %inner_join_b3
inner_join_b3:
  %t43 = load i64, i64* %var___iter_idx_7_ptr
  store i64 %t43, i64* %reg_19_ptr
  %t44 = load i64, i64* %reg_19_ptr
  %t45 = add i64 %t44, 1
  store i64 %t45, i64* %reg_20_ptr
  %t46 = load i64, i64* %reg_20_ptr
  store i64 %t46, i64* %var___iter_idx_7_ptr
  br label %inner_join_b1
inner_join_b4:
  %t47 = load i8*, i8** %var_t2_ptr
  store i8* %t47, i8** %reg_21_ptr
  %t48 = load i8*, i8** %reg_21_ptr
  %t49 = call i8* @obo_entity_get_boxed(i8* %t48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t49, i8** %reg_22_ptr
  store i64 0, i64* %var___iter_idx_23_ptr
  %t50 = load i8*, i8** %reg_22_ptr
  %t51 = call i64 @obo_value_len(i8* %t50)
  store i64 %t51, i64* %reg_23_ptr
  br label %inner_join_b5
inner_join_b5:
  %t52 = load i64, i64* %var___iter_idx_23_ptr
  store i64 %t52, i64* %reg_24_ptr
  %t53 = load i64, i64* %reg_24_ptr
  %t54 = load i64, i64* %reg_23_ptr
  %t55 = icmp slt i64 %t53, %t54
  %t56 = zext i1 %t55 to i64
  store i64 %t56, i64* %reg_25_ptr
  %t57 = load i64, i64* %reg_25_ptr
  %t59 = icmp ne i64 %t57, 0
  %t60 = zext i1 %t59 to i64
  %t58 = icmp ne i64 %t60, 0
  br i1 %t58, label %inner_join_b6, label %inner_join_b8
inner_join_b6:
  %t61 = load i64, i64* %var___iter_idx_23_ptr
  store i64 %t61, i64* %reg_26_ptr
  %t62 = load i8*, i8** %reg_22_ptr
  %t63 = load i64, i64* %reg_26_ptr
  %t65 = call i8* @obo_value_as_mixed_list_ptr(i8* %t62)
  %t64 = call i8* @obo_mixed_list_get(i8* %t65, i64 %t63)
  store i8* %t64, i8** %reg_27_ptr
  %t66 = load i8*, i8** %reg_27_ptr
  store i8* %t66, i8** %var_c_ptr
  %t67 = load i8*, i8** %var_t2_ptr
  store i8* %t67, i8** %reg_28_ptr
  %t68 = load i8*, i8** %reg_28_ptr
  %t69 = call i8* @obo_entity_get_boxed(i8* %t68, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t69, i8** %reg_29_ptr
  %t70 = load i8*, i8** %reg_29_ptr
  %t71 = call i8* @obo_value_to_str(i8* %t70)
  %t72 = call i8* @obo_str_concat(i8* %t71, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t72, i8** %reg_30_ptr
  %t73 = load i8*, i8** %var_c_ptr
  store i8* %t73, i8** %reg_31_ptr
  %t74 = load i8*, i8** %reg_30_ptr
  %t75 = load i8*, i8** %reg_31_ptr
  %t76 = call i8* @obo_value_to_str(i8* %t75)
  %t77 = call i8* @obo_str_concat(i8* %t74, i8* %t76)
  store i8* %t77, i8** %reg_32_ptr
  %t78 = load i8*, i8** %var_cols_ptr
  store i8* %t78, i8** %reg_33_ptr
  %t79 = load i8*, i8** %reg_33_ptr
  %t80 = load i8*, i8** %reg_32_ptr
  %t81 = call i8* @obo_box_str(i8* %t80)
  %t82 = call i8* @obo_mixed_list_add(i8* %t79, i8* %t81)
  store i8* %t82, i8** %reg_34_ptr
  %t83 = load i8*, i8** %reg_34_ptr
  store i8* %t83, i8** %var_cols_ptr
  br label %inner_join_b7
inner_join_b7:
  %t84 = load i64, i64* %var___iter_idx_23_ptr
  store i64 %t84, i64* %reg_35_ptr
  %t85 = load i64, i64* %reg_35_ptr
  %t86 = add i64 %t85, 1
  store i64 %t86, i64* %reg_36_ptr
  %t87 = load i64, i64* %reg_36_ptr
  store i64 %t87, i64* %var___iter_idx_23_ptr
  br label %inner_join_b5
inner_join_b8:
  %t88 = call i8* @obo_list_new_i64(i64 0, i64* null)
  store i8* %t88, i8** %reg_37_ptr
  %t89 = load i8*, i8** %reg_37_ptr
  store i8* %t89, i8** %var_result_rows_ptr
  store i64 1, i64* %var_rid_ptr
  %t90 = load i8*, i8** %var_t1_ptr
  store i8* %t90, i8** %reg_38_ptr
  %t91 = load i8*, i8** %reg_38_ptr
  %t92 = call i8* @obo_entity_get_boxed(i8* %t91, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t92, i8** %reg_39_ptr
  store i64 0, i64* %var___iter_idx_40_ptr
  %t93 = load i8*, i8** %reg_39_ptr
  %t94 = call i64 @obo_value_len(i8* %t93)
  store i64 %t94, i64* %reg_40_ptr
  br label %inner_join_b9
inner_join_b9:
  %t95 = load i64, i64* %var___iter_idx_40_ptr
  store i64 %t95, i64* %reg_41_ptr
  %t96 = load i64, i64* %reg_41_ptr
  %t97 = load i64, i64* %reg_40_ptr
  %t98 = icmp slt i64 %t96, %t97
  %t99 = zext i1 %t98 to i64
  store i64 %t99, i64* %reg_42_ptr
  %t100 = load i64, i64* %reg_42_ptr
  %t102 = icmp ne i64 %t100, 0
  %t103 = zext i1 %t102 to i64
  %t101 = icmp ne i64 %t103, 0
  br i1 %t101, label %inner_join_b10, label %inner_join_b12
inner_join_b10:
  %t104 = load i64, i64* %var___iter_idx_40_ptr
  store i64 %t104, i64* %reg_43_ptr
  %t105 = load i8*, i8** %reg_39_ptr
  %t106 = load i64, i64* %reg_43_ptr
  %t108 = call i8* @obo_value_as_mixed_list_ptr(i8* %t105)
  %t107 = call i8* @obo_mixed_list_get(i8* %t108, i64 %t106)
  store i8* %t107, i8** %reg_44_ptr
  %t109 = load i8*, i8** %reg_44_ptr
  store i8* %t109, i8** %var_r1_ptr
  %t110 = load i8*, i8** %var_t2_ptr
  store i8* %t110, i8** %reg_45_ptr
  %t111 = load i8*, i8** %reg_45_ptr
  %t112 = call i8* @obo_entity_get_boxed(i8* %t111, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t112, i8** %reg_46_ptr
  store i64 0, i64* %var___iter_idx_47_ptr
  %t113 = load i8*, i8** %reg_46_ptr
  %t114 = call i64 @obo_value_len(i8* %t113)
  store i64 %t114, i64* %reg_47_ptr
  br label %inner_join_b13
inner_join_b11:
  %t115 = load i64, i64* %var___iter_idx_40_ptr
  store i64 %t115, i64* %reg_109_ptr
  %t116 = load i64, i64* %reg_109_ptr
  %t117 = add i64 %t116, 1
  store i64 %t117, i64* %reg_110_ptr
  %t118 = load i64, i64* %reg_110_ptr
  store i64 %t118, i64* %var___iter_idx_40_ptr
  br label %inner_join_b9
inner_join_b12:
  %t119 = load i8*, i8** %var_cols_ptr
  store i8* %t119, i8** %reg_111_ptr
  %t120 = load i8*, i8** %reg_111_ptr
  %t121 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.8, i64 0, i64 0), i8* %t120)
  store i8* %t121, i8** %reg_112_ptr
  %t122 = load i8*, i8** %reg_112_ptr
  store i8* %t122, i8** %var_joined_ptr
  %t123 = load i8*, i8** %var_result_rows_ptr
  store i8* %t123, i8** %reg_113_ptr
  %t124 = load i8*, i8** %var_joined_ptr
  store i8* %t124, i8** %reg_114_ptr
  %t125 = load i8*, i8** %reg_114_ptr
  %t126 = load i8*, i8** %reg_113_ptr
  call void @obo_entity_put_list(i8* %t125, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t126)
  %t127 = load i8*, i8** %var_joined_ptr
  store i8* %t127, i8** %reg_115_ptr
  %t128 = load i8*, i8** %reg_115_ptr
  call void @obo_gc_pop_roots(i64 87)
  ret i8* %t128
inner_join_b13:
  %t129 = load i64, i64* %var___iter_idx_47_ptr
  store i64 %t129, i64* %reg_48_ptr
  %t130 = load i64, i64* %reg_48_ptr
  %t131 = load i64, i64* %reg_47_ptr
  %t132 = icmp slt i64 %t130, %t131
  %t133 = zext i1 %t132 to i64
  store i64 %t133, i64* %reg_49_ptr
  %t134 = load i64, i64* %reg_49_ptr
  %t136 = icmp ne i64 %t134, 0
  %t137 = zext i1 %t136 to i64
  %t135 = icmp ne i64 %t137, 0
  br i1 %t135, label %inner_join_b14, label %inner_join_b16
inner_join_b14:
  %t138 = load i64, i64* %var___iter_idx_47_ptr
  store i64 %t138, i64* %reg_50_ptr
  %t139 = load i8*, i8** %reg_46_ptr
  %t140 = load i64, i64* %reg_50_ptr
  %t142 = call i8* @obo_value_as_mixed_list_ptr(i8* %t139)
  %t141 = call i8* @obo_mixed_list_get(i8* %t142, i64 %t140)
  store i8* %t141, i8** %reg_51_ptr
  %t143 = load i8*, i8** %reg_51_ptr
  store i8* %t143, i8** %var_r2_ptr
  %t144 = load i8*, i8** %var_r1_ptr
  store i8* %t144, i8** %reg_52_ptr
  %t145 = load i8*, i8** %reg_52_ptr
  %t146 = call i8* @obo_value_as_entity_ptr(i8* %t145)
  %t147 = call i8* @obo_entity_get_boxed(i8* %t146, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t147, i8** %reg_53_ptr
  %t148 = load i8*, i8** %var_col1_ptr
  store i8* %t148, i8** %reg_54_ptr
  %t149 = load i8*, i8** %reg_53_ptr
  %t150 = load i8*, i8** %reg_54_ptr
  %t152 = call i8* @obo_value_as_map_ptr(i8* %t149)
  %t151 = call i8* @obo_map_get_boxed(i8* %t152, i8* %t150)
  store i8* %t151, i8** %reg_55_ptr
  %t153 = load i8*, i8** %var_r2_ptr
  store i8* %t153, i8** %reg_56_ptr
  %t154 = load i8*, i8** %reg_56_ptr
  %t155 = call i8* @obo_value_as_entity_ptr(i8* %t154)
  %t156 = call i8* @obo_entity_get_boxed(i8* %t155, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t156, i8** %reg_57_ptr
  %t157 = load i8*, i8** %var_col2_ptr
  store i8* %t157, i8** %reg_58_ptr
  %t158 = load i8*, i8** %reg_57_ptr
  %t159 = load i8*, i8** %reg_58_ptr
  %t161 = call i8* @obo_value_as_map_ptr(i8* %t158)
  %t160 = call i8* @obo_map_get_boxed(i8* %t161, i8* %t159)
  store i8* %t160, i8** %reg_59_ptr
  %t162 = load i8*, i8** %reg_55_ptr
  %t163 = load i8*, i8** %reg_59_ptr
  %t164 = call i64 @obo_value_compare(i8* %t162, i8* %t163)
  %t165 = icmp eq i64 %t164, 0
  %t166 = zext i1 %t165 to i64
  store i64 %t166, i64* %reg_60_ptr
  %t167 = load i64, i64* %reg_60_ptr
  %t169 = icmp ne i64 %t167, 0
  %t170 = zext i1 %t169 to i64
  %t168 = icmp ne i64 %t170, 0
  br i1 %t168, label %inner_join_b17, label %inner_join_b18
inner_join_b15:
  %t171 = load i64, i64* %var___iter_idx_47_ptr
  store i64 %t171, i64* %reg_107_ptr
  %t172 = load i64, i64* %reg_107_ptr
  %t173 = add i64 %t172, 1
  store i64 %t173, i64* %reg_108_ptr
  %t174 = load i64, i64* %reg_108_ptr
  store i64 %t174, i64* %var___iter_idx_47_ptr
  br label %inner_join_b13
inner_join_b16:
  br label %inner_join_b11
inner_join_b17:
  %t175 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t175, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.9, i64 0, i64 0), i64 0)
  store i8* %t175, i8** %reg_61_ptr
  %t176 = load i8*, i8** %reg_61_ptr
  store i8* %t176, i8** %var_merged_ptr
  %t177 = load i8*, i8** %var_t1_ptr
  store i8* %t177, i8** %reg_62_ptr
  %t178 = load i8*, i8** %reg_62_ptr
  %t179 = call i8* @obo_entity_get_boxed(i8* %t178, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t179, i8** %reg_63_ptr
  store i64 0, i64* %var___iter_idx_64_ptr
  %t180 = load i8*, i8** %reg_63_ptr
  %t181 = call i64 @obo_value_len(i8* %t180)
  store i64 %t181, i64* %reg_64_ptr
  br label %inner_join_b20
inner_join_b18:
  br label %inner_join_b19
inner_join_b19:
  br label %inner_join_b15
inner_join_b20:
  %t182 = load i64, i64* %var___iter_idx_64_ptr
  store i64 %t182, i64* %reg_65_ptr
  %t183 = load i64, i64* %reg_65_ptr
  %t184 = load i64, i64* %reg_64_ptr
  %t185 = icmp slt i64 %t183, %t184
  %t186 = zext i1 %t185 to i64
  store i64 %t186, i64* %reg_66_ptr
  %t187 = load i64, i64* %reg_66_ptr
  %t189 = icmp ne i64 %t187, 0
  %t190 = zext i1 %t189 to i64
  %t188 = icmp ne i64 %t190, 0
  br i1 %t188, label %inner_join_b21, label %inner_join_b23
inner_join_b21:
  %t191 = load i64, i64* %var___iter_idx_64_ptr
  store i64 %t191, i64* %reg_67_ptr
  %t192 = load i8*, i8** %reg_63_ptr
  %t193 = load i64, i64* %reg_67_ptr
  %t195 = call i8* @obo_value_as_mixed_list_ptr(i8* %t192)
  %t194 = call i8* @obo_mixed_list_get(i8* %t195, i64 %t193)
  store i8* %t194, i8** %reg_68_ptr
  %t196 = load i8*, i8** %reg_68_ptr
  store i8* %t196, i8** %var_c_ptr
  %t197 = load i8*, i8** %var_r1_ptr
  store i8* %t197, i8** %reg_69_ptr
  %t198 = load i8*, i8** %reg_69_ptr
  %t199 = call i8* @obo_value_as_entity_ptr(i8* %t198)
  %t200 = call i8* @obo_entity_get_boxed(i8* %t199, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t200, i8** %reg_70_ptr
  %t201 = load i8*, i8** %var_c_ptr
  store i8* %t201, i8** %reg_71_ptr
  %t202 = load i8*, i8** %reg_70_ptr
  %t203 = load i8*, i8** %reg_71_ptr
  %t204 = call i8* @obo_value_to_str(i8* %t203)
  %t206 = call i8* @obo_value_as_map_ptr(i8* %t202)
  %t205 = call i8* @obo_map_get_boxed(i8* %t206, i8* %t204)
  store i8* %t205, i8** %reg_72_ptr
  %t207 = load i8*, i8** %var_merged_ptr
  store i8* %t207, i8** %reg_73_ptr
  %t208 = load i8*, i8** %var_t1_ptr
  store i8* %t208, i8** %reg_74_ptr
  %t209 = load i8*, i8** %reg_74_ptr
  %t210 = call i8* @obo_entity_get_boxed(i8* %t209, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t210, i8** %reg_75_ptr
  %t211 = load i8*, i8** %reg_75_ptr
  %t212 = call i8* @obo_value_to_str(i8* %t211)
  %t213 = call i8* @obo_str_concat(i8* %t212, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t213, i8** %reg_76_ptr
  %t214 = load i8*, i8** %var_c_ptr
  store i8* %t214, i8** %reg_77_ptr
  %t215 = load i8*, i8** %reg_76_ptr
  %t216 = load i8*, i8** %reg_77_ptr
  %t217 = call i8* @obo_value_to_str(i8* %t216)
  %t218 = call i8* @obo_str_concat(i8* %t215, i8* %t217)
  store i8* %t218, i8** %reg_78_ptr
  %t219 = load i8*, i8** %reg_73_ptr
  %t220 = load i8*, i8** %reg_78_ptr
  %t221 = load i8*, i8** %reg_72_ptr
  call void @obo_map_put_boxed(i8* %t219, i8* %t220, i8* %t221)
  br label %inner_join_b22
inner_join_b22:
  %t222 = load i64, i64* %var___iter_idx_64_ptr
  store i64 %t222, i64* %reg_79_ptr
  %t223 = load i64, i64* %reg_79_ptr
  %t224 = add i64 %t223, 1
  store i64 %t224, i64* %reg_80_ptr
  %t225 = load i64, i64* %reg_80_ptr
  store i64 %t225, i64* %var___iter_idx_64_ptr
  br label %inner_join_b20
inner_join_b23:
  %t226 = load i8*, i8** %var_t2_ptr
  store i8* %t226, i8** %reg_81_ptr
  %t227 = load i8*, i8** %reg_81_ptr
  %t228 = call i8* @obo_entity_get_boxed(i8* %t227, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t228, i8** %reg_82_ptr
  store i64 0, i64* %var___iter_idx_83_ptr
  %t229 = load i8*, i8** %reg_82_ptr
  %t230 = call i64 @obo_value_len(i8* %t229)
  store i64 %t230, i64* %reg_83_ptr
  br label %inner_join_b24
inner_join_b24:
  %t231 = load i64, i64* %var___iter_idx_83_ptr
  store i64 %t231, i64* %reg_84_ptr
  %t232 = load i64, i64* %reg_84_ptr
  %t233 = load i64, i64* %reg_83_ptr
  %t234 = icmp slt i64 %t232, %t233
  %t235 = zext i1 %t234 to i64
  store i64 %t235, i64* %reg_85_ptr
  %t236 = load i64, i64* %reg_85_ptr
  %t238 = icmp ne i64 %t236, 0
  %t239 = zext i1 %t238 to i64
  %t237 = icmp ne i64 %t239, 0
  br i1 %t237, label %inner_join_b25, label %inner_join_b27
inner_join_b25:
  %t240 = load i64, i64* %var___iter_idx_83_ptr
  store i64 %t240, i64* %reg_86_ptr
  %t241 = load i8*, i8** %reg_82_ptr
  %t242 = load i64, i64* %reg_86_ptr
  %t244 = call i8* @obo_value_as_mixed_list_ptr(i8* %t241)
  %t243 = call i8* @obo_mixed_list_get(i8* %t244, i64 %t242)
  store i8* %t243, i8** %reg_87_ptr
  %t245 = load i8*, i8** %reg_87_ptr
  store i8* %t245, i8** %var_c_ptr
  %t246 = load i8*, i8** %var_r2_ptr
  store i8* %t246, i8** %reg_88_ptr
  %t247 = load i8*, i8** %reg_88_ptr
  %t248 = call i8* @obo_value_as_entity_ptr(i8* %t247)
  %t249 = call i8* @obo_entity_get_boxed(i8* %t248, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t249, i8** %reg_89_ptr
  %t250 = load i8*, i8** %var_c_ptr
  store i8* %t250, i8** %reg_90_ptr
  %t251 = load i8*, i8** %reg_89_ptr
  %t252 = load i8*, i8** %reg_90_ptr
  %t253 = call i8* @obo_value_to_str(i8* %t252)
  %t255 = call i8* @obo_value_as_map_ptr(i8* %t251)
  %t254 = call i8* @obo_map_get_boxed(i8* %t255, i8* %t253)
  store i8* %t254, i8** %reg_91_ptr
  %t256 = load i8*, i8** %var_merged_ptr
  store i8* %t256, i8** %reg_92_ptr
  %t257 = load i8*, i8** %var_t2_ptr
  store i8* %t257, i8** %reg_93_ptr
  %t258 = load i8*, i8** %reg_93_ptr
  %t259 = call i8* @obo_entity_get_boxed(i8* %t258, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t259, i8** %reg_94_ptr
  %t260 = load i8*, i8** %reg_94_ptr
  %t261 = call i8* @obo_value_to_str(i8* %t260)
  %t262 = call i8* @obo_str_concat(i8* %t261, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t262, i8** %reg_95_ptr
  %t263 = load i8*, i8** %var_c_ptr
  store i8* %t263, i8** %reg_96_ptr
  %t264 = load i8*, i8** %reg_95_ptr
  %t265 = load i8*, i8** %reg_96_ptr
  %t266 = call i8* @obo_value_to_str(i8* %t265)
  %t267 = call i8* @obo_str_concat(i8* %t264, i8* %t266)
  store i8* %t267, i8** %reg_97_ptr
  %t268 = load i8*, i8** %reg_92_ptr
  %t269 = load i8*, i8** %reg_97_ptr
  %t270 = load i8*, i8** %reg_91_ptr
  call void @obo_map_put_boxed(i8* %t268, i8* %t269, i8* %t270)
  br label %inner_join_b26
inner_join_b26:
  %t271 = load i64, i64* %var___iter_idx_83_ptr
  store i64 %t271, i64* %reg_98_ptr
  %t272 = load i64, i64* %reg_98_ptr
  %t273 = add i64 %t272, 1
  store i64 %t273, i64* %reg_99_ptr
  %t274 = load i64, i64* %reg_99_ptr
  store i64 %t274, i64* %var___iter_idx_83_ptr
  br label %inner_join_b24
inner_join_b27:
  %t275 = load i64, i64* %var_rid_ptr
  store i64 %t275, i64* %reg_100_ptr
  %t276 = load i8*, i8** %var_merged_ptr
  store i8* %t276, i8** %reg_101_ptr
  %t277 = call i8* @obo_entity_new(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.135, i64 0, i64 0))
  %t278 = load i64, i64* %reg_100_ptr
  call void @obo_entity_put_i64(i8* %t277, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.136, i64 0, i64 0), i64 %t278)
  %t279 = load i8*, i8** %reg_101_ptr
  call void @obo_entity_put_map(i8* %t277, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0), i8* %t279)
  store i8* %t277, i8** %reg_102_ptr
  %t280 = load i8*, i8** %var_result_rows_ptr
  store i8* %t280, i8** %reg_103_ptr
  %t281 = load i8*, i8** %reg_103_ptr
  %t282 = load i8*, i8** %reg_102_ptr
  %t283 = call i8* @obo_box_entity(i8* %t282)
  %t284 = call i8* @obo_mixed_list_add(i8* %t281, i8* %t283)
  store i8* %t284, i8** %reg_104_ptr
  %t285 = load i8*, i8** %reg_104_ptr
  store i8* %t285, i8** %var_result_rows_ptr
  %t286 = load i64, i64* %var_rid_ptr
  store i64 %t286, i64* %reg_105_ptr
  %t287 = load i64, i64* %reg_105_ptr
  %t288 = add i64 %t287, 1
  store i64 %t288, i64* %reg_106_ptr
  %t289 = load i64, i64* %reg_106_ptr
  store i64 %t289, i64* %var_rid_ptr
  br label %inner_join_b19
}

define i8* @Table_create(i8* %arg0, i8* %arg1) {
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
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
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
  %t5 = call i8* @obo_entity_new(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.137, i64 0, i64 0))
  %t6 = load i8*, i8** %reg_2_ptr
  call void @obo_entity_put_str(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* %t6)
  %t7 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0), i8* %t7)
  %t8 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t8)
  call void @obo_entity_put_i64(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.138, i64 0, i64 0), i64 1)
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
  %var_r_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_record_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_record_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_record_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.138, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %var_record_ptr
  store i8* %t5, i8** %reg_4_ptr
  %t6 = call i8* @obo_entity_new(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.135, i64 0, i64 0))
  %t7 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_boxed(i8* %t6, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.136, i64 0, i64 0), i8* %t7)
  %t8 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_map(i8* %t6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0), i8* %t8)
  store i8* %t6, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  store i8* %t9, i8** %var_r_ptr
  %t10 = load i8*, i8** %var_r_ptr
  store i8* %t10, i8** %reg_6_ptr
  %t11 = load i8*, i8** %var_self_ptr
  store i8* %t11, i8** %reg_7_ptr
  %t12 = load i8*, i8** %reg_7_ptr
  %t13 = call i8* @obo_entity_get_boxed(i8* %t12, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  call void @obo_entity_put_boxed(i8* %t21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t22)
  %t23 = load i8*, i8** %var_self_ptr
  store i8* %t23, i8** %reg_11_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @obo_entity_get_boxed(i8* %t24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.138, i64 0, i64 0))
  store i8* %t25, i8** %reg_12_ptr
  %t26 = load i8*, i8** %reg_12_ptr
  %t27 = call i64 @obo_value_as_i64(i8* %t26)
  %t28 = add i64 %t27, 1
  store i64 %t28, i64* %reg_13_ptr
  %t29 = load i8*, i8** %var_self_ptr
  store i8* %t29, i8** %reg_14_ptr
  %t30 = load i8*, i8** %reg_14_ptr
  %t31 = load i64, i64* %reg_13_ptr
  call void @obo_entity_put_i64(i8* %t30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.138, i64 0, i64 0), i64 %t31)
  %t32 = load i8*, i8** %var_r_ptr
  store i8* %t32, i8** %reg_15_ptr
  %t33 = load i8*, i8** %reg_15_ptr
  %t34 = call i8* @obo_entity_get_boxed(i8* %t33, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.136, i64 0, i64 0))
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
  %var_current_ptr = alloca i8*
  %var_filtered_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_current_ptr)
  call void @obo_gc_push_root(i8** %var_filtered_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  %t16 = call i8* @obo_entity_get_boxed(i8* %t15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %var_self_ptr
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  %t19 = call i8* @obo_entity_get_boxed(i8* %t18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %reg_8_ptr
  %t21 = call i8* @obo_value_to_str(i8* %t20)
  %t22 = load i8*, i8** %reg_10_ptr
  %t23 = call i8* @obo_value_as_mixed_list_ptr(i8* %t22)
  %t24 = call i8* @Table_create(i8* %t21, i8* %t23)
  store i8* %t24, i8** %reg_11_ptr
  %t25 = load i8*, i8** %reg_11_ptr
  store i8* %t25, i8** %var_t_ptr
  %t26 = load i8*, i8** %var_filtered_ptr
  store i8* %t26, i8** %reg_12_ptr
  %t27 = load i8*, i8** %var_t_ptr
  store i8* %t27, i8** %reg_13_ptr
  %t28 = load i8*, i8** %reg_13_ptr
  %t29 = load i8*, i8** %reg_12_ptr
  call void @obo_entity_put_boxed(i8* %t28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t29)
  %t30 = load i8*, i8** %var_t_ptr
  store i8* %t30, i8** %reg_14_ptr
  %t31 = load i8*, i8** %reg_14_ptr
  call void @obo_gc_pop_roots(i64 20)
  ret i8* %t31
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
  %var_t_ptr = alloca i8*
  %var_column_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
  %var_ascending_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_column_ptr)
  call void @obo_gc_push_root(i8** %var_sorted_ptr)
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  %t15 = call i8* @obo_entity_get_boxed(i8* %t14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t15, i8** %reg_9_ptr
  %t16 = load i8*, i8** %var_self_ptr
  store i8* %t16, i8** %reg_10_ptr
  %t17 = load i8*, i8** %reg_10_ptr
  %t18 = call i8* @obo_entity_get_boxed(i8* %t17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t18, i8** %reg_11_ptr
  %t19 = load i8*, i8** %reg_9_ptr
  %t20 = call i8* @obo_value_to_str(i8* %t19)
  %t21 = load i8*, i8** %reg_11_ptr
  %t22 = call i8* @obo_value_as_mixed_list_ptr(i8* %t21)
  %t23 = call i8* @Table_create(i8* %t20, i8* %t22)
  store i8* %t23, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_12_ptr
  store i8* %t24, i8** %var_t_ptr
  %t25 = load i8*, i8** %var_sorted_ptr
  store i8* %t25, i8** %reg_13_ptr
  %t26 = load i8*, i8** %var_t_ptr
  store i8* %t26, i8** %reg_14_ptr
  %t27 = load i8*, i8** %reg_14_ptr
  %t28 = load i8*, i8** %reg_13_ptr
  call void @obo_entity_put_list(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t28)
  %t29 = load i8*, i8** %var_t_ptr
  store i8* %t29, i8** %reg_15_ptr
  %t30 = load i8*, i8** %reg_15_ptr
  call void @obo_gc_pop_roots(i64 18)
  ret i8* %t30
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
  %var_self_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var_changed_ptr = alloca i64
  %var_r_ptr = alloca i8*
  %var_current_ptr = alloca i8*
  %var___iter_idx_7_ptr = alloca i64
  %var_new_rows_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_current_ptr)
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  call void @obo_entity_put_list(i8* %t43, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t44)
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
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
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
  %t61 = call i8* @obo_entity_get_boxed(i8* %t60, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.136, i64 0, i64 0))
  store i8* %t61, i8** %reg_20_ptr
  %t62 = load i8*, i8** %var_new_data_ptr
  store i8* %t62, i8** %reg_21_ptr
  %t63 = call i8* @obo_entity_new(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.135, i64 0, i64 0))
  %t64 = load i8*, i8** %reg_20_ptr
  call void @obo_entity_put_boxed(i8* %t63, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.136, i64 0, i64 0), i8* %t64)
  %t65 = load i8*, i8** %reg_21_ptr
  call void @obo_entity_put_map(i8* %t63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0), i8* %t65)
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
  %var_r_ptr = alloca i8*
  %var_kept_ptr = alloca i8*
  %var_match_ptr = alloca i64
  %var___iter_idx_9_ptr = alloca i64
  %var_current_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_pred_ptr = alloca i8*
  %var_before_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_kept_ptr)
  call void @obo_gc_push_root(i8** %var_current_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  %t6 = call i64 @obo_value_len(i8* %t5)
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  store i64 %t7, i64* %var_before_ptr
  %t8 = load i8*, i8** %var_self_ptr
  store i8* %t8, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_5_ptr
  %t10 = call i8* @obo_entity_get_boxed(i8* %t9, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  call void @obo_entity_put_list(i8* %t55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0), i8* %t56)
  %t57 = load i64, i64* %var_before_ptr
  store i64 %t57, i64* %reg_26_ptr
  %t58 = load i8*, i8** %var_self_ptr
  store i8* %t58, i8** %reg_27_ptr
  %t59 = load i8*, i8** %reg_27_ptr
  %t60 = call i8* @obo_entity_get_boxed(i8* %t59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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
  %var___iter_idx_4_ptr = alloca i64
  %var_pred_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_r_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_pred_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_pred_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
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

define i64 @Table_display(i8* %arg0) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i8*
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
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i64
  %reg_41_ptr = alloca i64
  %reg_42_ptr = alloca i64
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca i8*
  %reg_45_ptr = alloca i8*
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i8*
  %reg_49_ptr = alloca i8*
  %reg_50_ptr = alloca i8*
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i64
  %reg_54_ptr = alloca i64
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i64
  %reg_57_ptr = alloca i64
  %var___iter_idx_32_ptr = alloca i64
  %var_r_ptr = alloca i8*
  %var___iter_idx_12_ptr = alloca i64
  %var_header_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_line_ptr = alloca i8*
  %var___iter_idx_39_ptr = alloca i64
  %var_c_ptr = alloca i8*
  %var_val_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_10_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %reg_37_ptr)
  call void @obo_gc_push_root(i8** %reg_38_ptr)
  call void @obo_gc_push_root(i8** %reg_43_ptr)
  call void @obo_gc_push_root(i8** %reg_44_ptr)
  call void @obo_gc_push_root(i8** %reg_45_ptr)
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %reg_48_ptr)
  call void @obo_gc_push_root(i8** %reg_49_ptr)
  call void @obo_gc_push_root(i8** %reg_50_ptr)
  call void @obo_gc_push_root(i8** %reg_51_ptr)
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_header_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_line_ptr)
  call void @obo_gc_push_root(i8** %var_c_ptr)
  call void @obo_gc_push_root(i8** %var_val_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  %t1 = load i8*, i8** %var_self_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = load i8*, i8** %reg_1_ptr
  %t3 = call i8* @obo_entity_get_boxed(i8* %t2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t3, i8** %reg_2_ptr
  %t4 = load i8*, i8** %reg_2_ptr
  %t5 = call i8* @obo_value_to_str(i8* %t4)
  %t6 = call i8* @obo_str_concat(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.11, i64 0, i64 0), i8* %t5)
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_str_concat(i8* %t7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t8, i8** %reg_4_ptr
  %t9 = load i8*, i8** %var_self_ptr
  store i8* %t9, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  %t11 = call i8* @obo_entity_get_boxed(i8* %t10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = call i64 @obo_value_len(i8* %t12)
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i8*, i8** %reg_4_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = call i8* @obo_i64_to_str(i64 %t15)
  %t17 = call i8* @obo_str_concat(i8* %t14, i8* %t16)
  store i8* %t17, i8** %reg_8_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @obo_str_concat(i8* %t18, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.13, i64 0, i64 0))
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %reg_9_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t20)
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8** %var_header_ptr
  %t21 = load i8*, i8** %var_self_ptr
  store i8* %t21, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_10_ptr
  %t23 = call i8* @obo_entity_get_boxed(i8* %t22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t23, i8** %reg_11_ptr
  store i64 0, i64* %var___iter_idx_12_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i64 @obo_value_len(i8* %t24)
  store i64 %t25, i64* %reg_12_ptr
  br label %Table_display_b1
Table_display_b1:
  %t26 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t26, i64* %reg_13_ptr
  %t27 = load i64, i64* %reg_13_ptr
  %t28 = load i64, i64* %reg_12_ptr
  %t29 = icmp slt i64 %t27, %t28
  %t30 = zext i1 %t29 to i64
  store i64 %t30, i64* %reg_14_ptr
  %t31 = load i64, i64* %reg_14_ptr
  %t33 = icmp ne i64 %t31, 0
  %t34 = zext i1 %t33 to i64
  %t32 = icmp ne i64 %t34, 0
  br i1 %t32, label %Table_display_b2, label %Table_display_b4
Table_display_b2:
  %t35 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t35, i64* %reg_15_ptr
  %t36 = load i8*, i8** %reg_11_ptr
  %t37 = load i64, i64* %reg_15_ptr
  %t39 = call i8* @obo_value_as_mixed_list_ptr(i8* %t36)
  %t38 = call i8* @obo_mixed_list_get(i8* %t39, i64 %t37)
  store i8* %t38, i8** %reg_16_ptr
  %t40 = load i8*, i8** %reg_16_ptr
  store i8* %t40, i8** %var_c_ptr
  %t41 = load i8*, i8** %var_header_ptr
  store i8* %t41, i8** %reg_17_ptr
  %t42 = load i8*, i8** %var_c_ptr
  store i8* %t42, i8** %reg_18_ptr
  %t43 = load i8*, i8** %reg_18_ptr
  %t44 = call i8* @obo_value_to_str(i8* %t43)
  %t45 = call i8* @__text_padRight(i8* %t44, i64 16, i8* null)
  store i8* %t45, i8** %reg_19_ptr
  %t46 = load i8*, i8** %reg_17_ptr
  %t47 = load i8*, i8** %reg_19_ptr
  %t48 = call i8* @obo_str_concat(i8* %t46, i8* %t47)
  store i8* %t48, i8** %reg_20_ptr
  %t49 = load i8*, i8** %reg_20_ptr
  store i8* %t49, i8** %var_header_ptr
  br label %Table_display_b3
Table_display_b3:
  %t50 = load i64, i64* %var___iter_idx_12_ptr
  store i64 %t50, i64* %reg_21_ptr
  %t51 = load i64, i64* %reg_21_ptr
  %t52 = add i64 %t51, 1
  store i64 %t52, i64* %reg_22_ptr
  %t53 = load i64, i64* %reg_22_ptr
  store i64 %t53, i64* %var___iter_idx_12_ptr
  br label %Table_display_b1
Table_display_b4:
  %t54 = load i8*, i8** %var_header_ptr
  store i8* %t54, i8** %reg_23_ptr
  %t55 = load i8*, i8** %reg_23_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t55)
  %t56 = load i8*, i8** %var_self_ptr
  store i8* %t56, i8** %reg_24_ptr
  %t57 = load i8*, i8** %reg_24_ptr
  %t58 = call i8* @obo_entity_get_boxed(i8* %t57, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t58, i8** %reg_25_ptr
  %t59 = load i8*, i8** %reg_25_ptr
  %t60 = call i64 @obo_value_len(i8* %t59)
  store i64 %t60, i64* %reg_26_ptr
  %t61 = load i64, i64* %reg_26_ptr
  %t62 = mul i64 %t61, 16
  store i64 %t62, i64* %reg_27_ptr
  %t63 = load i64, i64* %reg_27_ptr
  %t64 = call i8* @__text_repeat(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.17, i64 0, i64 0), i64 %t63)
  store i8* %t64, i8** %reg_28_ptr
  %t65 = load i8*, i8** %reg_28_ptr
  %t66 = call i8* @obo_str_concat(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8* %t65)
  store i8* %t66, i8** %reg_29_ptr
  %t67 = load i8*, i8** %reg_29_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t67)
  %t68 = load i8*, i8** %var_self_ptr
  store i8* %t68, i8** %reg_30_ptr
  %t69 = load i8*, i8** %reg_30_ptr
  %t70 = call i8* @obo_entity_get_boxed(i8* %t69, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t70, i8** %reg_31_ptr
  store i64 0, i64* %var___iter_idx_32_ptr
  %t71 = load i8*, i8** %reg_31_ptr
  %t72 = call i64 @obo_value_len(i8* %t71)
  store i64 %t72, i64* %reg_32_ptr
  br label %Table_display_b5
Table_display_b5:
  %t73 = load i64, i64* %var___iter_idx_32_ptr
  store i64 %t73, i64* %reg_33_ptr
  %t74 = load i64, i64* %reg_33_ptr
  %t75 = load i64, i64* %reg_32_ptr
  %t76 = icmp slt i64 %t74, %t75
  %t77 = zext i1 %t76 to i64
  store i64 %t77, i64* %reg_34_ptr
  %t78 = load i64, i64* %reg_34_ptr
  %t80 = icmp ne i64 %t78, 0
  %t81 = zext i1 %t80 to i64
  %t79 = icmp ne i64 %t81, 0
  br i1 %t79, label %Table_display_b6, label %Table_display_b8
Table_display_b6:
  %t82 = load i64, i64* %var___iter_idx_32_ptr
  store i64 %t82, i64* %reg_35_ptr
  %t83 = load i8*, i8** %reg_31_ptr
  %t84 = load i64, i64* %reg_35_ptr
  %t86 = call i8* @obo_value_as_mixed_list_ptr(i8* %t83)
  %t85 = call i8* @obo_mixed_list_get(i8* %t86, i64 %t84)
  store i8* %t85, i8** %reg_36_ptr
  %t87 = load i8*, i8** %reg_36_ptr
  store i8* %t87, i8** %var_r_ptr
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8** %var_line_ptr
  %t88 = load i8*, i8** %var_self_ptr
  store i8* %t88, i8** %reg_37_ptr
  %t89 = load i8*, i8** %reg_37_ptr
  %t90 = call i8* @obo_entity_get_boxed(i8* %t89, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.133, i64 0, i64 0))
  store i8* %t90, i8** %reg_38_ptr
  store i64 0, i64* %var___iter_idx_39_ptr
  %t91 = load i8*, i8** %reg_38_ptr
  %t92 = call i64 @obo_value_len(i8* %t91)
  store i64 %t92, i64* %reg_39_ptr
  br label %Table_display_b9
Table_display_b7:
  %t93 = load i64, i64* %var___iter_idx_32_ptr
  store i64 %t93, i64* %reg_56_ptr
  %t94 = load i64, i64* %reg_56_ptr
  %t95 = add i64 %t94, 1
  store i64 %t95, i64* %reg_57_ptr
  %t96 = load i64, i64* %reg_57_ptr
  store i64 %t96, i64* %var___iter_idx_32_ptr
  br label %Table_display_b5
Table_display_b8:
  call void @obo_gc_pop_roots(i64 43)
  ret i64 0
Table_display_b9:
  %t97 = load i64, i64* %var___iter_idx_39_ptr
  store i64 %t97, i64* %reg_40_ptr
  %t98 = load i64, i64* %reg_40_ptr
  %t99 = load i64, i64* %reg_39_ptr
  %t100 = icmp slt i64 %t98, %t99
  %t101 = zext i1 %t100 to i64
  store i64 %t101, i64* %reg_41_ptr
  %t102 = load i64, i64* %reg_41_ptr
  %t104 = icmp ne i64 %t102, 0
  %t105 = zext i1 %t104 to i64
  %t103 = icmp ne i64 %t105, 0
  br i1 %t103, label %Table_display_b10, label %Table_display_b12
Table_display_b10:
  %t106 = load i64, i64* %var___iter_idx_39_ptr
  store i64 %t106, i64* %reg_42_ptr
  %t107 = load i8*, i8** %reg_38_ptr
  %t108 = load i64, i64* %reg_42_ptr
  %t110 = call i8* @obo_value_as_mixed_list_ptr(i8* %t107)
  %t109 = call i8* @obo_mixed_list_get(i8* %t110, i64 %t108)
  store i8* %t109, i8** %reg_43_ptr
  %t111 = load i8*, i8** %reg_43_ptr
  store i8* %t111, i8** %var_c_ptr
  %t112 = load i8*, i8** %var_r_ptr
  store i8* %t112, i8** %reg_44_ptr
  %t113 = load i8*, i8** %reg_44_ptr
  %t114 = call i8* @obo_value_as_entity_ptr(i8* %t113)
  %t115 = call i8* @obo_entity_get_boxed(i8* %t114, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t115, i8** %reg_45_ptr
  %t116 = load i8*, i8** %var_c_ptr
  store i8* %t116, i8** %reg_46_ptr
  %t117 = load i8*, i8** %reg_45_ptr
  %t118 = load i8*, i8** %reg_46_ptr
  %t119 = call i8* @obo_value_to_str(i8* %t118)
  %t121 = call i8* @obo_value_as_map_ptr(i8* %t117)
  %t120 = call i8* @obo_map_get_boxed(i8* %t121, i8* %t119)
  store i8* %t120, i8** %reg_47_ptr
  %t122 = load i8*, i8** %reg_47_ptr
  %t123 = call i8* @obo_value_to_str(i8* %t122)
  %t124 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t123)
  store i8* %t124, i8** %reg_48_ptr
  %t125 = load i8*, i8** %reg_48_ptr
  store i8* %t125, i8** %var_val_ptr
  %t126 = load i8*, i8** %var_line_ptr
  store i8* %t126, i8** %reg_49_ptr
  %t127 = load i8*, i8** %var_val_ptr
  store i8* %t127, i8** %reg_50_ptr
  %t128 = load i8*, i8** %reg_50_ptr
  %t129 = call i8* @__text_padRight(i8* %t128, i64 16, i8* null)
  store i8* %t129, i8** %reg_51_ptr
  %t130 = load i8*, i8** %reg_49_ptr
  %t131 = load i8*, i8** %reg_51_ptr
  %t132 = call i8* @obo_str_concat(i8* %t130, i8* %t131)
  store i8* %t132, i8** %reg_52_ptr
  %t133 = load i8*, i8** %reg_52_ptr
  store i8* %t133, i8** %var_line_ptr
  br label %Table_display_b11
Table_display_b11:
  %t134 = load i64, i64* %var___iter_idx_39_ptr
  store i64 %t134, i64* %reg_53_ptr
  %t135 = load i64, i64* %reg_53_ptr
  %t136 = add i64 %t135, 1
  store i64 %t136, i64* %reg_54_ptr
  %t137 = load i64, i64* %reg_54_ptr
  store i64 %t137, i64* %var___iter_idx_39_ptr
  br label %Table_display_b9
Table_display_b12:
  %t138 = load i8*, i8** %var_line_ptr
  store i8* %t138, i8** %reg_55_ptr
  %t139 = load i8*, i8** %reg_55_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t139)
  br label %Table_display_b7
}

define i8* @Database_create(i8* %arg0) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %var_dbname_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_1_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %var_dbname_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_dbname_ptr
  %t1 = load i8*, i8** %var_dbname_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.18, i64 0, i64 0), i64 0)
  store i8* %t2, i8** %reg_2_ptr
  %t3 = call i8* @obo_entity_new(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.139, i64 0, i64 0))
  %t4 = load i8*, i8** %reg_1_ptr
  call void @obo_entity_put_str(i8* %t3, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* %t4)
  %t5 = load i8*, i8** %reg_2_ptr
  call void @obo_entity_put_map(i8* %t3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0), i8* %t5)
  store i8* %t3, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t6
}

define i8* @Database_create_table(i8* %arg0, i8* %arg1, i8* %arg2) {
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
  %var_tname_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_cols_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_tname_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_cols_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_tname_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_cols_ptr
  %t3 = load i8*, i8** %var_tname_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %var_cols_ptr
  store i8* %t4, i8** %reg_4_ptr
  %t5 = load i8*, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_4_ptr
  %t7 = call i8* @Table_create(i8* %t5, i8* %t6)
  store i8* %t7, i8** %reg_5_ptr
  %t8 = load i8*, i8** %reg_5_ptr
  store i8* %t8, i8** %var_t_ptr
  %t9 = load i8*, i8** %var_t_ptr
  store i8* %t9, i8** %reg_6_ptr
  %t10 = load i8*, i8** %var_self_ptr
  store i8* %t10, i8** %reg_7_ptr
  %t11 = load i8*, i8** %reg_7_ptr
  %t12 = call i8* @obo_entity_get_boxed(i8* %t11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t12, i8** %reg_8_ptr
  %t13 = load i8*, i8** %var_tname_ptr
  store i8* %t13, i8** %reg_9_ptr
  %t14 = load i8*, i8** %reg_8_ptr
  %t15 = load i8*, i8** %reg_9_ptr
  %t16 = load i8*, i8** %reg_6_ptr
  %t17 = call i8* @obo_value_as_map_ptr(i8* %t14)
  call void @obo_map_put_entity(i8* %t17, i8* %t15, i8* %t16)
  %t18 = load i8*, i8** %var_tname_ptr
  store i8* %t18, i8** %reg_10_ptr
  %t19 = load i8*, i8** %reg_10_ptr
  %t20 = call i8* @obo_str_concat(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.19, i64 0, i64 0), i8* %t19)
  store i8* %t20, i8** %reg_11_ptr
  %t21 = load i8*, i8** %reg_11_ptr
  %t22 = call i8* @obo_str_concat(i8* %t21, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %var_cols_ptr
  store i8* %t23, i8** %reg_13_ptr
  %t24 = load i8*, i8** %reg_13_ptr
  %t25 = call i8* @obo_mixed_list_join(i8* %t24, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.20, i64 0, i64 0))
  store i8* %t25, i8** %reg_14_ptr
  %t26 = load i8*, i8** %reg_12_ptr
  %t27 = load i8*, i8** %reg_14_ptr
  %t28 = call i8* @obo_str_concat(i8* %t26, i8* %t27)
  store i8* %t28, i8** %reg_15_ptr
  %t29 = load i8*, i8** %reg_15_ptr
  %t30 = call i8* @obo_str_concat(i8* %t29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.21, i64 0, i64 0))
  store i8* %t30, i8** %reg_16_ptr
  %t31 = load i8*, i8** %reg_16_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t31)
  %t32 = load i8*, i8** %var_t_ptr
  store i8* %t32, i8** %reg_17_ptr
  %t33 = load i8*, i8** %reg_17_ptr
  call void @obo_gc_pop_roots(i64 22)
  ret i8* %t33
}

define i8* @Database_get_table(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %var_tname_ptr = alloca i64
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_2_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_tname_ptr
  %t2 = load i8*, i8** %var_self_ptr
  store i8* %t2, i8** %reg_2_ptr
  %t3 = load i8*, i8** %reg_2_ptr
  %t4 = call i8* @obo_entity_get_boxed(i8* %t3, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t4, i8** %reg_3_ptr
  %t5 = load i64, i64* %var_tname_ptr
  store i64 %t5, i64* %reg_4_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t9 = call i8* @obo_value_as_mixed_list_ptr(i8* %t6)
  %t8 = call i8* @obo_mixed_list_get(i8* %t9, i64 %t7)
  store i8* %t8, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i8* %t10
}

define i64 @Database_update_table(i8* %arg0, i8* %arg1, i8* %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %var_tname_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %var_tname_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i8*, i8** %reg_1_ptr
  store i8* %t1, i8** %var_tname_ptr
  %t2 = load i8*, i8** %reg_2_ptr
  store i8* %t2, i8** %var_t_ptr
  %t3 = load i8*, i8** %var_t_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %var_self_ptr
  store i8* %t4, i8** %reg_4_ptr
  %t5 = load i8*, i8** %reg_4_ptr
  %t6 = call i8* @obo_entity_get_boxed(i8* %t5, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t6, i8** %reg_5_ptr
  %t7 = load i8*, i8** %var_tname_ptr
  store i8* %t7, i8** %reg_6_ptr
  %t8 = load i8*, i8** %reg_5_ptr
  %t9 = load i8*, i8** %reg_6_ptr
  %t10 = load i8*, i8** %reg_3_ptr
  %t11 = call i8* @obo_value_as_map_ptr(i8* %t8)
  call void @obo_map_put_entity(i8* %t11, i8* %t9, i8* %t10)
  call void @obo_gc_pop_roots(i64 10)
  ret i64 0
}

define i64 @Database_drop_table(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %var_tname_ptr = alloca i64
  %var_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_4_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
  call void @obo_gc_push_root(i8** %reg_8_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_tname_ptr
  %t2 = load i64, i64* %var_tname_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i8*, i8** %var_self_ptr
  store i8* %t3, i8** %reg_3_ptr
  %t4 = load i8*, i8** %reg_3_ptr
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t5, i8** %reg_4_ptr
  %t6 = load i8*, i8** %reg_4_ptr
  %t7 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t8 = load i64, i64* %reg_2_ptr
  %t9 = inttoptr i64 %t8 to i8*
  %t10 = call i8* @obo_map_remove(i8* %t7, i8* %t9)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_self_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  call void @obo_entity_put_map(i8* %t12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0), i8* %t13)
  %t14 = load i64, i64* %var_tname_ptr
  store i64 %t14, i64* %reg_7_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = call i8* @obo_i64_to_str(i64 %t15)
  %t17 = call i8* @obo_str_concat(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.22, i64 0, i64 0), i8* %t16)
  store i8* %t17, i8** %reg_8_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t18)
  call void @obo_gc_pop_roots(i64 7)
  ret i64 0
}

define i64 @Database_info(i8* %arg0) {
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
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i64
  %var_k_ptr = alloca i8*
  %var___iter_idx_9_ptr = alloca i64
  %var_t_ptr = alloca i8*
  %var_self_ptr = alloca i8*
  %var_all_keys_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %var_k_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_self_ptr)
  call void @obo_gc_push_root(i8** %var_all_keys_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_self_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  %t1 = load i8*, i8** %var_self_ptr
  store i8* %t1, i8** %reg_1_ptr
  %t2 = load i8*, i8** %reg_1_ptr
  %t3 = call i8* @obo_entity_get_boxed(i8* %t2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t3, i8** %reg_2_ptr
  %t4 = load i8*, i8** %reg_2_ptr
  %t5 = call i8* @obo_value_to_str(i8* %t4)
  %t6 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.23, i64 0, i64 0), i8* %t5)
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_str_concat(i8* %t7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.24, i64 0, i64 0))
  store i8* %t8, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t9)
  %t10 = load i8*, i8** %var_self_ptr
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %reg_5_ptr
  %t12 = call i8* @obo_entity_get_boxed(i8* %t11, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = call i8* @obo_value_keys(i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  store i8* %t15, i8** %var_all_keys_ptr
  %t16 = load i8*, i8** %var_all_keys_ptr
  store i8* %t16, i8** %reg_8_ptr
  store i64 0, i64* %var___iter_idx_9_ptr
  %t17 = load i8*, i8** %reg_8_ptr
  %t18 = call i64 @obo_value_len(i8* %t17)
  store i64 %t18, i64* %reg_9_ptr
  br label %Database_info_b1
Database_info_b1:
  %t19 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_9_ptr
  %t22 = icmp slt i64 %t20, %t21
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %Database_info_b2, label %Database_info_b4
Database_info_b2:
  %t28 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t28, i64* %reg_12_ptr
  %t29 = load i8*, i8** %reg_8_ptr
  %t30 = load i64, i64* %reg_12_ptr
  %t32 = call i8* @obo_value_as_mixed_list_ptr(i8* %t29)
  %t31 = call i8* @obo_mixed_list_get(i8* %t32, i64 %t30)
  store i8* %t31, i8** %reg_13_ptr
  %t33 = load i8*, i8** %reg_13_ptr
  store i8* %t33, i8** %var_k_ptr
  %t34 = load i8*, i8** %var_k_ptr
  store i8* %t34, i8** %reg_14_ptr
  %t35 = load i8*, i8** %reg_14_ptr
  %t36 = call i8* @obo_value_to_str(i8* %t35)
  %t37 = call i32 @strcmp(i8* %t36, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.18, i64 0, i64 0))
  %t38 = icmp ne i32 %t37, 0
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_15_ptr
  %t40 = load i64, i64* %reg_15_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %Database_info_b5, label %Database_info_b6
Database_info_b3:
  %t44 = load i64, i64* %var___iter_idx_9_ptr
  store i64 %t44, i64* %reg_28_ptr
  %t45 = load i64, i64* %reg_28_ptr
  %t46 = add i64 %t45, 1
  store i64 %t46, i64* %reg_29_ptr
  %t47 = load i64, i64* %reg_29_ptr
  store i64 %t47, i64* %var___iter_idx_9_ptr
  br label %Database_info_b1
Database_info_b4:
  call void @obo_gc_pop_roots(i64 26)
  ret i64 0
Database_info_b5:
  %t48 = load i8*, i8** %var_self_ptr
  store i8* %t48, i8** %reg_16_ptr
  %t49 = load i8*, i8** %reg_16_ptr
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.140, i64 0, i64 0))
  store i8* %t50, i8** %reg_17_ptr
  %t51 = load i8*, i8** %var_k_ptr
  store i8* %t51, i8** %reg_18_ptr
  %t52 = load i8*, i8** %reg_17_ptr
  %t53 = load i8*, i8** %reg_18_ptr
  %t54 = call i8* @obo_value_to_str(i8* %t53)
  %t56 = call i8* @obo_value_as_map_ptr(i8* %t52)
  %t55 = call i8* @obo_map_get_boxed(i8* %t56, i8* %t54)
  store i8* %t55, i8** %reg_19_ptr
  %t57 = load i8*, i8** %reg_19_ptr
  store i8* %t57, i8** %var_t_ptr
  %t58 = load i8*, i8** %var_k_ptr
  store i8* %t58, i8** %reg_20_ptr
  %t59 = load i8*, i8** %reg_20_ptr
  %t60 = call i8* @obo_value_to_str(i8* %t59)
  %t61 = call i8* @obo_str_concat(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8* %t60)
  store i8* %t61, i8** %reg_21_ptr
  %t62 = load i8*, i8** %reg_21_ptr
  %t63 = call i8* @obo_str_concat(i8* %t62, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.25, i64 0, i64 0))
  store i8* %t63, i8** %reg_22_ptr
  %t64 = load i8*, i8** %var_t_ptr
  store i8* %t64, i8** %reg_23_ptr
  %t65 = load i8*, i8** %reg_23_ptr
  %t66 = call i8* @obo_value_as_entity_ptr(i8* %t65)
  %t67 = call i8* @obo_entity_get_boxed(i8* %t66, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t67, i8** %reg_24_ptr
  %t68 = load i8*, i8** %reg_24_ptr
  %t69 = call i64 @obo_value_len(i8* %t68)
  store i64 %t69, i64* %reg_25_ptr
  %t70 = load i8*, i8** %reg_22_ptr
  %t71 = load i64, i64* %reg_25_ptr
  %t72 = call i8* @obo_i64_to_str(i64 %t71)
  %t73 = call i8* @obo_str_concat(i8* %t70, i8* %t72)
  store i8* %t73, i8** %reg_26_ptr
  %t74 = load i8*, i8** %reg_26_ptr
  %t75 = call i8* @obo_str_concat(i8* %t74, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.26, i64 0, i64 0))
  store i8* %t75, i8** %reg_27_ptr
  %t76 = load i8*, i8** %reg_27_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t76)
  br label %Database_info_b7
Database_info_b6:
  br label %Database_info_b7
Database_info_b7:
  br label %Database_info_b3
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
  %reg_45_ptr = alloca i64
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca i8*
  %reg_48_ptr = alloca i8*
  %reg_49_ptr = alloca i8*
  %reg_50_ptr = alloca i8*
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i8*
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i8*
  %reg_57_ptr = alloca i8*
  %reg_58_ptr = alloca i8*
  %reg_59_ptr = alloca i8*
  %reg_60_ptr = alloca i8*
  %reg_61_ptr = alloca i8*
  %reg_62_ptr = alloca i64
  %reg_63_ptr = alloca i8*
  %reg_64_ptr = alloca i8*
  %reg_65_ptr = alloca i8*
  %reg_66_ptr = alloca i64
  %reg_67_ptr = alloca i8*
  %reg_68_ptr = alloca i8*
  %reg_69_ptr = alloca i8*
  %reg_70_ptr = alloca i8*
  %reg_71_ptr = alloca i64
  %reg_72_ptr = alloca i8*
  %reg_73_ptr = alloca i8*
  %reg_74_ptr = alloca i8*
  %reg_75_ptr = alloca i8*
  %reg_76_ptr = alloca i64
  %reg_77_ptr = alloca i8*
  %reg_78_ptr = alloca i8*
  %reg_79_ptr = alloca i8*
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca i8*
  %reg_82_ptr = alloca i8*
  %reg_83_ptr = alloca i8*
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i8*
  %reg_86_ptr = alloca i8*
  %reg_87_ptr = alloca i8*
  %reg_88_ptr = alloca i8*
  %reg_89_ptr = alloca i8*
  %reg_90_ptr = alloca i64
  %reg_91_ptr = alloca i8*
  %reg_92_ptr = alloca i8*
  %reg_93_ptr = alloca i64
  %reg_94_ptr = alloca i8*
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca i8*
  %reg_97_ptr = alloca i64
  %reg_98_ptr = alloca i8*
  %reg_99_ptr = alloca i8*
  %reg_100_ptr = alloca i8*
  %reg_101_ptr = alloca i64
  %reg_102_ptr = alloca i8*
  %reg_103_ptr = alloca i8*
  %reg_104_ptr = alloca i8*
  %reg_105_ptr = alloca i8*
  %reg_106_ptr = alloca i8*
  %reg_107_ptr = alloca i8*
  %reg_108_ptr = alloca i8*
  %reg_109_ptr = alloca i8*
  %reg_110_ptr = alloca i8*
  %reg_111_ptr = alloca i8*
  %reg_112_ptr = alloca i8*
  %reg_113_ptr = alloca i8*
  %reg_114_ptr = alloca i8*
  %reg_115_ptr = alloca i8*
  %reg_116_ptr = alloca i8*
  %reg_117_ptr = alloca i64
  %reg_118_ptr = alloca i64
  %reg_119_ptr = alloca i64
  %reg_120_ptr = alloca i64
  %reg_121_ptr = alloca i8*
  %reg_122_ptr = alloca i8*
  %reg_123_ptr = alloca i8*
  %reg_124_ptr = alloca i8*
  %reg_125_ptr = alloca i8*
  %reg_126_ptr = alloca i8*
  %reg_127_ptr = alloca i8*
  %reg_128_ptr = alloca i8*
  %reg_129_ptr = alloca i8*
  %reg_130_ptr = alloca i64
  %reg_131_ptr = alloca i8*
  %reg_132_ptr = alloca i8*
  %reg_133_ptr = alloca i8*
  %reg_134_ptr = alloca i8*
  %reg_135_ptr = alloca i8*
  %reg_136_ptr = alloca i64
  %reg_137_ptr = alloca i8*
  %reg_138_ptr = alloca i8*
  %reg_139_ptr = alloca i8*
  %reg_140_ptr = alloca i8*
  %reg_141_ptr = alloca i8*
  %reg_142_ptr = alloca i8*
  %reg_143_ptr = alloca i8*
  %reg_144_ptr = alloca i8*
  %reg_145_ptr = alloca i8*
  %reg_146_ptr = alloca i8*
  %reg_147_ptr = alloca i8*
  %reg_148_ptr = alloca i8*
  %reg_149_ptr = alloca i8*
  %reg_150_ptr = alloca i64
  %reg_151_ptr = alloca i64
  %reg_152_ptr = alloca i8*
  %reg_153_ptr = alloca i8*
  %reg_154_ptr = alloca i8*
  %reg_155_ptr = alloca i8*
  %reg_156_ptr = alloca i64
  %reg_157_ptr = alloca i8*
  %reg_158_ptr = alloca i8*
  %reg_159_ptr = alloca i8*
  %reg_160_ptr = alloca i8*
  %reg_161_ptr = alloca i8*
  %reg_162_ptr = alloca i8*
  %reg_163_ptr = alloca i8*
  %reg_164_ptr = alloca i8*
  %reg_165_ptr = alloca i8*
  %reg_166_ptr = alloca i8*
  %reg_167_ptr = alloca i8*
  %reg_168_ptr = alloca i8*
  %reg_169_ptr = alloca i8*
  %reg_170_ptr = alloca i8*
  %reg_171_ptr = alloca i8*
  %reg_172_ptr = alloca i8*
  %reg_173_ptr = alloca i64
  %reg_174_ptr = alloca i64
  %reg_175_ptr = alloca i8*
  %reg_176_ptr = alloca i64
  %reg_177_ptr = alloca i8*
  %reg_178_ptr = alloca i8*
  %reg_179_ptr = alloca i8*
  %reg_180_ptr = alloca i8*
  %reg_181_ptr = alloca i64
  %reg_182_ptr = alloca i8*
  %reg_183_ptr = alloca i8*
  %reg_184_ptr = alloca i8*
  %reg_185_ptr = alloca i8*
  %reg_186_ptr = alloca i8*
  %reg_187_ptr = alloca i64
  %reg_188_ptr = alloca i8*
  %reg_189_ptr = alloca i8*
  %reg_190_ptr = alloca i8*
  %reg_191_ptr = alloca i8*
  %reg_192_ptr = alloca i64
  %reg_193_ptr = alloca i64
  %reg_194_ptr = alloca i64
  %reg_195_ptr = alloca i64
  %reg_196_ptr = alloca i8*
  %reg_197_ptr = alloca i8*
  %reg_198_ptr = alloca i8*
  %reg_199_ptr = alloca i8*
  %reg_200_ptr = alloca i8*
  %reg_201_ptr = alloca i8*
  %reg_202_ptr = alloca i8*
  %reg_203_ptr = alloca i8*
  %reg_204_ptr = alloca i8*
  %reg_205_ptr = alloca i8*
  %reg_206_ptr = alloca i8*
  %reg_207_ptr = alloca i8*
  %reg_208_ptr = alloca i8*
  %reg_209_ptr = alloca i8*
  %reg_210_ptr = alloca i8*
  %reg_211_ptr = alloca i8*
  %reg_212_ptr = alloca i8*
  %reg_213_ptr = alloca i8*
  %reg_214_ptr = alloca i8*
  %reg_215_ptr = alloca i8*
  %reg_216_ptr = alloca i8*
  %reg_217_ptr = alloca i8*
  %reg_218_ptr = alloca i8*
  %reg_219_ptr = alloca i8*
  %reg_220_ptr = alloca i8*
  %reg_221_ptr = alloca i8*
  %reg_222_ptr = alloca i8*
  %reg_223_ptr = alloca i8*
  %reg_224_ptr = alloca i8*
  %reg_225_ptr = alloca i8*
  %reg_226_ptr = alloca i8*
  %reg_227_ptr = alloca i8*
  %reg_228_ptr = alloca i8*
  %reg_229_ptr = alloca i64
  %reg_230_ptr = alloca i64
  %reg_231_ptr = alloca i8*
  %reg_232_ptr = alloca i8*
  %reg_233_ptr = alloca i8*
  %reg_234_ptr = alloca i64
  %reg_235_ptr = alloca i64
  %reg_236_ptr = alloca i8*
  %reg_237_ptr = alloca i8*
  %reg_238_ptr = alloca i8*
  %reg_239_ptr = alloca i8*
  %reg_240_ptr = alloca i8*
  %reg_241_ptr = alloca i8*
  %reg_242_ptr = alloca i64
  %reg_243_ptr = alloca i8*
  %reg_244_ptr = alloca i8*
  %reg_245_ptr = alloca i64
  %reg_246_ptr = alloca i64
  %reg_247_ptr = alloca i8*
  %reg_248_ptr = alloca i8*
  %reg_249_ptr = alloca i8*
  %reg_250_ptr = alloca i64
  %reg_251_ptr = alloca i8*
  %reg_252_ptr = alloca i8*
  %reg_253_ptr = alloca i64
  %reg_254_ptr = alloca i8*
  %reg_255_ptr = alloca i8*
  %reg_256_ptr = alloca i64
  %reg_257_ptr = alloca i8*
  %reg_258_ptr = alloca i64
  %var_r_ptr = alloca i8*
  %var_high_earners_ptr = alloca i8*
  %var_groups_ptr = alloca i8*
  %var_dept_ptr = alloca i8*
  %var_changed_ptr = alloca i64
  %var_above_avg_ptr = alloca i8*
  %var_eng_after_ptr = alloca i8*
  %var_found_ptr = alloca i8*
  %var_eng_sorted_ptr = alloca i8*
  %var___iter_idx_117_ptr = alloca i64
  %var_db_ptr = alloca i8*
  %var_removed_ptr = alloca i64
  %var_departments_ptr = alloca i8*
  %var_employees_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
  %var_eng_ptr = alloca i8*
  %var_joined_ptr = alloca i8*
  %var_by_salary_ptr = alloca i8*
  %var___iter_idx_192_ptr = alloca i64
  %var_dept_rows_ptr = alloca i8*
  %var_by_age_ptr = alloca i8*
  %var_average_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %reg_46_ptr)
  call void @obo_gc_push_root(i8** %reg_47_ptr)
  call void @obo_gc_push_root(i8** %reg_48_ptr)
  call void @obo_gc_push_root(i8** %reg_49_ptr)
  call void @obo_gc_push_root(i8** %reg_50_ptr)
  call void @obo_gc_push_root(i8** %reg_51_ptr)
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_53_ptr)
  call void @obo_gc_push_root(i8** %reg_54_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %reg_56_ptr)
  call void @obo_gc_push_root(i8** %reg_57_ptr)
  call void @obo_gc_push_root(i8** %reg_58_ptr)
  call void @obo_gc_push_root(i8** %reg_59_ptr)
  call void @obo_gc_push_root(i8** %reg_60_ptr)
  call void @obo_gc_push_root(i8** %reg_61_ptr)
  call void @obo_gc_push_root(i8** %reg_63_ptr)
  call void @obo_gc_push_root(i8** %reg_64_ptr)
  call void @obo_gc_push_root(i8** %reg_65_ptr)
  call void @obo_gc_push_root(i8** %reg_67_ptr)
  call void @obo_gc_push_root(i8** %reg_68_ptr)
  call void @obo_gc_push_root(i8** %reg_69_ptr)
  call void @obo_gc_push_root(i8** %reg_70_ptr)
  call void @obo_gc_push_root(i8** %reg_72_ptr)
  call void @obo_gc_push_root(i8** %reg_73_ptr)
  call void @obo_gc_push_root(i8** %reg_74_ptr)
  call void @obo_gc_push_root(i8** %reg_75_ptr)
  call void @obo_gc_push_root(i8** %reg_77_ptr)
  call void @obo_gc_push_root(i8** %reg_78_ptr)
  call void @obo_gc_push_root(i8** %reg_79_ptr)
  call void @obo_gc_push_root(i8** %reg_81_ptr)
  call void @obo_gc_push_root(i8** %reg_82_ptr)
  call void @obo_gc_push_root(i8** %reg_83_ptr)
  call void @obo_gc_push_root(i8** %reg_85_ptr)
  call void @obo_gc_push_root(i8** %reg_86_ptr)
  call void @obo_gc_push_root(i8** %reg_87_ptr)
  call void @obo_gc_push_root(i8** %reg_88_ptr)
  call void @obo_gc_push_root(i8** %reg_89_ptr)
  call void @obo_gc_push_root(i8** %reg_91_ptr)
  call void @obo_gc_push_root(i8** %reg_92_ptr)
  call void @obo_gc_push_root(i8** %reg_94_ptr)
  call void @obo_gc_push_root(i8** %reg_95_ptr)
  call void @obo_gc_push_root(i8** %reg_96_ptr)
  call void @obo_gc_push_root(i8** %reg_98_ptr)
  call void @obo_gc_push_root(i8** %reg_99_ptr)
  call void @obo_gc_push_root(i8** %reg_100_ptr)
  call void @obo_gc_push_root(i8** %reg_102_ptr)
  call void @obo_gc_push_root(i8** %reg_103_ptr)
  call void @obo_gc_push_root(i8** %reg_104_ptr)
  call void @obo_gc_push_root(i8** %reg_105_ptr)
  call void @obo_gc_push_root(i8** %reg_106_ptr)
  call void @obo_gc_push_root(i8** %reg_107_ptr)
  call void @obo_gc_push_root(i8** %reg_108_ptr)
  call void @obo_gc_push_root(i8** %reg_109_ptr)
  call void @obo_gc_push_root(i8** %reg_110_ptr)
  call void @obo_gc_push_root(i8** %reg_111_ptr)
  call void @obo_gc_push_root(i8** %reg_112_ptr)
  call void @obo_gc_push_root(i8** %reg_113_ptr)
  call void @obo_gc_push_root(i8** %reg_114_ptr)
  call void @obo_gc_push_root(i8** %reg_115_ptr)
  call void @obo_gc_push_root(i8** %reg_116_ptr)
  call void @obo_gc_push_root(i8** %reg_121_ptr)
  call void @obo_gc_push_root(i8** %reg_122_ptr)
  call void @obo_gc_push_root(i8** %reg_123_ptr)
  call void @obo_gc_push_root(i8** %reg_124_ptr)
  call void @obo_gc_push_root(i8** %reg_125_ptr)
  call void @obo_gc_push_root(i8** %reg_126_ptr)
  call void @obo_gc_push_root(i8** %reg_127_ptr)
  call void @obo_gc_push_root(i8** %reg_128_ptr)
  call void @obo_gc_push_root(i8** %reg_129_ptr)
  call void @obo_gc_push_root(i8** %reg_131_ptr)
  call void @obo_gc_push_root(i8** %reg_132_ptr)
  call void @obo_gc_push_root(i8** %reg_133_ptr)
  call void @obo_gc_push_root(i8** %reg_134_ptr)
  call void @obo_gc_push_root(i8** %reg_135_ptr)
  call void @obo_gc_push_root(i8** %reg_137_ptr)
  call void @obo_gc_push_root(i8** %reg_138_ptr)
  call void @obo_gc_push_root(i8** %reg_139_ptr)
  call void @obo_gc_push_root(i8** %reg_140_ptr)
  call void @obo_gc_push_root(i8** %reg_141_ptr)
  call void @obo_gc_push_root(i8** %reg_142_ptr)
  call void @obo_gc_push_root(i8** %reg_143_ptr)
  call void @obo_gc_push_root(i8** %reg_144_ptr)
  call void @obo_gc_push_root(i8** %reg_145_ptr)
  call void @obo_gc_push_root(i8** %reg_146_ptr)
  call void @obo_gc_push_root(i8** %reg_147_ptr)
  call void @obo_gc_push_root(i8** %reg_148_ptr)
  call void @obo_gc_push_root(i8** %reg_149_ptr)
  call void @obo_gc_push_root(i8** %reg_152_ptr)
  call void @obo_gc_push_root(i8** %reg_153_ptr)
  call void @obo_gc_push_root(i8** %reg_154_ptr)
  call void @obo_gc_push_root(i8** %reg_155_ptr)
  call void @obo_gc_push_root(i8** %reg_157_ptr)
  call void @obo_gc_push_root(i8** %reg_158_ptr)
  call void @obo_gc_push_root(i8** %reg_159_ptr)
  call void @obo_gc_push_root(i8** %reg_160_ptr)
  call void @obo_gc_push_root(i8** %reg_161_ptr)
  call void @obo_gc_push_root(i8** %reg_162_ptr)
  call void @obo_gc_push_root(i8** %reg_163_ptr)
  call void @obo_gc_push_root(i8** %reg_164_ptr)
  call void @obo_gc_push_root(i8** %reg_165_ptr)
  call void @obo_gc_push_root(i8** %reg_166_ptr)
  call void @obo_gc_push_root(i8** %reg_167_ptr)
  call void @obo_gc_push_root(i8** %reg_168_ptr)
  call void @obo_gc_push_root(i8** %reg_169_ptr)
  call void @obo_gc_push_root(i8** %reg_170_ptr)
  call void @obo_gc_push_root(i8** %reg_171_ptr)
  call void @obo_gc_push_root(i8** %reg_172_ptr)
  call void @obo_gc_push_root(i8** %reg_175_ptr)
  call void @obo_gc_push_root(i8** %reg_177_ptr)
  call void @obo_gc_push_root(i8** %reg_178_ptr)
  call void @obo_gc_push_root(i8** %reg_179_ptr)
  call void @obo_gc_push_root(i8** %reg_180_ptr)
  call void @obo_gc_push_root(i8** %reg_182_ptr)
  call void @obo_gc_push_root(i8** %reg_183_ptr)
  call void @obo_gc_push_root(i8** %reg_184_ptr)
  call void @obo_gc_push_root(i8** %reg_185_ptr)
  call void @obo_gc_push_root(i8** %reg_186_ptr)
  call void @obo_gc_push_root(i8** %reg_188_ptr)
  call void @obo_gc_push_root(i8** %reg_189_ptr)
  call void @obo_gc_push_root(i8** %reg_190_ptr)
  call void @obo_gc_push_root(i8** %reg_191_ptr)
  call void @obo_gc_push_root(i8** %reg_196_ptr)
  call void @obo_gc_push_root(i8** %reg_197_ptr)
  call void @obo_gc_push_root(i8** %reg_198_ptr)
  call void @obo_gc_push_root(i8** %reg_199_ptr)
  call void @obo_gc_push_root(i8** %reg_200_ptr)
  call void @obo_gc_push_root(i8** %reg_201_ptr)
  call void @obo_gc_push_root(i8** %reg_202_ptr)
  call void @obo_gc_push_root(i8** %reg_203_ptr)
  call void @obo_gc_push_root(i8** %reg_204_ptr)
  call void @obo_gc_push_root(i8** %reg_205_ptr)
  call void @obo_gc_push_root(i8** %reg_206_ptr)
  call void @obo_gc_push_root(i8** %reg_207_ptr)
  call void @obo_gc_push_root(i8** %reg_208_ptr)
  call void @obo_gc_push_root(i8** %reg_209_ptr)
  call void @obo_gc_push_root(i8** %reg_210_ptr)
  call void @obo_gc_push_root(i8** %reg_211_ptr)
  call void @obo_gc_push_root(i8** %reg_212_ptr)
  call void @obo_gc_push_root(i8** %reg_213_ptr)
  call void @obo_gc_push_root(i8** %reg_214_ptr)
  call void @obo_gc_push_root(i8** %reg_215_ptr)
  call void @obo_gc_push_root(i8** %reg_216_ptr)
  call void @obo_gc_push_root(i8** %reg_217_ptr)
  call void @obo_gc_push_root(i8** %reg_218_ptr)
  call void @obo_gc_push_root(i8** %reg_219_ptr)
  call void @obo_gc_push_root(i8** %reg_220_ptr)
  call void @obo_gc_push_root(i8** %reg_221_ptr)
  call void @obo_gc_push_root(i8** %reg_222_ptr)
  call void @obo_gc_push_root(i8** %reg_223_ptr)
  call void @obo_gc_push_root(i8** %reg_224_ptr)
  call void @obo_gc_push_root(i8** %reg_225_ptr)
  call void @obo_gc_push_root(i8** %reg_226_ptr)
  call void @obo_gc_push_root(i8** %reg_227_ptr)
  call void @obo_gc_push_root(i8** %reg_228_ptr)
  call void @obo_gc_push_root(i8** %reg_231_ptr)
  call void @obo_gc_push_root(i8** %reg_232_ptr)
  call void @obo_gc_push_root(i8** %reg_233_ptr)
  call void @obo_gc_push_root(i8** %reg_236_ptr)
  call void @obo_gc_push_root(i8** %reg_237_ptr)
  call void @obo_gc_push_root(i8** %reg_238_ptr)
  call void @obo_gc_push_root(i8** %reg_239_ptr)
  call void @obo_gc_push_root(i8** %reg_240_ptr)
  call void @obo_gc_push_root(i8** %reg_241_ptr)
  call void @obo_gc_push_root(i8** %reg_243_ptr)
  call void @obo_gc_push_root(i8** %reg_244_ptr)
  call void @obo_gc_push_root(i8** %reg_247_ptr)
  call void @obo_gc_push_root(i8** %reg_248_ptr)
  call void @obo_gc_push_root(i8** %reg_249_ptr)
  call void @obo_gc_push_root(i8** %reg_251_ptr)
  call void @obo_gc_push_root(i8** %reg_252_ptr)
  call void @obo_gc_push_root(i8** %reg_254_ptr)
  call void @obo_gc_push_root(i8** %reg_255_ptr)
  call void @obo_gc_push_root(i8** %reg_257_ptr)
  call void @obo_gc_push_root(i8** %var_r_ptr)
  call void @obo_gc_push_root(i8** %var_high_earners_ptr)
  call void @obo_gc_push_root(i8** %var_groups_ptr)
  call void @obo_gc_push_root(i8** %var_dept_ptr)
  call void @obo_gc_push_root(i8** %var_above_avg_ptr)
  call void @obo_gc_push_root(i8** %var_eng_after_ptr)
  call void @obo_gc_push_root(i8** %var_found_ptr)
  call void @obo_gc_push_root(i8** %var_eng_sorted_ptr)
  call void @obo_gc_push_root(i8** %var_db_ptr)
  call void @obo_gc_push_root(i8** %var_departments_ptr)
  call void @obo_gc_push_root(i8** %var_employees_ptr)
  call void @obo_gc_push_root(i8** %var_keys_ptr)
  call void @obo_gc_push_root(i8** %var_eng_ptr)
  call void @obo_gc_push_root(i8** %var_joined_ptr)
  call void @obo_gc_push_root(i8** %var_by_salary_ptr)
  call void @obo_gc_push_root(i8** %var_dept_rows_ptr)
  call void @obo_gc_push_root(i8** %var_by_age_ptr)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @obo.str.27, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([43 x i8], [43 x i8]* @obo.str.28, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @obo.str.27, i64 0, i64 0))
  %t0 = call i8* @Database_create(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.29, i64 0, i64 0))
  store i8* %t0, i8** %reg_0_ptr
  %t1 = load i8*, i8** %reg_0_ptr
  store i8* %t1, i8** %var_db_ptr
  %t2 = call i8* @obo_mixed_list_new(i64 5)
  %t3 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t2, i64 0, i8* %t3)
  %t4 = call i8* @obo_box_str(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t2, i64 1, i8* %t4)
  %t5 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t2, i64 2, i8* %t5)
  %t6 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t2, i64 3, i8* %t6)
  %t7 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t2, i64 4, i8* %t7)
  store i8* %t2, i8** %reg_1_ptr
  %t8 = load i8*, i8** %var_db_ptr
  store i8* %t8, i8** %reg_2_ptr
  %t9 = load i8*, i8** %reg_2_ptr
  %t10 = load i8*, i8** %reg_1_ptr
  %t11 = call i8* @Database_create_table(i8* %t9, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.36, i64 0, i64 0), i8* %t10)
  store i8* %t11, i8** %reg_3_ptr
  %t12 = load i8*, i8** %reg_3_ptr
  store i8* %t12, i8** %var_employees_ptr
  %t13 = call i8* @obo_mixed_list_new(i64 3)
  %t14 = call i8* @obo_box_str(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t13, i64 0, i8* %t14)
  %t15 = call i8* @obo_box_str(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t13, i64 1, i8* %t15)
  %t16 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.39, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t13, i64 2, i8* %t16)
  store i8* %t13, i8** %reg_4_ptr
  %t17 = load i8*, i8** %var_db_ptr
  store i8* %t17, i8** %reg_5_ptr
  %t18 = load i8*, i8** %reg_5_ptr
  %t19 = load i8*, i8** %reg_4_ptr
  %t20 = call i8* @Database_create_table(i8* %t18, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.40, i64 0, i64 0), i8* %t19)
  store i8* %t20, i8** %reg_6_ptr
  %t21 = load i8*, i8** %reg_6_ptr
  store i8* %t21, i8** %var_departments_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @obo.str.41, i64 0, i64 0))
  %t22 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.42, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t22, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t22, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 95000)
  call void @obo_map_put_i64(i8* %t22, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 32)
  call void @obo_map_put_str(i8* %t22, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t22, i8** %reg_7_ptr
  %t23 = load i8*, i8** %var_employees_ptr
  store i8* %t23, i8** %reg_8_ptr
  %t24 = load i8*, i8** %reg_8_ptr
  %t25 = load i8*, i8** %reg_7_ptr
  %t26 = call i8* @Table_insert(i8* %t24, i8* %t25)
  store i8* %t26, i8** %reg_9_ptr
  %t27 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t27, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.46, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.47, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t27, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 72000)
  call void @obo_map_put_i64(i8* %t27, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 28)
  call void @obo_map_put_str(i8* %t27, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t27, i8** %reg_10_ptr
  %t28 = load i8*, i8** %var_employees_ptr
  store i8* %t28, i8** %reg_11_ptr
  %t29 = load i8*, i8** %reg_11_ptr
  %t30 = load i8*, i8** %reg_10_ptr
  %t31 = call i8* @Table_insert(i8* %t29, i8* %t30)
  store i8* %t31, i8** %reg_12_ptr
  %t32 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t32, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.49, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t32, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t32, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 110000)
  call void @obo_map_put_i64(i8* %t32, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 35)
  call void @obo_map_put_str(i8* %t32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.50, i64 0, i64 0))
  store i8* %t32, i8** %reg_13_ptr
  %t33 = load i8*, i8** %var_employees_ptr
  store i8* %t33, i8** %reg_14_ptr
  %t34 = load i8*, i8** %reg_14_ptr
  %t35 = load i8*, i8** %reg_13_ptr
  %t36 = call i8* @Table_insert(i8* %t34, i8* %t35)
  store i8* %t36, i8** %reg_15_ptr
  %t37 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t37, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.51, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.52, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t37, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 68000)
  call void @obo_map_put_i64(i8* %t37, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 26)
  call void @obo_map_put_str(i8* %t37, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.53, i64 0, i64 0))
  store i8* %t37, i8** %reg_16_ptr
  %t38 = load i8*, i8** %var_employees_ptr
  store i8* %t38, i8** %reg_17_ptr
  %t39 = load i8*, i8** %reg_17_ptr
  %t40 = load i8*, i8** %reg_16_ptr
  %t41 = call i8* @Table_insert(i8* %t39, i8* %t40)
  store i8* %t41, i8** %reg_18_ptr
  %t42 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t42, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.54, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t42, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t42, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 88000)
  call void @obo_map_put_i64(i8* %t42, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 30)
  call void @obo_map_put_str(i8* %t42, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t42, i8** %reg_19_ptr
  %t43 = load i8*, i8** %var_employees_ptr
  store i8* %t43, i8** %reg_20_ptr
  %t44 = load i8*, i8** %reg_20_ptr
  %t45 = load i8*, i8** %reg_19_ptr
  %t46 = call i8* @Table_insert(i8* %t44, i8* %t45)
  store i8* %t46, i8** %reg_21_ptr
  %t47 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.55, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t47, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.47, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t47, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 85000)
  call void @obo_map_put_i64(i8* %t47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 34)
  call void @obo_map_put_str(i8* %t47, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t47, i8** %reg_22_ptr
  %t48 = load i8*, i8** %var_employees_ptr
  store i8* %t48, i8** %reg_23_ptr
  %t49 = load i8*, i8** %reg_23_ptr
  %t50 = load i8*, i8** %reg_22_ptr
  %t51 = call i8* @Table_insert(i8* %t49, i8* %t50)
  store i8* %t51, i8** %reg_24_ptr
  %t52 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.56, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t52, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.52, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t52, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 71000)
  call void @obo_map_put_i64(i8* %t52, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 29)
  call void @obo_map_put_str(i8* %t52, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t52, i8** %reg_25_ptr
  %t53 = load i8*, i8** %var_employees_ptr
  store i8* %t53, i8** %reg_26_ptr
  %t54 = load i8*, i8** %reg_26_ptr
  %t55 = load i8*, i8** %reg_25_ptr
  %t56 = call i8* @Table_insert(i8* %t54, i8* %t55)
  store i8* %t56, i8** %reg_27_ptr
  %t57 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.57, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t57, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t57, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 120000)
  call void @obo_map_put_i64(i8* %t57, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 40)
  call void @obo_map_put_str(i8* %t57, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.58, i64 0, i64 0))
  store i8* %t57, i8** %reg_28_ptr
  %t58 = load i8*, i8** %var_employees_ptr
  store i8* %t58, i8** %reg_29_ptr
  %t59 = load i8*, i8** %reg_29_ptr
  %t60 = load i8*, i8** %reg_28_ptr
  %t61 = call i8* @Table_insert(i8* %t59, i8* %t60)
  store i8* %t61, i8** %reg_30_ptr
  %t62 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t62, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.59, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t62, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.47, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t62, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 62000)
  call void @obo_map_put_i64(i8* %t62, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 24)
  call void @obo_map_put_str(i8* %t62, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.53, i64 0, i64 0))
  store i8* %t62, i8** %reg_31_ptr
  %t63 = load i8*, i8** %var_employees_ptr
  store i8* %t63, i8** %reg_32_ptr
  %t64 = load i8*, i8** %reg_32_ptr
  %t65 = load i8*, i8** %reg_31_ptr
  %t66 = call i8* @Table_insert(i8* %t64, i8* %t65)
  store i8* %t66, i8** %reg_33_ptr
  %t67 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t67, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.60, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t67, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.61, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t67, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 92000)
  call void @obo_map_put_i64(i8* %t67, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 33)
  call void @obo_map_put_str(i8* %t67, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t67, i8** %reg_34_ptr
  %t68 = load i8*, i8** %var_employees_ptr
  store i8* %t68, i8** %reg_35_ptr
  %t69 = load i8*, i8** %reg_35_ptr
  %t70 = load i8*, i8** %reg_34_ptr
  %t71 = call i8* @Table_insert(i8* %t69, i8* %t70)
  store i8* %t71, i8** %reg_36_ptr
  %t72 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t72, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.62, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t72, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.61, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t72, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 78000)
  call void @obo_map_put_i64(i8* %t72, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 27)
  call void @obo_map_put_str(i8* %t72, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.48, i64 0, i64 0))
  store i8* %t72, i8** %reg_37_ptr
  %t73 = load i8*, i8** %var_employees_ptr
  store i8* %t73, i8** %reg_38_ptr
  %t74 = load i8*, i8** %reg_38_ptr
  %t75 = load i8*, i8** %reg_37_ptr
  %t76 = call i8* @Table_insert(i8* %t74, i8* %t75)
  store i8* %t76, i8** %reg_39_ptr
  %t77 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t77, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.63, i64 0, i64 0))
  call void @obo_map_put_str(i8* %t77, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t77, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 98000)
  call void @obo_map_put_i64(i8* %t77, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 31)
  call void @obo_map_put_str(i8* %t77, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.34, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.44, i64 0, i64 0))
  store i8* %t77, i8** %reg_40_ptr
  %t78 = load i8*, i8** %var_employees_ptr
  store i8* %t78, i8** %reg_41_ptr
  %t79 = load i8*, i8** %reg_41_ptr
  %t80 = load i8*, i8** %reg_40_ptr
  %t81 = call i8* @Table_insert(i8* %t79, i8* %t80)
  store i8* %t81, i8** %reg_42_ptr
  %t82 = load i8*, i8** %var_employees_ptr
  store i8* %t82, i8** %reg_43_ptr
  %t83 = load i8*, i8** %reg_43_ptr
  %t84 = call i8* @obo_entity_get_boxed(i8* %t83, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t84, i8** %reg_44_ptr
  %t85 = load i8*, i8** %reg_44_ptr
  %t86 = call i64 @obo_value_len(i8* %t85)
  store i64 %t86, i64* %reg_45_ptr
  %t87 = load i64, i64* %reg_45_ptr
  %t88 = call i8* @obo_i64_to_str(i64 %t87)
  %t89 = call i8* @obo_str_concat(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.64, i64 0, i64 0), i8* %t88)
  store i8* %t89, i8** %reg_46_ptr
  %t90 = load i8*, i8** %reg_46_ptr
  %t91 = call i8* @obo_str_concat(i8* %t90, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.65, i64 0, i64 0))
  store i8* %t91, i8** %reg_47_ptr
  %t92 = load i8*, i8** %reg_47_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t92)
  %t93 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t93, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t93, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0), i64 500000)
  call void @obo_map_put_str(i8* %t93, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.39, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.57, i64 0, i64 0))
  store i8* %t93, i8** %reg_48_ptr
  %t94 = load i8*, i8** %var_departments_ptr
  store i8* %t94, i8** %reg_49_ptr
  %t95 = load i8*, i8** %reg_49_ptr
  %t96 = load i8*, i8** %reg_48_ptr
  %t97 = call i8* @Table_insert(i8* %t95, i8* %t96)
  store i8* %t97, i8** %reg_50_ptr
  %t98 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t98, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.47, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t98, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0), i64 200000)
  call void @obo_map_put_str(i8* %t98, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.39, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.55, i64 0, i64 0))
  store i8* %t98, i8** %reg_51_ptr
  %t99 = load i8*, i8** %var_departments_ptr
  store i8* %t99, i8** %reg_52_ptr
  %t100 = load i8*, i8** %reg_52_ptr
  %t101 = load i8*, i8** %reg_51_ptr
  %t102 = call i8* @Table_insert(i8* %t100, i8* %t101)
  store i8* %t102, i8** %reg_53_ptr
  %t103 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t103, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.52, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t103, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0), i64 150000)
  call void @obo_map_put_str(i8* %t103, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.39, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.56, i64 0, i64 0))
  store i8* %t103, i8** %reg_54_ptr
  %t104 = load i8*, i8** %var_departments_ptr
  store i8* %t104, i8** %reg_55_ptr
  %t105 = load i8*, i8** %reg_55_ptr
  %t106 = load i8*, i8** %reg_54_ptr
  %t107 = call i8* @Table_insert(i8* %t105, i8* %t106)
  store i8* %t107, i8** %reg_56_ptr
  %t108 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t108, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.61, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t108, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.38, i64 0, i64 0), i64 300000)
  call void @obo_map_put_str(i8* %t108, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.39, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.60, i64 0, i64 0))
  store i8* %t108, i8** %reg_57_ptr
  %t109 = load i8*, i8** %var_departments_ptr
  store i8* %t109, i8** %reg_58_ptr
  %t110 = load i8*, i8** %reg_58_ptr
  %t111 = load i8*, i8** %reg_57_ptr
  %t112 = call i8* @Table_insert(i8* %t110, i8* %t111)
  store i8* %t112, i8** %reg_59_ptr
  %t113 = load i8*, i8** %var_departments_ptr
  store i8* %t113, i8** %reg_60_ptr
  %t114 = load i8*, i8** %reg_60_ptr
  %t115 = call i8* @obo_entity_get_boxed(i8* %t114, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t115, i8** %reg_61_ptr
  %t116 = load i8*, i8** %reg_61_ptr
  %t117 = call i64 @obo_value_len(i8* %t116)
  store i64 %t117, i64* %reg_62_ptr
  %t118 = load i64, i64* %reg_62_ptr
  %t119 = call i8* @obo_i64_to_str(i64 %t118)
  %t120 = call i8* @obo_str_concat(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.64, i64 0, i64 0), i8* %t119)
  store i8* %t120, i8** %reg_63_ptr
  %t121 = load i8*, i8** %reg_63_ptr
  %t122 = call i8* @obo_str_concat(i8* %t121, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @obo.str.66, i64 0, i64 0))
  store i8* %t122, i8** %reg_64_ptr
  %t123 = load i8*, i8** %reg_64_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t123)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @obo.str.67, i64 0, i64 0))
  %t124 = load i8*, i8** %var_employees_ptr
  store i8* %t124, i8** %reg_65_ptr
  %t125 = load i8*, i8** %reg_65_ptr
  %t126 = call i64 @Table_display(i8* %t125)
  store i64 %t126, i64* %reg_66_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @obo.str.69, i64 0, i64 0))
  %t127 = bitcast i64 (i8*, i64)* @__closure_0 to i8*
  %t128 = call i8* @obo_closure_new(i8* %t127, i64 0)
  store i8* %t128, i8** %reg_67_ptr
  %t129 = load i8*, i8** %var_employees_ptr
  store i8* %t129, i8** %reg_68_ptr
  %t130 = load i8*, i8** %reg_68_ptr
  %t131 = load i8*, i8** %reg_67_ptr
  %t132 = call i8* @Table_where(i8* %t130, i8* %t131)
  store i8* %t132, i8** %reg_69_ptr
  %t133 = load i8*, i8** %reg_69_ptr
  store i8* %t133, i8** %var_high_earners_ptr
  %t134 = load i8*, i8** %var_high_earners_ptr
  store i8* %t134, i8** %reg_70_ptr
  %t135 = load i8*, i8** %reg_70_ptr
  %t136 = call i64 @Table_display(i8* %t135)
  store i64 %t136, i64* %reg_71_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @obo.str.71, i64 0, i64 0))
  %t137 = bitcast i64 (i8*, i64)* @__closure_1 to i8*
  %t138 = call i8* @obo_closure_new(i8* %t137, i64 0)
  store i8* %t138, i8** %reg_72_ptr
  %t139 = load i8*, i8** %var_employees_ptr
  store i8* %t139, i8** %reg_73_ptr
  %t140 = load i8*, i8** %reg_73_ptr
  %t141 = load i8*, i8** %reg_72_ptr
  %t142 = call i8* @Table_where(i8* %t140, i8* %t141)
  store i8* %t142, i8** %reg_74_ptr
  %t143 = load i8*, i8** %reg_74_ptr
  store i8* %t143, i8** %var_eng_ptr
  %t144 = load i8*, i8** %var_eng_ptr
  store i8* %t144, i8** %reg_75_ptr
  %t145 = load i8*, i8** %reg_75_ptr
  %t146 = call i64 @Table_display(i8* %t145)
  store i64 %t146, i64* %reg_76_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @obo.str.72, i64 0, i64 0))
  %t147 = load i8*, i8** %var_employees_ptr
  store i8* %t147, i8** %reg_77_ptr
  %t148 = load i8*, i8** %reg_77_ptr
  %t149 = call i8* @Table_order_by(i8* %t148, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 0)
  store i8* %t149, i8** %reg_78_ptr
  %t150 = load i8*, i8** %reg_78_ptr
  store i8* %t150, i8** %var_by_salary_ptr
  %t151 = load i8*, i8** %var_by_salary_ptr
  store i8* %t151, i8** %reg_79_ptr
  %t152 = load i8*, i8** %reg_79_ptr
  %t153 = call i64 @Table_display(i8* %t152)
  store i64 %t153, i64* %reg_80_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @obo.str.74, i64 0, i64 0))
  %t154 = load i8*, i8** %var_employees_ptr
  store i8* %t154, i8** %reg_81_ptr
  %t155 = load i8*, i8** %reg_81_ptr
  %t156 = call i8* @Table_order_by(i8* %t155, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0), i64 1)
  store i8* %t156, i8** %reg_82_ptr
  %t157 = load i8*, i8** %reg_82_ptr
  store i8* %t157, i8** %var_by_age_ptr
  %t158 = load i8*, i8** %var_by_age_ptr
  store i8* %t158, i8** %reg_83_ptr
  %t159 = load i8*, i8** %reg_83_ptr
  %t160 = call i64 @Table_display(i8* %t159)
  store i64 %t160, i64* %reg_84_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @obo.str.75, i64 0, i64 0))
  %t161 = bitcast i64 (i8*, i64)* @__closure_2 to i8*
  %t162 = call i8* @obo_closure_new(i8* %t161, i64 0)
  store i8* %t162, i8** %reg_85_ptr
  %t163 = load i8*, i8** %var_employees_ptr
  store i8* %t163, i8** %reg_86_ptr
  %t164 = load i8*, i8** %reg_86_ptr
  %t165 = load i8*, i8** %reg_85_ptr
  %t166 = call i8* @Table_where(i8* %t164, i8* %t165)
  store i8* %t166, i8** %reg_87_ptr
  %t167 = load i8*, i8** %reg_87_ptr
  %t168 = call i8* @Table_order_by(i8* %t167, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 0)
  store i8* %t168, i8** %reg_88_ptr
  %t169 = load i8*, i8** %reg_88_ptr
  store i8* %t169, i8** %var_eng_sorted_ptr
  %t170 = load i8*, i8** %var_eng_sorted_ptr
  store i8* %t170, i8** %reg_89_ptr
  %t171 = load i8*, i8** %reg_89_ptr
  %t172 = call i64 @Table_display(i8* %t171)
  store i64 %t172, i64* %reg_90_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @obo.str.76, i64 0, i64 0))
  %t173 = load i8*, i8** %var_employees_ptr
  store i8* %t173, i8** %reg_91_ptr
  %t174 = load i8*, i8** %reg_91_ptr
  %t175 = call i8* @obo_entity_get_boxed(i8* %t174, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t175, i8** %reg_92_ptr
  %t176 = load i8*, i8** %reg_92_ptr
  %t177 = call i64 @obo_value_len(i8* %t176)
  store i64 %t177, i64* %reg_93_ptr
  %t178 = load i64, i64* %reg_93_ptr
  %t179 = call i8* @obo_i64_to_str(i64 %t178)
  %t180 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.77, i64 0, i64 0), i8* %t179)
  store i8* %t180, i8** %reg_94_ptr
  %t181 = load i8*, i8** %reg_94_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t181)
  %t182 = load i8*, i8** %var_employees_ptr
  store i8* %t182, i8** %reg_95_ptr
  %t183 = load i8*, i8** %reg_95_ptr
  %t184 = call i8* @obo_entity_get_boxed(i8* %t183, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t184, i8** %reg_96_ptr
  %t185 = load i8*, i8** %reg_96_ptr
  %t186 = call i64 @sum_of(i8* %t185, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i64 %t186, i64* %reg_97_ptr
  %t187 = load i64, i64* %reg_97_ptr
  %t188 = call i8* @obo_i64_to_str(i64 %t187)
  %t189 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.78, i64 0, i64 0), i8* %t188)
  store i8* %t189, i8** %reg_98_ptr
  %t190 = load i8*, i8** %reg_98_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t190)
  %t191 = load i8*, i8** %var_employees_ptr
  store i8* %t191, i8** %reg_99_ptr
  %t192 = load i8*, i8** %reg_99_ptr
  %t193 = call i8* @obo_entity_get_boxed(i8* %t192, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t193, i8** %reg_100_ptr
  %t194 = load i8*, i8** %reg_100_ptr
  %t195 = call i64 @avg_of(i8* %t194, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i64 %t195, i64* %reg_101_ptr
  %t196 = load i64, i64* %reg_101_ptr
  %t197 = call i8* @obo_i64_to_str(i64 %t196)
  %t198 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.79, i64 0, i64 0), i8* %t197)
  store i8* %t198, i8** %reg_102_ptr
  %t199 = load i8*, i8** %reg_102_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t199)
  %t200 = load i8*, i8** %var_employees_ptr
  store i8* %t200, i8** %reg_103_ptr
  %t201 = load i8*, i8** %reg_103_ptr
  %t202 = call i8* @obo_entity_get_boxed(i8* %t201, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t202, i8** %reg_104_ptr
  %t203 = load i8*, i8** %reg_104_ptr
  %t204 = call i8* @min_of(i8* %t203, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t204, i8** %reg_105_ptr
  %t205 = load i8*, i8** %reg_105_ptr
  %t206 = call i8* @obo_value_to_str(i8* %t205)
  %t207 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.80, i64 0, i64 0), i8* %t206)
  store i8* %t207, i8** %reg_106_ptr
  %t208 = load i8*, i8** %reg_106_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t208)
  %t209 = load i8*, i8** %var_employees_ptr
  store i8* %t209, i8** %reg_107_ptr
  %t210 = load i8*, i8** %reg_107_ptr
  %t211 = call i8* @obo_entity_get_boxed(i8* %t210, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t211, i8** %reg_108_ptr
  %t212 = load i8*, i8** %reg_108_ptr
  %t213 = call i8* @max_of(i8* %t212, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t213, i8** %reg_109_ptr
  %t214 = load i8*, i8** %reg_109_ptr
  %t215 = call i8* @obo_value_to_str(i8* %t214)
  %t216 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.81, i64 0, i64 0), i8* %t215)
  store i8* %t216, i8** %reg_110_ptr
  %t217 = load i8*, i8** %reg_110_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t217)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @obo.str.82, i64 0, i64 0))
  %t218 = load i8*, i8** %var_employees_ptr
  store i8* %t218, i8** %reg_111_ptr
  %t219 = load i8*, i8** %reg_111_ptr
  %t220 = call i8* @obo_entity_get_boxed(i8* %t219, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t220, i8** %reg_112_ptr
  %t221 = load i8*, i8** %reg_112_ptr
  %t222 = call i8* @group_by(i8* %t221, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t222, i8** %reg_113_ptr
  %t223 = load i8*, i8** %reg_113_ptr
  %t224 = call i8* @obo_mixed_list_get(i8* %t223, i64 0)
  store i8* %t224, i8** %reg_114_ptr
  %t225 = load i8*, i8** %reg_114_ptr
  store i8* %t225, i8** %var_groups_ptr
  %t226 = load i8*, i8** %reg_113_ptr
  %t227 = call i8* @obo_mixed_list_get(i8* %t226, i64 1)
  store i8* %t227, i8** %reg_115_ptr
  %t228 = load i8*, i8** %reg_115_ptr
  store i8* %t228, i8** %var_keys_ptr
  %t229 = load i8*, i8** %var_keys_ptr
  store i8* %t229, i8** %reg_116_ptr
  store i64 0, i64* %var___iter_idx_117_ptr
  %t230 = load i8*, i8** %reg_116_ptr
  %t231 = call i64 @obo_value_len(i8* %t230)
  store i64 %t231, i64* %reg_117_ptr
  br label %main_b1
main_b1:
  %t232 = load i64, i64* %var___iter_idx_117_ptr
  store i64 %t232, i64* %reg_118_ptr
  %t233 = load i64, i64* %reg_118_ptr
  %t234 = load i64, i64* %reg_117_ptr
  %t235 = icmp slt i64 %t233, %t234
  %t236 = zext i1 %t235 to i64
  store i64 %t236, i64* %reg_119_ptr
  %t237 = load i64, i64* %reg_119_ptr
  %t239 = icmp ne i64 %t237, 0
  %t240 = zext i1 %t239 to i64
  %t238 = icmp ne i64 %t240, 0
  br i1 %t238, label %main_b2, label %main_b4
main_b2:
  %t241 = load i64, i64* %var___iter_idx_117_ptr
  store i64 %t241, i64* %reg_120_ptr
  %t242 = load i8*, i8** %reg_116_ptr
  %t243 = load i64, i64* %reg_120_ptr
  %t245 = call i8* @obo_value_as_mixed_list_ptr(i8* %t242)
  %t244 = call i8* @obo_mixed_list_get(i8* %t245, i64 %t243)
  store i8* %t244, i8** %reg_121_ptr
  %t246 = load i8*, i8** %reg_121_ptr
  store i8* %t246, i8** %var_dept_ptr
  %t247 = load i8*, i8** %var_groups_ptr
  store i8* %t247, i8** %reg_122_ptr
  %t248 = load i8*, i8** %var_dept_ptr
  store i8* %t248, i8** %reg_123_ptr
  %t249 = load i8*, i8** %reg_122_ptr
  %t250 = load i8*, i8** %reg_123_ptr
  %t251 = call i8* @obo_value_to_str(i8* %t250)
  %t253 = call i8* @obo_value_as_map_ptr(i8* %t249)
  %t252 = call i8* @obo_map_get_boxed(i8* %t253, i8* %t251)
  store i8* %t252, i8** %reg_124_ptr
  %t254 = load i8*, i8** %reg_124_ptr
  store i8* %t254, i8** %var_dept_rows_ptr
  %t255 = load i8*, i8** %var_dept_ptr
  store i8* %t255, i8** %reg_125_ptr
  %t256 = load i8*, i8** %reg_125_ptr
  %t257 = call i8* @obo_value_to_str(i8* %t256)
  %t258 = call i8* @__text_padRight(i8* %t257, i64 15, i8* null)
  store i8* %t258, i8** %reg_126_ptr
  %t259 = load i8*, i8** %reg_126_ptr
  %t260 = call i8* @obo_str_concat(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8* %t259)
  store i8* %t260, i8** %reg_127_ptr
  %t261 = load i8*, i8** %reg_127_ptr
  %t262 = call i8* @obo_str_concat(i8* %t261, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.83, i64 0, i64 0))
  store i8* %t262, i8** %reg_128_ptr
  %t263 = load i8*, i8** %var_dept_rows_ptr
  store i8* %t263, i8** %reg_129_ptr
  %t264 = load i8*, i8** %reg_129_ptr
  %t265 = call i64 @obo_value_len(i8* %t264)
  store i64 %t265, i64* %reg_130_ptr
  %t266 = load i64, i64* %reg_130_ptr
  %t267 = call i8* @obo_i64_to_str(i64 %t266)
  %t268 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t267)
  store i8* %t268, i8** %reg_131_ptr
  %t269 = load i8*, i8** %reg_131_ptr
  %t270 = call i8* @__text_padRight(i8* %t269, i64 4, i8* null)
  store i8* %t270, i8** %reg_132_ptr
  %t271 = load i8*, i8** %reg_128_ptr
  %t272 = load i8*, i8** %reg_132_ptr
  %t273 = call i8* @obo_str_concat(i8* %t271, i8* %t272)
  store i8* %t273, i8** %reg_133_ptr
  %t274 = load i8*, i8** %reg_133_ptr
  %t275 = call i8* @obo_str_concat(i8* %t274, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.84, i64 0, i64 0))
  store i8* %t275, i8** %reg_134_ptr
  %t276 = load i8*, i8** %var_dept_rows_ptr
  store i8* %t276, i8** %reg_135_ptr
  %t277 = load i8*, i8** %reg_135_ptr
  %t278 = call i64 @avg_of(i8* %t277, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i64 %t278, i64* %reg_136_ptr
  %t279 = load i64, i64* %reg_136_ptr
  %t280 = call i8* @obo_i64_to_str(i64 %t279)
  %t281 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t280)
  store i8* %t281, i8** %reg_137_ptr
  %t282 = load i8*, i8** %reg_137_ptr
  %t283 = call i8* @__text_padRight(i8* %t282, i64 10, i8* null)
  store i8* %t283, i8** %reg_138_ptr
  %t284 = load i8*, i8** %reg_134_ptr
  %t285 = load i8*, i8** %reg_138_ptr
  %t286 = call i8* @obo_str_concat(i8* %t284, i8* %t285)
  store i8* %t286, i8** %reg_139_ptr
  %t287 = load i8*, i8** %reg_139_ptr
  %t288 = call i8* @obo_str_concat(i8* %t287, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.85, i64 0, i64 0))
  store i8* %t288, i8** %reg_140_ptr
  %t289 = load i8*, i8** %var_dept_rows_ptr
  store i8* %t289, i8** %reg_141_ptr
  %t290 = load i8*, i8** %reg_141_ptr
  %t291 = call i8* @min_of(i8* %t290, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0))
  store i8* %t291, i8** %reg_142_ptr
  %t292 = load i8*, i8** %reg_142_ptr
  %t293 = call i8* @obo_value_to_str(i8* %t292)
  %t294 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t293)
  store i8* %t294, i8** %reg_143_ptr
  %t295 = load i8*, i8** %reg_143_ptr
  %t296 = call i8* @__text_padRight(i8* %t295, i64 5, i8* null)
  store i8* %t296, i8** %reg_144_ptr
  %t297 = load i8*, i8** %reg_140_ptr
  %t298 = load i8*, i8** %reg_144_ptr
  %t299 = call i8* @obo_str_concat(i8* %t297, i8* %t298)
  store i8* %t299, i8** %reg_145_ptr
  %t300 = load i8*, i8** %reg_145_ptr
  %t301 = call i8* @obo_str_concat(i8* %t300, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.86, i64 0, i64 0))
  store i8* %t301, i8** %reg_146_ptr
  %t302 = load i8*, i8** %var_dept_rows_ptr
  store i8* %t302, i8** %reg_147_ptr
  %t303 = load i8*, i8** %reg_147_ptr
  %t304 = call i8* @max_of(i8* %t303, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0))
  store i8* %t304, i8** %reg_148_ptr
  %t305 = load i8*, i8** %reg_146_ptr
  %t306 = load i8*, i8** %reg_148_ptr
  %t307 = call i8* @obo_value_to_str(i8* %t306)
  %t308 = call i8* @obo_str_concat(i8* %t305, i8* %t307)
  store i8* %t308, i8** %reg_149_ptr
  %t309 = load i8*, i8** %reg_149_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t309)
  br label %main_b3
main_b3:
  %t310 = load i64, i64* %var___iter_idx_117_ptr
  store i64 %t310, i64* %reg_150_ptr
  %t311 = load i64, i64* %reg_150_ptr
  %t312 = add i64 %t311, 1
  store i64 %t312, i64* %reg_151_ptr
  %t313 = load i64, i64* %reg_151_ptr
  store i64 %t313, i64* %var___iter_idx_117_ptr
  br label %main_b1
main_b4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([47 x i8], [47 x i8]* @obo.str.87, i64 0, i64 0))
  %t314 = bitcast i64 (i8*, i64)* @__closure_3 to i8*
  %t315 = call i8* @obo_closure_new(i8* %t314, i64 0)
  store i8* %t315, i8** %reg_152_ptr
  %t316 = load i8*, i8** %var_employees_ptr
  store i8* %t316, i8** %reg_153_ptr
  %t317 = load i8*, i8** %reg_153_ptr
  %t318 = load i8*, i8** %reg_152_ptr
  %t319 = call i8* @Table_find_first(i8* %t317, i8* %t318)
  store i8* %t319, i8** %reg_154_ptr
  %t320 = load i8*, i8** %reg_154_ptr
  store i8* %t320, i8** %var_found_ptr
  %t321 = load i8*, i8** %var_found_ptr
  store i8* %t321, i8** %reg_155_ptr
  %t322 = load i8*, i8** %reg_155_ptr
  %t323 = call i8* @obo_box_null()
  %t324 = call i64 @obo_value_compare(i8* %t322, i8* %t323)
  %t325 = icmp ne i64 %t324, 0
  %t326 = zext i1 %t325 to i64
  store i64 %t326, i64* %reg_156_ptr
  %t327 = load i64, i64* %reg_156_ptr
  %t329 = icmp ne i64 %t327, 0
  %t330 = zext i1 %t329 to i64
  %t328 = icmp ne i64 %t330, 0
  br i1 %t328, label %main_b5, label %main_b6
main_b5:
  %t331 = load i8*, i8** %var_found_ptr
  store i8* %t331, i8** %reg_157_ptr
  %t332 = load i8*, i8** %reg_157_ptr
  %t333 = call i8* @obo_value_as_entity_ptr(i8* %t332)
  %t334 = call i8* @obo_entity_get_boxed(i8* %t333, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t334, i8** %reg_158_ptr
  %t335 = load i8*, i8** %reg_158_ptr
  %t337 = call i8* @obo_value_as_map_ptr(i8* %t335)
  %t336 = call i8* @obo_map_get_boxed(i8* %t337, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t336, i8** %reg_159_ptr
  %t338 = load i8*, i8** %reg_159_ptr
  %t339 = call i8* @obo_value_to_str(i8* %t338)
  %t340 = call i8* @obo_str_concat(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.89, i64 0, i64 0), i8* %t339)
  store i8* %t340, i8** %reg_160_ptr
  %t341 = load i8*, i8** %reg_160_ptr
  %t342 = call i8* @obo_str_concat(i8* %t341, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @obo.str.90, i64 0, i64 0))
  store i8* %t342, i8** %reg_161_ptr
  %t343 = load i8*, i8** %var_found_ptr
  store i8* %t343, i8** %reg_162_ptr
  %t344 = load i8*, i8** %reg_162_ptr
  %t345 = call i8* @obo_value_as_entity_ptr(i8* %t344)
  %t346 = call i8* @obo_entity_get_boxed(i8* %t345, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t346, i8** %reg_163_ptr
  %t347 = load i8*, i8** %reg_163_ptr
  %t349 = call i8* @obo_value_as_map_ptr(i8* %t347)
  %t348 = call i8* @obo_map_get_boxed(i8* %t349, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t348, i8** %reg_164_ptr
  %t350 = load i8*, i8** %reg_161_ptr
  %t351 = load i8*, i8** %reg_164_ptr
  %t352 = call i8* @obo_value_to_str(i8* %t351)
  %t353 = call i8* @obo_str_concat(i8* %t350, i8* %t352)
  store i8* %t353, i8** %reg_165_ptr
  %t354 = load i8*, i8** %reg_165_ptr
  %t355 = call i8* @obo_str_concat(i8* %t354, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.91, i64 0, i64 0))
  store i8* %t355, i8** %reg_166_ptr
  %t356 = load i8*, i8** %var_found_ptr
  store i8* %t356, i8** %reg_167_ptr
  %t357 = load i8*, i8** %reg_167_ptr
  %t358 = call i8* @obo_value_as_entity_ptr(i8* %t357)
  %t359 = call i8* @obo_entity_get_boxed(i8* %t358, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t359, i8** %reg_168_ptr
  %t360 = load i8*, i8** %reg_168_ptr
  %t362 = call i8* @obo_value_as_map_ptr(i8* %t360)
  %t361 = call i8* @obo_map_get_boxed(i8* %t362, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t361, i8** %reg_169_ptr
  %t363 = load i8*, i8** %reg_166_ptr
  %t364 = load i8*, i8** %reg_169_ptr
  %t365 = call i8* @obo_value_to_str(i8* %t364)
  %t366 = call i8* @obo_str_concat(i8* %t363, i8* %t365)
  store i8* %t366, i8** %reg_170_ptr
  %t367 = load i8*, i8** %reg_170_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t367)
  br label %main_b7
main_b6:
  br label %main_b7
main_b7:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([48 x i8], [48 x i8]* @obo.str.92, i64 0, i64 0))
  %t368 = load i8*, i8** %var_employees_ptr
  store i8* %t368, i8** %reg_171_ptr
  %t369 = load i8*, i8** %reg_171_ptr
  %t370 = call i8* @obo_entity_get_boxed(i8* %t369, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t370, i8** %reg_172_ptr
  %t371 = load i8*, i8** %reg_172_ptr
  %t372 = call i64 @avg_of(i8* %t371, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i64 %t372, i64* %reg_173_ptr
  %t373 = load i64, i64* %reg_173_ptr
  store i64 %t373, i64* %var_average_ptr
  %t374 = load i64, i64* %var_average_ptr
  store i64 %t374, i64* %reg_174_ptr
  %t375 = load i64, i64* %reg_174_ptr
  %t376 = call i8* @obo_i64_to_str(i64 %t375)
  %t377 = call i8* @obo_str_concat(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @obo.str.93, i64 0, i64 0), i8* %t376)
  store i8* %t377, i8** %reg_175_ptr
  %t378 = load i8*, i8** %reg_175_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t378)
  %t379 = load i64, i64* %var_average_ptr
  store i64 %t379, i64* %reg_176_ptr
  %t380 = bitcast i64 (i8*, i64)* @__closure_4 to i8*
  %t381 = call i8* @obo_closure_new(i8* %t380, i64 1)
  %t382 = load i64, i64* %reg_176_ptr
  call void @obo_closure_set_capture(i8* %t381, i64 0, i64 %t382)
  store i8* %t381, i8** %reg_177_ptr
  %t383 = load i8*, i8** %var_employees_ptr
  store i8* %t383, i8** %reg_178_ptr
  %t384 = load i8*, i8** %reg_178_ptr
  %t385 = load i8*, i8** %reg_177_ptr
  %t386 = call i8* @Table_where(i8* %t384, i8* %t385)
  store i8* %t386, i8** %reg_179_ptr
  %t387 = load i8*, i8** %reg_179_ptr
  store i8* %t387, i8** %var_above_avg_ptr
  %t388 = load i8*, i8** %var_above_avg_ptr
  store i8* %t388, i8** %reg_180_ptr
  %t389 = load i8*, i8** %reg_180_ptr
  %t390 = call i64 @Table_display(i8* %t389)
  store i64 %t390, i64* %reg_181_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @obo.str.94, i64 0, i64 0))
  %t391 = load i8*, i8** %var_employees_ptr
  store i8* %t391, i8** %reg_182_ptr
  %t392 = load i8*, i8** %var_departments_ptr
  store i8* %t392, i8** %reg_183_ptr
  %t393 = load i8*, i8** %reg_182_ptr
  %t394 = load i8*, i8** %reg_183_ptr
  %t395 = call i8* @inner_join(i8* %t393, i8* %t394, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.37, i64 0, i64 0))
  store i8* %t395, i8** %reg_184_ptr
  %t396 = load i8*, i8** %reg_184_ptr
  store i8* %t396, i8** %var_joined_ptr
  %t397 = load i8*, i8** %var_joined_ptr
  store i8* %t397, i8** %reg_185_ptr
  %t398 = load i8*, i8** %reg_185_ptr
  %t399 = call i8* @obo_entity_get_boxed(i8* %t398, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t399, i8** %reg_186_ptr
  %t400 = load i8*, i8** %reg_186_ptr
  %t401 = call i64 @obo_value_len(i8* %t400)
  store i64 %t401, i64* %reg_187_ptr
  %t402 = load i64, i64* %reg_187_ptr
  %t403 = call i8* @obo_i64_to_str(i64 %t402)
  %t404 = call i8* @obo_str_concat(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.95, i64 0, i64 0), i8* %t403)
  store i8* %t404, i8** %reg_188_ptr
  %t405 = load i8*, i8** %reg_188_ptr
  %t406 = call i8* @obo_str_concat(i8* %t405, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.26, i64 0, i64 0))
  store i8* %t406, i8** %reg_189_ptr
  %t407 = load i8*, i8** %reg_189_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t407)
  %t408 = load i8*, i8** %var_joined_ptr
  store i8* %t408, i8** %reg_190_ptr
  %t409 = load i8*, i8** %reg_190_ptr
  %t410 = call i8* @obo_entity_get_boxed(i8* %t409, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t410, i8** %reg_191_ptr
  store i64 0, i64* %var___iter_idx_192_ptr
  %t411 = load i8*, i8** %reg_191_ptr
  %t412 = call i64 @obo_value_len(i8* %t411)
  store i64 %t412, i64* %reg_192_ptr
  br label %main_b8
main_b8:
  %t413 = load i64, i64* %var___iter_idx_192_ptr
  store i64 %t413, i64* %reg_193_ptr
  %t414 = load i64, i64* %reg_193_ptr
  %t415 = load i64, i64* %reg_192_ptr
  %t416 = icmp slt i64 %t414, %t415
  %t417 = zext i1 %t416 to i64
  store i64 %t417, i64* %reg_194_ptr
  %t418 = load i64, i64* %reg_194_ptr
  %t420 = icmp ne i64 %t418, 0
  %t421 = zext i1 %t420 to i64
  %t419 = icmp ne i64 %t421, 0
  br i1 %t419, label %main_b9, label %main_b11
main_b9:
  %t422 = load i64, i64* %var___iter_idx_192_ptr
  store i64 %t422, i64* %reg_195_ptr
  %t423 = load i8*, i8** %reg_191_ptr
  %t424 = load i64, i64* %reg_195_ptr
  %t426 = call i8* @obo_value_as_mixed_list_ptr(i8* %t423)
  %t425 = call i8* @obo_mixed_list_get(i8* %t426, i64 %t424)
  store i8* %t425, i8** %reg_196_ptr
  %t427 = load i8*, i8** %reg_196_ptr
  store i8* %t427, i8** %var_r_ptr
  %t428 = load i8*, i8** %var_r_ptr
  store i8* %t428, i8** %reg_197_ptr
  %t429 = load i8*, i8** %reg_197_ptr
  %t430 = call i8* @obo_value_as_entity_ptr(i8* %t429)
  %t431 = call i8* @obo_entity_get_boxed(i8* %t430, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t431, i8** %reg_198_ptr
  %t432 = load i8*, i8** %reg_198_ptr
  %t434 = call i8* @obo_value_as_map_ptr(i8* %t432)
  %t433 = call i8* @obo_map_get_boxed(i8* %t434, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.96, i64 0, i64 0))
  store i8* %t433, i8** %reg_199_ptr
  %t435 = load i8*, i8** %reg_199_ptr
  %t436 = call i8* @obo_value_to_str(i8* %t435)
  %t437 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t436)
  store i8* %t437, i8** %reg_200_ptr
  %t438 = load i8*, i8** %reg_200_ptr
  %t439 = call i8* @__text_padRight(i8* %t438, i64 10, i8* null)
  store i8* %t439, i8** %reg_201_ptr
  %t440 = load i8*, i8** %reg_201_ptr
  %t441 = call i8* @obo_str_concat(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.14, i64 0, i64 0), i8* %t440)
  store i8* %t441, i8** %reg_202_ptr
  %t442 = load i8*, i8** %reg_202_ptr
  %t443 = call i8* @obo_str_concat(i8* %t442, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.97, i64 0, i64 0))
  store i8* %t443, i8** %reg_203_ptr
  %t444 = load i8*, i8** %var_r_ptr
  store i8* %t444, i8** %reg_204_ptr
  %t445 = load i8*, i8** %reg_204_ptr
  %t446 = call i8* @obo_value_as_entity_ptr(i8* %t445)
  %t447 = call i8* @obo_entity_get_boxed(i8* %t446, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t447, i8** %reg_205_ptr
  %t448 = load i8*, i8** %reg_205_ptr
  %t450 = call i8* @obo_value_as_map_ptr(i8* %t448)
  %t449 = call i8* @obo_map_get_boxed(i8* %t450, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @obo.str.98, i64 0, i64 0))
  store i8* %t449, i8** %reg_206_ptr
  %t451 = load i8*, i8** %reg_206_ptr
  %t452 = call i8* @obo_value_to_str(i8* %t451)
  %t453 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t452)
  store i8* %t453, i8** %reg_207_ptr
  %t454 = load i8*, i8** %reg_207_ptr
  %t455 = call i8* @__text_padRight(i8* %t454, i64 14, i8* null)
  store i8* %t455, i8** %reg_208_ptr
  %t456 = load i8*, i8** %reg_203_ptr
  %t457 = load i8*, i8** %reg_208_ptr
  %t458 = call i8* @obo_str_concat(i8* %t456, i8* %t457)
  store i8* %t458, i8** %reg_209_ptr
  %t459 = load i8*, i8** %reg_209_ptr
  %t460 = call i8* @obo_str_concat(i8* %t459, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.99, i64 0, i64 0))
  store i8* %t460, i8** %reg_210_ptr
  %t461 = load i8*, i8** %var_r_ptr
  store i8* %t461, i8** %reg_211_ptr
  %t462 = load i8*, i8** %reg_211_ptr
  %t463 = call i8* @obo_value_as_entity_ptr(i8* %t462)
  %t464 = call i8* @obo_entity_get_boxed(i8* %t463, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t464, i8** %reg_212_ptr
  %t465 = load i8*, i8** %reg_212_ptr
  %t467 = call i8* @obo_value_as_map_ptr(i8* %t465)
  %t466 = call i8* @obo_map_get_boxed(i8* %t467, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.100, i64 0, i64 0))
  store i8* %t466, i8** %reg_213_ptr
  %t468 = load i8*, i8** %reg_213_ptr
  %t469 = call i8* @obo_value_to_str(i8* %t468)
  %t470 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t469)
  store i8* %t470, i8** %reg_214_ptr
  %t471 = load i8*, i8** %reg_214_ptr
  %t472 = call i8* @__text_padRight(i8* %t471, i64 10, i8* null)
  store i8* %t472, i8** %reg_215_ptr
  %t473 = load i8*, i8** %reg_210_ptr
  %t474 = load i8*, i8** %reg_215_ptr
  %t475 = call i8* @obo_str_concat(i8* %t473, i8* %t474)
  store i8* %t475, i8** %reg_216_ptr
  %t476 = load i8*, i8** %reg_216_ptr
  %t477 = call i8* @obo_str_concat(i8* %t476, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.101, i64 0, i64 0))
  store i8* %t477, i8** %reg_217_ptr
  %t478 = load i8*, i8** %var_r_ptr
  store i8* %t478, i8** %reg_218_ptr
  %t479 = load i8*, i8** %reg_218_ptr
  %t480 = call i8* @obo_value_as_entity_ptr(i8* %t479)
  %t481 = call i8* @obo_entity_get_boxed(i8* %t480, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t481, i8** %reg_219_ptr
  %t482 = load i8*, i8** %reg_219_ptr
  %t484 = call i8* @obo_value_as_map_ptr(i8* %t482)
  %t483 = call i8* @obo_map_get_boxed(i8* %t484, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @obo.str.102, i64 0, i64 0))
  store i8* %t483, i8** %reg_220_ptr
  %t485 = load i8*, i8** %reg_220_ptr
  %t486 = call i8* @obo_value_to_str(i8* %t485)
  %t487 = call i8* @obo_str_concat(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0), i8* %t486)
  store i8* %t487, i8** %reg_221_ptr
  %t488 = load i8*, i8** %reg_221_ptr
  %t489 = call i8* @__text_padRight(i8* %t488, i64 10, i8* null)
  store i8* %t489, i8** %reg_222_ptr
  %t490 = load i8*, i8** %reg_217_ptr
  %t491 = load i8*, i8** %reg_222_ptr
  %t492 = call i8* @obo_str_concat(i8* %t490, i8* %t491)
  store i8* %t492, i8** %reg_223_ptr
  %t493 = load i8*, i8** %reg_223_ptr
  %t494 = call i8* @obo_str_concat(i8* %t493, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.103, i64 0, i64 0))
  store i8* %t494, i8** %reg_224_ptr
  %t495 = load i8*, i8** %var_r_ptr
  store i8* %t495, i8** %reg_225_ptr
  %t496 = load i8*, i8** %reg_225_ptr
  %t497 = call i8* @obo_value_as_entity_ptr(i8* %t496)
  %t498 = call i8* @obo_entity_get_boxed(i8* %t497, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t498, i8** %reg_226_ptr
  %t499 = load i8*, i8** %reg_226_ptr
  %t501 = call i8* @obo_value_as_map_ptr(i8* %t499)
  %t500 = call i8* @obo_map_get_boxed(i8* %t501, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.104, i64 0, i64 0))
  store i8* %t500, i8** %reg_227_ptr
  %t502 = load i8*, i8** %reg_224_ptr
  %t503 = load i8*, i8** %reg_227_ptr
  %t504 = call i8* @obo_value_to_str(i8* %t503)
  %t505 = call i8* @obo_str_concat(i8* %t502, i8* %t504)
  store i8* %t505, i8** %reg_228_ptr
  %t506 = load i8*, i8** %reg_228_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t506)
  br label %main_b10
main_b10:
  %t507 = load i64, i64* %var___iter_idx_192_ptr
  store i64 %t507, i64* %reg_229_ptr
  %t508 = load i64, i64* %reg_229_ptr
  %t509 = add i64 %t508, 1
  store i64 %t509, i64* %reg_230_ptr
  %t510 = load i64, i64* %reg_230_ptr
  store i64 %t510, i64* %var___iter_idx_192_ptr
  br label %main_b8
main_b11:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([53 x i8], [53 x i8]* @obo.str.105, i64 0, i64 0))
  %t511 = bitcast i64 (i8*, i64)* @__closure_5 to i8*
  %t512 = call i8* @obo_closure_new(i8* %t511, i64 0)
  store i8* %t512, i8** %reg_231_ptr
  %t513 = bitcast i64 (i8*, i64)* @__closure_6 to i8*
  %t514 = call i8* @obo_closure_new(i8* %t513, i64 0)
  store i8* %t514, i8** %reg_232_ptr
  %t515 = load i8*, i8** %var_employees_ptr
  store i8* %t515, i8** %reg_233_ptr
  %t516 = load i8*, i8** %reg_233_ptr
  %t517 = load i8*, i8** %reg_231_ptr
  %t518 = load i8*, i8** %reg_232_ptr
  %t519 = call i64 @Table_update_where(i8* %t516, i8* %t517, i8* %t518)
  store i64 %t519, i64* %reg_234_ptr
  %t520 = load i64, i64* %reg_234_ptr
  store i64 %t520, i64* %var_changed_ptr
  %t521 = load i64, i64* %var_changed_ptr
  store i64 %t521, i64* %reg_235_ptr
  %t522 = load i64, i64* %reg_235_ptr
  %t523 = call i8* @obo_i64_to_str(i64 %t522)
  %t524 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.107, i64 0, i64 0), i8* %t523)
  store i8* %t524, i8** %reg_236_ptr
  %t525 = load i8*, i8** %reg_236_ptr
  %t526 = call i8* @obo_str_concat(i8* %t525, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.26, i64 0, i64 0))
  store i8* %t526, i8** %reg_237_ptr
  %t527 = load i8*, i8** %reg_237_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t527)
  %t528 = bitcast i64 (i8*, i64)* @__closure_7 to i8*
  %t529 = call i8* @obo_closure_new(i8* %t528, i64 0)
  store i8* %t529, i8** %reg_238_ptr
  %t530 = load i8*, i8** %var_employees_ptr
  store i8* %t530, i8** %reg_239_ptr
  %t531 = load i8*, i8** %reg_239_ptr
  %t532 = load i8*, i8** %reg_238_ptr
  %t533 = call i8* @Table_where(i8* %t531, i8* %t532)
  store i8* %t533, i8** %reg_240_ptr
  %t534 = load i8*, i8** %reg_240_ptr
  store i8* %t534, i8** %var_eng_after_ptr
  %t535 = load i8*, i8** %var_eng_after_ptr
  store i8* %t535, i8** %reg_241_ptr
  %t536 = load i8*, i8** %reg_241_ptr
  %t537 = call i64 @Table_display(i8* %t536)
  store i64 %t537, i64* %reg_242_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @obo.str.108, i64 0, i64 0))
  %t538 = bitcast i64 (i8*, i64)* @__closure_8 to i8*
  %t539 = call i8* @obo_closure_new(i8* %t538, i64 0)
  store i8* %t539, i8** %reg_243_ptr
  %t540 = load i8*, i8** %var_employees_ptr
  store i8* %t540, i8** %reg_244_ptr
  %t541 = load i8*, i8** %reg_244_ptr
  %t542 = load i8*, i8** %reg_243_ptr
  %t543 = call i64 @Table_delete_where(i8* %t541, i8* %t542)
  store i64 %t543, i64* %reg_245_ptr
  %t544 = load i64, i64* %reg_245_ptr
  store i64 %t544, i64* %var_removed_ptr
  %t545 = load i64, i64* %var_removed_ptr
  store i64 %t545, i64* %reg_246_ptr
  %t546 = load i64, i64* %reg_246_ptr
  %t547 = call i8* @obo_i64_to_str(i64 %t546)
  %t548 = call i8* @obo_str_concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.110, i64 0, i64 0), i8* %t547)
  store i8* %t548, i8** %reg_247_ptr
  %t549 = load i8*, i8** %reg_247_ptr
  %t550 = call i8* @obo_str_concat(i8* %t549, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.26, i64 0, i64 0))
  store i8* %t550, i8** %reg_248_ptr
  %t551 = load i8*, i8** %reg_248_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t551)
  %t552 = load i8*, i8** %var_employees_ptr
  store i8* %t552, i8** %reg_249_ptr
  %t553 = load i8*, i8** %reg_249_ptr
  %t554 = call i64 @Table_display(i8* %t553)
  store i64 %t554, i64* %reg_250_ptr
  %t555 = load i8*, i8** %var_employees_ptr
  store i8* %t555, i8** %reg_251_ptr
  %t556 = load i8*, i8** %var_db_ptr
  store i8* %t556, i8** %reg_252_ptr
  %t557 = load i8*, i8** %reg_252_ptr
  %t558 = load i8*, i8** %reg_251_ptr
  %t559 = call i64 @Database_update_table(i8* %t557, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @obo.str.36, i64 0, i64 0), i8* %t558)
  store i64 %t559, i64* %reg_253_ptr
  %t560 = load i8*, i8** %var_departments_ptr
  store i8* %t560, i8** %reg_254_ptr
  %t561 = load i8*, i8** %var_db_ptr
  store i8* %t561, i8** %reg_255_ptr
  %t562 = load i8*, i8** %reg_255_ptr
  %t563 = load i8*, i8** %reg_254_ptr
  %t564 = call i64 @Database_update_table(i8* %t562, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.40, i64 0, i64 0), i8* %t563)
  store i64 %t564, i64* %reg_256_ptr
  %t565 = load i8*, i8** %var_db_ptr
  store i8* %t565, i8** %reg_257_ptr
  %t566 = load i8*, i8** %reg_257_ptr
  %t567 = call i64 @Database_info(i8* %t566)
  store i64 %t567, i64* %reg_258_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @obo.str.3, i64 0, i64 0))
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @obo.str.113, i64 0, i64 0))
  call void @obo_gc_pop_roots(i64 236)
  call void @obo_arena_free_all()
  ret i32 0
}

define i64 @test_insert_and_count() {
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
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 2)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 1, i8* %t2)
  store i8* %t0, i8** %reg_0_ptr
  %t3 = load i8*, i8** %reg_0_ptr
  %t4 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t3)
  store i8* %t4, i8** %reg_1_ptr
  %t5 = load i8*, i8** %reg_1_ptr
  store i8* %t5, i8** %var_t_ptr
  %t6 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0), i64 1)
  call void @obo_map_put_i64(i8* %t6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0), i64 2)
  store i8* %t6, i8** %reg_2_ptr
  %t7 = load i8*, i8** %var_t_ptr
  store i8* %t7, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_3_ptr
  %t9 = load i8*, i8** %reg_2_ptr
  %t10 = call i8* @Table_insert(i8* %t8, i8* %t9)
  store i8* %t10, i8** %reg_4_ptr
  %t11 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0), i64 3)
  call void @obo_map_put_i64(i8* %t11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0), i64 4)
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %var_t_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @Table_insert(i8* %t13, i8* %t14)
  store i8* %t15, i8** %reg_7_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %reg_8_ptr
  %t18 = call i8* @obo_entity_get_boxed(i8* %t17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t18, i8** %reg_9_ptr
  %t19 = load i8*, i8** %reg_9_ptr
  %t20 = call i64 @obo_value_len(i8* %t19)
  store i64 %t20, i64* %reg_10_ptr
  %t21 = load i64, i64* %reg_10_ptr
  %t22 = icmp eq i64 %t21, 2
  %t23 = zext i1 %t22 to i64
  store i64 %t23, i64* %reg_11_ptr
  %t24 = load i64, i64* %reg_11_ptr
  %t26 = icmp ne i64 %t24, 0
  %t27 = zext i1 %t26 to i64
  %t25 = icmp ne i64 %t27, 0
  br i1 %t25, label %test_insert_and_count_b2, label %test_insert_and_count_b1
test_insert_and_count_b1:
  %t28 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t28, i8** %reg_12_ptr
  br label %test_insert_and_count_b2
test_insert_and_count_b2:
  call void @obo_gc_pop_roots(i64 12)
  ret i64 0
}

define i64 @test_where_filter() {
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
  %reg_16_ptr = alloca i64
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_filtered_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_filtered_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0), i64 10)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0), i64 20)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0), i64 30)
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = bitcast i64 (i8*, i64)* @__closure_9 to i8*
  %t21 = call i8* @obo_closure_new(i8* %t20, i64 0)
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %var_t_ptr
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @Table_where(i8* %t23, i8* %t24)
  store i8* %t25, i8** %reg_13_ptr
  %t26 = load i8*, i8** %reg_13_ptr
  store i8* %t26, i8** %var_filtered_ptr
  %t27 = load i8*, i8** %var_filtered_ptr
  store i8* %t27, i8** %reg_14_ptr
  %t28 = load i8*, i8** %reg_14_ptr
  %t29 = call i8* @obo_entity_get_boxed(i8* %t28, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t29, i8** %reg_15_ptr
  %t30 = load i8*, i8** %reg_15_ptr
  %t31 = call i64 @obo_value_len(i8* %t30)
  store i64 %t31, i64* %reg_16_ptr
  %t32 = load i64, i64* %reg_16_ptr
  %t33 = icmp eq i64 %t32, 2
  %t34 = zext i1 %t33 to i64
  store i64 %t34, i64* %reg_17_ptr
  %t35 = load i64, i64* %reg_17_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %test_where_filter_b2, label %test_where_filter_b1
test_where_filter_b1:
  %t39 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t39, i8** %reg_18_ptr
  br label %test_where_filter_b2
test_where_filter_b2:
  call void @obo_gc_pop_roots(i64 19)
  ret i64 0
}

define i64 @test_order_by_ascending() {
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
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %var_sorted_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 30)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 10)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 20)
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %var_t_ptr
  store i8* %t20, i8** %reg_11_ptr
  %t21 = load i8*, i8** %reg_11_ptr
  %t22 = call i8* @Table_order_by(i8* %t21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 1)
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  store i8* %t23, i8** %var_sorted_ptr
  %t24 = load i8*, i8** %var_sorted_ptr
  store i8* %t24, i8** %reg_13_ptr
  %t25 = load i8*, i8** %reg_13_ptr
  %t26 = call i8* @obo_entity_get_boxed(i8* %t25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t26, i8** %reg_14_ptr
  %t27 = load i8*, i8** %reg_14_ptr
  %t29 = call i8* @obo_value_as_mixed_list_ptr(i8* %t27)
  %t28 = call i8* @obo_mixed_list_get(i8* %t29, i64 0)
  store i8* %t28, i8** %reg_15_ptr
  %t30 = load i8*, i8** %reg_15_ptr
  %t31 = call i8* @obo_value_as_entity_ptr(i8* %t30)
  %t32 = call i8* @obo_entity_get_boxed(i8* %t31, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t32, i8** %reg_16_ptr
  %t33 = load i8*, i8** %reg_16_ptr
  %t35 = call i8* @obo_value_as_map_ptr(i8* %t33)
  %t34 = call i8* @obo_map_get_boxed(i8* %t35, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t34, i8** %reg_17_ptr
  %t36 = load i8*, i8** %reg_17_ptr
  %t37 = call i64 @obo_value_as_i64(i8* %t36)
  %t38 = icmp eq i64 %t37, 10
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_18_ptr
  %t40 = load i64, i64* %reg_18_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %test_order_by_ascending_b2, label %test_order_by_ascending_b1
test_order_by_ascending_b1:
  %t44 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t44, i8** %reg_19_ptr
  br label %test_order_by_ascending_b2
test_order_by_ascending_b2:
  %t45 = load i8*, i8** %var_sorted_ptr
  store i8* %t45, i8** %reg_20_ptr
  %t46 = load i8*, i8** %reg_20_ptr
  %t47 = call i8* @obo_entity_get_boxed(i8* %t46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t47, i8** %reg_21_ptr
  %t48 = load i8*, i8** %reg_21_ptr
  %t50 = call i8* @obo_value_as_mixed_list_ptr(i8* %t48)
  %t49 = call i8* @obo_mixed_list_get(i8* %t50, i64 1)
  store i8* %t49, i8** %reg_22_ptr
  %t51 = load i8*, i8** %reg_22_ptr
  %t52 = call i8* @obo_value_as_entity_ptr(i8* %t51)
  %t53 = call i8* @obo_entity_get_boxed(i8* %t52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t53, i8** %reg_23_ptr
  %t54 = load i8*, i8** %reg_23_ptr
  %t56 = call i8* @obo_value_as_map_ptr(i8* %t54)
  %t55 = call i8* @obo_map_get_boxed(i8* %t56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t55, i8** %reg_24_ptr
  %t57 = load i8*, i8** %reg_24_ptr
  %t58 = call i64 @obo_value_as_i64(i8* %t57)
  %t59 = icmp eq i64 %t58, 20
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_25_ptr
  %t61 = load i64, i64* %reg_25_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %test_order_by_ascending_b4, label %test_order_by_ascending_b3
test_order_by_ascending_b3:
  %t65 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t65, i8** %reg_26_ptr
  br label %test_order_by_ascending_b4
test_order_by_ascending_b4:
  %t66 = load i8*, i8** %var_sorted_ptr
  store i8* %t66, i8** %reg_27_ptr
  %t67 = load i8*, i8** %reg_27_ptr
  %t68 = call i8* @obo_entity_get_boxed(i8* %t67, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t68, i8** %reg_28_ptr
  %t69 = load i8*, i8** %reg_28_ptr
  %t71 = call i8* @obo_value_as_mixed_list_ptr(i8* %t69)
  %t70 = call i8* @obo_mixed_list_get(i8* %t71, i64 2)
  store i8* %t70, i8** %reg_29_ptr
  %t72 = load i8*, i8** %reg_29_ptr
  %t73 = call i8* @obo_value_as_entity_ptr(i8* %t72)
  %t74 = call i8* @obo_entity_get_boxed(i8* %t73, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t74, i8** %reg_30_ptr
  %t75 = load i8*, i8** %reg_30_ptr
  %t77 = call i8* @obo_value_as_map_ptr(i8* %t75)
  %t76 = call i8* @obo_map_get_boxed(i8* %t77, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t76, i8** %reg_31_ptr
  %t78 = load i8*, i8** %reg_31_ptr
  %t79 = call i64 @obo_value_as_i64(i8* %t78)
  %t80 = icmp eq i64 %t79, 30
  %t81 = zext i1 %t80 to i64
  store i64 %t81, i64* %reg_32_ptr
  %t82 = load i64, i64* %reg_32_ptr
  %t84 = icmp ne i64 %t82, 0
  %t85 = zext i1 %t84 to i64
  %t83 = icmp ne i64 %t85, 0
  br i1 %t83, label %test_order_by_ascending_b6, label %test_order_by_ascending_b5
test_order_by_ascending_b5:
  %t86 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t86, i8** %reg_33_ptr
  br label %test_order_by_ascending_b6
test_order_by_ascending_b6:
  call void @obo_gc_pop_roots(i64 33)
  ret i64 0
}

define i64 @test_order_by_descending() {
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
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_sorted_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_sorted_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 10)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 30)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 20)
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %var_t_ptr
  store i8* %t20, i8** %reg_11_ptr
  %t21 = load i8*, i8** %reg_11_ptr
  %t22 = call i8* @Table_order_by(i8* %t21, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0), i64 0)
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  store i8* %t23, i8** %var_sorted_ptr
  %t24 = load i8*, i8** %var_sorted_ptr
  store i8* %t24, i8** %reg_13_ptr
  %t25 = load i8*, i8** %reg_13_ptr
  %t26 = call i8* @obo_entity_get_boxed(i8* %t25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t26, i8** %reg_14_ptr
  %t27 = load i8*, i8** %reg_14_ptr
  %t29 = call i8* @obo_value_as_mixed_list_ptr(i8* %t27)
  %t28 = call i8* @obo_mixed_list_get(i8* %t29, i64 0)
  store i8* %t28, i8** %reg_15_ptr
  %t30 = load i8*, i8** %reg_15_ptr
  %t31 = call i8* @obo_value_as_entity_ptr(i8* %t30)
  %t32 = call i8* @obo_entity_get_boxed(i8* %t31, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t32, i8** %reg_16_ptr
  %t33 = load i8*, i8** %reg_16_ptr
  %t35 = call i8* @obo_value_as_map_ptr(i8* %t33)
  %t34 = call i8* @obo_map_get_boxed(i8* %t35, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t34, i8** %reg_17_ptr
  %t36 = load i8*, i8** %reg_17_ptr
  %t37 = call i64 @obo_value_as_i64(i8* %t36)
  %t38 = icmp eq i64 %t37, 30
  %t39 = zext i1 %t38 to i64
  store i64 %t39, i64* %reg_18_ptr
  %t40 = load i64, i64* %reg_18_ptr
  %t42 = icmp ne i64 %t40, 0
  %t43 = zext i1 %t42 to i64
  %t41 = icmp ne i64 %t43, 0
  br i1 %t41, label %test_order_by_descending_b2, label %test_order_by_descending_b1
test_order_by_descending_b1:
  %t44 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t44, i8** %reg_19_ptr
  br label %test_order_by_descending_b2
test_order_by_descending_b2:
  %t45 = load i8*, i8** %var_sorted_ptr
  store i8* %t45, i8** %reg_20_ptr
  %t46 = load i8*, i8** %reg_20_ptr
  %t47 = call i8* @obo_entity_get_boxed(i8* %t46, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t47, i8** %reg_21_ptr
  %t48 = load i8*, i8** %reg_21_ptr
  %t50 = call i8* @obo_value_as_mixed_list_ptr(i8* %t48)
  %t49 = call i8* @obo_mixed_list_get(i8* %t50, i64 1)
  store i8* %t49, i8** %reg_22_ptr
  %t51 = load i8*, i8** %reg_22_ptr
  %t52 = call i8* @obo_value_as_entity_ptr(i8* %t51)
  %t53 = call i8* @obo_entity_get_boxed(i8* %t52, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t53, i8** %reg_23_ptr
  %t54 = load i8*, i8** %reg_23_ptr
  %t56 = call i8* @obo_value_as_map_ptr(i8* %t54)
  %t55 = call i8* @obo_map_get_boxed(i8* %t56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t55, i8** %reg_24_ptr
  %t57 = load i8*, i8** %reg_24_ptr
  %t58 = call i64 @obo_value_as_i64(i8* %t57)
  %t59 = icmp eq i64 %t58, 20
  %t60 = zext i1 %t59 to i64
  store i64 %t60, i64* %reg_25_ptr
  %t61 = load i64, i64* %reg_25_ptr
  %t63 = icmp ne i64 %t61, 0
  %t64 = zext i1 %t63 to i64
  %t62 = icmp ne i64 %t64, 0
  br i1 %t62, label %test_order_by_descending_b4, label %test_order_by_descending_b3
test_order_by_descending_b3:
  %t65 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t65, i8** %reg_26_ptr
  br label %test_order_by_descending_b4
test_order_by_descending_b4:
  %t66 = load i8*, i8** %var_sorted_ptr
  store i8* %t66, i8** %reg_27_ptr
  %t67 = load i8*, i8** %reg_27_ptr
  %t68 = call i8* @obo_entity_get_boxed(i8* %t67, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t68, i8** %reg_28_ptr
  %t69 = load i8*, i8** %reg_28_ptr
  %t71 = call i8* @obo_value_as_mixed_list_ptr(i8* %t69)
  %t70 = call i8* @obo_mixed_list_get(i8* %t71, i64 2)
  store i8* %t70, i8** %reg_29_ptr
  %t72 = load i8*, i8** %reg_29_ptr
  %t73 = call i8* @obo_value_as_entity_ptr(i8* %t72)
  %t74 = call i8* @obo_entity_get_boxed(i8* %t73, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t74, i8** %reg_30_ptr
  %t75 = load i8*, i8** %reg_30_ptr
  %t77 = call i8* @obo_value_as_map_ptr(i8* %t75)
  %t76 = call i8* @obo_map_get_boxed(i8* %t77, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.119, i64 0, i64 0))
  store i8* %t76, i8** %reg_31_ptr
  %t78 = load i8*, i8** %reg_31_ptr
  %t79 = call i64 @obo_value_as_i64(i8* %t78)
  %t80 = icmp eq i64 %t79, 10
  %t81 = zext i1 %t80 to i64
  store i64 %t81, i64* %reg_32_ptr
  %t82 = load i64, i64* %reg_32_ptr
  %t84 = icmp ne i64 %t82, 0
  %t85 = zext i1 %t84 to i64
  %t83 = icmp ne i64 %t85, 0
  br i1 %t83, label %test_order_by_descending_b6, label %test_order_by_descending_b5
test_order_by_descending_b5:
  %t86 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t86, i8** %reg_33_ptr
  br label %test_order_by_descending_b6
test_order_by_descending_b6:
  call void @obo_gc_pop_roots(i64 33)
  ret i64 0
}

define i64 @test_update_where() {
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
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i8*
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
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_changed_ptr = alloca i64
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
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 2)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 1, i8* %t2)
  store i8* %t0, i8** %reg_0_ptr
  %t3 = load i8*, i8** %reg_0_ptr
  %t4 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t3)
  store i8* %t4, i8** %reg_1_ptr
  %t5 = load i8*, i8** %reg_1_ptr
  store i8* %t5, i8** %var_t_ptr
  %t6 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t6, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0), i64 50)
  store i8* %t6, i8** %reg_2_ptr
  %t7 = load i8*, i8** %var_t_ptr
  store i8* %t7, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_3_ptr
  %t9 = load i8*, i8** %reg_2_ptr
  %t10 = call i8* @Table_insert(i8* %t8, i8* %t9)
  store i8* %t10, i8** %reg_4_ptr
  %t11 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t11, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0), i64 80)
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %var_t_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @Table_insert(i8* %t13, i8* %t14)
  store i8* %t15, i8** %reg_7_ptr
  %t16 = bitcast i64 (i8*, i64)* @__closure_10 to i8*
  %t17 = call i8* @obo_closure_new(i8* %t16, i64 0)
  store i8* %t17, i8** %reg_8_ptr
  %t18 = bitcast i64 (i8*, i64)* @__closure_11 to i8*
  %t19 = call i8* @obo_closure_new(i8* %t18, i64 0)
  store i8* %t19, i8** %reg_9_ptr
  %t20 = load i8*, i8** %var_t_ptr
  store i8* %t20, i8** %reg_10_ptr
  %t21 = load i8*, i8** %reg_10_ptr
  %t22 = load i8*, i8** %reg_8_ptr
  %t23 = load i8*, i8** %reg_9_ptr
  %t24 = call i64 @Table_update_where(i8* %t21, i8* %t22, i8* %t23)
  store i64 %t24, i64* %reg_11_ptr
  %t25 = load i64, i64* %reg_11_ptr
  store i64 %t25, i64* %var_changed_ptr
  %t26 = load i64, i64* %var_changed_ptr
  store i64 %t26, i64* %reg_12_ptr
  %t27 = load i64, i64* %reg_12_ptr
  %t28 = icmp eq i64 %t27, 1
  %t29 = zext i1 %t28 to i64
  store i64 %t29, i64* %reg_13_ptr
  %t30 = load i64, i64* %reg_13_ptr
  %t32 = icmp ne i64 %t30, 0
  %t33 = zext i1 %t32 to i64
  %t31 = icmp ne i64 %t33, 0
  br i1 %t31, label %test_update_where_b2, label %test_update_where_b1
test_update_where_b1:
  %t34 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t34, i8** %reg_14_ptr
  br label %test_update_where_b2
test_update_where_b2:
  %t35 = load i8*, i8** %var_t_ptr
  store i8* %t35, i8** %reg_15_ptr
  %t36 = load i8*, i8** %reg_15_ptr
  %t37 = call i8* @obo_entity_get_boxed(i8* %t36, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t37, i8** %reg_16_ptr
  %t38 = load i8*, i8** %reg_16_ptr
  %t40 = call i8* @obo_value_as_mixed_list_ptr(i8* %t38)
  %t39 = call i8* @obo_mixed_list_get(i8* %t40, i64 0)
  store i8* %t39, i8** %reg_17_ptr
  %t41 = load i8*, i8** %reg_17_ptr
  %t42 = call i8* @obo_value_as_entity_ptr(i8* %t41)
  %t43 = call i8* @obo_entity_get_boxed(i8* %t42, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t43, i8** %reg_18_ptr
  %t44 = load i8*, i8** %reg_18_ptr
  %t46 = call i8* @obo_value_as_map_ptr(i8* %t44)
  %t45 = call i8* @obo_map_get_boxed(i8* %t46, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0))
  store i8* %t45, i8** %reg_19_ptr
  %t47 = load i8*, i8** %reg_19_ptr
  %t48 = call i64 @obo_value_as_i64(i8* %t47)
  %t49 = icmp eq i64 %t48, 100
  %t50 = zext i1 %t49 to i64
  store i64 %t50, i64* %reg_20_ptr
  %t51 = load i64, i64* %reg_20_ptr
  %t53 = icmp ne i64 %t51, 0
  %t54 = zext i1 %t53 to i64
  %t52 = icmp ne i64 %t54, 0
  br i1 %t52, label %test_update_where_b4, label %test_update_where_b3
test_update_where_b3:
  %t55 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t55, i8** %reg_21_ptr
  br label %test_update_where_b4
test_update_where_b4:
  %t56 = load i8*, i8** %var_t_ptr
  store i8* %t56, i8** %reg_22_ptr
  %t57 = load i8*, i8** %reg_22_ptr
  %t58 = call i8* @obo_entity_get_boxed(i8* %t57, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t58, i8** %reg_23_ptr
  %t59 = load i8*, i8** %reg_23_ptr
  %t61 = call i8* @obo_value_as_mixed_list_ptr(i8* %t59)
  %t60 = call i8* @obo_mixed_list_get(i8* %t61, i64 1)
  store i8* %t60, i8** %reg_24_ptr
  %t62 = load i8*, i8** %reg_24_ptr
  %t63 = call i8* @obo_value_as_entity_ptr(i8* %t62)
  %t64 = call i8* @obo_entity_get_boxed(i8* %t63, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t64, i8** %reg_25_ptr
  %t65 = load i8*, i8** %reg_25_ptr
  %t67 = call i8* @obo_value_as_map_ptr(i8* %t65)
  %t66 = call i8* @obo_map_get_boxed(i8* %t67, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0))
  store i8* %t66, i8** %reg_26_ptr
  %t68 = load i8*, i8** %reg_26_ptr
  %t69 = call i64 @obo_value_as_i64(i8* %t68)
  %t70 = icmp eq i64 %t69, 80
  %t71 = zext i1 %t70 to i64
  store i64 %t71, i64* %reg_27_ptr
  %t72 = load i64, i64* %reg_27_ptr
  %t74 = icmp ne i64 %t72, 0
  %t75 = zext i1 %t74 to i64
  %t73 = icmp ne i64 %t75, 0
  br i1 %t73, label %test_update_where_b6, label %test_update_where_b5
test_update_where_b5:
  %t76 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t76, i8** %reg_28_ptr
  br label %test_update_where_b6
test_update_where_b6:
  call void @obo_gc_pop_roots(i64 25)
  ret i64 0
}

define i64 @test_delete_where() {
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
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %var_removed_ptr = alloca i64
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 1)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 2)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t15, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 3)
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = bitcast i64 (i8*, i64)* @__closure_12 to i8*
  %t21 = call i8* @obo_closure_new(i8* %t20, i64 0)
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %var_t_ptr
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i64 @Table_delete_where(i8* %t23, i8* %t24)
  store i64 %t25, i64* %reg_13_ptr
  %t26 = load i64, i64* %reg_13_ptr
  store i64 %t26, i64* %var_removed_ptr
  %t27 = load i64, i64* %var_removed_ptr
  store i64 %t27, i64* %reg_14_ptr
  %t28 = load i64, i64* %reg_14_ptr
  %t29 = icmp eq i64 %t28, 1
  %t30 = zext i1 %t29 to i64
  store i64 %t30, i64* %reg_15_ptr
  %t31 = load i64, i64* %reg_15_ptr
  %t33 = icmp ne i64 %t31, 0
  %t34 = zext i1 %t33 to i64
  %t32 = icmp ne i64 %t34, 0
  br i1 %t32, label %test_delete_where_b2, label %test_delete_where_b1
test_delete_where_b1:
  %t35 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t35, i8** %reg_16_ptr
  br label %test_delete_where_b2
test_delete_where_b2:
  %t36 = load i8*, i8** %var_t_ptr
  store i8* %t36, i8** %reg_17_ptr
  %t37 = load i8*, i8** %reg_17_ptr
  %t38 = call i8* @obo_entity_get_boxed(i8* %t37, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t38, i8** %reg_18_ptr
  %t39 = load i8*, i8** %reg_18_ptr
  %t40 = call i64 @obo_value_len(i8* %t39)
  store i64 %t40, i64* %reg_19_ptr
  %t41 = load i64, i64* %reg_19_ptr
  %t42 = icmp eq i64 %t41, 2
  %t43 = zext i1 %t42 to i64
  store i64 %t43, i64* %reg_20_ptr
  %t44 = load i64, i64* %reg_20_ptr
  %t46 = icmp ne i64 %t44, 0
  %t47 = zext i1 %t46 to i64
  %t45 = icmp ne i64 %t47, 0
  br i1 %t45, label %test_delete_where_b4, label %test_delete_where_b3
test_delete_where_b3:
  %t48 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t48, i8** %reg_21_ptr
  br label %test_delete_where_b4
test_delete_where_b4:
  call void @obo_gc_pop_roots(i64 18)
  ret i64 0
}

define i64 @test_aggregates() {
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
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i64
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i64
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i8*
  %reg_29_ptr = alloca i64
  %reg_30_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_15_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_28_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0), i64 10)
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0), i64 20)
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t15, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0), i64 30)
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %var_t_ptr
  store i8* %t20, i8** %reg_11_ptr
  %t21 = load i8*, i8** %reg_11_ptr
  %t22 = call i8* @obo_entity_get_boxed(i8* %t21, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  %t24 = call i64 @sum_of(i8* %t23, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0))
  store i64 %t24, i64* %reg_13_ptr
  %t25 = load i64, i64* %reg_13_ptr
  %t26 = icmp eq i64 %t25, 60
  %t27 = zext i1 %t26 to i64
  store i64 %t27, i64* %reg_14_ptr
  %t28 = load i64, i64* %reg_14_ptr
  %t30 = icmp ne i64 %t28, 0
  %t31 = zext i1 %t30 to i64
  %t29 = icmp ne i64 %t31, 0
  br i1 %t29, label %test_aggregates_b2, label %test_aggregates_b1
test_aggregates_b1:
  %t32 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t32, i8** %reg_15_ptr
  br label %test_aggregates_b2
test_aggregates_b2:
  %t33 = load i8*, i8** %var_t_ptr
  store i8* %t33, i8** %reg_16_ptr
  %t34 = load i8*, i8** %reg_16_ptr
  %t35 = call i8* @obo_entity_get_boxed(i8* %t34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t35, i8** %reg_17_ptr
  %t36 = load i8*, i8** %reg_17_ptr
  %t37 = call i64 @avg_of(i8* %t36, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0))
  store i64 %t37, i64* %reg_18_ptr
  %t38 = load i64, i64* %reg_18_ptr
  %t39 = icmp eq i64 %t38, 20
  %t40 = zext i1 %t39 to i64
  store i64 %t40, i64* %reg_19_ptr
  %t41 = load i64, i64* %reg_19_ptr
  %t43 = icmp ne i64 %t41, 0
  %t44 = zext i1 %t43 to i64
  %t42 = icmp ne i64 %t44, 0
  br i1 %t42, label %test_aggregates_b4, label %test_aggregates_b3
test_aggregates_b3:
  %t45 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t45, i8** %reg_20_ptr
  br label %test_aggregates_b4
test_aggregates_b4:
  %t46 = load i8*, i8** %var_t_ptr
  store i8* %t46, i8** %reg_21_ptr
  %t47 = load i8*, i8** %reg_21_ptr
  %t48 = call i8* @obo_entity_get_boxed(i8* %t47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t48, i8** %reg_22_ptr
  %t49 = load i8*, i8** %reg_22_ptr
  %t50 = call i8* @min_of(i8* %t49, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0))
  store i8* %t50, i8** %reg_23_ptr
  %t51 = load i8*, i8** %reg_23_ptr
  %t52 = call i64 @obo_value_as_i64(i8* %t51)
  %t53 = icmp eq i64 %t52, 10
  %t54 = zext i1 %t53 to i64
  store i64 %t54, i64* %reg_24_ptr
  %t55 = load i64, i64* %reg_24_ptr
  %t57 = icmp ne i64 %t55, 0
  %t58 = zext i1 %t57 to i64
  %t56 = icmp ne i64 %t58, 0
  br i1 %t56, label %test_aggregates_b6, label %test_aggregates_b5
test_aggregates_b5:
  %t59 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t59, i8** %reg_25_ptr
  br label %test_aggregates_b6
test_aggregates_b6:
  %t60 = load i8*, i8** %var_t_ptr
  store i8* %t60, i8** %reg_26_ptr
  %t61 = load i8*, i8** %reg_26_ptr
  %t62 = call i8* @obo_entity_get_boxed(i8* %t61, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t62, i8** %reg_27_ptr
  %t63 = load i8*, i8** %reg_27_ptr
  %t64 = call i8* @max_of(i8* %t63, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.122, i64 0, i64 0))
  store i8* %t64, i8** %reg_28_ptr
  %t65 = load i8*, i8** %reg_28_ptr
  %t66 = call i64 @obo_value_as_i64(i8* %t65)
  %t67 = icmp eq i64 %t66, 30
  %t68 = zext i1 %t67 to i64
  store i64 %t68, i64* %reg_29_ptr
  %t69 = load i64, i64* %reg_29_ptr
  %t71 = icmp ne i64 %t69, 0
  %t72 = zext i1 %t71 to i64
  %t70 = icmp ne i64 %t72, 0
  br i1 %t70, label %test_aggregates_b8, label %test_aggregates_b7
test_aggregates_b7:
  %t73 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t73, i8** %reg_30_ptr
  br label %test_aggregates_b8
test_aggregates_b8:
  call void @obo_gc_pop_roots(i64 26)
  ret i64 0
}

define i64 @test_find_first() {
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
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i8*
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i64
  %reg_27_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_found_ptr = alloca i8*
  %var_missing_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_17_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_found_ptr)
  call void @obo_gc_push_root(i8** %var_missing_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 1)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  store i8* %t0, i8** %reg_0_ptr
  %t2 = load i8*, i8** %reg_0_ptr
  %t3 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t2)
  store i8* %t3, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_t_ptr
  %t5 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0))
  store i8* %t5, i8** %reg_2_ptr
  %t6 = load i8*, i8** %var_t_ptr
  store i8* %t6, i8** %reg_3_ptr
  %t7 = load i8*, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  %t9 = call i8* @Table_insert(i8* %t7, i8* %t8)
  store i8* %t9, i8** %reg_4_ptr
  %t10 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.123, i64 0, i64 0))
  store i8* %t10, i8** %reg_5_ptr
  %t11 = load i8*, i8** %var_t_ptr
  store i8* %t11, i8** %reg_6_ptr
  %t12 = load i8*, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_5_ptr
  %t14 = call i8* @Table_insert(i8* %t12, i8* %t13)
  store i8* %t14, i8** %reg_7_ptr
  %t15 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t15, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.124, i64 0, i64 0))
  store i8* %t15, i8** %reg_8_ptr
  %t16 = load i8*, i8** %var_t_ptr
  store i8* %t16, i8** %reg_9_ptr
  %t17 = load i8*, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_8_ptr
  %t19 = call i8* @Table_insert(i8* %t17, i8* %t18)
  store i8* %t19, i8** %reg_10_ptr
  %t20 = bitcast i64 (i8*, i64)* @__closure_13 to i8*
  %t21 = call i8* @obo_closure_new(i8* %t20, i64 0)
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %var_t_ptr
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @Table_find_first(i8* %t23, i8* %t24)
  store i8* %t25, i8** %reg_13_ptr
  %t26 = load i8*, i8** %reg_13_ptr
  store i8* %t26, i8** %var_found_ptr
  %t27 = load i8*, i8** %var_found_ptr
  store i8* %t27, i8** %reg_14_ptr
  %t28 = load i8*, i8** %reg_14_ptr
  %t29 = call i8* @obo_box_null()
  %t30 = call i64 @obo_value_compare(i8* %t28, i8* %t29)
  %t31 = icmp ne i64 %t30, 0
  %t32 = zext i1 %t31 to i64
  store i64 %t32, i64* %reg_15_ptr
  %t33 = load i64, i64* %reg_15_ptr
  %t35 = icmp ne i64 %t33, 0
  %t36 = zext i1 %t35 to i64
  %t34 = icmp ne i64 %t36, 0
  br i1 %t34, label %test_find_first_b2, label %test_find_first_b1
test_find_first_b1:
  %t37 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t37, i8** %reg_16_ptr
  br label %test_find_first_b2
test_find_first_b2:
  %t38 = load i8*, i8** %var_found_ptr
  store i8* %t38, i8** %reg_17_ptr
  %t39 = load i8*, i8** %reg_17_ptr
  %t40 = call i8* @obo_value_as_entity_ptr(i8* %t39)
  %t41 = call i8* @obo_entity_get_boxed(i8* %t40, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t41, i8** %reg_18_ptr
  %t42 = load i8*, i8** %reg_18_ptr
  %t44 = call i8* @obo_value_as_map_ptr(i8* %t42)
  %t43 = call i8* @obo_map_get_boxed(i8* %t44, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t43, i8** %reg_19_ptr
  %t45 = load i8*, i8** %reg_19_ptr
  %t46 = call i8* @obo_value_to_str(i8* %t45)
  %t47 = call i32 @strcmp(i8* %t46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.123, i64 0, i64 0))
  %t48 = icmp eq i32 %t47, 0
  %t49 = zext i1 %t48 to i64
  store i64 %t49, i64* %reg_20_ptr
  %t50 = load i64, i64* %reg_20_ptr
  %t52 = icmp ne i64 %t50, 0
  %t53 = zext i1 %t52 to i64
  %t51 = icmp ne i64 %t53, 0
  br i1 %t51, label %test_find_first_b4, label %test_find_first_b3
test_find_first_b3:
  %t54 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t54, i8** %reg_21_ptr
  br label %test_find_first_b4
test_find_first_b4:
  %t55 = bitcast i64 (i8*, i64)* @__closure_14 to i8*
  %t56 = call i8* @obo_closure_new(i8* %t55, i64 0)
  store i8* %t56, i8** %reg_22_ptr
  %t57 = load i8*, i8** %var_t_ptr
  store i8* %t57, i8** %reg_23_ptr
  %t58 = load i8*, i8** %reg_23_ptr
  %t59 = load i8*, i8** %reg_22_ptr
  %t60 = call i8* @Table_find_first(i8* %t58, i8* %t59)
  store i8* %t60, i8** %reg_24_ptr
  %t61 = load i8*, i8** %reg_24_ptr
  store i8* %t61, i8** %var_missing_ptr
  %t62 = load i8*, i8** %var_missing_ptr
  store i8* %t62, i8** %reg_25_ptr
  %t63 = load i8*, i8** %reg_25_ptr
  %t64 = call i8* @obo_box_null()
  %t65 = call i64 @obo_value_compare(i8* %t63, i8* %t64)
  %t66 = icmp eq i64 %t65, 0
  %t67 = zext i1 %t66 to i64
  store i64 %t67, i64* %reg_26_ptr
  %t68 = load i64, i64* %reg_26_ptr
  %t70 = icmp ne i64 %t68, 0
  %t71 = zext i1 %t70 to i64
  %t69 = icmp ne i64 %t71, 0
  br i1 %t69, label %test_find_first_b6, label %test_find_first_b5
test_find_first_b5:
  %t72 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t72, i8** %reg_27_ptr
  br label %test_find_first_b6
test_find_first_b6:
  call void @obo_gc_pop_roots(i64 28)
  ret i64 0
}

define i64 @test_chained_query() {
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
  %reg_20_ptr = alloca i64
  %reg_21_ptr = alloca i64
  %reg_22_ptr = alloca i8*
  %reg_23_ptr = alloca i8*
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i8*
  %reg_33_ptr = alloca i8*
  %reg_34_ptr = alloca i8*
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i8*
  %var_result_ptr = alloca i8*
  %var_t_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_22_ptr)
  call void @obo_gc_push_root(i8** %reg_23_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %reg_30_ptr)
  call void @obo_gc_push_root(i8** %reg_31_ptr)
  call void @obo_gc_push_root(i8** %reg_32_ptr)
  call void @obo_gc_push_root(i8** %reg_33_ptr)
  call void @obo_gc_push_root(i8** %reg_34_ptr)
  call void @obo_gc_push_root(i8** %reg_36_ptr)
  call void @obo_gc_push_root(i8** %var_result_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 2)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 1, i8* %t2)
  store i8* %t0, i8** %reg_0_ptr
  %t3 = load i8*, i8** %reg_0_ptr
  %t4 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t3)
  store i8* %t4, i8** %reg_1_ptr
  %t5 = load i8*, i8** %reg_1_ptr
  store i8* %t5, i8** %var_t_ptr
  %t6 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t6, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t6, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 3)
  store i8* %t6, i8** %reg_2_ptr
  %t7 = load i8*, i8** %var_t_ptr
  store i8* %t7, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_3_ptr
  %t9 = load i8*, i8** %reg_2_ptr
  %t10 = call i8* @Table_insert(i8* %t8, i8* %t9)
  store i8* %t10, i8** %reg_4_ptr
  %t11 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 1)
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %var_t_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @Table_insert(i8* %t13, i8* %t14)
  store i8* %t15, i8** %reg_7_ptr
  %t16 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 2)
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %var_t_ptr
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  %t19 = load i8*, i8** %reg_8_ptr
  %t20 = call i8* @Table_insert(i8* %t18, i8* %t19)
  store i8* %t20, i8** %reg_10_ptr
  %t21 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t21, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.115, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t21, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 4)
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %var_t_ptr
  store i8* %t22, i8** %reg_12_ptr
  %t23 = load i8*, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_11_ptr
  %t25 = call i8* @Table_insert(i8* %t23, i8* %t24)
  store i8* %t25, i8** %reg_13_ptr
  %t26 = bitcast i64 (i8*, i64)* @__closure_15 to i8*
  %t27 = call i8* @obo_closure_new(i8* %t26, i64 0)
  store i8* %t27, i8** %reg_14_ptr
  %t28 = load i8*, i8** %var_t_ptr
  store i8* %t28, i8** %reg_15_ptr
  %t29 = load i8*, i8** %reg_15_ptr
  %t30 = load i8*, i8** %reg_14_ptr
  %t31 = call i8* @Table_where(i8* %t29, i8* %t30)
  store i8* %t31, i8** %reg_16_ptr
  %t32 = load i8*, i8** %reg_16_ptr
  %t33 = call i8* @Table_order_by(i8* %t32, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0), i64 1)
  store i8* %t33, i8** %reg_17_ptr
  %t34 = load i8*, i8** %reg_17_ptr
  store i8* %t34, i8** %var_result_ptr
  %t35 = load i8*, i8** %var_result_ptr
  store i8* %t35, i8** %reg_18_ptr
  %t36 = load i8*, i8** %reg_18_ptr
  %t37 = call i8* @obo_entity_get_boxed(i8* %t36, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t37, i8** %reg_19_ptr
  %t38 = load i8*, i8** %reg_19_ptr
  %t39 = call i64 @obo_value_len(i8* %t38)
  store i64 %t39, i64* %reg_20_ptr
  %t40 = load i64, i64* %reg_20_ptr
  %t41 = icmp eq i64 %t40, 2
  %t42 = zext i1 %t41 to i64
  store i64 %t42, i64* %reg_21_ptr
  %t43 = load i64, i64* %reg_21_ptr
  %t45 = icmp ne i64 %t43, 0
  %t46 = zext i1 %t45 to i64
  %t44 = icmp ne i64 %t46, 0
  br i1 %t44, label %test_chained_query_b2, label %test_chained_query_b1
test_chained_query_b1:
  %t47 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t47, i8** %reg_22_ptr
  br label %test_chained_query_b2
test_chained_query_b2:
  %t48 = load i8*, i8** %var_result_ptr
  store i8* %t48, i8** %reg_23_ptr
  %t49 = load i8*, i8** %reg_23_ptr
  %t50 = call i8* @obo_entity_get_boxed(i8* %t49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t50, i8** %reg_24_ptr
  %t51 = load i8*, i8** %reg_24_ptr
  %t53 = call i8* @obo_value_as_mixed_list_ptr(i8* %t51)
  %t52 = call i8* @obo_mixed_list_get(i8* %t53, i64 0)
  store i8* %t52, i8** %reg_25_ptr
  %t54 = load i8*, i8** %reg_25_ptr
  %t55 = call i8* @obo_value_as_entity_ptr(i8* %t54)
  %t56 = call i8* @obo_entity_get_boxed(i8* %t55, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t56, i8** %reg_26_ptr
  %t57 = load i8*, i8** %reg_26_ptr
  %t59 = call i8* @obo_value_as_map_ptr(i8* %t57)
  %t58 = call i8* @obo_map_get_boxed(i8* %t59, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0))
  store i8* %t58, i8** %reg_27_ptr
  %t60 = load i8*, i8** %reg_27_ptr
  %t61 = call i64 @obo_value_as_i64(i8* %t60)
  %t62 = icmp eq i64 %t61, 2
  %t63 = zext i1 %t62 to i64
  store i64 %t63, i64* %reg_28_ptr
  %t64 = load i64, i64* %reg_28_ptr
  %t66 = icmp ne i64 %t64, 0
  %t67 = zext i1 %t66 to i64
  %t65 = icmp ne i64 %t67, 0
  br i1 %t65, label %test_chained_query_b4, label %test_chained_query_b3
test_chained_query_b3:
  %t68 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t68, i8** %reg_29_ptr
  br label %test_chained_query_b4
test_chained_query_b4:
  %t69 = load i8*, i8** %var_result_ptr
  store i8* %t69, i8** %reg_30_ptr
  %t70 = load i8*, i8** %reg_30_ptr
  %t71 = call i8* @obo_entity_get_boxed(i8* %t70, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t71, i8** %reg_31_ptr
  %t72 = load i8*, i8** %reg_31_ptr
  %t74 = call i8* @obo_value_as_mixed_list_ptr(i8* %t72)
  %t73 = call i8* @obo_mixed_list_get(i8* %t74, i64 1)
  store i8* %t73, i8** %reg_32_ptr
  %t75 = load i8*, i8** %reg_32_ptr
  %t76 = call i8* @obo_value_as_entity_ptr(i8* %t75)
  %t77 = call i8* @obo_entity_get_boxed(i8* %t76, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t77, i8** %reg_33_ptr
  %t78 = load i8*, i8** %reg_33_ptr
  %t80 = call i8* @obo_value_as_map_ptr(i8* %t78)
  %t79 = call i8* @obo_map_get_boxed(i8* %t80, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0))
  store i8* %t79, i8** %reg_34_ptr
  %t81 = load i8*, i8** %reg_34_ptr
  %t82 = call i64 @obo_value_as_i64(i8* %t81)
  %t83 = icmp eq i64 %t82, 3
  %t84 = zext i1 %t83 to i64
  store i64 %t84, i64* %reg_35_ptr
  %t85 = load i64, i64* %reg_35_ptr
  %t87 = icmp ne i64 %t85, 0
  %t88 = zext i1 %t87 to i64
  %t86 = icmp ne i64 %t88, 0
  br i1 %t86, label %test_chained_query_b6, label %test_chained_query_b5
test_chained_query_b5:
  %t89 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t89, i8** %reg_36_ptr
  br label %test_chained_query_b6
test_chained_query_b6:
  call void @obo_gc_pop_roots(i64 35)
  ret i64 0
}

define i64 @test_group_by() {
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
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i64
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %var_groups_ptr = alloca i8*
  %var_t_ptr = alloca i8*
  %var_keys_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_19_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %reg_25_ptr)
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_29_ptr)
  call void @obo_gc_push_root(i8** %var_groups_ptr)
  call void @obo_gc_push_root(i8** %var_t_ptr)
  call void @obo_gc_push_root(i8** %var_keys_ptr)
  %t0 = call i8* @obo_mixed_list_new(i64 2)
  %t1 = call i8* @obo_box_str(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.126, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 0, i8* %t1)
  %t2 = call i8* @obo_box_str(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.127, i64 0, i64 0))
  call void @obo_mixed_list_set(i8* %t0, i64 1, i8* %t2)
  store i8* %t0, i8** %reg_0_ptr
  %t3 = load i8*, i8** %reg_0_ptr
  %t4 = call i8* @Table_create(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.116, i64 0, i64 0), i8* %t3)
  store i8* %t4, i8** %reg_1_ptr
  %t5 = load i8*, i8** %reg_1_ptr
  store i8* %t5, i8** %var_t_ptr
  %t6 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.126, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.128, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t6, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.127, i64 0, i64 0), i64 100)
  store i8* %t6, i8** %reg_2_ptr
  %t7 = load i8*, i8** %var_t_ptr
  store i8* %t7, i8** %reg_3_ptr
  %t8 = load i8*, i8** %reg_3_ptr
  %t9 = load i8*, i8** %reg_2_ptr
  %t10 = call i8* @Table_insert(i8* %t8, i8* %t9)
  store i8* %t10, i8** %reg_4_ptr
  %t11 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t11, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.126, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.129, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.127, i64 0, i64 0), i64 200)
  store i8* %t11, i8** %reg_5_ptr
  %t12 = load i8*, i8** %var_t_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i8*, i8** %reg_6_ptr
  %t14 = load i8*, i8** %reg_5_ptr
  %t15 = call i8* @Table_insert(i8* %t13, i8* %t14)
  store i8* %t15, i8** %reg_7_ptr
  %t16 = call i8* @obo_map_new()
  call void @obo_map_put_str(i8* %t16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.126, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.128, i64 0, i64 0))
  call void @obo_map_put_i64(i8* %t16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.127, i64 0, i64 0), i64 300)
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %var_t_ptr
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  %t19 = load i8*, i8** %reg_8_ptr
  %t20 = call i8* @Table_insert(i8* %t18, i8* %t19)
  store i8* %t20, i8** %reg_10_ptr
  %t21 = load i8*, i8** %var_t_ptr
  store i8* %t21, i8** %reg_11_ptr
  %t22 = load i8*, i8** %reg_11_ptr
  %t23 = call i8* @obo_entity_get_boxed(i8* %t22, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.134, i64 0, i64 0))
  store i8* %t23, i8** %reg_12_ptr
  %t24 = load i8*, i8** %reg_12_ptr
  %t25 = call i8* @group_by(i8* %t24, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.126, i64 0, i64 0))
  store i8* %t25, i8** %reg_13_ptr
  %t26 = load i8*, i8** %reg_13_ptr
  %t27 = call i8* @obo_mixed_list_get(i8* %t26, i64 0)
  store i8* %t27, i8** %reg_14_ptr
  %t28 = load i8*, i8** %reg_14_ptr
  store i8* %t28, i8** %var_groups_ptr
  %t29 = load i8*, i8** %reg_13_ptr
  %t30 = call i8* @obo_mixed_list_get(i8* %t29, i64 1)
  store i8* %t30, i8** %reg_15_ptr
  %t31 = load i8*, i8** %reg_15_ptr
  store i8* %t31, i8** %var_keys_ptr
  %t32 = load i8*, i8** %var_keys_ptr
  store i8* %t32, i8** %reg_16_ptr
  %t33 = load i8*, i8** %reg_16_ptr
  %t34 = call i64 @obo_value_len(i8* %t33)
  store i64 %t34, i64* %reg_17_ptr
  %t35 = load i64, i64* %reg_17_ptr
  %t36 = icmp eq i64 %t35, 2
  %t37 = zext i1 %t36 to i64
  store i64 %t37, i64* %reg_18_ptr
  %t38 = load i64, i64* %reg_18_ptr
  %t40 = icmp ne i64 %t38, 0
  %t41 = zext i1 %t40 to i64
  %t39 = icmp ne i64 %t41, 0
  br i1 %t39, label %test_group_by_b2, label %test_group_by_b1
test_group_by_b1:
  %t42 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t42, i8** %reg_19_ptr
  br label %test_group_by_b2
test_group_by_b2:
  %t43 = load i8*, i8** %var_groups_ptr
  store i8* %t43, i8** %reg_20_ptr
  %t44 = load i8*, i8** %reg_20_ptr
  %t46 = call i8* @obo_value_as_map_ptr(i8* %t44)
  %t45 = call i8* @obo_map_get_boxed(i8* %t46, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.128, i64 0, i64 0))
  store i8* %t45, i8** %reg_21_ptr
  %t47 = load i8*, i8** %reg_21_ptr
  %t48 = call i64 @obo_value_len(i8* %t47)
  store i64 %t48, i64* %reg_22_ptr
  %t49 = load i64, i64* %reg_22_ptr
  %t50 = icmp eq i64 %t49, 2
  %t51 = zext i1 %t50 to i64
  store i64 %t51, i64* %reg_23_ptr
  %t52 = load i64, i64* %reg_23_ptr
  %t54 = icmp ne i64 %t52, 0
  %t55 = zext i1 %t54 to i64
  %t53 = icmp ne i64 %t55, 0
  br i1 %t53, label %test_group_by_b4, label %test_group_by_b3
test_group_by_b3:
  %t56 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t56, i8** %reg_24_ptr
  br label %test_group_by_b4
test_group_by_b4:
  %t57 = load i8*, i8** %var_groups_ptr
  store i8* %t57, i8** %reg_25_ptr
  %t58 = load i8*, i8** %reg_25_ptr
  %t60 = call i8* @obo_value_as_map_ptr(i8* %t58)
  %t59 = call i8* @obo_map_get_boxed(i8* %t60, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.129, i64 0, i64 0))
  store i8* %t59, i8** %reg_26_ptr
  %t61 = load i8*, i8** %reg_26_ptr
  %t62 = call i64 @obo_value_len(i8* %t61)
  store i64 %t62, i64* %reg_27_ptr
  %t63 = load i64, i64* %reg_27_ptr
  %t64 = icmp eq i64 %t63, 1
  %t65 = zext i1 %t64 to i64
  store i64 %t65, i64* %reg_28_ptr
  %t66 = load i64, i64* %reg_28_ptr
  %t68 = icmp ne i64 %t66, 0
  %t69 = zext i1 %t68 to i64
  %t67 = icmp ne i64 %t69, 0
  br i1 %t67, label %test_group_by_b6, label %test_group_by_b5
test_group_by_b5:
  %t70 = call i8* @obo_assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.117, i64 0, i64 0))
  store i8* %t70, i8** %reg_29_ptr
  br label %test_group_by_b6
test_group_by_b6:
  call void @obo_gc_pop_roots(i64 27)
  ret i64 0
}

define i64 @__closure_0(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp sgt i64 %t10, 90000
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.54, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_4(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i64
  %var_r_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_average_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %reg_3_ptr)
  call void @obo_gc_push_root(i8** %reg_5_ptr)
  call void @obo_gc_push_root(i8** %reg_6_ptr)
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
  store i64 %t5, i64* %var_average_ptr
  %t6 = load i64, i64* %var_r_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i8*
  %t9 = call i8* @obo_entity_get_boxed(i8* %t8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t9, i8** %reg_5_ptr
  %t10 = load i8*, i8** %reg_5_ptr
  %t12 = call i8* @obo_value_as_map_ptr(i8* %t10)
  %t11 = call i8* @obo_map_get_boxed(i8* %t12, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t11, i8** %reg_6_ptr
  %t13 = load i64, i64* %var_average_ptr
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i8*, i8** %reg_6_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = call i64 @obo_value_as_i64(i8* %t14)
  %t17 = icmp sgt i64 %t16, %t15
  %t18 = zext i1 %t17 to i64
  store i64 %t18, i64* %reg_8_ptr
  %t19 = load i64, i64* %reg_8_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret i64 %t19
}

define i64 @__closure_5(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_6(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_map_get_boxed(i8* %t4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i64, i64* %var_d_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %reg_4_ptr
  %t8 = inttoptr i64 %t7 to i8*
  %t9 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0))
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
  call void @obo_map_put_i64(i8* %t20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @obo.str.32, i64 0, i64 0), i64 %t19)
  %t21 = load i64, i64* %var_d_ptr
  store i64 %t21, i64* %reg_9_ptr
  %t22 = load i64, i64* %reg_9_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t22
}

define i64 @__closure_7(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @obo.str.31, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.43, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_8(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.33, i64 0, i64 0))
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

define i64 @__closure_9(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.118, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp sgt i64 %t10, 15
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t13
}

define i64 @__closure_10(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp slt i64 %t10, 60
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t13
}

define i64 @__closure_11(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_d_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_0_ptr)
  call void @obo_gc_push_root(i8** %var___closure_self_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_d_ptr
  %t2 = load i64, i64* %var_d_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = inttoptr i64 %t3 to i8*
  call void @obo_map_put_i64(i8* %t4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.120, i64 0, i64 0), i64 100)
  %t5 = load i64, i64* %var_d_ptr
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  call void @obo_gc_pop_roots(i64 2)
  ret i64 %t6
}

define i64 @__closure_12(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.121, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i64 @obo_value_as_i64(i8* %t9)
  %t11 = icmp eq i64 %t10, 2
  %t12 = zext i1 %t11 to i64
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t13
}

define i64 @__closure_13(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.123, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_14(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.30, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.130, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

define i64 @__closure_15(i8* %arg0, i64 %arg1) {
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
  %t5 = call i8* @obo_entity_get_boxed(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.132, i64 0, i64 0))
  store i8* %t5, i8** %reg_3_ptr
  %t6 = load i8*, i8** %reg_3_ptr
  %t8 = call i8* @obo_value_as_map_ptr(i8* %t6)
  %t7 = call i8* @obo_map_get_boxed(i8* %t8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.125, i64 0, i64 0))
  store i8* %t7, i8** %reg_4_ptr
  %t9 = load i8*, i8** %reg_4_ptr
  %t10 = call i8* @obo_value_to_str(i8* %t9)
  %t11 = call i32 @strcmp(i8* %t10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.114, i64 0, i64 0))
  %t12 = icmp eq i32 %t11, 0
  %t13 = zext i1 %t12 to i64
  store i64 %t13, i64* %reg_5_ptr
  %t14 = load i64, i64* %reg_5_ptr
  call void @obo_gc_pop_roots(i64 4)
  ret i64 %t14
}

