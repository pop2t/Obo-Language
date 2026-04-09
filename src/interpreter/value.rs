use std::collections::HashMap;
use std::collections::VecDeque;
use std::fmt;
use std::hash::{Hash, Hasher};
use std::sync::{Arc, Mutex, Condvar};
use std::sync::atomic::{AtomicI64, Ordering};

use crate::parser::ast::{Param, Statement};

/// Fixed-width integer widths (separate from number/i64 and byte/u8).
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum IntWidth {
    I8, I16, I32, U16, U32, U64,
}

impl IntWidth {
    pub fn name(&self) -> &'static str {
        match self {
            IntWidth::I8 => "i8", IntWidth::I16 => "i16", IntWidth::I32 => "i32",
            IntWidth::U16 => "u16", IntWidth::U32 => "u32", IntWidth::U64 => "u64",
        }
    }

    pub fn min(&self) -> i128 {
        match self {
            IntWidth::I8 => -128, IntWidth::I16 => -32768, IntWidth::I32 => -2147483648,
            IntWidth::U16 => 0, IntWidth::U32 => 0, IntWidth::U64 => 0,
        }
    }

    pub fn max(&self) -> i128 {
        match self {
            IntWidth::I8 => 127, IntWidth::I16 => 32767, IntWidth::I32 => 2147483647,
            IntWidth::U16 => 65535, IntWidth::U32 => 4294967295, IntWidth::U64 => u64::MAX as i128,
        }
    }

    pub fn truncate(&self, val: i64) -> i64 {
        match self {
            IntWidth::I8 => val as i8 as i64,
            IntWidth::I16 => val as i16 as i64,
            IntWidth::I32 => val as i32 as i64,
            IntWidth::U16 => val as u16 as i64,
            IntWidth::U32 => val as u32 as i64,
            IntWidth::U64 => val, // u64 and i64 are same width
        }
    }
}

#[derive(Debug, Clone)]
pub enum Value {
    Number(i64),
    Decimal(f64),
    Text(String),
    Char(char),
    Flag(bool),
    Null,
    List(Vec<Value>),
    F64List(Vec<f64>),
    Set(Vec<Value>),
    Queue(Vec<Value>),
    Stack(Vec<Value>),
    Map(OboMap),
    Instance(OboInstance),
    EventRef(OboEventRef),
    Task(OboTask),
    Channel(OboChannel),
    Atomic(OboAtomic),
    Byte(u8),
    FixedInt(i64, IntWidth),
    Float32(f32),
    Pointer(u64),
    Handle(u64),
    Pair(Box<Value>, Box<Value>),
    Bag(Vec<Value>),
    Buffer(Vec<u8>),
    Grid2D { rows: usize, cols: usize, data: Vec<Value> },
    Grid3D { x: usize, y: usize, z: usize, data: Vec<Value> },
    ChoiceValue(String, String, Vec<Value>), // (choice_name, variant_name, data)
    TextBuilder(Arc<Mutex<Vec<u8>>>),
    Arena(Arc<Mutex<OboArenaInterp>>),
    Function(OboFunction),
    Action(OboAction),
    BuiltinFn(String),
}

#[derive(Debug, Clone)]
pub struct OboArenaInterp {
    pub data: Vec<u8>,
    pub used: usize,
    pub cap: usize,
}

impl OboArenaInterp {
    pub fn new(cap: usize) -> Self {
        let cap = if cap < 64 { 64 } else { cap };
        Self { data: vec![0u8; cap], used: 0, cap }
    }
    pub fn alloc(&mut self, size: usize) -> usize {
        let aligned = (self.used + 7) & !7;
        let needed = aligned + size;
        if needed > self.cap {
            let new_cap = std::cmp::max(self.cap * 2, needed);
            self.data.resize(new_cap, 0);
            self.cap = new_cap;
        }
        self.used = needed;
        aligned // return offset
    }
    pub fn reset(&mut self) { self.used = 0; }
}

#[derive(Debug, Clone)]
pub struct OboInstance {
    pub instance_id: u64,
    pub type_name: String,
    pub fields: Arc<Mutex<HashMap<String, Value>>>,
}

impl OboInstance {
    pub fn new(instance_id: u64, type_name: String, fields: HashMap<String, Value>) -> Self {
        Self {
            instance_id,
            type_name,
            fields: Arc::new(Mutex::new(fields)),
        }
    }

    pub fn get_field(&self, name: &str) -> Option<Value> {
        self.fields.lock().unwrap().get(name).cloned()
    }

    pub fn set_field(&self, name: String, value: Value) {
        self.fields.lock().unwrap().insert(name, value);
    }

    pub fn snapshot_fields(&self) -> HashMap<String, Value> {
        self.fields.lock().unwrap().clone()
    }
}

