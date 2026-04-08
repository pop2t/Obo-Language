# OBO Roadmap — What's Left

**v0.5.0** · April 2026

Everything needed to reach self-hosting, true systems-level capability, bare-metal targets, and C++-competitive performance. Organized by domain, then priority.

---

## 0. Architecture — Safe / Metal Isolation

OBO has two execution modes with an airtight boundary between them.

### 0.1 Two Worlds, One Language

| | Safe (default) | Metal |
|---|---|---|
| **Scope** | Everything outside `metal {}` | Inside `metal {}` only |
| **Types** | `number`, `decimal`, `text`, `flag`, entity, actor, list, map, set, etc. | `i8`–`i64`, `u8`–`u64`, `f32`, `f64`, `pointer`, `handle` |
| **Memory** | GC-managed, automatic | Manual / arena / `own` / `defer` |
| **Safety** | Bounds-checked, null-safe, type-safe | Raw access, no checks |
| **Operators** | `+ - * / % and or not` | `+ - * / %` plus `& | ^ << >> ~` (bitwise) |

**Metal types, metal operators, and metal memory tools do not exist in safe code.** There is no `f32`, no `pointer`, no `&` operator, no `defer`, no `own` outside a `metal` block. The safe language surface stays exactly as it is today — zero new keywords, zero new types.

### 0.2 Boundary Rules ✅

**Status:** Done. Checker enforces metal boundary — `pointer`, `f32`, fixed-width ints, bitwise ops, `defer`, `own`, and `Arena` are all rejected outside `metal {}` blocks. Safe/metal isolation is airtight.

**Rule 1 — Metal types cannot escape metal blocks.**
A `pointer`, `f32`, `handle`, or fixed-width int declared inside `metal {}` is dead at the closing brace. You cannot assign it to a safe variable.

**Rule 2 — Safe values enter metal by conversion.**
When a safe `number` is used inside metal, it converts to `i64`. `decimal` converts to `f64`. The metal block works with machine types — no tagged OboValue, no GC tracking.

**Rule 3 — Metal returns safe values by conversion.**
```obo
result = metal
{
    // raw computation with machine types
    out 42;  // i64 → number at the boundary
};
// result is a normal safe 'number'
```

**Rule 4 — No GC inside metal.**
Metal blocks don't trigger collection, don't register roots, don't allocate through the GC. If you `pointer.alloc` inside metal, you manage that memory inside metal.

**Rule 5 — No mutual mutation.**
Safe code and metal code cannot mutate each other's state. They communicate through value conversion at the boundary — safe passes values in, metal passes values out. Neither reaches into the other's memory model.

**Rule 6 — Metal can invoke safe code through a gate:**
```obo
metal
{
    // Can't directly call a safe function that allocates entities.
    // Cross back explicitly:
    result = safe { compute_something(data) };
    // GC active inside safe {}, normal OBO rules apply
    // result crosses back into metal as a machine value
}
```

**Rule 7 — Safe code invokes metal transparently:**
```obo
function fast_dot(a, b)
{
    out metal
    {
        ax = a.x as f32;
        ay = a.y as f32;
        bx = b.x as f32;
        by = b.y as f32;
        out (ax * bx + ay * by) as decimal;
    };
}
// Caller never knows metal was used
```

### 0.3 Metal Memory Management ✅

**Status:** Done. All three memory tools implemented across all 8 pipeline layers (token → scanner → AST → parser → checker → interpreter → IR lowering → LLVM emit). Checker enforces metal-only boundary for all three.

- **`defer`** — LIFO cleanup at scope exit, compiler inlines defer bodies in reverse before block exit
- **`Arena`** — C runtime bump allocator (`OboArena` struct), interpreter `Value::Arena`, IR collection type pattern
- **`own`** — Tracks owned vars in VarDecl/Assignment, auto-emits `__sys_pointer_free` at scope exit (LIFO, after defers)

Metal is NOT strictly unmanaged. It provides three deterministic, zero-cost memory tools that prevent common bugs without GC overhead.

**Arena — allocate many, free all at once:**
```obo
metal
{
    arena = Arena.create(64 * 1024);  // 64KB bump allocator

    buf1 = arena.alloc(f32, 1024);    // 1024 floats — just bumps a pointer
    buf2 = arena.alloc(u8, 4096);     // 4KB byte buffer — no headers

    // use buf1, buf2 freely...

    arena.reset();    // single pointer reset, everything freed
    // or: freed automatically when arena goes out of scope
}
```
Perfect for: per-frame GPU work, per-pass compiler allocations, request handling. Zero per-allocation overhead. No fragmentation.

**`defer` — cleanup at scope exit:**
```obo
metal
{
    file = os.open("data.bin");
    defer { os.close(file); }

    buffer = pointer.alloc(4096);
    defer { pointer.free(buffer); }

    // work with file and buffer...
    // defers run in reverse order on ANY exit (normal, early out, error)
}
```
Prevents resource leaks from early returns. Zero runtime cost — compiler inserts cleanup at every exit path.

