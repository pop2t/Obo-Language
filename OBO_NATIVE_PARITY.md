# Native backend parity (Phase 7): OBO → IR → LLVM

This document tracks **what `obo build` can compile today** versus the **full language** (`obo run`). Use it to plan Phase 7 work: each row is either **done**, **partial**, **blocked on IR/runtime**, or **out of scope for bootstrap**.

**Legend**

| Symbol | Meaning |
|--------|---------|
| ✅ | Implemented end-to-end for the **stated** feature (lower → infer → emit → link); semantics match the **Notes** column unless noted |
| 🟡 | Works only in a **narrow subset**, differs from `obo run`, or depends on a **deliberate bootstrap** rule (see below) |
| ⬜ | Not implemented for native yet |
| — | Not applicable |

**References**

- IR opcodes: `src/ir/inst.rs`
- Lowering (actors, `Call` / `CallMethod`): `src/ir/lowering.rs`
- LLVM emitter: `src/llvm_emit/emit.rs` (`emit_inst`; unsupported constructs surface as emit-time errors)
- Native method dispatch (C codegen): `src/llvm_emit/dispatch.rs` → `generate_obo_native_dispatch_c` (appended when linking)
- Runtime (C): `runtime/obo_rt.c`, embedded as `runtime_c.rs` — string ops, heap structures, stdlib stubs, text/list/map methods, tracing GC
- Examples that are known to build: `examples/native_*.obo` (see `scripts/test_native_examples.sh`)

**Deliberate bootstrap semantics**

- **`decimal`:** LLVM uses **`double`** (IEEE-754 f64). Mixed int/float arithmetic auto-promotes via `sitofp`/`fptosi`. `show` uses `obo_print_double`.
- **`char` / `null`:** Canonical native encoding **`i64`** (code unit / 0).
- **`flag`:** Stored as **`i64` 0/1**; `show` uses **`obo_print_bool`** (`true` / `false` lines).
- **Strings / heap:** Concat, lists, maps, and entities use **`malloc`** (and friends) in `obo_rt.c`. Allocations are **registered with the tracing GC** (kind-tagged nodes); the collector **marks** from LLVM roots (`obo_gc_push_root` / `obo_gc_pop_roots`) and follows **edges** in entities, maps, mixed lists, and boxed `OboValue` shells. `obo_arena_free_all()` at `main` exit frees any remaining nodes. **Not** traced: small C-only allocations (e.g. `MapEntry` buckets, temporary `obo_box_*` before they are stored in a rooted structure) — same class of leaks as before for those paths.
- **`and` / `or`:** Both interpreter and native return **`flag`** (boolean) with **short-circuit** evaluation — `false and f()` never calls `f()`, `true or f()` never calls `f()`. Truthiness: `≠0` for numbers; non-empty for text via `obo_str_truthy`.

---

## 1. Values and types

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| `number` / integers | ✅ | ✅ | ✅ | `i64` |
| `text` literals | ✅ | ✅ | ✅ | Globals + `i8*` |
| `text` variables / concat | ✅ | ✅ | ✅ | `obo_str_concat`; arena-tracked |
| `flag` | ✅ | ✅ | ✅ | `i64` 0/1; `show` → `true`/`false` (`obo_print_bool`) |
| `char` | ✅ | ✅ | ✅ | `i64` code unit |
| `decimal` | ✅ | ✅ | ✅ | **`double`** in LLVM; `LowType::F64`; mixed int/float promotion; `obo_print_double` |
| `null` | ✅ | ✅ | ✅ | `i64` 0 |
| `list` (numbers) | ✅ | ✅ | ✅ | `obo_list_*` for homogeneous; `OboMixedList` + `OboValue` boxing for heterogeneous |
| `map` | ✅ | ✅ | 🟡 | `obo_map_*`; boxed mixed values load back through native `dyn` coercions; nested list/map/entity values now stringify structurally, though entry order still follows native hash buckets |
| `entity` | ✅ | ✅ | 🟡 | `obo_entity_*`; boxed mixed field values round-trip through native `dyn` coercions; nested list/map/entity values now stringify structurally, though field order still follows native hash buckets |

---

## 2. Functions

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| `function name()` | ✅ | ✅ | ✅ | |
| Params `name as type` | ✅ | ✅ | ✅ | |
| Params `name text` (shorthand) | ✅ | ✅ | ✅ | Parser + `IrParamType` |
| `number` / `text` / `flag` / `decimal` params | ✅ | ✅ | ✅ | LLVM types `i64` / `i8*` / `i64` / `double` |
| User function calls | ✅ | ✅ | ✅ | Typed args + return via `infer_function_returns` |
| `out` / return value | ✅ | ✅ | ✅ | Inferred return type (`i64` / `i8*` / `double`) |
| `main` exit code | ✅ | ✅ | ✅ | Must be numeric; `i32` trunc for process exit |
| Indirect / first-class calls | ✅ | ✅ | ✅ | `obo_call_indirect_i64` for legacy; **closures** via `MakeClosure`/`CallClosure` with lexical capture, `OboClosure` struct in C runtime |
| **Static** actor calls `Actor.method(args)` | ✅ | ✅ | ✅ | |
| **Instance** `CallMethod` / `obj.method(args)` | ✅ | ✅ | ✅ | Entity dispatch via `obo_native_call_method_i64` + per-build C. |
| System `Math.*` / `Time.*` / `File.*` / `Convert.*` | ✅ | ✅ | ✅ | Full native stubs in `obo_rt.c` — Math (trig, pow, log, random, lerp, clamp, constants), Time (now, sleep, timer, measure), File (read, write, append, delete, exists, readLines), Convert (toNumber, toText, toDecimal, toFlag, toChar) |

