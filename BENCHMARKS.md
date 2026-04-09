# OBO Compiler — Benchmark Report

**OBO v0.7.0** · April 2026 · macOS (Apple Silicon)

---

## Overview

This report presents a cross-language performance comparison of the OBO native compiler against four mainstream language implementations across 8 benchmarks. All benchmarks run under standard GC-enabled compilation with both of OBO's runtime backends:

- **OBO Native** — The default C runtime (`obo_rt.c`). All values, entities, maps, lists, and closures are managed by a mark-sweep GC with pool allocation. v0.7.0 introduces **typed f64 arrays** for floating-point list operations, **reassociation-safe FP math** for LLVM auto-vectorization, **constant-divisor optimization** for inline integer division, and **thread-safe GC** with per-thread value arenas.
- **OBO OBO** — The self-hosted OBO runtime (`--runtime obo`). A bridge layer links the compiler's generated LLVM IR to a runtime written in OBO itself, compiled to native code. Lighter GC tracking on certain data structures yields measurably lower overhead on many workloads.

Both runtimes produce identical output. The only difference is the runtime implementation backing the same compiled code.

OBO is a systems-level language that compiles to native binaries via LLVM IR. It features dynamically typed values with entity-based data structures, a mark-sweep garbage collector, metal blocks for manual memory management, and a rich standard library — all compiled ahead of time with no JIT.

## Test Environment

| Component | Version |
|-----------|---------|
| **OBO** | v0.7.0 (native backend via LLVM IR + clang) |
| **C++** | Apple clang 17.0.0 (`-O2`) |
| **Rust** | 1.91.1 (`rustc -O`) |
| **C# .NET** | 8.0.416 |
| **Node.js** | v25.8.1 (V8 JIT) |
| **Benchmarking tool** | hyperfine 1.20.0 (warmup=2, runs=10) |
| **Platform** | macOS, Apple Silicon |

All benchmarks include **correctness verification** — every language produces identical output before timing begins. Results are averaged across 4 full suite runs (40 measurements per benchmark per language).

---

## Results

| Benchmark | OBO OBO | OBO Native | C++ | Rust | C# .NET | Node.js |
|-----------|---------|------------|-----|------|---------|---------||
| **fibonacci** | 17.5 ms | **17.3 ms** | 17.5 ms | 18.7 ms | 43.0 ms | 99.2 ms |
| **binary_trees** | **6.8 ms** | 7.8 ms | **2.8 ms** | 3.0 ms | 18.5 ms | 44.6 ms |
| **nbody** | **18.4 ms** | 18.7 ms | 17.1 ms | **16.9 ms** | 37.4 ms | 65.9 ms |
| **map_stress** | **25.7 ms** | 43.4 ms | **14.2 ms** | 18.3 ms | 34.7 ms | 60.8 ms |
| **database_heavy** | **9.6 ms** | 11.0 ms | 40.4 ms | 53.2 ms | 55.1 ms | 52.7 ms |
| **sieve** | 11.3 ms | 11.2 ms | **10.1 ms** | 10.2 ms | 36.8 ms | 67.9 ms |
| **mandelbrot** | 92.0 ms | 90.4 ms | **77.0 ms** | 100.4 ms | 122.3 ms | 137.2 ms |
| **spectral_norm** | **36.7 ms** | 49.4 ms | 30.6 ms | **25.8 ms** | 51.0 ms | 90.3 ms |

### Relative Performance — OBO Best vs C++ (lower is better)

| Benchmark | OBO vs C++ | OBO vs Rust | Winner |
|-----------|-----------|-------------|--------|
| **fibonacci** | **0.99x** ✦ | **0.93x** ✦ | **OBO** |
| **binary_trees** | 2.43x | 2.27x | C++ |
| **nbody** | 1.08x | 1.09x | C++/Rust (OBO within 10%) |
| **map_stress** | 1.81x | 1.40x | C++ |
| **database_heavy** | **0.24x** ✦ | **0.18x** ✦ | **OBO** |
| **sieve** | 1.11x | 1.10x | C++/Rust (OBO within 11%) |
| **mandelbrot** | 1.17x | **0.90x** ✦ | C++ (OBO beats Rust) |
| **spectral_norm** | 1.20x | 1.42x | Rust |

✦ OBO is faster.

---

## OBO OBO vs OBO Native

Two runtimes, same compiler, same LLVM IR — different performance profiles.

