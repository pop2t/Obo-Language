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
declare void @obo_map_put_list(i8*, i8*, i8*)
declare void @obo_map_put_map(i8*, i8*, i8*)
declare void @obo_map_put_entity(i8*, i8*, i8*)
declare i8* @obo_map_get_boxed(i8*, i8*)
declare void @obo_map_print(i8*)
declare i8* @obo_entity_new(i8*)
declare void @obo_entity_put_i64(i8*, i8*, i64)
declare void @obo_entity_put_str(i8*, i8*, i8*)
declare i8* @obo_entity_get_boxed(i8*, i8*)
declare void @obo_entity_print(i8*)
declare void @obo_value_print(i8*)
declare i64 @obo_value_as_i64(i8*)
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
declare i8* @obo_closure_new(i8*, i64)
declare void @obo_closure_set_capture(i8*, i64, i64)
declare i64 @obo_closure_get_capture(i8*, i64)
declare i64 @obo_closure_call_0(i8*)
declare i64 @obo_closure_call_1(i8*, i64)
declare i64 @obo_closure_call_2(i8*, i64, i64)
declare i8* @malloc(i64)
declare i8* @obo_list_filter(i8*, i8*)
declare i8* @obo_list_map(i8*, i8*)
declare i64 @obo_list_reduce(i8*, i64, i8*)
declare i64 @obo_list_any(i8*, i8*)
declare i64 @obo_list_all(i8*, i8*)

@obo.fmt.i64 = private unnamed_addr constant [6 x i8] c"%lld\0A\00"
@obo.fmt.str = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@obo.fmt.closure = private unnamed_addr constant [12 x i8] c"<action>\0A\00\00\00"