---

## 3. Operators (scalar)

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| `+ - * / %` (numbers) | ✅ | ✅ | ✅ | |
| `+ - * / %` (decimals / mixed) | ✅ | ✅ | ✅ | `fadd`/`fsub`/`fmul`/`fdiv`/`frem`; auto-promote `sitofp` |
| `+` (text + text) | ✅ | ✅ | ✅ | `obo_str_concat` |
| `+` (text + number/decimal) | ✅ | ✅ | ✅ | `obo_i64_to_str` / `obo_f64_to_str` + concat |
| Comparisons (`==`, `<`, …) numbers | ✅ | ✅ | ✅ | `icmp` + i64 |
| Comparisons on `decimal` | ✅ | ✅ | ✅ | `fcmp` on `double` |
| Comparisons on `text` | ✅ | ✅ | ✅ | `strcmp` (lexicographic) |
| `and` / `or` / `not` | ✅ | ✅ | ✅ | Truthiness-based; see bootstrap note |
| Unary `-` (numbers and decimals) | ✅ | ✅ | ✅ | `sub i64 0` / `fsub double 0.0` |

---

## 4. Statements and control flow

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| `show` | ✅ | ✅ | ✅ | `printf` for i64/text, `obo_print_double` for f64, `obo_print_bool` for flags |
| Assignment `=` | ✅ | ✅ | ✅ | |
| `if` / `else` | ✅ | ✅ | ✅ | |
| `while` | ✅ | ✅ | ✅ | |
| `forever` | ✅ | ✅ | ✅ | |
| `count` | ✅ | ✅ | ✅ | |
| `for` / `in` | ✅ | ✅ | ✅ | Index loop over **lists** |
| `stop` / `restart` | ✅ | ✅ | ✅ | |
| `check` (value / compare / null arms) | ✅ | ✅ | ✅ | |
| `check` (`is Type` arms) | ✅ | ✅ | ✅ | `obo_type_check` for entity/dyn scrutinees; compile-time resolution for statically-known types (I64→number, F64→decimal, Str→text, Bool→flag, List→list, Map→map) |
| `wait(duration)` | ✅ | ✅ | ✅ | Lowered to `__sys_Time_sleep(ms)` |
| `wait for` / `wait for all` | ✅ | ✅ | ✅ | Deferred task handles today: `run` creates a task, `wait for` executes one pending task, and `wait for all` drains the queue; real concurrency remains Phase 9 work |
| `run expr` | ✅ | ✅ | ✅ | Statement form discards the task handle; expression form `task = run ...` is also supported |

---

## 5. Data structures (heap)

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| List literals `[a,b]` | ✅ | ✅ | ✅ | `MakeList`; homogeneous → `obo_list_new_i64`; heterogeneous → `OboMixedList` with `OboValue` boxing |
| Map literals / field access / `.count` | ✅ | ✅ | 🟡 | `MakeMap`, `GetField`, `SetField`; boxed loads now feed native arithmetic / truthiness / text coercions, and nested heap values stringify structurally; map order still follows native hash buckets |
| Entity init / fields | ✅ | ✅ | 🟡 | `MakeEntity`, `GetField`, `SetField`; boxed field loads now feed native arithmetic / truthiness / text coercions, and nested heap values stringify structurally; field order still follows native hash buckets |
| List `count` / `[i]` / `[]=` | ✅ | ✅ | ✅ | |

---

## 6. Standard library & actors

| Feature | Interpreter | IR | LLVM | Notes |
|---------|-------------|-----|------|--------|
| `Math.*` (core: abs, floor, ceil, round, min, max, sign, pi) | ✅ | ✅ | ✅ | |
| `Math.*` (trig: sin, cos, tan, asin, acos, atan, atan2) | ✅ | ✅ | ✅ | Double args/returns |
| `Math.*` (extended: pow, log, log10, sqrt, e, infinity, maxNumber, minNumber, clamp, random, randomInt, lerp) | ✅ | ✅ | ✅ | |
| `Time.*` (now, nowSeconds, sleep, startTimer, stopTimer, measure) | ✅ | ✅ | ✅ | |
| `File.*` (read, write, append, delete, exists, readLines) | ✅ | ✅ | ✅ | |
| `Convert.*` (toNumber, toText, toDecimal, toFlag, toChar) | ✅ | ✅ | ✅ | |
| `Text.*` members (length, empty, upper, lower, trim, trimStart, trimEnd, reversed) | ✅ | ✅ | ✅ | `__text_*` C stubs; dispatched from `GetField` on `Str` |
| `Text.*` methods (contains, startsWith, endsWith, indexOf, replace, substring, repeat, padLeft, padRight, toNumber, toDecimal, split) | ✅ | ✅ | ✅ | `__text_*` C stubs; dispatched from `CallMethod` on `Str` |
| List members (count, first, last, empty, reversed, sorted, distinct) | ✅ | ✅ | ✅ | `obo_list_*` C stubs; dispatched from `GetField` on `List` |
| List methods (add, insert, remove, removeAt, indexOf, contains, join, reverse, sort, take, skip, slice, distinct) | ✅ | ✅ | ✅ | `obo_list_*` C stubs; dispatched from `CallMethod` on `List` |
| List callback methods (filter, map, reduce, any, all) | ✅ | ✅ | ✅ | `obo_list_filter`/`map`/`reduce`/`any`/`all` C stubs taking `OboClosure*` |
| Map members (count, empty) | ✅ | ✅ | ✅ | |
| Map methods (get, has, set, remove) | ✅ | ✅ | ✅ | `obo_map_*` C stubs |

