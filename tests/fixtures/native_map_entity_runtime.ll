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
declare i8* @obo_value_as_list_ptr(i8*)
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
declare i8* @obo_box_i64(i64)
declare i8* @obo_box_f64(double)
declare i8* @obo_box_str(i8*)
declare i8* @obo_box_bool(i64)
declare i8* @obo_box_null()
declare double @obo_value_as_f64(i8*)
declare i8* @obo_value_as_str(i8*)
declare i8* @obo_value_to_str(i8*)
declare i8* @obo_format_list_string(i8*)
declare i8* @obo_format_map_string(i8*)
declare i8* @obo_format_entity_string(i8*)

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.fmt.task = private unnamed_addr constant [8 x i8] c"<task>\0A\00"

attributes #0 = { returns_twice }

@obo.str.0 = private unnamed_addr constant [5 x i8] c"seen\00"
@obo.str.1 = private unnamed_addr constant [4 x i8] c"kid\00"
@obo.str.2 = private unnamed_addr constant [6 x i8] c"count\00"
@obo.str.3 = private unnamed_addr constant [6 x i8] c"ready\00"
@obo.str.4 = private unnamed_addr constant [6 x i8] c"hello\00"
@obo.str.5 = private unnamed_addr constant [6 x i8] c"items\00"
@obo.str.6 = private unnamed_addr constant [6 x i8] c"score\00"
@obo.str.7 = private unnamed_addr constant [6 x i8] c"ratio\00"
@obo.str.8 = private unnamed_addr constant [8 x i8] c"message\00"
@obo.str.9 = private unnamed_addr constant [4 x i8] c"bag\00"
@obo.str.10 = private unnamed_addr constant [5 x i8] c"meta\00"
@obo.str.11 = private unnamed_addr constant [6 x i8] c"child\00"
@obo.str.12 = private unnamed_addr constant [8 x i8] c"nothing\00"
@obo.str.13 = private unnamed_addr constant [4 x i8] c"set\00"
@obo.str.14 = private unnamed_addr constant [6 x i8] c"bonus\00"
@obo.str.15 = private unnamed_addr constant [5 x i8] c"info\00"
@obo.str.16 = private unnamed_addr constant [14 x i8] c"payload ready\00"
@obo.str.17 = private unnamed_addr constant [17 x i8] c"payload message=\00"
@obo.str.18 = private unnamed_addr constant [15 x i8] c"payload child=\00"
@obo.str.19 = private unnamed_addr constant [14 x i8] c"payload meta=\00"
@obo.str.20 = private unnamed_addr constant [17 x i8] c"payload nothing=\00"
@obo.str.21 = private unnamed_addr constant [4 x i8] c"get\00"
@obo.str.22 = private unnamed_addr constant [12 x i8] c"stash ready\00"
@obo.str.23 = private unnamed_addr constant [15 x i8] c"stash message=\00"
@obo.str.24 = private unnamed_addr constant [12 x i8] c"stash info=\00"
@obo.str.25 = private unnamed_addr constant [13 x i8] c"stash child=\00"
@obo.str.26 = private unnamed_addr constant [13 x i8] c"stash items=\00"
@obo.str.27 = private unnamed_addr constant [15 x i8] c"stash nothing=\00"
@obo.str.28 = private unnamed_addr constant [8 x i8] c"Payload\00"

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
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i8*
  %reg_28_ptr = alloca double
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
  %reg_48_ptr = alloca double
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
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca i8*
  %reg_64_ptr = alloca i8*
  %reg_65_ptr = alloca i8*
  %reg_66_ptr = alloca i8*
  %reg_67_ptr = alloca i64
  %var_stash_ptr = alloca i8*
  %var_child_ptr = alloca i8*
  %var_payload_ptr = alloca i8*
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
  call void @obo_gc_push_root(i8** %reg_26_ptr)
  call void @obo_gc_push_root(i8** %reg_27_ptr)
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
  call void @obo_gc_push_root(i8** %reg_62_ptr)
  call void @obo_gc_push_root(i8** %reg_63_ptr)
  call void @obo_gc_push_root(i8** %reg_64_ptr)
  call void @obo_gc_push_root(i8** %reg_65_ptr)
  call void @obo_gc_push_root(i8** %reg_66_ptr)
  call void @obo_gc_push_root(i8** %var_stash_ptr)
  call void @obo_gc_push_root(i8** %var_child_ptr)
  call void @obo_gc_push_root(i8** %var_payload_ptr)
  %t0 = alloca [1 x i64]
  %t1 = getelementptr inbounds [1 x i64], [1 x i64]* %t0, i64 0, i64 0
  store i64 1, i64* %t1
  %t2 = getelementptr inbounds [1 x i64], [1 x i64]* %t0, i64 0, i64 0
  %t3 = call i8* @obo_list_new_i64(i64 1, i64* %t2)
  store i8* %t3, i8** %reg_0_ptr
  %t4 = call i8* @obo_map_new()
  call void @obo_map_put_bool(i8* %t4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.0, i64 0, i64 0), i64 1)
  store i8* %t4, i8** %reg_1_ptr
  %t5 = call i8* @obo_entity_new(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.28, i64 0, i64 0))
  call void @obo_entity_put_i64(i8* %t5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0), i64 1)
  call void @obo_entity_put_f64(i8* %t5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0), double 0x3FE0000000000000)
  call void @obo_entity_put_bool(i8* %t5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0), i64 0)
  call void @obo_entity_put_str(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_put_null(i8* %t5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.11, i64 0, i64 0))
  %t6 = load i8*, i8** %reg_0_ptr
  call void @obo_entity_put_list(i8* %t5, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0), i8* %t6)
  %t7 = load i8*, i8** %reg_1_ptr
  call void @obo_entity_put_map(i8* %t5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.10, i64 0, i64 0), i8* %t7)
  call void @obo_entity_put_null(i8* %t5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t5, i8** %reg_2_ptr
  %t8 = load i8*, i8** %reg_2_ptr
  store i8* %t8, i8** %var_child_ptr
  %t9 = load i8*, i8** %var_child_ptr
  store i8* %t9, i8** %reg_3_ptr
  %t10 = alloca [3 x i64]
  %t11 = getelementptr inbounds [3 x i64], [3 x i64]* %t10, i64 0, i64 0
  store i64 1, i64* %t11
  %t12 = getelementptr inbounds [3 x i64], [3 x i64]* %t10, i64 0, i64 1
  store i64 2, i64* %t12
  %t13 = getelementptr inbounds [3 x i64], [3 x i64]* %t10, i64 0, i64 2
  store i64 3, i64* %t13
  %t14 = getelementptr inbounds [3 x i64], [3 x i64]* %t10, i64 0, i64 0
  %t15 = call i8* @obo_list_new_i64(i64 3, i64* %t14)
  store i8* %t15, i8** %reg_4_ptr
  %t16 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.2, i64 0, i64 0), i64 2)
  call void @obo_map_put_bool(i8* %t16, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0), i64 1)
  store i8* %t16, i8** %reg_5_ptr
  %t17 = call i8* @obo_entity_new(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.28, i64 0, i64 0))
  call void @obo_entity_put_i64(i8* %t17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0), i64 4)
  call void @obo_entity_put_f64(i8* %t17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0), double 0x4004000000000000)
  call void @obo_entity_put_bool(i8* %t17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0), i64 1)
  call void @obo_entity_put_str(i8* %t17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.8, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.4, i64 0, i64 0))
  %t18 = load i8*, i8** %reg_3_ptr
  call void @obo_entity_put_entity(i8* %t17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.11, i64 0, i64 0), i8* %t18)
  %t19 = load i8*, i8** %reg_4_ptr
  call void @obo_entity_put_list(i8* %t17, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0), i8* %t19)
  %t20 = load i8*, i8** %reg_5_ptr
  call void @obo_entity_put_map(i8* %t17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.10, i64 0, i64 0), i8* %t20)
  call void @obo_entity_put_null(i8* %t17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t17, i8** %reg_6_ptr
  %t21 = load i8*, i8** %reg_6_ptr
  store i8* %t21, i8** %var_payload_ptr
  %t22 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t22, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0), i64 3)
  store i8* %t22, i8** %reg_7_ptr
  %t23 = load i8*, i8** %var_child_ptr
  store i8* %t23, i8** %reg_8_ptr
  %t24 = alloca [2 x i64]
  %t25 = getelementptr inbounds [2 x i64], [2 x i64]* %t24, i64 0, i64 0
  store i64 8, i64* %t25
  %t26 = getelementptr inbounds [2 x i64], [2 x i64]* %t24, i64 0, i64 1
  store i64 9, i64* %t26
  %t27 = getelementptr inbounds [2 x i64], [2 x i64]* %t24, i64 0, i64 0
  %t28 = call i8* @obo_list_new_i64(i64 2, i64* %t27)
  store i8* %t28, i8** %reg_9_ptr
  %t29 = call i8* @obo_map_new()
  call void @obo_map_put_i64(i8* %t29, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0), i64 7)
  call void @obo_map_put_f64(i8* %t29, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0), double 0x3FF4000000000000)
  call void @obo_map_put_bool(i8* %t29, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0), i64 0)
  call void @obo_map_put_str(i8* %t29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.str.9, i64 0, i64 0))
  %t30 = load i8*, i8** %reg_7_ptr
  call void @obo_map_put_map(i8* %t29, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.10, i64 0, i64 0), i8* %t30)
  %t31 = load i8*, i8** %reg_8_ptr
  call void @obo_map_put_entity(i8* %t29, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.11, i64 0, i64 0), i8* %t31)
  %t32 = load i8*, i8** %reg_9_ptr
  call void @obo_map_put_list(i8* %t29, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0), i8* %t32)
  call void @obo_map_put_null(i8* %t29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t29, i8** %reg_10_ptr
  %t33 = load i8*, i8** %reg_10_ptr
  store i8* %t33, i8** %var_stash_ptr
  %t34 = load i8*, i8** %var_payload_ptr
  store i8* %t34, i8** %reg_11_ptr
  %t35 = load i8*, i8** %reg_11_ptr
  %t36 = call i8* @obo_entity_get_boxed(i8* %t35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0))
  store i8* %t36, i8** %reg_12_ptr
  %t37 = load i8*, i8** %var_stash_ptr
  store i8* %t37, i8** %reg_13_ptr
  %t38 = load i8*, i8** %reg_13_ptr
  %t39 = load i8*, i8** %reg_12_ptr
  call void @obo_map_put_boxed(i8* %t38, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.14, i64 0, i64 0), i8* %t39)
  store i8* %t38, i8** %reg_14_ptr
  %t40 = load i8*, i8** %var_payload_ptr
  store i8* %t40, i8** %reg_15_ptr
  %t41 = load i8*, i8** %reg_15_ptr
  %t42 = call i8* @obo_entity_get_boxed(i8* %t41, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t42, i8** %reg_16_ptr
  %t43 = load i8*, i8** %var_stash_ptr
  store i8* %t43, i8** %reg_17_ptr
  %t44 = load i8*, i8** %reg_17_ptr
  %t45 = load i8*, i8** %reg_16_ptr
  call void @obo_map_put_boxed(i8* %t44, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0), i8* %t45)
  store i8* %t44, i8** %reg_18_ptr
  %t46 = load i8*, i8** %var_payload_ptr
  store i8* %t46, i8** %reg_19_ptr
  %t47 = load i8*, i8** %reg_19_ptr
  %t48 = call i8* @obo_entity_get_boxed(i8* %t47, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.10, i64 0, i64 0))
  store i8* %t48, i8** %reg_20_ptr
  %t49 = load i8*, i8** %var_stash_ptr
  store i8* %t49, i8** %reg_21_ptr
  %t50 = load i8*, i8** %reg_21_ptr
  %t51 = load i8*, i8** %reg_20_ptr
  call void @obo_map_put_boxed(i8* %t50, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.15, i64 0, i64 0), i8* %t51)
  store i8* %t50, i8** %reg_22_ptr
  %t52 = load i8*, i8** %var_payload_ptr
  store i8* %t52, i8** %reg_23_ptr
  %t53 = load i8*, i8** %reg_23_ptr
  %t54 = call i8* @obo_entity_get_boxed(i8* %t53, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0))
  store i8* %t54, i8** %reg_24_ptr
  %t55 = load i8*, i8** %reg_24_ptr
  %t56 = call i64 @obo_value_as_i64(i8* %t55)
  %t57 = add i64 %t56, 2
  store i64 %t57, i64* %reg_25_ptr
  %t58 = load i64, i64* %reg_25_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t58)
  %t59 = load i8*, i8** %var_payload_ptr
  store i8* %t59, i8** %reg_26_ptr
  %t60 = load i8*, i8** %reg_26_ptr
  %t61 = call i8* @obo_entity_get_boxed(i8* %t60, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t61, i8** %reg_27_ptr
  %t62 = load i8*, i8** %reg_27_ptr
  %t63 = call double @obo_value_as_f64(i8* %t62)
  %t64 = fadd double %t63, 0x3FE0000000000000
  store double %t64, double* %reg_28_ptr
  %t65 = load double, double* %reg_28_ptr
  call void @obo_print_double(double %t65)
  %t66 = load i8*, i8** %var_payload_ptr
  store i8* %t66, i8** %reg_29_ptr
  %t67 = load i8*, i8** %reg_29_ptr
  %t68 = call i8* @obo_entity_get_boxed(i8* %t67, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t68, i8** %reg_30_ptr
  %t69 = load i8*, i8** %reg_30_ptr
  %t71 = call i64 @obo_value_truthy(i8* %t69)
  %t70 = icmp ne i64 %t71, 0
  br i1 %t70, label %main_b1, label %main_b2
main_b1:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @obo.str.16, i64 0, i64 0))
  br label %main_b3