@obo.str.0 = private unnamed_addr constant [7 x i8] c"filter\00"
@obo.str.1 = private unnamed_addr constant [5 x i8] c"join\00"
@obo.str.2 = private unnamed_addr constant [3 x i8] c", \00"
@obo.str.3 = private unnamed_addr constant [4 x i8] c"map\00"
@obo.str.4 = private unnamed_addr constant [7 x i8] c"reduce\00"
@obo.str.5 = private unnamed_addr constant [4 x i8] c"any\00"
@obo.str.6 = private unnamed_addr constant [4 x i8] c"all\00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i64
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i64
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
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i8*
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca i64
  %reg_28_ptr = alloca i64
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca i8*
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i8*
  %reg_36_ptr = alloca i8*
  %reg_37_ptr = alloca i8*
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i8*
  %reg_40_ptr = alloca i8*
  %var_has_big_ptr = alloca i64
  %var_big_nums_ptr = alloca i8*
  %var_adder_ptr = alloca i8*
  %var_pos_check_ptr = alloca i8*
  %var_threshold_ptr = alloca i64
  %var_big_check_ptr = alloca i8*
  %var_above_ptr = alloca i8*
  %var_evens_ptr = alloca i8*
  %var_doubled_ptr = alloca i8*
  %var_is_even_ptr = alloca i8*
  %var_doubler_ptr = alloca i8*
  %var_triple_ptr = alloca i8*
  %var_all_positive_ptr = alloca i64
  %var_nums_ptr = alloca i8*
  %var_double_ptr = alloca i8*
  %var_multiplier_ptr = alloca i64
  %var_total_ptr = alloca i64
  store i64 3, i64* %var_multiplier_ptr
  %t0 = load i64, i64* %var_multiplier_ptr
  store i64 %t0, i64* %reg_0_ptr
  %t1 = bitcast i64 (i8*, i64)* @__closure_0 to i8*
  %t2 = call i8* @obo_closure_new(i8* %t1, i64 1)
  %t3 = load i64, i64* %reg_0_ptr
  call void @obo_closure_set_capture(i8* %t2, i64 0, i64 %t3)
  store i8* %t2, i8** %reg_1_ptr
  %t4 = load i8*, i8** %reg_1_ptr
  store i8* %t4, i8** %var_triple_ptr
  %t5 = call i64 @triple(i64 5)
  store i64 %t5, i64* %reg_2_ptr
  %t6 = load i64, i64* %reg_2_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t6)
  %t7 = call i64 @triple(i64 10)
  store i64 %t7, i64* %reg_3_ptr
  %t8 = load i64, i64* %reg_3_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t8)
  %t9 = bitcast i64 (i8*, i64)* @__closure_1 to i8*
  %t10 = call i8* @obo_closure_new(i8* %t9, i64 0)
  store i8* %t10, i8** %reg_4_ptr
  %t11 = load i8*, i8** %reg_4_ptr
  store i8* %t11, i8** %var_double_ptr
  %t12 = call i64 @double(i64 7)
  store i64 %t12, i64* %reg_5_ptr
  %t13 = load i64, i64* %reg_5_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t13)
  %t14 = alloca [10 x i64]
  %t15 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 0
  store i64 1, i64* %t15
  %t16 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 1
  store i64 2, i64* %t16
  %t17 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 2
  store i64 3, i64* %t17
  %t18 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 3
  store i64 4, i64* %t18
  %t19 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 4
  store i64 5, i64* %t19
  %t20 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 5
  store i64 6, i64* %t20
  %t21 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 6
  store i64 7, i64* %t21
  %t22 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 7
  store i64 8, i64* %t22
  %t23 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 8
  store i64 9, i64* %t23
  %t24 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 9
  store i64 10, i64* %t24
  %t25 = getelementptr inbounds [10 x i64], [10 x i64]* %t14, i64 0, i64 0
  %t26 = call i8* @obo_list_new_i64(i64 10, i64* %t25)
  store i8* %t26, i8** %reg_6_ptr
  %t27 = load i8*, i8** %reg_6_ptr
  store i8* %t27, i8** %var_nums_ptr
  %t28 = bitcast i64 (i8*, i64)* @__closure_2 to i8*
  %t29 = call i8* @obo_closure_new(i8* %t28, i64 0)
  store i8* %t29, i8** %reg_7_ptr
  %t30 = load i8*, i8** %reg_7_ptr
  store i8* %t30, i8** %var_is_even_ptr
  %t31 = load i8*, i8** %var_is_even_ptr
  store i8* %t31, i8** %reg_8_ptr
  %t32 = load i8*, i8** %var_nums_ptr
  store i8* %t32, i8** %reg_9_ptr
  %t33 = load i8*, i8** %reg_9_ptr
  %t35 = load i8*, i8** %reg_8_ptr
  %t34 = call i8* @obo_list_filter(i8* %t33, i8* %t35)
  store i8* %t34, i8** %reg_10_ptr
  %t36 = load i8*, i8** %reg_10_ptr
  store i8* %t36, i8** %var_evens_ptr
  %t37 = load i8*, i8** %var_evens_ptr
  store i8* %t37, i8** %reg_11_ptr
  %t38 = load i8*, i8** %reg_11_ptr
  %t39 = call i8* @obo_list_join(i8* %t38, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.2, i64 0, i64 0))
  store i8* %t39, i8** %reg_12_ptr
  %t40 = load i8*, i8** %reg_12_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t40)
  %t41 = bitcast i64 (i8*, i64)* @__closure_3 to i8*
  %t42 = call i8* @obo_closure_new(i8* %t41, i64 0)
  store i8* %t42, i8** %reg_13_ptr
  %t43 = load i8*, i8** %reg_13_ptr
  store i8* %t43, i8** %var_doubler_ptr
  %t44 = load i8*, i8** %var_doubler_ptr
  store i8* %t44, i8** %reg_14_ptr
  %t45 = load i8*, i8** %var_nums_ptr
  store i8* %t45, i8** %reg_15_ptr
  %t46 = load i8*, i8** %reg_15_ptr
  %t48 = load i8*, i8** %reg_14_ptr
  %t47 = call i8* @obo_list_map(i8* %t46, i8* %t48)
  store i8* %t47, i8** %reg_16_ptr
  %t49 = load i8*, i8** %reg_16_ptr
  store i8* %t49, i8** %var_doubled_ptr
  %t50 = load i8*, i8** %var_doubled_ptr
  store i8* %t50, i8** %reg_17_ptr
  %t51 = load i8*, i8** %reg_17_ptr
  %t52 = call i8* @obo_list_join(i8* %t51, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.2, i64 0, i64 0))
  store i8* %t52, i8** %reg_18_ptr
  %t53 = load i8*, i8** %reg_18_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t53)
  %t54 = bitcast i64 (i8*, i64, i64)* @__closure_4 to i8*
  %t55 = call i8* @obo_closure_new(i8* %t54, i64 0)
  store i8* %t55, i8** %reg_19_ptr
  %t56 = load i8*, i8** %reg_19_ptr
  store i8* %t56, i8** %var_adder_ptr
  %t57 = load i8*, i8** %var_adder_ptr
  store i8* %t57, i8** %reg_20_ptr
  %t58 = load i8*, i8** %var_nums_ptr
  store i8* %t58, i8** %reg_21_ptr
  %t59 = load i8*, i8** %reg_21_ptr
  %t61 = load i8*, i8** %reg_20_ptr
  %t60 = call i64 @obo_list_reduce(i8* %t59, i64 0, i8* %t61)
  store i64 %t60, i64* %reg_22_ptr
  %t62 = load i64, i64* %reg_22_ptr
  store i64 %t62, i64* %var_total_ptr
  %t63 = load i64, i64* %var_total_ptr
  store i64 %t63, i64* %reg_23_ptr
  %t64 = load i64, i64* %reg_23_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t64)
  %t65 = bitcast i64 (i8*, i64)* @__closure_5 to i8*
  %t66 = call i8* @obo_closure_new(i8* %t65, i64 0)
  store i8* %t66, i8** %reg_24_ptr
  %t67 = load i8*, i8** %reg_24_ptr
  store i8* %t67, i8** %var_big_check_ptr
  %t68 = load i8*, i8** %var_big_check_ptr
  store i8* %t68, i8** %reg_25_ptr
  %t69 = load i8*, i8** %var_nums_ptr
  store i8* %t69, i8** %reg_26_ptr
  %t70 = load i8*, i8** %reg_26_ptr
  %t72 = load i8*, i8** %reg_25_ptr
  %t71 = call i64 @obo_list_any(i8* %t70, i8* %t72)
  store i64 %t71, i64* %reg_27_ptr
  %t73 = load i64, i64* %reg_27_ptr
  store i64 %t73, i64* %var_has_big_ptr
  %t74 = load i64, i64* %var_has_big_ptr
  store i64 %t74, i64* %reg_28_ptr
  %t75 = load i64, i64* %reg_28_ptr
  call void @obo_print_bool(i64 %t75)
  %t76 = bitcast i64 (i8*, i64)* @__closure_6 to i8*
  %t77 = call i8* @obo_closure_new(i8* %t76, i64 0)
  store i8* %t77, i8** %reg_29_ptr
  %t78 = load i8*, i8** %reg_29_ptr
  store i8* %t78, i8** %var_pos_check_ptr
  %t79 = load i8*, i8** %var_pos_check_ptr
  store i8* %t79, i8** %reg_30_ptr
  %t80 = load i8*, i8** %var_nums_ptr
  store i8* %t80, i8** %reg_31_ptr
  %t81 = load i8*, i8** %reg_31_ptr
  %t83 = load i8*, i8** %reg_30_ptr
  %t82 = call i64 @obo_list_all(i8* %t81, i8* %t83)
  store i64 %t82, i64* %reg_32_ptr
  %t84 = load i64, i64* %reg_32_ptr
  store i64 %t84, i64* %var_all_positive_ptr
  %t85 = load i64, i64* %var_all_positive_ptr
  store i64 %t85, i64* %reg_33_ptr
  %t86 = load i64, i64* %reg_33_ptr
  call void @obo_print_bool(i64 %t86)
  store i64 7, i64* %var_threshold_ptr
  %t87 = load i64, i64* %var_threshold_ptr
  store i64 %t87, i64* %reg_34_ptr
  %t88 = bitcast i64 (i8*, i64)* @__closure_7 to i8*
  %t89 = call i8* @obo_closure_new(i8* %t88, i64 1)
  %t90 = load i64, i64* %reg_34_ptr
  call void @obo_closure_set_capture(i8* %t89, i64 0, i64 %t90)
  store i8* %t89, i8** %reg_35_ptr
  %t91 = load i8*, i8** %reg_35_ptr
  store i8* %t91, i8** %var_above_ptr
  %t92 = load i8*, i8** %var_above_ptr
  store i8* %t92, i8** %reg_36_ptr
  %t93 = load i8*, i8** %var_nums_ptr
  store i8* %t93, i8** %reg_37_ptr
  %t94 = load i8*, i8** %reg_37_ptr
  %t96 = load i8*, i8** %reg_36_ptr
  %t95 = call i8* @obo_list_filter(i8* %t94, i8* %t96)
  store i8* %t95, i8** %reg_38_ptr
  %t97 = load i8*, i8** %reg_38_ptr
  store i8* %t97, i8** %var_big_nums_ptr
  %t98 = load i8*, i8** %var_big_nums_ptr
  store i8* %t98, i8** %reg_39_ptr
  %t99 = load i8*, i8** %reg_39_ptr
  %t100 = call i8* @obo_list_join(i8* %t99, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.2, i64 0, i64 0))
  store i8* %t100, i8** %reg_40_ptr
  %t101 = load i8*, i8** %reg_40_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @obo.fmt.str, i64 0, i64 0), i8* %t101)
  call void @obo_arena_free_all()
  ret i32 0
}

