# OBO compiler

The `obo` program parses, type-checks, and runs **OBO** programs. The implementation is plain Rust with **no third-party crates** — only `std` — so the toolchain stays small and easy to ship.

## Quick start

```bash
cargo build --release
./target/release/obo doctor          # optional: check clang / rustc
./target/release/obo run examples/hello.obo
```

- **`obo run`** — full language via the built-in interpreter (best for real programs today).
- **`obo build`** — compile a **subset** of the language to a native binary using **LLVM IR** + **clang** (optional; see `obo help`). **What works vs full language:** see [`OBO_NATIVE_PARITY.md`](OBO_NATIVE_PARITY.md) (Phase 7 checklist).

### Native compile without linking

If you do not have `clang` or want only the IR file:

```bash
obo build examples/native_min.obo --no-link
# writes examples/native_min.ll and examples/obo_rt.c (small C runtime: string concat, etc.)
# link both when you compile: clang -O2 -o app examples/native_min.ll examples/obo_rt.c
```

With **`--no-link`**, the compiler also drops **`obo_rt.c`** next to the `.ll` so you can link it manually. Full **`obo build`** (with linking) passes that file to **`clang`** for you.

### Dependencies

| What | Needed for |
|------|------------|
| **Rust** | Building this compiler (`cargo build`) |
| **clang** | Only `obo build` when linking an executable (not needed for `--no-link` or `obo run`) |

Run **`obo doctor`** for a local check (no network).

## Repository layout

- `src/` — lexer, parser, interpreter, analyzer, IR, LLVM text emitter, stdlib hooks
- `examples/` — sample `.obo` files (`native_*.obo` exercise the native backend)
- `OBO_NATIVE_PARITY.md` — native vs interpreter feature matrix and Phase 7 roadmap
- `scripts/test_native_examples.sh` — build all `examples/native_*.obo` (optional `timeout`; set `OBO_BIN` if needed)

For language design and roadmap, see the parent `Obo/` folder in this repo.