**`own` — single owner, auto-freed at scope exit:**
```obo
metal
{
    buffer = own pointer.alloc(4096);
    // buffer freed automatically when it goes out of scope
    // cannot be assigned to another variable (move semantics)
    // cannot escape the metal block

    result = buffer.read(f32);
    // block exits → buffer freed
}
```
For the common case: allocate, use, done. No `defer` boilerplate.

**What does NOT belong in metal:**

| Pattern | Why not |
|---------|---------|
| GC | Defeats the purpose — pauses, overhead |
| Reference counting | Runtime cost per copy/drop, cycle leaks |
| Borrow checker | Massive complexity — Rust exists for that |
| Smart pointers | Implicit behavior, hard to reason about |

### 0.4 Eliminating the C Runtime

The C runtime (`obo_rt.c`) is bootstrap scaffolding, not a permanent dependency.

**Phase 1 (now):** Rust compiler + C runtime → OBO binaries
**Phase 2 (self-hosted compiler):** OBO compiler + C runtime → OBO binaries
**Phase 3 (self-hosted runtime):** OBO runtime (written in OBO `metal` blocks for alloc/GC/syscalls) → no C dependency
**Phase 4 (full bootstrap):** OBO compiler compiles OBO runtime compiles OBO compiler. C is gone.

The GC, entity allocator, string operations, and syscall wrappers can all be expressed in OBO `metal` blocks once pointer arithmetic, fixed-width ints, and `bridge` to kernel syscalls are working.

---

## 1. Self-Hosting Blockers

OBO has the language surface to write a compiler (enums, pattern matching, closures, error handling, file I/O, FFI — all native). The blockers are runtime/performance issues, not missing syntax.

### 1.1 Mutable Collections ✅

**Status:** Done. In-place mutation (Python-style) implemented for lists (`.add`, `.insert`, `.removeAt`, `.remove`) and maps (`.set`, `.remove`) across interpreter, IR lowering (write-back), and LLVM native. No COW on mutation.

**Impact:** Unlocks self-hosting, improves map_stress and database_heavy benchmarks.

### 1.2 Efficient String Builder ✅

**Status:** Done. `TextBuilder` implemented with `.append(text/char/int)`, `.build()`, `.length`, `.clear()`. C runtime struct (data/len/cap), interpreter `Value::TextBuilder(Arc<Mutex<Vec<u8>>>)`, IR lowering with type-aware dispatch (appendInt/appendChar/append), LLVM native emission. Tested in both modes.

### 1.3 HashMap with Non-String Keys ✅

**Status:** Done. Integer-keyed maps reuse existing `OboMap` with `\x01`-prefixed canonical string keys (`ikey_to_str`). C runtime: `obo_map_set_int/get_int/has_int/remove_int` + boxed variants. LLVM emit `GetIndex`/`SetIndex` detect `LowType::I64` index and dispatch to `_int` variants. Interpreter already supported any hashable `Value` as key. No new struct needed.

### 1.4 Standard Error Types + Stack Traces

**Problem:** `possible/else` catches errors as plain text strings. A compiler needs structured errors with source location (file, line, column), error code, and context. No stack trace is captured on `possible` failure.

**Fix:**
- Define a built-in `Error` entity: `{ message, file, line, column, code, trace }`
- Capture stack trace on `longjmp` (walk the shadow stack, emit frame names)
- `possible/else (err)` where `err` is an `Error` entity, not a string
- Add `error("message")` as a statement that creates + throws an Error

---

## 2. Systems-Level Gaps (Metal-Only)

All items in this section are scoped exclusively to `metal {}` blocks. They do not exist in safe OBO.

### 2.1 Inline Assembly

**Problem:** No way to emit CPU-specific instructions (e.g., `rdtsc`, `cpuid`, SIMD intrinsics, interrupt handlers).

**Fix:** Add `asm` blocks inside `metal`:
```obo
metal
{
    result = asm("rdtsc" : "=A"(result));
}
```
Lower to LLVM inline assembly (`call void asm sideeffect ...`).

### 2.2 Packed Structs / Explicit Layout Control ✅

**Status:** Done. `packed` structs implemented inside `metal {}` blocks with explicit field types (`i8`–`i64`, `u8`–`u64`, `f32`, `f64`). Parser, checker (metal-only), interpreter, IR lowering, and LLVM emit all support packed structs. Emits as LLVM packed struct (`<{ i16, i16, i32 }>`) with no padding. Field access via byte-offset GEP. `packed` is a metal-only keyword — safe entities keep their current layout.

### 2.3 Raw Pointer Arithmetic ✅

**Status:** Done. Memory intrinsics implemented via `mem` system actor:
- `mem.load64(addr)` — load i64 from address (inline LLVM `inttoptr` + `load`)
- `mem.store64(addr, val)` — store i64 to address (inline LLVM `inttoptr` + `store`)
- `mem.load8(addr)` — load byte, zero-extend to i64
- `mem.store8(addr, val)` — truncate to i8, store

