use std::fmt;

#[derive(Debug, Clone, PartialEq)]
pub struct Token {
    pub kind: TokenKind,
    pub lexeme: String,
    pub span: Span,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub struct Span {
    pub line: usize,
    pub column: usize,
    pub length: usize,
}

impl fmt::Display for Span {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}:{}", self.line, self.column)
    }
}

impl fmt::Display for Token {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:?}({:?}, {})", self.kind, self.lexeme, self.span)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum TokenKind {
    // --- Literals ---
    NumberLiteral,
    DecimalLiteral,
    StringLiteral,
    MultiLineStringLiteral,
    CharLiteral,
    #[allow(dead_code)]
    BitsLiteral,

    // --- Interpolation (inside strings) ---
    InterpolationStart, // {
    InterpolationEnd,   // }

    // --- Identifier ---
    Identifier,

    // --- Type keywords ---
    KwNumber,
    KwDecimal,
    KwText,
    KwChar,
    KwFlag,
    KwByte,
    KwBits,
    KwPointer,
    KwAtomic,
    KwNull,

    // --- Boolean literals ---
    KwTrue,
    KwFalse,

    // --- Declaration keywords ---
    KwFunction,
    KwEntity,
    KwActor,
    KwChoice,
    KwTrait,
    KwSystem,
    KwAbstract,
    KwSealed,
    KwStatic,
    KwPublic,
    KwProperty,
    KwExtend,
    KwType,
    KwConst,
    KwEvent,
    KwOperator,

    // --- Control flow ---
    KwIf,
    KwElse,
    KwWhile,
    KwForever,
    KwCount,
    KwFor,
    KwIn,
    KwCheck,
    KwIs,
    KwStop,
    KwRestart,
    KwOut,
    KwWait,

    // --- Logic ---
    KwAnd,
    KwOr,
    KwNot,

    // --- Generics / types ---
    KwOf,
    KwAs,
    KwTo,
    KwStep,

    // --- Collections ---
    KwList,
    KwMap,
    KwSet,
    KwBag,
    KwQueue,
    KwStack,
    KwGrid2d,
    KwGrid3d,
    KwPair,
    KwSlice,
    KwBuffer,

    // --- Functions / closures ---
    KwAction,
    KwEmit,
    KwListen,
    KwOverride,

    // --- Module system ---
    KwUse,
    KwFrom,

    // --- Memory ---
    KwSafe,
    KwMetal,
    KwBridge,
    KwGc,

    // --- Concurrency ---
    KwRun,
    KwChannel,

    // --- Error handling ---
    KwPossible,

    // --- I/O ---
    KwShow,
    KwPrompt,
    KwInto,

    // --- Piping ---
    KwThen,

    // --- Has (traits) ---
    KwHas,

    // --- Other ---
    KwAssert,
    KwReflect,

    // --- Operators ---
    Plus,
    Minus,
    Star,
    Slash,
    Percent,
    Equal,
    EqualEqual,
    BangEqual,
    Less,
    Greater,
    LessEqual,
    GreaterEqual,
    Arrow,    // =>
    Pipe,     // |>
    Dot,
    Ellipsis,

    // --- Delimiters ---
    LeftParen,
    RightParen,
    LeftBrace,
    RightBrace,
    LeftBracket,
    RightBracket,
    Comma,
    Semicolon,
    Colon,
    At,       // @
    Hash,     // #

    // --- Doc comments ---
    DocComment,

    // --- Special ---
    Eof,
}

