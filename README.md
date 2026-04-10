<p align="center">
  <h1 align="center">OBO</h1>
  <p align="center"><strong>Write code the way you'd explain it — without sacrificing power.</strong></p>
  <p align="center">Cross-platform native compilation via LLVM · Fast as C++ · Readable as Python · Safe by default, manual when you choose</p>
  <p align="center">v0.7.0 · April 2026</p>
</p>

---

```obo
function main()
{
    name = "OBO";
    show "Hello from {name}!";

    scores = [85, 42, 91, 37, 68];
    passing = scores.filter(s => s >= 50);
    show "Passing: {passing}";
}
```

---

## What is OBO?

OBO is a general-purpose compiled language that closes the gap between **how humans think** and **how code is written**.

It was born from a frustration that many developers share: you open C# or Python and the ideas flow, but the moment you need real performance, you're told to switch to C++. You open C++ and hate everything about it except that it's fast. You go back to Python because it's easier, but then the tabs, the missing semicolons, the indentation bugs and the slowness drive you crazy. You end up needing three languages to go from prototype to production.

OBO is the language where you don't have to choose. It reads like Python, clean, human, no jargon, but uses braces and semicolons so there are no invisible whitespace bugs. It compiles to native binaries through LLVM and runs at C++/Rust speed. When you need to drop to the metal for a renderer, a physics engine, or an ML framework, you do it in the same file, in the same function, no language switch, no FFI ceremony, no rewrite.

**OBO holds your hand when you want safety, and gets out of your way when you want power.**

It's not a systems language pretending to be friendly. It's not a scripting language pretending to be fast. It's a **toolbox** — a single language where you can write a database engine today, a graphics renderer tomorrow, and a machine learning pipeline next week, all without leaving the ecosystem.

### Who is OBO for?

- **C# developers** who hit performance walls and don't want to learn C++
- **Python developers** who need native speed without rewriting everything
- **Rust developers** who want the performance without the learning curve
- **Creative people and systems designers** , game devs, graphics programmers, physics researchers, tool builders , who need one language that goes from high-level ideas to bare-metal execution
- **Anyone** who believes programming should feel like writing, not decoding

---

## Why OBO?

### 1. Code speaks from developer intent, not from the computer's perspective

OBO replaces jargon with plain English. If you can read pseudocode, you can read OBO. No academic notation, no symbols you need a manual for, no hidden behavior.

| OBO | Traditional | What it means |
|-----|-------------|---------------|
| `show "hello"` | `println!` / `printf` / `console.log` | Display output |
| `out value` | `return value` | Exit function with a value |
| `check (x)` | `match` / `switch` | Pattern match + conditional |
| `count(i = 0, 10)` | `for (int i = 0; i < 10; i++)` | Counted loop |
| `forever { }` | `while (true) { }` | Infinite loop |
| `stop` / `restart` | `break` / `continue` | Loop control |
| `flag` | `bool` | Boolean |
| `text` | `String` / `str` | String type |
| `decimal` | `f64` / `double` | Floating-point |

And the syntax is **clean without Python's whitespace trap** , OBO uses braces and semicolons, so there are no invisible tab-vs-space bugs, no "your indentation is off by one" errors, no silent breakage from mixing editors. You get readability *and* explicit structure.

### 2. As fast as C++ and Rust — with benchmarks to prove it

OBO compiles ahead-of-time to native binaries via **LLVM IR**. No interpreter in the hot path, no JIT warmup, no VM, no garbage collection pause surprises. The same LLVM backend that powers C++ and Rust powers OBO.

Benchmarked across **8 workloads** against C++ (`-O2`), Rust (`-O`), Go, Zig (`ReleaseFast`), Java, C# .NET 8, and Node.js v25. Measured with [hyperfine](https://github.com/sharkdp/hyperfine), averaged over 2 full suite runs:

