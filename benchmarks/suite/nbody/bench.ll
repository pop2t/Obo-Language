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

@obo.str.0 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.1 = private unnamed_addr constant [2 x i8] c"y\00"
@obo.str.2 = private unnamed_addr constant [2 x i8] c"z\00"
@obo.str.3 = private unnamed_addr constant [3 x i8] c"vx\00"
@obo.str.4 = private unnamed_addr constant [5 x i8] c"mass\00"
@obo.str.5 = private unnamed_addr constant [3 x i8] c"vy\00"
@obo.str.6 = private unnamed_addr constant [3 x i8] c"vz\00"
@obo.str.7 = private unnamed_addr constant [5 x i8] c"Body\00"

define i64 @advance(i8* %arg0, i64 %arg1, double %arg2) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca double
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i64
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca i64
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca i64
  %reg_11_ptr = alloca i64
  %reg_12_ptr = alloca i64
  %reg_13_ptr = alloca i64
  %reg_14_ptr = alloca i64
  %reg_15_ptr = alloca i64
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca i64
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca i8*
  %reg_20_ptr = alloca double
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca i8*
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca i8*
  %reg_32_ptr = alloca double
  %reg_33_ptr = alloca double
  %reg_34_ptr = alloca double
  %reg_35_ptr = alloca double
  %reg_36_ptr = alloca double
  %reg_37_ptr = alloca double
  %reg_38_ptr = alloca double
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca double
  %reg_41_ptr = alloca double
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca double
  %reg_44_ptr = alloca double
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca double
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca double
  %reg_49_ptr = alloca double
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca double
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca double
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca double
  %reg_57_ptr = alloca double
  %reg_58_ptr = alloca double
  %reg_59_ptr = alloca double
  %reg_60_ptr = alloca double
  %reg_61_ptr = alloca i8*
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca double
  %reg_65_ptr = alloca i8*
  %reg_66_ptr = alloca double
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca double
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca i8*
  %reg_73_ptr = alloca double
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca i8*
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca double
  %reg_78_ptr = alloca double
  %reg_79_ptr = alloca double
  %reg_80_ptr = alloca double
  %reg_81_ptr = alloca i8*
  %reg_82_ptr = alloca i8*
  %reg_83_ptr = alloca double
  %reg_84_ptr = alloca double
  %reg_85_ptr = alloca i8*
  %reg_86_ptr = alloca double
  %reg_87_ptr = alloca double
  %reg_88_ptr = alloca double
  %reg_89_ptr = alloca double
  %reg_90_ptr = alloca double
  %reg_91_ptr = alloca i8*
  %reg_92_ptr = alloca i8*
  %reg_93_ptr = alloca double
  %reg_94_ptr = alloca double
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca double
  %reg_97_ptr = alloca double
  %reg_98_ptr = alloca double
  %reg_99_ptr = alloca double
  %reg_100_ptr = alloca double
  %reg_101_ptr = alloca i8*
  %reg_102_ptr = alloca i8*
  %reg_103_ptr = alloca double
  %reg_104_ptr = alloca double
  %reg_105_ptr = alloca i8*
  %reg_106_ptr = alloca double
  %reg_107_ptr = alloca double
  %reg_108_ptr = alloca double
  %reg_109_ptr = alloca double
  %reg_110_ptr = alloca double
  %reg_111_ptr = alloca i8*
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i64
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca i64
  %reg_116_ptr = alloca i64
  %reg_117_ptr = alloca i64
  %reg_118_ptr = alloca i64
  %reg_119_ptr = alloca i64
  %reg_120_ptr = alloca i8*
  %reg_121_ptr = alloca i64
  %reg_122_ptr = alloca i8*
  %reg_123_ptr = alloca i8*
  %reg_124_ptr = alloca double
  %reg_125_ptr = alloca double
  %reg_126_ptr = alloca i8*
  %reg_127_ptr = alloca double
  %reg_128_ptr = alloca double
  %reg_129_ptr = alloca double
  %reg_130_ptr = alloca i8*
  %reg_131_ptr = alloca i8*
  %reg_132_ptr = alloca double
  %reg_133_ptr = alloca double
  %reg_134_ptr = alloca i8*
  %reg_135_ptr = alloca double
  %reg_136_ptr = alloca double
  %reg_137_ptr = alloca double
  %reg_138_ptr = alloca i8*
  %reg_139_ptr = alloca i8*
  %reg_140_ptr = alloca double
  %reg_141_ptr = alloca double
  %reg_142_ptr = alloca i8*
  %reg_143_ptr = alloca double
  %reg_144_ptr = alloca double
  %reg_145_ptr = alloca double
  %reg_146_ptr = alloca i8*
  %reg_147_ptr = alloca i64
  %reg_148_ptr = alloca i64
  %var_i_ptr = alloca i64
  %var_dz_ptr = alloca double
  %var_bodies_ptr = alloca i8*
  %var_bj_ptr = alloca i8*
  %var_dist2_ptr = alloca double
  %var_dy_ptr = alloca double
  %var_dx_ptr = alloca double
  %var_dist_ptr = alloca double
  %var_mag_ptr = alloca double
  %var_nbodies_ptr = alloca i64
  %var_dt_ptr = alloca double
  %var_bi_ptr = alloca i8*
  %var_j_ptr = alloca i64
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  store double %arg2, double* %reg_2_ptr
  call void @obo_gc_push_root(i8** %reg_52_ptr)
  call void @obo_gc_push_root(i8** %reg_55_ptr)
  call void @obo_gc_push_root(i8** %reg_61_ptr)
  call void @obo_gc_push_root(i8** %reg_62_ptr)
  call void @obo_gc_push_root(i8** %reg_65_ptr)
  call void @obo_gc_push_root(i8** %reg_71_ptr)
  call void @obo_gc_push_root(i8** %reg_72_ptr)
  call void @obo_gc_push_root(i8** %reg_75_ptr)
  call void @obo_gc_push_root(i8** %reg_81_ptr)
  call void @obo_gc_push_root(i8** %reg_82_ptr)
  call void @obo_gc_push_root(i8** %reg_85_ptr)
  call void @obo_gc_push_root(i8** %reg_91_ptr)
  call void @obo_gc_push_root(i8** %reg_92_ptr)
  call void @obo_gc_push_root(i8** %reg_95_ptr)
  call void @obo_gc_push_root(i8** %reg_101_ptr)
  call void @obo_gc_push_root(i8** %reg_102_ptr)
  call void @obo_gc_push_root(i8** %reg_105_ptr)
  call void @obo_gc_push_root(i8** %reg_111_ptr)
  call void @obo_gc_push_root(i8** %var_bodies_ptr)
  call void @obo_gc_push_root(i8** %var_bj_ptr)
  call void @obo_gc_push_root(i8** %var_bi_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_bodies_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_nbodies_ptr
  %t2 = load double, double* %reg_2_ptr
  store double %t2, double* %var_dt_ptr
  store i64 0, i64* %var_i_ptr
  %t3 = load i64, i64* %var_nbodies_ptr
  store i64 %t3, i64* %reg_3_ptr
  store i64 1, i64* %reg_4_ptr
  br label %advance_b1
advance_b1:
  %t4 = load i64, i64* %var_i_ptr
  store i64 %t4, i64* %reg_5_ptr
  %t5 = load i64, i64* %reg_5_ptr
  %t6 = load i64, i64* %reg_3_ptr
  %t7 = icmp slt i64 %t5, %t6
  %t8 = zext i1 %t7 to i64
  store i64 %t8, i64* %reg_6_ptr
  %t9 = load i64, i64* %reg_6_ptr
  %t11 = icmp ne i64 %t9, 0
  %t12 = zext i1 %t11 to i64
  %t10 = icmp ne i64 %t12, 0
  br i1 %t10, label %advance_b2, label %advance_b4
advance_b2:
  %t13 = load i8*, i8** %var_bodies_ptr
  store i8* %t13, i8** %reg_7_ptr
  %t14 = load i64, i64* %var_i_ptr
  store i64 %t14, i64* %reg_8_ptr
  %t15 = load i8*, i8** %reg_7_ptr
  %t16 = load i64, i64* %reg_8_ptr
  %t17 = call i8* @obo_mixed_list_get(i8* %t15, i64 %t16)
  store i8* %t17, i8** %reg_9_ptr
  %t18 = load i8*, i8** %reg_9_ptr
  store i8* %t18, i8** %var_bi_ptr
  %t19 = load i64, i64* %var_i_ptr
  store i64 %t19, i64* %reg_10_ptr
  %t20 = load i64, i64* %reg_10_ptr
  %t21 = add i64 %t20, 1
  store i64 %t21, i64* %reg_11_ptr
  %t22 = load i64, i64* %reg_11_ptr
  store i64 %t22, i64* %var_j_ptr
  %t23 = load i64, i64* %var_nbodies_ptr
  store i64 %t23, i64* %reg_12_ptr
  store i64 1, i64* %reg_13_ptr
  br label %advance_b5
advance_b3:
  %t24 = load i64, i64* %var_i_ptr
  store i64 %t24, i64* %reg_114_ptr
  %t25 = load i64, i64* %reg_114_ptr
  %t26 = load i64, i64* %reg_4_ptr
  %t27 = add i64 %t25, %t26
  store i64 %t27, i64* %reg_115_ptr
  %t28 = load i64, i64* %reg_115_ptr
  store i64 %t28, i64* %var_i_ptr
  br label %advance_b1
advance_b4:
  store i64 0, i64* %var_i_ptr
  %t29 = load i64, i64* %var_nbodies_ptr
  store i64 %t29, i64* %reg_116_ptr
  store i64 1, i64* %reg_117_ptr
  br label %advance_b9
advance_b5:
  %t30 = load i64, i64* %var_j_ptr
  store i64 %t30, i64* %reg_14_ptr
  %t31 = load i64, i64* %reg_14_ptr
  %t32 = load i64, i64* %reg_12_ptr
  %t33 = icmp slt i64 %t31, %t32
  %t34 = zext i1 %t33 to i64
  store i64 %t34, i64* %reg_15_ptr
  %t35 = load i64, i64* %reg_15_ptr
  %t37 = icmp ne i64 %t35, 0
  %t38 = zext i1 %t37 to i64
  %t36 = icmp ne i64 %t38, 0
  br i1 %t36, label %advance_b6, label %advance_b8
advance_b6:
  %t39 = load i8*, i8** %var_bodies_ptr
  store i8* %t39, i8** %reg_16_ptr
  %t40 = load i64, i64* %var_j_ptr
  store i64 %t40, i64* %reg_17_ptr
  %t41 = load i8*, i8** %reg_16_ptr
  %t42 = load i64, i64* %reg_17_ptr
  %t43 = call i8* @obo_mixed_list_get(i8* %t41, i64 %t42)
  store i8* %t43, i8** %reg_18_ptr
  %t44 = load i8*, i8** %reg_18_ptr
  store i8* %t44, i8** %var_bj_ptr
  %t45 = load i8*, i8** %var_bi_ptr
  store i8* %t45, i8** %reg_19_ptr
  %t46 = load i8*, i8** %reg_19_ptr
  %t47 = call i8* @obo_value_as_entity_ptr(i8* %t46)
  %t48 = getelementptr i8, i8* %t47, i64 40
  %t49 = bitcast i8* %t48 to double*
  %t50 = load double, double* %t49
  store double %t50, double* %reg_20_ptr
  %t51 = load i8*, i8** %var_bj_ptr
  store i8* %t51, i8** %reg_21_ptr
  %t52 = load i8*, i8** %reg_21_ptr
  %t53 = call i8* @obo_value_as_entity_ptr(i8* %t52)
  %t54 = getelementptr i8, i8* %t53, i64 40
  %t55 = bitcast i8* %t54 to double*
  %t56 = load double, double* %t55
  store double %t56, double* %reg_22_ptr
  %t57 = load double, double* %reg_20_ptr
  %t58 = load double, double* %reg_22_ptr
  %t59 = fsub double %t57, %t58
  store double %t59, double* %reg_23_ptr
  %t60 = load double, double* %reg_23_ptr
  store double %t60, double* %var_dx_ptr
  %t61 = load i8*, i8** %var_bi_ptr
  store i8* %t61, i8** %reg_24_ptr
  %t62 = load i8*, i8** %reg_24_ptr
  %t63 = getelementptr i8, i8* %t47, i64 56
  %t64 = bitcast i8* %t63 to double*
  %t65 = load double, double* %t64
  store double %t65, double* %reg_25_ptr
  %t66 = load i8*, i8** %var_bj_ptr
  store i8* %t66, i8** %reg_26_ptr
  %t67 = load i8*, i8** %reg_26_ptr
  %t68 = getelementptr i8, i8* %t53, i64 56
  %t69 = bitcast i8* %t68 to double*
  %t70 = load double, double* %t69
  store double %t70, double* %reg_27_ptr
  %t71 = load double, double* %reg_25_ptr
  %t72 = load double, double* %reg_27_ptr
  %t73 = fsub double %t71, %t72
  store double %t73, double* %reg_28_ptr
  %t74 = load double, double* %reg_28_ptr
  store double %t74, double* %var_dy_ptr
  %t75 = load i8*, i8** %var_bi_ptr
  store i8* %t75, i8** %reg_29_ptr
  %t76 = load i8*, i8** %reg_29_ptr
  %t77 = getelementptr i8, i8* %t47, i64 72
  %t78 = bitcast i8* %t77 to double*
  %t79 = load double, double* %t78
  store double %t79, double* %reg_30_ptr
  %t80 = load i8*, i8** %var_bj_ptr
  store i8* %t80, i8** %reg_31_ptr
  %t81 = load i8*, i8** %reg_31_ptr
  %t82 = getelementptr i8, i8* %t53, i64 72
  %t83 = bitcast i8* %t82 to double*
  %t84 = load double, double* %t83
  store double %t84, double* %reg_32_ptr
  %t85 = load double, double* %reg_30_ptr
  %t86 = load double, double* %reg_32_ptr
  %t87 = fsub double %t85, %t86
  store double %t87, double* %reg_33_ptr
  %t88 = load double, double* %reg_33_ptr
  store double %t88, double* %var_dz_ptr
  %t89 = load double, double* %var_dx_ptr
  store double %t89, double* %reg_34_ptr
  %t90 = load double, double* %var_dx_ptr
  store double %t90, double* %reg_35_ptr
  %t91 = load double, double* %reg_34_ptr
  %t92 = load double, double* %reg_35_ptr
  %t93 = fmul double %t91, %t92
  store double %t93, double* %reg_36_ptr
  %t94 = load double, double* %var_dy_ptr
  store double %t94, double* %reg_37_ptr
  %t95 = load double, double* %var_dy_ptr
  store double %t95, double* %reg_38_ptr
  %t96 = load double, double* %reg_37_ptr
  %t97 = load double, double* %reg_38_ptr
  %t98 = fmul double %t96, %t97
  store double %t98, double* %reg_39_ptr
  %t99 = load double, double* %reg_36_ptr
  %t100 = load double, double* %reg_39_ptr
  %t101 = fadd double %t99, %t100
  store double %t101, double* %reg_40_ptr
  %t102 = load double, double* %var_dz_ptr
  store double %t102, double* %reg_41_ptr
  %t103 = load double, double* %var_dz_ptr
  store double %t103, double* %reg_42_ptr
  %t104 = load double, double* %reg_41_ptr
  %t105 = load double, double* %reg_42_ptr
  %t106 = fmul double %t104, %t105
  store double %t106, double* %reg_43_ptr
  %t107 = load double, double* %reg_40_ptr
  %t108 = load double, double* %reg_43_ptr
  %t109 = fadd double %t107, %t108
  store double %t109, double* %reg_44_ptr
  %t110 = load double, double* %reg_44_ptr
  store double %t110, double* %var_dist2_ptr
  %t111 = load double, double* %var_dist2_ptr
  store double %t111, double* %reg_45_ptr
  %t112 = load double, double* %reg_45_ptr
  %t113 = call double @__sys_Math_sqrt(double %t112)
  store double %t113, double* %reg_46_ptr
  %t114 = load double, double* %reg_46_ptr
  store double %t114, double* %var_dist_ptr
  %t115 = load double, double* %var_dt_ptr
  store double %t115, double* %reg_47_ptr
  %t116 = load double, double* %var_dist2_ptr
  store double %t116, double* %reg_48_ptr
  %t117 = load double, double* %var_dist_ptr
  store double %t117, double* %reg_49_ptr
  %t118 = load double, double* %reg_48_ptr
  %t119 = load double, double* %reg_49_ptr
  %t120 = fmul double %t118, %t119
  store double %t120, double* %reg_50_ptr
  %t121 = load double, double* %reg_47_ptr
  %t122 = load double, double* %reg_50_ptr
  %t123 = fdiv double %t121, %t122
  store double %t123, double* %reg_51_ptr
  %t124 = load double, double* %reg_51_ptr
  store double %t124, double* %var_mag_ptr
  %t125 = load i8*, i8** %var_bi_ptr
  store i8* %t125, i8** %reg_52_ptr
  %t126 = load i8*, i8** %reg_52_ptr
  %t127 = getelementptr i8, i8* %t47, i64 88
  %t128 = bitcast i8* %t127 to double*
  %t129 = load double, double* %t128
  store double %t129, double* %reg_53_ptr
  %t130 = load double, double* %var_dx_ptr
  store double %t130, double* %reg_54_ptr
  %t131 = load i8*, i8** %var_bj_ptr
  store i8* %t131, i8** %reg_55_ptr
  %t132 = load i8*, i8** %reg_55_ptr
  %t133 = getelementptr i8, i8* %t53, i64 136
  %t134 = bitcast i8* %t133 to double*
  %t135 = load double, double* %t134
  store double %t135, double* %reg_56_ptr
  %t136 = load double, double* %reg_54_ptr
  %t137 = load double, double* %reg_56_ptr
  %t138 = fmul double %t136, %t137
  store double %t138, double* %reg_57_ptr
  %t139 = load double, double* %var_mag_ptr
  store double %t139, double* %reg_58_ptr
  %t140 = load double, double* %reg_57_ptr
  %t141 = load double, double* %reg_58_ptr
  %t142 = fmul double %t140, %t141
  store double %t142, double* %reg_59_ptr
  %t143 = load double, double* %reg_53_ptr
  %t144 = load double, double* %reg_59_ptr
  %t145 = fsub double %t143, %t144
  store double %t145, double* %reg_60_ptr
  %t146 = load i8*, i8** %var_bi_ptr
  store i8* %t146, i8** %reg_61_ptr
  %t147 = load i8*, i8** %reg_61_ptr
  %t148 = load double, double* %reg_60_ptr
  %t149 = getelementptr i8, i8* %t47, i64 80
  store i8 5, i8* %t149
  %t150 = getelementptr i8, i8* %t47, i64 88
  %t151 = bitcast i8* %t150 to double*
  store double %t148, double* %t151
  %t152 = load i8*, i8** %var_bi_ptr
  store i8* %t152, i8** %reg_62_ptr
  %t153 = load i8*, i8** %reg_62_ptr
  %t154 = getelementptr i8, i8* %t47, i64 104
  %t155 = bitcast i8* %t154 to double*
  %t156 = load double, double* %t155
  store double %t156, double* %reg_63_ptr
  %t157 = load double, double* %var_dy_ptr
  store double %t157, double* %reg_64_ptr
  %t158 = load i8*, i8** %var_bj_ptr
  store i8* %t158, i8** %reg_65_ptr
  %t159 = load i8*, i8** %reg_65_ptr
  %t160 = getelementptr i8, i8* %t53, i64 136
  %t161 = bitcast i8* %t160 to double*
  %t162 = load double, double* %t161
  store double %t162, double* %reg_66_ptr
  %t163 = load double, double* %reg_64_ptr
  %t164 = load double, double* %reg_66_ptr
  %t165 = fmul double %t163, %t164
  store double %t165, double* %reg_67_ptr
  %t166 = load double, double* %var_mag_ptr
  store double %t166, double* %reg_68_ptr
  %t167 = load double, double* %reg_67_ptr
  %t168 = load double, double* %reg_68_ptr
  %t169 = fmul double %t167, %t168
  store double %t169, double* %reg_69_ptr
  %t170 = load double, double* %reg_63_ptr
  %t171 = load double, double* %reg_69_ptr
  %t172 = fsub double %t170, %t171
  store double %t172, double* %reg_70_ptr
  %t173 = load i8*, i8** %var_bi_ptr
  store i8* %t173, i8** %reg_71_ptr
  %t174 = load i8*, i8** %reg_71_ptr
  %t175 = load double, double* %reg_70_ptr
  %t176 = getelementptr i8, i8* %t47, i64 96
  store i8 5, i8* %t176
  %t177 = getelementptr i8, i8* %t47, i64 104
  %t178 = bitcast i8* %t177 to double*
  store double %t175, double* %t178
  %t179 = load i8*, i8** %var_bi_ptr
  store i8* %t179, i8** %reg_72_ptr
  %t180 = load i8*, i8** %reg_72_ptr
  %t181 = getelementptr i8, i8* %t47, i64 120
  %t182 = bitcast i8* %t181 to double*
  %t183 = load double, double* %t182
  store double %t183, double* %reg_73_ptr
  %t184 = load double, double* %var_dz_ptr
  store double %t184, double* %reg_74_ptr
  %t185 = load i8*, i8** %var_bj_ptr
  store i8* %t185, i8** %reg_75_ptr
  %t186 = load i8*, i8** %reg_75_ptr
  %t187 = getelementptr i8, i8* %t53, i64 136
  %t188 = bitcast i8* %t187 to double*
  %t189 = load double, double* %t188
  store double %t189, double* %reg_76_ptr
  %t190 = load double, double* %reg_74_ptr
  %t191 = load double, double* %reg_76_ptr
  %t192 = fmul double %t190, %t191
  store double %t192, double* %reg_77_ptr
  %t193 = load double, double* %var_mag_ptr
  store double %t193, double* %reg_78_ptr
  %t194 = load double, double* %reg_77_ptr
  %t195 = load double, double* %reg_78_ptr
  %t196 = fmul double %t194, %t195
  store double %t196, double* %reg_79_ptr
  %t197 = load double, double* %reg_73_ptr
  %t198 = load double, double* %reg_79_ptr
  %t199 = fsub double %t197, %t198
  store double %t199, double* %reg_80_ptr
  %t200 = load i8*, i8** %var_bi_ptr
  store i8* %t200, i8** %reg_81_ptr
  %t201 = load i8*, i8** %reg_81_ptr
  %t202 = load double, double* %reg_80_ptr
  %t203 = getelementptr i8, i8* %t47, i64 112
  store i8 5, i8* %t203
  %t204 = getelementptr i8, i8* %t47, i64 120
  %t205 = bitcast i8* %t204 to double*
  store double %t202, double* %t205
  %t206 = load i8*, i8** %var_bj_ptr
  store i8* %t206, i8** %reg_82_ptr
  %t207 = load i8*, i8** %reg_82_ptr
  %t208 = getelementptr i8, i8* %t53, i64 88
  %t209 = bitcast i8* %t208 to double*
  %t210 = load double, double* %t209
  store double %t210, double* %reg_83_ptr
  %t211 = load double, double* %var_dx_ptr
  store double %t211, double* %reg_84_ptr
  %t212 = load i8*, i8** %var_bi_ptr
  store i8* %t212, i8** %reg_85_ptr
  %t213 = load i8*, i8** %reg_85_ptr
  %t214 = getelementptr i8, i8* %t47, i64 136
  %t215 = bitcast i8* %t214 to double*
  %t216 = load double, double* %t215
  store double %t216, double* %reg_86_ptr
  %t217 = load double, double* %reg_84_ptr
  %t218 = load double, double* %reg_86_ptr
  %t219 = fmul double %t217, %t218
  store double %t219, double* %reg_87_ptr
  %t220 = load double, double* %var_mag_ptr
  store double %t220, double* %reg_88_ptr
  %t221 = load double, double* %reg_87_ptr
  %t222 = load double, double* %reg_88_ptr
  %t223 = fmul double %t221, %t222
  store double %t223, double* %reg_89_ptr
  %t224 = load double, double* %reg_83_ptr
  %t225 = load double, double* %reg_89_ptr
  %t226 = fadd double %t224, %t225
  store double %t226, double* %reg_90_ptr
  %t227 = load i8*, i8** %var_bj_ptr
  store i8* %t227, i8** %reg_91_ptr
  %t228 = load i8*, i8** %reg_91_ptr
  %t229 = load double, double* %reg_90_ptr
  %t230 = getelementptr i8, i8* %t53, i64 80
  store i8 5, i8* %t230
  %t231 = getelementptr i8, i8* %t53, i64 88
  %t232 = bitcast i8* %t231 to double*
  store double %t229, double* %t232
  %t233 = load i8*, i8** %var_bj_ptr
  store i8* %t233, i8** %reg_92_ptr
  %t234 = load i8*, i8** %reg_92_ptr
  %t235 = getelementptr i8, i8* %t53, i64 104
  %t236 = bitcast i8* %t235 to double*
  %t237 = load double, double* %t236
  store double %t237, double* %reg_93_ptr
  %t238 = load double, double* %var_dy_ptr
  store double %t238, double* %reg_94_ptr
  %t239 = load i8*, i8** %var_bi_ptr
  store i8* %t239, i8** %reg_95_ptr
  %t240 = load i8*, i8** %reg_95_ptr
  %t241 = getelementptr i8, i8* %t47, i64 136
  %t242 = bitcast i8* %t241 to double*
  %t243 = load double, double* %t242
  store double %t243, double* %reg_96_ptr
  %t244 = load double, double* %reg_94_ptr
  %t245 = load double, double* %reg_96_ptr
  %t246 = fmul double %t244, %t245
  store double %t246, double* %reg_97_ptr
  %t247 = load double, double* %var_mag_ptr
  store double %t247, double* %reg_98_ptr
  %t248 = load double, double* %reg_97_ptr
  %t249 = load double, double* %reg_98_ptr
  %t250 = fmul double %t248, %t249
  store double %t250, double* %reg_99_ptr
  %t251 = load double, double* %reg_93_ptr
  %t252 = load double, double* %reg_99_ptr
  %t253 = fadd double %t251, %t252
  store double %t253, double* %reg_100_ptr
  %t254 = load i8*, i8** %var_bj_ptr
  store i8* %t254, i8** %reg_101_ptr
  %t255 = load i8*, i8** %reg_101_ptr
  %t256 = load double, double* %reg_100_ptr
  %t257 = getelementptr i8, i8* %t53, i64 96
  store i8 5, i8* %t257
  %t258 = getelementptr i8, i8* %t53, i64 104
  %t259 = bitcast i8* %t258 to double*
  store double %t256, double* %t259
  %t260 = load i8*, i8** %var_bj_ptr
  store i8* %t260, i8** %reg_102_ptr
  %t261 = load i8*, i8** %reg_102_ptr
  %t262 = getelementptr i8, i8* %t53, i64 120
  %t263 = bitcast i8* %t262 to double*
  %t264 = load double, double* %t263
  store double %t264, double* %reg_103_ptr
  %t265 = load double, double* %var_dz_ptr
  store double %t265, double* %reg_104_ptr
  %t266 = load i8*, i8** %var_bi_ptr
  store i8* %t266, i8** %reg_105_ptr
  %t267 = load i8*, i8** %reg_105_ptr
  %t268 = getelementptr i8, i8* %t47, i64 136
  %t269 = bitcast i8* %t268 to double*
  %t270 = load double, double* %t269
  store double %t270, double* %reg_106_ptr
  %t271 = load double, double* %reg_104_ptr
  %t272 = load double, double* %reg_106_ptr
  %t273 = fmul double %t271, %t272
  store double %t273, double* %reg_107_ptr
  %t274 = load double, double* %var_mag_ptr
  store double %t274, double* %reg_108_ptr
  %t275 = load double, double* %reg_107_ptr
  %t276 = load double, double* %reg_108_ptr
  %t277 = fmul double %t275, %t276
  store double %t277, double* %reg_109_ptr
  %t278 = load double, double* %reg_103_ptr
  %t279 = load double, double* %reg_109_ptr
  %t280 = fadd double %t278, %t279
  store double %t280, double* %reg_110_ptr
  %t281 = load i8*, i8** %var_bj_ptr
  store i8* %t281, i8** %reg_111_ptr
  %t282 = load i8*, i8** %reg_111_ptr
  %t283 = load double, double* %reg_110_ptr
  %t284 = getelementptr i8, i8* %t53, i64 112
  store i8 5, i8* %t284
  %t285 = getelementptr i8, i8* %t53, i64 120
  %t286 = bitcast i8* %t285 to double*
  store double %t283, double* %t286
  br label %advance_b7
advance_b7:
  %t287 = load i64, i64* %var_j_ptr
  store i64 %t287, i64* %reg_112_ptr
  %t288 = load i64, i64* %reg_112_ptr
  %t289 = load i64, i64* %reg_13_ptr
  %t290 = add i64 %t288, %t289
  store i64 %t290, i64* %reg_113_ptr
  %t291 = load i64, i64* %reg_113_ptr
  store i64 %t291, i64* %var_j_ptr
  br label %advance_b5
advance_b8:
  br label %advance_b3
advance_b9:
  %t292 = load i64, i64* %var_i_ptr
  store i64 %t292, i64* %reg_118_ptr
  %t293 = load i64, i64* %reg_118_ptr
  %t294 = load i64, i64* %reg_116_ptr
  %t295 = icmp slt i64 %t293, %t294
  %t296 = zext i1 %t295 to i64
  store i64 %t296, i64* %reg_119_ptr
  %t297 = load i64, i64* %reg_119_ptr
  %t299 = icmp ne i64 %t297, 0
  %t300 = zext i1 %t299 to i64
  %t298 = icmp ne i64 %t300, 0
  br i1 %t298, label %advance_b10, label %advance_b12
advance_b10:
  %t301 = load i8*, i8** %var_bodies_ptr
  store i8* %t301, i8** %reg_120_ptr
  %t302 = load i64, i64* %var_i_ptr
  store i64 %t302, i64* %reg_121_ptr
  %t303 = load i8*, i8** %reg_120_ptr
  %t304 = load i64, i64* %reg_121_ptr
  %t305 = call i8* @obo_mixed_list_get(i8* %t303, i64 %t304)
  store i8* %t305, i8** %reg_122_ptr
  %t306 = load i8*, i8** %reg_122_ptr
  store i8* %t306, i8** %var_bi_ptr
  %t307 = load i8*, i8** %var_bi_ptr
  store i8* %t307, i8** %reg_123_ptr
  %t308 = load i8*, i8** %reg_123_ptr
  %t309 = call i8* @obo_value_as_entity_ptr(i8* %t308)
  %t310 = getelementptr i8, i8* %t309, i64 40
  %t311 = bitcast i8* %t310 to double*
  %t312 = load double, double* %t311
  store double %t312, double* %reg_124_ptr
  %t313 = load double, double* %var_dt_ptr
  store double %t313, double* %reg_125_ptr
  %t314 = load i8*, i8** %var_bi_ptr
  store i8* %t314, i8** %reg_126_ptr
  %t315 = load i8*, i8** %reg_126_ptr
  %t316 = getelementptr i8, i8* %t309, i64 88
  %t317 = bitcast i8* %t316 to double*
  %t318 = load double, double* %t317
  store double %t318, double* %reg_127_ptr
  %t319 = load double, double* %reg_125_ptr
  %t320 = load double, double* %reg_127_ptr
  %t321 = fmul double %t319, %t320
  store double %t321, double* %reg_128_ptr
  %t322 = load double, double* %reg_124_ptr
  %t323 = load double, double* %reg_128_ptr
  %t324 = fadd double %t322, %t323
  store double %t324, double* %reg_129_ptr
  %t325 = load i8*, i8** %var_bi_ptr
  store i8* %t325, i8** %reg_130_ptr
  %t326 = load i8*, i8** %reg_130_ptr
  %t327 = load double, double* %reg_129_ptr
  %t328 = getelementptr i8, i8* %t309, i64 32
  store i8 5, i8* %t328
  %t329 = getelementptr i8, i8* %t309, i64 40
  %t330 = bitcast i8* %t329 to double*
  store double %t327, double* %t330
  %t331 = load i8*, i8** %var_bi_ptr
  store i8* %t331, i8** %reg_131_ptr
  %t332 = load i8*, i8** %reg_131_ptr
  %t333 = getelementptr i8, i8* %t309, i64 56
  %t334 = bitcast i8* %t333 to double*
  %t335 = load double, double* %t334
  store double %t335, double* %reg_132_ptr
  %t336 = load double, double* %var_dt_ptr
  store double %t336, double* %reg_133_ptr
  %t337 = load i8*, i8** %var_bi_ptr
  store i8* %t337, i8** %reg_134_ptr
  %t338 = load i8*, i8** %reg_134_ptr
  %t339 = getelementptr i8, i8* %t309, i64 104
  %t340 = bitcast i8* %t339 to double*
  %t341 = load double, double* %t340
  store double %t341, double* %reg_135_ptr
  %t342 = load double, double* %reg_133_ptr
  %t343 = load double, double* %reg_135_ptr
  %t344 = fmul double %t342, %t343
  store double %t344, double* %reg_136_ptr
  %t345 = load double, double* %reg_132_ptr
  %t346 = load double, double* %reg_136_ptr
  %t347 = fadd double %t345, %t346
  store double %t347, double* %reg_137_ptr
  %t348 = load i8*, i8** %var_bi_ptr
  store i8* %t348, i8** %reg_138_ptr
  %t349 = load i8*, i8** %reg_138_ptr
  %t350 = load double, double* %reg_137_ptr
  %t351 = getelementptr i8, i8* %t309, i64 48
  store i8 5, i8* %t351
  %t352 = getelementptr i8, i8* %t309, i64 56
  %t353 = bitcast i8* %t352 to double*
  store double %t350, double* %t353
  %t354 = load i8*, i8** %var_bi_ptr
  store i8* %t354, i8** %reg_139_ptr
  %t355 = load i8*, i8** %reg_139_ptr
  %t356 = getelementptr i8, i8* %t309, i64 72
  %t357 = bitcast i8* %t356 to double*
  %t358 = load double, double* %t357
  store double %t358, double* %reg_140_ptr
  %t359 = load double, double* %var_dt_ptr
  store double %t359, double* %reg_141_ptr
  %t360 = load i8*, i8** %var_bi_ptr
  store i8* %t360, i8** %reg_142_ptr
  %t361 = load i8*, i8** %reg_142_ptr
  %t362 = getelementptr i8, i8* %t309, i64 120
  %t363 = bitcast i8* %t362 to double*
  %t364 = load double, double* %t363
  store double %t364, double* %reg_143_ptr
  %t365 = load double, double* %reg_141_ptr
  %t366 = load double, double* %reg_143_ptr
  %t367 = fmul double %t365, %t366
  store double %t367, double* %reg_144_ptr
  %t368 = load double, double* %reg_140_ptr
  %t369 = load double, double* %reg_144_ptr
  %t370 = fadd double %t368, %t369
  store double %t370, double* %reg_145_ptr
  %t371 = load i8*, i8** %var_bi_ptr
  store i8* %t371, i8** %reg_146_ptr
  %t372 = load i8*, i8** %reg_146_ptr
  %t373 = load double, double* %reg_145_ptr
  %t374 = getelementptr i8, i8* %t309, i64 64
  store i8 5, i8* %t374
  %t375 = getelementptr i8, i8* %t309, i64 72
  %t376 = bitcast i8* %t375 to double*
  store double %t373, double* %t376
  br label %advance_b11
advance_b11:
  %t377 = load i64, i64* %var_i_ptr
  store i64 %t377, i64* %reg_147_ptr
  %t378 = load i64, i64* %reg_147_ptr
  %t379 = load i64, i64* %reg_117_ptr
  %t380 = add i64 %t378, %t379
  store i64 %t380, i64* %reg_148_ptr
  %t381 = load i64, i64* %reg_148_ptr
  store i64 %t381, i64* %var_i_ptr
  br label %advance_b9
advance_b12:
  call void @obo_gc_pop_roots(i64 21)
  ret i64 0
}

