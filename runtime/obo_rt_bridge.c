/*
 * OBO Self-Hosted Runtime — C Bridge
 *
 * Thin ABI-compatible bridge from the compiler's obo_* symbols
 * to the self-hosted rt_* implementations compiled from OBO.
 *
 * This file is used when building with --runtime obo.
 * It provides:
 *   1. Global GC context management (wrapping ctx-based OBO GC)
 *   2. obo_* → rt_* thin wrappers for string/list/map/entity/value
 *   3. Math/Time/File/Convert using libc directly
 *   4. Stubs for unimplemented subsystems (closures, tasks, etc.)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>

/* ═══════════════════════════════════════════════════════════
 *  GC Kind constants (must match obo_gc.obo)
 * ═══════════════════════════════════════════════════════════ */
#define GC_STRING        0
#define GC_LIST_I64      1
#define GC_MAP           2
#define GC_ENTITY        3
#define GC_MIXED_LIST    4
#define GC_CLOSURE       5
#define GC_VALUE         6
#define GC_TASK          7
#define GC_OPAQUE        8
#define GC_ENTITY_SLOTTED 9

/* ═══════════════════════════════════════════════════════════
 *  External: OBO runtime functions (compiled from .obo)
 * ═══════════════════════════════════════════════════════════ */

/* GC */
extern int64_t rt_gc_init(void);
extern void    rt_gc_push_root(int64_t ctx, int64_t slot);
extern void    rt_gc_pop_roots(int64_t ctx, int64_t n);
extern void    rt_gc_collect(int64_t ctx);
extern void    rt_gc_pause(int64_t ctx);
extern void    rt_gc_resume(int64_t ctx);
extern void    rt_gc_register(int64_t ctx, int64_t ptr, int64_t kind);
extern void    rt_gc_free_all(int64_t ctx);
extern void    rt_gc_destroy(int64_t ctx);
extern int64_t rt_gc_find_node(int64_t ctx, int64_t ptr);
extern void    rt_gc_ht_remove(int64_t ctx, int64_t node);
extern void    rt_gc_ht_insert(int64_t ctx, int64_t node);

/* String */
extern int64_t rt_strlen(int64_t s);
extern int64_t rt_strcmp(int64_t a, int64_t b);
extern int64_t rt_strdup(int64_t s);
extern int64_t rt_str_concat(int64_t a, int64_t b);
extern int64_t rt_i64_to_str(int64_t n);
extern int64_t rt_str_truthy(int64_t s);
extern int64_t rt_str_contains(int64_t h, int64_t n);
extern int64_t rt_str_indexOf(int64_t h, int64_t n);
extern int64_t rt_str_substring(int64_t s, int64_t start, int64_t end);
extern int64_t rt_str_startsWith(int64_t s, int64_t p);
extern int64_t rt_str_endsWith(int64_t s, int64_t p);
extern int64_t rt_str_upper(int64_t s);
extern int64_t rt_str_lower(int64_t s);
extern int64_t rt_str_trim(int64_t s);
extern int64_t rt_str_repeat(int64_t s, int64_t n);
extern int64_t rt_str_reversed(int64_t s);
extern int64_t rt_str_replace(int64_t s, int64_t old, int64_t new_s);
extern int64_t rt_str_replace_all(int64_t s, int64_t old, int64_t new_s);

/* List (i64 elements) */
extern int64_t rt_list_new(int64_t len);
extern int64_t rt_list_len(int64_t lst);
extern int64_t rt_list_get(int64_t lst, int64_t i);
extern void    rt_list_set(int64_t lst, int64_t i, int64_t v);
extern int64_t rt_list_add(int64_t lst, int64_t v);
extern int64_t rt_list_first(int64_t lst);
extern int64_t rt_list_last(int64_t lst);
extern int64_t rt_list_empty(int64_t lst);
extern int64_t rt_list_contains(int64_t lst, int64_t v);
extern int64_t rt_list_indexOf(int64_t lst, int64_t v);
extern int64_t rt_list_sort(int64_t lst);
extern int64_t rt_list_reversed(int64_t lst);
extern int64_t rt_list_slice(int64_t lst, int64_t start, int64_t end);

/* Map */
extern int64_t rt_map_new(void);
extern int64_t rt_map_len(int64_t m);
extern void    rt_map_put_i64(int64_t m, int64_t key, int64_t val);
extern void    rt_map_put_str(int64_t m, int64_t key, int64_t val);
extern void    rt_map_put_null(int64_t m, int64_t key);
extern int64_t rt_map_get(int64_t m, int64_t key);
extern int64_t rt_map_get_i64(int64_t m, int64_t key);
extern int64_t rt_map_has(int64_t m, int64_t key);
extern int64_t rt_map_remove(int64_t m, int64_t key);
extern int64_t rt_map_key_at(int64_t m, int64_t idx);
extern int64_t rt_map_val_at(int64_t m, int64_t idx);
extern int64_t rt_map_val_tag_at(int64_t m, int64_t idx);
extern void    rt_map_free(int64_t m);
extern int64_t rt_map_find(int64_t m, int64_t key);
extern void    rt_map_put(int64_t m, int64_t key, int64_t tag, int64_t payload);

/* Entity */
extern int64_t rt_entity_new(int64_t tname);
extern int64_t rt_entity_new_slotted(int64_t tname, int64_t nslots);
extern int64_t rt_entity_type_name(int64_t e);
extern int64_t rt_entity_is_slotted(int64_t e);
extern void    rt_entity_put(int64_t e, int64_t field, int64_t tag, int64_t payload);
extern void    rt_entity_put_i64(int64_t e, int64_t field, int64_t val);
extern void    rt_entity_put_str(int64_t e, int64_t field, int64_t val);
extern void    rt_entity_put_null(int64_t e, int64_t field);
extern int64_t rt_entity_get(int64_t e, int64_t field);
extern int64_t rt_entity_get_i64(int64_t e, int64_t field);
extern int64_t rt_entity_has(int64_t e, int64_t field);
extern int64_t rt_entity_field_count(int64_t e);
extern void    rt_entity_set_field_name(int64_t e, int64_t idx, int64_t name);
extern int64_t rt_entity_get_slot(int64_t e, int64_t idx);
extern void    rt_entity_set_slot_i64(int64_t e, int64_t idx, int64_t val);
extern void    rt_entity_set_slot_str(int64_t e, int64_t idx, int64_t val);
extern void    rt_entity_set_slot_null(int64_t e, int64_t idx);
extern void    rt_entity_set_slot_bool(int64_t e, int64_t idx, int64_t val);
extern void    rt_entity_free(int64_t e);

/* Value (boxing/unboxing) */
extern int64_t rt_box_i64(int64_t n);
extern int64_t rt_box_str(int64_t s);
extern int64_t rt_box_list(int64_t lst);
extern int64_t rt_box_map(int64_t m);
extern int64_t rt_box_entity(int64_t e);
extern int64_t rt_box_f64(int64_t raw);
extern int64_t rt_box_bool(int64_t b);
extern int64_t rt_box_null(void);
extern int64_t rt_value_tag(int64_t v);
extern int64_t rt_value_payload(int64_t v);
extern int64_t rt_value_as_i64(int64_t v);
extern int64_t rt_value_as_str(int64_t v);
extern int64_t rt_value_truthy(int64_t v);
extern int64_t rt_value_compare(int64_t a, int64_t b);
extern void    rt_value_free(int64_t v);

/* ═══════════════════════════════════════════════════════════
 *  Global GC context
 * ═══════════════════════════════════════════════════════════ */
static int64_t __obo_gc_ctx = 0;

static void __gc_ensure(void) {
    if (!__obo_gc_ctx) __obo_gc_ctx = rt_gc_init();
}

static void __gc_reg(int64_t ptr, int64_t kind) {
    if (ptr && __obo_gc_ctx) rt_gc_register(__obo_gc_ctx, ptr, kind);
}

/* Update a GC-tracked pointer after realloc moves it. */
static void __gc_update_ptr(int64_t old_ptr, int64_t new_ptr) {
    if (!__obo_gc_ctx || old_ptr == new_ptr || !old_ptr || !new_ptr) return;
    int64_t node = rt_gc_find_node(__obo_gc_ctx, old_ptr);
    if (!node) return;
    rt_gc_ht_remove(__obo_gc_ctx, node);
    /* node layout: [ptr(0), mark_kind(8), next(16), ht_next(24)] */
    *(int64_t *)node = new_ptr;
    rt_gc_ht_insert(__obo_gc_ctx, node);
}