define i64 @__closure_0(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_x_ptr = alloca i64
  %var_multiplier_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_x_ptr
  %t2 = load i8*, i8** %var___closure_self_ptr
  store i8* %t2, i8** %reg_3_ptr
  %t3 = load i8*, i8** %reg_3_ptr
  %t4 = call i64 @__closure_get_capture(i8* %t3, i64 0)
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_multiplier_ptr
  %t6 = load i64, i64* %var_x_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %var_multiplier_ptr
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = mul i64 %t8, %t9
  store i64 %t10, i64* %reg_6_ptr
  %t11 = load i64, i64* %reg_6_ptr
  ret i64 %t11
}

define i64 @__closure_1(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_x_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_x_ptr
  %t2 = load i64, i64* %var_x_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = mul i64 %t3, 2
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  ret i64 %t5
}

define i64 @__closure_2(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i64, i64* %var_n_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = srem i64 %t3, 2
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = icmp eq i64 %t5, 0
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_4_ptr
  %t8 = load i64, i64* %reg_4_ptr
  ret i64 %t8
}

define i64 @__closure_3(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i64, i64* %var_n_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = mul i64 %t3, 2
  store i64 %t4, i64* %reg_3_ptr
  %t5 = load i64, i64* %reg_3_ptr
  ret i64 %t5
}

