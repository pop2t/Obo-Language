#!/bin/bash
# ═══════════════════════════════════════════════════════════
# OBO Mini Database — Cross-Language Performance Benchmark
# Compares: OBO Native (LLVM) vs Python 3 vs C# (.NET)
# ═══════════════════════════════════════════════════════════

set -e
cd "$(dirname "$0")"

ITERATIONS=50
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}══════════════════════════════════════════════════${NC}"
echo -e "${BOLD}  OBO Mini Database — Performance Benchmark${NC}"
echo -e "${BOLD}══════════════════════════════════════════════════${NC}"
echo ""

# ── Step 1: Build everything ──────────────────────────────

echo -e "${CYAN}[1/4] Building all targets...${NC}"
echo ""

# OBO Native
echo -n "  OBO Native (LLVM)... "
if command -v obo &>/dev/null; then
    (cd .. && obo build examples/mini_database.obo -o benchmarks/obo_mini_database 2>/dev/null)
    echo -e "${GREEN}OK${NC}"
    HAS_OBO=1
else
    echo -e "${RED}SKIP (obo not found)${NC}"
    HAS_OBO=0
fi

# Python
echo -n "  Python 3... "
if command -v python3 &>/dev/null; then
    python3 -c "pass"
    echo -e "${GREEN}OK ($(python3 --version 2>&1))${NC}"
    HAS_PYTHON=1
else
    echo -e "${RED}SKIP (python3 not found)${NC}"
    HAS_PYTHON=0
fi

# C#
echo -n "  C# (.NET)... "
if command -v dotnet &>/dev/null; then
    (cd csharp && dotnet build -c Release --nologo -v q 2>/dev/null 1>/dev/null)
    CSHARP_DLL=$(find csharp/bin/Release -name MiniDatabase.dll -type f 2>/dev/null | head -1)
    CSHARP_CMD="dotnet $CSHARP_DLL"
    echo -e "${GREEN}OK ($(dotnet --version))${NC}"
    HAS_CSHARP=1
else
    echo -e "${RED}SKIP (dotnet not found)${NC}"
    HAS_CSHARP=0
fi

echo ""

# ── Step 2: Verify output parity ─────────────────────────

echo -e "${CYAN}[2/4] Verifying output parity...${NC}"
echo ""

mkdir -p /tmp/obo_bench

PARITY_OK=1

if [ "$HAS_OBO" = "1" ]; then
    ./obo_mini_database > /tmp/obo_bench/obo.txt 2>&1
    echo "  OBO Native output captured"
fi

if [ "$HAS_PYTHON" = "1" ]; then
    python3 mini_database.py > /tmp/obo_bench/python.txt 2>&1
    echo "  Python output captured"
fi

if [ "$HAS_CSHARP" = "1" ]; then
    $CSHARP_CMD > /tmp/obo_bench/csharp.txt 2>&1
    echo "  C# output captured"
fi

echo ""

# Compare outputs
if [ "$HAS_OBO" = "1" ] && [ "$HAS_PYTHON" = "1" ]; then
    if diff -q /tmp/obo_bench/obo.txt /tmp/obo_bench/python.txt > /dev/null 2>&1; then
        echo -e "  OBO vs Python:  ${GREEN}IDENTICAL${NC}"
    else
        echo -e "  OBO vs Python:  ${YELLOW}DIFFERS${NC}"
        diff /tmp/obo_bench/obo.txt /tmp/obo_bench/python.txt | head -20
        PARITY_OK=0
    fi
fi

if [ "$HAS_OBO" = "1" ] && [ "$HAS_CSHARP" = "1" ]; then
    if diff -q /tmp/obo_bench/obo.txt /tmp/obo_bench/csharp.txt > /dev/null 2>&1; then
        echo -e "  OBO vs C#:      ${GREEN}IDENTICAL${NC}"
    else
        echo -e "  OBO vs C#:      ${YELLOW}DIFFERS${NC}"
        diff /tmp/obo_bench/obo.txt /tmp/obo_bench/csharp.txt | head -20
        PARITY_OK=0
    fi
fi

if [ "$HAS_PYTHON" = "1" ] && [ "$HAS_CSHARP" = "1" ]; then
    if diff -q /tmp/obo_bench/python.txt /tmp/obo_bench/csharp.txt > /dev/null 2>&1; then
        echo -e "  Python vs C#:   ${GREEN}IDENTICAL${NC}"
    else
        echo -e "  Python vs C#:   ${YELLOW}DIFFERS${NC}"
        PARITY_OK=0
    fi