All four compile to **zero-overhead inline LLVM IR** (no function call). This enables self-hosted runtime components written in pure OBO — proven by the self-hosted free-list allocator (`runtime/obo_alloc.obo`, 19/19 tests pass).

### 2.4 Fixed-Width Integer Types ✅

**Problem:** Only `number` (i64) and `byte` (u8) exist. Hardware interfaces need `u16`, `u32`, `i32`, `i8`, `u64`.

**Fix:** Implemented globally:
- `i8`, `i16`, `i32`, `i64` (alias for `number`), `u8` (alias for `byte`), `u16`, `u32`, `u64`
- Type-annotated declarations: `i32 x = 42;`
- Cast syntax: `(i32)(expr)`
- Range-checked on coercion, wrapping on arithmetic
- Both interpreter and native modes supported (LLVM maps to i64 internally)

### 2.5 Bitwise Operators ✅

**Problem:** No bitwise operators. Systems code lives on bit manipulation.

**Fix:** Implemented globally (not restricted to `metal` blocks):
- `a & b` (AND), `a ^ b` (XOR) — `|` reserved for pipe, use `^` for XOR
- `a << n` (shift left), `a >> n` (shift right)
- `~a` (bitwise NOT)
- Works on `number` and `byte` types in both interpreter and native modes

---

## 3. Bare-Metal Capability

### 3.1 Freestanding Runtime — ✅ DONE

`obo build --freestanding` implemented. Runtime split into two tiers via `#ifdef OBO_FREESTANDING` guards in `obo_rt.c`:
- **Tier 0 (freestanding):** No libc. User provides `obo_platform_alloc(size)` / `obo_platform_free(ptr)` / `obo_platform_putchar(ch)`. Minimal implementations of `malloc`/`free`/`realloc`/`strlen`/`strcmp`/`strdup`/`strtoll`/`strtod`/`memcpy`/`memset` built on top. Math stubs (`sqrt`, `pow`, `fmod`, `floor`, `ceil`, `fabs`, `round`). Pthread/setjmp/time stubs. `printf`/`fprintf` route through `obo_platform_putchar`. Time/File stdlib functions stub out gracefully. GC auto-disabled.
- **Tier 1 (hosted):** Links libc. Full stdlib. Current behavior (unchanged).

### 3.2 Custom Linker Scripts — ✅ DONE

All three flags implemented in CLI and wired through to clang invocation:
- `obo build --linker-script=flash.ld` — passes `-T flash.ld` to clang
- `obo build --entry=_start` — passes `-e _start` to clang
- `obo build --no-stdlib` — passes `-ffreestanding -nostdlib` to clang, skips `-lpthread`

### 3.3 Target Triples — ✅ DONE

`obo build --target=<triple>` implemented. Passes `--target=<triple>` directly to clang. Supports both `--target=thumbv7em-none-eabi` and `--target thumbv7em-none-eabi` syntax. LLVM IR is target-agnostic; clang handles code generation for the specified architecture.

### 3.4 No-GC Mode — ✅ DONE

`obo build --no-gc` flag implemented. In no-gc mode: GC root push/pop calls are skipped entirely during LLVM emission, and `obo_gc_pause()` is called at program start so `obo_gc_register_impl` returns immediately (no GCNode allocation, no hash table insertion, no threshold checks). Memory is freed at process exit only. Impact: binary_trees 13.0ms → 5.8ms (2.23x faster, beats C++ 6.1ms), nbody 38.6ms → 22.9ms (1.68x), map_stress 61.6ms → 44.0ms (1.40x).

### 3.5 Interrupt Handlers — ✅ DONE

`@interrupt` attribute implemented. Functions with `@interrupt` emit with `naked noinline` attributes, external linkage, and `void` return type in LLVM IR. Return statements emit `ret void`. Detected during IR lowering (like `@export`), stored as `is_interrupt: bool` on `IrFunction`.

```obo
@interrupt
function timer_handler()
{
    // runs in interrupt context — naked calling convention
    // no GC, no allocation, no heap
}
```

---

## 4. Debugger / DWARF Info ✅

### 4.1 Source-Level Debug Info ✅

**Problem:** Compiled binaries have no debug information. `lldb` can't show source lines, variable names, or step through OBO code. Crash dumps are raw addresses.

**Fix:** Emit LLVM debug metadata:
- `!DIFile` for each source file ✅
- `!DISubprogram` for each function (name, line, scope) ✅
- `!DILocation` on each instruction (line, column) ✅
- Compile with `obo build --debug` (pass `-g` to clang, `-O0`) ✅

**Implementation:** Added `lines: Vec<u32>` parallel vector in `BasicBlock` + `start_line` on `IrFunction`. During lowering, `current_line` tracks span from each statement. During LLVM emit, `!dbg !N` is attached to each instruction and full DWARF metadata section (DICompileUnit, DIFile, DISubprogram, DILocation) is emitted. `lldb` shows OBO source, line numbers, and function names.

