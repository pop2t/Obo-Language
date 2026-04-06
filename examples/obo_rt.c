/* OBO native runtime — strings, lists, maps, entities, tagged values, stdlib hooks. */
#include <math.h>
#include <pthread.h>
#include <setjmp.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <time.h>

void obo_list_print(void* p);
void obo_map_print(void* mp);
void obo_entity_print(void* ep);

void obo_arena_register(void* ptr);
/* GC kinds — set at allocation sites for transitive marking */
#define OBO_GC_STRING 0
#define OBO_GC_LIST_I64 1
#define OBO_GC_MAP 2
#define OBO_GC_ENTITY 3
#define OBO_GC_MIXED_LIST 4
#define OBO_GC_CLOSURE 5
#define OBO_GC_VALUE 6
#define OBO_GC_TASK 7
#define OBO_GC_OPAQUE 8
typedef struct GCNode GCNode;
static void obo_gc_register_impl(void* ptr, int kind);
static char* obo_gc_track_string(char* s);
static GCNode* gc_find_node(void* ptr);

char* obo_str_concat(const char* a, const char* b) {
    size_t la = strlen(a);
    size_t lb = strlen(b);
    char* out = (char*)malloc(la + lb + 1);
    if (!out) {
        return NULL;
    }
    memcpy(out, a, la);
    memcpy(out + la, b, lb + 1);
    obo_gc_register_impl(out, OBO_GC_STRING);
    return out;
}

/* Truthiness for native `and` / `or` (matches interpreter: non-empty text is true). */
int64_t obo_str_truthy(const char* s) {
    return (s && s[0]) ? 1 : 0;
}

void obo_print_bool(int64_t v) {
    printf("%s\n", v ? "true" : "false");
}

/* Print message (no newline), read a line from stdin, return trimmed string. */
char* obo_prompt(const char* message) {
    if (message) {
        printf("%s", message);
        fflush(stdout);
    }
    char buf[4096];
    if (!fgets(buf, sizeof(buf), stdin)) {
        char *empty = malloc(1);
        empty[0] = '\0';
        return empty;
    }
    /* Trim trailing newline/carriage-return */
    size_t len = strlen(buf);
    while (len > 0 && (buf[len-1] == '\n' || buf[len-1] == '\r')) {
        buf[--len] = '\0';
    }
    return strdup(buf);
}

/* Indirect i64(...i64) calls: fn is a native code pointer (intptr_t), argv length == argc. */
int64_t obo_call_indirect_i64(void* fn, int64_t argc, int64_t* argv) {
    int n = (int)argc;
    if (!fn) {
        return 0;
    }
    switch (n) {
        case 0: {
            typedef int64_t (*F0)(void);
            return ((F0)fn)();
        }
        case 1: {
            typedef int64_t (*F1)(int64_t);
            return ((F1)fn)(argv[0]);
        }
        case 2: {
            typedef int64_t (*F2)(int64_t, int64_t);
            return ((F2)fn)(argv[0], argv[1]);
        }
        case 3: {
            typedef int64_t (*F3)(int64_t, int64_t, int64_t);
            return ((F3)fn)(argv[0], argv[1], argv[2]);
        }
        case 4: {
            typedef int64_t (*F4)(int64_t, int64_t, int64_t, int64_t);
            return ((F4)fn)(argv[0], argv[1], argv[2], argv[3]);
        }
        case 5: {
            typedef int64_t (*F5)(int64_t, int64_t, int64_t, int64_t, int64_t);
            return ((F5)fn)(argv[0], argv[1], argv[2], argv[3], argv[4]);
        }
        case 6: {
            typedef int64_t (*F6)(int64_t, int64_t, int64_t, int64_t, int64_t, int64_t);
            return ((F6)fn)(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
        }
        case 7: {
            typedef int64_t (*F7)(int64_t, int64_t, int64_t, int64_t, int64_t, int64_t, int64_t);
            return ((F7)fn)(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6]);
        }
        case 8: {
            typedef int64_t (*F8)(int64_t, int64_t, int64_t, int64_t, int64_t, int64_t, int64_t,
                                  int64_t);
            return ((F8)fn)(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5], argv[6], argv[7]);
        }
        default:
            return 0;
    }
}

char* obo_i64_to_str(long long n) {
    char buf[32];
    int len = snprintf(buf, sizeof(buf), "%lld", n);
    if (len < 0 || len >= (int)sizeof(buf)) {
        return NULL;
    }
    char* out = (char*)malloc((size_t)len + 1);
    if (!out) {
        return NULL;
    }
    memcpy(out, buf, (size_t)len + 1);
    return obo_gc_track_string(out);
}

/* --- Tagged value (heap; opaque i8* in LLVM) --- */
typedef enum {
    OBO_V_I64 = 0,
    OBO_V_STR = 1,
    OBO_V_LIST = 2,
    OBO_V_MAP = 3,
    OBO_V_ENTITY = 4,
    OBO_V_F64 = 5,
    OBO_V_BOOL = 6,
    OBO_V_NULL = 7,
} OboVTag;

typedef struct OboValue {
    OboVTag tag;
    union {
        int64_t i64;
        double f64;
        char* str;
        void* ptr;
    } u;
} OboValue;

typedef struct OboTask {
    void* closure;
    pthread_t thread;
    uint8_t joined;
    struct OboTask* next_pending;
} OboTask;

static OboTask* __obo_pending_tasks = NULL;

static char* obo_format_boxed_string(const OboValue* value);
char* obo_format_list_string(void* list_ptr);
char* obo_format_map_string(void* map_ptr);
char* obo_format_entity_string(void* entity_ptr);
static void obo_print_owned_line(char* text);

static char* obo_gc_track_string(char* s) {
    if (!s) return NULL;
    obo_gc_register_impl(s, OBO_GC_STRING);
    return s;
}
static OboValue* obo_alloc_value(void) {
    OboValue* v = (OboValue*)malloc(sizeof(OboValue));
    if (!v) {
        return NULL;
    }
    obo_gc_register_impl(v, OBO_GC_VALUE);
    return v;
}

static OboValue* obo_value_clone(const OboValue* v) {
    OboValue* c = obo_alloc_value();
    if (!c) {
        return NULL;
    }
    *c = *v;
    if (v->tag == OBO_V_STR && v->u.str) {
        c->u.str = strdup(v->u.str);
    }
    return c;
}

void obo_value_free(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) {
        return;
    }
    if (v->tag == OBO_V_STR && v->u.str) {
        free(v->u.str);
    }
    /* list/map/entity owned elsewhere; shallow free of shell only */
    free(v);
}

void obo_value_print(void* p) {
    OboValue* v = (OboValue*)p;
    obo_print_owned_line(obo_format_boxed_string(v));
}

int64_t obo_value_as_i64(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) return 0;
    switch (v->tag) {
        case OBO_V_I64:
        case OBO_V_BOOL:
            return v->u.i64;
        case OBO_V_F64:
            return (int64_t)v->u.f64;
        case OBO_V_NULL:
            return 0;
        default:
            return 0;
    }
}

void* obo_value_as_entity_ptr(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v || v->tag != OBO_V_ENTITY) {
        return NULL;
    }
    return v->u.ptr;
}

void* obo_box_i64(int64_t n) {
    OboValue* v = obo_alloc_value();
    if (!v) {
        return NULL;
    }
    v->tag = OBO_V_I64;
    v->u.i64 = n;
    return v;
}

void* obo_box_str(const char* s) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_STR;
    v->u.str = s ? strdup(s) : NULL;
    return v;
}

void* obo_box_f64(double d) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_F64;
    v->u.f64 = d;
    return v;
}

void* obo_box_bool(int64_t b) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_BOOL;
    v->u.i64 = b ? 1 : 0;
    return v;
}

void* obo_box_null(void) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_NULL;
    v->u.i64 = 0;
    return v;
}

void* obo_box_list(void* list) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_LIST;
    v->u.ptr = list;
    return v;
}

void* obo_box_map(void* map) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_MAP;
    v->u.ptr = map;
    return v;
}

void* obo_box_entity(void* entity) {
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    v->tag = OBO_V_ENTITY;
    v->u.ptr = entity;
    return v;
}

static int obo_value_is_numeric(const OboValue* v) {
    if (!v) return 0;
    return v->tag == OBO_V_I64 || v->tag == OBO_V_BOOL || v->tag == OBO_V_F64;
}

int64_t obo_value_compare(void* lhs_ptr, void* rhs_ptr) {
    static const OboValue null_value = { .tag = OBO_V_NULL, .u = { .i64 = 0 } };
    const OboValue* lhs = lhs_ptr ? (const OboValue*)lhs_ptr : &null_value;
    const OboValue* rhs = rhs_ptr ? (const OboValue*)rhs_ptr : &null_value;

    if (lhs->tag == OBO_V_NULL && rhs->tag == OBO_V_NULL) {
        return 0;
    }
    if (obo_value_is_numeric(lhs) && obo_value_is_numeric(rhs)) {
        if (lhs->tag == OBO_V_F64 || rhs->tag == OBO_V_F64) {
            double a = lhs->tag == OBO_V_F64 ? lhs->u.f64 : (double)lhs->u.i64;
            double b = rhs->tag == OBO_V_F64 ? rhs->u.f64 : (double)rhs->u.i64;
            if (a < b) return -1;
            if (a > b) return 1;
            return 0;
        }
        if (lhs->u.i64 < rhs->u.i64) return -1;
        if (lhs->u.i64 > rhs->u.i64) return 1;
        return 0;
    }
    if (lhs->tag == OBO_V_STR && rhs->tag == OBO_V_STR) {
        const char* a = lhs->u.str ? lhs->u.str : "";
        const char* b = rhs->u.str ? rhs->u.str : "";
        int cmp = strcmp(a, b);
        if (cmp < 0) return -1;
        if (cmp > 0) return 1;
        return 0;
    }
    if (lhs->tag == rhs->tag) {
        switch (lhs->tag) {
            case OBO_V_NULL:
                return 0;
            case OBO_V_LIST:
            case OBO_V_MAP:
            case OBO_V_ENTITY:
                if (lhs->u.ptr < rhs->u.ptr) return -1;
                if (lhs->u.ptr > rhs->u.ptr) return 1;
                return 0;
            default:
                break;
        }
    }
    if (lhs->tag < rhs->tag) return -1;
    if (lhs->tag > rhs->tag) return 1;
    return 0;
}

double obo_value_as_f64(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) return 0.0;
    if (v->tag == OBO_V_F64) return v->u.f64;
    if (v->tag == OBO_V_I64) return (double)v->u.i64;
    if (v->tag == OBO_V_BOOL) return v->u.i64 ? 1.0 : 0.0;
    return 0.0;
}

const char* obo_value_as_str(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v || v->tag != OBO_V_STR) return "";
    return v->u.str ? v->u.str : "";
}

/* --- Mixed list (OboValue elements) --- */
typedef struct {
    int64_t len;
    int64_t cap;
    OboValue items[];
} OboMixedList;

void* obo_mixed_list_new(int64_t len) {
    OboMixedList* l = (OboMixedList*)malloc(sizeof(OboMixedList) + (size_t)len * sizeof(OboValue));
    if (!l) return NULL;
    l->len = len;
    l->cap = len;
    memset(l->items, 0, (size_t)len * sizeof(OboValue));
    obo_gc_register_impl(l, OBO_GC_MIXED_LIST);
    return l;
}

void obo_mixed_list_set(void* lp, int64_t idx, void* val_ptr) {
    OboMixedList* l = (OboMixedList*)lp;
    if (idx >= 0 && idx < l->len && val_ptr) {
        l->items[idx] = *(OboValue*)val_ptr;
        /* Own a separate copy of the string so the list and the
           source boxed value can be freed independently. */
        if (l->items[idx].tag == OBO_V_STR && l->items[idx].u.str) {
            l->items[idx].u.str = strdup(l->items[idx].u.str);
        }
    }
}

void* obo_mixed_list_get(void* lp, int64_t idx) {
    OboMixedList* l = (OboMixedList*)lp;
    if (!l || idx < 0 || idx >= l->len) return NULL;
    OboValue* v = obo_alloc_value();
    if (!v) return NULL;
    *v = l->items[idx];
    if (v->tag == OBO_V_STR && v->u.str) v->u.str = strdup(v->u.str);
    return v;
}

int64_t obo_mixed_list_len(void* lp) {
    OboMixedList* l = (OboMixedList*)lp;
    return l ? l->len : 0;
}

void obo_mixed_list_print(void* lp) {
    obo_print_owned_line(obo_format_list_string(lp));
}

/* Forward declare closure type for mixed-list higher-order functions */
typedef int64_t (*obo_ml_closure_fn)(void*, int64_t);

static int64_t obo_value_to_closure_arg(const OboValue* value) {
    if (!value) {
        return 0;
    }
    switch (value->tag) {
        case OBO_V_I64:
        case OBO_V_BOOL:
            return value->u.i64;
        case OBO_V_STR:
            return (int64_t)(uintptr_t)(value->u.str ? value->u.str : "");
        case OBO_V_LIST:
        case OBO_V_MAP:
        case OBO_V_ENTITY:
            return (int64_t)(uintptr_t)value->u.ptr;
        case OBO_V_F64: {
            union {
                double f;
                int64_t i;
            } bits;
            bits.f = value->u.f64;
            return bits.i;
        }
        case OBO_V_NULL:
        default:
            return 0;
    }
}