fi

echo ""

# ── Step 3: Benchmark ────────────────────────────────────

echo -e "${CYAN}[3/4] Running benchmark ($ITERATIONS iterations each)...${NC}"
echo ""

benchmark() {
    local name="$1"
    local cmd="$2"

    local start=$(python3 -c "import time; print(time.time())")
    for i in $(seq 1 $ITERATIONS); do
        eval "$cmd" > /dev/null 2>&1
    done
    local end=$(python3 -c "import time; print(time.time())")
    local elapsed=$(python3 -c "print(f'{$end - $start:.3f}')")
    local avg_ms=$(python3 -c "print(f'{($end - $start) / $ITERATIONS * 1000:.1f}')")
    echo "$elapsed"
    eval "TIME_${name}=$elapsed"
    eval "AVG_${name}=$avg_ms"
}

TIME_OBO="N/A"; AVG_OBO="N/A"
TIME_PYTHON="N/A"; AVG_PYTHON="N/A"
TIME_CSHARP="N/A"; AVG_CSHARP="N/A"

if [ "$HAS_OBO" = "1" ]; then
    echo -n "  OBO Native:  "
    TIME_OBO=$(benchmark "OBO" "./obo_mini_database")
    AVG_OBO=$(python3 -c "print(f'{$TIME_OBO / $ITERATIONS * 1000:.1f}')")
    echo -e "${TIME_OBO}s total  (${AVG_OBO}ms avg)"
fi

if [ "$HAS_PYTHON" = "1" ]; then
    echo -n "  Python 3:    "
    TIME_PYTHON=$(benchmark "PYTHON" "python3 mini_database.py")
    AVG_PYTHON=$(python3 -c "print(f'{$TIME_PYTHON / $ITERATIONS * 1000:.1f}')")
    echo -e "${TIME_PYTHON}s total  (${AVG_PYTHON}ms avg)"
fi

if [ "$HAS_CSHARP" = "1" ]; then
    echo -n "  C# (.NET):   "
    TIME_CSHARP=$(benchmark "CSHARP" "$CSHARP_CMD")
    AVG_CSHARP=$(python3 -c "print(f'{$TIME_CSHARP / $ITERATIONS * 1000:.1f}')")
    echo -e "${TIME_CSHARP}s total  (${AVG_CSHARP}ms avg)"
fi

echo ""

# ── Step 4: Results ──────────────────────────────────────

echo -e "${CYAN}[4/4] Results${NC}"
echo ""
echo -e "${BOLD}╔══════════════════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}║  Language        Total (${ITERATIONS}x)     Avg/run      Relative   ║${NC}"
echo -e "${BOLD}╠══════════════════════════════════════════════════════════╣${NC}"

# Determine baseline (OBO if available, else fastest)
if [ "$HAS_OBO" = "1" ]; then
    BASELINE=$TIME_OBO
    BASELINE_NAME="OBO"
elif [ "$HAS_CSHARP" = "1" ]; then
    BASELINE=$TIME_CSHARP
    BASELINE_NAME="C#"
else
    BASELINE=$TIME_PYTHON
    BASELINE_NAME="Python"
fi

print_row() {
    local name="$1"
    local total="$2"
    local avg="$3"
    local has="$4"

    if [ "$has" = "1" ]; then
        local rel=$(python3 -c "print(f'{$total / $BASELINE:.1f}')")
        printf "║  %-15s  %7ss       %7sms     %5sx     ║\n" "$name" "$total" "$avg" "$rel"
    else
        printf "║  %-15s  %7s        %7s       %5s      ║\n" "$name" "—" "—" "—"
    fi
}

print_row "OBO Native" "$TIME_OBO" "$AVG_OBO" "$HAS_OBO"
print_row "C# (.NET)" "$TIME_CSHARP" "$AVG_CSHARP" "$HAS_CSHARP"
print_row "Python 3" "$TIME_PYTHON" "$AVG_PYTHON" "$HAS_PYTHON"

echo -e "${BOLD}╚══════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  Baseline: ${BASELINE_NAME} = 1.0x"
echo -e "  Iterations: ${ITERATIONS}"
echo ""

# Cleanup
rm -f /tmp/obo_bench/obo.txt /tmp/obo_bench/python.txt /tmp/obo_bench/csharp.txt
rmdir /tmp/obo_bench 2>/dev/null || true
