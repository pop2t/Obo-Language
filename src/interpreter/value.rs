use std::collections::HashMap;
use std::collections::VecDeque;
use std::fmt;
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
    Map(Vec<(Value, Value)>),
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
    pub fields: HashMap<String, Value>,
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
                for (i, (k, v)) in inst.fields.iter().enumerate() {
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