define double @energy(i8* %arg0, i64 %arg1) {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i64
  %reg_2_ptr = alloca i64
  %reg_3_ptr = alloca i64
  %reg_4_ptr = alloca i64
  %reg_5_ptr = alloca i64
  %reg_6_ptr = alloca i8*
  %reg_7_ptr = alloca i64
  %reg_8_ptr = alloca i8*
  %reg_9_ptr = alloca double
  %reg_10_ptr = alloca i8*
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca double
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca double
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca double
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca double
  %reg_32_ptr = alloca i64
  %reg_33_ptr = alloca i64
  %reg_34_ptr = alloca i64
  %reg_35_ptr = alloca i64
  %reg_36_ptr = alloca i64
  %reg_37_ptr = alloca i64
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca i64
  %reg_40_ptr = alloca i8*
  %reg_41_ptr = alloca i8*
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca i8*
  %reg_44_ptr = alloca double
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca i8*
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca i8*
  %reg_49_ptr = alloca double
  %reg_50_ptr = alloca double
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca double
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca double
  %reg_55_ptr = alloca double
  %reg_56_ptr = alloca double
  %reg_57_ptr = alloca double
  %reg_58_ptr = alloca double
  %reg_59_ptr = alloca double
  %reg_60_ptr = alloca double
  %reg_61_ptr = alloca double
  %reg_62_ptr = alloca double
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca double
  %reg_65_ptr = alloca double
  %reg_66_ptr = alloca double
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca i8*
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca double
  %reg_73_ptr = alloca double
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca double
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca i64
  %reg_78_ptr = alloca i64
  %reg_79_ptr = alloca i64
  %reg_80_ptr = alloca i64
  %reg_81_ptr = alloca double
  %var_nbodies_ptr = alloca i64
  %var_dz_ptr = alloca double
  %var_bi_ptr = alloca i8*
  %var_bodies_ptr = alloca i8*
  %var_dist_ptr = alloca double
  %var_i_ptr = alloca i64
  %var_dy_ptr = alloca double
  %var_e_ptr = alloca double
  %var_bj_ptr = alloca i8*
  %var_j_ptr = alloca i64
  %var_dx_ptr = alloca double
  store i8* %arg0, i8** %reg_0_ptr
  store i64 %arg1, i64* %reg_1_ptr
  call void @obo_gc_push_root(i8** %reg_69_ptr)
  call void @obo_gc_push_root(i8** %reg_71_ptr)
  call void @obo_gc_push_root(i8** %var_bi_ptr)
  call void @obo_gc_push_root(i8** %var_bodies_ptr)
  call void @obo_gc_push_root(i8** %var_bj_ptr)
  %t0 = load i8*, i8** %reg_0_ptr
  store i8* %t0, i8** %var_bodies_ptr
  %t1 = load i64, i64* %reg_1_ptr
  store i64 %t1, i64* %var_nbodies_ptr
  store double 0x0000000000000000, double* %var_e_ptr
  store i64 0, i64* %var_i_ptr
  %t2 = load i64, i64* %var_nbodies_ptr
  store i64 %t2, i64* %reg_2_ptr
  store i64 1, i64* %reg_3_ptr
  br label %energy_b1
energy_b1:
  %t3 = load i64, i64* %var_i_ptr
  store i64 %t3, i64* %reg_4_ptr
  %t4 = load i64, i64* %reg_4_ptr
  %t5 = load i64, i64* %reg_2_ptr
  %t6 = icmp slt i64 %t4, %t5
  %t7 = zext i1 %t6 to i64
  store i64 %t7, i64* %reg_5_ptr
  %t8 = load i64, i64* %reg_5_ptr
  %t10 = icmp ne i64 %t8, 0
  %t11 = zext i1 %t10 to i64
  %t9 = icmp ne i64 %t11, 0
  br i1 %t9, label %energy_b2, label %energy_b4
energy_b2:
  %t12 = load i8*, i8** %var_bodies_ptr
  store i8* %t12, i8** %reg_6_ptr
  %t13 = load i64, i64* %var_i_ptr
  store i64 %t13, i64* %reg_7_ptr
  %t14 = load i8*, i8** %reg_6_ptr
  %t15 = load i64, i64* %reg_7_ptr
  %t16 = call i8* @obo_mixed_list_get(i8* %t14, i64 %t15)
  store i8* %t16, i8** %reg_8_ptr
  %t17 = load i8*, i8** %reg_8_ptr
  store i8* %t17, i8** %var_bi_ptr
  %t18 = load double, double* %var_e_ptr
  store double %t18, double* %reg_9_ptr
  %t19 = load i8*, i8** %var_bi_ptr
  store i8* %t19, i8** %reg_10_ptr
  %t20 = load i8*, i8** %reg_10_ptr
  %t21 = call i8* @obo_value_as_entity_ptr(i8* %t20)
  %t22 = getelementptr i8, i8* %t21, i64 136
  %t23 = bitcast i8* %t22 to double*
  %t24 = load double, double* %t23
  store double %t24, double* %reg_11_ptr
  %t25 = load double, double* %reg_11_ptr
  %t26 = fmul double 0x3FE0000000000000, %t25
  store double %t26, double* %reg_12_ptr
  %t27 = load i8*, i8** %var_bi_ptr
  store i8* %t27, i8** %reg_13_ptr
  %t28 = load i8*, i8** %reg_13_ptr
  %t29 = getelementptr i8, i8* %t21, i64 88
  %t30 = bitcast i8* %t29 to double*
  %t31 = load double, double* %t30
  store double %t31, double* %reg_14_ptr
  %t32 = load i8*, i8** %var_bi_ptr
  store i8* %t32, i8** %reg_15_ptr
  %t33 = load i8*, i8** %reg_15_ptr
  %t34 = getelementptr i8, i8* %t21, i64 88
  %t35 = bitcast i8* %t34 to double*
  %t36 = load double, double* %t35
  store double %t36, double* %reg_16_ptr
  %t37 = load double, double* %reg_14_ptr
  %t38 = load double, double* %reg_16_ptr
  %t39 = fmul double %t37, %t38
  store double %t39, double* %reg_17_ptr
  %t40 = load i8*, i8** %var_bi_ptr
  store i8* %t40, i8** %reg_18_ptr
  %t41 = load i8*, i8** %reg_18_ptr
  %t42 = getelementptr i8, i8* %t21, i64 104
  %t43 = bitcast i8* %t42 to double*
  %t44 = load double, double* %t43
  store double %t44, double* %reg_19_ptr
  %t45 = load i8*, i8** %var_bi_ptr
  store i8* %t45, i8** %reg_20_ptr
  %t46 = load i8*, i8** %reg_20_ptr
  %t47 = getelementptr i8, i8* %t21, i64 104
  %t48 = bitcast i8* %t47 to double*
  %t49 = load double, double* %t48
  store double %t49, double* %reg_21_ptr
  %t50 = load double, double* %reg_19_ptr
  %t51 = load double, double* %reg_21_ptr
  %t52 = fmul double %t50, %t51
  store double %t52, double* %reg_22_ptr
  %t53 = load double, double* %reg_17_ptr
  %t54 = load double, double* %reg_22_ptr
  %t55 = fadd double %t53, %t54
  store double %t55, double* %reg_23_ptr
  %t56 = load i8*, i8** %var_bi_ptr
  store i8* %t56, i8** %reg_24_ptr
  %t57 = load i8*, i8** %reg_24_ptr
  %t58 = getelementptr i8, i8* %t21, i64 120
  %t59 = bitcast i8* %t58 to double*
  %t60 = load double, double* %t59
  store double %t60, double* %reg_25_ptr
  %t61 = load i8*, i8** %var_bi_ptr
  store i8* %t61, i8** %reg_26_ptr
  %t62 = load i8*, i8** %reg_26_ptr
  %t63 = getelementptr i8, i8* %t21, i64 120
  %t64 = bitcast i8* %t63 to double*
  %t65 = load double, double* %t64
  store double %t65, double* %reg_27_ptr
  %t66 = load double, double* %reg_25_ptr
  %t67 = load double, double* %reg_27_ptr
  %t68 = fmul double %t66, %t67
  store double %t68, double* %reg_28_ptr
  %t69 = load double, double* %reg_23_ptr
  %t70 = load double, double* %reg_28_ptr
  %t71 = fadd double %t69, %t70
  store double %t71, double* %reg_29_ptr
  %t72 = load double, double* %reg_12_ptr
  %t73 = load double, double* %reg_29_ptr
  %t74 = fmul double %t72, %t73
  store double %t74, double* %reg_30_ptr
  %t75 = load double, double* %reg_9_ptr
  %t76 = load double, double* %reg_30_ptr
  %t77 = fadd double %t75, %t76
  store double %t77, double* %reg_31_ptr
  %t78 = load double, double* %reg_31_ptr
  store double %t78, double* %var_e_ptr
  %t79 = load i64, i64* %var_i_ptr
  store i64 %t79, i64* %reg_32_ptr
  %t80 = load i64, i64* %reg_32_ptr
  %t81 = add i64 %t80, 1
  store i64 %t81, i64* %reg_33_ptr
  %t82 = load i64, i64* %reg_33_ptr
  store i64 %t82, i64* %var_j_ptr
  %t83 = load i64, i64* %var_nbodies_ptr
  store i64 %t83, i64* %reg_34_ptr
  store i64 1, i64* %reg_35_ptr
  br label %energy_b5
energy_b3:
  %t84 = load i64, i64* %var_i_ptr
  store i64 %t84, i64* %reg_79_ptr
  %t85 = load i64, i64* %reg_79_ptr
  %t86 = load i64, i64* %reg_3_ptr
  %t87 = add i64 %t85, %t86
  store i64 %t87, i64* %reg_80_ptr
  %t88 = load i64, i64* %reg_80_ptr
  store i64 %t88, i64* %var_i_ptr
  br label %energy_b1
energy_b4:
  %t89 = load double, double* %var_e_ptr
  store double %t89, double* %reg_81_ptr
  %t90 = load double, double* %reg_81_ptr
  call void @obo_gc_pop_roots(i64 5)
  ret double %t90
energy_b5:
  %t91 = load i64, i64* %var_j_ptr
  store i64 %t91, i64* %reg_36_ptr
  %t92 = load i64, i64* %reg_36_ptr
  %t93 = load i64, i64* %reg_34_ptr
  %t94 = icmp slt i64 %t92, %t93
  %t95 = zext i1 %t94 to i64
  store i64 %t95, i64* %reg_37_ptr
  %t96 = load i64, i64* %reg_37_ptr
  %t98 = icmp ne i64 %t96, 0
  %t99 = zext i1 %t98 to i64
  %t97 = icmp ne i64 %t99, 0
  br i1 %t97, label %energy_b6, label %energy_b8
energy_b6:
  %t100 = load i8*, i8** %var_bodies_ptr
  store i8* %t100, i8** %reg_38_ptr
  %t101 = load i64, i64* %var_j_ptr
  store i64 %t101, i64* %reg_39_ptr
  %t102 = load i8*, i8** %reg_38_ptr
  %t103 = load i64, i64* %reg_39_ptr
  %t104 = call i8* @obo_mixed_list_get(i8* %t102, i64 %t103)
  store i8* %t104, i8** %reg_40_ptr
  %t105 = load i8*, i8** %reg_40_ptr
  store i8* %t105, i8** %var_bj_ptr
  %t106 = load i8*, i8** %var_bi_ptr
  store i8* %t106, i8** %reg_41_ptr
  %t107 = load i8*, i8** %reg_41_ptr
  %t108 = call i8* @obo_value_as_entity_ptr(i8* %t107)
  %t109 = getelementptr i8, i8* %t108, i64 40
  %t110 = bitcast i8* %t109 to double*
  %t111 = load double, double* %t110
  store double %t111, double* %reg_42_ptr
  %t112 = load i8*, i8** %var_bj_ptr
  store i8* %t112, i8** %reg_43_ptr
  %t113 = load i8*, i8** %reg_43_ptr
  %t114 = call i8* @obo_value_as_entity_ptr(i8* %t113)
  %t115 = getelementptr i8, i8* %t114, i64 40
  %t116 = bitcast i8* %t115 to double*
  %t117 = load double, double* %t116
  store double %t117, double* %reg_44_ptr
  %t118 = load double, double* %reg_42_ptr
  %t119 = load double, double* %reg_44_ptr
  %t120 = fsub double %t118, %t119
  store double %t120, double* %reg_45_ptr
  %t121 = load double, double* %reg_45_ptr
  store double %t121, double* %var_dx_ptr
  %t122 = load i8*, i8** %var_bi_ptr
  store i8* %t122, i8** %reg_46_ptr
  %t123 = load i8*, i8** %reg_46_ptr
  %t124 = getelementptr i8, i8* %t108, i64 56
  %t125 = bitcast i8* %t124 to double*
  %t126 = load double, double* %t125
  store double %t126, double* %reg_47_ptr
  %t127 = load i8*, i8** %var_bj_ptr
  store i8* %t127, i8** %reg_48_ptr
  %t128 = load i8*, i8** %reg_48_ptr
  %t129 = getelementptr i8, i8* %t114, i64 56
  %t130 = bitcast i8* %t129 to double*
  %t131 = load double, double* %t130
  store double %t131, double* %reg_49_ptr
  %t132 = load double, double* %reg_47_ptr
  %t133 = load double, double* %reg_49_ptr
  %t134 = fsub double %t132, %t133
  store double %t134, double* %reg_50_ptr
  %t135 = load double, double* %reg_50_ptr
  store double %t135, double* %var_dy_ptr
  %t136 = load i8*, i8** %var_bi_ptr
  store i8* %t136, i8** %reg_51_ptr
  %t137 = load i8*, i8** %reg_51_ptr
  %t138 = getelementptr i8, i8* %t108, i64 72
  %t139 = bitcast i8* %t138 to double*
  %t140 = load double, double* %t139
  store double %t140, double* %reg_52_ptr
  %t141 = load i8*, i8** %var_bj_ptr
  store i8* %t141, i8** %reg_53_ptr
  %t142 = load i8*, i8** %reg_53_ptr
  %t143 = getelementptr i8, i8* %t114, i64 72
  %t144 = bitcast i8* %t143 to double*
  %t145 = load double, double* %t144
  store double %t145, double* %reg_54_ptr
  %t146 = load double, double* %reg_52_ptr
  %t147 = load double, double* %reg_54_ptr
  %t148 = fsub double %t146, %t147
  store double %t148, double* %reg_55_ptr
  %t149 = load double, double* %reg_55_ptr
  store double %t149, double* %var_dz_ptr
  %t150 = load double, double* %var_dx_ptr
  store double %t150, double* %reg_56_ptr
  %t151 = load double, double* %var_dx_ptr
  store double %t151, double* %reg_57_ptr
  %t152 = load double, double* %reg_56_ptr
  %t153 = load double, double* %reg_57_ptr
  %t154 = fmul double %t152, %t153
  store double %t154, double* %reg_58_ptr
  %t155 = load double, double* %var_dy_ptr
  store double %t155, double* %reg_59_ptr
  %t156 = load double, double* %var_dy_ptr
  store double %t156, double* %reg_60_ptr
  %t157 = load double, double* %reg_59_ptr
  %t158 = load double, double* %reg_60_ptr
  %t159 = fmul double %t157, %t158
  store double %t159, double* %reg_61_ptr
  %t160 = load double, double* %reg_58_ptr
  %t161 = load double, double* %reg_61_ptr
  %t162 = fadd double %t160, %t161
  store double %t162, double* %reg_62_ptr
  %t163 = load double, double* %var_dz_ptr
  store double %t163, double* %reg_63_ptr
  %t164 = load double, double* %var_dz_ptr
  store double %t164, double* %reg_64_ptr
  %t165 = load double, double* %reg_63_ptr
  %t166 = load double, double* %reg_64_ptr
  %t167 = fmul double %t165, %t166
  store double %t167, double* %reg_65_ptr
  %t168 = load double, double* %reg_62_ptr
  %t169 = load double, double* %reg_65_ptr
  %t170 = fadd double %t168, %t169
  store double %t170, double* %reg_66_ptr
  %t171 = load double, double* %reg_66_ptr
  %t172 = call double @__sys_Math_sqrt(double %t171)
  store double %t172, double* %reg_67_ptr
  %t173 = load double, double* %reg_67_ptr
  store double %t173, double* %var_dist_ptr
  %t174 = load double, double* %var_e_ptr
  store double %t174, double* %reg_68_ptr
  %t175 = load i8*, i8** %var_bi_ptr
  store i8* %t175, i8** %reg_69_ptr
  %t176 = load i8*, i8** %reg_69_ptr
  %t177 = getelementptr i8, i8* %t108, i64 136
  %t178 = bitcast i8* %t177 to double*
  %t179 = load double, double* %t178
  store double %t179, double* %reg_70_ptr
  %t180 = load i8*, i8** %var_bj_ptr
  store i8* %t180, i8** %reg_71_ptr
  %t181 = load i8*, i8** %reg_71_ptr
  %t182 = getelementptr i8, i8* %t114, i64 136
  %t183 = bitcast i8* %t182 to double*
  %t184 = load double, double* %t183
  store double %t184, double* %reg_72_ptr
  %t185 = load double, double* %reg_70_ptr
  %t186 = load double, double* %reg_72_ptr
  %t187 = fmul double %t185, %t186
  store double %t187, double* %reg_73_ptr
  %t188 = load double, double* %var_dist_ptr
  store double %t188, double* %reg_74_ptr
  %t189 = load double, double* %reg_73_ptr
  %t190 = load double, double* %reg_74_ptr
  %t191 = fdiv double %t189, %t190
  store double %t191, double* %reg_75_ptr
  %t192 = load double, double* %reg_68_ptr
  %t193 = load double, double* %reg_75_ptr
  %t194 = fsub double %t192, %t193
  store double %t194, double* %reg_76_ptr
  %t195 = load double, double* %reg_76_ptr
  store double %t195, double* %var_e_ptr
  br label %energy_b7
energy_b7:
  %t196 = load i64, i64* %var_j_ptr
  store i64 %t196, i64* %reg_77_ptr
  %t197 = load i64, i64* %reg_77_ptr
  %t198 = load i64, i64* %reg_35_ptr
  %t199 = add i64 %t197, %t198
  store i64 %t199, i64* %reg_78_ptr
  %t200 = load i64, i64* %reg_78_ptr
  store i64 %t200, i64* %var_j_ptr
  br label %energy_b5
energy_b8:
  br label %energy_b3
}