int64_t obo_value_to_closure_arg_boxed(void* boxed) {
    return obo_value_to_closure_arg((const OboValue*)boxed);
}

void* obo_mixed_list_filter(void* lp, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return obo_mixed_list_new(0);
    obo_ml_closure_fn fn = (obo_ml_closure_fn)(((void**)cp)[0]);
    /* Count matches */
    int64_t count = 0;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, obo_value_to_closure_arg(&list->items[i])) != 0) count++;
    }
    OboMixedList* result = (OboMixedList*)obo_mixed_list_new(count);
    int64_t j = 0;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, obo_value_to_closure_arg(&list->items[i])) != 0) {
            result->items[j] = list->items[i];
            if (result->items[j].tag == OBO_V_STR && result->items[j].u.str)
                result->items[j].u.str = strdup(result->items[j].u.str);
            j++;
        }
    }
    return result;
}

void* obo_mixed_list_map(void* lp, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return obo_mixed_list_new(0);
    obo_ml_closure_fn fn = (obo_ml_closure_fn)(((void**)cp)[0]);
    OboMixedList* result = (OboMixedList*)obo_mixed_list_new(list->len);
    for (int64_t i = 0; i < list->len; i++) {
        int64_t rv = fn(cp, obo_value_to_closure_arg(&list->items[i]));
        OboValue* rbox = obo_alloc_value();
        rbox->tag = OBO_V_I64;
        rbox->u.i64 = rv;
        result->items[i] = *rbox;
    }
    return result;
}

void obo_mixed_list_each(void* lp, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return;
    obo_ml_closure_fn fn = (obo_ml_closure_fn)(((void**)cp)[0]);
    for (int64_t i = 0; i < list->len; i++) {
        fn(cp, obo_value_to_closure_arg(&list->items[i]));
    }
}

void* obo_mixed_list_add(void* lp, void* val_ptr) {
    OboMixedList* list = (OboMixedList*)lp;
    int64_t old_len = list ? list->len : 0;
    int64_t new_len = old_len + 1;
    int64_t new_cap = new_len < 8 ? 8 : new_len * 2;
    OboMixedList* result = (OboMixedList*)malloc(sizeof(OboMixedList) + (size_t)new_cap * sizeof(OboValue));
    if (!result) return lp;
    result->len = new_len;
    result->cap = new_cap;
    if (list && old_len > 0) {
        memcpy(result->items, list->items, (size_t)old_len * sizeof(OboValue));
        for (int64_t i = 0; i < old_len; i++) {
            if (result->items[i].tag == OBO_V_STR && result->items[i].u.str) {
                result->items[i].u.str = strdup(result->items[i].u.str);
            }
        }
    }
    OboValue* boxed = (OboValue*)val_ptr;
    if (boxed) {
        result->items[old_len] = *boxed;
        if (result->items[old_len].tag == OBO_V_STR && result->items[old_len].u.str) {
            result->items[old_len].u.str = strdup(result->items[old_len].u.str);
        }
    } else {
        result->items[old_len].tag = OBO_V_NULL;
        result->items[old_len].u.i64 = 0;
    }
    memset(result->items + new_len, 0, (size_t)(new_cap - new_len) * sizeof(OboValue));
    obo_gc_register_impl(result, OBO_GC_MIXED_LIST);
    return result;
}

void* obo_mixed_list_removeAt(void* lp, int64_t idx) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || idx < 0 || idx >= list->len) return lp;
    int64_t new_len = list->len - 1;
    int64_t alloc_len = new_len < 1 ? 1 : new_len;
    OboMixedList* result = (OboMixedList*)malloc(sizeof(OboMixedList) + (size_t)alloc_len * sizeof(OboValue));
    if (!result) return lp;
    result->len = new_len;
    result->cap = alloc_len;
    if (idx > 0) memcpy(result->items, list->items, (size_t)idx * sizeof(OboValue));
    if (idx < list->len - 1) memcpy(result->items + idx, list->items + idx + 1, (size_t)(list->len - idx - 1) * sizeof(OboValue));
    for (int64_t i = 0; i < new_len; i++) {
        if (result->items[i].tag == OBO_V_STR && result->items[i].u.str) {
            result->items[i].u.str = strdup(result->items[i].u.str);
        }
    }
    obo_gc_register_impl(result, OBO_GC_MIXED_LIST);
    return result;
}

void* obo_mixed_list_join(void* lp, const char* sep) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || list->len == 0) return obo_gc_track_string(strdup(""));
    if (!sep) sep = ", ";
    size_t slen = strlen(sep);
    size_t cap = 256;
    char* out = (char*)malloc(cap);
    size_t oi = 0;
    for (int64_t i = 0; i < list->len; i++) {
        if (i > 0) {
            if (oi + slen >= cap) { cap = (oi + slen) * 2 + 1; out = (char*)realloc(out, cap); }
            memcpy(out + oi, sep, slen);
            oi += slen;
        }
        const char* s = "";
        OboValue* v = &list->items[i];
        if (v->tag == OBO_V_STR) {
            s = v->u.str ? v->u.str : "";
        } else if (v->tag == OBO_V_I64) {
            char buf[32]; snprintf(buf, sizeof(buf), "%lld", (long long)v->u.i64);
            s = obo_gc_track_string(strdup(buf));
        } else if (v->tag == OBO_V_F64) {
            char buf[64]; snprintf(buf, sizeof(buf), "%g", v->u.f64);
            s = obo_gc_track_string(strdup(buf));
        } else if (v->tag == OBO_V_BOOL) {
            s = v->u.i64 ? "true" : "false";
        } else if (v->tag == OBO_V_NULL) {
            s = "null";
        }
        size_t n = strlen(s);
        if (oi + n >= cap) { cap = (oi + n) * 2 + 1; out = (char*)realloc(out, cap); }
        memcpy(out + oi, s, n);
        oi += n;
    }
    out[oi] = 0;
    return obo_gc_track_string(out);
}

int64_t obo_mixed_list_contains(void* lp, void* val_ptr) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !val_ptr) return 0;
    OboValue* target = (OboValue*)val_ptr;
    for (int64_t i = 0; i < list->len; i++) {
        OboValue* item = &list->items[i];
        if (item->tag == target->tag) {
            if (item->tag == OBO_V_I64 && item->u.i64 == target->u.i64) return 1;
            if (item->tag == OBO_V_F64 && item->u.f64 == target->u.f64) return 1;
            if (item->tag == OBO_V_STR && item->u.str && target->u.str && strcmp(item->u.str, target->u.str) == 0) return 1;
            if (item->tag == OBO_V_BOOL && item->u.i64 == target->u.i64) return 1;
            if (item->tag == OBO_V_NULL) return 1;
        }
    }
    return 0;
}

void* obo_mixed_list_reduce(void* lp, void* init_ptr, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return init_ptr;
    typedef int64_t (*reduce_fn)(void*, int64_t, int64_t);
    reduce_fn fn = (reduce_fn)(((void**)cp)[0]);
    int64_t acc = (int64_t)(uintptr_t)init_ptr;
    for (int64_t i = 0; i < list->len; i++) {
        acc = fn(cp, acc, obo_value_to_closure_arg(&list->items[i]));
    }
    return (void*)(uintptr_t)acc;
}

int64_t obo_mixed_list_any(void* lp, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return 0;
    obo_ml_closure_fn fn = (obo_ml_closure_fn)(((void**)cp)[0]);
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, obo_value_to_closure_arg(&list->items[i]))) return 1;
    }
    return 0;
}

int64_t obo_mixed_list_all(void* lp, void* cp) {
    OboMixedList* list = (OboMixedList*)lp;
    if (!list || !cp) return 1;
    obo_ml_closure_fn fn = (obo_ml_closure_fn)(((void**)cp)[0]);
    for (int64_t i = 0; i < list->len; i++) {
        if (!fn(cp, obo_value_to_closure_arg(&list->items[i]))) return 0;
    }
    return 1;
}

/* --- List (i64 elements; opaque pointer) --- */
typedef struct {
    int64_t len;
    int64_t cap;
    int64_t items[];
} OboList;

static OboList* obo_alloc_list(int64_t len) {
    if (len < 0) {
        return NULL;
    }
    OboList* list = (OboList*)malloc(sizeof(OboList) + (size_t)len * sizeof(int64_t));
    if (!list) {
        return NULL;
    }
    list->len = len;
    list->cap = len;
    obo_gc_register_impl(list, OBO_GC_LIST_I64);
    return list;
}

void* obo_list_new_i64(int64_t len, int64_t* data) {
    if (len < 0) {
        return NULL;
    }
    size_t n = (size_t)len;
    OboList* p = obo_alloc_list(len);
    if (!p) {
        return NULL;
    }
    if (n > 0 && data) {
        memcpy(p->items, data, n * sizeof(int64_t));
    }
    return p;
}

int64_t obo_list_len(void* p) {
    if (!p) {
        return 0;
    }
    return ((OboList*)p)->len;
}

int64_t obo_list_get(void* p, int64_t i) {
    OboList* L = (OboList*)p;
    if (!L || i < 0 || i >= L->len) {
        return 0;
    }
    return L->items[i];
}

void obo_list_set_i64(void* p, int64_t i, int64_t val) {
    OboList* L = (OboList*)p;
    if (!L || i < 0 || i >= L->len) {
        return;
    }
    L->items[i] = val;
}

void obo_list_print(void* p) {
    obo_print_owned_line(obo_format_list_string(p));
}

/* --- Map: open hash / linear probing simplified: linked bucket list --- */
typedef struct MapEntry {
    char* key;
    OboValue val;
    struct MapEntry* next;        /* hash-bucket chain */
    struct MapEntry* order_next;  /* insertion-order doubly-linked list */
    struct MapEntry* order_prev;
} MapEntry;

typedef struct {
    MapEntry* buckets[64];
    int64_t count;
    MapEntry* order_head;  /* first inserted */
    MapEntry* order_tail;  /* last inserted */
} OboMap;

static uint32_t map_hash(const char* k) {
    uint32_t h = 5381;
    while (*k) {
        h = ((h << 5) + h) + (unsigned char)*k++;
    }
    return h % 64;
}

static OboMap* obo_map_alloc_empty(void) {
    OboMap* m = (OboMap*)calloc(1, sizeof(OboMap));
    if (m) {
        m->count = 0;
        m->order_head = NULL;
        m->order_tail = NULL;
    }
    return m;
}

void* obo_map_new(void) {
    OboMap* m = obo_map_alloc_empty();
    if (m) {
        obo_gc_register_impl(m, OBO_GC_MAP);
    }
    return m;
}

int64_t obo_map_len(void* mp) {
    OboMap* m = (OboMap*)mp;
    return m ? m->count : 0;
}

static void map_insert(OboMap* m, const char* key, OboValue val) {
    uint32_t i = map_hash(key);
    MapEntry* e = m->buckets[i];
    while (e) {
        if (strcmp(e->key, key) == 0) {
            if (e->val.tag == OBO_V_STR && e->val.u.str) {
                free(e->val.u.str);
            }
            e->val = val;
            return;
        }
        e = e->next;
    }
    e = (MapEntry*)malloc(sizeof(MapEntry));
    e->key = strdup(key);
    e->val = val;
    e->next = m->buckets[i];
    m->buckets[i] = e;
    /* Append to insertion-order list */
    e->order_prev = m->order_tail;
    e->order_next = NULL;
    if (m->order_tail) {
        m->order_tail->order_next = e;
    } else {
        m->order_head = e;
    }
    m->order_tail = e;
    m->count += 1;
}