### 4.2 Stack Traces on Crash ✅

**Problem:** Unhandled errors print a message and `exit(1)`. No call stack, no source location.

**Fix:**
- Shadow call stack in C runtime: `obo_frame_push("function_name", line)` / `obo_frame_pop()` at function entry/exit ✅
- Signal handlers for SIGSEGV/SIGABRT/SIGBUS/SIGFPE print OBO stack trace on crash ✅
- `obo_install_signal_handlers()` called at start of `main` in debug builds ✅

### 4.3 Runtime Type Names in Debugger

**Problem:** All values are `i64` or `i8*` in the debugger. Can't tell if an `i64` is a number, a boolean, a null, or a packed entity pointer.

**Fix:** Emit LLVM `typedef` debug info: `!DIDerivedType(tag: DW_TAG_typedef, name: "flag", baseType: !i64)`. Variables get their OBO type names in the debugger.

---

## 5. Macros / Metaprogramming

### 5.1 Compile-Time Functions

**Problem:** No way to generate repetitive code, build lookup tables, or compute constants at compile time.

**Fix:** `const function` — evaluated at compile time, result inlined:
```obo
const function make_lookup()
{
    table = [];
    count (i = 0, 256)
    {
        table = table.add(i * i);
    }
    out table;
}

const SQUARES = make_lookup();   // computed at compile time
```

### 5.2 Code Generation Macros

**Problem:** Can't generate boilerplate (serialization, equality, hashing) for entities automatically.

**Fix:** Attribute-driven code generation:
```obo
@derive(equals, hash, serialize)
entity Vec3 { x; y; z; }
```
The compiler generates `equals()`, `hash()`, and `serialize()` methods. Not arbitrary macros — a closed set of derivable traits, like Rust's `#[derive]`.

### 5.3 Conditional Compilation (Extended)

`#if` already works for platform/mode/backend. Extend to user-defined flags:
```obo
#if feature("logging")
{
    show "debug: {msg}";
}
```
Set via `obo build --feature=logging`.

---

## 6. Performance — Closing the Gap to C++

Current state (after P1 optimizations): OBO is **0.85x** C++ on fibonacci (faster), **1.8x** on binary_trees, **2.1x** on nbody, **3.3x** on map_stress, **1.5x** on database_heavy.

**P1 results** (completed April 2026):
| Benchmark | Before | After | Speedup | vs C++ |
|---|---|---|---|---|
| fibonacci | 18.5ms | 15.9ms | 14% faster | **0.85x (faster)** |
| binary_trees | 13.8ms | 11.9ms | 14% faster | 1.8x |
| nbody | 47.6ms | 38.5ms | 19% faster | 2.1x |
| map_stress | 65.9ms | 64.1ms | 3% faster | 3.3x |
| database_heavy | 79.2ms | 75.0ms | 5% faster | 1.5x |

### 6.1 Typed Entity Slots — ✅ PARTIALLY DONE

**Tag-skip optimization completed.** When type inference proves a field is consistently the same concrete type (F64 or I64) across all entity types, the `store i8 <tag>` is skipped on `SetField`. The `advance()` hot loop in nbody now emits **0 vtag writes** (was ~30 per iteration). Combined with internal-linkage inlining (6.7), this brought nbody from 47.6ms → 38.5ms.

**Remaining:** Full typed struct layout (replacing 16-byte OboValue slots with direct `double` fields) is not yet implemented. This would halve entity memory footprint and enable LLVM's LICM to hoist field loads. Expected additional gain: nbody 2.1x → ~1.5x.

### 6.2 Unbox Known-Type List Elements (nbody: → ~1.3x)

**Problem:** `bodies[i]` goes through `obo_mixed_list_get()` — a C function call that returns an `OboValue*` (pointer to 16-byte tagged slot). C++ accesses `bodies[i]` as a direct struct pointer.

**Fix:** When a list is known to contain only entities of one type, store them as a **typed array** (`Body**` instead of `OboValue[]`). Element access becomes a single `getelementptr` + load — no function call, no tag check.

### 6.3 Escape Analysis + Stack Allocation — ✅ DONE (infrastructure)

Escape analysis infrastructure implemented: `compute_non_escaping_entities()` analyzes each function's IR to determine which `MakeEntity` registers never escape (not returned, not passed to calls, not stored in closures/lists/maps). Tracks register→variable aliases and propagates escaping transitively. Result available for future stack allocation of non-escaping entities (`alloca` instead of `obo_entity_new_slotted`). Note: binary_trees entities escape via return, so stack allocation doesn't apply there — the big win came from `--no-gc` mode instead.

### 6.4 Loop-Invariant Code Motion for Entity Access

**Problem:** In nbody's inner loop, `bi.mass` is read every iteration of `j`, but `bi` doesn't change inside the `j` loop. The entity pointer is cached (via our optimization), but the field load itself is still repeated.