define i32 @main() {
entry:
  %reg_0_ptr = alloca double
  %reg_1_ptr = alloca double
  %reg_2_ptr = alloca double
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca double
  %reg_5_ptr = alloca double
  %reg_6_ptr = alloca double
  %reg_7_ptr = alloca double
  %reg_8_ptr = alloca double
  %reg_9_ptr = alloca double
  %reg_10_ptr = alloca double
  %reg_11_ptr = alloca double
  %reg_12_ptr = alloca double
  %reg_13_ptr = alloca double
  %reg_14_ptr = alloca double
  %reg_15_ptr = alloca i8*
  %reg_16_ptr = alloca double
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca double
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca double
  %reg_21_ptr = alloca double
  %reg_22_ptr = alloca double
  %reg_23_ptr = alloca double
  %reg_24_ptr = alloca double
  %reg_25_ptr = alloca double
  %reg_26_ptr = alloca i8*
  %reg_27_ptr = alloca double
  %reg_28_ptr = alloca double
  %reg_29_ptr = alloca double
  %reg_30_ptr = alloca double
  %reg_31_ptr = alloca double
  %reg_32_ptr = alloca double
  %reg_33_ptr = alloca double
  %reg_34_ptr = alloca double
  %reg_35_ptr = alloca double
  %reg_36_ptr = alloca double
  %reg_37_ptr = alloca double
  %reg_38_ptr = alloca i8*
  %reg_39_ptr = alloca double
  %reg_40_ptr = alloca double
  %reg_41_ptr = alloca double
  %reg_42_ptr = alloca double
  %reg_43_ptr = alloca double
  %reg_44_ptr = alloca double
  %reg_45_ptr = alloca double
  %reg_46_ptr = alloca double
  %reg_47_ptr = alloca double
  %reg_48_ptr = alloca double
  %reg_49_ptr = alloca i8*
  %reg_50_ptr = alloca i8*
  %reg_51_ptr = alloca i8*
  %reg_52_ptr = alloca i8*
  %reg_53_ptr = alloca i8*
  %reg_54_ptr = alloca i8*
  %reg_55_ptr = alloca i8*
  %reg_56_ptr = alloca i64
  %reg_57_ptr = alloca i64
  %reg_58_ptr = alloca i64
  %reg_59_ptr = alloca i64
  %reg_60_ptr = alloca i8*
  %reg_61_ptr = alloca i64
  %reg_62_ptr = alloca i8*
  %reg_63_ptr = alloca double
  %reg_64_ptr = alloca i8*
  %reg_65_ptr = alloca double
  %reg_66_ptr = alloca i8*
  %reg_67_ptr = alloca double
  %reg_68_ptr = alloca double
  %reg_69_ptr = alloca double
  %reg_70_ptr = alloca double
  %reg_71_ptr = alloca i8*
  %reg_72_ptr = alloca double
  %reg_73_ptr = alloca i8*
  %reg_74_ptr = alloca double
  %reg_75_ptr = alloca double
  %reg_76_ptr = alloca double
  %reg_77_ptr = alloca double
  %reg_78_ptr = alloca i8*
  %reg_79_ptr = alloca double
  %reg_80_ptr = alloca i8*
  %reg_81_ptr = alloca double
  %reg_82_ptr = alloca double
  %reg_83_ptr = alloca double
  %reg_84_ptr = alloca i64
  %reg_85_ptr = alloca i64
  %reg_86_ptr = alloca double
  %reg_87_ptr = alloca double
  %reg_88_ptr = alloca double
  %reg_89_ptr = alloca double
  %reg_90_ptr = alloca i8*
  %reg_91_ptr = alloca double
  %reg_92_ptr = alloca double
  %reg_93_ptr = alloca double
  %reg_94_ptr = alloca double
  %reg_95_ptr = alloca i8*
  %reg_96_ptr = alloca double
  %reg_97_ptr = alloca double
  %reg_98_ptr = alloca double
  %reg_99_ptr = alloca double
  %reg_100_ptr = alloca i8*
  %reg_101_ptr = alloca i8*
  %reg_102_ptr = alloca i64
  %reg_103_ptr = alloca double
  %reg_104_ptr = alloca i64
  %reg_105_ptr = alloca i64
  %reg_106_ptr = alloca i64
  %reg_107_ptr = alloca i64
  %reg_108_ptr = alloca i8*
  %reg_109_ptr = alloca i64
  %reg_110_ptr = alloca i64
  %reg_111_ptr = alloca i64
  %reg_112_ptr = alloca i64
  %reg_113_ptr = alloca i8*
  %reg_114_ptr = alloca i64
  %reg_115_ptr = alloca double
  %var_neptune_ptr = alloca i8*
  %var_days_per_year_ptr = alloca double
  %var_px_ptr = alloca double
  %var_n_ptr = alloca i64
  %var_saturn_ptr = alloca i8*
  %var_bodies_ptr = alloca i8*
  %var_solar_mass_ptr = alloca double
  %var_py_ptr = alloca double
  %var_b_ptr = alloca i8*
  %var_sun_ptr = alloca i8*
  %var_nbodies_ptr = alloca i64
  %var_pz_ptr = alloca double
  %var_uranus_ptr = alloca i8*
  %var_jupiter_ptr = alloca i8*
  %var_i_ptr = alloca i64
  call void @obo_gc_push_root(i8** %var_neptune_ptr)
  call void @obo_gc_push_root(i8** %var_saturn_ptr)
  call void @obo_gc_push_root(i8** %var_bodies_ptr)
  call void @obo_gc_push_root(i8** %var_b_ptr)
  call void @obo_gc_push_root(i8** %var_sun_ptr)
  call void @obo_gc_push_root(i8** %var_uranus_ptr)
  call void @obo_gc_push_root(i8** %var_jupiter_ptr)
  %t0 = fmul double 0x4010000000000000, 0x400921FB54442D18
  store double %t0, double* %reg_0_ptr
  %t1 = load double, double* %reg_0_ptr
  %t2 = fmul double %t1, 0x400921FB54442D18
  store double %t2, double* %reg_1_ptr
  %t3 = load double, double* %reg_1_ptr
  store double %t3, double* %var_solar_mass_ptr
  store double 0x4076D3D70A3D70A4, double* %var_days_per_year_ptr
  %t4 = load double, double* %var_solar_mass_ptr
  store double %t4, double* %reg_2_ptr
  %t5 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t5, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t5, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t6 = getelementptr i8, i8* %t5, i64 32
  store i8 5, i8* %t6
  %t7 = getelementptr i8, i8* %t5, i64 40
  %t8 = bitcast i8* %t7 to double*
  store double 0x0000000000000000, double* %t8
  %t9 = getelementptr i8, i8* %t5, i64 48
  store i8 5, i8* %t9
  %t10 = getelementptr i8, i8* %t5, i64 56
  %t11 = bitcast i8* %t10 to double*
  store double 0x0000000000000000, double* %t11
  %t12 = getelementptr i8, i8* %t5, i64 64
  store i8 5, i8* %t12
  %t13 = getelementptr i8, i8* %t5, i64 72
  %t14 = bitcast i8* %t13 to double*
  store double 0x0000000000000000, double* %t14
  %t15 = getelementptr i8, i8* %t5, i64 80
  store i8 5, i8* %t15
  %t16 = getelementptr i8, i8* %t5, i64 88
  %t17 = bitcast i8* %t16 to double*
  store double 0x0000000000000000, double* %t17
  %t18 = getelementptr i8, i8* %t5, i64 96
  store i8 5, i8* %t18
  %t19 = getelementptr i8, i8* %t5, i64 104
  %t20 = bitcast i8* %t19 to double*
  store double 0x0000000000000000, double* %t20
  %t21 = getelementptr i8, i8* %t5, i64 112
  store i8 5, i8* %t21
  %t22 = getelementptr i8, i8* %t5, i64 120
  %t23 = bitcast i8* %t22 to double*
  store double 0x0000000000000000, double* %t23
  %t24 = load double, double* %reg_2_ptr
  %t25 = getelementptr i8, i8* %t5, i64 128
  store i8 5, i8* %t25
  %t26 = getelementptr i8, i8* %t5, i64 136
  %t27 = bitcast i8* %t26 to double*
  store double %t24, double* %t27
  store i8* %t5, i8** %reg_3_ptr
  %t28 = load i8*, i8** %reg_3_ptr
  store i8* %t28, i8** %var_sun_ptr
  %t29 = fsub double 0.0, 0x3FF290ABC01FDB7C
  store double %t29, double* %reg_4_ptr
  %t30 = fsub double 0.0, 0x3FBA86F96C25EBF0
  store double %t30, double* %reg_5_ptr
  %t31 = load double, double* %var_days_per_year_ptr
  store double %t31, double* %reg_6_ptr
  %t32 = load double, double* %reg_6_ptr
  %t33 = fmul double 0x3F5B32DDB8EC9209, %t32
  store double %t33, double* %reg_7_ptr
  %t34 = load double, double* %var_days_per_year_ptr
  store double %t34, double* %reg_8_ptr
  %t35 = load double, double* %reg_8_ptr
  %t36 = fmul double 0x3F7F88FF93F670B6, %t35
  store double %t36, double* %reg_9_ptr
  %t37 = fsub double 0.0, 0x3F12199946DEBD80
  store double %t37, double* %reg_10_ptr
  %t38 = load double, double* %var_days_per_year_ptr
  store double %t38, double* %reg_11_ptr
  %t39 = load double, double* %reg_10_ptr
  %t40 = load double, double* %reg_11_ptr
  %t41 = fmul double %t39, %t40
  store double %t41, double* %reg_12_ptr
  %t42 = load double, double* %var_solar_mass_ptr
  store double %t42, double* %reg_13_ptr
  %t43 = load double, double* %reg_13_ptr
  %t44 = fmul double 0x3F4F49601333C135, %t43
  store double %t44, double* %reg_14_ptr
  %t45 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t45, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t45, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t46 = getelementptr i8, i8* %t45, i64 32
  store i8 5, i8* %t46
  %t47 = getelementptr i8, i8* %t45, i64 40
  %t48 = bitcast i8* %t47 to double*
  store double 0x40135DA0343CD92C, double* %t48
  %t49 = load double, double* %reg_4_ptr
  %t50 = getelementptr i8, i8* %t45, i64 48
  store i8 5, i8* %t50
  %t51 = getelementptr i8, i8* %t45, i64 56
  %t52 = bitcast i8* %t51 to double*
  store double %t49, double* %t52
  %t53 = load double, double* %reg_5_ptr
  %t54 = getelementptr i8, i8* %t45, i64 64
  store i8 5, i8* %t54
  %t55 = getelementptr i8, i8* %t45, i64 72
  %t56 = bitcast i8* %t55 to double*
  store double %t53, double* %t56
  %t57 = load double, double* %reg_7_ptr
  %t58 = getelementptr i8, i8* %t45, i64 80
  store i8 5, i8* %t58
  %t59 = getelementptr i8, i8* %t45, i64 88
  %t60 = bitcast i8* %t59 to double*
  store double %t57, double* %t60
  %t61 = load double, double* %reg_9_ptr
  %t62 = getelementptr i8, i8* %t45, i64 96
  store i8 5, i8* %t62
  %t63 = getelementptr i8, i8* %t45, i64 104
  %t64 = bitcast i8* %t63 to double*
  store double %t61, double* %t64
  %t65 = load double, double* %reg_12_ptr
  %t66 = getelementptr i8, i8* %t45, i64 112
  store i8 5, i8* %t66
  %t67 = getelementptr i8, i8* %t45, i64 120
  %t68 = bitcast i8* %t67 to double*
  store double %t65, double* %t68
  %t69 = load double, double* %reg_14_ptr
  %t70 = getelementptr i8, i8* %t45, i64 128
  store i8 5, i8* %t70
  %t71 = getelementptr i8, i8* %t45, i64 136
  %t72 = bitcast i8* %t71 to double*
  store double %t69, double* %t72
  store i8* %t45, i8** %reg_15_ptr
  %t73 = load i8*, i8** %reg_15_ptr
  store i8* %t73, i8** %var_jupiter_ptr
  %t74 = fsub double 0.0, 0x3FD9D353E1EB467C
  store double %t74, double* %reg_16_ptr
  %t75 = fsub double 0.0, 0x3F66ABB60A8E1D76
  store double %t75, double* %reg_17_ptr
  %t76 = load double, double* %var_days_per_year_ptr
  store double %t76, double* %reg_18_ptr
  %t77 = load double, double* %reg_17_ptr
  %t78 = load double, double* %reg_18_ptr
  %t79 = fmul double %t77, %t78
  store double %t79, double* %reg_19_ptr
  %t80 = load double, double* %var_days_per_year_ptr
  store double %t80, double* %reg_20_ptr
  %t81 = load double, double* %reg_20_ptr
  %t82 = fmul double 0x3F747956257578B8, %t81
  store double %t82, double* %reg_21_ptr
  %t83 = load double, double* %var_days_per_year_ptr
  store double %t83, double* %reg_22_ptr
  %t84 = load double, double* %reg_22_ptr
  %t85 = fmul double 0x3EF829379CAD4AC0, %t84
  store double %t85, double* %reg_23_ptr
  %t86 = load double, double* %var_solar_mass_ptr
  store double %t86, double* %reg_24_ptr
  %t87 = load double, double* %reg_24_ptr
  %t88 = fmul double 0x3F32BC5EEFF5E6F8, %t87
  store double %t88, double* %reg_25_ptr
  %t89 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t89, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t89, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t90 = getelementptr i8, i8* %t89, i64 32
  store i8 5, i8* %t90
  %t91 = getelementptr i8, i8* %t89, i64 40
  %t92 = bitcast i8* %t91 to double*
  store double 0x4020AFCDC332CA67, double* %t92
  %t93 = getelementptr i8, i8* %t89, i64 48
  store i8 5, i8* %t93
  %t94 = getelementptr i8, i8* %t89, i64 56
  %t95 = bitcast i8* %t94 to double*
  store double 0x40107FCB31DE01B0, double* %t95
  %t96 = load double, double* %reg_16_ptr
  %t97 = getelementptr i8, i8* %t89, i64 64
  store i8 5, i8* %t97
  %t98 = getelementptr i8, i8* %t89, i64 72
  %t99 = bitcast i8* %t98 to double*
  store double %t96, double* %t99
  %t100 = load double, double* %reg_19_ptr
  %t101 = getelementptr i8, i8* %t89, i64 80
  store i8 5, i8* %t101
  %t102 = getelementptr i8, i8* %t89, i64 88
  %t103 = bitcast i8* %t102 to double*
  store double %t100, double* %t103
  %t104 = load double, double* %reg_21_ptr
  %t105 = getelementptr i8, i8* %t89, i64 96
  store i8 5, i8* %t105
  %t106 = getelementptr i8, i8* %t89, i64 104
  %t107 = bitcast i8* %t106 to double*
  store double %t104, double* %t107
  %t108 = load double, double* %reg_23_ptr
  %t109 = getelementptr i8, i8* %t89, i64 112
  store i8 5, i8* %t109
  %t110 = getelementptr i8, i8* %t89, i64 120
  %t111 = bitcast i8* %t110 to double*
  store double %t108, double* %t111
  %t112 = load double, double* %reg_25_ptr
  %t113 = getelementptr i8, i8* %t89, i64 128
  store i8 5, i8* %t113
  %t114 = getelementptr i8, i8* %t89, i64 136
  %t115 = bitcast i8* %t114 to double*
  store double %t112, double* %t115
  store i8* %t89, i8** %reg_26_ptr
  %t116 = load i8*, i8** %reg_26_ptr
  store i8* %t116, i8** %var_saturn_ptr
  %t117 = fsub double 0.0, 0x402E38E8D626667E
  store double %t117, double* %reg_27_ptr
  %t118 = fsub double 0.0, 0x3FCC9557BE257DA0
  store double %t118, double* %reg_28_ptr
  %t119 = load double, double* %var_days_per_year_ptr
  store double %t119, double* %reg_29_ptr
  %t120 = load double, double* %reg_29_ptr
  %t121 = fmul double 0x3F6849383E87D954, %t120
  store double %t121, double* %reg_30_ptr
  %t122 = load double, double* %var_days_per_year_ptr
  store double %t122, double* %reg_31_ptr
  %t123 = load double, double* %reg_31_ptr
  %t124 = fmul double 0x3F637C044AC0ACE1, %t123
  store double %t124, double* %reg_32_ptr
  %t125 = fsub double 0.0, 0x3EFF1983FEDBFAA0
  store double %t125, double* %reg_33_ptr
  %t126 = load double, double* %var_days_per_year_ptr
  store double %t126, double* %reg_34_ptr
  %t127 = load double, double* %reg_33_ptr
  %t128 = load double, double* %reg_34_ptr
  %t129 = fmul double %t127, %t128
  store double %t129, double* %reg_35_ptr
  %t130 = load double, double* %var_solar_mass_ptr
  store double %t130, double* %reg_36_ptr
  %t131 = load double, double* %reg_36_ptr
  %t132 = fmul double 0x3F06E44607A13BD6, %t131
  store double %t132, double* %reg_37_ptr
  %t133 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t133, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t133, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t134 = getelementptr i8, i8* %t133, i64 32
  store i8 5, i8* %t134
  %t135 = getelementptr i8, i8* %t133, i64 40
  %t136 = bitcast i8* %t135 to double*
  store double 0x4029C9EACEA7D9CF, double* %t136
  %t137 = load double, double* %reg_27_ptr
  %t138 = getelementptr i8, i8* %t133, i64 48
  store i8 5, i8* %t138
  %t139 = getelementptr i8, i8* %t133, i64 56
  %t140 = bitcast i8* %t139 to double*
  store double %t137, double* %t140
  %t141 = load double, double* %reg_28_ptr
  %t142 = getelementptr i8, i8* %t133, i64 64
  store i8 5, i8* %t142
  %t143 = getelementptr i8, i8* %t133, i64 72
  %t144 = bitcast i8* %t143 to double*
  store double %t141, double* %t144
  %t145 = load double, double* %reg_30_ptr
  %t146 = getelementptr i8, i8* %t133, i64 80
  store i8 5, i8* %t146
  %t147 = getelementptr i8, i8* %t133, i64 88
  %t148 = bitcast i8* %t147 to double*
  store double %t145, double* %t148
  %t149 = load double, double* %reg_32_ptr
  %t150 = getelementptr i8, i8* %t133, i64 96
  store i8 5, i8* %t150
  %t151 = getelementptr i8, i8* %t133, i64 104
  %t152 = bitcast i8* %t151 to double*
  store double %t149, double* %t152
  %t153 = load double, double* %reg_35_ptr
  %t154 = getelementptr i8, i8* %t133, i64 112
  store i8 5, i8* %t154
  %t155 = getelementptr i8, i8* %t133, i64 120
  %t156 = bitcast i8* %t155 to double*
  store double %t153, double* %t156
  %t157 = load double, double* %reg_37_ptr
  %t158 = getelementptr i8, i8* %t133, i64 128
  store i8 5, i8* %t158
  %t159 = getelementptr i8, i8* %t133, i64 136
  %t160 = bitcast i8* %t159 to double*
  store double %t157, double* %t160
  store i8* %t133, i8** %reg_38_ptr
  %t161 = load i8*, i8** %reg_38_ptr
  store i8* %t161, i8** %var_uranus_ptr
  %t162 = fsub double 0.0, 0x4039EB5833C8A220
  store double %t162, double* %reg_39_ptr
  %t163 = load double, double* %var_days_per_year_ptr
  store double %t163, double* %reg_40_ptr
  %t164 = load double, double* %reg_40_ptr
  %t165 = fmul double 0x3F65F5C9E51B4320, %t164
  store double %t165, double* %reg_41_ptr
  %t166 = load double, double* %var_days_per_year_ptr
  store double %t166, double* %reg_42_ptr
  %t167 = load double, double* %reg_42_ptr
  %t168 = fmul double 0x3F5AAD5736999D88, %t167
  store double %t168, double* %reg_43_ptr
  %t169 = fsub double 0.0, 0x3F18F2070B7F9750
  store double %t169, double* %reg_44_ptr
  %t170 = load double, double* %var_days_per_year_ptr
  store double %t170, double* %reg_45_ptr
  %t171 = load double, double* %reg_44_ptr
  %t172 = load double, double* %reg_45_ptr
  %t173 = fmul double %t171, %t172
  store double %t173, double* %reg_46_ptr
  %t174 = load double, double* %var_solar_mass_ptr
  store double %t174, double* %reg_47_ptr
  %t175 = load double, double* %reg_47_ptr
  %t176 = fmul double 0x3F0B0213CA2D0EEC, %t175
  store double %t176, double* %reg_48_ptr
  %t177 = call i8* @obo_entity_new_slotted(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.7, i64 0, i64 0), i32 7)
  call void @obo_entity_set_field_name(i8* %t177, i32 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.0, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.1, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.2, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.3, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.5, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 5, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @obo.str.6, i64 0, i64 0))
  call void @obo_entity_set_field_name(i8* %t177, i32 6, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @obo.str.4, i64 0, i64 0))
  %t178 = getelementptr i8, i8* %t177, i64 32
  store i8 5, i8* %t178
  %t179 = getelementptr i8, i8* %t177, i64 40
  %t180 = bitcast i8* %t179 to double*
  store double 0x402EC267A905572A, double* %t180
  %t181 = load double, double* %reg_39_ptr
  %t182 = getelementptr i8, i8* %t177, i64 48
  store i8 5, i8* %t182
  %t183 = getelementptr i8, i8* %t177, i64 56
  %t184 = bitcast i8* %t183 to double*
  store double %t181, double* %t184
  %t185 = getelementptr i8, i8* %t177, i64 64
  store i8 5, i8* %t185
  %t186 = getelementptr i8, i8* %t177, i64 72
  %t187 = bitcast i8* %t186 to double*
  store double 0x3FC6F1F393ABE540, double* %t187
  %t188 = load double, double* %reg_41_ptr
  %t189 = getelementptr i8, i8* %t177, i64 80
  store i8 5, i8* %t189
  %t190 = getelementptr i8, i8* %t177, i64 88
  %t191 = bitcast i8* %t190 to double*
  store double %t188, double* %t191
  %t192 = load double, double* %reg_43_ptr
  %t193 = getelementptr i8, i8* %t177, i64 96
  store i8 5, i8* %t193
  %t194 = getelementptr i8, i8* %t177, i64 104
  %t195 = bitcast i8* %t194 to double*
  store double %t192, double* %t195
  %t196 = load double, double* %reg_46_ptr
  %t197 = getelementptr i8, i8* %t177, i64 112
  store i8 5, i8* %t197
  %t198 = getelementptr i8, i8* %t177, i64 120
  %t199 = bitcast i8* %t198 to double*
  store double %t196, double* %t199
  %t200 = load double, double* %reg_48_ptr
  %t201 = getelementptr i8, i8* %t177, i64 128
  store i8 5, i8* %t201
  %t202 = getelementptr i8, i8* %t177, i64 136
  %t203 = bitcast i8* %t202 to double*
  store double %t200, double* %t203
  store i8* %t177, i8** %reg_49_ptr
  %t204 = load i8*, i8** %reg_49_ptr
  store i8* %t204, i8** %var_neptune_ptr
  %t205 = load i8*, i8** %var_sun_ptr
  store i8* %t205, i8** %reg_50_ptr
  %t206 = load i8*, i8** %var_jupiter_ptr
  store i8* %t206, i8** %reg_51_ptr
  %t207 = load i8*, i8** %var_saturn_ptr
  store i8* %t207, i8** %reg_52_ptr
  %t208 = load i8*, i8** %var_uranus_ptr
  store i8* %t208, i8** %reg_53_ptr
  %t209 = load i8*, i8** %var_neptune_ptr
  store i8* %t209, i8** %reg_54_ptr
  %t210 = call i8* @obo_mixed_list_new(i64 5)
  %t211 = load i8*, i8** %reg_50_ptr
  %t212 = call i8* @obo_box_entity(i8* %t211)
  call void @obo_mixed_list_set(i8* %t210, i64 0, i8* %t212)
  %t213 = load i8*, i8** %reg_51_ptr
  %t214 = call i8* @obo_box_entity(i8* %t213)
  call void @obo_mixed_list_set(i8* %t210, i64 1, i8* %t214)
  %t215 = load i8*, i8** %reg_52_ptr
  %t216 = call i8* @obo_box_entity(i8* %t215)
  call void @obo_mixed_list_set(i8* %t210, i64 2, i8* %t216)
  %t217 = load i8*, i8** %reg_53_ptr
  %t218 = call i8* @obo_box_entity(i8* %t217)
  call void @obo_mixed_list_set(i8* %t210, i64 3, i8* %t218)
  %t219 = load i8*, i8** %reg_54_ptr
  %t220 = call i8* @obo_box_entity(i8* %t219)
  call void @obo_mixed_list_set(i8* %t210, i64 4, i8* %t220)
  store i8* %t210, i8** %reg_55_ptr
  %t221 = load i8*, i8** %reg_55_ptr
  store i8* %t221, i8** %var_bodies_ptr
  store i64 5, i64* %var_nbodies_ptr
  store double 0x0000000000000000, double* %var_px_ptr
  store double 0x0000000000000000, double* %var_py_ptr
  store double 0x0000000000000000, double* %var_pz_ptr
  store i64 0, i64* %var_i_ptr
  %t222 = load i64, i64* %var_nbodies_ptr
  store i64 %t222, i64* %reg_56_ptr
  store i64 1, i64* %reg_57_ptr
  br label %main_b1