void obo_map_put_i64(void* mp, const char* key, int64_t v) {
    OboValue val;
    val.tag = OBO_V_I64;
    val.u.i64 = v;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_str(void* mp, const char* key, const char* s) {
    OboValue val;
    val.tag = OBO_V_STR;
    val.u.str = s ? strdup(s) : NULL;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_f64(void* mp, const char* key, double v) {
    OboValue val;
    val.tag = OBO_V_F64;
    val.u.f64 = v;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_bool(void* mp, const char* key, int64_t v) {
    OboValue val;
    val.tag = OBO_V_BOOL;
    val.u.i64 = v ? 1 : 0;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_null(void* mp, const char* key) {
    OboValue val;
    val.tag = OBO_V_NULL;
    val.u.i64 = 0;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_list(void* mp, const char* key, void* list) {
    OboValue val;
    val.tag = OBO_V_LIST;
    val.u.ptr = list;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_map(void* mp, const char* key, void* sub) {
    OboValue val;
    val.tag = OBO_V_MAP;
    val.u.ptr = sub;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_entity(void* mp, const char* key, void* ent) {
    OboValue val;
    val.tag = OBO_V_ENTITY;
    val.u.ptr = ent;
    map_insert((OboMap*)mp, key, val);
}

void obo_map_put_boxed(void* mp, const char* key, void* boxed) {
    OboValue* value = (OboValue*)boxed;
    if (!value) {
        obo_map_put_null(mp, key);
        return;
    }
    OboValue copy = *value;
    if (copy.tag == OBO_V_STR && copy.u.str) {
        copy.u.str = strdup(copy.u.str);
    }
    map_insert((OboMap*)mp, key, copy);
}

void* obo_map_get_boxed(void* mp, const char* key) {
    OboMap* m = (OboMap*)mp;
    if (!m || !key) {
        return NULL;
    }
    uint32_t i = map_hash(key);
    for (MapEntry* e = m->buckets[i]; e; e = e->next) {
        if (strcmp(e->key, key) == 0) {
            return obo_value_clone(&e->val);
        }
    }
    return obo_box_i64(0);
}

void obo_map_print(void* mp) {
    obo_print_owned_line(obo_format_map_string(mp));
}

void* obo_map_keys(void* mp) {
    OboMap* m = (OboMap*)mp;
    if (!m) return obo_mixed_list_new(0);
    int64_t n = m->count;
    void* list = obo_mixed_list_new(n);
    int64_t i = 0;
    for (MapEntry* e = m->order_head; e && i < n; e = e->order_next, i++) {
        void* key_boxed = obo_box_str(strdup(e->key));
        obo_mixed_list_set(list, i, key_boxed);
    }
    return list;
}

/* --- Entity --- */
typedef struct {
    char* type_name;
    OboMap* fields;
} OboEntity;

void* obo_value_keys(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) return obo_box_list(obo_mixed_list_new(0));
    if (v->tag == OBO_V_MAP) {
        return obo_box_list(obo_map_keys(v->u.ptr));
    }
    if (v->tag == OBO_V_ENTITY) {
        OboEntity* e = (OboEntity*)v->u.ptr;
        if (e && e->fields) return obo_box_list(obo_map_keys(e->fields));
    }
    return obo_box_list(obo_mixed_list_new(0));
}

const char* obo_entity_type_name(void* ep) {
    OboEntity* e = (OboEntity*)ep;
    if (!e) {
        return "";
    }
    return e->type_name ? e->type_name : "";
}

void* obo_entity_new(const char* type_name) {
    OboEntity* e = (OboEntity*)malloc(sizeof(OboEntity));
    if (!e) {
        return NULL;
    }
    e->type_name = type_name ? strdup(type_name) : NULL;
    /* Field map is owned by the entity — not a separate GC object (avoids double-free). */
    e->fields = obo_map_alloc_empty();
    obo_gc_register_impl(e, OBO_GC_ENTITY);
    return e;
}

void obo_entity_put_i64(void* ep, const char* field, int64_t v) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_i64(e->fields, field, v);
}

void obo_entity_put_str(void* ep, const char* field, const char* s) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_str(e->fields, field, s);
}

void obo_entity_put_f64(void* ep, const char* field, double v) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_f64(e->fields, field, v);
}

void obo_entity_put_bool(void* ep, const char* field, int64_t v) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_bool(e->fields, field, v);
}

void obo_entity_put_null(void* ep, const char* field) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_null(e->fields, field);
}

void obo_entity_put_list(void* ep, const char* field, void* list) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_list(e->fields, field, list);
}

void obo_entity_put_map(void* ep, const char* field, void* map) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_map(e->fields, field, map);
}

void obo_entity_put_entity(void* ep, const char* field, void* entity) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_entity(e->fields, field, entity);
}

void obo_entity_put_boxed(void* ep, const char* field, void* boxed) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return;
    }
    obo_map_put_boxed(e->fields, field, boxed);
}

void* obo_entity_get_boxed(void* ep, const char* field) {
    OboEntity* e = (OboEntity*)ep;
    if (!e || !e->fields) {
        return obo_box_i64(0);
    }
    return obo_map_get_boxed(e->fields, field);
}

void obo_entity_print(void* ep) {
    obo_print_owned_line(obo_format_entity_string(ep));
}

/* --- Printing / conversion helpers for double --- */
void obo_print_double(double v) {
    if (v == (int64_t)v && fabs(v) < 1e15) {
        printf("%.1f\n", v);
    } else {
        printf("%.15g\n", v);
    }
}

char* obo_f64_to_str(double v) {
    char buf[64];
    if (v == (int64_t)v && fabs(v) < 1e15) {
        snprintf(buf, sizeof(buf), "%.1f", v);
    } else {
        snprintf(buf, sizeof(buf), "%.15g", v);
    }
    return obo_gc_track_string(strdup(buf));
}

int64_t obo_value_truthy(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) return 0;
    switch (v->tag) {
        case OBO_V_I64:
            return v->u.i64 != 0;
        case OBO_V_F64:
            return v->u.f64 != 0.0;
        case OBO_V_STR:
            return v->u.str && v->u.str[0] != '\0';
        case OBO_V_BOOL:
            return v->u.i64 ? 1 : 0;
        case OBO_V_NULL:
            return 0;
        case OBO_V_LIST: {
            OboList* list = (OboList*)v->u.ptr;
            return (list && list->len != 0) ? 1 : 0;
        }
        case OBO_V_MAP:
        case OBO_V_ENTITY:
            return v->u.ptr ? 1 : 0;
        default:
            return 0;
    }
}

void* obo_value_as_list_ptr(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v || v->tag != OBO_V_LIST) {
        return NULL;
    }
    return v->u.ptr;
}

void* obo_value_as_map_ptr(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v || v->tag != OBO_V_MAP) {
        return NULL;
    }
    return v->u.ptr;
}

char* obo_value_to_str(void* p) {
    OboValue* v = (OboValue*)p;
    char* text = obo_format_boxed_string(v);
    if (!text) {
        return obo_gc_track_string(strdup("?"));
    }
    return obo_gc_track_string(text);
}

/* --- Math (native stubs; match interpreter semantics) --- */
int64_t __sys_Math_abs(int64_t n) { return n < 0 ? -n : n; }

int64_t __sys_Math_floor(double n) { return (int64_t)floor(n); }

int64_t __sys_Math_ceil(double n) { return (int64_t)ceil(n); }

int64_t __sys_Math_round(double n) { return (int64_t)round(n); }

double __sys_Math_sqrt(double n) { return sqrt(fabs(n)); }

int64_t __sys_Math_min(int64_t a, int64_t b) { return a < b ? a : b; }

int64_t __sys_Math_max(int64_t a, int64_t b) { return a > b ? a : b; }

int64_t __sys_Math_sign(int64_t n) { return (n > 0) - (n < 0); }

double __sys_Math_pi(void) { return 3.14159265358979323846; }

double __sys_Math_e(void) { return 2.71828182845904523536; }

double __sys_Math_infinity(void) { return 1.0 / 0.0; }

int64_t __sys_Math_maxNumber(void) { return INT64_MAX; }

int64_t __sys_Math_minNumber(void) { return INT64_MIN; }

double __sys_Math_pow(double base, double exp) { return pow(base, exp); }

double __sys_Math_sin(double n) { return sin(n); }

double __sys_Math_cos(double n) { return cos(n); }

double __sys_Math_tan(double n) { return tan(n); }

double __sys_Math_asin(double n) { return asin(n); }

double __sys_Math_acos(double n) { return acos(n); }

double __sys_Math_atan(double n) { return atan(n); }

double __sys_Math_atan2(double y, double x) { return atan2(y, x); }

double __sys_Math_log(double n) { return log(n); }

double __sys_Math_log10(double n) { return log10(n); }

double __sys_Math_clamp(double v, double lo, double hi) {
    return v < lo ? lo : (v > hi ? hi : v);
}

double __sys_Math_random(void) {
    static int seeded = 0;
    if (!seeded) { srand((unsigned)time(NULL)); seeded = 1; }
    return (double)rand() / ((double)RAND_MAX + 1.0);
}

int64_t __sys_Math_randomInt(int64_t lo, int64_t hi) {
    if (lo > hi) return lo;
    double r = __sys_Math_random();
    return lo + (int64_t)(r * (double)(hi - lo + 1));
}

double __sys_Math_lerp(double a, double b, double t) { return a + (b - a) * t; }

/* Time */
int64_t __sys_Time_now(void) {
    struct timeval tv;
    if (gettimeofday(&tv, NULL) != 0) {
        return 0;
    }
    return (int64_t)tv.tv_sec * 1000 + (int64_t)tv.tv_usec / 1000;
}

int64_t __sys_Time_nowSeconds(void) {
    return (int64_t)time(NULL);
}

int64_t __sys_Time_sleep(int64_t ms) {
    if (ms <= 0) {
        return 0;
    }
    struct timespec ts;
    ts.tv_sec = (time_t)(ms / 1000);
    ts.tv_nsec = (long)((ms % 1000) * 1000000);
    nanosleep(&ts, NULL);
    return 0;
}

static struct timeval __obo_timer_start;
static int __obo_timer_running = 0;

int64_t __sys_Time_startTimer(void) {
    gettimeofday(&__obo_timer_start, NULL);
    __obo_timer_running = 1;
    return 0;
}

int64_t __sys_Time_stopTimer(void) {
    if (!__obo_timer_running) return 0;
    struct timeval now;
    gettimeofday(&now, NULL);
    __obo_timer_running = 0;
    return (int64_t)(now.tv_sec - __obo_timer_start.tv_sec) * 1000
         + (int64_t)(now.tv_usec - __obo_timer_start.tv_usec) / 1000;
}

double __sys_Time_measure(void) {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)tv.tv_sec * 1000.0 + (double)tv.tv_usec / 1000.0;
}

/* File (minimal) */
char* __sys_File_read(char* path) {
    FILE* f = fopen(path, "rb");
    if (!f) {
        return obo_gc_track_string(strdup(""));
    }
    fseek(f, 0, SEEK_END);
    long sz = ftell(f);
    fseek(f, 0, SEEK_SET);
    if (sz < 0) {
        fclose(f);
        return obo_gc_track_string(strdup(""));
    }
    char* buf = (char*)malloc((size_t)sz + 1);
    if (!buf) {
        fclose(f);
        return NULL;
    }
    size_t n = fread(buf, 1, (size_t)sz, f);
    fclose(f);
    buf[n] = 0;
    return obo_gc_track_string(buf);
}

int64_t __sys_File_exists(char* path) {
    FILE* f = fopen(path, "rb");
    if (f) {
        fclose(f);
        return 1;
    }
    return 0;
}

int64_t __sys_File_write(char* path, char* contents) {
    if (!path || !contents) return 0;
    FILE* f = fopen(path, "wb");
    if (!f) return 0;
    fwrite(contents, 1, strlen(contents), f);
    fclose(f);
    return 1;
}

int64_t __sys_File_append(char* path, char* contents) {
    if (!path || !contents) return 0;
    FILE* f = fopen(path, "ab");
    if (!f) return 0;
    fwrite(contents, 1, strlen(contents), f);
    fclose(f);
    return 1;
}

int64_t __sys_File_delete(char* path) {
    if (!path) return 0;
    return remove(path) == 0 ? 1 : 0;
}

char* __sys_File_readLines(char* path) {
    return __sys_File_read(path);
}

/* Convert */
int64_t __sys_Convert_toNumber(char* s) {
    if (!s) {
        return 0;
    }
    return (int64_t)strtoll(s, NULL, 10);
}

char* __sys_Convert_toText(int64_t n) { return obo_i64_to_str((long long)n); }

double __sys_Convert_toDecimal(char* s) {
    if (!s) return 0.0;
    return strtod(s, NULL);
}

int64_t __sys_Convert_toFlag(int64_t n) { return n ? 1 : 0; }

int64_t __sys_Convert_toChar(int64_t n) { return n; }

/* --- Pointer operations (metal mode) --- */
int64_t __sys_pointer_alloc(int64_t size) {
    void* ptr = malloc((size_t)size);
    return (int64_t)(uintptr_t)ptr;
}

int64_t __sys_pointer_free(int64_t ptr) {
    free((void*)(uintptr_t)ptr);
    return 0;
}

/* --- Text methods (native stubs for text.member / text.method()) --- */
#include <ctype.h>

int64_t __text_length(const char* s) { return s ? (int64_t)strlen(s) : 0; }

int64_t __text_empty(const char* s) { return (!s || s[0] == '\0') ? 1 : 0; }

char* __text_upper(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    size_t n = strlen(s);
    char* out = (char*)malloc(n + 1);
    for (size_t i = 0; i <= n; i++) out[i] = (char)toupper((unsigned char)s[i]);
    return obo_gc_track_string(out);
}

char* __text_lower(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    size_t n = strlen(s);
    char* out = (char*)malloc(n + 1);
    for (size_t i = 0; i <= n; i++) out[i] = (char)tolower((unsigned char)s[i]);
    return obo_gc_track_string(out);
}

char* __text_trim(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    while (*s && isspace((unsigned char)*s)) s++;
    size_t n = strlen(s);
    while (n > 0 && isspace((unsigned char)s[n - 1])) n--;
    char* out = (char*)malloc(n + 1);
    memcpy(out, s, n); out[n] = 0;
    return obo_gc_track_string(out);
}

char* __text_trimStart(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    while (*s && isspace((unsigned char)*s)) s++;
    return obo_gc_track_string(strdup(s));
}

char* __text_trimEnd(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    size_t n = strlen(s);
    while (n > 0 && isspace((unsigned char)s[n - 1])) n--;
    char* out = (char*)malloc(n + 1);
    memcpy(out, s, n); out[n] = 0;
    return obo_gc_track_string(out);
}