#[derive(Debug, Clone)]
pub struct OboEventRef {
    pub instance_id: u64,
    pub owner_type: String,
    pub event_name: String,
}

#[derive(Debug, Clone)]
pub struct OboTask {
    pub task_id: u64,
}

#[derive(Debug, Clone)]
pub struct OboChannel {
    pub inner: Arc<(Mutex<VecDeque<Value>>, Condvar)>,
}

#[derive(Debug, Clone)]
pub struct OboAtomic {
    pub inner: Arc<AtomicI64>,
}

#[derive(Debug, Clone)]
pub struct OboFunction {
    pub name: String,
    pub params: Vec<Param>,
    pub body: Vec<Statement>,
    #[allow(dead_code)]
    pub closure_env: Option<usize>, // environment id for closures
}

#[derive(Debug, Clone)]
pub struct OboAction {
    pub params: Vec<Param>,
    pub body: ActionBody,
    pub captured_env: HashMap<String, Value>,
}

#[derive(Debug, Clone)]
pub enum ActionBody {
    Block(Vec<Statement>),
    Expr(Box<crate::parser::ast::Expr>),
}

/// Ordered hash map for OBO map values. Preserves insertion order with O(1) lookups.
#[derive(Debug, Clone)]
pub struct OboMap {
    entries: Vec<(Value, Value)>,
    index: HashMap<Value, usize>,
}

impl OboMap {
    pub fn new() -> Self {
        OboMap { entries: Vec::new(), index: HashMap::new() }
    }

    pub fn from_entries(entries: Vec<(Value, Value)>) -> Self {
        let mut index = HashMap::with_capacity(entries.len());
        for (i, (k, _)) in entries.iter().enumerate() {
            index.insert(k.clone(), i);
        }
        OboMap { entries, index }
    }

    pub fn get(&self, key: &Value) -> Option<&Value> {
        self.index.get(key).map(|&i| &self.entries[i].1)
    }

    pub fn has(&self, key: &Value) -> bool {
        self.index.contains_key(key)
    }

    pub fn set(&mut self, key: Value, val: Value) {
        if let Some(&i) = self.index.get(&key) {
            self.entries[i].1 = val;
        } else {
            let i = self.entries.len();
            self.index.insert(key.clone(), i);
            self.entries.push((key, val));
        }
    }

    pub fn remove(&self, key: &Value) -> Self {
        let entries: Vec<(Value, Value)> = self.entries.iter()
            .filter(|(k, _)| k != key)
            .cloned()
            .collect();
        Self::from_entries(entries)
    }

    pub fn len(&self) -> usize { self.entries.len() }
    pub fn is_empty(&self) -> bool { self.entries.is_empty() }
    pub fn iter(&self) -> std::slice::Iter<'_, (Value, Value)> { self.entries.iter() }
    pub fn keys(&self) -> impl Iterator<Item = &Value> { self.entries.iter().map(|(k, _)| k) }
    pub fn values(&self) -> impl Iterator<Item = &Value> { self.entries.iter().map(|(_, v)| v) }
    pub fn entries(&self) -> &[(Value, Value)] { &self.entries }
    pub fn into_entries(self) -> Vec<(Value, Value)> { self.entries }
}

impl PartialEq for OboMap {
    fn eq(&self, other: &Self) -> bool {
        self.entries == other.entries
    }
}

impl Value {
    pub fn type_name(&self) -> &str {
        match self {
            Value::Number(_) => "number",
            Value::Decimal(_) => "decimal",
            Value::Text(_) => "text",
            Value::Char(_) => "char",
            Value::Flag(_) => "flag",
            Value::Null => "null",
            Value::List(_) => "list",
            Value::F64List(_) => "list",
            Value::Set(_) => "set",
            Value::Queue(_) => "queue",
            Value::Stack(_) => "stack",
            Value::Map(_) => "map",
            Value::Instance(inst) => &inst.type_name,
            Value::EventRef(_) => "event",
            Value::Task(_) => "task",
            Value::Channel(_) => "channel",
            Value::Atomic(_) => "atomic",
            Value::Byte(_) => "byte",
            Value::FixedInt(_, w) => w.name(),
            Value::Float32(_) => "f32",
            Value::Pointer(_) => "pointer",
            Value::Handle(_) => "handle",
            Value::Pair(_, _) => "pair",
            Value::Bag(_) => "bag",
            Value::Buffer(_) => "buffer",
            Value::Grid2D { .. } => "grid2d",
            Value::Grid3D { .. } => "grid3d",
            Value::ChoiceValue(name, _, _) => name,
            Value::TextBuilder(_) => "TextBuilder",
            Value::Arena(_) => "Arena",
            Value::Function(_) => "function",
            Value::Action(_) => "action",
            Value::BuiltinFn(_) => "function",
        }
    }

