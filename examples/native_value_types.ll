; OBO native codegen (Phase 7)
declare i32 @printf(i8*, ...)
declare i32 @strcmp(i8*, i8*)
declare void @obo_frame_push(i8*, i32)
declare void @obo_frame_pop()
declare void @obo_print_stack_trace()
declare void @obo_install_signal_handlers()
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1)
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

@obo.str.0 = private unnamed_addr constant [4 x i8] c"dot\00"
@obo.str.1 = private unnamed_addr constant [7 x i8] c"length\00"
@obo.str.2 = private unnamed_addr constant [7 x i8] c"float3\00"
@obo.str.3 = private unnamed_addr constant [2 x i8] c"x\00"
@obo.str.4 = private unnamed_addr constant [2 x i8] c"y\00"
@obo.str.5 = private unnamed_addr constant [2 x i8] c"z\00"

define i32 @main() {
entry:
  %reg_0_ptr = alloca i8*
  %reg_1_ptr = alloca i8*
  %reg_2_ptr = alloca i8*
  %reg_3_ptr = alloca i8*
  %reg_4_ptr = alloca i8*
  %reg_5_ptr = alloca i8*
  %reg_6_ptr = alloca double
  %reg_7_ptr = alloca i8*
  %reg_8_ptr = alloca double
  %reg_9_ptr = alloca i8*
  %reg_10_ptr = alloca double
  %reg_11_ptr = alloca i8*
  %reg_12_ptr = alloca i8*
  %reg_13_ptr = alloca i8*
  %reg_14_ptr = alloca i8*
  %reg_15_ptr = alloca double
  %reg_16_ptr = alloca i8*
  %reg_17_ptr = alloca double
  %reg_18_ptr = alloca i8*
  %reg_19_ptr = alloca double
  %reg_20_ptr = alloca i8*
  %reg_21_ptr = alloca i8*
  %reg_22_ptr = alloca i64
  %reg_23_ptr = alloca i64
  %reg_24_ptr = alloca i8*
  %reg_25_ptr = alloca i64
  %reg_26_ptr = alloca i64
  %var_a_ptr = alloca i8*
  %var_b_ptr = alloca i8*
  %var_len_ptr = alloca i64
  %var_c_ptr = alloca i8*
  %var_d_ptr = alloca i8*
  %var_dot_ptr = alloca i64
  call void @obo_gc_push_root(i8** %reg_7_ptr)
  call void @obo_gc_push_root(i8** %reg_9_ptr)
  call void @obo_gc_push_root(i8** %reg_11_ptr)
  call void @obo_gc_push_root(i8** %reg_12_ptr)
  call void @obo_gc_push_root(i8** %reg_13_ptr)
  call void @obo_gc_push_root(i8** %reg_14_ptr)
  call void @obo_gc_push_root(i8** %reg_16_ptr)
  call void @obo_gc_push_root(i8** %reg_18_ptr)
  call void @obo_gc_push_root(i8** %reg_20_ptr)
  call void @obo_gc_push_root(i8** %reg_21_ptr)
  call void @obo_gc_push_root(i8** %reg_24_ptr)
  call void @obo_gc_push_root(i8** %var_a_ptr)
  call void @obo_gc_push_root(i8** %var_b_ptr)
  call void @obo_gc_push_root(i8** %var_c_ptr)
  call void @obo_gc_push_root(i8** %var_d_ptr)
  %t0 = alloca <{ float, float, float }>, align 1
  %t1 = bitcast <{ float, float, float }>* %t0 to i8*
  %t2 = fptrunc double 0x3FF0000000000000 to float
  %t3 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t0, i32 0, i32 0
  store float %t2, float* %t3
  %t4 = fptrunc double 0x4000000000000000 to float
  %t5 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t0, i32 0, i32 1
  store float %t4, float* %t5
  %t6 = fptrunc double 0x4008000000000000 to float
  %t7 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t0, i32 0, i32 2
  store float %t6, float* %t7
  store i8* %t1, i8** %reg_0_ptr
  %t8 = load i8*, i8** %reg_0_ptr
  store i8* %t8, i8** %var_a_ptr
  %t9 = alloca <{ float, float, float }>, align 1
  %t10 = bitcast <{ float, float, float }>* %t9 to i8*
  %t11 = fptrunc double 0x4010000000000000 to float
  %t12 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t9, i32 0, i32 0
  store float %t11, float* %t12
  %t13 = fptrunc double 0x4014000000000000 to float
  %t14 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t9, i32 0, i32 1
  store float %t13, float* %t14
  %t15 = fptrunc double 0x4018000000000000 to float
  %t16 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t9, i32 0, i32 2
  store float %t15, float* %t16
  store i8* %t10, i8** %reg_1_ptr
  %t17 = load i8*, i8** %reg_1_ptr
  store i8* %t17, i8** %var_b_ptr
  %t18 = load i8*, i8** %var_a_ptr
  store i8* %t18, i8** %reg_2_ptr
  %t19 = load i8*, i8** %var_b_ptr
  store i8* %t19, i8** %reg_3_ptr
  %t20 = load i8*, i8** %reg_2_ptr
  %t21 = load i8*, i8** %reg_3_ptr
  %t22 = call i8* @obo_format_entity_string(i8* %t20)
  %t23 = call i8* @obo_format_entity_string(i8* %t21)
  %t24 = alloca <{ float, float, float }>, align 1
  %t25 = bitcast i8* %t22 to <{ float, float, float }>*
  %t26 = bitcast i8* %t23 to <{ float, float, float }>*
  %t27 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t25, i32 0, i32 0
  %t28 = load float, float* %t27
  %t29 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t26, i32 0, i32 0
  %t30 = load float, float* %t29
  %t31 = fadd float %t28, %t30
  %t32 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t24, i32 0, i32 0
  store float %t31, float* %t32
  %t33 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t25, i32 0, i32 1
  %t34 = load float, float* %t33
  %t35 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t26, i32 0, i32 1
  %t36 = load float, float* %t35
  %t37 = fadd float %t34, %t36
  %t38 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t24, i32 0, i32 1
  store float %t37, float* %t38
  %t39 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t25, i32 0, i32 2
  %t40 = load float, float* %t39
  %t41 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t26, i32 0, i32 2
  %t42 = load float, float* %t41
  %t43 = fadd float %t40, %t42
  %t44 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t24, i32 0, i32 2
  store float %t43, float* %t44
  %t45 = bitcast <{ float, float, float }>* %t24 to i8*
  store i8* %t45, i8** %reg_4_ptr
  %t46 = load i8*, i8** %reg_4_ptr
  store i8* %t46, i8** %var_c_ptr
  %t47 = load i8*, i8** %var_c_ptr
  store i8* %t47, i8** %reg_5_ptr
  %t48 = load i8*, i8** %reg_5_ptr
  %t49 = call i8* @obo_entity_get_boxed(i8* %t48, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.3, i64 0, i64 0))
  store i8* %t49, i8** %reg_6_ptr
  %t50 = load double, double* %reg_6_ptr
  call void @obo_print_double(double %t50)
  %t51 = load i8*, i8** %var_c_ptr
  store i8* %t51, i8** %reg_7_ptr
  %t52 = load i8*, i8** %reg_7_ptr
  %t53 = call i8* @obo_entity_get_boxed(i8* %t52, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.4, i64 0, i64 0))
  store i8* %t53, i8** %reg_8_ptr
  %t54 = load double, double* %reg_8_ptr
  call void @obo_print_double(double %t54)
  %t55 = load i8*, i8** %var_c_ptr
  store i8* %t55, i8** %reg_9_ptr
  %t56 = load i8*, i8** %reg_9_ptr
  %t57 = call i8* @obo_entity_get_boxed(i8* %t56, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @obo.str.5, i64 0, i64 0))
  store i8* %t57, i8** %reg_10_ptr
  %t58 = load double, double* %reg_10_ptr
  call void @obo_print_double(double %t58)
  %t59 = load i8*, i8** %var_a_ptr
  store i8* %t59, i8** %reg_11_ptr
  %t60 = load i8*, i8** %var_b_ptr
  store i8* %t60, i8** %reg_12_ptr
  %t61 = load i8*, i8** %reg_11_ptr
  %t62 = load i8*, i8** %reg_12_ptr
  %t63 = alloca <{ float, float, float }>, align 1
  %t64 = bitcast i8* %t61 to <{ float, float, float }>*
  %t65 = bitcast i8* %t62 to <{ float, float, float }>*
  %t66 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t64, i32 0, i32 0
  %t67 = load float, float* %t66
  %t68 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t65, i32 0, i32 0
  %t69 = load float, float* %t68
  %t70 = fmul float %t67, %t69
  %t71 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t63, i32 0, i32 0
  store float %t70, float* %t71
  %t72 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t64, i32 0, i32 1
  %t73 = load float, float* %t72
  %t74 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t65, i32 0, i32 1
  %t75 = load float, float* %t74
  %t76 = fmul float %t73, %t75
  %t77 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t63, i32 0, i32 1
  store float %t76, float* %t77
  %t78 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t64, i32 0, i32 2
  %t79 = load float, float* %t78
  %t80 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t65, i32 0, i32 2
  %t81 = load float, float* %t80
  %t82 = fmul float %t79, %t81
  %t83 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t63, i32 0, i32 2
  store float %t82, float* %t83
  %t84 = bitcast <{ float, float, float }>* %t63 to i8*
  store i8* %t84, i8** %reg_13_ptr
  %t85 = load i8*, i8** %reg_13_ptr
  store i8* %t85, i8** %var_d_ptr
  %t86 = load i8*, i8** %var_d_ptr
  store i8* %t86, i8** %reg_14_ptr
  %t87 = load i8*, i8** %reg_14_ptr
  %t88 = bitcast i8* %t87 to <{ float, float, float }>*
  %t89 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t88, i32 0, i32 0
  %t90 = load float, float* %t89
  %t91 = fpext float %t90 to double
  store double %t91, double* %reg_15_ptr
  %t92 = load double, double* %reg_15_ptr
  call void @obo_print_double(double %t92)
  %t93 = load i8*, i8** %var_d_ptr
  store i8* %t93, i8** %reg_16_ptr
  %t94 = load i8*, i8** %reg_16_ptr
  %t95 = bitcast i8* %t94 to <{ float, float, float }>*
  %t96 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t95, i32 0, i32 1
  %t97 = load float, float* %t96
  %t98 = fpext float %t97 to double
  store double %t98, double* %reg_17_ptr
  %t99 = load double, double* %reg_17_ptr
  call void @obo_print_double(double %t99)
  %t100 = load i8*, i8** %var_d_ptr
  store i8* %t100, i8** %reg_18_ptr
  %t101 = load i8*, i8** %reg_18_ptr
  %t102 = bitcast i8* %t101 to <{ float, float, float }>*
  %t103 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t102, i32 0, i32 2
  %t104 = load float, float* %t103
  %t105 = fpext float %t104 to double
  store double %t105, double* %reg_19_ptr
  %t106 = load double, double* %reg_19_ptr
  call void @obo_print_double(double %t106)
  %t107 = load i8*, i8** %var_b_ptr
  store i8* %t107, i8** %reg_20_ptr
  %t108 = load i8*, i8** %var_a_ptr
  store i8* %t108, i8** %reg_21_ptr
  %t109 = load i8*, i8** %reg_21_ptr
  %t110 = load i8*, i8** %reg_20_ptr
  %t111 = bitcast i8* %t109 to <{ float, float, float }>*
  %t112 = bitcast i8* %t110 to <{ float, float, float }>*
  %t113 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t111, i32 0, i32 0
  %t114 = load float, float* %t113
  %t115 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t112, i32 0, i32 0
  %t116 = load float, float* %t115
  %t117 = fmul float %t114, %t116
  %t118 = fpext float %t117 to double
  %t119 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t111, i32 0, i32 1
  %t120 = load float, float* %t119
  %t121 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t112, i32 0, i32 1
  %t122 = load float, float* %t121
  %t123 = fmul float %t120, %t122
  %t124 = fpext float %t123 to double
  %t125 = fadd double %t118, %t124
  %t126 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t111, i32 0, i32 2
  %t127 = load float, float* %t126
  %t128 = getelementptr inbounds <{ float, float, float }>, <{ float, float, float }>* %t112, i32 0, i32 2
  %t129 = load float, float* %t128
  %t130 = fmul float %t127, %t129
  %t131 = fpext float %t130 to double
  %t132 = fadd double %t125, %t131
  store double %t132, double* %reg_22_ptr
  %t133 = load i64, i64* %reg_22_ptr
  store i64 %t133, i64* %var_dot_ptr
  %t134 = load i64, i64* %var_dot_ptr
  store i64 %t134, i64* %reg_23_ptr
  %t135 = load i64, i64* %reg_23_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t135)
  %t136 = load i8*, i8** %var_a_ptr
  store i8* %t136, i8** %reg_24_ptr
  %t137 = load i8*, i8** %reg_24_ptr
  store i64 3, i64* %reg_25_ptr
  %t138 = load i64, i64* %reg_25_ptr
  store i64 %t138, i64* %var_len_ptr
  %t139 = load i64, i64* %var_len_ptr
  store i64 %t139, i64* %reg_26_ptr
  %t140 = load i64, i64* %reg_26_ptr
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @obo.fmt.i64, i64 0, i64 0), i64 %t140)
  call void @obo_gc_pop_roots(i64 15)
  call void @obo_arena_free_all()
  ret i32 0
}