char* __text_reversed(const char* s) {
    if (!s) return obo_gc_track_string(strdup(""));
    size_t n = strlen(s);
    char* out = (char*)malloc(n + 1);
    for (size_t i = 0; i < n; i++) out[i] = s[n - 1 - i];
    out[n] = 0;
    return obo_gc_track_string(out);
}

int64_t __text_contains(const char* s, const char* sub) {
    if (!s || !sub) return 0;
    return strstr(s, sub) ? 1 : 0;
}

int64_t __text_startsWith(const char* s, const char* pre) {
    if (!s || !pre) return 0;
    size_t n = strlen(pre);
    return strncmp(s, pre, n) == 0 ? 1 : 0;
}

int64_t __text_endsWith(const char* s, const char* suf) {
    if (!s || !suf) return 0;
    size_t sn = strlen(s), fn = strlen(suf);
    if (fn > sn) return 0;
    return strcmp(s + sn - fn, suf) == 0 ? 1 : 0;
}

int64_t __text_indexOf(const char* s, const char* sub) {
    if (!s || !sub) return -1;
    const char* p = strstr(s, sub);
    return p ? (int64_t)(p - s) : -1;
}

char* __text_replace(const char* s, const char* from, const char* to) {
    if (!s) return obo_gc_track_string(strdup(""));
    if (!from || !from[0]) return obo_gc_track_string(strdup(s));
    if (!to) to = "";
    size_t flen = strlen(from), tlen = strlen(to), slen = strlen(s);
    size_t cap = slen + 1;
    char* out = (char*)malloc(cap);
    size_t oi = 0;
    const char* p = s;
    while (*p) {
        const char* f = strstr(p, from);
        if (!f) { size_t rest = strlen(p); if (oi + rest >= cap) { cap = oi + rest + 1; out = (char*)realloc(out, cap); } memcpy(out + oi, p, rest); oi += rest; break; }
        size_t seg = (size_t)(f - p);
        if (oi + seg + tlen >= cap) { cap = (oi + seg + tlen) * 2 + 1; out = (char*)realloc(out, cap); }
        memcpy(out + oi, p, seg); oi += seg;
        memcpy(out + oi, to, tlen); oi += tlen;
        p = f + flen;
    }
    out[oi] = 0;
    return obo_gc_track_string(out);
}

char* __text_substring(const char* s, int64_t start, int64_t end) {
    if (!s) return obo_gc_track_string(strdup(""));
    int64_t slen = (int64_t)strlen(s);
    if (start < 0) start = 0;
    if (end > slen) end = slen;
    if (start >= end) return obo_gc_track_string(strdup(""));
    size_t n = (size_t)(end - start);
    char* out = (char*)malloc(n + 1);
    memcpy(out, s + start, n); out[n] = 0;
    return obo_gc_track_string(out);
}

char* __text_repeat(const char* s, int64_t count) {
    if (!s || count <= 0) return obo_gc_track_string(strdup(""));
    size_t slen = strlen(s);
    size_t total = slen * (size_t)count;
    char* out = (char*)malloc(total + 1);
    for (int64_t i = 0; i < count; i++) memcpy(out + i * slen, s, slen);
    out[total] = 0;
    return obo_gc_track_string(out);
}

char* __text_padLeft(const char* s, int64_t width, const char* pad) {
    if (!s) s = "";
    if (!pad || !pad[0]) pad = " ";
    int64_t slen = (int64_t)strlen(s);
    if (slen >= width) return obo_gc_track_string(strdup(s));
    int64_t need = width - slen;
    char* out = (char*)malloc((size_t)width + 1);
    for (int64_t i = 0; i < need; i++) out[i] = pad[i % (int64_t)strlen(pad)];
    memcpy(out + need, s, (size_t)slen + 1);
    return obo_gc_track_string(out);
}

char* __text_padRight(const char* s, int64_t width, const char* pad) {
    if (!s) s = "";
    if (!pad || !pad[0]) pad = " ";
    int64_t slen = (int64_t)strlen(s);
    if (slen >= width) return obo_gc_track_string(strdup(s));
    int64_t need = width - slen;
    char* out = (char*)malloc((size_t)width + 1);
    memcpy(out, s, (size_t)slen);
    for (int64_t i = 0; i < need; i++) out[slen + i] = pad[i % (int64_t)strlen(pad)];
    out[width] = 0;
    return obo_gc_track_string(out);
}

int64_t __text_toNumber(const char* s) {
    if (!s) return 0;
    return (int64_t)strtoll(s, NULL, 10);
}

double __text_toDecimal(const char* s) {
    if (!s) return 0.0;
    return strtod(s, NULL);
}

/* split returns a text list as a single string with \0 separators — for bootstrap, returns joined text */
char* __text_split(const char* s, const char* sep) {
    (void)sep;
    return obo_gc_track_string(s ? strdup(s) : strdup(""));
}

/* --- List methods (native stubs) --- */
void* obo_list_add(void* p, int64_t val) {
    OboList* L = (OboList*)p;
    int64_t old_len = L ? L->len : 0;
    int64_t new_len = old_len + 1;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    if (L && old_len > 0) memcpy(N->items, L->items, (size_t)old_len * sizeof(int64_t));
    N->items[old_len] = val;
    return N;
}

int64_t obo_list_first(void* p) {
    OboList* L = (OboList*)p;
    return (L && L->len > 0) ? L->items[0] : 0;
}

int64_t obo_list_last(void* p) {
    OboList* L = (OboList*)p;
    return (L && L->len > 0) ? L->items[L->len - 1] : 0;
}

int64_t obo_list_empty(void* p) {
    OboList* L = (OboList*)p;
    return (!L || L->len == 0) ? 1 : 0;
}

int64_t obo_list_contains(void* p, int64_t val) {
    OboList* L = (OboList*)p;
    if (!L) return 0;
    for (int64_t i = 0; i < L->len; i++) if (L->items[i] == val) return 1;
    return 0;
}

int64_t obo_list_indexOf(void* p, int64_t val) {
    OboList* L = (OboList*)p;
    if (!L) return -1;
    for (int64_t i = 0; i < L->len; i++) if (L->items[i] == val) return i;
    return -1;
}

static int cmp_i64(const void* a, const void* b) {
    int64_t x = *(const int64_t*)a, y = *(const int64_t*)b;
    return (x > y) - (x < y);
}

void* obo_list_sort(void* p) {
    OboList* L = (OboList*)p;
    if (!L || L->len <= 1) return p;
    int64_t n = L->len;
    OboList* N = obo_alloc_list(n);
    if (!N) return NULL;
    memcpy(N->items, L->items, (size_t)n * sizeof(int64_t));
    qsort(N->items, (size_t)n, sizeof(int64_t), cmp_i64);
    return N;
}

void* obo_list_reverse(void* p) {
    OboList* L = (OboList*)p;
    if (!L) return obo_list_new_i64(0, NULL);
    int64_t n = L->len;
    OboList* N = obo_alloc_list(n);
    if (!N) return NULL;
    for (int64_t i = 0; i < n; i++) N->items[i] = L->items[n - 1 - i];
    return N;
}

void* obo_list_take(void* p, int64_t count) {
    OboList* L = (OboList*)p;
    int64_t n = L ? L->len : 0;
    if (count > n) count = n;
    if (count < 0) count = 0;
    OboList* N = obo_alloc_list(count);
    if (!N) return NULL;
    if (count > 0) memcpy(N->items, L->items, (size_t)count * sizeof(int64_t));
    return N;
}

void* obo_list_skip(void* p, int64_t count) {
    OboList* L = (OboList*)p;
    int64_t n = L ? L->len : 0;
    if (count < 0) count = 0;
    if (count >= n) return obo_list_new_i64(0, NULL);
    int64_t new_len = n - count;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    memcpy(N->items, L->items + count, (size_t)new_len * sizeof(int64_t));
    return N;
}

void* obo_list_slice(void* p, int64_t start, int64_t end) {
    OboList* L = (OboList*)p;
    int64_t n = L ? L->len : 0;
    if (start < 0) start = 0;
    if (end > n) end = n;
    if (start >= end) return obo_list_new_i64(0, NULL);
    int64_t new_len = end - start;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    memcpy(N->items, L->items + start, (size_t)new_len * sizeof(int64_t));
    return N;
}

void* obo_list_remove(void* p, int64_t val) {
    OboList* L = (OboList*)p;
    if (!L || L->len == 0) return p;
    int64_t idx = -1;
    for (int64_t i = 0; i < L->len; i++) { if (L->items[i] == val) { idx = i; break; } }
    if (idx < 0) return p;
    int64_t new_len = L->len - 1;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    if (idx > 0) memcpy(N->items, L->items, (size_t)idx * sizeof(int64_t));
    if (idx < L->len - 1) memcpy(N->items + idx, L->items + idx + 1, (size_t)(L->len - idx - 1) * sizeof(int64_t));
    return N;
}

void* obo_list_removeAt(void* p, int64_t idx) {
    OboList* L = (OboList*)p;
    if (!L || idx < 0 || idx >= L->len) return p;
    int64_t new_len = L->len - 1;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    if (idx > 0) memcpy(N->items, L->items, (size_t)idx * sizeof(int64_t));
    if (idx < L->len - 1) memcpy(N->items + idx, L->items + idx + 1, (size_t)(L->len - idx - 1) * sizeof(int64_t));
    return N;
}

void* obo_list_insert(void* p, int64_t idx, int64_t val) {
    OboList* L = (OboList*)p;
    int64_t n = L ? L->len : 0;
    if (idx < 0) idx = 0;
    if (idx > n) idx = n;
    int64_t new_len = n + 1;
    OboList* N = obo_alloc_list(new_len);
    if (!N) return NULL;
    if (idx > 0 && L) memcpy(N->items, L->items, (size_t)idx * sizeof(int64_t));
    N->items[idx] = val;
    if (idx < n && L) memcpy(N->items + idx + 1, L->items + idx, (size_t)(n - idx) * sizeof(int64_t));
    return N;
}

char* obo_list_join(void* p, const char* sep) {
    OboList* L = (OboList*)p;
    if (!L || L->len == 0) return obo_gc_track_string(strdup(""));
    if (!sep) sep = ", ";
    size_t slen = strlen(sep);
    size_t cap = 256;
    char* out = (char*)malloc(cap);
    size_t oi = 0;
    for (int64_t i = 0; i < L->len; i++) {
        if (i > 0) { if (oi + slen >= cap) { cap = (oi + slen) * 2 + 1; out = (char*)realloc(out, cap); } memcpy(out + oi, sep, slen); oi += slen; }
        char buf[32]; int n = snprintf(buf, sizeof(buf), "%lld", (long long)L->items[i]);
        if (oi + (size_t)n >= cap) { cap = (oi + (size_t)n) * 2 + 1; out = (char*)realloc(out, cap); }
        memcpy(out + oi, buf, (size_t)n); oi += (size_t)n;
    }
    out[oi] = 0;
    return obo_gc_track_string(out);
}

void* obo_list_distinct(void* p) {
    OboList* L = (OboList*)p;
    if (!L || L->len == 0) return obo_list_new_i64(0, NULL);
    int64_t n = L->len;
    int64_t* tmp_items = (int64_t*)malloc((size_t)n * sizeof(int64_t));
    int64_t out_len = 0;
    for (int64_t i = 0; i < n; i++) {
        int dup = 0;
        for (int64_t j = 0; j < out_len; j++) { if (tmp_items[j] == L->items[i]) { dup = 1; break; } }
        if (!dup) tmp_items[out_len++] = L->items[i];
    }
    void* result = obo_list_new_i64(out_len, tmp_items);
    free(tmp_items);
    return result;
}

/* --- Set methods (backed by OboList, deduplicated) --- */

void* obo_set_new(void* list_ptr) {
    OboList* L = (OboList*)list_ptr;
    if (!L || L->len == 0) return obo_list_new_i64(0, NULL);
    int64_t* tmp = (int64_t*)malloc((size_t)L->len * sizeof(int64_t));
    int64_t out = 0;
    for (int64_t i = 0; i < L->len; i++) {
        int dup = 0;
        for (int64_t j = 0; j < out; j++) { if (tmp[j] == L->items[i]) { dup = 1; break; } }
        if (!dup) tmp[out++] = L->items[i];
    }
    void* result = obo_list_new_i64(out, tmp);
    free(tmp);
    return result;
}

void* obo_set_add(void* p, int64_t val) {
    OboList* L = (OboList*)p;
    if (L) {
        for (int64_t i = 0; i < L->len; i++) {
            if (L->items[i] == val) return p; /* already present */
        }
    }
    return obo_list_add(p, val);
}

void* obo_set_remove(void* p, int64_t val) {
    return obo_list_remove(p, val);
}

int64_t obo_set_has(void* p, int64_t val) {
    return obo_list_contains(p, val);
}

void* obo_set_union(void* a, void* b) {
    OboList* la = (OboList*)a;
    OboList* lb = (OboList*)b;
    if (!la) return b ? b : obo_list_new_i64(0, NULL);
    void* result = obo_list_new_i64(la->len, la->items);
    if (lb) {
        for (int64_t i = 0; i < lb->len; i++) {
            result = obo_set_add(result, lb->items[i]);
        }
    }
    return result;
}