| Benchmark | OBO | C++ | Rust | Go | Zig | Java | C# .NET | Node.js |
|-----------|-----|-----|------|----|-----|------|---------|---------|
| **fibonacci** | **17.3 ms** | 17.5 ms | 18.6 ms | 22.3 ms | 17.5 ms | 44.9 ms | 43.1 ms | 98.5 ms |
| **database_heavy** | **7.7 ms** | 40.1 ms | 53.2 ms | 34.5 ms | 44.4 ms | 91.9 ms | 55.2 ms | 51.9 ms |
| **spectral_norm** | **19.8 ms** | 30.4 ms | 25.7 ms | 37.7 ms | 25.7 ms | 62.9 ms | 50.9 ms | 88.5 ms |
| **nbody** | 18.5 ms | 17.1 ms | 17.1 ms | 17.4 ms | **12.0 ms** | 53.7 ms | 37.4 ms | 65.6 ms |
| **sieve** | 10.8 ms | 10.2 ms | 10.2 ms | 16.7 ms | **10.1 ms** | 53.5 ms | 37.0 ms | 67.5 ms |
| **mandelbrot** | 91.2 ms | 77.0 ms | 100.7 ms | **76.4 ms** | 100.7 ms | 115.0 ms | 122.5 ms | 136.5 ms |
| **binary_trees** | 7.1 ms | **3.0 ms** | 3.2 ms | 3.6 ms | 6.8 ms | 32.5 ms | 18.9 ms | 44.0 ms |
| **map_stress** | 24.8 ms | 14.0 ms | 18.2 ms | 22.2 ms | **8.5 ms** | 60.8 ms | 34.8 ms | 59.7 ms |

**Key results:**
- **Beats C++** on fibonacci, **5.2x faster** on database_heavy, **1.5x faster** on spectral_norm
- **Beats Rust** on fibonacci, mandelbrot (10% faster), spectral_norm (1.3x faster), database_heavy (7x faster)
- **Within 8–20% of C++/Rust** on nbody, sieve, and mandelbrot
- **Faster than Go, Java, C# .NET, and Node.js on every single benchmark**
- Cross-platform: OBO emits LLVM IR, targeting any architecture LLVM supports, x86_64, ARM64, RISC-V, WebAssembly

> Full methodology, per-backend breakdowns, and optimization details: [`BENCHMARKS.md`](BENCHMARKS.md)

### 3. Metal blocks live inside normal code, not a separate world

Most languages force you to choose: safe *or* fast. OBO lets you mix both in the **same function**. `metal { }` blocks give you manual memory control — `pointer.alloc`, `pointer.free`, `mem.store8`, `mem.load8`, and they compile to inline LLVM instructions with zero function-call overhead. When the block ends, you're back in safe territory.

This isn't a separate compiler mode. Safe and unsafe coexist with clear boundary conditions.

**Statement form** — run metal code for side effects:

```obo
function processData(n)
{
    results = [];                          // safe: GC-managed list

    metal
    {
        buf = pointer.alloc(n);            // manual: raw byte buffer
        defer { pointer.free(buf); }       // guaranteed cleanup on scope exit

        count(i = 0, n) { mem.store8(buf + i, compute(i)); }
        total = sumBuffer(buf, n);
    }                                      // back to safe land

    results.add(total);                    // safe: GC handles this
    out results;
}
```

**Expression form** — metal block produces a value via `out`:

```obo
function readSensor(address)
{
    raw = metal
    {
        buf = pointer.alloc(8);
        defer { pointer.free(buf); }
        mem.store64(buf, address);
        out mem.load64(buf);               // value flows back to safe code
    };

    show "Sensor reading: {raw}";          // back in safe land
    out raw;
}
```

The expression form lets metal blocks feed values into safe code without leaking pointers or raw memory across the boundary. `out` inside a metal expression returns the value; `defer` still runs cleanup before the block exits.
```

### 4. Multiple memory strategies, one language

OBO doesn't lock you into one memory model. Choose what fits the task:

| Strategy | How | When to use |
|----------|-----|-------------|
| **GC (default)** | Automatic mark-sweep with pool allocation | Most code — just write and forget |
| **Defer** | `defer { cleanup(); }` — LIFO cleanup at scope exit | File handles, buffers, locks |
| **Own** | `own resource` — single-owner, auto-freed when scope ends | One-owner resources |
| **Arena** | `Arena.new()` — bump allocator, batch-free everything at once | Batch processing, frame allocators |
| **Manual** | `pointer.alloc` / `pointer.free` | Full control when you need it |

You can even control the GC itself, pause it, resume it, or trigger a collection manually when *you* decide the timing is right.

### 5. Entities and Actors, data and behavior, separated by design

OBO makes a deliberate split: **entities** are pure data, **actors** have behavior. No confusion about what holds state vs. what mutates it.

```obo
// Entity = pure data. No methods, no surprises.
entity Particle { x; y; vx; vy; mass; }