main_b1:
  %t223 = load i64, i64* %var_i_ptr
  store i64 %t223, i64* %reg_58_ptr
  %t224 = load i64, i64* %reg_58_ptr
  %t225 = load i64, i64* %reg_56_ptr
  %t226 = icmp slt i64 %t224, %t225
  %t227 = zext i1 %t226 to i64
  store i64 %t227, i64* %reg_59_ptr
  %t228 = load i64, i64* %reg_59_ptr
  %t230 = icmp ne i64 %t228, 0
  %t231 = zext i1 %t230 to i64
  %t229 = icmp ne i64 %t231, 0
  br i1 %t229, label %main_b2, label %main_b4
main_b2:
  %t232 = load i8*, i8** %var_bodies_ptr
  store i8* %t232, i8** %reg_60_ptr
  %t233 = load i64, i64* %var_i_ptr
  store i64 %t233, i64* %reg_61_ptr
  %t234 = load i8*, i8** %reg_60_ptr
  %t235 = load i64, i64* %reg_61_ptr
  %t236 = call i8* @obo_mixed_list_get(i8* %t234, i64 %t235)
  store i8* %t236, i8** %reg_62_ptr
  %t237 = load i8*, i8** %reg_62_ptr
  store i8* %t237, i8** %var_b_ptr
  %t238 = load double, double* %var_px_ptr
  store double %t238, double* %reg_63_ptr
  %t239 = load i8*, i8** %var_b_ptr
  store i8* %t239, i8** %reg_64_ptr
  %t240 = load i8*, i8** %reg_64_ptr
  %t241 = call i8* @obo_value_as_entity_ptr(i8* %t240)
  %t242 = getelementptr i8, i8* %t241, i64 88
  %t243 = bitcast i8* %t242 to double*
  %t244 = load double, double* %t243
  store double %t244, double* %reg_65_ptr
  %t245 = load i8*, i8** %var_b_ptr
  store i8* %t245, i8** %reg_66_ptr
  %t246 = load i8*, i8** %reg_66_ptr
  %t247 = getelementptr i8, i8* %t241, i64 136
  %t248 = bitcast i8* %t247 to double*
  %t249 = load double, double* %t248
  store double %t249, double* %reg_67_ptr
  %t250 = load double, double* %reg_65_ptr
  %t251 = load double, double* %reg_67_ptr
  %t252 = fmul double %t250, %t251
  store double %t252, double* %reg_68_ptr
  %t253 = load double, double* %reg_63_ptr
  %t254 = load double, double* %reg_68_ptr
  %t255 = fadd double %t253, %t254
  store double %t255, double* %reg_69_ptr
  %t256 = load double, double* %reg_69_ptr
  store double %t256, double* %var_px_ptr
  %t257 = load double, double* %var_py_ptr
  store double %t257, double* %reg_70_ptr
  %t258 = load i8*, i8** %var_b_ptr
  store i8* %t258, i8** %reg_71_ptr
  %t259 = load i8*, i8** %reg_71_ptr
  %t260 = getelementptr i8, i8* %t241, i64 104
  %t261 = bitcast i8* %t260 to double*
  %t262 = load double, double* %t261
  store double %t262, double* %reg_72_ptr
  %t263 = load i8*, i8** %var_b_ptr
  store i8* %t263, i8** %reg_73_ptr
  %t264 = load i8*, i8** %reg_73_ptr
  %t265 = getelementptr i8, i8* %t241, i64 136
  %t266 = bitcast i8* %t265 to double*
  %t267 = load double, double* %t266
  store double %t267, double* %reg_74_ptr
  %t268 = load double, double* %reg_72_ptr
  %t269 = load double, double* %reg_74_ptr
  %t270 = fmul double %t268, %t269
  store double %t270, double* %reg_75_ptr
  %t271 = load double, double* %reg_70_ptr
  %t272 = load double, double* %reg_75_ptr
  %t273 = fadd double %t271, %t272
  store double %t273, double* %reg_76_ptr
  %t274 = load double, double* %reg_76_ptr
  store double %t274, double* %var_py_ptr
  %t275 = load double, double* %var_pz_ptr
  store double %t275, double* %reg_77_ptr
  %t276 = load i8*, i8** %var_b_ptr
  store i8* %t276, i8** %reg_78_ptr
  %t277 = load i8*, i8** %reg_78_ptr
  %t278 = getelementptr i8, i8* %t241, i64 120
  %t279 = bitcast i8* %t278 to double*
  %t280 = load double, double* %t279
  store double %t280, double* %reg_79_ptr
  %t281 = load i8*, i8** %var_b_ptr
  store i8* %t281, i8** %reg_80_ptr
  %t282 = load i8*, i8** %reg_80_ptr
  %t283 = getelementptr i8, i8* %t241, i64 136
  %t284 = bitcast i8* %t283 to double*
  %t285 = load double, double* %t284
  store double %t285, double* %reg_81_ptr
  %t286 = load double, double* %reg_79_ptr
  %t287 = load double, double* %reg_81_ptr
  %t288 = fmul double %t286, %t287
  store double %t288, double* %reg_82_ptr
  %t289 = load double, double* %reg_77_ptr
  %t290 = load double, double* %reg_82_ptr
  %t291 = fadd double %t289, %t290
  store double %t291, double* %reg_83_ptr
  %t292 = load double, double* %reg_83_ptr
  store double %t292, double* %var_pz_ptr
  br label %main_b3