void* obo_set_intersect(void* a, void* b) {
    OboList* la = (OboList*)a;
    OboList* lb = (OboList*)b;
    if (!la || !lb) return obo_list_new_i64(0, NULL);
    int64_t* tmp = (int64_t*)malloc((size_t)la->len * sizeof(int64_t));
    int64_t out = 0;
    for (int64_t i = 0; i < la->len; i++) {
        for (int64_t j = 0; j < lb->len; j++) {
            if (la->items[i] == lb->items[j]) { tmp[out++] = la->items[i]; break; }
        }
    }
    void* result = obo_list_new_i64(out, tmp);
    free(tmp);
    return result;
}

void* obo_set_difference(void* a, void* b) {
    OboList* la = (OboList*)a;
    OboList* lb = (OboList*)b;
    if (!la) return obo_list_new_i64(0, NULL);
    if (!lb) return obo_list_new_i64(la->len, la->items);
    int64_t* tmp = (int64_t*)malloc((size_t)la->len * sizeof(int64_t));
    int64_t out = 0;
    for (int64_t i = 0; i < la->len; i++) {
        int found = 0;
        for (int64_t j = 0; j < lb->len; j++) {
            if (la->items[i] == lb->items[j]) { found = 1; break; }
        }
        if (!found) tmp[out++] = la->items[i];
    }
    void* result = obo_list_new_i64(out, tmp);
    free(tmp);
    return result;
}

/* --- Queue methods (FIFO, backed by OboList) --- */

void* obo_queue_push(void* p, int64_t val) {
    return obo_list_add(p, val);
}

int64_t obo_queue_peek(void* p) {
    return obo_list_first(p);
}

void* obo_queue_pop(void* p) {
    OboList* L = (OboList*)p;
    if (!L || L->len == 0) return obo_list_new_i64(0, NULL);
    return obo_list_skip(p, 1); /* remove first element */
}

/* --- Stack methods (LIFO, backed by OboList) --- */

void* obo_stack_push(void* p, int64_t val) {
    return obo_list_add(p, val);
}

int64_t obo_stack_peek(void* p) {
    return obo_list_last(p);
}

void* obo_stack_pop(void* p) {
    OboList* L = (OboList*)p;
    if (!L || L->len == 0) return obo_list_new_i64(0, NULL);
    /* Remove last element */
    int64_t new_len = L->len - 1;
    return obo_list_new_i64(new_len, L->items);
}

/* --- Map methods --- */
int64_t obo_map_empty(void* mp) { return obo_map_len(mp) == 0 ? 1 : 0; }

int64_t obo_map_has(void* mp, const char* key) {
    OboMap* m = (OboMap*)mp;
    if (!m || !key) return 0;
    uint32_t i = map_hash(key);
    for (MapEntry* e = m->buckets[i]; e; e = e->next)
        if (strcmp(e->key, key) == 0) return 1;
    return 0;
}

void* obo_map_set(void* mp, const char* key, int64_t val) {
    if (!mp) mp = obo_map_new();
    obo_map_put_i64(mp, key, val);
    return mp;
}

void* obo_map_remove(void* mp, const char* key) {
    OboMap* m = (OboMap*)mp;
    if (!m || !key) return mp;
    uint32_t i = map_hash(key);
    MapEntry** pp = &m->buckets[i];
    while (*pp) {
        if (strcmp((*pp)->key, key) == 0) {
            MapEntry* e = *pp;
            *pp = e->next;
            /* Unlink from insertion-order list */
            if (e->order_prev) {
                e->order_prev->order_next = e->order_next;
            } else {
                m->order_head = e->order_next;
            }
            if (e->order_next) {
                e->order_next->order_prev = e->order_prev;
            } else {
                m->order_tail = e->order_prev;
            }
            free(e->key);
            if (e->val.tag == OBO_V_STR && e->val.u.str) free(e->val.u.str);
            free(e);
            m->count--;
            return m;
        }
        pp = &(*pp)->next;
    }
    return mp;
}

/* --- Type checking (for check ... is Type) --- */
int64_t obo_type_check(void* p, const char* type_name) {
    if (!type_name) return 0;
    OboEntity* e = (OboEntity*)p;
    if (!e) return 0;
    /* First check entity type_name (for entities and actors) */
    if (e->type_name && strcmp(e->type_name, type_name) == 0) return 1;
    /* Then check __variant field (for choice values) */
    if (e->fields) {
        OboMap* m = e->fields;
        uint32_t i = map_hash("__variant");
        for (MapEntry* ent = m->buckets[i]; ent; ent = ent->next) {
            if (strcmp(ent->key, "__variant") == 0) {
                if (ent->val.tag == OBO_V_STR && ent->val.u.str && strcmp(ent->val.u.str, type_name) == 0) return 1;
                break;
            }
        }
    }
    return 0;
}

/* --- Error handling (possible/else via setjmp/longjmp) --- */
#define OBO_POSSIBLE_STACK_SIZE 64

typedef struct {
    jmp_buf buf;
} OboPossibleFrame;

static OboPossibleFrame __obo_possible_stack[OBO_POSSIBLE_STACK_SIZE];
static int __obo_possible_top = 0;
static char* __obo_possible_error = NULL;

void* obo_possible_push(void) {
    if (__obo_possible_top >= OBO_POSSIBLE_STACK_SIZE) {
        fprintf(stderr, "Obo: Too many nested possible blocks\n");
        exit(1);
    }
    return &__obo_possible_stack[__obo_possible_top++].buf;
}

int64_t obo_possible_pop(void) {
    if (__obo_possible_top > 0) __obo_possible_top--;
    return 0;
}

void obo_throw(const char* msg) {
    if (__obo_possible_top > 0) {
        __obo_possible_top--;
        if (__obo_possible_error) free(__obo_possible_error);
        __obo_possible_error = msg ? strdup(msg) : strdup("unknown error");
        longjmp(__obo_possible_stack[__obo_possible_top].buf, 1);
    } else {
        fprintf(stderr, "Obo: Unhandled error: %s\n", msg ? msg : "unknown error");
        exit(1);
    }
}

char* obo_possible_get_error(void) {
    char* e = __obo_possible_error ? __obo_possible_error : strdup("");
    __obo_possible_error = NULL;
    return e;
}

int64_t obo_safe_div(int64_t a, int64_t b) {
    if (b == 0) {
        obo_throw("Obo: Division by zero — that's not going to work");
        return 0; /* unreachable if possible block active */
    }
    return a / b;
}

int64_t obo_safe_mod(int64_t a, int64_t b) {
    if (b == 0) {
        obo_throw("Obo: Modulo by zero — that's not going to work");
        return 0;
    }
    return a % b;
}

/* --- Range → List (exclusive end, matching interpreter) --- */
void* obo_range(int64_t start, int64_t end, int64_t step) {
    if (step == 0) step = 1;
    int64_t count = 0;
    if (step > 0 && start < end) {
        count = (end - start + step - 1) / step;
    } else if (step < 0 && start > end) {
        count = (start - end + (-step) - 1) / (-step);
    }
    if (count <= 0) return obo_list_new_i64(0, NULL);
    int64_t* tmp = (int64_t*)malloc(count * sizeof(int64_t));
    int64_t val = start;
    for (int64_t i = 0; i < count; i++) {
        tmp[i] = val;
        val += step;
    }
    void* list = obo_list_new_i64(count, tmp);
    free(tmp);
    return list;
}

/* --- Tracing GC (mark-and-sweep with transitive marking) --- */
typedef struct GCNode {
    void* ptr;
    uint8_t mark;
    uint8_t kind;
    struct GCNode* next;
} GCNode;
static GCNode* __obo_gc_head = NULL;
static int64_t __obo_gc_alloc_count = 0;
static int64_t __obo_gc_threshold = 256;
static int __obo_gc_paused = 0;

/* Shadow stack for GC roots (pointers to stack slots holding heap refs) */
#define OBO_GC_ROOT_STACK_SIZE 4096
static void** __obo_gc_roots[OBO_GC_ROOT_STACK_SIZE];
static int64_t __obo_gc_root_top = 0;

void obo_gc_push_root(void** slot) {
    if (__obo_gc_root_top < OBO_GC_ROOT_STACK_SIZE) {
        __obo_gc_roots[__obo_gc_root_top++] = slot;
    }
}

void obo_gc_pop_roots(int64_t n) {
    __obo_gc_root_top -= n;
    if (__obo_gc_root_top < 0) __obo_gc_root_top = 0;
}

static GCNode* gc_find_node(void* ptr) {
    for (GCNode* n = __obo_gc_head; n; n = n->next) {
        if (n->ptr == ptr) return n;
    }
    return NULL;
}

static int64_t obo_boxed_list_len(void* list_ptr) {
    if (!list_ptr) {
        return 0;
    }
    GCNode* node = gc_find_node(list_ptr);
    if (node && node->kind == OBO_GC_MIXED_LIST) {
        return ((OboMixedList*)list_ptr)->len;
    }
    return ((OboList*)list_ptr)->len;
}

void* obo_value_as_mixed_list_ptr(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v || v->tag != OBO_V_LIST || !v->u.ptr) {
        return NULL;
    }
    GCNode* node = gc_find_node(v->u.ptr);
    if (node && node->kind == OBO_GC_MIXED_LIST) {
        return v->u.ptr;
    }
    OboList* list = (OboList*)v->u.ptr;
    OboMixedList* mixed = (OboMixedList*)obo_mixed_list_new(list ? list->len : 0);
    if (!mixed || !list) {
        return mixed;
    }
    for (int64_t i = 0; i < list->len; i++) {
        mixed->items[i].tag = OBO_V_I64;
        mixed->items[i].u.i64 = list->items[i];
    }
    return mixed;
}

int64_t obo_value_len(void* p) {
    OboValue* v = (OboValue*)p;
    if (!v) {
        return 0;
    }
    switch (v->tag) {
        case OBO_V_STR:
            return v->u.str ? (int64_t)strlen(v->u.str) : 0;
        case OBO_V_LIST:
            return obo_boxed_list_len(v->u.ptr);
        case OBO_V_MAP:
            return obo_map_len(v->u.ptr);
        case OBO_V_NULL:
            return 0;
        default:
            return 0;
    }
}

int64_t obo_value_empty(void* p) {
    return obo_value_len(p) == 0 ? 1 : 0;
}

typedef struct {
    char* data;
    size_t len;
    size_t cap;
} OboStringBuf;

typedef struct {
    const void** items;
    size_t len;
    size_t cap;
} OboFormatSeen;

static int obo_buf_reserve(OboStringBuf* buf, size_t extra) {
    size_t need = buf->len + extra + 1;
    if (need <= buf->cap) {
        return 1;
    }
    size_t cap = buf->cap ? buf->cap : 64;
    while (cap < need) {
        cap *= 2;
    }
    char* next = (char*)realloc(buf->data, cap);
    if (!next) {
        return 0;
    }
    buf->data = next;
    buf->cap = cap;
    return 1;
}

static int obo_buf_append_n(OboStringBuf* buf, const char* text, size_t len) {
    if (!obo_buf_reserve(buf, len)) {
        return 0;
    }
    memcpy(buf->data + buf->len, text, len);
    buf->len += len;
    buf->data[buf->len] = 0;
    return 1;
}

static int obo_buf_append(OboStringBuf* buf, const char* text) {
    return obo_buf_append_n(buf, text, strlen(text));
}

static int obo_buf_append_char(OboStringBuf* buf, char ch) {
    if (!obo_buf_reserve(buf, 1)) {
        return 0;
    }
    buf->data[buf->len++] = ch;
    buf->data[buf->len] = 0;
    return 1;
}

static int obo_buf_append_i64(OboStringBuf* buf, int64_t value) {
    char tmp[32];
    int len = snprintf(tmp, sizeof(tmp), "%lld", (long long)value);
    if (len < 0) {
        return 0;
    }
    return obo_buf_append_n(buf, tmp, (size_t)len);
}

static int obo_buf_append_f64(OboStringBuf* buf, double value) {
    char tmp[64];
    int len;
    if (value == (int64_t)value && fabs(value) < 1e15) {
        len = snprintf(tmp, sizeof(tmp), "%.1f", value);
    } else {
        len = snprintf(tmp, sizeof(tmp), "%.15g", value);
    }
    if (len < 0) {
        return 0;
    }
    return obo_buf_append_n(buf, tmp, (size_t)len);
}

static char* obo_buf_finish(OboStringBuf* buf) {
    if (!buf->data) {
        buf->data = (char*)malloc(1);
        if (!buf->data) {
            return NULL;
        }
        buf->data[0] = 0;
        buf->cap = 1;
    }
    char* out = buf->data;
    buf->data = NULL;
    buf->len = 0;
    buf->cap = 0;
    return out;
}

static void obo_buf_dispose(OboStringBuf* buf) {
    free(buf->data);
    buf->data = NULL;
    buf->len = 0;
    buf->cap = 0;
}

static int obo_seen_contains(const OboFormatSeen* seen, const void* ptr) {
    for (size_t i = 0; i < seen->len; i++) {
        if (seen->items[i] == ptr) {
            return 1;
        }
    }
    return 0;
}