**Fix:** Hoist invariant field loads above the inner loop:
```
bi_mass = bi.mass;    // load once before j loop
// inner loop uses bi_mass directly
```
LLVM's own LICM pass can do this IF the loads aren't through opaque `i8*` pointers. Emitting typed struct access (6.1) would let LLVM's optimizer handle this automatically.

### 6.5 SIMD for List Operations (map_stress: 3.4x → ~2x)

**Problem:** List operations (`filter`, `map`, `reduce`) iterate element-by-element. Homogeneous `i64` lists could use SIMD (4x i64 per AVX2 register).

**Fix:** For `obo_list_*` operations on homogeneous i64 lists:
- `reduce(+)` → use `vpaddd` (sum 4 elements per cycle)
- `map(* 2)` → use `vpmuludq` (multiply 4 elements per cycle)
- `filter(> 0)` → use `vpcmpgtq` (compare 4 elements per cycle)
- Emit as LLVM vector intrinsics or let LLVM's SLP vectorizer handle it with `#pragma` hints.

### 6.6 Tail Call Optimization — ✅ DONE

Tail call detection implemented: for non-main functions with zero GC roots, scans each basic block for the pattern `Call(r, ...) + Return([Reg(r)])` — where the return value is the direct result of the preceding call. These calls are emitted with the `tail` prefix in LLVM IR (`tail call` instead of `call`), allowing LLVM to reuse the current stack frame. Applies to factorial-style recursion, tree traversals, and continuation-passing patterns.

### 6.7 Inline Small Functions — ✅ DONE

All non-main, non-dispatch functions now emit `define internal` linkage in LLVM IR, enabling LLVM's inliner to optimize cross-function calls. Actor instance methods (with `self` param) keep external linkage for the C dispatch table. Impact: fibonacci 18.5ms → 16.5ms, binary_trees 13.8ms → 13.0ms, nbody 47.6ms → 45.5ms.

### 6.8 Reduce GC Pressure — ✅ DONE

Lists already pre-sized with exact capacity in `MakeList` emission. Main GC pressure reduction achieved via `--no-gc` mode (3.4) which eliminates per-allocation GCNode creation, hash table insertion, and threshold collection checks entirely. String deduplication for computed strings deferred to P13 (diminishing returns).

### 6.9 Compile-Time Constants Folding — ✅ DONE

Already implemented in `system_actor_member_operand()` at IR lowering time. `Math.pi`, `Math.e`, `Math.infinity`, `Math.maxNumber`, `Math.minNumber` are all inlined as `Operand::Const(Constant::Decimal(...))` — no runtime call.

---

## 7. GPU / Graphics / AI

Target: Port Cogal (Metal + Vulkan compute abstraction) to OBO, build a UI library on top, and eventually support AI frameworks with GPU compute.

### 7.1 `float` / `f32` Type (Metal-Only) ✅

**Status:** Done. `f32` type implemented inside `metal {}` blocks. Parser, checker (metal-only), interpreter, IR lowering, and LLVM emit all support `f32`. LLVM emits `float` (IEEE-754 single precision). Cannot escape metal blocks — safe OBO uses `decimal` (f64) exclusively.

### 7.2 Objective-C Bridge (Metal) ✅

**Status:** Done. Option A (C wrapper) works today — zero compiler changes needed. Bridge declarations with `handle` type for opaque GPU resources, `i32`/`i64` for params, `text` for strings. Example: `examples/metal_bridge.obo` demonstrates full Metal compute pipeline pattern (`cogal_mtl_*` functions) with device/queue/buffer/pipeline/encoder lifecycle using `defer` for cleanup and `own` for buffer auto-free.

### 7.3 Vulkan Bridge ✅

**Status:** Done. Vulkan is a C API — OBO's `bridge` handles it directly. Example: `examples/vulkan_bridge.obo` demonstrates full Vulkan API bridge with `handle` for GPU resources, `packed entity` for VkApplicationInfo/VkInstanceCreateInfo structs with exact binary layout, and mixed `pointer`/`i32`/`i64`/`handle` parameter types. Fixed-width ints (2.4) and packed structs (2.2) provide the exact layout control needed for Vulkan structs.

### 7.4 Unmanaged Handles (Metal-Only GPU Resource Lifetime) ✅

**Status:** Done. `handle` type implemented as a metal-only opaque pointer (`i8*` in LLVM, excluded from GC). Added across all layers: `KwHandle` token, `Value::Handle(u64)` in interpreter, `"handle" => "i8*"` in IR lowering, bridge param/return type support. Works with `defer` for cleanup and `own` for auto-release. Example: `examples/native_handle.obo` demonstrates the GPU resource lifecycle pattern with mock bridge functions.

