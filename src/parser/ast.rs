#![allow(dead_code)]

use crate::lexer::token::Span;

pub type Program = Vec<Declaration>;

// ============================================================
// Top-Level Declarations
// ============================================================

#[derive(Debug, Clone)]
pub enum Declaration {
    Function(FunctionDecl),
    Entity(EntityDecl),
    Actor(ActorDecl),
    Choice(ChoiceDecl),
    Trait(TraitDecl),
    Use(UseDecl),
    TypeAlias(TypeAliasDecl),
    Extend(ExtendDecl),
    Const(ConstDecl),
    Bridge(BridgeDecl),
    ConditionalCompilation(ConditionalBlock),
    Statement(Statement),
}

#[derive(Debug, Clone)]
pub struct FunctionDecl {
    pub name: String,
    pub params: Vec<Param>,
    pub body: Vec<Statement>,
    pub is_public: bool,
    pub is_static: bool,
    pub is_abstract: bool,
    pub doc_comments: Vec<String>,
    pub attributes: Vec<Attribute>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct Param {
    pub name: String,
    pub type_annotation: Option<TypeExpr>,
    pub default_value: Option<Expr>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct EntityDecl {
    pub name: String,
    pub fields: Vec<FieldDecl>,
    pub is_public: bool,
    pub doc_comments: Vec<String>,
    pub attributes: Vec<Attribute>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ActorDecl {
    pub name: String,
    pub parent: Option<String>,
    pub traits: Vec<String>,
    pub generic_params: Vec<String>,
    pub members: Vec<ActorMember>,
    pub is_public: bool,
    pub is_abstract: bool,
    pub is_sealed: bool,
    pub is_system: bool,
    pub doc_comments: Vec<String>,
    pub attributes: Vec<Attribute>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub enum ActorMember {
    Field(FieldDecl),
    Method(FunctionDecl),
    Property(PropertyDecl),
    Event(EventDecl),
    Operator(OperatorDecl),
    Const(ConstDecl),
}

#[derive(Debug, Clone)]
pub struct FieldDecl {
    pub name: String,
    pub type_annotation: Option<TypeExpr>,
    pub default_value: Option<Expr>,
    pub is_public: bool,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct PropertyDecl {
    pub name: String,
    pub getter: Option<Vec<Statement>>,
    pub setter: Option<(String, Vec<Statement>)>, // (param_name, body)
    pub is_public: bool,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct EventDecl {
    pub name: String,
    pub is_public: bool,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct OperatorDecl {
    pub op: String,
    pub param: Param,
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ChoiceDecl {
    pub name: String,
    pub variants: Vec<ChoiceVariant>,
    pub is_public: bool,
    pub doc_comments: Vec<String>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ChoiceVariant {
    pub name: String,
    pub fields: Vec<Param>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct TraitDecl {
    pub name: String,
    pub members: Vec<TraitMember>,
    pub is_public: bool,
    pub doc_comments: Vec<String>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub enum TraitMember {
    Field(FieldDecl),
    Method(FunctionDecl),
}

#[derive(Debug, Clone)]
pub struct UseDecl {
    pub path: Vec<String>,
    pub specific: Option<Vec<String>>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct TypeAliasDecl {
    pub name: String,
    pub value: TypeExpr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ExtendDecl {
    pub target: String,
    pub methods: Vec<FunctionDecl>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ConstDecl {
    pub name: String,
    pub value: Expr,
    pub is_public: bool,
    pub doc_comments: Vec<String>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ConditionalBlock {
    pub condition: String,
    pub value: String,
    pub then_body: Vec<Declaration>,
    pub else_body: Option<Vec<Declaration>>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct BridgeDecl {
    pub lib_name: String,
    pub functions: Vec<BridgeFnDecl>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct BridgeFnDecl {
    pub name: String,
    pub params: Vec<BridgeParam>,
    pub return_type: Option<TypeExpr>,
    pub is_variadic: bool,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct BridgeParam {
    pub name: String,
    pub type_annotation: TypeExpr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct Attribute {
    pub name: String,
    pub args: Vec<Expr>,
    pub span: Span,
}

// ============================================================
// Type Expressions
// ============================================================

#[derive(Debug, Clone)]
pub enum TypeExpr {
    Named(String, Span),
    Generic(String, Vec<TypeExpr>, Span),   // list of number
    MapType(Box<TypeExpr>, Box<TypeExpr>, Span), // map of K to V
    Union(Vec<TypeExpr>, Span),             // number or text
}

// ============================================================
// Statements
// ============================================================

#[derive(Debug, Clone)]
pub enum Statement {
    VarDecl(VarDeclStmt),
    Assignment(AssignStmt),
    MultiAssignment(MultiAssignStmt),
    Expr(Expr),
    Show(ShowStmt),
    Prompt(PromptStmt),
    If(IfStmt),
    While(WhileStmt),
    Forever(ForeverStmt),
    Count(CountStmt),
    ForIn(ForInStmt),
    Check(CheckStmt),
    Out(OutStmt),
    Stop(Span),
    Restart(Span),
    Wait(WaitStmt),
    Run(RunStmt),
    Emit(EmitStmt),
    PossibleBlock(PossibleBlockStmt),
    SafeBlock(Vec<Statement>, Span),
    MetalBlock(Vec<Statement>, Span),
    Block(Vec<Statement>),
    Assert(AssertStmt),
}

#[derive(Debug, Clone)]
pub struct VarDeclStmt {
    pub name: String,
    pub type_annotation: Option<TypeExpr>,
    pub initializer: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct AssignStmt {
    pub target: Expr,
    pub value: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct MultiAssignStmt {
    pub targets: Vec<String>,
    pub value: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ShowStmt {
    pub value: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct PromptStmt {
    pub message: Expr,
    pub target: String,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct IfStmt {
    pub condition: Expr,
    pub then_body: Vec<Statement>,
    pub else_body: Option<Vec<Statement>>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct WhileStmt {
    pub condition: Expr,
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ForeverStmt {
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct CountStmt {
    pub var_name: String,
    pub start: Expr,
    pub end: Expr,
    pub step: Option<Expr>,
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct ForInStmt {
    pub var_name: String,
    pub iterable: Expr,
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct CheckStmt {
    pub value: Expr,
    pub arms: Vec<CheckArm>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct CheckArm {
    pub pattern: CheckPattern,
    pub body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub enum CheckPattern {
    Value(Expr),                                    // is "done"
    Comparison(String, Expr),                       // is < 50
    TypeCheck(String, Option<Vec<String>>),          // is Weapon  or  is Circle(r)
    TypeWithGuard(String, Option<Vec<String>>, Expr), // is Weapon and damage > 50
    Null,                                           // is null
}

#[derive(Debug, Clone)]
pub struct OutStmt {
    pub values: Vec<Expr>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct WaitStmt {
    pub duration: Expr,
    pub is_wait_for: bool,
    pub is_wait_for_all: bool,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct RunStmt {
    pub expr: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct EmitStmt {
    pub value: Expr,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct PossibleBlockStmt {
    pub body: Vec<Statement>,
    pub error_name: Option<String>,
    pub else_body: Vec<Statement>,
    pub span: Span,
}

#[derive(Debug, Clone)]
pub struct AssertStmt {
    pub condition: Expr,
    pub message: Option<Expr>,
    pub span: Span,
}

// ============================================================
// Expressions
// ============================================================

#[derive(Debug, Clone)]
pub enum Expr {
    NumberLit(i64, Span),
    DecimalLit(f64, Span),
    StringLit(String, Span),
    CharLit(char, Span),
    BoolLit(bool, Span),
    NullLit(Span),

    Identifier(String, Span),

    Binary(Box<Expr>, BinOp, Box<Expr>, Span),
    Unary(UnaryOp, Box<Expr>, Span),
    Logical(Box<Expr>, LogicalOp, Box<Expr>, Span),

    Call(Box<Expr>, Vec<CallArg>, Span),
    MemberAccess(Box<Expr>, String, Span),
    IndexAccess(Box<Expr>, Box<Expr>, Span),

    ListLiteral(Vec<Expr>, Span),
    MapLiteral(Vec<(Expr, Expr)>, Span),

    EntityInit(String, Vec<FieldInit>, Span),

    Cast(Box<TypeExpr>, Box<Expr>, Span),
    SafeCast(Box<TypeExpr>, Box<Expr>, Box<Expr>, Span), // (type)expr if possible else fallback

    InlineIf(Box<Expr>, Box<Expr>, Box<Expr>, Span), // value if cond else fallback
    IfPossibleElse(Box<Expr>, Box<Expr>, Span),       // expr if possible else fallback

    Range(Box<Expr>, Box<Expr>, Option<Box<Expr>>, Span), // start to end [step x]

    Run(Box<Expr>, Span),

    ChannelCreate(Span),

    AtomicCreate(Option<Box<Expr>>, Span),

    Action(Vec<Param>, Vec<Statement>, Span),
    ArrowAction(Vec<Param>, Box<Expr>, Span), // s => s * 2

    Pipe(Box<Expr>, Box<Expr>, Span), // expr |> func  or  expr then func

    Interpolation(Vec<Expr>, Span),
}

impl Expr {
    pub fn span(&self) -> Span {
        match self {
            Expr::NumberLit(_, s) => *s,
            Expr::DecimalLit(_, s) => *s,
            Expr::StringLit(_, s) => *s,
            Expr::CharLit(_, s) => *s,
            Expr::BoolLit(_, s) => *s,
            Expr::NullLit(s) => *s,
            Expr::Identifier(_, s) => *s,
            Expr::Binary(_, _, _, s) => *s,
            Expr::Unary(_, _, s) => *s,
            Expr::Logical(_, _, _, s) => *s,
            Expr::Call(_, _, s) => *s,
            Expr::MemberAccess(_, _, s) => *s,
            Expr::IndexAccess(_, _, s) => *s,
            Expr::ListLiteral(_, s) => *s,
            Expr::MapLiteral(_, s) => *s,
            Expr::EntityInit(_, _, s) => *s,
            Expr::Cast(_, _, s) => *s,
            Expr::SafeCast(_, _, _, s) => *s,
            Expr::InlineIf(_, _, _, s) => *s,
            Expr::IfPossibleElse(_, _, s) => *s,
            Expr::Range(_, _, _, s) => *s,
            Expr::Run(_, s) => *s,
            Expr::ChannelCreate(s) => *s,
            Expr::AtomicCreate(_, s) => *s,
            Expr::Action(_, _, s) => *s,
            Expr::ArrowAction(_, _, s) => *s,
            Expr::Pipe(_, _, s) => *s,
            Expr::Interpolation(_, s) => *s,
        }
    }
}

#[derive(Debug, Clone)]
pub struct CallArg {
    pub name: Option<String>,
    pub value: Expr,
}

#[derive(Debug, Clone)]
pub struct FieldInit {
    pub name: String,
    pub value: Expr,
    pub span: Span,
}

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
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum UnaryOp {
    Neg,
    Not,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum LogicalOp {
    And,
    Or,
}

impl std::fmt::Display for BinOp {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            BinOp::Add => write!(f, "+"),
            BinOp::Sub => write!(f, "-"),
            BinOp::Mul => write!(f, "*"),
            BinOp::Div => write!(f, "/"),
            BinOp::Mod => write!(f, "%"),
            BinOp::Eq => write!(f, "=="),
            BinOp::NotEq => write!(f, "!="),
            BinOp::Less => write!(f, "<"),
            BinOp::Greater => write!(f, ">"),
            BinOp::LessEq => write!(f, "<="),
            BinOp::GreaterEq => write!(f, ">="),
        }
    }
}

impl std::fmt::Display for LogicalOp {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            LogicalOp::And => write!(f, "and"),
            LogicalOp::Or => write!(f, "or"),
        }
    }
}