/* ═══════════════════════════════════════════════════════════
 *  1. GC — global wrappers
 * ═══════════════════════════════════════════════════════════ */
void obo_gc_push_root(void **slot) {
    __gc_ensure();
    rt_gc_push_root(__obo_gc_ctx, (int64_t)slot);
}

void obo_gc_push_roots_bulk(void ***slots, int64_t n) {
    __gc_ensure();
    for (int64_t i = 0; i < n; i++)
        rt_gc_push_root(__obo_gc_ctx, (int64_t)slots[i]);
}

void obo_gc_pop_roots(int64_t n) {
    if (__obo_gc_ctx) rt_gc_pop_roots(__obo_gc_ctx, n);
}

void obo_gc_collect(void) {
    if (__obo_gc_ctx) rt_gc_collect(__obo_gc_ctx);
}

void obo_gc_pause(void) {
    if (__obo_gc_ctx) rt_gc_pause(__obo_gc_ctx);
}

void obo_gc_resume(void) {
    if (__obo_gc_ctx) rt_gc_resume(__obo_gc_ctx);
}

/* ═══════════════════════════════════════════════════════════
 *  2. String operations
 * ═══════════════════════════════════════════════════════════ */
char *obo_str_concat(const char *a, const char *b) {
    int64_t r = rt_str_concat((int64_t)a, (int64_t)b);
    __gc_reg(r, GC_STRING);
    return (char *)r;
}

char *obo_str_concat_int(const char *a, int64_t b) {
    int64_t bs = rt_i64_to_str(b);
    int64_t r = rt_str_concat((int64_t)a, bs);
    /* Don't free bs — let GC handle it if needed, or it leaks (acceptable). */
    __gc_reg(r, GC_STRING);
    return (char *)r;
}

char *obo_i64_to_str(int64_t n) {
    int64_t r = rt_i64_to_str(n);
    __gc_reg(r, GC_STRING);
    return (char *)r;
}

char *obo_f64_to_str(double d) {
    char buf[64];
    int n = snprintf(buf, sizeof(buf), "%.15g", d);
    char *r = (char *)malloc(n + 1);
    memcpy(r, buf, n + 1);
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}

int64_t obo_str_truthy(const char *s) {
    return rt_str_truthy((int64_t)s);
}

char *obo_prompt(const char *msg) {
    if (msg) printf("%s", msg);
    char buf[4096];
    if (!fgets(buf, sizeof(buf), stdin)) return (char *)calloc(1, 1);
    size_t len = strlen(buf);
    if (len && buf[len - 1] == '\n') buf[--len] = '\0';
    char *r = (char *)malloc(len + 1);
    memcpy(r, buf, len + 1);
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}

/* ═══════════════════════════════════════════════════════════
 *  Text methods (__text_*)
 * ═══════════════════════════════════════════════════════════ */
int64_t __text_length(const char *s) { return rt_strlen((int64_t)s); }
int64_t __text_empty(const char *s)  { return (!s || *(const char *)s == '\0') ? 1 : 0; }
char *__text_upper(const char *s)    { int64_t r = rt_str_upper((int64_t)s); __gc_reg(r, GC_STRING); return (char *)r; }
char *__text_lower(const char *s)    { int64_t r = rt_str_lower((int64_t)s); __gc_reg(r, GC_STRING); return (char *)r; }
char *__text_trim(const char *s)     { int64_t r = rt_str_trim((int64_t)s); __gc_reg(r, GC_STRING); return (char *)r; }
char *__text_trimStart(const char *s) { return __text_trim(s); }  /* simplified */
char *__text_trimEnd(const char *s)  { return __text_trim(s); }  /* simplified */
char *__text_reversed(const char *s) { int64_t r = rt_str_reversed((int64_t)s); __gc_reg(r, GC_STRING); return (char *)r; }
int64_t __text_contains(const char *h, const char *n) { return rt_str_contains((int64_t)h, (int64_t)n); }
int64_t __text_startsWith(const char *s, const char *p) { return rt_str_startsWith((int64_t)s, (int64_t)p); }
int64_t __text_endsWith(const char *s, const char *p) { return rt_str_endsWith((int64_t)s, (int64_t)p); }
int64_t __text_indexOf(const char *h, const char *n) { return rt_str_indexOf((int64_t)h, (int64_t)n); }
char *__text_replace(const char *s, const char *o, const char *n) {
    int64_t r = rt_str_replace_all((int64_t)s, (int64_t)o, (int64_t)n);
    __gc_reg(r, GC_STRING);
    return (char *)r;
}
char *__text_substring(const char *s, int64_t start, int64_t end) {
    int64_t r = rt_str_substring((int64_t)s, start, end);
    __gc_reg(r, GC_STRING);
    return (char *)r;
}
char *__text_repeat(const char *s, int64_t n) {
    int64_t r = rt_str_repeat((int64_t)s, n);
    __gc_reg(r, GC_STRING);
    return (char *)r;
}
char *__text_padLeft(const char *s, int64_t len, const char *pad) {
    int64_t slen = rt_strlen((int64_t)s);
    if (slen >= len) return (char *)rt_strdup((int64_t)s);
    int64_t need = len - slen;
    char *r = (char *)malloc(len + 1);
    int64_t plen = rt_strlen((int64_t)pad);
    if (plen == 0) plen = 1;
    for (int64_t i = 0; i < need; i++) r[i] = pad ? ((const char *)pad)[i % plen] : ' ';
    memcpy(r + need, s, slen + 1);
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}
char *__text_padRight(const char *s, int64_t len, const char *pad) {
    int64_t slen = rt_strlen((int64_t)s);
    if (slen >= len) return (char *)rt_strdup((int64_t)s);
    int64_t need = len - slen;
    char *r = (char *)malloc(len + 1);
    memcpy(r, s, slen);
    int64_t plen = rt_strlen((int64_t)pad);
    if (plen == 0) plen = 1;
    for (int64_t i = 0; i < need; i++) r[slen + i] = pad ? ((const char *)pad)[i % plen] : ' ';
    r[len] = '\0';
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}
int64_t __text_toNumber(const char *s) { return s ? atoll(s) : 0; }
double __text_toDecimal(const char *s) { return s ? atof(s) : 0.0; }
void *__text_split(const char *s, const char *delim) {
    /* Returns a mixed list — stub: return empty list */
    (void)s; (void)delim;
    return NULL;
}

/* ═══════════════════════════════════════════════════════════
 *  3. Print helpers
 * ═══════════════════════════════════════════════════════════ */
void obo_print_bool(int64_t b) { printf("%s\n", b ? "true" : "false"); }
void obo_print_double(double d) { printf("%.15g\n", d); }

/* ═══════════════════════════════════════════════════════════
 *  4. List operations — inline layout matching C runtime
 *     Layout: [len(i64), cap(i64), items[](i64 each)]
 *     This matches the emitter's for-in loop which reads items
 *     inline starting at offset 16.
 * ═══════════════════════════════════════════════════════════ */
typedef struct { int64_t len; int64_t cap; int64_t items[]; } IList;

static IList *ilist_alloc(int64_t cap) {
    if (cap < 4) cap = 4;
    IList *l = (IList *)malloc(sizeof(IList) + cap * sizeof(int64_t));
    l->len = 0;
    l->cap = cap;
    return l;
}

/* Grow the list, updating GC tracking if pointer moves */
static IList *ilist_grow(IList *l, int64_t new_cap) {
    IList *nl = (IList *)realloc(l, sizeof(IList) + new_cap * sizeof(int64_t));
    nl->cap = new_cap;
    return nl;
}

void *obo_list_new_i64(int64_t len, int64_t *elems) {
    int64_t cap = len < 4 ? 4 : len;
    IList *l = ilist_alloc(cap);
    for (int64_t i = 0; i < len; i++) l->items[i] = elems[i];
    l->len = len;
    return (void *)l;
}

int64_t obo_list_len(void *lst)  { return lst ? ((IList *)lst)->len : 0; }

int64_t obo_list_get(void *lst, int64_t i) {
    IList *l = (IList *)lst;
    if (!l || i < 0 || i >= l->len) return 0;
    return l->items[i];
}

void obo_list_set_i64(void *lst, int64_t i, int64_t v) {
    IList *l = (IList *)lst;
    if (!l || i < 0 || i >= l->len) return;
    l->items[i] = v;
}

void *obo_list_add(void *lst, int64_t v) {
    IList *l = (IList *)lst;
    if (!l) { l = ilist_alloc(4); }
    if (l->len >= l->cap) {
        l = ilist_grow(l, l->cap * 2);
    }
    l->items[l->len++] = v;
    return (void *)l;
}