**Also fixed:** `obo_type_to_llvm()` now correctly maps all fixed-width types (`i8`-`i64`, `u8`-`u64`, `f32`) in bridge declarations. Previously `i64` and other fixed-width types fell through to `i8*`. Bridge param names now accept keyword-like identifiers (e.g., `count`, `flags`, `offset`).
```obo
actor GPUDevice
{
    _handle;  // stores handle as safe number (opaque)

    shared function create()
    {
        h = metal
        {
            ptr = mtl_create_device();
            out ptr as number;  // cross boundary as opaque value
        };
        out GPUDevice { _handle = h; };
    }

    function release()
    {
        metal
        {
            defer { mtl_release_device(_handle as handle); }
        };
    }
}
```
- `handle` is `i8*` in LLVM, excluded from GC root scanning
- Only valid inside `metal` blocks
- In safe code, GPU resources are wrapped in actors — users never see handles
- `own handle` supported: auto-freed at metal block exit via driver release call

### 7.5 GPU-Compatible Vector/Matrix Types (Metal-Only Values) ✅

**Status:** Done. `value` keyword implemented as a contextual keyword (parsed when identifier == "value"). Value types compile to stack-allocated LLVM packed structs (`alloca` instead of `malloc`), with component-wise arithmetic (`+`, `-`, `*`, `/`), `.dot()` (returns f64), and `.length()` (returns field count). Type inference handles value-type BinOp and CallMethod across both forward and backward passes. Works in both interpreter and native compilation.

```obo
value float3 { x as f32; y as f32; z as f32; }

function main() {
    a = float3 { x = 1.0; y = 2.0; z = 3.0; };
    b = float3 { x = 4.0; y = 5.0; z = 6.0; };
    c = a + b;          // component-wise add → 5.0, 7.0, 9.0
    d = a * b;          // component-wise mul → 4.0, 10.0, 18.0
    dot = a.dot(b);     // dot product → 32.0
    len = a.length();   // field count → 3
}
```
- Emits as LLVM packed structs (`<{ float, float, float }>`), stack-allocated via `alloca`
- Field access via byte-offset GEP (reuses packed struct infrastructure)
- Checker allows arithmetic on matching value types
- No GC tracking — pure stack values

### 7.6 Mapped Buffer Access ✅

**Status:** Done. Pointer methods (`offset`, `write`, `read`, `readF32`, `readF64`) implemented in LLVM emit for value-type and primitive access. Combined with `pointer` (2.3), `f32` (7.1), and value types (7.5), structured buffer writes work end-to-end.

```obo
metal
{
    ptr = buffer.contents();   // get mapped CPU pointer (handle → pointer)
    ptr.write(float4 { x = 1.0f; y = 0.0f; z = 0.0f; w = 1.0f; });
    ptr = ptr.offset(16);     // advance 16 bytes (sizeof float4)
    ptr.write(float4 { x = 0.0f; y = 1.0f; z = 0.0f; w = 1.0f; });
}
```

### 7.7 C-Compatible Function Pointers (Callbacks) ✅

**Status:** Done. `@export` attribute on functions emits C-compatible function pointers with correct ABI. Supports `@export("void")`, `@export("i32")`, `@export("float")` return type annotations. Parameter coercion handles `sext` (narrow ints), `ptrtoint` (pointers), `fpext` (floats). Export functions use external linkage and can be passed as C function pointers to bridge functions. Bridge `i8*` params use raw pointer coercion (inttoptr) instead of OboValue boxing.

**Problem:** Vulkan debug callbacks, Metal completion handlers, UI event handlers, and GLFW input callbacks all expect C function pointers (`void(*)(void*, int, ...)`). OBO closures are `OboClosure*` structs — incompatible.

**Fix:** Allow `bridge` functions to be defined in OBO and exported with C calling convention:
```obo
@export
function vulkan_debug_callback(severity as i32, msg as pointer)
{
    show "Vulkan: " + (text)msg;
}

// Pass to Vulkan:
vkSetDebugCallback(instance, vulkan_debug_callback);
```
Emit as `define void @vulkan_debug_callback(i32 %0, i8* %1)` — plain C-compatible function, no closure wrapper.

### 7.8 Platform Event Loop ✅

**Status:** Done. `obo_event_loop_run(on_frame, on_event, ctx, target_fps)` and `obo_event_loop_stop()` implemented in C runtime. Poll-based frame loop with fps throttling via `gettimeofday`/`nanosleep`. Works with @export callbacks — OBO functions passed as C function pointers to the event loop.

**Problem:** UI applications need a platform event loop — `NSApplication.run()` on macOS, message pump on Windows. The app yields control to the OS, which calls back on events (mouse, keyboard, resize, draw). OBO has no concept of a run loop.

**Fix — Minimal approach:** Bridge the platform event loop through C:
```c
// cogal_ui.c
void cogal_run_loop(void(*on_frame)(void*), void(*on_event)(void*, int), void* ctx);
```
OBO calls `cogal_run_loop` with exported callback functions (7.7). The C layer handles `NSRunLoop` / `CFRunLoopRun` / Win32 `PeekMessage`.

