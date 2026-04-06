# OBO Feature Implementation Plan

Everything missing, ordered by priority. Status key:
- **interp** = interpreter, **IR** = IR lowering, **native** = LLVM emit
- ✅ done, 🟡 stub/partial, ❌ needs work

---

## P0 — Self-Hosting Critical

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 1 | String interpolation `"hi {x}"` | ✅ | ✅ | ✅ | ✅ | **Done** |
| 2 | `const` declarations | ✅ | ✅ | ✅ | ✅ | **Done** (inlined at IR time) |
| 3 | `choice` (enums) | ✅ | ✅ | ✅ | ✅ | **Done** (entity w/ __variant, pattern matching, field destructuring) |
| 4 | `possible / else` (error handling) | ✅ | ✅ | ✅ | ✅ | **Done** (setjmp/longjmp, safe div/mod, block + inline forms) |
| 5 | Default parameters | ✅ | ✅ | ✅ | ✅ | **Done** |
| 6 | Multi-return / destructuring | ✅ | ✅ | ✅ | ✅ | **Done** (out multi-values, MultiAssign destructuring) |
| 7 | Pipe operator `\|>` / `then` | ✅ | ✅ | ✅ | ✅ | **Done** (+ checker arity fix) |
| 8 | Type aliases `type X = Y` | ✅ | ✅ | ✅ | ✅ | **Done** (parser-only, no runtime effect in dynamic language) |
| 9 | `prompt` (stdin) | ✅ | ✅ | ✅ | ✅ | **Done** (obo_prompt C runtime) |
| 10 | Multi-line strings `"""..."""` | ✅ | ✅ | ✅ | ✅ | **Done** (verified) |

## P1 — Type System

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 11 | Union types `number or text` | ✅ | ✅ | ✅ | ✅ | **Done** (can_assign_to handles Union; runtime is dynamically typed) |
| 12 | Generics `of T` | ✅ | ✅ | ✅ | ✅ | **Done** (list/set special-cased; user generics type-erased at runtime) |
| 13 | Named arguments | ✅ | ✅ | ✅ | ✅ | **Done** (reorder by param name in interp + IR lowering) |
| 14 | Range as value `1 to 10` | ✅ | ✅ | ✅ | ✅ | **Done** (obo_range C runtime, exclusive end) |

## P2 — OOP & Actors

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 15 | Traits `has Movable` | ✅ | ✅ | ✅ | ✅ | **Done** (method + field conformance checking) |
| 16 | Properties `get/set` | ✅ | ✅ | ✅ | ✅ | **Done** (getter/setter dispatch in interp, IR desugars to methods) |
| 17 | `abstract` / `sealed` enforcement | ✅ | ✅ | ✅ | ✅ | **Done** (interp blocks abstract instantiation, checker enforces sealed/abstract) |
| 18 | Operator overloading | ✅ | ✅ | ✅ | ✅ | **Done** (parse `operator +()`, interp dispatch on Instance binary ops) |
| 19 | System actors `system actor X` | ✅ | ✅ | ✅ | ✅ | **Done** (hardcoded Math/Time/File/Convert, full interp + native support) |

## P3 — Concurrency & Systems

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 20 | Real concurrency (`run` = threads) | ✅ | ✅ | ✅ | ✅ | **Done** (pthread-based native, std::thread interpreter) |
| 21 | Channels `channel of T` | ✅ | ✅ | ✅ | ✅ | **Done** (blocking queue + condvar, full stack) |
| 22 | `atomic of T` | ✅ | ✅ | ✅ | ✅ | **Done** (AtomicI64 interp, C runtime load/store/add/sub) |
| 23 | Events `emit` / `listen` | ✅ | ✅ | ✅ | ✅ | **Done** (obo_event_listen/emit C runtime, IR lowers emit + listen pattern) |
| 24 | Metal mode `metal { }` | ✅ | ✅ | ✅ | ✅ | **Done** (compile-time semantic marker, plain block at runtime) |
| 25 | Bridge / FFI `bridge "lib"` | ✅ | ✅ | ✅ | ✅ | **Done** (bridge decl → LLVM declare + -l linker, void/i32/variadic handling) |
| 26 | `byte` / `bits` / `pointer` types | ✅ | ✅ | ✅ | ✅ | **Done** (0b/0x literals, byte clamping, pointer.alloc/free native) |