int64_t obo_list_first(void *lst) { IList *l = (IList *)lst; return (l && l->len > 0) ? l->items[0] : 0; }
int64_t obo_list_last(void *lst)  { IList *l = (IList *)lst; return (l && l->len > 0) ? l->items[l->len - 1] : 0; }
int64_t obo_list_empty(void *lst) { return obo_list_len(lst) == 0 ? 1 : 0; }

int64_t obo_list_contains(void *lst, int64_t v) {
    IList *l = (IList *)lst;
    if (!l) return 0;
    for (int64_t i = 0; i < l->len; i++) if (l->items[i] == v) return 1;
    return 0;
}

int64_t obo_list_indexOf(void *lst, int64_t v) {
    IList *l = (IList *)lst;
    if (!l) return -1;
    for (int64_t i = 0; i < l->len; i++) if (l->items[i] == v) return i;
    return -1;
}

void *obo_list_sort(void *lst) {
    IList *l = (IList *)lst;
    if (!l || l->len <= 1) return lst;
    IList *r = ilist_alloc(l->len);
    memcpy(r->items, l->items, l->len * sizeof(int64_t));
    r->len = l->len;
    for (int64_t i = 1; i < r->len; i++) {
        int64_t key = r->items[i];
        int64_t j = i - 1;
        while (j >= 0 && r->items[j] > key) { r->items[j + 1] = r->items[j]; j--; }
        r->items[j + 1] = key;
    }
    return (void *)r;
}

void *obo_list_reverse(void *lst) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++) r->items[i] = l->items[l->len - 1 - i];
    r->len = l->len;
    return (void *)r;
}

void *obo_list_slice(void *lst, int64_t start, int64_t end) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    if (start < 0) start = 0;
    if (end > l->len) end = l->len;
    if (start >= end) { IList *e = ilist_alloc(4); return (void *)e; }
    int64_t n = end - start;
    IList *r = ilist_alloc(n);
    memcpy(r->items, l->items + start, n * sizeof(int64_t));
    r->len = n;
    return (void *)r;
}

void *obo_list_take(void *lst, int64_t n) { return obo_list_slice(lst, 0, n); }
void *obo_list_skip(void *lst, int64_t n) { return obo_list_slice(lst, n, obo_list_len(lst)); }

void *obo_list_remove(void *lst, int64_t val) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++)
        if (l->items[i] != val) r->items[r->len++] = l->items[i];
    return (void *)r;
}

void *obo_list_removeAt(void *lst, int64_t idx) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++)
        if (i != idx) r->items[r->len++] = l->items[i];
    return (void *)r;
}

void *obo_list_insert(void *lst, int64_t idx, int64_t val) {
    IList *l = (IList *)lst;
    int64_t len = l ? l->len : 0;
    IList *r = ilist_alloc(len + 1);
    for (int64_t i = 0; i < len; i++) {
        if (i == idx) r->items[r->len++] = val;
        r->items[r->len++] = l->items[i];
    }
    if (idx >= len) r->items[r->len++] = val;
    return (void *)r;
}

void *obo_list_distinct(void *lst) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++) {
        int found = 0;
        for (int64_t j = 0; j < r->len; j++) { if (r->items[j] == l->items[i]) { found = 1; break; } }
        if (!found) r->items[r->len++] = l->items[i];
    }
    return (void *)r;
}

char *obo_list_join(void *lst, const char *sep) {
    IList *l = (IList *)lst;
    if (!l || l->len == 0) { char *r = (char *)calloc(1, 1); __gc_reg((int64_t)r, GC_STRING); return r; }
    int64_t result = rt_i64_to_str(l->items[0]);
    for (int64_t i = 1; i < l->len; i++) {
        int64_t tmp = rt_str_concat(result, (int64_t)sep);
        int64_t es = rt_i64_to_str(l->items[i]);
        result = rt_str_concat(tmp, es);
    }
    __gc_reg(result, GC_STRING);
    return (char *)result;
}

void obo_list_print(void *lst) {
    IList *l = (IList *)lst;
    printf("[");
    if (l) {
        for (int64_t i = 0; i < l->len; i++) {
            if (i) printf(", ");
            printf("%lld", (long long)l->items[i]);
        }
    }
    printf("]\n");
}

/* Bag (alias for list) */
void *obo_bag_add(void *lst, int64_t v) { return obo_list_add(lst, v); }
int64_t obo_bag_has(void *lst, int64_t v) { return rt_list_contains((int64_t)lst, v); }
void *obo_bag_remove(void *lst, int64_t v) { return obo_list_remove(lst, v); }

/* ═══════════════════════════════════════════════════════════
 *  5. Map operations
 * ═══════════════════════════════════════════════════════════ */
void *obo_map_new(void) {
    int64_t m = rt_map_new();
    __gc_reg(m, GC_MAP);
    return (void *)m;
}

int64_t obo_map_len(void *m) { return rt_map_len((int64_t)m); }
int64_t obo_map_empty(void *m) { return rt_map_len((int64_t)m) == 0 ? 1 : 0; }
int64_t obo_map_has(void *m, const char *k) { return rt_map_has((int64_t)m, (int64_t)k); }

void obo_map_put_i64(void *m, const char *k, int64_t v) { rt_map_put_i64((int64_t)m, (int64_t)k, v); }
void obo_map_put_str(void *m, const char *k, const char *v) { rt_map_put_str((int64_t)m, (int64_t)k, (int64_t)v); }
void obo_map_put_f64(void *m, const char *k, double v) {
    int64_t bits;
    memcpy(&bits, &v, 8);
    rt_map_put((int64_t)m, (int64_t)k, 5, bits);  /* TAG_F64=5 */
}
void obo_map_put_bool(void *m, const char *k, int64_t v) {
    rt_map_put((int64_t)m, (int64_t)k, 6, v);  /* TAG_BOOL=6 */
}
void obo_map_put_null(void *m, const char *k) { rt_map_put_null((int64_t)m, (int64_t)k); }
void obo_map_put_list(void *m, const char *k, void *v)   { rt_map_put((int64_t)m, (int64_t)k, 2, (int64_t)v); }
void obo_map_put_map(void *m, const char *k, void *v)    { rt_map_put((int64_t)m, (int64_t)k, 3, (int64_t)v); }
void obo_map_put_entity(void *m, const char *k, void *v) { rt_map_put((int64_t)m, (int64_t)k, 4, (int64_t)v); }
void obo_map_put_boxed(void *m, const char *k, void *v) {
    /* v is an OboValue*: read tag+payload from it */
    if (!v) { obo_map_put_null(m, k); return; }
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    /* String values must be strdup'd — payload may be a constant */
    if (tag == 1 && payload) { payload = rt_strdup(payload); }
    rt_map_put((int64_t)m, (int64_t)k, tag, payload);
}

void *obo_map_get_boxed(void *m, const char *k) {
    return (void *)rt_map_get((int64_t)m, (int64_t)k);
}

/* .set(key, val) → returns map (mutates in place) */
void *obo_map_set(void *m, const char *k, int64_t v) {
    rt_map_put_i64((int64_t)m, (int64_t)k, v);
    return m;
}
void *obo_map_remove(void *m, const char *k) {
    rt_map_remove((int64_t)m, (int64_t)k);
    return m;
}

/* Integer-keyed map helpers (i64 keys → convert to string) */
static char __int_key_buf[32];
static char *__int_to_key(int64_t k) {
    snprintf(__int_key_buf, sizeof(__int_key_buf), "%lld", (long long)k);
    return __int_key_buf;
}
void *obo_map_set_int(void *m, int64_t k, int64_t v) { return obo_map_set(m, __int_to_key(k), v); }
void *obo_map_set_int_str(void *m, int64_t k, const char *v) { obo_map_put_str(m, __int_to_key(k), v); return m; }
void *obo_map_set_int_boxed(void *m, int64_t k, void *v) { obo_map_put_boxed(m, __int_to_key(k), v); return m; }
int64_t obo_map_get_int(void *m, int64_t k) { return rt_map_get_i64((int64_t)m, (int64_t)__int_to_key(k)); }
void *obo_map_get_int_boxed(void *m, int64_t k) { return obo_map_get_boxed(m, __int_to_key(k)); }
int64_t obo_map_has_int(void *m, int64_t k) { return rt_map_has((int64_t)m, (int64_t)__int_to_key(k)); }
void *obo_map_remove_int(void *m, int64_t k) { return obo_map_remove(m, __int_to_key(k)); }