// Actor = data + behavior. Methods, inheritance, traits.
actor PhysicsEngine
{
    public particles = [];

    function step(dt)
    {
        for (p in particles)
        {
            p.x = p.x + p.vx * dt;
            p.y = p.y + p.vy * dt;
        }
    }
}
```

Actors support **single inheritance**, **traits** (`has Movable, Damageable`), **properties** (getters/setters), **shared functions** (static methods), and **abstract/sealed** modifiers.

### 6. Pattern matching and switch — unified in `check`

No separate `match` vs `switch` debate. `check` does both — conditions, ranges, comparisons, type matching, and destructuring — in one clean construct:

```obo
check (score)
{
    is null       { show "No score"; }
    is < 50       { show "Needs work"; }
    is 50 to 89   { show "Good"; }
    is >= 90      { show "Excellent"; }
}

check (shape)
{
    is Circle(r)      { out 3.14159 * r * r; }
    is Rectangle(w,h) { out w * h; }
    is Point          { out 0.0; }
}
```

### 7. A toolbox, not a barebone runtime

OBO ships with batteries included. You don't need to import a library for basic things:

- **String interpolation** — `"Hello {name}, score: {score}"` — just braces, no `format!()` or `f""` ceremony
- **Closures & HOFs** — `list.filter(x => x > 5).map(x => x * 2).sortBy(x => x)`
- **Multi-return** — `result, error = divide(10, 0);`
- **Error handling** — `x = parse(input) if possible else 0;` — no try/catch boilerplate
- **Concurrency** — `run { }`, `wait for`, channels, atomics — first-class, not a library
- **Events/signals** — `emit onDamage(amount)`, `.listen(action(...) { })` — built into the language
- **Pipe operator** — `getData() |> filter(active) |> sort(byName) |> display`
- **Generics** — `Inventory of Weapon`, `list of number`
- **Rich stdlib** — Math, collections, text manipulation, time, filesystem — ready on day one
- **Choice types (ADTs)** — `choice Result { Ok(value), Error(msg) }` — algebraic data types with pattern matching

### 8. Cross-platform native binaries via LLVM

OBO compiles to LLVM IR, which means it targets **any platform LLVM supports**: macOS (ARM64, x86_64), Linux, Windows, RISC-V, WebAssembly. You write once, compile to any target. No VM to distribute, no runtime to install — just a native binary.

### 9. Zero-ceremony C interop

`bridge` blocks give direct access to C libraries — Metal, Vulkan, POSIX, anything with a C ABI — without wrappers, binding generators, or boilerplate:

```obo
bridge "libc"
{
    function puts(s as pointer) as number;
    function malloc(size as number) as pointer;
}
```

### 10. Self-hosting: OBO builds its own runtime

The OBO runtime (`--runtime obo`) is written in OBO itself and compiled to native code. This isn't just a milestone — it's proof that OBO is powerful enough to implement its own infrastructure. The compiler bootstraps in Rust; the goal is full self-hosting.

---

## Getting Started

### Prerequisites

| Tool | Required for | Install |
|------|-------------|---------|
| **Rust** (stable) | Building the compiler | [rustup.rs](https://rustup.rs) |
| **clang** | Linking native binaries (`obo build`) | Xcode CLT (macOS), `apt install clang` (Linux) |

### Build from source

```bash
git clone <repo-url>
cd obo-compiler

cargo install --path .                   # builds + installs to ~/.cargo/bin/obo

obo --version    # OBO v0.7.0
obo doctor       # checks clang availability (no network)
```

### Hello, world

```obo
function main()
{
    show "Hello, world!";
}
```

```bash
# Interpret instantly (full language, no compilation step)
obo run hello.obo

