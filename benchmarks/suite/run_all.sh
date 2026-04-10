#!/bin/bash
# ═══════════════════════════════════════════════════════════════════
# OBO Benchmark Suite — hyperfine-based cross-language comparison
# Benchmarks: fibonacci, binary_trees, nbody, map_stress, database_heavy
# Languages:  OBO (--runtime obo), OBO no_gc (--runtime obo --no-gc), C# (.NET 8), Node.js, C++, Rust, Go, Zig, Java
# ═══════════════════════════════════════════════════════════════════

set -e
SUITE_DIR="$(cd "$(dirname "$0")" && pwd)"
COMPILER_DIR="$(cd "$SUITE_DIR/../.." && pwd)"

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'

BENCHMARKS=("fibonacci" "binary_trees" "nbody" "map_stress" "database_heavy" "sieve" "mandelbrot" "spectral_norm")
WARMUP=2
RUNS=10

echo ""
echo -e "${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}     OBO Benchmark Suite — Cross-Language Comparison${NC}"
echo -e "${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo ""

# ── Detect available toolchains ──────────────────────────

HAS_OBO=0; HAS_CSHARP=0; HAS_NODE=0; HAS_CPP=0; HAS_RUST=0; HAS_GO=0; HAS_ZIG=0; HAS_JAVA=0; HAS_HYPERFINE=0

command -v obo &>/dev/null && HAS_OBO=1
command -v dotnet &>/dev/null && HAS_CSHARP=1
command -v node &>/dev/null && HAS_NODE=1
command -v g++ &>/dev/null && HAS_CPP=1
command -v rustc &>/dev/null && HAS_RUST=1
command -v go &>/dev/null && HAS_GO=1
command -v zig &>/dev/null && HAS_ZIG=1
command -v javac &>/dev/null && HAS_JAVA=1
command -v hyperfine &>/dev/null && HAS_HYPERFINE=1

echo -e "${CYAN}Toolchain check:${NC}"
[ "$HAS_OBO" = "1" ] && echo -e "  obo:       ${GREEN}$(obo --version 2>&1 | head -1 || echo 'OK')${NC}" || echo -e "  obo:       ${RED}not found${NC}"
[ "$HAS_CSHARP" = "1" ] && echo -e "  dotnet:    ${GREEN}.NET $(dotnet --version 2>&1)${NC}" || echo -e "  dotnet:    ${RED}not found${NC}"
[ "$HAS_NODE" = "1" ] && echo -e "  node:      ${GREEN}$(node --version 2>&1)${NC}" || echo -e "  node:      ${RED}not found${NC}"
[ "$HAS_CPP" = "1" ] && echo -e "  g++:       ${GREEN}$(g++ --version 2>&1 | head -1)${NC}" || echo -e "  g++:       ${RED}not found${NC}"
[ "$HAS_RUST" = "1" ] && echo -e "  rustc:     ${GREEN}$(rustc --version 2>&1)${NC}" || echo -e "  rustc:     ${RED}not found${NC}"
[ "$HAS_GO" = "1" ] && echo -e "  go:        ${GREEN}$(go version 2>&1)${NC}" || echo -e "  go:        ${RED}not found${NC}"
[ "$HAS_ZIG" = "1" ] && echo -e "  zig:       ${GREEN}$(zig version 2>&1)${NC}" || echo -e "  zig:       ${RED}not found${NC}"
[ "$HAS_JAVA" = "1" ] && echo -e "  javac:     ${GREEN}$(javac -version 2>&1)${NC}" || echo -e "  javac:     ${RED}not found${NC}"
[ "$HAS_HYPERFINE" = "1" ] && echo -e "  hyperfine: ${GREEN}$(hyperfine --version 2>&1)${NC}" || echo -e "  hyperfine: ${RED}not found (using fallback timing)${NC}"
echo ""

# ── Build phase ──────────────────────────────────────────

echo -e "${CYAN}Building all targets...${NC}"
echo ""

BUILD_DIR="$SUITE_DIR/_build"
mkdir -p "$BUILD_DIR"