main_b2:
  br label %main_b3
main_b3:
  %t72 = load i8*, i8** %var_payload_ptr
  store i8* %t72, i8** %reg_31_ptr
  %t73 = load i8*, i8** %reg_31_ptr
  %t74 = call i8* @obo_entity_get_boxed(i8* %t73, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.8, i64 0, i64 0))
  store i8* %t74, i8** %reg_32_ptr
  %t75 = load i8*, i8** %reg_32_ptr
  %t76 = call i8* @obo_value_to_str(i8* %t75)
  %t77 = call i8* @obo_str_concat(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.17, i64 0, i64 0), i8* %t76)
  store i8* %t77, i8** %reg_33_ptr
  %t78 = load i8*, i8** %reg_33_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t78)
  %t79 = load i8*, i8** %var_payload_ptr
  store i8* %t79, i8** %reg_34_ptr
  %t80 = load i8*, i8** %reg_34_ptr
  %t81 = call i8* @obo_entity_get_boxed(i8* %t80, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.11, i64 0, i64 0))
  store i8* %t81, i8** %reg_35_ptr
  %t82 = load i8*, i8** %reg_35_ptr
  %t83 = call i8* @obo_value_to_str(i8* %t82)
  %t84 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.18, i64 0, i64 0), i8* %t83)
  store i8* %t84, i8** %reg_36_ptr
  %t85 = load i8*, i8** %reg_36_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t85)
  %t86 = load i8*, i8** %var_payload_ptr
  store i8* %t86, i8** %reg_37_ptr
  %t87 = load i8*, i8** %reg_37_ptr
  %t88 = call i8* @obo_entity_get_boxed(i8* %t87, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.10, i64 0, i64 0))
  store i8* %t88, i8** %reg_38_ptr
  %t89 = load i8*, i8** %reg_38_ptr
  %t90 = call i8* @obo_value_to_str(i8* %t89)
  %t91 = call i8* @obo_str_concat(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @obo.str.19, i64 0, i64 0), i8* %t90)
  store i8* %t91, i8** %reg_39_ptr
  %t92 = load i8*, i8** %reg_39_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t92)
  %t93 = load i8*, i8** %var_payload_ptr
  store i8* %t93, i8** %reg_40_ptr
  %t94 = load i8*, i8** %reg_40_ptr
  %t95 = call i8* @obo_entity_get_boxed(i8* %t94, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t95, i8** %reg_41_ptr
  %t96 = load i8*, i8** %reg_41_ptr
  %t97 = call i8* @obo_value_to_str(i8* %t96)
  %t98 = call i8* @obo_str_concat(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @obo.str.20, i64 0, i64 0), i8* %t97)
  store i8* %t98, i8** %reg_42_ptr
  %t99 = load i8*, i8** %reg_42_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t99)
  %t100 = load i8*, i8** %var_stash_ptr
  store i8* %t100, i8** %reg_43_ptr
  %t101 = load i8*, i8** %reg_43_ptr
  %t102 = call i8* @obo_map_get_boxed(i8* %t101, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.6, i64 0, i64 0))
  store i8* %t102, i8** %reg_44_ptr
  %t103 = load i8*, i8** %reg_44_ptr
  %t104 = call i64 @obo_value_as_i64(i8* %t103)
  %t105 = add i64 %t104, 3
  store i64 %t105, i64* %reg_45_ptr
  %t106 = load i64, i64* %reg_45_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t106)
  %t107 = load i8*, i8** %var_stash_ptr
  store i8* %t107, i8** %reg_46_ptr
  %t108 = load i8*, i8** %reg_46_ptr
  %t109 = call i8* @obo_map_get_boxed(i8* %t108, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.7, i64 0, i64 0))
  store i8* %t109, i8** %reg_47_ptr
  %t110 = load i8*, i8** %reg_47_ptr
  %t111 = call double @obo_value_as_f64(i8* %t110)
  %t112 = fadd double %t111, 0x3FE8000000000000
  store double %t112, double* %reg_48_ptr
  %t113 = load double, double* %reg_48_ptr
  call void @obo_print_double(double %t113)
  %t114 = load i8*, i8** %var_stash_ptr
  store i8* %t114, i8** %reg_49_ptr
  %t115 = load i8*, i8** %reg_49_ptr
  %t116 = call i8* @obo_map_get_boxed(i8* %t115, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t116, i8** %reg_50_ptr
  %t117 = load i8*, i8** %reg_50_ptr
  %t119 = call i64 @obo_value_truthy(i8* %t117)
  %t118 = icmp ne i64 %t119, 0
  br i1 %t118, label %main_b4, label %main_b5
main_b4:
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.22, i64 0, i64 0))
  br label %main_b6