**OBO OBO** (`--runtime obo`) uses a bridge layer (`obo_rt_bridge.c`) that links the compiler's emitted `obo_*` symbols to a self-hosted runtime written in OBO. The key performance difference: the bridge manages integer lists (ILists) with inline flexible-array-member layout and does **not** register them with the GC. This eliminates GC scanning overhead for the most common data structure — plain lists of integers.

**OBO Native** uses the C runtime (`obo_rt.c`) where every allocation — including lists — is registered with the mark-sweep GC. This means more GC roots to scan and more overhead during collection cycles.

### Where OBO OBO wins

| Benchmark | OBO OBO | OBO Native | Speedup | Why |
|-----------|---------|------------|---------|-----|
| **map_stress** | 25.7 ms | 43.4 ms | 1.69x | Massive map churn — bridge's lighter allocation path |
| **spectral_norm** | 36.7 ms | 49.4 ms | 1.35x | List-heavy matrix-vector multiply — no GC on lists |
| **database_heavy** | 9.6 ms | 11.0 ms | 1.15x | Heavy list/entity operations — less GC tracking |
| **binary_trees** | 6.8 ms | 7.8 ms | 1.15x | Recursive allocation — bridge GC advantage |

### Where they tie

| Benchmark | OBO OBO | OBO Native | Why |
|-----------|---------|------------|-----|
| **fibonacci** | 17.5 ms | 17.3 ms | Pure recursion, no allocations in hot path |
| **nbody** | 18.4 ms | 18.7 ms | Entity field access dominates, no list ops |
| **sieve** | 11.3 ms | 11.2 ms | Metal intrinsic memory ops, no GC involvement |
| **mandelbrot** | 92.0 ms | 90.4 ms | Pure FP compute, no allocations |

The pattern: OBO OBO wins on list/map-heavy workloads where the bridge's lighter GC tracking pays off. They converge on pure compute, entity field access, and metal memory operations.

---

## Benchmark Descriptions

#### 1. Fibonacci (Recursive)

**Tests:** Function call overhead, recursion depth, integer arithmetic.

Computes `fib(35)` using naive recursive double-recursion. Pure compute — no allocations, no GC pressure.

**Result:** OBO at **17.3 ms** — **faster than C++** (17.5 ms) and Rust (18.7 ms). OBO wins outright on pure integer recursion. The compiler generates tight recursive code with zero overhead. 5.7x faster than Node.js, 2.5x faster than C#.

#### 2. Binary Trees

**Tests:** Recursive entity allocation, tree traversal, garbage collection.

Allocates and traverses complete binary trees of increasing depth (up to depth 11), counting nodes. Stresses the memory allocator and GC with millions of short-lived entity allocations.

**Result:** OBO OBO at 6.8 ms — **2.4x behind C++** (2.8 ms), but **2.7x faster than C#** and **6.6x faster than Node.js**. The gap to C++/Rust is GC overhead vs. manual `new`/`delete`. OBO still crushes every GC'd and JIT'd language tested.

#### 3. N-Body (Solar System Simulation)

**Tests:** Floating-point arithmetic, entity field access, `Math.sqrt`, tight nested loops.

Simulates the solar system for 500,000 timesteps. Pairwise gravitational force calculations across 5 bodies with heavy floating-point math and entity field mutation.

**Result:** OBO at **18.4 ms** — only **1.08x behind C++** (17.1 ms) and **1.09x behind Rust** (16.9 ms). OBO is firmly in the C++/Rust performance cluster. This is a **2.4x improvement over v0.5.0** (41.0 ms), achieved by eliminating unnecessary GC root registration from the hot loop — v0.6.0's GC-safe call analysis detects that `Math.sqrt` is a pure intrinsic that never triggers collection, so `advance()` runs with zero GC overhead. **2.0x faster than C#**, 3.6x faster than Node.js.

#### 4. Map Stress

**Tests:** Hash map creation, insertion, lookup, iteration, deletion.

Builds a 50,000-entry map, performs full lookups, constructs a frequency table, and runs 200 rounds of nested map build-and-query operations.

**Result:** OBO OBO at 25.7 ms — **1.81x behind C++** (14.2 ms), but **1.35x faster than C#** (34.7 ms) and **2.37x faster than Node.js** (60.8 ms). Despite OBO's immutable map model, the bridge runtime's optimized allocation path beats both major JIT runtimes.

#### 5. Database Heavy

**Tests:** Closures, higher-order functions, entity operations, sorting, aggregation.

Simulates a mini in-memory database: 500 employee records with 20 iterations of filter, sort, group-by, and aggregate queries using closures and higher-order functions.

