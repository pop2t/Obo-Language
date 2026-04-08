// Test harness for OBO self-hosted allocator
// Build:
//   obo build runtime/obo_alloc.obo --emit-ll --no-link
//   clang -O2 -o test_alloc runtime/obo_alloc.ll runtime/test_alloc_harness.c
//   ./test_alloc

#include <stdio.h>
#include <stdint.h>
#include <string.h>

extern void    obo_heap_init(int64_t heap, int64_t size);
extern int64_t obo_heap_alloc(int64_t heap, int64_t size);
extern void    obo_heap_free(int64_t heap, int64_t ptr);
extern int64_t obo_heap_realloc(int64_t heap, int64_t ptr, int64_t new_size);

static char heap_region[65536] __attribute__((aligned(16)));
static int pass = 0, fail = 0;

#define H ((int64_t)heap_region)
#define ASSERT(cond, msg) do { \
    if (cond) { pass++; printf("  PASS: %s\n", msg); } \
    else      { fail++; printf("  FAIL: %s\n", msg); } \
} while(0)

int main(void) {
    printf("=== OBO Self-Hosted Allocator Tests ===\n");
    printf("Heap: %p, size: %d\n\n", heap_region, (int)sizeof(heap_region));

    // Test 1: Init + single alloc
    printf("Test 1: Init + single alloc\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t p1 = obo_heap_alloc(H, 64);
    ASSERT(p1 != 0, "alloc(64) non-null");
    ASSERT(p1 >= H && p1 < H + (int64_t)sizeof(heap_region), "within bounds");
    ASSERT((p1 & 7) == 0, "8-byte aligned");
    memset((void*)p1, 0xAB, 64);
    ASSERT(((unsigned char*)p1)[0] == 0xAB, "writable");
    printf("\n");

    // Test 2: Multiple allocs
    printf("Test 2: Multiple allocs\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t a = obo_heap_alloc(H, 32);
    int64_t b = obo_heap_alloc(H, 32);
    int64_t c = obo_heap_alloc(H, 32);
    ASSERT(a && b && c, "three allocs succeed");
    ASSERT(a != b && b != c && a != c, "distinct pointers");
    printf("\n");

    // Test 3: Free + reuse
    printf("Test 3: Free + reuse\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t p = obo_heap_alloc(H, 128);
    ASSERT(p != 0, "alloc(128)");
    obo_heap_free(H, p);
    int64_t p2 = obo_heap_alloc(H, 64);
    ASSERT(p2 != 0, "alloc after free");
    ASSERT(p2 == p, "freed block reused (LIFO)");
    printf("\n");

    // Test 4: OOM
    printf("Test 4: OOM\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t big = obo_heap_alloc(H, sizeof(heap_region) + 1);
    ASSERT(big == 0, "alloc(too large) → OOM");
    printf("\n");

    // Test 5: Realloc grow
    printf("Test 5: Realloc grow\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t r1 = obo_heap_alloc(H, 16);
    ASSERT(r1 != 0, "initial alloc");
    *(int64_t*)r1 = 0xDEADBEEF;
    int64_t r2 = obo_heap_realloc(H, r1, 128);
    ASSERT(r2 != 0, "realloc(128)");
    ASSERT(*(int64_t*)r2 == 0xDEADBEEF, "data preserved");
    printf("\n");

    // Test 6: Realloc shrink
    printf("Test 6: Realloc shrink\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t s1 = obo_heap_alloc(H, 256);
    int64_t s2 = obo_heap_realloc(H, s1, 64);
    ASSERT(s2 == s1, "shrink returns same ptr");
    printf("\n");

    // Test 7: Realloc null
    printf("Test 7: Realloc null\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t rn = obo_heap_realloc(H, 0, 32);
    ASSERT(rn != 0, "realloc(NULL) → alloc");
    printf("\n");

    // Test 8: Free null
    printf("Test 8: Free null\n");
    obo_heap_free(H, 0);
    ASSERT(1, "free(NULL) no crash");
    printf("\n");

    // Test 9: Tiny alloc
    printf("Test 9: Tiny alloc\n");
    obo_heap_init(H, sizeof(heap_region));
    int64_t tiny = obo_heap_alloc(H, 1);
    ASSERT(tiny != 0, "alloc(1) → rounds to 8");
    printf("\n");

    // Test 10: Stress
    printf("Test 10: 100 small allocs\n");
    obo_heap_init(H, sizeof(heap_region));
    int ok = 1;
    int64_t ptrs[100];
    for (int i = 0; i < 100; i++) {
        ptrs[i] = obo_heap_alloc(H, 32);
        if (!ptrs[i]) { ok = 0; break; }
    }
    ASSERT(ok, "100 x alloc(32)");
    for (int i = 0; i < 100; i++) obo_heap_free(H, ptrs[i]);
    int64_t after = obo_heap_alloc(H, 32);
    ASSERT(after != 0, "alloc after mass free");
    printf("\n");

    printf("=== Results: %d passed, %d failed ===\n", pass, fail);
    return fail > 0 ? 1 : 0;
}
