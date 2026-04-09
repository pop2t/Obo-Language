<p align="center">
  <h1 align="center">OBO</h1>
  <p align="center"><strong>A systems language that reads like English and runs like C.</strong></p>
  <p align="center">Native compilation via LLVM · Mark-sweep GC · Metal mode for manual memory · Dual runtime architecture</p>
  <p align="center">v0.7.0 · April 2026</p>
</p>

---

OBO is a compiled systems language designed to be **radically readable** without sacrificing performance. It compiles ahead-of-time to native binaries via LLVM IR, no interpreter in the hot path, no JIT warmup, no VM. OBO ships with a mark-sweep garbage collector by default and a **metal mode** for manual memory control when you need zero-overhead access to hardware.

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

## Why OBO?

### Readable by design

OBO replaces jargon with plain English. If you can read pseudocode, you can read OBO.

| OBO | Traditional |
|-----|-------------|
| `show "hello"` | `println!("hello")` / `printf` / `console.log` |
| `out value` | `return value` |
| `check (x)` | `match x` / `switch(x)` |
| `count(i = 0, 10)` | `for (int i = 0; i < 10; i++)` |
| `forever { }` | `while (true) { }` |
| `stop` / `restart` | `break` / `continue` |
| `flag` | `bool` |
| `text` | `String` / `str` |
| `decimal` | `f64` / `double` |

### Fast — benchmarked against C++, Rust, C#, and Node.js

OBO v0.7.0 was benchmarked across **8 workloads** against C++ (`-O2`), Rust (`-O`), C# .NET 8, and Node.js v25. Every measurement uses [hyperfine](https://github.com/sharkdp/hyperfine) with warmup, averaged over 4 full suite runs (40 measurements per language per benchmark).

| Benchmark | OBO | C++ | Rust | C# .NET | Node.js |
|-----------|-----|-----|------|---------|---------|
| **fibonacci** | **17.3 ms** | 17.5 ms | 18.7 ms | 43.0 ms | 99.2 ms |
| **binary_trees** | **6.8 ms** | 2.8 ms | 3.0 ms | 18.5 ms | 44.6 ms |
| **nbody** | **18.4 ms** | 17.1 ms | 16.9 ms | 37.4 ms | 65.9 ms |
| **map_stress** | **25.7 ms** | 14.2 ms | 18.3 ms | 34.7 ms | 60.8 ms |
| **database_heavy** | **9.6 ms** | 40.4 ms | 53.2 ms | 55.1 ms | 52.7 ms |
| **sieve** | **11.2 ms** | 10.1 ms | 10.2 ms | 36.8 ms | 67.9 ms |
| **mandelbrot** | **90.4 ms** | 77.0 ms | 100.4 ms | 122.3 ms | 137.2 ms |
| **spectral_norm** | **36.7 ms** | 30.6 ms | 25.8 ms | 51.0 ms | 90.3 ms |

**Highlights:**
- **Beats C++ on fibonacci** (17.3 ms vs 17.5 ms) and **4.2x faster on database_heavy** (9.6 ms vs 40.4 ms)
- **Beats Rust on mandelbrot** (90.4 ms vs 100.4 ms — 10% faster)
- **Within 8–20% of C++/Rust** on nbody, sieve, mandelbrot, spectral_norm
- **Faster than C# .NET and Node.js on all 8 benchmarks** — no exceptions

> Full methodology, per-backend breakdowns, and compiler optimization details: [`BENCHMARKS.md`](BENCHMARKS.md)

### What makes OBO unique

| Feature | What it means |
|---------|---------------|
| **Dual compilation** | `obo run` interprets instantly; `obo build` compiles to a native binary via LLVM |
| **Dual runtime** | C runtime (default) or self-hosted OBO runtime (`--runtime obo`) — identical output, different performance profiles |
| **Metal mode** | `pointer.alloc` / `pointer.free`, `mem.store8` / `mem.load8` compile to inline LLVM IR — zero function-call overhead, C-equivalent speed |
| **Entity/Actor split** | **Entities** are pure data (structs). **Actors** have behavior (methods, inheritance, traits). Clean separation. |
| **Choice types** | Algebraic data types: `choice Shape { Circle(r), Rect(w, h), Point }` — pattern-matched with `check` |
| **GC + manual memory** | Safe by default (mark-sweep GC with pool allocation), opt into manual control per block with `metal { }` |
| **No JIT, no VM** | Ahead-of-time compiled. Startup is instant. No tiered compilation, no warmup, no deoptimization. |
| **Self-hosting path** | Compiler bootstraps in Rust; the OBO runtime is already written in OBO, compiled to native |

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

cargo build --release
cp target/release/obo ~/.cargo/bin/obo   # or anywhere on your PATH

obo --version    # OBO v0.7.0
obo doctor       # checks clang availability (no network)
```

### Run your first program

Create `hello.obo`:

```obo
function main()
{
    show "Hello, world!";
}
```

```bash
# Interpret (full language support)
obo run hello.obo

# Compile to native binary
obo build hello.obo -o hello
./hello
```

### Compile without linking

If you don't have `clang` or want the raw LLVM IR:

```bash
obo build hello.obo --no-link
# Outputs: hello.ll + obo_rt.c
# Link manually: clang -O2 -o hello hello.ll obo_rt.c
```

---

## VS Code Support

OBO ships with a VS Code extension for syntax highlighting.

### Install from VSIX

```bash
code --install-extension editors/vscode/obo-lang-0.5.0.vsix
```

Or in VS Code: **Extensions → ⋯ → Install from VSIX…** → select `editors/vscode/obo-lang-0.5.0.vsix`.

The extension provides:
- Syntax highlighting for `.obo` files
- Bracket matching and auto-closing
- Comment toggling

---

## Language at a Glance

### Variables and types

```obo
name = "Alice";              // inferred as text
age = 30;                    // inferred as number
pi = 3.14159;                // inferred as decimal
active = true;               // inferred as flag