impl TokenKind {
    pub fn from_keyword(word: &str) -> Option<TokenKind> {
        match word {
            // Types
            "number" => Some(TokenKind::KwNumber),
            "decimal" => Some(TokenKind::KwDecimal),
            "text" => Some(TokenKind::KwText),
            "char" => Some(TokenKind::KwChar),
            "flag" => Some(TokenKind::KwFlag),
            "byte" => Some(TokenKind::KwByte),
            "bits" => Some(TokenKind::KwBits),
            "pointer" => Some(TokenKind::KwPointer),
            "atomic" => Some(TokenKind::KwAtomic),
            "null" => Some(TokenKind::KwNull),

            // Booleans
            "true" => Some(TokenKind::KwTrue),
            "false" => Some(TokenKind::KwFalse),

            // Declarations
            "function" => Some(TokenKind::KwFunction),
            "entity" => Some(TokenKind::KwEntity),
            "actor" => Some(TokenKind::KwActor),
            "choice" => Some(TokenKind::KwChoice),
            "trait" => Some(TokenKind::KwTrait),
            "system" => Some(TokenKind::KwSystem),
            "template" => Some(TokenKind::KwAbstract),
            "final" => Some(TokenKind::KwSealed),
            "shared" => Some(TokenKind::KwStatic),
            "public" => Some(TokenKind::KwPublic),
            "property" => Some(TokenKind::KwProperty),
            "extend" => Some(TokenKind::KwExtend),
            "type" => Some(TokenKind::KwType),
            "const" => Some(TokenKind::KwConst),
            "event" => Some(TokenKind::KwEvent),
            "operator" => Some(TokenKind::KwOperator),

            // Control flow
            "if" => Some(TokenKind::KwIf),
            "else" => Some(TokenKind::KwElse),
            "while" => Some(TokenKind::KwWhile),
            "forever" => Some(TokenKind::KwForever),
            "count" => Some(TokenKind::KwCount),
            "for" => Some(TokenKind::KwFor),
            "in" => Some(TokenKind::KwIn),
            "check" => Some(TokenKind::KwCheck),
            "is" => Some(TokenKind::KwIs),
            "stop" => Some(TokenKind::KwStop),
            "restart" => Some(TokenKind::KwRestart),
            "out" => Some(TokenKind::KwOut),
            "wait" => Some(TokenKind::KwWait),

            // Logic
            "and" => Some(TokenKind::KwAnd),
            "or" => Some(TokenKind::KwOr),
            "not" => Some(TokenKind::KwNot),

            // Generics / types
            "of" => Some(TokenKind::KwOf),
            "as" => Some(TokenKind::KwAs),
            "to" => Some(TokenKind::KwTo),
            "step" => Some(TokenKind::KwStep),

            // Collections
            "list" => Some(TokenKind::KwList),
            "map" => Some(TokenKind::KwMap),
            "set" => Some(TokenKind::KwSet),
            "bag" => Some(TokenKind::KwBag),
            "queue" => Some(TokenKind::KwQueue),
            "stack" => Some(TokenKind::KwStack),
            "grid2d" => Some(TokenKind::KwGrid2d),
            "grid3d" => Some(TokenKind::KwGrid3d),
            "pair" => Some(TokenKind::KwPair),
            "slice" => Some(TokenKind::KwSlice),
            "buffer" => Some(TokenKind::KwBuffer),

            // Functions / closures
            "action" => Some(TokenKind::KwAction),
            "emit" => Some(TokenKind::KwEmit),
            "listen" => Some(TokenKind::KwListen),
            "override" => Some(TokenKind::KwOverride),

            // Module system
            "use" => Some(TokenKind::KwUse),
            "from" => Some(TokenKind::KwFrom),

            // Memory
            "safe" => Some(TokenKind::KwSafe),
            "metal" => Some(TokenKind::KwMetal),
            "bridge" => Some(TokenKind::KwBridge),
            "gc" => Some(TokenKind::KwGc),

            // Concurrency
            "run" => Some(TokenKind::KwRun),
            "channel" => Some(TokenKind::KwChannel),

            // Error handling
            "possible" => Some(TokenKind::KwPossible),

            // I/O
            "show" => Some(TokenKind::KwShow),
            "prompt" => Some(TokenKind::KwPrompt),
            "into" => Some(TokenKind::KwInto),

            // Piping
            "then" => Some(TokenKind::KwThen),

            // Traits
            "has" => Some(TokenKind::KwHas),

            // Other
            "assert" => Some(TokenKind::KwAssert),
            "inspect" => Some(TokenKind::KwReflect),

            _ => None,
        }
    }
}