# Compile to a native binary
obo build hello.obo -o hello
./hello
```

Two ways to run, same language: `obo run` for instant feedback like Python, `obo build` for production native binaries like C++. No context switch, no rewrite.

### Compile without linking

If you don't have `clang` or want the raw LLVM IR:

```bash
obo build hello.obo --no-link
# Outputs: hello.ll + obo_rt.c
# Link manually: clang -O2 -o hello hello.ll obo_rt.c
```

---

## Toolchain

OBO ships as a single binary with everything built in:

| Command | What it does |
|---------|-------------|
| `obo run file.obo` | Interpret immediately — full language support, instant feedback |
| `obo build file.obo` | Compile to native binary via LLVM IR + clang |
| `obo build file.obo --runtime obo` | Compile with the self-hosted OBO runtime (lighter GC, faster on some workloads) |
| `obo build file.obo --no-link` | Emit LLVM IR + C runtime for manual linking |
| `obo doctor` | Check your system (clang, etc.) — no network required |

### VS Code Extension

OBO includes a VS Code extension for syntax highlighting, bracket matching, and comment toggling.

```bash
code --install-extension editors/vscode/obo-lang-0.5.0.vsix
```

Or in VS Code: **Extensions → ⋯ → Install from VSIX…** → select `editors/vscode/obo-lang-0.5.0.vsix`.

---

## Language Tour

### Variables — inferred or explicit

```obo
name = "Alice";              // inferred as text
age = 30;                    // inferred as number
pi = 3.14159;                // inferred as decimal
active = true;               // inferred as flag

number count = 0;            // explicit type
list of number ids = [1, 2, 3];
```

### Entities — pure data, no surprises

```obo
entity Point { x; y; }
entity Color { r; g; b; a = 255; }

p = Point { x = 10; y = 20; };
c = Color { r = 255; g = 0; b = 128; };
```

### Actors — data with behavior

```obo
actor Player
{
    public name;
    public health = 100;

    shared function create(playerName as text)
    {
        out Player { name = playerName; };
    }

    function takeDamage(amount as number)
    {
        health = health - amount;
        if (health <= 0) { show "{name} has fallen!"; }
    }
}

p = Player.create("Hero");
p.takeDamage(30);
```

### Choice types — enums with data

```obo
choice Shape
{
    Circle(radius as decimal),
    Rectangle(width as decimal, height as decimal),
    Point
}

function area(s as Shape) as decimal
{
    check (s)
    {
        is Circle(r) { out 3.14159 * r * r; }
        is Rectangle(w, h) { out w * h; }
        is Point { out 0.0; }
    }
}
```

### Closures and higher-order functions

```obo
scores = [85, 42, 91, 37, 68];

passing = scores.filter(s => s >= 50);
doubled = scores.map(s => s * 2);
total = scores.reduce(0, action(acc, s) { out acc + s; });
sorted = scores.sortBy(s => s);
```

### Metal mode — manual memory, inline LLVM speed

Statement form — run metal code for side effects:

```obo
metal
{
    buf = pointer.alloc(1024);
    defer { pointer.free(buf); }

    count(i = 0, 1024) { mem.store8(buf + i, 0); }
    mem.store64(buf, 42);
    value = mem.load64(buf);
    show "Value: {value}";
}
```

Expression form — metal block produces a value:

```obo
result = metal
{
    buf = pointer.alloc(8);
    defer { pointer.free(buf); }
    mem.store64(buf, 42);
    out mem.load64(buf);       // result = 42
};
show "Got: {result}";
```

### Concurrency — channels, async, atomics

```obo
ch = Channel.new();
run { ch.send(42); }
value = ch.receive();

run
{
    result = wait for fetchData();
    show "Got: {result}";
}
```

### Modules

```obo
// mathlib.obo
public function square(n) { out n * n; }