outputs_match() {
    awk -v eps="1e-12" '
        function abs(x) { return x < 0 ? -x : x }
        function isnum(s) {
            return s ~ /^[[:space:]]*[+-]?(([0-9]+(\.[0-9]*)?)|(\.[0-9]+))([eE][+-]?[0-9]+)?[[:space:]]*$/
        }
        FNR == NR {
            ref[++count] = $0
            next
        }
        {
            if (FNR > count) {
                exit 1
            }

            expected = ref[FNR]
            actual = $0

            if (expected == actual) {
                next
            }

            if (isnum(expected) && isnum(actual) && abs((expected + 0) - (actual + 0)) <= eps) {
                next
            }

            exit 1
        }
        END {
            if (FNR != count) {
                exit 1
            }
        }
    ' "$1" "$2"
}

for bench in "${BENCHMARKS[@]}"; do
    echo -e "  ${BOLD}$bench${NC}"

    # OBO (self-hosted runtime, GC enabled)
    if [ "$HAS_OBO" = "1" ]; then
        echo -n "    OBO... "
        if obo build "$SUITE_DIR/$bench/bench.obo" --runtime obo -o "$BUILD_DIR/${bench}_obo" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # OBO no_gc (self-hosted runtime, GC disabled)
    if [ "$HAS_OBO" = "1" ]; then
        echo -n "    OBO no_gc... "
        if obo build "$SUITE_DIR/$bench/bench.obo" --runtime obo --no-gc -o "$BUILD_DIR/${bench}_obo_nogc" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # C#
    if [ "$HAS_CSHARP" = "1" ] && [ -d "$SUITE_DIR/$bench/csharp" ]; then
        echo -n "    C# (.NET)... "
        if (cd "$SUITE_DIR/$bench/csharp" && dotnet build -c Release --nologo -v q 2>/dev/null 1>/dev/null); then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # C++
    if [ "$HAS_CPP" = "1" ] && [ -f "$SUITE_DIR/$bench/bench.cpp" ]; then
        echo -n "    C++... "
        if g++ -O2 -std=c++17 "$SUITE_DIR/$bench/bench.cpp" -o "$BUILD_DIR/${bench}_cpp" -lm 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # Rust
    if [ "$HAS_RUST" = "1" ] && [ -f "$SUITE_DIR/$bench/bench.rs" ]; then
        echo -n "    Rust... "
        if rustc -O "$SUITE_DIR/$bench/bench.rs" -o "$BUILD_DIR/${bench}_rust" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # Go
    if [ "$HAS_GO" = "1" ] && [ -f "$SUITE_DIR/$bench/bench.go" ]; then
        echo -n "    Go... "
        if go build -o "$BUILD_DIR/${bench}_go" "$SUITE_DIR/$bench/bench.go" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # Zig
    if [ "$HAS_ZIG" = "1" ] && [ -f "$SUITE_DIR/$bench/bench.zig" ]; then
        echo -n "    Zig... "
        if zig build-exe "$SUITE_DIR/$bench/bench.zig" -O ReleaseFast -femit-bin="$BUILD_DIR/${bench}_zig" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi

    # Java
    if [ "$HAS_JAVA" = "1" ] && [ -f "$SUITE_DIR/$bench/Bench.java" ]; then
        echo -n "    Java... "
        mkdir -p "$BUILD_DIR/java_$bench"
        if javac -d "$BUILD_DIR/java_$bench" "$SUITE_DIR/$bench/Bench.java" 2>/dev/null; then
            echo -e "${GREEN}OK${NC}"
        else
            echo -e "${RED}FAIL${NC}"
        fi
    fi
done

echo ""

# ── Benchmark runner ─────────────────────────────────────