void obo_map_print(void *m) {
    int64_t len = rt_map_len((int64_t)m);
    printf("{");
    for (int64_t i = 0; i < len; i++) {
        if (i) printf(", ");
        printf("\"%s\": ", (char *)rt_map_key_at((int64_t)m, i));
        int64_t tag = rt_map_val_tag_at((int64_t)m, i);
        int64_t val = rt_map_val_at((int64_t)m, i);
        if (tag == 0)       printf("%lld", (long long)val);
        else if (tag == 1)  printf("\"%s\"", (char *)val);
        else                printf("<%lld>", (long long)tag);
    }
    printf("}\n");
}

/* ═══════════════════════════════════════════════════════════
 *  6. Entity operations
 * ═══════════════════════════════════════════════════════════ */
void *obo_entity_new(const char *type_name) {
    int64_t e = rt_entity_new((int64_t)type_name);
    __gc_reg(e, GC_ENTITY);
    return (void *)e;
}

void *obo_entity_new_slotted(const char *type_name, int32_t nslots) {
    int64_t e = rt_entity_new_slotted((int64_t)type_name, nslots);
    __gc_reg(e, GC_ENTITY_SLOTTED);
    return (void *)e;
}

void obo_entity_put_i64(void *e, const char *f, int64_t v) { rt_entity_put_i64((int64_t)e, (int64_t)f, v); }
void obo_entity_put_str(void *e, const char *f, const char *v) { rt_entity_put_str((int64_t)e, (int64_t)f, (int64_t)v); }
void obo_entity_put_f64(void *e, const char *f, double v) {
    int64_t bits;
    memcpy(&bits, &v, 8);
    rt_entity_put((int64_t)e, (int64_t)f, 5, bits);  /* TAG_F64=5 */
}
void obo_entity_put_bool(void *e, const char *f, int64_t v)   { rt_entity_put((int64_t)e, (int64_t)f, 6, v); }
void obo_entity_put_null(void *e, const char *f)              { rt_entity_put_null((int64_t)e, (int64_t)f); }
void obo_entity_put_list(void *e, const char *f, void *v)     { rt_entity_put((int64_t)e, (int64_t)f, 2, (int64_t)v); }
void obo_entity_put_map(void *e, const char *f, void *v)      { rt_entity_put((int64_t)e, (int64_t)f, 3, (int64_t)v); }
void obo_entity_put_entity(void *e, const char *f, void *v)   { rt_entity_put((int64_t)e, (int64_t)f, 4, (int64_t)v); }
void obo_entity_put_boxed(void *e, const char *f, void *v) {
    if (!v) { obo_entity_put_null(e, f); return; }
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    /* String values must be strdup'd — payload may be a constant */
    if (tag == 1 && payload) { payload = rt_strdup(payload); }
    rt_entity_put((int64_t)e, (int64_t)f, tag, payload);
}

void *obo_entity_get_boxed(void *e, const char *f) {
    return (void *)rt_entity_get((int64_t)e, (int64_t)f);
}

void obo_entity_print(void *e) {
    const char *tn = (const char *)rt_entity_type_name((int64_t)e);
    printf("%s { ... }\n", tn ? tn : "?");
}

/* Slotted entity */
void obo_entity_set_field_name(void *e, int32_t idx, const char *name) {
    rt_entity_set_field_name((int64_t)e, idx, (int64_t)name);
}
void *obo_entity_get_slot(void *e, int32_t idx) {
    return (void *)rt_entity_get_slot((int64_t)e, idx);
}
void obo_entity_set_slot_i64(void *e, int32_t idx, int64_t v)  { rt_entity_set_slot_i64((int64_t)e, idx, v); }
void obo_entity_set_slot_f64(void *e, int32_t idx, double v) {
    int64_t bits;
    memcpy(&bits, &v, 8);
    /* Slot layout: [tag(i64), payload(i64)]. TAG_F64=5 */
    int64_t slot_base = (int64_t)e + 32 + idx * 16;
    *(int64_t *)slot_base = 5;
    *((int64_t *)slot_base + 1) = bits;
}
void obo_entity_set_slot_str(void *e, int32_t idx, const char *v) { rt_entity_set_slot_str((int64_t)e, idx, (int64_t)v); }
void obo_entity_set_slot_bool(void *e, int32_t idx, int64_t v)   { rt_entity_set_slot_bool((int64_t)e, idx, v); }
void obo_entity_set_slot_null(void *e, int32_t idx)              { rt_entity_set_slot_null((int64_t)e, idx); }
void obo_entity_set_slot_list(void *e, int32_t idx, void *v) {
    int64_t slot_base = (int64_t)e + 32 + idx * 16;
    *(int64_t *)slot_base = 2;
    *((int64_t *)slot_base + 1) = (int64_t)v;
}
void obo_entity_set_slot_map(void *e, int32_t idx, void *v) {
    int64_t slot_base = (int64_t)e + 32 + idx * 16;
    *(int64_t *)slot_base = 3;
    *((int64_t *)slot_base + 1) = (int64_t)v;
}
void obo_entity_set_slot_entity(void *e, int32_t idx, void *v) {
    int64_t slot_base = (int64_t)e + 32 + idx * 16;
    *(int64_t *)slot_base = 4;
    *((int64_t *)slot_base + 1) = (int64_t)v;
}
void obo_entity_set_slot_boxed(void *e, int32_t idx, void *v) {
    int64_t slot_base = (int64_t)e + 32 + idx * 16;
    if (!v) {
        *(int64_t *)slot_base = 0;
        *((int64_t *)slot_base + 1) = 0;
    } else {
        int64_t tag = *(int64_t *)v;
        int64_t payload = *((int64_t *)v + 1);
        /* String payloads must be strdup'd — may be constants */
        if (tag == 1 && payload) payload = rt_strdup(payload);
        *(int64_t *)slot_base = tag;
        *((int64_t *)slot_base + 1) = payload;
    }
}

/* Hybrid get-field-or-slot */
void *obo_entity_gfs(void *e, int32_t slot_idx, const char *field_name) {
    if (rt_entity_is_slotted((int64_t)e))
        return (void *)rt_entity_get_slot((int64_t)e, slot_idx);
    return (void *)rt_entity_get((int64_t)e, (int64_t)field_name);
}

/* Hybrid set-field-or-slot */
void obo_entity_sfs_i64(void *e, int32_t idx, const char *f, int64_t v) {
    if (rt_entity_is_slotted((int64_t)e)) rt_entity_set_slot_i64((int64_t)e, idx, v);
    else rt_entity_put_i64((int64_t)e, (int64_t)f, v);
}
void obo_entity_sfs_f64(void *e, int32_t idx, const char *f, double v) {
    if (rt_entity_is_slotted((int64_t)e)) obo_entity_set_slot_f64(e, idx, v);
    else obo_entity_put_f64(e, f, v);
}
void obo_entity_sfs_str(void *e, int32_t idx, const char *f, const char *v) {
    if (rt_entity_is_slotted((int64_t)e)) rt_entity_set_slot_str((int64_t)e, idx, (int64_t)v);
    else rt_entity_put_str((int64_t)e, (int64_t)f, (int64_t)v);
}
void obo_entity_sfs_bool(void *e, int32_t idx, const char *f, int64_t v) {
    if (rt_entity_is_slotted((int64_t)e)) rt_entity_set_slot_bool((int64_t)e, idx, v);
    else obo_entity_put_bool(e, f, v);
}
void obo_entity_sfs_null(void *e, int32_t idx, const char *f) {
    if (rt_entity_is_slotted((int64_t)e)) rt_entity_set_slot_null((int64_t)e, idx);
    else rt_entity_put_null((int64_t)e, (int64_t)f);
}
void obo_entity_sfs_list(void *e, int32_t idx, const char *f, void *v) {
    if (rt_entity_is_slotted((int64_t)e)) obo_entity_set_slot_list(e, idx, v);
    else obo_entity_put_list(e, f, v);
}
void obo_entity_sfs_map(void *e, int32_t idx, const char *f, void *v) {
    if (rt_entity_is_slotted((int64_t)e)) obo_entity_set_slot_map(e, idx, v);
    else obo_entity_put_map(e, f, v);
}
void obo_entity_sfs_entity(void *e, int32_t idx, const char *f, void *v) {
    if (rt_entity_is_slotted((int64_t)e)) obo_entity_set_slot_entity(e, idx, v);
    else obo_entity_put_entity(e, f, v);
}
void obo_entity_sfs_boxed(void *e, int32_t idx, const char *f, void *v) {
    if (rt_entity_is_slotted((int64_t)e)) obo_entity_set_slot_boxed(e, idx, v);
    else obo_entity_put_boxed(e, f, v);
}