static int obo_seen_push(OboFormatSeen* seen, const void* ptr) {
    if (seen->len >= seen->cap) {
        size_t cap = seen->cap ? seen->cap * 2 : 16;
        const void** next = (const void**)realloc(seen->items, cap * sizeof(void*));
        if (!next) {
            return 0;
        }
        seen->items = next;
        seen->cap = cap;
    }
    seen->items[seen->len++] = ptr;
    return 1;
}

static void obo_seen_pop(OboFormatSeen* seen) {
    if (seen->len > 0) {
        seen->len -= 1;
    }
}

static void obo_seen_dispose(OboFormatSeen* seen) {
    free(seen->items);
    seen->items = NULL;
    seen->len = 0;
    seen->cap = 0;
}

static int obo_format_value_into(OboStringBuf* buf, const OboValue* value, OboFormatSeen* seen);

static int obo_format_i64_list_into(OboStringBuf* buf, const OboList* list, OboFormatSeen* seen) {
    if (!list) {
        return obo_buf_append(buf, "[]");
    }
    if (obo_seen_contains(seen, list)) {
        return obo_buf_append(buf, "<cycle>");
    }
    if (!obo_seen_push(seen, list) || !obo_buf_append_char(buf, '[')) {
        return 0;
    }
    for (int64_t i = 0; i < list->len; i++) {
        if (i > 0 && !obo_buf_append(buf, ", ")) {
            return 0;
        }
        if (!obo_buf_append_i64(buf, list->items[i])) {
            return 0;
        }
    }
    obo_seen_pop(seen);
    return obo_buf_append_char(buf, ']');
}

static int obo_format_mixed_list_into(
    OboStringBuf* buf,
    const OboMixedList* list,
    OboFormatSeen* seen
) {
    if (!list) {
        return obo_buf_append(buf, "[]");
    }
    if (obo_seen_contains(seen, list)) {
        return obo_buf_append(buf, "<cycle>");
    }
    if (!obo_seen_push(seen, list) || !obo_buf_append_char(buf, '[')) {
        return 0;
    }
    for (int64_t i = 0; i < list->len; i++) {
        if (i > 0 && !obo_buf_append(buf, ", ")) {
            return 0;
        }
        if (!obo_format_value_into(buf, &list->items[i], seen)) {
            return 0;
        }
    }
    obo_seen_pop(seen);
    return obo_buf_append_char(buf, ']');
}

static int obo_format_list_ptr_into(OboStringBuf* buf, const void* list_ptr, OboFormatSeen* seen) {
    if (!list_ptr) {
        return obo_buf_append(buf, "[]");
    }
    GCNode* node = gc_find_node((void*)list_ptr);
    if (node && node->kind == OBO_GC_MIXED_LIST) {
        return obo_format_mixed_list_into(buf, (const OboMixedList*)list_ptr, seen);
    }
    return obo_format_i64_list_into(buf, (const OboList*)list_ptr, seen);
}

static int obo_format_map_into(OboStringBuf* buf, const OboMap* map, OboFormatSeen* seen) {
    if (!map) {
        return obo_buf_append(buf, "[]");
    }
    if (obo_seen_contains(seen, map)) {
        return obo_buf_append(buf, "<cycle>");
    }
    if (!obo_seen_push(seen, map) || !obo_buf_append_char(buf, '[')) {
        return 0;
    }
    int first = 1;
    for (MapEntry* e = map->order_head; e; e = e->order_next) {
        if (!first && !obo_buf_append(buf, ", ")) {
            return 0;
        }
        first = 0;
        if (!obo_buf_append(buf, e->key) || !obo_buf_append(buf, ": ")) {
            return 0;
        }
        if (!obo_format_value_into(buf, &e->val, seen)) {
            return 0;
        }
    }
    obo_seen_pop(seen);
    return obo_buf_append_char(buf, ']');
}

static int obo_format_entity_into(OboStringBuf* buf, const OboEntity* entity, OboFormatSeen* seen) {
    if (!entity) {
        return obo_buf_append(buf, "null");
    }
    if (obo_seen_contains(seen, entity)) {
        return obo_buf_append(buf, "<cycle>");
    }
    /* Choice-style display: if entity has __variant, print as VariantName or VariantName(field1, field2) */
    if (entity->fields) {
        const char* variant_name = NULL;
        int data_count = 0;
        OboMap* m = entity->fields;
        /* find __variant */
        uint32_t vi = map_hash("__variant");
        for (MapEntry* e = m->buckets[vi]; e; e = e->next) {
            if (strcmp(e->key, "__variant") == 0 && e->val.tag == OBO_V_STR) {
                variant_name = e->val.u.str;
                break;
            }
        }
        if (variant_name) {
            /* count data fields (non-__variant) */
            for (MapEntry* e = m->order_head; e; e = e->order_next) {
                if (strcmp(e->key, "__variant") != 0) data_count++;
            }
            if (!obo_buf_append(buf, variant_name)) return 0;
            if (data_count > 0) {
                if (!obo_buf_append(buf, "(")) return 0;
                if (!obo_seen_push(seen, entity)) return 0;
                int first = 1;
                for (MapEntry* e = m->order_head; e; e = e->order_next) {
                    if (strcmp(e->key, "__variant") == 0) continue;
                    if (!first && !obo_buf_append(buf, ", ")) return 0;
                    first = 0;
                    if (!obo_format_value_into(buf, &e->val, seen)) return 0;
                }
                obo_seen_pop(seen);
                if (!obo_buf_append(buf, ")")) return 0;
            }
            return 1;
        }
    }
    if (!obo_seen_push(seen, entity)
        || !obo_buf_append(buf, entity->type_name ? entity->type_name : "?")
        || !obo_buf_append(buf, " { ")) {
        return 0;
    }
    int first = 1;
    if (entity->fields) {
        for (MapEntry* e = entity->fields->order_head; e; e = e->order_next) {
            if (!first && !obo_buf_append(buf, "; ")) {
                return 0;
            }
            first = 0;
            if (!obo_buf_append(buf, e->key) || !obo_buf_append(buf, " = ")) {
                return 0;
            }
            if (!obo_format_value_into(buf, &e->val, seen)) {
                return 0;
            }
        }
    }
    obo_seen_pop(seen);
    return obo_buf_append(buf, " }");
}

static int obo_format_value_into(OboStringBuf* buf, const OboValue* value, OboFormatSeen* seen) {
    if (!value) {
        return obo_buf_append(buf, "null");
    }
    switch (value->tag) {
        case OBO_V_I64:
            return obo_buf_append_i64(buf, value->u.i64);
        case OBO_V_STR:
            return obo_buf_append(buf, value->u.str ? value->u.str : "");
        case OBO_V_LIST:
            return obo_format_list_ptr_into(buf, value->u.ptr, seen);
        case OBO_V_MAP:
            return obo_format_map_into(buf, (const OboMap*)value->u.ptr, seen);
        case OBO_V_ENTITY:
            return obo_format_entity_into(buf, (const OboEntity*)value->u.ptr, seen);
        case OBO_V_F64:
            return obo_buf_append_f64(buf, value->u.f64);
        case OBO_V_BOOL:
            return obo_buf_append(buf, value->u.i64 ? "true" : "false");
        case OBO_V_NULL:
            return obo_buf_append(buf, "null");
        default:
            return obo_buf_append(buf, "?");
    }
}

static char* obo_format_boxed_string(const OboValue* value) {
    OboStringBuf buf = {0};
    OboFormatSeen seen = {0};
    if (!obo_format_value_into(&buf, value, &seen)) {
        obo_buf_dispose(&buf);
        obo_seen_dispose(&seen);
        return NULL;
    }
    obo_seen_dispose(&seen);
    return obo_buf_finish(&buf);
}

char* obo_format_list_string(void* list_ptr) {
    OboValue value;
    value.tag = OBO_V_LIST;
    value.u.ptr = list_ptr;
    return obo_format_boxed_string(&value);
}

char* obo_format_map_string(void* map_ptr) {
    OboValue value;
    value.tag = OBO_V_MAP;
    value.u.ptr = map_ptr;
    return obo_format_boxed_string(&value);
}

char* obo_format_entity_string(void* entity_ptr) {
    OboValue value;
    value.tag = OBO_V_ENTITY;
    value.u.ptr = entity_ptr;
    return obo_format_boxed_string(&value);
}

static void obo_print_owned_line(char* text) {
    if (!text) {
        printf("?\n");
        return;
    }
    printf("%s\n", text);
    free(text);
}

static void gc_enqueue_ptr(void*** q, size_t* qlen, size_t* qcap, void* p) {
    if (!p) return;
    if (*qlen >= *qcap) {
        size_t nc = *qcap ? *qcap * 2 : 64;
        void** nq = (void**)realloc(*q, nc * sizeof(void*));
        if (!nq) return;
        *q = nq;
        *qcap = nc;
    }
    (*q)[(*qlen)++] = p;
}

static void gc_mark_obo_value_edges(const OboValue* v, void*** q, size_t* qlen, size_t* qcap) {
    if (!v) return;
    switch (v->tag) {
        case OBO_V_LIST:
        case OBO_V_MAP:
        case OBO_V_ENTITY:
            gc_enqueue_ptr(q, qlen, qcap, v->u.ptr);
            break;
        default:
            break;
    }
}

static void gc_mark_map_edges(OboMap* m, void*** q, size_t* qlen, size_t* qcap) {
    if (!m) return;
    for (MapEntry* e = m->order_head; e; e = e->order_next) {
        gc_mark_obo_value_edges(&e->val, q, qlen, qcap);
    }
}

static void gc_mark_phase(void) {
    void** q = NULL;
    size_t qlen = 0, qcap = 0;
    for (int64_t i = 0; i < __obo_gc_root_top; i++) {
        void** slot = __obo_gc_roots[i];
        if (slot && *slot) gc_enqueue_ptr(&q, &qlen, &qcap, *slot);
    }
    for (OboTask* task = __obo_pending_tasks; task; task = task->next_pending) {
        gc_enqueue_ptr(&q, &qlen, &qcap, task);
    }
    for (size_t i = 0; i < qlen; i++) {
        void* p = q[i];
        GCNode* n = gc_find_node(p);
        if (!n || n->mark) continue;
        n->mark = 1;
        switch (n->kind) {
            case OBO_GC_ENTITY: {
                OboEntity* e = (OboEntity*)p;
                gc_mark_map_edges(e->fields, &q, &qlen, &qcap);
                break;
            }
            case OBO_GC_MAP:
                gc_mark_map_edges((OboMap*)p, &q, &qlen, &qcap);
                break;
            case OBO_GC_MIXED_LIST: {
                OboMixedList* L = (OboMixedList*)p;
                for (int64_t j = 0; j < L->len; j++) {
                    gc_mark_obo_value_edges(&L->items[j], &q, &qlen, &qcap);
                }
                break;
            }
            case OBO_GC_VALUE:
                gc_mark_obo_value_edges((OboValue*)p, &q, &qlen, &qcap);
                break;
            case OBO_GC_TASK: {
                OboTask* task = (OboTask*)p;
                gc_enqueue_ptr(&q, &qlen, &qcap, task->closure);
                break;
            }
            case OBO_GC_STRING:
            case OBO_GC_LIST_I64:
            case OBO_GC_CLOSURE:
            case OBO_GC_OPAQUE:
            default:
                break;
        }
    }
    free(q);
}

static void obo_map_free_entries(OboMap* m) {
    if (!m) return;
    MapEntry* e = m->order_head;
    while (e) {
        MapEntry* next = e->order_next;
        free(e->key);
        if (e->val.tag == OBO_V_STR && e->val.u.str) {
            free(e->val.u.str);
        }
        free(e);
        e = next;
    }
    memset(m->buckets, 0, sizeof(m->buckets));
    m->order_head = NULL;
    m->order_tail = NULL;
    m->count = 0;
}

static void gc_free_object(GCNode* node) {
    void* p = node->ptr;
    switch (node->kind) {
        case OBO_GC_STRING:
            free(p);
            break;
        case OBO_GC_LIST_I64:
            free(p);
            break;
        case OBO_GC_MAP:
            obo_map_free_entries((OboMap*)p);
            free(p);
            break;
        case OBO_GC_ENTITY: {
            OboEntity* e = (OboEntity*)p;
            if (e->type_name) free(e->type_name);
            if (e->fields) {
                obo_map_free_entries(e->fields);
                free(e->fields);
            }
            free(e);
            break;
        }
        case OBO_GC_MIXED_LIST: {
            OboMixedList* L = (OboMixedList*)p;
            for (int64_t i = 0; i < L->len; i++) {
                OboValue* v = &L->items[i];
                if (v->tag == OBO_V_STR && v->u.str) free(v->u.str);
            }
            free(p);
            break;
        }
        case OBO_GC_CLOSURE:
            free(p);
            break;
        case OBO_GC_TASK:
            free(p);
            break;
        case OBO_GC_VALUE:
            obo_value_free(p);
            break;
        case OBO_GC_OPAQUE:
        default:
            free(p);
            break;
    }
}

