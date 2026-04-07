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

### 0.2 Boundary Rules

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

### 0.3 Metal Memory Management

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

### 1.1 Mutable Collections

**Problem:** Lists and maps are copy-on-write. Building an AST with `list.add(node)` copies the entire list on every append. A compiler with 10,000 AST nodes would do ~50 million element copies during parsing alone.

**Fix:** Add `mutable list` / `mutable map` variants backed by in-place resize arrays and open-addressing hash tables. No COW, no realloc-copy on append. The type system already has `list` vs `set` — adding `mutable list` is the same pattern.

**Impact:** Unlocks self-hosting, improves map_stress and database_heavy benchmarks.

### 1.2 Efficient String Builder

**Problem:** The lexer/parser needs character-by-character string building. Current `text + text` allocates a new string per concat (malloc + memcpy + GC registration). Tokenizing a 10K-line file would produce ~500K intermediate strings.

**Fix:** `buffer` already exists as a byte array. Add a `TextBuilder` (or reuse `buffer`) with `.append(char)` / `.append(text)` that writes into a pre-allocated backing array and `.build()` once at the end.

### 1.3 HashMap with Non-String Keys

**Problem:** Symbol tables need `Map<AstNodeId, SymbolInfo>` — integer-keyed maps. Current `OboMap` only supports string keys (FNV-1a hash on `char*`, intern table). Using `"" + id` as a workaround adds string allocation on every lookup.

**Fix:** Extend `OboMap` (or add `IntMap`) to support integer keys natively. Hash is trivial (`key % nbuckets`), no interning needed.

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

### 2.2 Packed Structs / Explicit Layout Control

**Problem:** Entity slots are 16-byte `OboValue` (tag + union + padding). Systems work (network protocols, file formats, hardware registers) needs exact byte-level layout.

**Fix:** `packed` structs inside `metal` with explicit field types and alignment:
```obo
metal
{
    packed TCPHeader
    {
        src_port as u16;
        dst_port as u16;
        seq_num as u32;
    }
}
```
Emit as LLVM packed struct (`<{ i16, i16, i32 }>`) with no padding. `packed` is a metal-only keyword — safe entities keep their current layout.

### 2.3 Raw Pointer Arithmetic

**Problem:** `pointer.alloc` / `pointer.free` exist but there's no pointer arithmetic, no typed loads/stores, no volatile access for MMIO.

**Fix:** All inside `metal` blocks:
- `pointer.offset(n)` — advance by n bytes
- `pointer.read(type)` / `pointer.write(type, value)` — typed load/store
- `pointer.volatile_read()` / `pointer.volatile_write()` — for MMIO
- `(pointer)integer` / `(number)pointer` — bidirectional cast

### 2.4 Fixed-Width Integer Types

**Problem:** Only `number` (i64) and `byte` (u8) exist. Hardware interfaces need `u16`, `u32`, `i32`, `i8`, `u64`.

**Fix:** `i8`, `i16`, `i32`, `i64`, `u8`, `u16`, `u32`, `u64` as types inside `metal` blocks only. Map directly to LLVM integer types. Outside `metal`, everything remains `number` (i64).

### 2.5 Bitwise Operators

**Problem:** No bitwise operators. Systems code lives on bit manipulation.

**Fix:** Inside `metal` blocks only:
- `a & b` (AND), `a | b` (OR), `a ^ b` (XOR)
- `a << n` (shift left), `a >> n` (shift right)
- `~a` (bitwise NOT)
- Work on all fixed-width types and `number`/`byte`

---

## 3. Bare-Metal Capability

### 3.1 Freestanding Runtime

**Problem:** `obo_rt.c` depends on libc (`malloc`, `free`, `printf`, `strlen`, `snprintf`, `strcmp`, `fopen`, `time`, `usleep`, `pthread_create`, ...). No libc on bare metal.

**Fix:** Split the runtime into tiers:
- **Tier 0 (freestanding):** No libc. User provides `obo_alloc(size)` / `obo_free(ptr)` / `obo_putchar(c)`. GC, entities, lists work on top of these 3 functions. No file I/O, no threading, no time.
- **Tier 1 (hosted):** Links libc. Full stdlib (File, Time, Math, Convert). Current behavior.
- `obo build --freestanding` selects Tier 0. User implements the 3 stubs in their `bridge` block or links a HAL.