/* ═══════════════════════════════════════════════════════════
 *  7. Boxing / OboValue operations
 * ═══════════════════════════════════════════════════════════ */
/* OboValue layout: [tag(i64), payload(i64)] = 16 bytes */
#define TAG_INT    0
#define TAG_STR    1
#define TAG_LIST   2
#define TAG_MAP    3
#define TAG_ENTITY 4
#define TAG_F64    5
#define TAG_BOOL   6
#define TAG_NULL   7

/* ── Value Arena (ring buffer) — matches C runtime's __value_arena ── */
#define VALUE_ARENA_SIZE 4096
typedef struct { int64_t tag; int64_t payload; } BridgeValue;
static BridgeValue __bridge_value_arena[VALUE_ARENA_SIZE];
static uint32_t __bridge_value_idx = 0;

static void *bridge_alloc_value(int64_t tag, int64_t payload) {
    BridgeValue *v = &__bridge_value_arena[__bridge_value_idx & (VALUE_ARENA_SIZE - 1)];
    __bridge_value_idx++;
    v->tag = tag;
    v->payload = payload;
    return (void *)v;
}

void *obo_box_i64(int64_t v)   { return bridge_alloc_value(TAG_INT, v); }
void *obo_box_f64(double v)    {
    int64_t bits;
    memcpy(&bits, &v, 8);
    return bridge_alloc_value(TAG_F64, bits);
}
void *obo_box_str(const char *v) { return bridge_alloc_value(TAG_STR, (int64_t)v); }
void *obo_box_bool(int64_t v)   { return bridge_alloc_value(TAG_BOOL, v ? 1 : 0); }
void *obo_box_null(void)        { return bridge_alloc_value(TAG_NULL, 0); }
void *obo_box_list(void *v)     { return bridge_alloc_value(TAG_LIST, (int64_t)v); }
void *obo_box_map(void *v)      { return bridge_alloc_value(TAG_MAP, (int64_t)v); }
void *obo_box_entity(void *v)   { return bridge_alloc_value(TAG_ENTITY, (int64_t)v); }

int64_t obo_value_as_i64(void *v) {
    if (!v) return 0;
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    if (tag == TAG_INT) return payload;
    if (tag == TAG_F64) { double d; memcpy(&d, &payload, 8); return (int64_t)d; }
    if (tag == TAG_BOOL) return payload;
    return 0;
}
double  obo_value_as_f64(void *v) {
    if (!v) return 0.0;
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    if (tag == TAG_F64) { double d; memcpy(&d, &payload, 8); return d; }
    if (tag == TAG_INT) return (double)payload;
    if (tag == TAG_BOOL) return payload ? 1.0 : 0.0;
    return 0.0;
}
char *obo_value_as_str(void *v) { return (char *)rt_value_as_str((int64_t)v); }
int64_t obo_value_truthy(void *v) { return rt_value_truthy((int64_t)v); }
int64_t obo_value_compare(void *a, void *b) { return rt_value_compare((int64_t)a, (int64_t)b); }

int64_t obo_value_len(void *v) {
    if (!v) return 0;
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    if (tag == TAG_STR)    return rt_strlen(payload);
    if (tag == TAG_LIST)   return rt_list_len(payload);
    if (tag == TAG_MAP)    return rt_map_len(payload);
    return 0;
}

int64_t obo_value_empty(void *v) { return obo_value_len(v) == 0 ? 1 : 0; }

void *obo_value_keys(void *v) {
    (void)v;
    return NULL; /* stub */
}

void *obo_value_as_list_ptr(void *v) {
    if (!v) return NULL;
    return (void *)(*((int64_t *)v + 1));
}
void *obo_value_as_mixed_list_ptr(void *v) { return obo_value_as_list_ptr(v); }
void *obo_value_as_map_ptr(void *v)        { return obo_value_as_list_ptr(v); }
void *obo_value_as_entity_ptr(void *v)     { return obo_value_as_list_ptr(v); }

char *obo_value_to_str(void *v) {
    if (!v) { char *r = (char *)malloc(5); strcpy(r, "null"); __gc_reg((int64_t)r, GC_STRING); return r; }
    int64_t tag = *(int64_t *)v;
    int64_t payload = *((int64_t *)v + 1);
    if (tag == TAG_INT)    return obo_i64_to_str(payload);
    if (tag == TAG_STR)    return (char *)rt_strdup(payload);
    if (tag == TAG_F64)  { double d; memcpy(&d, &payload, 8); return obo_f64_to_str(d); }
    if (tag == TAG_BOOL)   { char *r = (char *)malloc(6); strcpy(r, payload ? "true" : "false"); __gc_reg((int64_t)r, GC_STRING); return r; }
    if (tag == TAG_NULL)   { char *r = (char *)malloc(5); strcpy(r, "null"); __gc_reg((int64_t)r, GC_STRING); return r; }
    return obo_i64_to_str(payload); /* fallback */
}

void obo_value_print(void *v) {
    char *s = obo_value_to_str(v);
    printf("%s\n", s);
}

int64_t obo_value_to_closure_arg_boxed(void *v) {
    if (!v) return 0;
    int64_t tag = *(int64_t *)v;
    return *((int64_t *)v + 1);
    (void)tag;
}

/* ═══════════════════════════════════════════════════════════
 *  8. Math / Time / File / Convert
 * ═══════════════════════════════════════════════════════════ */
int64_t __sys_Math_abs(int64_t x)        { return x < 0 ? -x : x; }
int64_t __sys_Math_floor(double x)       { return (int64_t)floor(x); }
int64_t __sys_Math_ceil(double x)        { return (int64_t)ceil(x); }
int64_t __sys_Math_round(double x)       { return (int64_t)round(x); }
int64_t __sys_Math_min(int64_t a, int64_t b) { return a < b ? a : b; }
int64_t __sys_Math_max(int64_t a, int64_t b) { return a > b ? a : b; }
int64_t __sys_Math_sign(int64_t x)       { return (x > 0) - (x < 0); }
int64_t __sys_Math_maxNumber(void)       { return INT64_MAX; }
int64_t __sys_Math_minNumber(void)       { return INT64_MIN; }
double  __sys_Math_pi(void)              { return 3.14159265358979323846; }
double  __sys_Math_e(void)               { return 2.71828182845904523536; }
double  __sys_Math_infinity(void)        { return 1.0 / 0.0; }
double  __sys_Math_sqrt(double x)        { return sqrt(x); }
double  __sys_Math_pow(double x, double y) { return pow(x, y); }
double  __sys_Math_sin(double x)         { return sin(x); }
double  __sys_Math_cos(double x)         { return cos(x); }
double  __sys_Math_tan(double x)         { return tan(x); }
double  __sys_Math_asin(double x)        { return asin(x); }
double  __sys_Math_acos(double x)        { return acos(x); }
double  __sys_Math_atan(double x)        { return atan(x); }
double  __sys_Math_atan2(double y, double x) { return atan2(y, x); }
double  __sys_Math_log(double x)         { return log(x); }
double  __sys_Math_log10(double x)       { return log10(x); }
double  __sys_Math_lerp(double a, double b, double t) { return a + (b - a) * t; }
double  __sys_Math_clamp(double v, double lo, double hi) { return v < lo ? lo : v > hi ? hi : v; }
double  __sys_Math_random(void)          { return (double)rand() / (double)RAND_MAX; }
int64_t __sys_Math_randomInt(int64_t lo, int64_t hi) { return lo + rand() % (hi - lo + 1); }

int64_t __sys_Time_now(void)         { struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts); return ts.tv_sec * 1000 + ts.tv_nsec / 1000000; }
int64_t __sys_Time_nowSeconds(void)  { return time(NULL); }
int64_t __sys_Time_sleep(int64_t ms) { usleep((useconds_t)(ms * 1000)); return 0; }
double  __sys_Time_measure(void)     { struct timespec ts; clock_gettime(CLOCK_MONOTONIC, &ts); return ts.tv_sec + ts.tv_nsec * 1e-9; }
int64_t __sys_Time_startTimer(void)  { return __sys_Time_now(); }
int64_t __sys_Time_stopTimer(void)   { return __sys_Time_now(); }