main_b3:
  %t293 = load i64, i64* %var_i_ptr
  store i64 %t293, i64* %reg_84_ptr
  %t294 = load i64, i64* %reg_84_ptr
  %t295 = load i64, i64* %reg_57_ptr
  %t296 = add i64 %t294, %t295
  store i64 %t296, i64* %reg_85_ptr
  %t297 = load i64, i64* %reg_85_ptr
  store i64 %t297, i64* %var_i_ptr
  br label %main_b1
main_b4:
  %t298 = load double, double* %var_px_ptr
  store double %t298, double* %reg_86_ptr
  %t299 = load double, double* %var_solar_mass_ptr
  store double %t299, double* %reg_87_ptr
  %t300 = load double, double* %reg_86_ptr
  %t301 = load double, double* %reg_87_ptr
  %t302 = fdiv double %t300, %t301
  store double %t302, double* %reg_88_ptr
  %t303 = load double, double* %reg_88_ptr
  %t304 = fsub double 0x0000000000000000, %t303
  store double %t304, double* %reg_89_ptr
  %t305 = load i8*, i8** %var_sun_ptr
  store i8* %t305, i8** %reg_90_ptr
  %t306 = load i8*, i8** %reg_90_ptr
  %t307 = load double, double* %reg_89_ptr
  %t308 = getelementptr i8, i8* %t306, i64 80
  store i8 5, i8* %t308
  %t309 = getelementptr i8, i8* %t306, i64 88
  %t310 = bitcast i8* %t309 to double*
  store double %t307, double* %t310
  %t311 = load double, double* %var_py_ptr
  store double %t311, double* %reg_91_ptr
  %t312 = load double, double* %var_solar_mass_ptr
  store double %t312, double* %reg_92_ptr
  %t313 = load double, double* %reg_91_ptr
  %t314 = load double, double* %reg_92_ptr
  %t315 = fdiv double %t313, %t314
  store double %t315, double* %reg_93_ptr
  %t316 = load double, double* %reg_93_ptr
  %t317 = fsub double 0x0000000000000000, %t316
  store double %t317, double* %reg_94_ptr
  %t318 = load i8*, i8** %var_sun_ptr
  store i8* %t318, i8** %reg_95_ptr
  %t319 = load i8*, i8** %reg_95_ptr
  %t320 = load double, double* %reg_94_ptr
  %t321 = getelementptr i8, i8* %t319, i64 96
  store i8 5, i8* %t321
  %t322 = getelementptr i8, i8* %t319, i64 104
  %t323 = bitcast i8* %t322 to double*
  store double %t320, double* %t323
  %t324 = load double, double* %var_pz_ptr
  store double %t324, double* %reg_96_ptr
  %t325 = load double, double* %var_solar_mass_ptr
  store double %t325, double* %reg_97_ptr
  %t326 = load double, double* %reg_96_ptr
  %t327 = load double, double* %reg_97_ptr
  %t328 = fdiv double %t326, %t327
  store double %t328, double* %reg_98_ptr
  %t329 = load double, double* %reg_98_ptr
  %t330 = fsub double 0x0000000000000000, %t329
  store double %t330, double* %reg_99_ptr
  %t331 = load i8*, i8** %var_sun_ptr
  store i8* %t331, i8** %reg_100_ptr
  %t332 = load i8*, i8** %reg_100_ptr
  %t333 = load double, double* %reg_99_ptr
  %t334 = getelementptr i8, i8* %t332, i64 112
  store i8 5, i8* %t334
  %t335 = getelementptr i8, i8* %t332, i64 120
  %t336 = bitcast i8* %t335 to double*
  store double %t333, double* %t336
  store i64 500000, i64* %var_n_ptr
  %t337 = load i8*, i8** %var_bodies_ptr
  store i8* %t337, i8** %reg_101_ptr
  %t338 = load i64, i64* %var_nbodies_ptr
  store i64 %t338, i64* %reg_102_ptr
  %t339 = load i8*, i8** %reg_101_ptr
  %t340 = load i64, i64* %reg_102_ptr
  %t341 = call double @energy(i8* %t339, i64 %t340)
  store double %t341, double* %reg_103_ptr
  %t342 = load double, double* %reg_103_ptr
  call void @obo_print_double(double %t342)
  store i64 0, i64* %var_i_ptr
  %t343 = load i64, i64* %var_n_ptr
  store i64 %t343, i64* %reg_104_ptr
  store i64 1, i64* %reg_105_ptr
  br label %main_b5