**Fix — Native approach:** Add `app.run()` as a system actor:
```obo
use App;

App.onFrame(action() {
    // render
});
App.onEvent(action(event) {
    check (event.type)
    {
        is "keyDown" { /* handle */ }
        is "mouseMove" { /* handle */ }
    }
});
App.run();  // blocks, dispatches callbacks
```
This is a higher-level API that wraps the C bridge internally.

### 7.9 Shader / Asset Pipeline

**Problem:** GPU programs need compiled shaders (MSL for Metal, SPIR-V for Vulkan). Currently `obo build` only compiles `.obo` files — no way to compile `.metal` or `.glsl` files, embed them as resources, or generate shader code at build time.

**Fix:** Add build-step hooks:
```obo
// obo.project (build config)
assets
{
    shaders = "shaders/*.metal" -> metallib;
    shaders = "shaders/*.glsl" -> spirv;
}
```
Or simpler: embed shader source as multi-line strings and compile at runtime:
```obo
shader_src = """
    #include <metal_stdlib>
    kernel void add(device float* a [[buffer(0)]],
                    device float* b [[buffer(1)]],
                    uint id [[thread_position_in_grid]])
    {
        a[id] = a[id] + b[id];
    }
""";
library = device.compileShader(shader_src);
```
Runtime compilation is how most Metal/Vulkan apps work in practice. Avoids build pipeline complexity.

### 7.10 Tensor / AI Primitives

**Problem:** AI frameworks need large contiguous f32 arrays (tensors), matrix multiply, convolution, and GPU compute dispatch. OBO's lists are GC-tracked with per-element tagging — wrong for tensors.

**Fix:** Build on `buffer` (already exists) + `float` (7.1):
```obo
// Tensor as a flat float buffer with shape metadata
actor Tensor
{
    public data as handle;     // GPU buffer, non-GC
    public shape as list;      // [batch, channels, height, width]
    public dtype as text;      // "f32", "f16"

    shared function zeros(shape as list)
    {
        size = 1;
        for (dim in shape) { size = size * dim; }
        data = gpu.allocBuffer(size * 4);  // 4 bytes per f32
        out Tensor { data = data; shape = shape; dtype = "f32"; };
    }

    function matmul(other as Tensor)
    {
        // dispatch GPU compute shader
        out gpu.dispatch("matmul", self.data, other.data, result_data);
    }
}
```
The heavy lifting happens in GPU compute shaders — OBO is the orchestrator, not the compute engine. This is the same architecture as PyTorch (Python orchestrates, CUDA computes).

---

## 8. Dependency Graph

```
Safe/Metal boundary (0.2) ────→ ALL metal features depend on this

Metal memory tools (0.3) ─────→ Arena, defer, own
  ├─→ Arena ───────────────────→ Per-frame GPU alloc, compiler passes
  ├─→ defer ───────────────────→ Resource cleanup (files, handles, buffers)
  └─→ own ─────────────────────→ Single-owner auto-free

f32 (7.1, metal-only) ────────┐
                               ├─→ Vector/Matrix value types (7.5)
Packed structs (2.2) ─────────┤
Fixed-width ints (2.4) ───────┤
                               ├─→ Mapped buffer access (7.6)
Pointer arithmetic (2.3) ─────┘

Bitwise operators (2.5) ──────→ Shader parameter packing

bridge "lib" (existing) ──────→ Obj-C wrapper (7.2) ──→ Metal backend
                          └──→ Vulkan bridge (7.3) ──→ Vulkan backend

Handle type (7.4, metal) ─────→ GPU resource lifetime
  + own/defer (0.3) ──────────→ Safe GPU resource actors

Callback exports (7.7) ──────→ Event loop (7.8)
                          └──→ Vulkan debug callbacks

Mutable collections (1.1) ───→ Command buffer building, self-hosting
String builder (1.2) ─────────→ Shader source generation, lexer

No-GC mode (3.4) ────────────→ Hot render loop (no GC pauses during frame)

Self-hosted runtime (0.4) ────→ metal blocks + bridge to kernel syscalls
  → GC written in OBO metal
  → Entity allocator in OBO metal
  → String ops in OBO metal
  → C runtime eliminated
```

---

## 9. Priority Order