char *__sys_File_read(const char *path) {
    FILE *f = fopen(path, "rb");
    if (!f) return (char *)calloc(1, 1);
    fseek(f, 0, SEEK_END);
    long sz = ftell(f);
    fseek(f, 0, SEEK_SET);
    char *buf = (char *)malloc(sz + 1);
    fread(buf, 1, sz, f);
    buf[sz] = '\0';
    fclose(f);
    __gc_reg((int64_t)buf, GC_STRING);
    return buf;
}
int64_t __sys_File_write(const char *path, const char *data) {
    FILE *f = fopen(path, "wb");
    if (!f) return 0;
    int64_t r = fwrite(data, 1, strlen(data), f);
    fclose(f);
    return r;
}
int64_t __sys_File_append(const char *path, const char *data) {
    FILE *f = fopen(path, "ab");
    if (!f) return 0;
    int64_t r = fwrite(data, 1, strlen(data), f);
    fclose(f);
    return r;
}
int64_t __sys_File_delete(const char *path) { return remove(path) == 0 ? 1 : 0; }
int64_t __sys_File_exists(const char *path) { return access(path, F_OK) == 0 ? 1 : 0; }
void   *__sys_File_readLines(const char *path) { (void)path; return NULL; /* stub */ }

int64_t __sys_Convert_toNumber(const char *s) { return s ? atoll(s) : 0; }
char   *__sys_Convert_toText(int64_t n)       { return obo_i64_to_str(n); }
double  __sys_Convert_toDecimal(const char *s) { return s ? atof(s) : 0.0; }
int64_t __sys_Convert_toFlag(int64_t v)       { return v ? 1 : 0; }
int64_t __sys_Convert_toChar(int64_t v)       { return v; }

/* pointer actor (also declared inline by emitter, but needed for fallback) */
int64_t __sys_pointer_alloc(int64_t sz) { return (int64_t)malloc(sz); }
int64_t __sys_pointer_free(int64_t ptr) { free((void *)ptr); return 0; }

/* ═══════════════════════════════════════════════════════════
 *  9. Closures (minimal implementation)
 * ═══════════════════════════════════════════════════════════ */
/* Closure layout: [fn_ptr(i64), ncaptures(i64), captures[]] */
void *obo_closure_new(void *fn, int64_t ncap) {
    int64_t sz = 16 + ncap * 8;
    int64_t *c = (int64_t *)calloc(1, sz);
    c[0] = (int64_t)fn;
    c[1] = ncap;
    __gc_reg((int64_t)c, GC_CLOSURE);
    return (void *)c;
}
void obo_closure_set_capture(void *c, int64_t idx, int64_t val) {
    ((int64_t *)c)[2 + idx] = val;
}
int64_t obo_closure_get_capture(void *c, int64_t idx) {
    return ((int64_t *)c)[2 + idx];
}

typedef int64_t (*fn0_t)(void);
typedef int64_t (*fn1_t)(int64_t);
typedef int64_t (*fn2_t)(int64_t, int64_t);
typedef int64_t (*fn3_t)(int64_t, int64_t, int64_t);
typedef int64_t (*fn4_t)(int64_t, int64_t, int64_t, int64_t);

/* Closure calling convention: fn(closure_ptr, args...) — closure is always the first argument. */
int64_t obo_closure_call_0(void *c) { return ((fn1_t)(((int64_t *)c)[0]))((int64_t)c); }
int64_t obo_closure_call_1(void *c, int64_t a) { return ((fn2_t)(((int64_t *)c)[0]))((int64_t)c, a); }
int64_t obo_closure_call_2(void *c, int64_t a, int64_t b) { return ((fn3_t)(((int64_t *)c)[0]))((int64_t)c, a, b); }
int64_t obo_closure_call_3(void *c, int64_t a, int64_t b, int64_t d) { return ((fn4_t)(((int64_t *)c)[0]))((int64_t)c, a, b, d); }
int64_t obo_call_indirect_i64(void *fn, int64_t argc, int64_t *argv) {
    if (argc == 0) return ((fn1_t)fn)(0);
    if (argc == 1) return ((fn2_t)fn)(0, argv[0]);
    if (argc == 2) return ((fn3_t)fn)(0, argv[0], argv[1]);
    if (argc == 3) return ((fn4_t)fn)(0, argv[0], argv[1], argv[2]);
    return 0;
}

/* HOF stubs for list filter/map/reduce/sort_by */
void *obo_list_filter(void *lst, void *cls) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++) {
        if (obo_closure_call_1(cls, l->items[i])) r->items[r->len++] = l->items[i];
    }
    return (void *)r;
}
void *obo_list_map(void *lst, void *cls) {
    IList *l = (IList *)lst;
    if (!l) return lst;
    IList *r = ilist_alloc(l->len);
    for (int64_t i = 0; i < l->len; i++) {
        r->items[i] = obo_closure_call_1(cls, l->items[i]);
    }
    r->len = l->len;
    return (void *)r;
}
int64_t obo_list_reduce(void *lst, int64_t init, void *cls) {
    IList *l = (IList *)lst;
    int64_t acc = init;
    if (l) for (int64_t i = 0; i < l->len; i++)
        acc = obo_closure_call_2(cls, acc, l->items[i]);
    return acc;
}
int64_t obo_list_any(void *lst, void *cls) {
    IList *l = (IList *)lst;
    if (l) for (int64_t i = 0; i < l->len; i++)
        if (obo_closure_call_1(cls, l->items[i])) return 1;
    return 0;
}
int64_t obo_list_all(void *lst, void *cls) {
    IList *l = (IList *)lst;
    if (l) for (int64_t i = 0; i < l->len; i++)
        if (!obo_closure_call_1(cls, l->items[i])) return 0;
    return 1;
}
void *obo_list_sort_by(void *lst, void *cls) {
    IList *l = (IList *)lst;
    if (!l || l->len <= 1) return lst;
    IList *r = ilist_alloc(l->len);
    memcpy(r->items, l->items, l->len * sizeof(int64_t));
    r->len = l->len;
    for (int64_t i = 1; i < r->len; i++) {
        int64_t key = r->items[i];
        int64_t j = i - 1;
        while (j >= 0 && obo_closure_call_2(cls, r->items[j], key) > 0) {
            r->items[j + 1] = r->items[j]; j--;
        }
        r->items[j + 1] = key;
    }
    return (void *)r;
}

/* ═══════════════════════════════════════════════════════════
 *  10. Mixed lists (stubs)
 * ═══════════════════════════════════════════════════════════ */