### 3.2 Custom Linker Scripts

**Problem:** `obo build` shells out to `clang` with default linker settings. Bare-metal targets need custom linker scripts (memory regions, entry point, section placement).

**Fix:**
- `obo build --linker-script=flash.ld` — pass `-T flash.ld` to clang/ld
- `obo build --entry=_start` — override entry point (default: `main`)
- `obo build --no-stdlib` — don't link libc or CRT

### 3.3 Target Triples

**Problem:** Only builds for the host platform. Can't cross-compile for ARM Cortex-M, RISC-V, x86 bare-metal, or WebAssembly.

**Fix:**
- `obo build --target=thumbv7em-none-eabi` — ARM Cortex-M4
- `obo build --target=riscv32imac-unknown-none-elf`
- `obo build --target=wasm32-unknown-unknown`
- Pass `--target=` to clang. The LLVM IR is already target-agnostic — this is mostly a flag-passing exercise plus runtime tier selection.

### 3.4 No-GC Mode

**Problem:** GC is always on. Bare-metal and real-time systems can't tolerate unpredictable collection pauses.

**Fix:**
- `obo build --no-gc` — all allocations are arena-bumped, freed at program exit only
- Inside `metal` blocks, allocations use the raw allocator (no GC tracking at all)
- For self-hosting: the compiler can use arena allocation per-file (allocate during parse/compile, free everything when done)

### 3.5 Interrupt Handlers

**Problem:** No way to declare interrupt service routines with the right calling convention and no-return semantics.

**Fix:**
```obo
metal
{
    @interrupt
    function timer_handler()
    {
        // runs in interrupt context
        // no GC, no allocation, no heap
    }
}
```
Emit with `naked` or `interrupt` calling convention in LLVM IR.

---

## 4. Debugger / DWARF Info

### 4.1 Source-Level Debug Info

**Problem:** Compiled binaries have no debug information. `lldb` can't show source lines, variable names, or step through OBO code. Crash dumps are raw addresses.

**Fix:** Emit LLVM debug metadata:
- `!DIFile` for each source file
- `!DISubprogram` for each function (name, line, scope)
- `!DILocalVariable` for each variable (name, type, line)
- `!DILocation` on each instruction (line, column)
- Compile with `obo build --debug` (pass `-g` to clang)

**Implementation:** Add a `debug_line: u32` field to `Inst` in the IR. During lowering, copy `span.line` from AST nodes. During LLVM emit, attach `!dbg !N` to each instruction and emit the metadata section.

### 4.2 Stack Traces on Crash

**Problem:** Unhandled errors print a message and `exit(1)`. No call stack, no source location.

**Fix:**
- Maintain a shadow call stack in the C runtime: `obo_frame_push("function_name", line)` / `obo_frame_pop()` at function entry/exit
- On unhandled error: walk the frame stack, print `function_name:line` for each frame
- In `--debug` builds: use DWARF unwind info instead (zero-cost when no error)

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

Current state: OBO is **1.0x** C++ on fibonacci, **2.1x** on binary_trees, **2.6x** on nbody, **3.4x** on map_stress, **1.6x** on database_heavy.

### 6.1 Typed Entity Slots (nbody: 2.6x → ~1.5x)

**Problem:** Entity fields are 16-byte `OboValue` slots (1-byte tag + 8-byte union + 7 padding). The nbody inner loop reads/writes `bi.x`, `bi.y`, `bi.z`, `bi.vx`, etc. — each is a 16-byte load/store when C++ uses 8-byte doubles directly. The tag byte is written on every `SetField` even when the type never changes.

**Fix:** When type inference proves all instances of an entity type have the same field types (e.g., `Body` always has f64 fields), emit a **typed struct** instead of a slotted OboValue array:
```llvm
; Instead of: OboValue[7] (112 bytes)
; Emit:
%Body = type { double, double, double, double, double, double, double }
; 56 bytes, direct field access, no tags
```
**Skip tag writes** for fields whose type is statically known. If `Body.x` is always f64, write the double directly — no `store i8 5` tag prefix.