| Priority | Domain | Items | Impact |
|----------|--------|-------|--------|
| **P0** | Architecture | ~~0.2 Safe/metal boundary~~ ✅, ~~0.3 Metal memory tools (arena, defer, own)~~ ✅ | ✅ Done. Boundary enforced, defer/Arena/own all implemented across all layers |
| **P1** | Performance | ~~6.1 Tag-skip~~ ✅, ~~6.9 Const folding~~ ✅, ~~6.7 Inline small functions~~ ✅ | ✅ Done. fibonacci 0.85x (beats C++), nbody 2.6x → 2.1x, all improved |
| **P2** | Self-hosting | ~~1.1 Mutable collections~~ ✅, ~~1.2 String builder~~ ✅, ~~1.3 Integer-keyed maps~~ ✅ | ✅ Done. All three self-hosting blockers implemented (interpreter + native) |
| **P3** | Metal primitives | ~~2.5 Bitwise ops~~ ✅, ~~2.4 Fixed-width ints~~ ✅, ~~7.1 f32~~ ✅, ~~2.2 Packed structs~~ ✅ | ✅ Done. All metal primitives implemented |
| **P4** | GPU interop | ~~7.2 Obj-C bridge (C wrapper)~~ ✅, ~~7.3 Vulkan bridge~~ ✅, ~~7.4 Handle type~~ ✅ | ✅ Done. Bridge + handle + packed structs enable Metal/Vulkan |
| **P5** | Debugger | ~~4.1 DWARF info~~ ✅, ~~4.2 Stack traces~~ ✅ | ✅ Done. lldb source-level debugging, shadow call stack, crash signal handlers |
| **P6** | GPU math | ~~7.5 Vector/matrix value types~~ ✅, ~~7.6 Mapped buffer access~~ ✅ | ✅ Done. `value` types with stack-allocated packed structs, component-wise arithmetic, `.dot()`, `.length()`, pointer ops |
| **P7** | Performance | ~~6.3 Escape analysis~~ ✅, ~~6.6 TCO~~ ✅, ~~6.8 GC pressure~~ ✅, ~~3.4 No-GC mode~~ ✅ | ✅ Done. --no-gc: binary_trees 5.8ms (beats C++ 6.1ms), nbody 22.9ms (1.68x), map_stress 44.0ms (1.40x). TCO for tail calls, escape analysis infrastructure |
| **P8** | UI/Platform | ~~7.7 Callback exports~~ ✅, ~~7.8 Event loop~~ ✅ | ✅ Done. @export C-compatible function pointers, poll-based event loop with fps throttling, bridge i8* raw pointer coercion |
| **P9** | Bare metal | ~~3.1 Freestanding runtime~~ ✅, ~~3.2 Linker scripts~~ ✅, ~~3.3 Target triples~~ ✅, ~~3.5 Interrupts~~ ✅ | ✅ Done. --freestanding Tier 0 runtime, --target cross-compilation, --linker-script/--entry/--no-stdlib, @interrupt with naked CC |
| **P10** | Runtime | 0.4 Self-hosted runtime — ~~mem intrinsics~~ ✅, ~~allocator~~ ✅, strings, GC in OBO metal | 🔧 In progress. `mem.load64/store64/load8/store8` intrinsics, free-list allocator proven (19/19 tests) |
| **P11** | Meta | 5.1 Const functions, 5.2 Derive macros, 1.4 Structured errors | Developer productivity |
| **P12** | AI/Compute | 7.10 Tensor primitives, 7.9 Shader pipeline | AI framework foundation |
| **P13** | Performance | 6.2 Typed arrays, 6.4 LICM, 6.5 SIMD, 2.1 Inline asm | Diminishing returns / niche |

---

## Summary

OBO has two execution worlds: **safe** (GC-managed, type-safe, clean syntax) and **metal** (manual memory, raw access, machine types). They do not mutate each other — values cross the boundary by conversion only.

What's needed:
- **~~Safe/metal architecture~~ (P0)** — ✅ Done. Boundary enforced, arena/defer/own all implemented
- **~~Performance~~ (P1)** — ✅ Done. Tag-skip, const folding, internal linkage inlining. fibonacci beats C++, all benchmarks 3–19% faster
- **Self-hosting** (P2) — ✅ Done: mutable collections, TextBuilder, integer-keyed maps
- **~~Metal primitives~~ (P3)** — ✅ Done. f32, bitwise ops, fixed-width ints, packed structs — all implemented
- **~~GPU interop~~ (P4)** — ✅ Done. Metal/Vulkan bridges, handle type, packed structs
- **~~Debugger~~ (P5)** — ✅ Done. DWARF debug info, lldb source-level debugging, shadow call stack, crash signal handlers
- **~~GPU math~~ (P6)** — ✅ Done. Value types with stack-allocated packed structs, component-wise arithmetic, `.dot()`, `.length()`, pointer buffer ops
- **~~Performance~~ (P7)** — ✅ Done. --no-gc beats C++ on binary_trees, TCO, escape analysis
- **~~UI/Platform~~ (P8)** — ✅ Done. @export callbacks, event loop
- **~~Bare metal~~ (P9)** — ✅ Done. --freestanding, --target, --linker-script, --entry, --no-stdlib, @interrupt
- **Self-hosted runtime** (P10) — 🔧 In progress. `mem` intrinsics done, free-list allocator written in pure OBO (19/19 tests). Next: strings, GC, full C runtime replacement

The safe language surface does not change. All machine-level capability is behind `metal {}`. Library users (Cogal, UI, AI) interact with clean safe OBO — actors wrap metal internals. The C runtime is scaffolding that gets replaced when OBO can express its own GC and allocator in metal.