void *obo_mixed_list_new(int64_t len) {
    /* Layout: [len(i64), cap(i64), items[](16 each)] */
    int64_t sz = 16 + len * 16;
    int64_t *ml = (int64_t *)calloc(1, sz);
    ml[0] = len;
    ml[1] = len;
    __gc_reg((int64_t)ml, GC_MIXED_LIST);
    return (void *)ml;
}
void obo_mixed_list_set(void *ml, int64_t idx, void *val) {
    int64_t base = (int64_t)ml + 16 + idx * 16;
    if (val) {
        int64_t tag = *(int64_t *)val;
        int64_t payload = *((int64_t *)val + 1);
        /* String payloads must be strdup'd — may be constants */
        if (tag == 1 && payload) payload = rt_strdup(payload);
        *(int64_t *)base = tag;
        *((int64_t *)base + 1) = payload;
    } else {
        *(int64_t *)base = TAG_NULL;
        *((int64_t *)base + 1) = 0;
    }
}
void *obo_mixed_list_get(void *ml, int64_t idx) {
    return (void *)((int64_t)ml + 16 + idx * 16);
}
int64_t obo_mixed_list_len(void *ml) { return ml ? *(int64_t *)ml : 0; }
void obo_mixed_list_print(void *ml) { printf("[mixed list len=%lld]\n", (long long)obo_mixed_list_len(ml)); }
void *obo_mixed_list_filter(void *ml, void *cls) {
    if (!ml || !cls) return obo_mixed_list_new(0);
    int64_t len = *(int64_t *)ml;
    /* Count matches first */
    int64_t count = 0;
    for (int64_t i = 0; i < len; i++) {
        int64_t base = (int64_t)ml + 16 + i * 16;
        int64_t tag = *(int64_t *)base;
        int64_t payload = *((int64_t *)base + 1);
        /* For entities/maps/lists, pass the payload pointer; for ints/bools pass value */
        int64_t arg = (tag >= 2 && tag <= 4) ? payload : payload;
        if (obo_closure_call_1(cls, arg)) count++;
    }
    void *result = obo_mixed_list_new(count);
    int64_t j = 0;
    for (int64_t i = 0; i < len; i++) {
        int64_t src = (int64_t)ml + 16 + i * 16;
        int64_t tag = *(int64_t *)src;
        int64_t payload = *((int64_t *)src + 1);
        int64_t arg = payload;
        if (obo_closure_call_1(cls, arg)) {
            int64_t dst = (int64_t)result + 16 + j * 16;
            *(int64_t *)dst = tag;
            int64_t pay = payload;
            if (tag == 1 && pay) pay = rt_strdup(pay);
            *((int64_t *)dst + 1) = pay;
            j++;
        }
    }
    return result;
}
void *obo_mixed_list_map(void *ml, void *cls) {
    if (!ml || !cls) return obo_mixed_list_new(0);
    int64_t len = *(int64_t *)ml;
    void *result = obo_mixed_list_new(len);
    for (int64_t i = 0; i < len; i++) {
        int64_t src = (int64_t)ml + 16 + i * 16;
        int64_t payload = *((int64_t *)src + 1);
        int64_t rv = obo_closure_call_1(cls, payload);
        int64_t dst = (int64_t)result + 16 + i * 16;
        *(int64_t *)dst = TAG_INT;
        *((int64_t *)dst + 1) = rv;
    }
    return result;
}
void obo_mixed_list_each(void *ml, void *cls) {
    if (!ml || !cls) return;
    int64_t len = *(int64_t *)ml;
    for (int64_t i = 0; i < len; i++) {
        int64_t payload = *((int64_t *)((int64_t)ml + 16 + i * 16) + 1);
        obo_closure_call_1(cls, payload);
    }
}
void *obo_mixed_list_add(void *ml, void *v) {
    int64_t len = obo_mixed_list_len(ml);
    int64_t nsz = 16 + (len + 1) * 16;
    int64_t *newml = (int64_t *)realloc(ml, nsz);
    __gc_update_ptr((int64_t)ml, (int64_t)newml);
    newml[0] = len + 1;
    newml[1] = len + 1;
    int64_t base = (int64_t)newml + 16 + len * 16;
    if (v) {
        int64_t tag = *(int64_t *)v;
        int64_t payload = *((int64_t *)v + 1);
        /* String payloads must be strdup'd — may be constants */
        if (tag == 1 && payload) payload = rt_strdup(payload);
        *(int64_t *)base = tag;
        *((int64_t *)base + 1) = payload;
    } else {
        *(int64_t *)base = TAG_NULL;
        *((int64_t *)base + 1) = 0;
    }
    return (void *)newml;
}
void *obo_mixed_list_removeAt(void *ml, int64_t idx) { (void)idx; return ml; }
char *obo_mixed_list_join(void *ml, const char *sep) { (void)ml; (void)sep; return (char *)calloc(1, 1); }
int64_t obo_mixed_list_contains(void *ml, void *v) { (void)ml; (void)v; return 0; }
void *obo_mixed_list_reduce(void *ml, void *init, void *cls) { (void)ml; (void)cls; return init; }
int64_t obo_mixed_list_any(void *ml, void *cls) { (void)ml; (void)cls; return 0; }
int64_t obo_mixed_list_all(void *ml, void *cls) { (void)ml; (void)cls; return 1; }

/* sort_by for mixed lists: insertion sort using closure comparator */
static void *__ml_sort_cls;
static int __ml_cmp_fn(const void *a, const void *b) {
    int64_t pa = *((int64_t *)a + 1);  /* payload of item a */
    int64_t pb = *((int64_t *)b + 1);  /* payload of item b */
    int64_t r = obo_closure_call_2(__ml_sort_cls, pa, pb);
    return (r > 0) - (r < 0);
}
void *obo_mixed_list_sort_by(void *ml, void *cls) {
    if (!ml || !cls) return ml;
    int64_t len = *(int64_t *)ml;
    if (len <= 1) return ml;
    /* Copy entire list */
    int64_t sz = 16 + len * 16;
    void *result = obo_mixed_list_new(len);
    memcpy((char *)result + 16, (char *)ml + 16, len * 16);
    /* qsort with closure comparator, GC paused */
    __ml_sort_cls = cls;
    obo_gc_pause();
    qsort((char *)result + 16, len, 16, __ml_cmp_fn);
    obo_gc_resume();
    __ml_sort_cls = NULL;
    return result;
}

/* Dynamic indexing — input is an OboValue* (tag+payload pair) */
static int64_t __zero_boxed[2] = {0, 0};
void *obo_dyn_index(void *boxed, int64_t key) {
    if (!boxed) return (void *)__zero_boxed;
    int64_t tag = *(int64_t *)boxed;
    int64_t payload = *((int64_t *)boxed + 1);
    if (tag == TAG_MAP) {
        return obo_map_get_boxed((void *)payload, (const char *)(uintptr_t)key);
    } else if (tag == TAG_LIST) {
        return obo_mixed_list_get((void *)payload, key);
    }
    return (void *)__zero_boxed;
}
void *obo_dyn_index_str(void *boxed, const char *key) {
    if (!boxed) return (void *)__zero_boxed;
    int64_t tag = *(int64_t *)boxed;
    int64_t payload = *((int64_t *)boxed + 1);
    if (tag == TAG_MAP) {
        return obo_map_get_boxed((void *)payload, key);
    }
    return (void *)__zero_boxed;
}

/* ═══════════════════════════════════════════════════════════
 *  11. Misc — type check, dispatch, debug, etc.
 * ═══════════════════════════════════════════════════════════ */
int64_t obo_type_check(void *entity, const char *type_name) {
    if (!entity) return 0;
    const char *tn = (const char *)rt_entity_type_name((int64_t)entity);
    if (!tn || !type_name) return 0;
    return strcmp(tn, type_name) == 0 ? 1 : 0;
}

void *obo_assert_fail(const char *msg) {
    fprintf(stderr, "Assertion failed: %s\n", msg ? msg : "(null)");
    exit(1);
    return NULL;
}

void *obo_reflect(void *v) { (void)v; return NULL; }

int64_t obo_safe_div(int64_t a, int64_t b) { return b == 0 ? 0 : a / b; }
int64_t obo_safe_mod(int64_t a, int64_t b) { return b == 0 ? 0 : a % b; }

void *obo_range(int64_t start, int64_t end, int64_t step_val) {
    if (step_val == 0) step_val = 1;
    int64_t len = 0;
    if (step_val > 0 && end > start) len = (end - start + step_val - 1) / step_val;
    else if (step_val < 0 && start > end) len = (start - end - step_val - 1) / (-step_val);
    IList *l = ilist_alloc(len < 4 ? 4 : len);
    int64_t v = start;
    for (int64_t i = 0; i < len; i++) { l->items[i] = v; v += step_val; }
    l->len = len;
    return (void *)l;
}

char *obo_format_list_string(void *lst) {
    IList *l = (IList *)lst;
    int64_t len = l ? l->len : 0;
    char *buf = (char *)malloc(len * 24 + 8);
    int pos = 0;
    pos += sprintf(buf + pos, "[");
    for (int64_t i = 0; i < len; i++) {
        if (i) pos += sprintf(buf + pos, ", ");
        pos += sprintf(buf + pos, "%lld", (long long)l->items[i]);
    }
    sprintf(buf + pos, "]");
    __gc_reg((int64_t)buf, GC_STRING);
    return buf;
}
char *obo_format_map_string(void *m) {
    char *r = (char *)malloc(16);
    strcpy(r, "{...}");
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}
char *obo_format_entity_string(void *e) {
    const char *tn = (const char *)rt_entity_type_name((int64_t)e);
    char *r = (char *)malloc(128);
    snprintf(r, 128, "%s { ... }", tn ? tn : "?");
    __gc_reg((int64_t)r, GC_STRING);
    return r;
}

void *obo_dyn_arith(void *a, void *b, int32_t op) {
    /* Dynamic arithmetic on OboValue* operands.
       op: 0=add, 1=sub, 2=mul, 3=div, 4=mod */
    if (!a || !b) return obo_box_i64(0);
    int64_t ta = *(int64_t *)a;
    int64_t pa = *((int64_t *)a + 1);
    int64_t tb = *(int64_t *)b;
    int64_t pb = *((int64_t *)b + 1);

    /* If either is F64, do float arithmetic */
    if (ta == TAG_F64 || tb == TAG_F64) {
        double da, db;
        if (ta == TAG_F64) memcpy(&da, &pa, 8); else da = (double)pa;
        if (tb == TAG_F64) memcpy(&db, &pb, 8); else db = (double)pb;
        double r;
        switch (op) {
            case 0: r = da + db; break;
            case 1: r = da - db; break;
            case 2: r = da * db; break;
            case 3: r = db != 0.0 ? da / db : 0.0; break;
            case 4: r = db != 0.0 ? fmod(da, db) : 0.0; break;
            default: r = 0.0; break;
        }
        return obo_box_f64(r);
    }
    /* Integer arithmetic */
    int64_t r;
    switch (op) {
        case 0: r = pa + pb; break;
        case 1: r = pa - pb; break;
        case 2: r = pa * pb; break;
        case 3: r = pb != 0 ? pa / pb : 0; break;
        case 4: r = pb != 0 ? pa % pb : 0; break;
        default: r = 0; break;
    }
    return obo_box_i64(r);
}