    pub fn is_truthy(&self) -> bool {
        match self {
            Value::Flag(b) => *b,
            Value::Null => false,
            Value::Number(n) => *n != 0,
            Value::Byte(n) => *n != 0,
            Value::FixedInt(n, _) => *n != 0,
            Value::Float32(n) => *n != 0.0,
            Value::Decimal(n) => *n != 0.0,
            Value::Text(s) => !s.is_empty(),
            Value::List(l) => !l.is_empty(),
            Value::F64List(l) => !l.is_empty(),
            Value::Set(l) => !l.is_empty(),
            Value::Queue(l) => !l.is_empty(),
            Value::Stack(l) => !l.is_empty(),
            Value::Bag(l) => !l.is_empty(),
            Value::Buffer(b) => !b.is_empty(),
            Value::Pair(_, _) => true,
            Value::Grid2D { data, .. } => !data.is_empty(),
            Value::Grid3D { data, .. } => !data.is_empty(),
            _ => true,
        }
    }

    pub fn to_number(&self) -> Option<i64> {
        match self {
            Value::Number(n) => Some(*n),
            Value::Byte(n) => Some(*n as i64),
            Value::FixedInt(n, _) => Some(*n),
            Value::Float32(n) => Some(*n as i64),
            Value::Decimal(n) => Some(*n as i64),
            Value::Text(s) => s.parse().ok(),
            Value::Flag(b) => Some(if *b { 1 } else { 0 }),
            _ => None,
        }
    }

    pub fn to_decimal(&self) -> Option<f64> {
        match self {
            Value::Number(n) => Some(*n as f64),
            Value::Float32(n) => Some(*n as f64),
            Value::Decimal(n) => Some(*n),
            Value::Text(s) => s.parse().ok(),
            _ => None,
        }
    }
}

impl fmt::Display for Value {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Value::Number(n) => write!(f, "{}", n),
            Value::Decimal(n) => write!(f, "{}", n),
            Value::Text(s) => write!(f, "{}", s),
            Value::Char(c) => write!(f, "{}", c),
            Value::Flag(b) => write!(f, "{}", b),
            Value::Null => write!(f, "null"),
            Value::List(items) => {
                write!(f, "[")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}", item)?;
                }
                write!(f, "]")
            }
            Value::F64List(items) => {
                write!(f, "[")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}", item)?;
                }
                write!(f, "]")
            }
            Value::Set(items) => {
                write!(f, "set(")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}", item)?;
                }
                write!(f, ")")
            }
            Value::Queue(items) => {
                write!(f, "queue(")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}", item)?;
                }
                write!(f, ")")
            }
            Value::Stack(items) => {
                write!(f, "stack(")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}", item)?;
                }
                write!(f, ")")
            }
            Value::Map(pairs) => {
                write!(f, "[")?;
                for (i, (k, v)) in pairs.iter().enumerate() {
                    if i > 0 {
                        write!(f, ", ")?;
                    }
                    write!(f, "{}: {}", k, v)?;
                }
                write!(f, "]")
            }
            Value::Instance(inst) => {
                write!(f, "{} {{ ", inst.type_name)?;
                let fields = inst.snapshot_fields();
                for (i, (k, v)) in fields.iter().enumerate() {
                    if i > 0 {
                        write!(f, "; ")?;
                    }
                    write!(f, "{} = {}", k, v)?;
                }
                write!(f, " }}")
            }
            Value::EventRef(event) => {
                write!(f, "<event {}.{}>", event.owner_type, event.event_name)
            }
            Value::Task(task) => write!(f, "<task {}>", task.task_id),
            Value::Channel(_) => write!(f, "<channel>"),
            Value::Atomic(a) => write!(f, "{}", a.inner.load(Ordering::SeqCst)),
            Value::Byte(b) => write!(f, "{}", b),
            Value::FixedInt(n, _) => write!(f, "{}", n),
            Value::Float32(n) => write!(f, "{}", n),
            Value::Pointer(p) => write!(f, "<pointer 0x{:x}>", p),
            Value::Handle(h) => write!(f, "<handle 0x{:x}>", h),
            Value::Pair(a, b) => write!(f, "pair({}, {})", a, b),
            Value::Bag(items) => {
                write!(f, "bag(")?;
                for (i, item) in items.iter().enumerate() {
                    if i > 0 { write!(f, ", ")?; }
                    write!(f, "{}", item)?;
                }
                write!(f, ")")
            }
            Value::Buffer(bytes) => write!(f, "<buffer {} bytes>", bytes.len()),
            Value::Grid2D { rows, cols, .. } => write!(f, "<grid2d {}x{}>", rows, cols),
            Value::Grid3D { x, y, z, .. } => write!(f, "<grid3d {}x{}x{}>", x, y, z),
            Value::ChoiceValue(_, variant, data) => {
                if data.is_empty() {
                    write!(f, "{}", variant)
                } else {
                    write!(f, "{}(", variant)?;
                    for (i, d) in data.iter().enumerate() {
                        if i > 0 {
                            write!(f, ", ")?;
                        }
                        write!(f, "{}", d)?;
                    }
                    write!(f, ")")
                }
            }
            Value::TextBuilder(buf) => {
                let data = buf.lock().unwrap();
                write!(f, "<TextBuilder {} bytes>", data.len())
            }
            Value::Arena(a) => {
                let arena = a.lock().unwrap();
                write!(f, "<Arena {}/{} bytes>", arena.used, arena.cap)
            }
            Value::Function(func) => write!(f, "<function {}>", func.name),
            Value::Action(_) => write!(f, "<action>"),
            Value::BuiltinFn(name) => write!(f, "<builtin {}>", name),
        }
    }
}

