use std::collections::HashMap;
use std::collections::VecDeque;
use std::fmt;
use std::hash::{Hash, Hasher};
use std::sync::{Arc, Mutex, Condvar};
use std::sync::atomic::{AtomicI64, Ordering};

use crate::parser::ast::{Param, Statement};

#[derive(Debug, Clone)]
pub enum Value {
    Number(i64),
    Decimal(f64),
    Text(String),
    Char(char),
    Flag(bool),
    Null,
    List(Vec<Value>),
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
    Pointer(u64),
    Pair(Box<Value>, Box<Value>),
    Bag(Vec<Value>),
    Buffer(Vec<u8>),
    Grid2D { rows: usize, cols: usize, data: Vec<Value> },
    Grid3D { x: usize, y: usize, z: usize, data: Vec<Value> },
    ChoiceValue(String, String, Vec<Value>), // (choice_name, variant_name, data)
    Function(OboFunction),
    Action(OboAction),
    BuiltinFn(String),
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
            Value::Pointer(_) => "pointer",
            Value::Pair(_, _) => "pair",
            Value::Bag(_) => "bag",
            Value::Buffer(_) => "buffer",
            Value::Grid2D { .. } => "grid2d",
            Value::Grid3D { .. } => "grid3d",
            Value::ChoiceValue(name, _, _) => name,
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
            Value::Decimal(n) => *n != 0.0,
            Value::Text(s) => !s.is_empty(),
            Value::List(l) => !l.is_empty(),
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
            Value::Decimal(n) => Some(*n as i64),
            Value::Text(s) => s.parse().ok(),
            Value::Flag(b) => Some(if *b { 1 } else { 0 }),
            _ => None,
        }
    }

    pub fn to_decimal(&self) -> Option<f64> {
        match self {
            Value::Number(n) => Some(*n as f64),
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
            Value::Pointer(p) => write!(f, "<pointer 0x{:x}>", p),
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
            (Value::Pointer(a), Value::Pointer(b)) => a == b,
            (Value::Pair(a1, a2), Value::Pair(b1, b2)) => a1 == b1 && a2 == b2,
            (Value::Bag(a), Value::Bag(b)) => a == b,
            (Value::Buffer(a), Value::Buffer(b)) => a == b,
            (Value::Grid2D { rows: r1, cols: c1, data: d1 }, Value::Grid2D { rows: r2, cols: c2, data: d2 }) => r1 == r2 && c1 == c2 && d1 == d2,
            (Value::Grid3D { x: x1, y: y1, z: z1, data: d1 }, Value::Grid3D { x: x2, y: y2, z: z2, data: d2 }) => x1 == x2 && y1 == y2 && z1 == z2 && d1 == d2,
            (Value::ChoiceValue(_, a, _), Value::ChoiceValue(_, b, _)) => a == b,
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
            Value::Pointer(p) => p.hash(state),
            Value::Instance(i) => i.instance_id.hash(state),
            Value::Null => {}
            _ => {}
        }
    }
}