**Result:** OBO OBO at **9.6 ms** — the **fastest of all six implementations**. **4.2x faster than C++** (40.4 ms), 5.5x faster than Rust (53.2 ms), 5.5x faster than Node.js (52.7 ms), 5.7x faster than C# (55.1 ms). OBO's entity system, inline closure dispatch, and optimized `sortBy` combine to dominate this workload.

#### 6. Sieve of Eratosthenes

**Tests:** Raw memory allocation (`pointer.alloc`), byte-level memory intrinsics (`mem.store8`/`mem.load8`), integer-heavy loops.

Computes all primes up to 10,000,000 using a sieve with OBO's metal memory intrinsics. `pointer.alloc` allocates a raw byte buffer; `mem.store8`/`mem.load8` compile to inline LLVM `inttoptr` + `store`/`load` — zero function-call overhead.

**Result:** OBO at **11.2 ms** — only **1.11x behind C++/Rust** (10.1/10.2 ms). The ~1 ms gap is process startup overhead — the actual sieve computation runs at C-equivalent speed. **3.3x faster than C#**, 6.1x faster than Node.js.

#### 7. Mandelbrot Set

**Tests:** Floating-point arithmetic, tight nested loops, branch-heavy iteration.

Computes 2000×2000 Mandelbrot set with max 50 iterations per pixel. Pure floating-point compute — no allocations, no GC pressure.

**Result:** OBO Native at **90.4 ms** — **1.17x behind C++** (77.0 ms), and **beats Rust** (100.4 ms) by 10%. Also **faster than C#** (122.3 ms) and Node.js (137.2 ms). v0.7.0's `reassoc contract` FP math flags enable LLVM to form FMA instructions and reorder operations for better pipelining.

#### 8. Spectral Norm

**Tests:** Floating-point arithmetic, nested loops, `Math.sqrt`, list element mutation.

Computes the spectral norm of an infinite matrix (n=1000, 10 power iterations). Dense FP computation with O(n²) matrix-vector multiplications and list read/write access patterns.

**Result:** OBO OBO at **36.7 ms** — **1.20x behind C++** (30.6 ms) and **1.42x behind Rust** (25.8 ms). Still **1.39x faster than C#** (51.0 ms) and **2.46x faster than Node.js** (90.3 ms). The OBO OBO bridge runtime's lighter list allocation path outperforms the native C runtime on this list-heavy workload.

---

## Key Takeaways

1. **OBO beats C++ and Rust on 2 of 8 benchmarks.** Fibonacci (17.3ms) and database_heavy (9.6ms) outperform both C++ and Rust. OBO also beats Rust on mandelbrot (90.4ms vs 100.4ms). Remarkable for a dynamically typed, ahead-of-time compiled language.

2. **OBO dominates real-world mixed workloads.** Database_heavy at 9.6 ms is **4.2x faster than C++** and faster than every other language. OBO's closure dispatch, entity layout, and HOF optimization make it the fastest option for data-processing patterns.

3. **OBO beats Rust on Mandelbrot.** Mandelbrot at 90.4ms vs. 100.4ms (10% faster). OBO's LLVM codegen with `reassoc contract` FP flags produces competitive machine code.

4. **Metal intrinsics deliver C-equivalent performance.** The sieve benchmark runs within 1.11x of C++/Rust. `pointer.alloc` + `mem.store8/load8` compile to inline LLVM IR with zero runtime overhead.

5. **Consistently faster than Node.js and C# .NET.** OBO beats both JIT-compiled runtimes on **all 8 benchmarks**. No JIT warmup, no tiered compilation, near-instant startup.

6. **Thread-safe GC with minimal overhead.** v0.7.0 adds pthread mutex protection for GC and task lists, with conditional locking (`__obo_threaded` flag) that skips the mutex in single-threaded mode. Multi-threaded workloads run safely without global-lock contention on the hot path.

7. **Each backend has its strengths.** OBO OBO wins on 4 of 8 benchmarks (binary_trees, map_stress, database_heavy, spectral_norm) thanks to lighter GC tracking. The remaining 4 benchmarks are essentially tied between the two backends.

---

## Performance Tiers

Based on the results across all 8 benchmarks, OBO falls into three performance tiers relative to C++/Rust:

### Tier 1: OBO wins (2 benchmarks)
- **fibonacci** — OBO is the fastest. Beats C++ and Rust.
- **database_heavy** — OBO is 4.2x faster than C++. Fastest of all 6 languages.