### 6.2 Unbox Known-Type List Elements (nbody: → ~1.3x)

**Problem:** `bodies[i]` goes through `obo_mixed_list_get()` — a C function call that returns an `OboValue*` (pointer to 16-byte tagged slot). C++ accesses `bodies[i]` as a direct struct pointer.

**Fix:** When a list is known to contain only entities of one type, store them as a **typed array** (`Body**` instead of `OboValue[]`). Element access becomes a single `getelementptr` + load — no function call, no tag check.

### 6.3 Escape Analysis + Stack Allocation (binary_trees: 2.1x → ~1.3x)

**Problem:** Every `TreeNode { left = ...; right = ...; }` calls `obo_entity_new_slotted()` → `malloc` → GC registration. In binary_trees, millions of short-lived nodes are heap-allocated and immediately GC'd.

**Fix:** If an entity doesn't escape the current function (not stored in a global, not returned, not passed to an unknown function), allocate it on the stack:
```llvm
%node = alloca %TreeNode     ; stack allocation, zero cost
```
No malloc, no GC root, no collection. When the function returns, the stack frame is freed automatically. This is the single biggest optimization for allocation-heavy benchmarks.

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

### 6.6 Tail Call Optimization (fibonacci: maintain 1.0x)

**Problem:** `fib(n-1) + fib(n-2)` isn't tail-recursive, so TCO doesn't apply here. But `factorial(n)`, tree traversals, and many recursive patterns ARE tail calls — and currently each call pushes a full stack frame + GC roots.

**Fix:** Mark tail calls with `musttail` in LLVM IR when the return value is the direct result of a call (no post-call computation). Emit `musttail call` instead of `call`. LLVM reuses the current stack frame.

### 6.7 Inline Small Functions

**Problem:** The LLVM IR emitter generates one function per OBO function. Small helpers (like `check_tree(node)` in binary_trees — 3 lines) pay full call overhead: argument passing, GC root push/pop, stack frame setup.

**Fix:** Add `alwaysinline` attribute to functions below a size threshold (e.g., < 10 IR instructions). Or emit LLVM `define internal` (module-private) and let LLVM's inliner decide. Currently functions are `define` with default linkage — marking them `internal` enables cross-function optimization.

### 6.8 Reduce GC Pressure

**Current state:** GC collects when `alloc_count > threshold` (starts at 256, doubles adaptively). Every `obo_entity_new`, `obo_str_concat`, `obo_list_new`, and `obo_map_new` increments the counter.

**Quick wins:**
- **Bump allocator for short-lived scopes:** Inside a loop body, use a bump allocator that resets at the end of each iteration. No GC tracking, no mark phase.
- **Pre-size lists:** `MakeList` with a known element count should allocate exact capacity, not grow-by-doubling.
- **String deduplication:** Identical string constants should share a single allocation (already happens for globals, but not for computed strings that happen to be equal).

### 6.9 Compile-Time Constants Folding

**Problem:** `4.0 * Math.pi * Math.pi` in nbody computes `Math.pi` at runtime (calls `__sys_Math_pi` → returns `3.14159...`). This should be a constant.

**Fix:** Inline known-constant system actor values at IR lowering time. `Math.pi` → `Const(F64, 3.141592653589793)`. Same for `Math.e`, `Math.infinity`, etc. Then constant folding turns `4.0 * pi * pi` into a single `Const(F64, 39.4784...)`.

---

## 7. GPU / Graphics / AI

Target: Port Cogal (Metal + Vulkan compute abstraction) to OBO, build a UI library on top, and eventually support AI frameworks with GPU compute.

### 7.1 `float` / `f32` Type (Metal-Only)

**Problem:** OBO only has `decimal` (f64). All GPU APIs, shader languages, vertex formats, uniform buffers, and tensor operations use f32.

