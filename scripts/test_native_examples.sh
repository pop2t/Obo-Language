#!/usr/bin/env bash
# Build every examples/native_*.obo with a wall-clock limit (CI / local guardrail).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
BIN="${OBO_BIN:-$ROOT/target/debug/obo}"
if [[ ! -x "$BIN" ]]; then
  echo "Need obo binary at $BIN — run: cargo build"
  exit 1
fi
TO="${OBO_TIMEOUT:-30}"
shopt -s nullglob
FILES=(examples/native_*.obo)
if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No examples/native_*.obo found"
  exit 1
fi
for f in "${FILES[@]}"; do
  echo "== obo build $f =="
  if command -v timeout >/dev/null 2>&1; then
    timeout "$TO" "$BIN" build "$f" -o "${TMPDIR:-/tmp}/obo_native_test" || {
      echo "FAILED: $f"
      exit 1
    }
  else
    # macOS may use `gtimeout` from coreutils; fall back to no timeout
    "$BIN" build "$f" -o "${TMPDIR:-/tmp}/obo_native_test" || {
      echo "FAILED: $f"
      exit 1
    }
  fi
done
echo "All native examples built OK (${#FILES[@]} files)."