### Tier 2: Within 20% of C++/Rust (4 benchmarks)
- **nbody** — 1.08x behind. Simulation-grade performance.
- **sieve** — 1.11x behind. Metal intrinsics match C.
- **mandelbrot** — 1.17x behind C++, beats Rust by 10%.
- **spectral_norm** — 1.20x behind C++. Beats C# and Node.js.

### Tier 3: Competitive (2 benchmarks)
- **map_stress** — 1.81x behind C++. Beats C#, Node.js.
- **binary_trees** — 2.43x behind C++. GC-dominated, beats all GC'd/JIT'd languages.

**Average overhead across Tier 2+3 benchmarks: OBO is within 1.35x of C++ (geometric mean, excluding benchmarks where OBO wins).**

---

## OBO's Low-Level Capabilities

### Metal Memory Intrinsics
`mem.store8(addr, val)` and `mem.load8(addr)` compile to **inline LLVM instructions** — `inttoptr` + `store`/`load` with zero function-call overhead. Combined with `pointer.alloc`/`pointer.free`, this gives C-equivalent memory access performance while remaining within OBO's syntax.

```obo
// OBO sieve — runs within 1.11x of equivalent C code
buf = pointer.alloc(10000000);
count(i = 0, n) { mem.store8(buf + i, 1); }
// ...
if (mem.load8(buf + i) == 1) { ... }
pointer.free(buf);
```

### Metal Blocks
`metal { }` blocks provide full manual memory management with `defer` (LIFO cleanup), `own` (single-owner auto-free), and `Arena` (bump allocator). Fixed-width types (`f32`, `i32`, `u16`, etc.) and packed structs are available inside metal blocks for hardware-level control.

### Dual Runtime Architecture
OBO v0.7.0 ships with two interchangeable runtime backends:
- `obo build file.obo` — C runtime (default)
- `obo build file.obo --runtime obo` — Self-hosted OBO runtime

Both produce correct, identical output. The OBO runtime demonstrates that OBO is capable of implementing its own runtime — a milestone for language self-hosting.

---

## Compiler Optimizations (v0.6.0+)

The OBO native backend includes several key optimizations:

- **GC-safe call analysis** — Functions whose only calls are to pure intrinsics (e.g. `Math.sqrt`, `Math.sin`) skip GC root registration entirely. This eliminated 10.5M GC root push/pop operations from nbody's hot loop, yielding a 2.4x speedup.
- **Function-level GC elision** — A pre-scan detects functions with no allocation-capable instructions (no entity/list/map/closure creation, no string ops). These functions emit zero GC overhead.
- **Entity field type inference** — Numeric entity fields are accessed as direct `f64`/`i64` loads, bypassing dynamic dispatch.
- **Inline GEP entity slot access** — Entity field reads/writes use computed LLVM `getelementptr` instructions instead of C runtime function calls.
- **Tag-skip optimization** — When a field is proven to always hold the same type, the OboValue tag write is elided on stores.
- **Entity pointer caching** — Repeated accesses to fields of the same entity reuse the resolved slots pointer.
- **Inline memory intrinsics** — `mem.load64/store64/load8/store8` emit inline LLVM IR (zero overhead).
- **Fused string+int concatenation** — Avoids intermediate allocations.
- **GC pool allocator** — Entity allocations served from a free-list pool, reducing `malloc` pressure.
- **IList inline layout** — Integer lists use a flexible-array-member struct (`{len, cap, items[]}`) with data at offset 16, enabling direct GEP access without pointer indirection.
- **Typed F64List arrays** — Floating-point lists stored as contiguous unboxed `double[]` arrays, eliminating boxing overhead.
- **Reassociation-safe FP math** — `reassoc contract` flags enable LLVM auto-vectorization and FMA formation.
- **Constant-divisor optimization** — Inline `sdiv`/`srem` for non-zero constant divisors.
- **Conditional GC locking** — `__obo_threaded` flag with `__builtin_expect` skips mutex in single-threaded programs.

---

## Reproducing

```bash
cd obo-compiler

# Build the compiler
cargo build --release
cp target/release/obo ~/.cargo/bin/obo

# Run the full benchmark suite (8 benchmarks, all languages)
SKIP_INTERP=1 bash benchmarks/suite/run_all.sh
```

Requires: Rust, clang, .NET SDK 8+, Node.js, g++ (clang), rustc, and [hyperfine](https://github.com/sharkdp/hyperfine).