**Fix:** `f32` exists only inside `metal` blocks:
```obo
metal
{
    x = 3.14f as f32;            // f32 literal
    y = some_decimal as f32;     // explicit narrowing from safe decimal
    result = (x * y) as decimal; // widen back to cross boundary
}
```
- LLVM: `float` (IEEE-754 single precision)
- Cannot escape metal blocks — safe OBO uses `decimal` (f64) exclusively
- GPU-facing actors wrap f32 conversions in their `metal` internals

### 7.2 Objective-C Bridge (Metal)

**Problem:** Metal's API is Objective-C (`MTLDevice`, `MTLCommandBuffer`, etc.). OBO's `bridge` only supports C linkage. Can't call `[device newCommandQueue]` or `[buffer contents]`.

**Fix — Option A (C wrapper):** Write a thin C wrapper (`cogal_metal.c`) that exposes Metal as C functions:
```c
void* cogal_mtl_create_device(void);
void* cogal_mtl_create_command_queue(void* device);
void* cogal_mtl_create_buffer(void* device, size_t size, int options);
```
OBO bridges these C functions. This is how most cross-language Metal bindings work (Rust's `metal-rs` does this too). **Zero language changes needed — works today.**

**Fix — Option B (native Obj-C bridge):** Add `bridge "objc"` with message-send syntax:
```obo
bridge "objc"
{
    function MTLCreateSystemDefaultDevice() out pointer;
    function objc_send(obj as pointer, sel as text, ...) out pointer;
}
```
Emit `objc_msgSend` calls in LLVM IR. More work, more power.

**Recommendation:** Start with Option A. It's proven, portable, and requires zero compiler changes.

### 7.3 Vulkan Bridge

**Problem:** Vulkan is a C API — OBO's `bridge` already handles C. But Vulkan uses deeply nested structs (`VkInstanceCreateInfo`, `VkPhysicalDeviceProperties`) with exact layout requirements.

**Fix:** Depends on packed structs (2.2) and fixed-width ints (2.4) from the systems section. Once those exist:
```obo
bridge "vulkan"
{
    function vkCreateInstance(info as pointer, alloc as pointer, instance as pointer) out i32;
    function vkEnumeratePhysicalDevices(instance as pointer, count as pointer, devices as pointer) out i32;
}
```
Vulkan struct construction uses packed entities with explicit field types.

### 7.4 Unmanaged Handles (Metal-Only GPU Resource Lifetime)

**Problem:** GPU objects (devices, buffers, textures, pipelines) are created/destroyed by the driver, not OBO's GC. GC collecting a GPU resource → crash or leak.

**Fix:** `handle` type — a non-GC-tracked opaque pointer, metal-only:
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

### 7.5 GPU-Compatible Vector/Matrix Types (Metal-Only Values)

**Problem:** Math stdlib has `Vector2`, `Vector3` as heap-allocated entities with f64 fields. GPU work needs stack-allocated f32 vectors with SIMD-friendly layout.

**Fix:** `value` types inside `metal` — stack-allocated, no GC, passed by value:
```obo
metal
{
    value float2 { x as f32; y as f32; }
    value float3 { x as f32; y as f32; z as f32; }
    value float4 { x as f32; y as f32; z as f32; w as f32; }
    value float4x4 { columns as f32[16]; }

    a = float3 { x = 1.0f; y = 2.0f; z = 3.0f; };
    b = float3 { x = 4.0f; y = 5.0f; z = 6.0f; };
    c = a + b;          // component-wise add
    d = a.dot(b);       // dot product
}
```
- Emit as LLVM vector types (`<4 x float>`) or packed structs
- LLVM maps to SIMD registers (NEON on Apple Silicon, SSE/AVX on x86)
- Cannot escape metal blocks — safe code uses entity-based `Vector2/3` from Math stdlib
- GPU-facing actors convert safe entities ↔ metal value types at the boundary

### 7.6 Mapped Buffer Access

**Problem:** GPU shared/managed buffers are mapped to CPU address space. You need to write structured data (vertices, uniforms, compute inputs) into a raw `void*` at specific byte offsets.

**Fix:** Combine `pointer` (2.3) + `float` (7.1) + value types (7.5):
```obo
metal
{
    ptr = buffer.contents();   // get mapped CPU pointer (handle → pointer)
    ptr.write(float4 { x = 1.0f; y = 0.0f; z = 0.0f; w = 1.0f; });
    ptr = ptr.offset(16);     // advance 16 bytes (sizeof float4)
    ptr.write(float4 { x = 0.0f; y = 1.0f; z = 0.0f; w = 1.0f; });
}
```
This requires pointer arithmetic (2.3), `float` (7.1), and value types (7.5) to all be working.

### 7.7 C-Compatible Function Pointers (Callbacks)

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

### 7.8 Platform Event Loop

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
float (7.1) ──────────────────┐
                               ├─→ Vector/Matrix types (7.5)
Packed structs (2.2) ─────────┤
Fixed-width ints (2.4) ───────┤
                               ├─→ Mapped buffer access (7.6)
Pointer arithmetic (2.3) ─────┘
                               
Bitwise operators (2.5) ──────→ Shader parameter packing

bridge "lib" (existing) ──────→ Obj-C wrapper (7.2) ──→ Metal backend
                          └──→ Vulkan bridge (7.3) ──→ Vulkan backend

Handle type (7.4) ────────────→ GPU resource lifetime

Callback exports (7.7) ──────→ Event loop (7.8)
                          └──→ Vulkan debug callbacks

Mutable collections (1.1) ───→ Command buffer building
String builder (1.2) ─────────→ Shader source generation

No-GC mode (3.4) ────────────→ Hot render loop (no GC pauses during frame)
```

---

## 9. Priority Order

| Priority | Domain | Items | Impact |
|----------|--------|-------|--------|
| **P0** | Performance | 6.1 Typed entity slots, 6.9 Const folding, 6.7 Inline small functions | nbody 2.6x → ~1.5x, all benchmarks improve |
| **P1** | Self-hosting | 1.1 Mutable collections, 1.2 String builder, 1.3 Integer-keyed maps | Unlocks compiler-in-OBO |
| **P2** | GPU foundation | 7.1 `float`/f32, 2.5 Bitwise ops, 2.4 Fixed-width ints, 2.2 Packed structs | Required for any GPU/hardware work |
| **P3** | GPU interop | 7.2 Obj-C bridge (C wrapper), 7.3 Vulkan bridge, 7.4 Handle type | Cogal port unblocked |
| **P4** | Debugger | 4.1 DWARF info, 4.2 Stack traces | Usability for real development |
| **P5** | GPU math | 7.5 Vector/matrix value types, 7.6 Mapped buffer access | GPU data pipeline |
| **P6** | Performance | 6.3 Escape analysis, 6.6 TCO, 6.8 GC pressure, 3.4 No-GC mode | binary_trees 2.1x → ~1.3x, stutter-free render |
| **P7** | UI/Platform | 7.7 Callback exports, 7.8 Event loop | UI library foundation |
| **P8** | Bare metal | 3.1 Freestanding runtime, 3.3 Target triples, 3.5 Interrupts | Cross-compilation, embedded |
| **P9** | Meta | 5.1 Const functions, 5.2 Derive macros, 1.4 Structured errors | Developer productivity |
| **P10** | AI/Compute | 7.10 Tensor primitives, 7.9 Shader pipeline | AI framework foundation |
| **P11** | Performance | 6.2 Typed arrays, 6.4 LICM, 6.5 SIMD, 2.1 Inline asm | Diminishing returns / niche |

---

## Summary

The language surface is complete. What's needed is:
- **Runtime optimizations** (typed structs, escape analysis, mutable collections) to close the 2–3x gap to C++
- **Tooling** (DWARF, stack traces, package manager) to make OBO usable for real projects
- **Systems primitives** (f32, bitwise ops, fixed-width ints, packed structs) for hardware and GPU work
- **GPU interop** (Metal/Vulkan bridge, handle types, vector math, mapped buffers) for Cogal port
- **UI/Platform** (callback exports, event loop) for direct UI library
- **Freestanding runtime** for bare-metal targets

Self-hosting is ~P1 work. Cogal port is ~P2–P3 (f32 + bridges + handles). Full GPU math pipeline is ~P5. UI library needs P7. AI frameworks need P10. Matching C++ on all benchmarks is ongoing P0/P6/P11.