/* Debug/Trace — no-ops for non-debug builds */
void obo_frame_push(const char *name, int32_t line) { (void)name; (void)line; }
void obo_frame_pop(void) {}
void obo_print_stack_trace(void) {}
void obo_install_signal_handlers(void) {}

/* ═══════════════════════════════════════════════════════════
 *  12. Stubs — tasks, events, channels, atomics, etc.
 * ═══════════════════════════════════════════════════════════ */
void *obo_event_listen(void *a, void *b, void *c) { (void)a; (void)b; (void)c; return NULL; }
void *obo_event_emit(void *a, void *b, void *c)   { (void)a; (void)b; (void)c; return NULL; }
void *obo_task_spawn(void *c)      { (void)c; return NULL; }
void  obo_task_wait(void *t)       { (void)t; }
void  obo_task_wait_all(void)      {}
void *obo_channel_create(void)     { return NULL; }
void  obo_channel_send(void *c, int64_t v) { (void)c; (void)v; }
int64_t obo_channel_receive(void *c) { (void)c; return 0; }
void *obo_atomic_create(int64_t v) { int64_t *a = (int64_t *)malloc(8); *a = v; return (void *)a; }
int64_t obo_atomic_load(void *a)   { return *(int64_t *)a; }
void  obo_atomic_store(void *a, int64_t v) { *(int64_t *)a = v; }
int64_t obo_atomic_add(void *a, int64_t v) { *(int64_t *)a += v; return *(int64_t *)a; }
int64_t obo_atomic_sub(void *a, int64_t v) { *(int64_t *)a -= v; return *(int64_t *)a; }

void *obo_possible_push(void)       { return NULL; }
int64_t obo_possible_pop(void)      { return 0; }
void  obo_throw(const char *msg)    { fprintf(stderr, "obo_throw: %s\n", msg ? msg : "(null)"); exit(1); }
void *obo_possible_get_error(void)  { return NULL; }

void  obo_event_loop_run(void *a, void *b, void *c, int64_t d) { (void)a; (void)b; (void)c; (void)d; }
void  obo_event_loop_stop(void) {}

void  obo_arena_register(void *a) { (void)a; }
void  obo_arena_free_all(void) {}
void *obo_arena_create(int64_t sz) { return malloc(sz); }
int64_t obo_arena_alloc(void *a, int64_t sz) { (void)a; return (int64_t)malloc(sz); }
int64_t obo_arena_reset(void *a) { (void)a; return 0; }
int64_t obo_arena_destroy(void *a) { free(a); return 0; }
int64_t obo_arena_used(void *a) { (void)a; return 0; }
int64_t obo_arena_capacity(void *a) { (void)a; return 0; }
int64_t obo_arena_write_i64(int64_t addr, int64_t v) { *(int64_t *)addr = v; return addr + 8; }
int64_t obo_arena_write_f64(int64_t addr, double v) { *(double *)addr = v; return addr + 8; }
int64_t obo_arena_read_i64(int64_t addr) { return *(int64_t *)addr; }
double  obo_arena_read_f64(int64_t addr) { return *(double *)addr; }

/* Sets, queues, stacks, buffers, grids — stubs */
void *obo_set_new(void *from)         { (void)from; return obo_map_new(); }
void *obo_set_add(void *s, int64_t v) { (void)s; (void)v; return s; }
void *obo_set_remove(void *s, int64_t v) { (void)v; return s; }
int64_t obo_set_has(void *s, int64_t v) { (void)s; (void)v; return 0; }
void *obo_set_union(void *a, void *b)     { (void)b; return a; }
void *obo_set_intersect(void *a, void *b) { (void)b; return a; }
void *obo_set_difference(void *a, void *b) { (void)b; return a; }
void *obo_queue_push(void *q, int64_t v) { (void)q; (void)v; return q; }
int64_t obo_queue_peek(void *q)          { (void)q; return 0; }
void *obo_queue_pop(void *q)             { return q; }
void *obo_stack_push(void *s, int64_t v) { (void)s; (void)v; return s; }
int64_t obo_stack_peek(void *s)          { (void)s; return 0; }
void *obo_stack_pop(void *s)             { return s; }
void *obo_buffer_new(int64_t sz) { return calloc(1, sz * 8 + 16); }
int64_t obo_buffer_length(void *b) { return b ? *(int64_t *)b : 0; }
int64_t obo_buffer_get(void *b, int64_t i) { return *((int64_t *)b + 2 + i); }
void *obo_buffer_set(void *b, int64_t i, int64_t v) { *((int64_t *)b + 2 + i) = v; return b; }
void *obo_buffer_toList(void *b) { (void)b; return (void *)rt_list_new(0); }
void *obo_textbuilder_new(int64_t cap) { (void)cap; return calloc(1, 1); }
void *obo_textbuilder_append(void *tb, const char *s) { (void)tb; (void)s; return tb; }
void *obo_textbuilder_appendChar(void *tb, int64_t c) { (void)tb; (void)c; return tb; }
void *obo_textbuilder_appendInt(void *tb, int64_t n) { (void)tb; (void)n; return tb; }
char *obo_textbuilder_build(void *tb) { (void)tb; return (char *)calloc(1, 1); }
int64_t obo_textbuilder_length(void *tb) { (void)tb; return 0; }
void *obo_textbuilder_clear(void *tb) { return tb; }
char *obo_textbuilder_toString(void *tb) { return obo_textbuilder_build(tb); }
void *obo_grid2d_new(int64_t r, int64_t c, int64_t v) { (void)v; return calloc(1, (r * c + 4) * 8); }
int64_t obo_grid2d_rows(void *g) { (void)g; return 0; }
int64_t obo_grid2d_cols(void *g) { (void)g; return 0; }
int64_t obo_grid2d_count(void *g) { (void)g; return 0; }
int64_t obo_grid2d_get(void *g, int64_t r, int64_t c) { (void)g; (void)r; (void)c; return 0; }
void *obo_grid2d_set(void *g, int64_t r, int64_t c, int64_t v) { (void)r; (void)c; (void)v; return g; }
void *obo_grid2d_fill(void *g, int64_t v) { (void)v; return g; }
void *obo_grid2d_row(void *g, int64_t r) { (void)g; (void)r; return (void *)rt_list_new(0); }
void *obo_grid2d_col(void *g, int64_t c) { (void)g; (void)c; return (void *)rt_list_new(0); }
void *obo_grid2d_toList(void *g) { (void)g; return (void *)rt_list_new(0); }
void *obo_grid3d_new(int64_t x, int64_t y, int64_t z, int64_t v) { (void)v; return calloc(1, (x * y * z + 8) * 8); }
int64_t obo_grid3d_x(void *g) { (void)g; return 0; }
int64_t obo_grid3d_y(void *g) { (void)g; return 0; }
int64_t obo_grid3d_z(void *g) { (void)g; return 0; }
int64_t obo_grid3d_count(void *g) { (void)g; return 0; }
int64_t obo_grid3d_get(void *g, int64_t x, int64_t y, int64_t z) { (void)g; (void)x; (void)y; (void)z; return 0; }
void *obo_grid3d_set(void *g, int64_t x, int64_t y, int64_t z, int64_t v) { (void)x; (void)y; (void)z; (void)v; return g; }
void *obo_grid3d_fill(void *g, int64_t v) { (void)v; return g; }
void *obo_grid3d_toList(void *g) { (void)g; return (void *)rt_list_new(0); }

/* ═══════════════════════════════════════════════════════════
 *  Dispatch — generated per-compile, appended after this.
 * ═══════════════════════════════════════════════════════════ */
/* obo_entity_type_name: needed by dispatch */
const char *obo_entity_type_name(void *e) {
    return (const char *)rt_entity_type_name((int64_t)e);
}

/* --- generated native method dispatch is appended by 'obo build' --- */
