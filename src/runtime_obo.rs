//! Embedded self-hosted OBO runtime modules + C bridge.
//! Used when building with `--runtime obo`.

/// C bridge that maps obo_* ABI names to rt_* implementations.
pub static OBO_RT_BRIDGE_C: &str = include_str!("../runtime/obo_rt_bridge.c");

/// Master import file — pulls in all OBO runtime modules.
pub static OBO_RT_ALL: &str = include_str!("../runtime/obo_rt_all.obo");

/// Individual OBO runtime modules (written to temp dir for import resolution).
pub static OBO_STRING: &str = include_str!("../runtime/obo_string.obo");
pub static OBO_VALUE:  &str = include_str!("../runtime/obo_value.obo");
pub static OBO_LIST:   &str = include_str!("../runtime/obo_list.obo");
pub static OBO_GC:     &str = include_str!("../runtime/obo_gc.obo");
pub static OBO_MAP:    &str = include_str!("../runtime/obo_map.obo");
pub static OBO_ENTITY: &str = include_str!("../runtime/obo_entity.obo");

/// All module files for temp-dir extraction. (name, source)
pub static MODULES: &[(&str, &str)] = &[
    ("obo_string.obo", OBO_STRING),
    ("obo_value.obo",  OBO_VALUE),
    ("obo_list.obo",   OBO_LIST),
    ("obo_gc.obo",     OBO_GC),
    ("obo_map.obo",    OBO_MAP),
    ("obo_entity.obo", OBO_ENTITY),
    ("obo_rt_all.obo", OBO_RT_ALL),
];