main_b5:
  %t344 = load i64, i64* %var_i_ptr
  store i64 %t344, i64* %reg_106_ptr
  %t345 = load i64, i64* %reg_106_ptr
  %t346 = load i64, i64* %reg_104_ptr
  %t347 = icmp slt i64 %t345, %t346
  %t348 = zext i1 %t347 to i64
  store i64 %t348, i64* %reg_107_ptr
  %t349 = load i64, i64* %reg_107_ptr
  %t351 = icmp ne i64 %t349, 0
  %t352 = zext i1 %t351 to i64
  %t350 = icmp ne i64 %t352, 0
  br i1 %t350, label %main_b6, label %main_b8
main_b6:
  %t353 = load i8*, i8** %var_bodies_ptr
  store i8* %t353, i8** %reg_108_ptr
  %t354 = load i64, i64* %var_nbodies_ptr
  store i64 %t354, i64* %reg_109_ptr
  %t355 = load i8*, i8** %reg_108_ptr
  %t356 = load i64, i64* %reg_109_ptr
  %t357 = call i64 @advance(i8* %t355, i64 %t356, double 0x3F847AE147AE147B)
  store i64 %t357, i64* %reg_110_ptr
  br label %main_b7
main_b7:
  %t358 = load i64, i64* %var_i_ptr
  store i64 %t358, i64* %reg_111_ptr
  %t359 = load i64, i64* %reg_111_ptr
  %t360 = load i64, i64* %reg_105_ptr
  %t361 = add i64 %t359, %t360
  store i64 %t361, i64* %reg_112_ptr
  %t362 = load i64, i64* %reg_112_ptr
  store i64 %t362, i64* %var_i_ptr
  br label %main_b5
main_b8:
  %t363 = load i8*, i8** %var_bodies_ptr
  store i8* %t363, i8** %reg_113_ptr
  %t364 = load i64, i64* %var_nbodies_ptr
  store i64 %t364, i64* %reg_114_ptr
  %t365 = load i8*, i8** %reg_113_ptr
  %t366 = load i64, i64* %reg_114_ptr
  %t367 = call double @energy(i8* %t365, i64 %t366)
  store double %t367, double* %reg_115_ptr
  %t368 = load double, double* %reg_115_ptr
  call void @obo_print_double(double %t368)
  call void @obo_gc_pop_roots(i64 7)
  call void @obo_arena_free_all()
  ret i32 0
}