void obo_gc_collect(void) {
    gc_mark_phase();
    GCNode** pp = &__obo_gc_head;
    while (*pp) {
        GCNode* node = *pp;
        if (!node->mark) {
            *pp = node->next;
            gc_free_object(node);
            free(node);
            __obo_gc_alloc_count--;
        } else {
            node->mark = 0;
            pp = &node->next;
        }
    }
}

void obo_gc_pause(void) { __obo_gc_paused = 1; }
void obo_gc_resume(void) { __obo_gc_paused = 0; }

static void obo_gc_register_impl(void* ptr, int kind) {
    if (!ptr) return;
    GCNode* n = (GCNode*)malloc(sizeof(GCNode));
    if (!n) return;
    n->ptr = ptr;
    n->mark = 1;
    n->kind = (uint8_t)kind;
    n->next = __obo_gc_head;
    __obo_gc_head = n;
    __obo_gc_alloc_count++;
    if (!__obo_gc_paused && __obo_gc_alloc_count > __obo_gc_threshold) {
        obo_gc_collect();
        if (__obo_gc_alloc_count > __obo_gc_threshold / 2) {
            __obo_gc_threshold *= 2;
        }
    }
}

/* Unknown / legacy allocations — no interior pointers (conservative) */
void obo_arena_register(void* ptr) { obo_gc_register_impl(ptr, OBO_GC_OPAQUE); }

/* Final cleanup: free every tracked object regardless of marks */
void obo_arena_free_all(void) {
    GCNode* n = __obo_gc_head;
    while (n) {
        GCNode* next = n->next;
        gc_free_object(n);
        free(n);
        n = next;
    }
    __obo_gc_head = NULL;
    __obo_gc_alloc_count = 0;
    __obo_gc_root_top = 0;
    __obo_pending_tasks = NULL;
}

/* --- Closures --- */
typedef struct {
    void* fn_ptr;
    int32_t num_captures;
    int64_t captures[];
} OboClosure;

void* obo_closure_new(void* fn_ptr, int64_t num_captures) {
    size_t sz = sizeof(OboClosure) + (size_t)num_captures * sizeof(int64_t);
    OboClosure* c = (OboClosure*)malloc(sz);
    c->fn_ptr = fn_ptr;
    c->num_captures = (int32_t)num_captures;
    memset(c->captures, 0, (size_t)num_captures * sizeof(int64_t));
    obo_gc_register_impl(c, OBO_GC_CLOSURE);
    return c;
}

void obo_closure_set_capture(void* cp, int64_t idx, int64_t val) {
    OboClosure* c = (OboClosure*)cp;
    if (idx >= 0 && idx < c->num_captures) c->captures[idx] = val;
}

int64_t obo_closure_get_capture(void* cp, int64_t idx) {
    OboClosure* c = (OboClosure*)cp;
    if (idx >= 0 && idx < c->num_captures) return c->captures[idx];
    return 0;
}

/* Closure call trampolines: fn(closure_self, args...) */
typedef int64_t (*closure_fn_0)(void*);
typedef int64_t (*closure_fn_1)(void*, int64_t);
typedef int64_t (*closure_fn_2)(void*, int64_t, int64_t);

int64_t obo_closure_call_0(void* cp) {
    OboClosure* c = (OboClosure*)cp;
    closure_fn_0 fn = (closure_fn_0)c->fn_ptr;
    return fn(cp);
}

int64_t obo_closure_call_1(void* cp, int64_t a0) {
    OboClosure* c = (OboClosure*)cp;
    closure_fn_1 fn = (closure_fn_1)c->fn_ptr;
    return fn(cp, a0);
}

int64_t obo_closure_call_2(void* cp, int64_t a0, int64_t a1) {
    OboClosure* c = (OboClosure*)cp;
    closure_fn_2 fn = (closure_fn_2)c->fn_ptr;
    return fn(cp, a0, a1);
}

typedef int64_t (*closure_fn_3)(void*, int64_t, int64_t, int64_t);

int64_t obo_closure_call_3(void* cp, int64_t a0, int64_t a1, int64_t a2) {
    OboClosure* c = (OboClosure*)cp;
    closure_fn_3 fn = (closure_fn_3)c->fn_ptr;
    return fn(cp, a0, a1, a2);
}

/* --- Events --- */

void* obo_event_listen(void* entity_ptr, const char* event_name, void* closure) {
    if (!entity_ptr || !event_name || !closure) return NULL;
    OboEntity* e = (OboEntity*)entity_ptr;
    if (!e->fields) return NULL;

    /* Build the key __evt_<event_name> */
    char key[256];
    snprintf(key, sizeof(key), "__evt_%s", event_name);

    /* Look up existing listener list */
    OboMap* m = e->fields;
    uint32_t h = map_hash(key);
    OboList* listeners = NULL;
    for (MapEntry* me = m->buckets[h]; me; me = me->next) {
        if (strcmp(me->key, key) == 0 && me->val.tag == OBO_V_LIST) {
            listeners = (OboList*)me->val.u.ptr;
            break;
        }
    }

    if (!listeners) {
        listeners = obo_alloc_list(0);
    }

    /* Append the closure to the list */
    int64_t old_len = listeners->len;
    OboList* grown = obo_alloc_list(old_len + 1);
    for (int64_t i = 0; i < old_len; i++) {
        grown->items[i] = listeners->items[i];
    }
    grown->items[old_len] = (int64_t)(intptr_t)closure;

    /* Store back */
    OboValue nv;
    nv.tag = OBO_V_LIST;
    nv.u.ptr = grown;
    map_insert(m, key, nv);
    return NULL;
}

void* obo_event_emit(void* entity_ptr, const char* event_name, void* args_list) {
    if (!entity_ptr || !event_name) return NULL;
    OboEntity* e = (OboEntity*)entity_ptr;
    if (!e->fields) return NULL;

    char key[256];
    snprintf(key, sizeof(key), "__evt_%s", event_name);

    OboMap* m = e->fields;
    uint32_t h = map_hash(key);
    OboList* listeners = NULL;
    for (MapEntry* me = m->buckets[h]; me; me = me->next) {
        if (strcmp(me->key, key) == 0 && me->val.tag == OBO_V_LIST) {
            listeners = (OboList*)me->val.u.ptr;
            break;
        }
    }
    if (!listeners) return NULL;

    OboList* args = (OboList*)args_list;
    int64_t argc = args ? args->len : 0;

    for (int64_t i = 0; i < listeners->len; i++) {
        void* closure = (void*)(intptr_t)listeners->items[i];
        if (!closure) continue;
        switch (argc) {
            case 0: obo_closure_call_0(closure); break;
            case 1: obo_closure_call_1(closure, args->items[0]); break;
            case 2: obo_closure_call_2(closure, args->items[0], args->items[1]); break;
            case 3: obo_closure_call_3(closure, args->items[0], args->items[1], args->items[2]); break;
            default: break; /* extend as needed */
        }
    }
    return NULL;
}

static void* obo_task_thread_fn(void* arg) {
    OboTask* task = (OboTask*)arg;
    if (task && task->closure) {
        obo_closure_call_0(task->closure);
    }
    return NULL;
}

void* obo_task_spawn(void* closure) {
    OboTask* task = (OboTask*)malloc(sizeof(OboTask));
    if (!task) return NULL;
    task->closure = closure;
    task->joined = 0;
    task->next_pending = __obo_pending_tasks;
    __obo_pending_tasks = task;
    obo_gc_register_impl(task, OBO_GC_TASK);
    pthread_create(&task->thread, NULL, obo_task_thread_fn, task);
    return task;
}

void obo_task_wait(void* task_ptr) {
    OboTask* task = (OboTask*)task_ptr;
    if (!task || task->joined) return;
    pthread_join(task->thread, NULL);
    task->joined = 1;
}

void obo_task_wait_all(void) {
    OboTask* t = __obo_pending_tasks;
    while (t) {
        if (!t->joined) {
            pthread_join(t->thread, NULL);
            t->joined = 1;
        }
        t = t->next_pending;
    }
}

/* --- Channels --- */
typedef struct OboChannel {
    pthread_mutex_t mutex;
    pthread_cond_t  not_empty;
    int64_t* buffer;
    int64_t  len;
    int64_t  cap;
} OboChannel;

void* obo_channel_create(void) {
    OboChannel* ch = (OboChannel*)malloc(sizeof(OboChannel));
    if (!ch) return NULL;
    pthread_mutex_init(&ch->mutex, NULL);
    pthread_cond_init(&ch->not_empty, NULL);
    ch->buffer = NULL;
    ch->len = 0;
    ch->cap = 0;
    return ch;
}

void obo_channel_send(void* chp, int64_t value) {
    OboChannel* ch = (OboChannel*)chp;
    if (!ch) return;
    pthread_mutex_lock(&ch->mutex);
    if (ch->len >= ch->cap) {
        int64_t new_cap = ch->cap < 8 ? 8 : ch->cap * 2;
        ch->buffer = (int64_t*)realloc(ch->buffer, (size_t)new_cap * sizeof(int64_t));
        ch->cap = new_cap;
    }
    ch->buffer[ch->len++] = value;
    pthread_cond_signal(&ch->not_empty);
    pthread_mutex_unlock(&ch->mutex);
}

int64_t obo_channel_receive(void* chp) {
    OboChannel* ch = (OboChannel*)chp;
    if (!ch) return 0;
    pthread_mutex_lock(&ch->mutex);
    while (ch->len == 0) {
        pthread_cond_wait(&ch->not_empty, &ch->mutex);
    }
    int64_t value = ch->buffer[0];
    ch->len--;
    for (int64_t i = 0; i < ch->len; i++) {
        ch->buffer[i] = ch->buffer[i + 1];
    }
    pthread_mutex_unlock(&ch->mutex);
    return value;
}

/* --- Atomics --- */
typedef struct OboAtomic {
    volatile int64_t value;
} OboAtomic;

void* obo_atomic_create(int64_t initial) {
    OboAtomic* a = (OboAtomic*)malloc(sizeof(OboAtomic));
    if (!a) return NULL;
    __atomic_store_n(&a->value, initial, __ATOMIC_SEQ_CST);
    return a;
}

int64_t obo_atomic_load(void* ap) {
    OboAtomic* a = (OboAtomic*)ap;
    if (!a) return 0;
    return __atomic_load_n(&a->value, __ATOMIC_SEQ_CST);
}

void obo_atomic_store(void* ap, int64_t val) {
    OboAtomic* a = (OboAtomic*)ap;
    if (!a) return;
    __atomic_store_n(&a->value, val, __ATOMIC_SEQ_CST);
}

int64_t obo_atomic_add(void* ap, int64_t delta) {
    OboAtomic* a = (OboAtomic*)ap;
    if (!a) return 0;
    return __atomic_add_fetch(&a->value, delta, __ATOMIC_SEQ_CST);
}

int64_t obo_atomic_sub(void* ap, int64_t delta) {
    OboAtomic* a = (OboAtomic*)ap;
    if (!a) return 0;
    return __atomic_sub_fetch(&a->value, delta, __ATOMIC_SEQ_CST);
}

/* --- Callback list methods --- */
void* obo_list_filter(void* lp, void* cp) {
    OboList* list = (OboList*)lp;
    OboClosure* c = (OboClosure*)cp;
    closure_fn_1 fn = (closure_fn_1)c->fn_ptr;
    int64_t count = 0;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, list->items[i]) != 0) count++;
    }
    OboList* result = (OboList*)malloc(sizeof(OboList) + (size_t)count * sizeof(int64_t));
    result->len = count;
    result->cap = count;
    int64_t j = 0;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, list->items[i]) != 0) result->items[j++] = list->items[i];
    }
    obo_gc_register_impl(result, OBO_GC_LIST_I64);
    return result;
}

void* obo_list_map(void* lp, void* cp) {
    OboList* list = (OboList*)lp;
    OboClosure* c = (OboClosure*)cp;
    closure_fn_1 fn = (closure_fn_1)c->fn_ptr;
    OboList* result = (OboList*)malloc(sizeof(OboList) + (size_t)list->len * sizeof(int64_t));
    result->len = list->len;
    result->cap = list->len;
    for (int64_t i = 0; i < list->len; i++) {
        result->items[i] = fn(cp, list->items[i]);
    }
    obo_gc_register_impl(result, OBO_GC_LIST_I64);
    return result;
}

int64_t obo_list_reduce(void* lp, int64_t initial, void* cp) {
    OboList* list = (OboList*)lp;
    OboClosure* c = (OboClosure*)cp;
    closure_fn_2 fn = (closure_fn_2)c->fn_ptr;
    int64_t acc = initial;
    for (int64_t i = 0; i < list->len; i++) {
        acc = fn(cp, acc, list->items[i]);
    }
    return acc;
}

int64_t obo_list_any(void* lp, void* cp) {
    OboList* list = (OboList*)lp;
    OboClosure* c = (OboClosure*)cp;
    closure_fn_1 fn = (closure_fn_1)c->fn_ptr;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, list->items[i]) != 0) return 1;
    }
    return 0;
}

int64_t obo_list_all(void* lp, void* cp) {
    OboList* list = (OboList*)lp;
    OboClosure* c = (OboClosure*)cp;
    closure_fn_1 fn = (closure_fn_1)c->fn_ptr;
    for (int64_t i = 0; i < list->len; i++) {
        if (fn(cp, list->items[i]) == 0) return 0;
    }
    return 1;
}

