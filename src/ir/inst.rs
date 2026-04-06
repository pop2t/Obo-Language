#![allow(dead_code)]

use std::fmt;

/// A unique ID for a temporary value: %0, %1, %2, ...
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Reg(pub u32);

impl fmt::Display for Reg {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "%{}", self.0)
    }
}

/// A label for a basic block: block_0, block_1, ...
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct BlockId(pub u32);

impl fmt::Display for BlockId {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "block_{}", self.0)
    }
}

/// An immediate constant value in the IR.
#[derive(Debug, Clone, PartialEq)]
pub enum Constant {
    Number(i64),
    Decimal(f64),
    Text(String),
    Char(char),
    Flag(bool),
    Null,
}

impl fmt::Display for Constant {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Constant::Number(n) => write!(f, "{}", n),
            Constant::Decimal(d) => write!(f, "{}", d),
            Constant::Text(s) => write!(f, "\"{}\"", s),
            Constant::Char(c) => write!(f, "'{}'", c),
            Constant::Flag(b) => write!(f, "{}", b),
            Constant::Null => write!(f, "null"),
        }
    }
}

/// An operand: either a register (temp) or an immediate constant.
#[derive(Debug, Clone, PartialEq)]
pub enum Operand {
    Reg(Reg),
    Const(Constant),
}

impl fmt::Display for Operand {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Operand::Reg(r) => write!(f, "{}", r),
            Operand::Const(c) => write!(f, "{}", c),
        }
    }
}

/// Binary operations in the IR.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum BinOp {
    Add,
    Sub,
    Mul,
    Div,
    Mod,
    Eq,
    NotEq,
    Less,
    Greater,
    LessEq,
    GreaterEq,
    And,
    Or,
    Concat,
}

impl fmt::Display for BinOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            BinOp::Add => write!(f, "add"),
            BinOp::Sub => write!(f, "sub"),
            BinOp::Mul => write!(f, "mul"),
            BinOp::Div => write!(f, "div"),
            BinOp::Mod => write!(f, "mod"),
            BinOp::Eq => write!(f, "eq"),
            BinOp::NotEq => write!(f, "neq"),
            BinOp::Less => write!(f, "lt"),
            BinOp::Greater => write!(f, "gt"),
            BinOp::LessEq => write!(f, "le"),
            BinOp::GreaterEq => write!(f, "ge"),
            BinOp::And => write!(f, "and"),
            BinOp::Or => write!(f, "or"),
            BinOp::Concat => write!(f, "concat"),
        }
    }
}

/// Unary operations.
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum UnaryOp {
    Neg,
    Not,
}

impl fmt::Display for UnaryOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            UnaryOp::Neg => write!(f, "neg"),
            UnaryOp::Not => write!(f, "not"),
        }
    }
}

/// A single IR instruction.
///
/// Each instruction writes to at most one register (the `dst`).
/// Control flow uses explicit jumps between blocks.
#[derive(Debug, Clone)]
pub enum Inst {
    /// dst = constant
    Const(Reg, Constant),

    /// dst = src (copy/move)
    Copy(Reg, Operand),

    /// dst = op lhs, rhs
    BinOp(Reg, BinOp, Operand, Operand),

    /// dst = op operand
    UnaryOp(Reg, UnaryOp, Operand),

    /// Load a named variable: dst = load "name"
    Load(Reg, String),

    /// Store to a named variable: store "name", src
    Store(String, Operand),

    /// dst = call func_name(args...)
    Call(Reg, String, Vec<Operand>),

    /// dst = call_method object, "method_name", args...
    CallMethod(Reg, Operand, String, Vec<Operand>),

    /// Intrinsic: show(value)
    Show(Operand),

    /// dst = get_field object, "field_name"
    GetField(Reg, Operand, String),

    /// set_field object, "field_name", value
    SetField(Operand, String, Operand),

    /// dst = get_index object, index
    GetIndex(Reg, Operand, Operand),

    /// set_index object, index, value
    SetIndex(Operand, Operand, Operand),

    /// dst = make_list [elements...]
    MakeList(Reg, Vec<Operand>),