## P4 — Collections & Data

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 27 | `set` | ✅ | ✅ | ✅ | ✅ | **Done** (MakeList + obo_set_* C runtime, dedup semantics) |
| 28 | `queue` / `stack` | ✅ | ✅ | ✅ | ✅ | **Done** (MakeList + obo_queue_*/obo_stack_* C runtime) |
| 29 | `pair` / `slice` / `buffer` / `bag` | ✅ | ✅ | ✅ | ✅ | **Done** (pair=2-list, bag=list, buffer=OboBuffer C struct, slice=obo_list_slice) |
| 30 | `grid2d` / `grid3d` | ✅ | ✅ | ✅ | ✅ | **Done** (OboGrid2D/3D C structs, flat array indexing, full method support) |
| 31 | Iterators / `emit` yield | ✅ | ✅ | ✅ | ✅ | **Done** (consumer-driven interp, generator inlining native, infinite+finite) |

## P5 — Meta & Reflection

| # | Feature | Parse | Interp | IR | Native | Work Needed |
|---|---------|:-----:|:------:|:--:|:------:|-------------|
| 32 | `@test` attribute + `assert()` | ✅ | ✅ | ✅ | ✅ | **Done** (attribute parsed, is_test on FunctionSig, assert statement with message) |
| 33 | `@deprecated` | ✅ | ✅ | ✅ | ✅ | **Done** (checker warns on deprecated function/entity/actor usage) |
| 34 | `@serializable` / `@reflectable` | ✅ | ✅ | ✅ | ✅ | **Done** (attribute flags on TypeInfo, enable reflect introspection) |
| 35 | Reflection `reflect(obj)` | ✅ | ✅ | ✅ | ✅ | **Done** (returns list of {name, value, type} maps; entities in native via OboMixedList) |
| 36 | Conditional compilation `#if` | ✅ | ✅ | ✅ | ✅ | **Done** (platform/mode/backend config, interpreter + IR lowering) |

## P6 — Tooling

| # | Feature | Status |
|---|---------|--------|
| 37 | `obo test` (@test runner) | ✅ |
| 38 | `obo repl` (interactive shell) | ✅ |
| 39 | `obo fmt` (formatter) | ✅ |
| 40 | `obo doc` (doc generator) | ✅ |
| 41 | LSP (VS Code integration) | ✅ |
| 42 | Package manager | ❌ |

## Native Backend Gaps

| # | Issue | Notes |
|---|-------|-------|
| 43 | Map/entity insertion-order | ✅ Doubly-linked order list in OboMap |

---

## Execution Order

**Wave 1** ✅ — String interpolation (native), const (native), multi-line strings (verified)
**Wave 2** ✅ — Default params, pipe operator, prompt (IR + native)
**Wave 3** ✅ — choice/enums (IR + native + pattern matching)
**Wave 4** ✅ — possible/else error handling (IR + native)
**Wave 5** ✅ — Type aliases, union types, named arguments
**Wave 6** ✅ — Generics, ranges as values
**Wave 7** ✅ — Traits, properties, abstract/sealed, operator overloading
**Wave 8** ✅ — Multi-return / destructuring
**Wave 9** ✅ — Events (native), system actors (native)
**Wave 10** ✅ — Real concurrency, channels, atomic
**Wave 11** ✅ — Metal mode, bridge/FFI, byte/bits/pointer
**Wave 12** ✅ — Collections (set, queue, stack, pair, bag, buffer, slice, grid2d, grid3d)
**Wave 13** ✅ — Iterators/emit yield (consumer-driven interp, generator inlining native)
**Wave 14** ✅ — Attributes, reflection
**Wave 15** — Tooling (test → repl → fmt → doc → LSP → pkg mgr)