/* ── Buffer (byte array) ─────────────────────────────── */
typedef struct {
    int64_t len;
    int64_t cap;
    uint8_t* data;
} OboBuffer;

void* obo_buffer_new(int64_t size) {
    OboBuffer* b = (OboBuffer*)malloc(sizeof(OboBuffer));
    b->len = size < 0 ? 0 : size;
    b->cap = b->len;
    b->data = (uint8_t*)calloc(b->len, 1);
    return b;
}

int64_t obo_buffer_length(void* bp) {
    OboBuffer* b = (OboBuffer*)bp;
    if (!b) return 0;
    return b->len;
}

int64_t obo_buffer_get(void* bp, int64_t idx) {
    OboBuffer* b = (OboBuffer*)bp;
    if (!b || idx < 0 || idx >= b->len) return 0;
    return (int64_t)b->data[idx];
}

void* obo_buffer_set(void* bp, int64_t idx, int64_t val) {
    OboBuffer* b = (OboBuffer*)bp;
    /* Return a new buffer with the byte set */
    OboBuffer* nb = (OboBuffer*)malloc(sizeof(OboBuffer));
    nb->len = b ? b->len : 0;
    nb->cap = nb->len;
    nb->data = (uint8_t*)malloc(nb->len);
    if (b && b->data) memcpy(nb->data, b->data, nb->len);
    if (idx >= 0 && idx < nb->len) nb->data[idx] = (uint8_t)(val & 0xFF);
    return nb;
}

void* obo_buffer_toList(void* bp) {
    OboBuffer* b = (OboBuffer*)bp;
    if (!b || b->len == 0) return obo_list_new_i64(0, NULL);
    int64_t* items = (int64_t*)malloc(sizeof(int64_t) * b->len);
    for (int64_t i = 0; i < b->len; i++) items[i] = (int64_t)b->data[i];
    void* list = obo_list_new_i64(b->len, items);
    free(items);
    return list;
}

/* Bag methods — bag is just an OboList, so reuse list functions */
void* obo_bag_add(void* lp, int64_t val) {
    return obo_list_add(lp, val);
}

int64_t obo_bag_has(void* lp, int64_t val) {
    OboList* L = (OboList*)lp;
    if (!L) return 0;
    for (int64_t i = 0; i < L->len; i++) {
        if (L->items[i] == val) return 1;
    }
    return 0;
}

void* obo_bag_remove(void* lp, int64_t val) {
    OboList* L = (OboList*)lp;
    if (!L || L->len == 0) return obo_list_new_i64(0, NULL);
    /* Find first occurrence and skip it */
    int64_t found = -1;
    for (int64_t i = 0; i < L->len; i++) {
        if (L->items[i] == val) { found = i; break; }
    }
    if (found < 0) return lp; /* not found, return same list */
    int64_t new_len = L->len - 1;
    int64_t* items = (int64_t*)malloc(sizeof(int64_t) * (new_len > 0 ? new_len : 1));
    int64_t j = 0;
    for (int64_t i = 0; i < L->len; i++) {
        if (i != found) items[j++] = L->items[i];
    }
    void* result = obo_list_new_i64(new_len, items);
    free(items);
    return result;
}

/* ── Grid2D ──────────────────────────────────────────── */
typedef struct {
    int64_t rows;
    int64_t cols;
    int64_t* data;
} OboGrid2D;

void* obo_grid2d_new(int64_t rows, int64_t cols, int64_t fill) {
    OboGrid2D* g = (OboGrid2D*)malloc(sizeof(OboGrid2D));
    g->rows = rows;
    g->cols = cols;
    int64_t total = rows * cols;
    g->data = (int64_t*)malloc(sizeof(int64_t) * total);
    for (int64_t i = 0; i < total; i++) g->data[i] = fill;
    return g;
}

int64_t obo_grid2d_rows(void* gp) { return ((OboGrid2D*)gp)->rows; }
int64_t obo_grid2d_cols(void* gp) { return ((OboGrid2D*)gp)->cols; }
int64_t obo_grid2d_count(void* gp) { OboGrid2D* g = (OboGrid2D*)gp; return g->rows * g->cols; }

int64_t obo_grid2d_get(void* gp, int64_t r, int64_t c) {
    OboGrid2D* g = (OboGrid2D*)gp;
    if (r < 0 || r >= g->rows || c < 0 || c >= g->cols) return 0;
    return g->data[r * g->cols + c];
}

void* obo_grid2d_set(void* gp, int64_t r, int64_t c, int64_t val) {
    OboGrid2D* g = (OboGrid2D*)gp;
    int64_t total = g->rows * g->cols;
    OboGrid2D* ng = (OboGrid2D*)malloc(sizeof(OboGrid2D));
    ng->rows = g->rows;
    ng->cols = g->cols;
    ng->data = (int64_t*)malloc(sizeof(int64_t) * total);
    memcpy(ng->data, g->data, sizeof(int64_t) * total);
    if (r >= 0 && r < ng->rows && c >= 0 && c < ng->cols) {
        ng->data[r * ng->cols + c] = val;
    }
    return ng;
}

void* obo_grid2d_fill(void* gp, int64_t val) {
    OboGrid2D* g = (OboGrid2D*)gp;
    return obo_grid2d_new(g->rows, g->cols, val);
}

void* obo_grid2d_row(void* gp, int64_t r) {
    OboGrid2D* g = (OboGrid2D*)gp;
    if (r < 0 || r >= g->rows) return obo_list_new_i64(0, NULL);
    return obo_list_new_i64(g->cols, g->data + r * g->cols);
}

void* obo_grid2d_col(void* gp, int64_t c) {
    OboGrid2D* g = (OboGrid2D*)gp;
    if (c < 0 || c >= g->cols) return obo_list_new_i64(0, NULL);
    int64_t* items = (int64_t*)malloc(sizeof(int64_t) * g->rows);
    for (int64_t i = 0; i < g->rows; i++) items[i] = g->data[i * g->cols + c];
    void* list = obo_list_new_i64(g->rows, items);
    free(items);
    return list;
}

void* obo_grid2d_toList(void* gp) {
    OboGrid2D* g = (OboGrid2D*)gp;
    return obo_list_new_i64(g->rows * g->cols, g->data);
}

/* ── Grid3D ──────────────────────────────────────────── */
typedef struct {
    int64_t x, y, z;
    int64_t* data;
} OboGrid3D;

void* obo_grid3d_new(int64_t x, int64_t y, int64_t z, int64_t fill) {
    OboGrid3D* g = (OboGrid3D*)malloc(sizeof(OboGrid3D));
    g->x = x; g->y = y; g->z = z;
    int64_t total = x * y * z;
    g->data = (int64_t*)malloc(sizeof(int64_t) * total);
    for (int64_t i = 0; i < total; i++) g->data[i] = fill;
    return g;
}

int64_t obo_grid3d_x(void* gp) { return ((OboGrid3D*)gp)->x; }
int64_t obo_grid3d_y(void* gp) { return ((OboGrid3D*)gp)->y; }
int64_t obo_grid3d_z(void* gp) { return ((OboGrid3D*)gp)->z; }
int64_t obo_grid3d_count(void* gp) { OboGrid3D* g = (OboGrid3D*)gp; return g->x * g->y * g->z; }

int64_t obo_grid3d_get(void* gp, int64_t gx, int64_t gy, int64_t gz) {
    OboGrid3D* g = (OboGrid3D*)gp;
    if (gx < 0 || gx >= g->x || gy < 0 || gy >= g->y || gz < 0 || gz >= g->z) return 0;
    return g->data[gx * g->y * g->z + gy * g->z + gz];
}

void* obo_grid3d_set(void* gp, int64_t gx, int64_t gy, int64_t gz, int64_t val) {
    OboGrid3D* g = (OboGrid3D*)gp;
    int64_t total = g->x * g->y * g->z;
    OboGrid3D* ng = (OboGrid3D*)malloc(sizeof(OboGrid3D));
    ng->x = g->x; ng->y = g->y; ng->z = g->z;
    ng->data = (int64_t*)malloc(sizeof(int64_t) * total);
    memcpy(ng->data, g->data, sizeof(int64_t) * total);
    if (gx >= 0 && gx < ng->x && gy >= 0 && gy < ng->y && gz >= 0 && gz < ng->z) {
        ng->data[gx * ng->y * ng->z + gy * ng->z + gz] = val;
    }
    return ng;
}

void* obo_grid3d_fill(void* gp, int64_t val) {
    OboGrid3D* g = (OboGrid3D*)gp;
    return obo_grid3d_new(g->x, g->y, g->z, val);
}

void* obo_grid3d_toList(void* gp) {
    OboGrid3D* g = (OboGrid3D*)gp;
    return obo_list_new_i64(g->x * g->y * g->z, g->data);
}

/* ============================================================
   Assert
   ============================================================ */

void* obo_assert_fail(void* msg) {
    /* msg is a char* string from the IR */
    const char* s = (const char*)msg;
    if (s && *s) {
        fprintf(stderr, "Obo: %s 💥\n", s);
    } else {
        fprintf(stderr, "Obo: Assertion failed 💥\n");
    }
    exit(1);
    return NULL; /* unreachable */
}

/* ============================================================
   Reflect — returns a list of {name, value, type} maps
   ============================================================ */

void* obo_reflect(void* obj) {
    if (!obj) {
        return obo_mixed_list_new(0);
    }
    /* Check if obj is a GC-tracked entity; if not, return empty list */
    GCNode* node = gc_find_node(obj);
    if (!node || node->kind != OBO_GC_ENTITY) {
        return obo_mixed_list_new(0);
    }
    /* obj is an OboEntity* — extract type_name and fields map */
    OboEntity* entity = (OboEntity*)obj;
    OboMap* m = entity->fields;
    if (!m) {
        return obo_mixed_list_new(0);
    }

    /* Count total fields by iterating buckets */
    int64_t total = 1 + m->count; /* 1 for __type entry */
    OboMixedList* result = (OboMixedList*)obo_mixed_list_new(total);
    int64_t idx = 0;

    /* First entry: __type */
    {
        OboMap* type_entry = obo_map_alloc_empty();
        obo_gc_register_impl(type_entry, OBO_GC_MAP);
        obo_map_put_str(type_entry, "name", "__type");
        obo_map_put_str(type_entry, "value", entity->type_name ? entity->type_name : "unknown");
        obo_map_put_str(type_entry, "type", "text");
        result->items[idx].tag = OBO_V_MAP;
        result->items[idx].u.ptr = type_entry;
        idx++;
    }

    /* Iterate fields in insertion order */
    for (MapEntry* e = m->order_head; e && idx < total; e = e->order_next) {
        OboMap* entry = obo_map_alloc_empty();
        obo_gc_register_impl(entry, OBO_GC_MAP);
        obo_map_put_str(entry, "name", e->key);

        switch (e->val.tag) {
            case OBO_V_I64:
                obo_map_put_i64(entry, "value", e->val.u.i64);
                obo_map_put_str(entry, "type", "number");
                break;
            case OBO_V_F64:
                obo_map_put_f64(entry, "value", e->val.u.f64);
                obo_map_put_str(entry, "type", "decimal");
                break;
            case OBO_V_STR:
                obo_map_put_str(entry, "value", e->val.u.str);
                obo_map_put_str(entry, "type", "text");
                break;
            case OBO_V_BOOL:
                obo_map_put_bool(entry, "value", e->val.u.i64);
                obo_map_put_str(entry, "type", "flag");
                break;
            case OBO_V_NULL:
                obo_map_put_null(entry, "value");
                obo_map_put_str(entry, "type", "null");
                break;
            case OBO_V_LIST:
                obo_map_put_list(entry, "value", e->val.u.ptr);
                obo_map_put_str(entry, "type", "list");
                break;
            case OBO_V_MAP:
                obo_map_put_map(entry, "value", e->val.u.ptr);
                obo_map_put_str(entry, "type", "map");
                break;
            case OBO_V_ENTITY:
                obo_map_put_entity(entry, "value", e->val.u.ptr);
                obo_map_put_str(entry, "type", "entity");
                break;
            default:
                obo_map_put_null(entry, "value");
                obo_map_put_str(entry, "type", "unknown");
                break;
        }
        result->items[idx].tag = OBO_V_MAP;
        result->items[idx].u.ptr = entry;
        idx++;
    }
    return result;
}

/* --- generated native method dispatch (obo build) --- */
extern int64_t Table_display(void* self);
extern int64_t Database_drop_table(void* self, int64_t);
extern int64_t Database_info(void* self);

int64_t obo_native_call_method_i64(void* entity, const char* method, int64_t argc, int64_t* argv) {
  const char* t = obo_entity_type_name(entity);
  if (strcmp(t, "Table") == 0 && strcmp(method, "display") == 0 && argc == 0) {
    return Table_display(entity);
  }
  if (strcmp(t, "Database") == 0 && strcmp(method, "drop_table") == 0 && argc == 1) {
    return Database_drop_table(entity, argv[0]);
  }
  if (strcmp(t, "Database") == 0 && strcmp(method, "info") == 0 && argc == 0) {
    return Database_info(entity);
  }
  (void)entity; (void)method; (void)argv;
  return 0;
}