    /// dst = make_map [(key, value)...]
    MakeMap(Reg, Vec<(Operand, Operand)>),

    /// dst = make_entity "TypeName", [(field_name, value)...]
    MakeEntity(Reg, String, Vec<(String, Operand)>),

    /// Unconditional jump
    Jump(BlockId),

    /// Conditional branch: if cond then true_block else false_block
    Branch(Operand, BlockId, BlockId),

    /// Return value(s) from function
    Return(Vec<Operand>),

    /// Phi node for SSA (future use): dst = phi [(val, from_block), ...]
    Phi(Reg, Vec<(Operand, BlockId)>),

    /// dst = make_closure("fn_name", [capture_0, capture_1, ...])
    MakeClosure(Reg, String, Vec<Operand>),

    /// dst = call_closure(closure_reg, [arg_0, arg_1, ...])
    CallClosure(Reg, Operand, Vec<Operand>),

    /// dst = spawn task from a zero-arg closure
    RunTask(Reg, Operand),

    /// wait for a specific task handle
    WaitTask(Operand),

    /// wait for all pending tasks
    WaitAll,

    /// No-op (placeholder)
    Nop,
}

/// A basic block: a label + a sequence of instructions ending with a terminator.
#[derive(Debug, Clone)]
pub struct BasicBlock {
    pub id: BlockId,
    pub insts: Vec<Inst>,
}

impl BasicBlock {
    pub fn new(id: BlockId) -> Self {
        Self { id, insts: Vec::new() }
    }

    pub fn push(&mut self, inst: Inst) {
        self.insts.push(inst);
    }

    pub fn is_terminated(&self) -> bool {
        matches!(
            self.insts.last(),
            Some(Inst::Jump(_)) | Some(Inst::Branch(..)) | Some(Inst::Return(_))
        )
    }
}

/// Parameter kind for native lowering (maps to `i64`, `i8*`, etc.).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum IrParamType {
    I64,
    /// `text`
    Str,
    /// Opaque homogeneous number/bool list (`i8*`)
    List,
    /// Opaque boxed mixed list (`i8*`)
    MixedList,
    /// Opaque map (`i8*`)
    Map,
    /// Opaque entity / actor instance (`i8*`)
    Entity,
    /// Boxed tagged runtime value (`i8*`)
    Dyn,
    /// `flag`
    Bool,
    /// `decimal`
    F64,
    /// Opaque closure handle (`i8*`)
    Closure,
    /// Opaque task handle (`i8*`)
    Task,
}

impl IrParamType {
    pub fn is_pointer(self) -> bool {
        matches!(
            self,
            IrParamType::Str
                | IrParamType::List
                | IrParamType::MixedList
                | IrParamType::Map
                | IrParamType::Entity
                | IrParamType::Dyn
                | IrParamType::Closure
                | IrParamType::Task
        )
    }
}

/// An IR function: name, parameters, and a list of basic blocks.
#[derive(Debug, Clone)]
pub struct IrFunction {
    pub name: String,
    pub params: Vec<String>,
    /// Parallel to `params`; defaults to `I64` when missing (see lowering).
    pub param_types: Vec<IrParamType>,
    pub blocks: Vec<BasicBlock>,
}

/// A bridge (FFI) function declaration carried through to native emit.
#[derive(Debug, Clone)]
pub struct IrBridgeFn {
    pub lib_name: String,
    pub name: String,
    pub param_types: Vec<String>,   // LLVM type strings like "i64", "i8*", "double"
    pub return_type: String,        // LLVM return type ("void", "i64", "i8*", …)
    pub is_variadic: bool,
}

/// The complete IR program.
#[derive(Debug, Clone)]
pub struct IrProgram {
    pub functions: Vec<IrFunction>,
    pub constants: Vec<(String, Constant)>,
    pub bridge_fns: Vec<IrBridgeFn>,
}

impl IrProgram {
    pub fn new() -> Self {
        Self {
            functions: Vec::new(),
            constants: Vec::new(),
            bridge_fns: Vec::new(),
        }
    }
}