number count = 0;            // explicit type annotation
list of number ids = [1, 2, 3];
```

### Entities (pure data)

```obo
entity Point { x; y; }
entity Color { r; g; b; a = 255; }

p = Point { x = 10; y = 20; };
c = Color { r = 255; g = 0; b = 128; };
```

### Actors (data + behavior)

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

### Choice types (enums / ADTs)

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

sorted = scores.sortBy(s => s);              // ascending
names = ["Charlie", "Alice", "Bob"];
sorted_names = names.sortBy(n => n.length);   // by length
```

### Metal mode (manual memory)

```obo
metal
{
    buf = pointer.alloc(1024);
    defer { pointer.free(buf); }       // LIFO cleanup — freed on scope exit

    count(i = 0, 1024) { mem.store8(buf + i, 0); }
    mem.store64(buf, 42);
    value = mem.load64(buf);
    show "Value: {value}";
}
```

### Concurrency

```obo
run
{
    result = wait for fetchData();
    show "Got: {result}";
}

// Channels
ch = Channel.new();
run { ch.send(42); }
value = ch.receive();
```

### Modules

```obo
// mathlib.obo
public function square(n) { out n * n; }
public function cube(n) { out n * n * n; }

// main.obo
use square from "mathlib.obo";
show square(5);    // 25
```

> Full language reference with all 30 sections: [`OBO_LANGUAGE_REFERENCE.md`](OBO_LANGUAGE_REFERENCE.md)

---

## Where OBO Shines

### Real-world data processing — 4.2x faster than C++

The **database_heavy** benchmark simulates a mini in-memory database: 500 employee records, 20 iterations of filter/sort/group-by/aggregate using closures and higher-order functions.

OBO at **9.6 ms** is the fastest of all six languages tested — 4.2x faster than C++ (40.4 ms), 5.5x faster than Rust (53.2 ms), 5.7x faster than C# .NET.

This is OBO's sweet spot: entity operations, closure dispatch, and higher-order functions are optimized at the compiler level with inline dispatch and pool-allocated entities.

### Pure compute — matches C++

The **fibonacci** benchmark (naive recursive `fib(35)`) measures raw function-call overhead. OBO at 17.3 ms ties C++ (17.5 ms) and beats Rust (18.7 ms). Zero allocations, zero GC pressure — just tight recursive codegen.

### Simulation-grade — within 8% of C++/Rust

The **nbody** benchmark (500K timesteps, 5-body gravitational simulation) runs at 18.4 ms — only 1.08x behind C++ (17.1 ms). OBO's GC-safe call analysis detects that `Math.sqrt` is a pure intrinsic and elides all GC root registration from the hot loop.

### Metal intrinsics — C-equivalent speed

The **sieve** benchmark (`pointer.alloc` + `mem.store8`/`mem.load8` over 10M elements) runs at 11.2 ms — only 1.11x behind C++ (10.1 ms). The ~1 ms gap is process startup. `mem.store8`/`mem.load8` compile to inline LLVM `inttoptr` + `store`/`load` with zero function-call overhead.

### Beats Rust on floating-point

The **mandelbrot** benchmark (2000×2000, max 50 iter/pixel) runs at 90.4 ms — 10% faster than Rust (100.4 ms). OBO's `reassoc contract` FP math flags enable LLVM to form FMA instructions and reorder for better pipelining.

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
    ├──── obo run ────→  Tree-walking interpreter
    │
    ▼
  IR Lowering  →  OBO IR instructions
    │
    ▼
  LLVM Emitter  →  LLVM IR (.ll)
    │
    ├──── --no-link ────→  .ll + obo_rt.c
    │
    ▼
  clang  →  Native binary
```

**Two runtime backends for `obo build`:**
- `obo build file.obo` — links with the **C runtime** (`obo_rt.c`): full GC, entity system, maps, lists, closures, channels, atomics
- `obo build file.obo --runtime obo` — links with the **self-hosted OBO runtime** (`obo_rt_bridge.c`): lighter GC tracking, faster on list/map-heavy workloads

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
│   └── suite/                  # 8 cross-language benchmarks (OBO, C++, Rust, C#, Node.js)
├── BENCHMARKS.md               # Full benchmark report with methodology
├── OBO_LANGUAGE_REFERENCE.md   # Language reference (30 sections)
└── OBO_NATIVE_PARITY.md        # Native backend feature tracking
```

---

## Documentation

| Document | Description |
|----------|-------------|
| [`OBO_LANGUAGE_REFERENCE.md`](OBO_LANGUAGE_REFERENCE.md) | Complete language reference — 30 sections covering every feature |
| [`BENCHMARKS.md`](BENCHMARKS.md) | Cross-language benchmark report (8 benchmarks, 6 languages, full methodology) |
| [`OBO_NATIVE_PARITY.md`](OBO_NATIVE_PARITY.md) | Feature matrix: native backend vs interpreter |

---

## Running the Benchmarks

```bash
# Build the compiler
cargo build --release
cp target/release/obo ~/.cargo/bin/obo

# Run all 8 benchmarks (requires: clang, rustc, dotnet, node, g++, hyperfine)
SKIP_INTERP=1 bash benchmarks/suite/run_all.sh
```

---

## License

See [LICENSE](LICENSE) for details.