---

## 7. Implementation guardrails (compiler)

| Mechanism | Purpose |
|-----------|---------|
| Parser `fuel` + top-level pass cap | Avoid infinite parse/recovery loops |
| `synchronize()` step limit | Bound error recovery |
| `infer_function_returns` max iterations | Bound fixed-point |

These **do not** stop infinite **loops in user code** (`forever`, etc.) at run time; use OS `timeout` for that.

---

## 8. Memory management

| Feature | Status | Notes |
|---------|--------|-------|
| Tracing GC | ✅ | Mark-and-sweep with shadow stack root scanning; `obo_gc_push_root`/`obo_gc_pop_roots` emitted at function entry/exit; auto-collect on allocation threshold |
| Exit cleanup | ✅ | `obo_arena_free_all()` called from `main` before `ret` (final sweep of all remaining objects) |
| GC control | ✅ | `obo_gc_pause()`/`obo_gc_resume()` for suppressing collection; `obo_gc_collect()` for explicit collection |
| Object graph / cycles | ✅ | Transitive mark: `OboValue` edges (`list` / `map` / `entity` tags), entity-owned field maps (single ownership; not double-registered), standalone maps, mixed lists. Cycles among **GC-registered** objects are collected when unreachable |
| Interior C-only allocations | 🟡 | Standalone helper strings, boxed values, and copied lists are now GC-tracked. Remaining interior allocations are owner-freed map/entity internals like `MapEntry` nodes and `strdup` keys, not separate GC objects |

---

## Phase 7 roadmap (status)

### Tier A — Core language without heap

1. ✅ String compare on `text` (`strcmp`).
2. ✅ Text + number (`obo_i64_to_str`, `native_tier_a.obo`).
3. ✅ **Decimal** — native `double` (`LowType::F64`, `fadd`/`fcmp`/`sitofp`, `obo_print_double`). `native_decimal.obo`.
4. ✅ `scripts/test_native_examples.sh`.

### Tier B — Control + IR completeness

5. ✅ **`for` / `in`** over **lists**.
6. ✅ **`check`** (all arm types — value, compare, null, `is Type`).
7. ✅ **`count`**.
8. ✅ **`Phi`** — inline-if lowering now emits merge phis, and native codegen resolves them through edge-copy blocks.

### Tier C — Heap + objects

9. ✅ **Lists (numbers)** — `native_list.obo`, `native_list_methods.obo`; full list methods native.
10. 🟡 **Maps / entities** — `native_map_math.obo`, `tests/fixtures/native_map_entity_runtime.obo`; full map methods native, mixed boxed values round-trip, and nested heap values now print structurally. Remaining drift is mostly native hash-bucket ordering.
11. ✅ **Actor methods** — static + instance dispatch.

### Tier D — Polish

12. ✅ **Closures + indirect calls** — `MakeClosure`/`CallClosure` with lexical capture; `OboClosure` struct; callback list methods.
13. ✅ **Link stdlib** — System actors fully in C; Text/List/Map methods native via C stubs.
14. ✅ **Memory model** — Arena-tracked heap with `obo_arena_free_all()` at exit.

---

## "Done" criterion for Phase 7 (bootstrap)

- **Bootstrap complete:** All Tier A–D items implemented. **18** `examples/native_*.obo` examples build and run via `scripts/test_native_examples.sh`.
- Native `decimal` (f64), text/list/map methods, full system actors, `check is Type`, `wait`/`run`, arena memory, **closures with lexical capture**, and **callback list methods** are all working.
- **Phase 8 targets:** ~~Closures (E1)~~ ✅, ~~mixed-type lists (E2)~~ ✅, ~~modules (E3)~~ ✅, ~~extension functions (E4)~~ ✅, event system (E5 — deferred), ~~tracing GC (E6)~~ ✅. See `OBO Compiler Roadmap.md` Phase 8 section for full plan.
- **Phase 9+ targets:** Real concurrency (`run` as spawn, `wait for` as join, `atomic`, `channel`), iterators/generators, reflection, generational GC.

Update this file when you add IR → LLVM support or change lowering / native dispatch / runtime linking.