define i64 @__closure_4(i8* %arg0, i64 %arg1, i64 %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %var_acc_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_n_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store i64 %arg2, i64* %reg_2_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_acc_ptr
  %t2 = load i64, i64* %reg_2_ptr
  store i64 %t2, i64* %var_n_ptr
  %t3 = load i64, i64* %var_acc_ptr
  store i64 %t3, i64* %reg_3_ptr
  %t4 = load i64, i64* %var_n_ptr
  store i64 %t4, i64* %reg_4_ptr
  %t5 = load i64, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_4_ptr
  %t7 = add i64 %t5, %t6
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_5_ptr
  ret i64 %t8
}

define i64 @__closure_5(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_n_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i64, i64* %var_n_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp sgt i64 %t3, 5
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  ret i64 %t6
}

define i64 @__closure_6(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %var_n_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i64, i64* %var_n_ptr
  store i64 %t2, i64* %reg_2_ptr
  %t3 = load i64, i64* %reg_2_ptr
  %t4 = icmp sgt i64 %t3, 0
  %t5 = zext i1 %t4 to i64
  store i64 %t5, i64* %reg_3_ptr
  %t6 = load i64, i64* %reg_3_ptr
  ret i64 %t6
}

define i64 @__closure_7(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %var_threshold_ptr = alloca i64
  %var___closure_self_ptr = alloca i8*
  %var_n_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var___closure_self_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_n_ptr
  %t2 = load i8*, i8** %var___closure_self_ptr
  store i8* %t2, i8** %reg_3_ptr
  %t3 = load i8*, i8** %reg_3_ptr
  %t4 = call i64 @__closure_get_capture(i8* %t3, i64 0)
  store i64 %t4, i64* %reg_2_ptr
  %t5 = load i64, i64* %reg_2_ptr
  store i64 %t5, i64* %var_threshold_ptr
  %t6 = load i64, i64* %var_n_ptr
  store i64 %t6, i64* %reg_4_ptr
  %t7 = load i64, i64* %var_threshold_ptr
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_4_ptr
  %t9 = load i64, i64* %reg_5_ptr
  %t10 = icmp sgt i64 %t8, %t9
  %t11 = zext i1 %t10 to i64
  store i64 %t11, i64* %reg_6_ptr
  %t12 = load i64, i64* %reg_6_ptr
  ret i64 %t12
}

