//! Embedded minimal C runtime (see `../runtime/obo_rt.c`) — linked by `obo build` with clang.

pub static OBO_RT_C: &str = include_str!("../runtime/obo_rt.c");