main_b5:
  br label %main_b6
main_b6:
  %t120 = load i8*, i8** %var_stash_ptr
  store i8* %t120, i8** %reg_51_ptr
  %t121 = load i8*, i8** %reg_51_ptr
  %t122 = call i8* @obo_map_get_boxed(i8* %t121, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.8, i64 0, i64 0))
  store i8* %t122, i8** %reg_52_ptr
  %t123 = load i8*, i8** %reg_52_ptr
  %t124 = call i8* @obo_value_to_str(i8* %t123)
  %t125 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.23, i64 0, i64 0), i8* %t124)
  store i8* %t125, i8** %reg_53_ptr
  %t126 = load i8*, i8** %reg_53_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t126)
  %t127 = load i8*, i8** %var_stash_ptr
  store i8* %t127, i8** %reg_54_ptr
  %t128 = load i8*, i8** %reg_54_ptr
  %t129 = call i8* @obo_map_get_boxed(i8* %t128, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.15, i64 0, i64 0))
  store i8* %t129, i8** %reg_55_ptr
  %t130 = load i8*, i8** %reg_55_ptr
  %t131 = call i8* @obo_value_to_str(i8* %t130)
  %t132 = call i8* @obo_str_concat(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @obo.str.24, i64 0, i64 0), i8* %t131)
  store i8* %t132, i8** %reg_56_ptr
  %t133 = load i8*, i8** %reg_56_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t133)
  %t134 = load i8*, i8** %var_stash_ptr
  store i8* %t134, i8** %reg_57_ptr
  %t135 = load i8*, i8** %reg_57_ptr
  %t136 = call i8* @obo_map_get_boxed(i8* %t135, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.11, i64 0, i64 0))
  store i8* %t136, i8** %reg_58_ptr
  %t137 = load i8*, i8** %reg_58_ptr
  %t138 = call i8* @obo_value_to_str(i8* %t137)
  %t139 = call i8* @obo_str_concat(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @obo.str.25, i64 0, i64 0), i8* %t138)
  store i8* %t139, i8** %reg_59_ptr
  %t140 = load i8*, i8** %reg_59_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t140)
  %t141 = load i8*, i8** %var_stash_ptr
  store i8* %t141, i8** %reg_60_ptr
  %t142 = load i8*, i8** %reg_60_ptr
  %t143 = call i8* @obo_map_get_boxed(i8* %t142, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.str.5, i64 0, i64 0))
  store i8* %t143, i8** %reg_61_ptr
  %t144 = load i8*, i8** %reg_61_ptr
  %t145 = call i8* @obo_value_to_str(i8* %t144)
  %t146 = call i8* @obo_str_concat(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @obo.str.26, i64 0, i64 0), i8* %t145)
  store i8* %t146, i8** %reg_62_ptr
  %t147 = load i8*, i8** %reg_62_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t147)
  %t148 = load i8*, i8** %var_stash_ptr
  store i8* %t148, i8** %reg_63_ptr
  %t149 = load i8*, i8** %reg_63_ptr
  %t150 = call i8* @obo_map_get_boxed(i8* %t149, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @obo.str.12, i64 0, i64 0))
  store i8* %t150, i8** %reg_64_ptr
  %t151 = load i8*, i8** %reg_64_ptr
  %t152 = call i8* @obo_value_to_str(i8* %t151)
  %t153 = call i8* @obo_str_concat(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @obo.str.27, i64 0, i64 0), i8* %t152)
  store i8* %t153, i8** %reg_65_ptr
  %t154 = load i8*, i8** %reg_65_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t154)
  %t155 = load i8*, i8** %var_stash_ptr
  store i8* %t155, i8** %reg_66_ptr
  %t156 = load i8*, i8** %reg_66_ptr
  %t157 = call i64 @obo_map_len(i8* %t156)
  store i64 %t157, i64* %reg_67_ptr
  %t158 = load i64, i64* %reg_67_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t158)
  call void @obo_gc_pop_roots(i64 66)
  call void @obo_arena_free_all()
  ret i32 0
}