run_benchmark() {
    local bench_name="$1"
    local bench_dir="$SUITE_DIR/$bench_name"

    echo ""
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}  BENCHMARK: $bench_name${NC}"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    # Collect runnable commands
    local cmds=()
    local names=()

    if [ "$HAS_OBO" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_obo" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_obo")
        names+=("OBO")
    fi

    if [ "$HAS_OBO" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_obo_nogc" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_obo_nogc")
        names+=("OBO no_gc")
    fi

    if [ "$HAS_OBO" = "1" ] && [ "${SKIP_INTERP:-0}" = "0" ]; then
        cmds+=("obo run $bench_dir/bench.obo")
        names+=("OBO Interp")
    fi

    if [ "$HAS_CSHARP" = "1" ] && [ -d "$bench_dir/csharp" ]; then
        local dll=$(find "$bench_dir/csharp/bin/Release" -name "Bench.dll" -type f 2>/dev/null | head -1)
        if [ -n "$dll" ]; then
            cmds+=("dotnet $dll")
            names+=("C# .NET")
        fi
    fi

    if [ "$HAS_NODE" = "1" ] && [ -f "$bench_dir/bench.js" ]; then
        cmds+=("node $bench_dir/bench.js")
        names+=("Node.js")
    fi

    if [ "$HAS_CPP" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_cpp" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_cpp")
        names+=("C++")
    fi

    if [ "$HAS_RUST" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_rust" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_rust")
        names+=("Rust")
    fi

    if [ "$HAS_GO" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_go" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_go")
        names+=("Go")
    fi

    if [ "$HAS_ZIG" = "1" ] && [ -f "$BUILD_DIR/${bench_name}_zig" ]; then
        cmds+=("$BUILD_DIR/${bench_name}_zig")
        names+=("Zig")
    fi

    if [ "$HAS_JAVA" = "1" ] && [ -d "$BUILD_DIR/java_${bench_name}" ]; then
        cmds+=("java -cp $BUILD_DIR/java_${bench_name} Bench")
        names+=("Java")
    fi

    if [ ${#cmds[@]} -eq 0 ]; then
        echo -e "${RED}  No runnable targets found!${NC}"
        return
    fi

    # Quick correctness check: verify all produce the same full output
    echo -e "${DIM}  Correctness check...${NC}"
    local ref_file=""
    local ref_name=""
    local mismatch_found=0
    local temp_files=()
    for idx in "${!cmds[@]}"; do
        local output_file
        output_file=$(mktemp)
        temp_files+=("$output_file")
        eval "${cmds[$idx]}" >"$output_file" 2>/dev/null

        if [ -z "$ref_name" ]; then
            ref_file="$output_file"
            ref_name="${names[$idx]}"
        elif ! outputs_match "$ref_file" "$output_file"; then
            mismatch_found=1
            echo -e "  ${YELLOW}WARNING: ${names[$idx]} output differs from ${ref_name}!${NC}"
            echo -e "    ${DIM}Expected output:${NC}"
            sed 's/^/      /' "$ref_file"
            echo -e "    ${DIM}Got output:${NC}"
            sed 's/^/      /' "$output_file"
        fi
    done
    if [ "$mismatch_found" = "0" ]; then
        echo -e "  ${GREEN}All outputs verified${NC}"
    else
        echo -e "  ${YELLOW}Output differences detected; timings still collected${NC}"
    fi
    rm -f "${temp_files[@]}"
    echo ""

    if [ "$HAS_HYPERFINE" = "1" ]; then
        # Build hyperfine args
        local hf_args=(--warmup "$WARMUP" --runs "$RUNS" --style full)

        for idx in "${!cmds[@]}"; do
            hf_args+=(--command-name "${names[$idx]}" "${cmds[$idx]}")
        done

        # Redirect stdout of benchmarked commands to /dev/null
        for idx in "${!cmds[@]}"; do
            hf_args=(--warmup "$WARMUP" --runs "$RUNS" --style full)
            break
        done

        # Run hyperfine
        local hf_cmd_args=()
        hf_cmd_args+=(--warmup "$WARMUP" --runs "$RUNS" --style full)
        for idx in "${!cmds[@]}"; do
            hf_cmd_args+=(--command-name "${names[$idx]}")
            hf_cmd_args+=("${cmds[$idx]} > /dev/null 2>&1")
        done

        hyperfine "${hf_cmd_args[@]}"
    else
        # Fallback: manual timing
        for idx in "${!cmds[@]}"; do
            echo -n "  ${names[$idx]}: "
            local start=$(python3 -c "import time; print(time.time())")
            for i in $(seq 1 $RUNS); do
                eval "${cmds[$idx]}" > /dev/null 2>&1
            done
            local end=$(python3 -c "import time; print(time.time())")
            local avg_ms=$(python3 -c "print(f'{($end - $start) / $RUNS * 1000:.1f}')")
            echo "${avg_ms}ms avg (${RUNS} runs)"
        done
    fi
}

# ── Run all benchmarks ───────────────────────────────────

echo -e "${CYAN}Running benchmarks (warmup=$WARMUP, runs=$RUNS)...${NC}"

for bench in "${BENCHMARKS[@]}"; do
    run_benchmark "$bench"
done

echo ""
echo -e "${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}  Benchmark suite complete.${NC}"
echo -e "${BOLD}══════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${DIM}  Benchmarks: ${BENCHMARKS[*]}${NC}"
echo -e "${DIM}  Tool: $(hyperfine --version 2>/dev/null || echo 'manual timing')${NC}"
echo ""