// main.obo
use square from "mathlib.obo";
show square(5);    // 25
```

> Complete language reference covering all 30 sections: [`OBO_LANGUAGE_REFERENCE.md`](OBO_LANGUAGE_REFERENCE.md)

---

## Where OBO Shines — With Proof

### 5.2x faster than C++ on real-world data processing

The **database_heavy** benchmark: 500 employee records, 20 iterations of filter/sort/group-by/aggregate using closures and higher-order functions. OBO at **7.7 ms** is the fastest of all nine languages — 5.2x faster than C++ (40.1 ms), 6.9x faster than Rust, 4.5x faster than Go, 5.8x faster than Zig. This is OBO's sweet spot: entity operations + closure dispatch + HOF optimization, all compiled ahead of time.

### 1.5x faster than C++ on spectral norm

**Spectral Norm** (N=1000, 10 power iterations): OBO at **19.8 ms** beats C++ (30.4 ms), Rust (25.7 ms), Zig (25.7 ms), and every other language tested. OBO's `reassoc contract` FP flags let LLVM form FMA instructions and hoist loop-invariant reciprocals — optimizations that strict-IEEE languages can't perform by default.

### Matches C++ on pure compute

**Fibonacci** (`fib(35)`, naive recursion): OBO at **17.3 ms** ties C++ (17.5 ms) and beats Rust (18.6 ms). Zero allocations, zero GC — just tight recursive codegen.

### Simulation-grade — within 8% of C++/Rust

**N-Body** (500K timesteps, 5-body gravitational sim): OBO at **18.5 ms** vs C++ 17.1 ms. The compiler's GC-safe call analysis detects that `Math.sqrt` is a pure intrinsic and eliminates all GC overhead from the hot loop — 2.4x improvement over v0.5.0.

### Metal intrinsics run at C speed

**Sieve of Eratosthenes** (10M elements): OBO at **10.8 ms** vs C++ 10.2 ms. `mem.zero` compiles to LLVM's SIMD-optimized `@llvm.memset`. `mem.store8`/`mem.load8` compile to inline `inttoptr` + `store`/`load` — zero function-call overhead.

### Beats Rust on floating-point

**Mandelbrot** (2000x2000, 50 iter/pixel): OBO at **91.2 ms** vs Rust 100.7 ms (10% faster). `reassoc contract` FP math flags let LLVM form FMA instructions and reorder for better pipelining.

### Faster than Go, Java, C#, and Node.js — every time

OBO beats all four managed/JIT runtimes on **all 8 benchmarks**. No JIT warmup, no tiered compilation, instant startup.

> Detailed results, methodology, and compiler optimizations: [`BENCHMARKS.md`](BENCHMARKS.md)

---

## Compiler Architecture

```
source.obo
    │
    ▼
  Lexer  →  Tokens
    │
    ▼
  Parser  →  AST
    │
    ▼
  Analyzer  →  Type checking, symbol resolution
    │
    ├──── obo run ────→  Tree-walking interpreter (instant feedback)
    │
    ▼
  IR Lowering  →  OBO IR
    │
    ▼
  LLVM Emitter  →  LLVM IR (.ll)
    │
    ├──── --no-link ────→  .ll + obo_rt.c (manual linking)
    │
    ▼
  clang  →  Native binary (any LLVM target)
```

**Two runtime backends for native compilation:**
- `obo build file.obo` — **C runtime** (`obo_rt.c`): full GC, entity system, maps, lists, closures, channels, atomics
- `obo build file.obo --runtime obo` — **Self-hosted OBO runtime** (`obo_rt_bridge.c`): lighter GC, faster on list/map-heavy workloads

Both produce identical, correct output. You choose based on your workload.

---

## Repository Layout

```
obo-compiler/
├── src/                        # Compiler source (Rust)
│   ├── lexer/                  # Tokenizer
│   ├── parser/                 # AST construction
│   ├── analyzer/               # Type checking, symbol resolution
│   ├── interpreter/            # Tree-walking interpreter (obo run)
│   ├── ir/                     # Intermediate representation
│   ├── llvm_emit/              # LLVM IR text emitter (obo build)
│   ├── stdlib/                 # Standard library (math, text, collections, time, fs)
│   └── cli.rs, main.rs        # CLI entry point
├── runtime/
│   ├── obo_rt.c                # C runtime (GC, entities, maps, lists, closures)
│   └── obo_rt_bridge.c         # Self-hosted OBO runtime bridge
├── editors/
│   └── vscode/                 # VS Code extension (syntax highlighting)
├── examples/                   # Sample .obo programs
├── benchmarks/
│   └── suite/                  # 8 cross-language benchmarks
├── BENCHMARKS.md               # Full benchmark report with methodology
├── OBO_LANGUAGE_REFERENCE.md   # Language reference (30 sections)
└── OBO_NATIVE_PARITY.md        # Native backend feature tracking
```

## Documentation

| Document | Description |
|----------|-------------|
| [`OBO_LANGUAGE_REFERENCE.md`](OBO_LANGUAGE_REFERENCE.md) | Complete language reference — 30 sections covering every feature |
| [`BENCHMARKS.md`](BENCHMARKS.md) | Cross-language benchmark report (8 benchmarks, 9 languages, full methodology) |
| [`OBO_NATIVE_PARITY.md`](OBO_NATIVE_PARITY.md) | Feature matrix: native backend vs interpreter |

## Running the Benchmarks

```bash
cargo install --path .

# Run all 8 benchmarks (requires: clang, rustc, dotnet, node, g++, go, zig, javac, hyperfine)
SKIP_INTERP=1 bash benchmarks/suite/run_all.sh
```

---

## License

See [LICENSE](LICENSE) for details.