impl PartialEq for Value {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (Value::Number(a), Value::Number(b)) => a == b,
            (Value::Decimal(a), Value::Decimal(b)) => a == b,
            (Value::Number(a), Value::Decimal(b)) => (*a as f64) == *b,
            (Value::Decimal(a), Value::Number(b)) => *a == (*b as f64),
            (Value::Text(a), Value::Text(b)) => a == b,
            (Value::Char(a), Value::Char(b)) => a == b,
            (Value::Flag(a), Value::Flag(b)) => a == b,
            (Value::Null, Value::Null) => true,
            (Value::Task(a), Value::Task(b)) => a.task_id == b.task_id,
            (Value::Channel(a), Value::Channel(b)) => Arc::ptr_eq(&a.inner, &b.inner),
            (Value::Atomic(a), Value::Atomic(b)) => Arc::ptr_eq(&a.inner, &b.inner),
            (Value::Instance(a), Value::Instance(b)) => a.instance_id == b.instance_id,
            (Value::Byte(a), Value::Byte(b)) => a == b,
            (Value::FixedInt(a, wa), Value::FixedInt(b, wb)) => wa == wb && a == b,
            (Value::FixedInt(a, _), Value::Number(b)) => a == b,
            (Value::Number(a), Value::FixedInt(b, _)) => a == b,
            (Value::Float32(a), Value::Float32(b)) => a == b,
            (Value::Float32(a), Value::Decimal(b)) => (*a as f64) == *b,
            (Value::Decimal(a), Value::Float32(b)) => *a == (*b as f64),
            (Value::Pointer(a), Value::Pointer(b)) => a == b,
            (Value::Handle(a), Value::Handle(b)) => a == b,
            (Value::Pair(a1, a2), Value::Pair(b1, b2)) => a1 == b1 && a2 == b2,
            (Value::Bag(a), Value::Bag(b)) => a == b,
            (Value::Buffer(a), Value::Buffer(b)) => a == b,
            (Value::Grid2D { rows: r1, cols: c1, data: d1 }, Value::Grid2D { rows: r2, cols: c2, data: d2 }) => r1 == r2 && c1 == c2 && d1 == d2,
            (Value::Grid3D { x: x1, y: y1, z: z1, data: d1 }, Value::Grid3D { x: x2, y: y2, z: z2, data: d2 }) => x1 == x2 && y1 == y2 && z1 == z2 && d1 == d2,
            (Value::ChoiceValue(_, a, _), Value::ChoiceValue(_, b, _)) => a == b,
            (Value::F64List(a), Value::F64List(b)) => a.len() == b.len() && a.iter().zip(b.iter()).all(|(x, y)| x == y),
            (Value::TextBuilder(a), Value::TextBuilder(b)) => Arc::ptr_eq(a, b),
            (Value::Arena(a), Value::Arena(b)) => Arc::ptr_eq(a, b),
            _ => false,
        }
    }
}

impl Eq for Value {}

impl Hash for Value {
    fn hash<H: Hasher>(&self, state: &mut H) {
        std::mem::discriminant(self).hash(state);
        match self {
            // Number and Decimal share tag 0 so Number(1) and Decimal(1.0) hash equally
            Value::Number(n) => { 0u8.hash(state); (*n as f64).to_bits().hash(state); }
            Value::Decimal(f) => { 0u8.hash(state); f.to_bits().hash(state); }
            Value::Text(s) => s.hash(state),
            Value::Char(c) => c.hash(state),
            Value::Flag(b) => b.hash(state),
            Value::Byte(b) => b.hash(state),
            Value::Float32(f) => { 2u8.hash(state); f.to_bits().hash(state); }
            Value::FixedInt(n, w) => { n.hash(state); w.hash(state); }
            Value::Pointer(p) => p.hash(state),
            Value::Handle(h) => h.hash(state),
            Value::F64List(items) => { for x in items { x.to_bits().hash(state); } }
            Value::Instance(i) => i.instance_id.hash(state),
            Value::Null => {}
            _ => {}
        }
    }
}
