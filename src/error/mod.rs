#![allow(dead_code)]

use crate::lexer::token::Span;

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum Severity {
    Error,
    Warning,
    Info,
}

#[derive(Debug, Clone, Copy, PartialEq)]
pub enum ErrorKind {
    // Lexer
    SyntaxError,

    // Parser
    ParseError,
    UnexpectedToken,

    // Semantic — names & scope
    UndeclaredVariable,
    DuplicateDeclaration,
    UndeclaredType,
    UndeclaredFunction,

    // Semantic — types
    TypeMismatch,
    InvalidOperation,
    ArgumentCountMismatch,
    ReturnTypeMismatch,
    IncompatibleAssignment,

    // Semantic — OOP
    AbstractNotImplemented,
    SealedInheritance,
    AccessViolation,
    MissingTraitMethod,
    InvalidInheritance,

    // Semantic — null safety
    PossibleNull,

    // Semantic — constants
    ConstReassignment,

    // Semantic — misc
    DeadCode,
    UnusedVariable,
    ShadowedVariable,
    DeprecatedUsage,
}

impl ErrorKind {
    pub fn emoji(&self) -> &'static str {
        match self {
            ErrorKind::SyntaxError => "🤯",
            ErrorKind::ParseError => "😵",
            ErrorKind::UnexpectedToken => "🫤",

            ErrorKind::UndeclaredVariable => "👻",
            ErrorKind::DuplicateDeclaration => "👯",
            ErrorKind::UndeclaredType => "🦄",
            ErrorKind::UndeclaredFunction => "📞",

            ErrorKind::TypeMismatch => "🧩",
            ErrorKind::InvalidOperation => "💥",
            ErrorKind::ArgumentCountMismatch => "🤌",
            ErrorKind::ReturnTypeMismatch => "📦",
            ErrorKind::IncompatibleAssignment => "🚫",

            ErrorKind::AbstractNotImplemented => "📝",
            ErrorKind::SealedInheritance => "🔒",
            ErrorKind::AccessViolation => "🔐",
            ErrorKind::MissingTraitMethod => "🧩",
            ErrorKind::InvalidInheritance => "🌳",

            ErrorKind::PossibleNull => "💀",

            ErrorKind::ConstReassignment => "🪨",

            ErrorKind::DeadCode => "⚰️",
            ErrorKind::UnusedVariable => "🧹",
            ErrorKind::ShadowedVariable => "👤",
            ErrorKind::DeprecatedUsage => "⚠️",
        }
    }

    pub fn label(&self) -> &'static str {
        match self {
            ErrorKind::SyntaxError => "syntax error",
            ErrorKind::ParseError => "parse error",
            ErrorKind::UnexpectedToken => "unexpected token",

            ErrorKind::UndeclaredVariable => "undeclared variable",
            ErrorKind::DuplicateDeclaration => "duplicate declaration",
            ErrorKind::UndeclaredType => "unknown type",
            ErrorKind::UndeclaredFunction => "unknown function",

            ErrorKind::TypeMismatch => "type mismatch",
            ErrorKind::InvalidOperation => "invalid operation",
            ErrorKind::ArgumentCountMismatch => "wrong number of arguments",
            ErrorKind::ReturnTypeMismatch => "return type mismatch",
            ErrorKind::IncompatibleAssignment => "incompatible assignment",

            ErrorKind::AbstractNotImplemented => "template method not implemented",
            ErrorKind::SealedInheritance => "final type cannot be inherited",
            ErrorKind::AccessViolation => "access violation",
            ErrorKind::MissingTraitMethod => "missing trait method",
            ErrorKind::InvalidInheritance => "invalid inheritance",

            ErrorKind::PossibleNull => "possible null",

            ErrorKind::ConstReassignment => "constant reassignment",

            ErrorKind::DeadCode => "dead code",
            ErrorKind::UnusedVariable => "unused variable",
            ErrorKind::ShadowedVariable => "shadowed variable",
            ErrorKind::DeprecatedUsage => "deprecated usage",
        }
    }

    pub fn severity(&self) -> Severity {
        match self {
            ErrorKind::DeadCode | ErrorKind::UnusedVariable | ErrorKind::ShadowedVariable | ErrorKind::DeprecatedUsage => {
                Severity::Warning
            }
            ErrorKind::PossibleNull => Severity::Warning,
            _ => Severity::Error,
        }
    }
}

#[derive(Debug, Clone)]
pub struct OboError {
    pub kind: ErrorKind,
    pub message: String,
    pub hint: Option<String>,
    pub note: Option<String>,
    pub span: Span,
    pub source_line: Option<String>,
    pub secondary: Vec<(Span, String)>,
}

impl OboError {
    pub fn new(kind: ErrorKind, message: impl Into<String>, span: Span) -> Self {
        Self {
            kind,
            message: message.into(),
            hint: None,
            note: None,
            span,
            source_line: None,
            secondary: Vec::new(),
        }
    }

    pub fn syntax(message: impl Into<String>, span: Span) -> Self {
        Self::new(ErrorKind::SyntaxError, message, span)
    }

    pub fn parse(message: impl Into<String>, span: Span) -> Self {
        Self::new(ErrorKind::ParseError, message, span)
    }

    pub fn with_hint(mut self, hint: impl Into<String>) -> Self {
        self.hint = Some(hint.into());
        self
    }

    pub fn with_note(mut self, note: impl Into<String>) -> Self {
        self.note = Some(note.into());
        self
    }

    pub fn with_source(mut self, source_line: impl Into<String>) -> Self {
        self.source_line = Some(source_line.into());
        self
    }

    pub fn with_secondary(mut self, span: Span, label: impl Into<String>) -> Self {
        self.secondary.push((span, label.into()));
        self
    }
}

pub struct ErrorReporter {
    errors: Vec<OboError>,
    use_color: bool,
    file_path: Option<String>,
}

impl ErrorReporter {
    pub fn new() -> Self {
        Self {
            errors: Vec::new(),
            use_color: atty_check(),
            file_path: None,
        }
    }

    pub fn with_file(mut self, path: impl Into<String>) -> Self {
        self.file_path = Some(path.into());
        self
    }

    pub fn report(&mut self, error: OboError) {
        self.errors.push(error);
    }

    pub fn has_errors(&self) -> bool {
        self.errors.iter().any(|e| e.kind.severity() == Severity::Error)
    }

    pub fn has_any(&self) -> bool {
        !self.errors.is_empty()
    }

    pub fn error_count(&self) -> usize {
        self.errors.iter().filter(|e| e.kind.severity() == Severity::Error).count()
    }

    pub fn warning_count(&self) -> usize {
        self.errors.iter().filter(|e| e.kind.severity() == Severity::Warning).count()
    }

    pub fn display_all(&self, source: &str) {
        let lines: Vec<&str> = source.lines().collect();

        for error in &self.errors {
            self.display_one(error, &lines);
        }

        self.display_summary();
    }

    fn display_summary(&self) {
        let errs = self.error_count();
        let warns = self.warning_count();

        if errs + warns == 0 {
            return;
        }

        eprintln!();

        if errs > 0 && warns > 0 {
            eprintln!(
                "{}",
                self.styled(
                    &format!(
                        "Obo: Found {} {} and {} {} 😤",
                        errs,
                        if errs == 1 { "error" } else { "errors" },
                        warns,
                        if warns == 1 { "warning" } else { "warnings" },
                    ),
                    "\x1b[1;31m",
                )
            );
        } else if errs > 0 {
            let msg = match errs {
                1 => "Obo: 1 error. Almost had it! 😤".to_string(),
                2 => "Obo: 2 errors. So close! 😤".to_string(),
                3..=5 => format!("Obo: {} errors. A few things to fix 😬", errs),
                6..=10 => format!("Obo: {} errors. This needs some love 😅", errs),
                _ => format!("Obo: {} errors. Whoa. Let's take it one at a time 🫠", errs),
            };
            eprintln!("{}", self.styled(&msg, "\x1b[1;31m"));
        } else {
            let msg = match warns {
                1 => "Obo: 1 warning — not critical, but worth a look 💡".to_string(),
                _ => format!("Obo: {} warnings — nothing broken, just heads up 💡", warns),
            };
            eprintln!("{}", self.styled(&msg, "\x1b[1;33m"));
        }
    }

    fn display_one(&self, error: &OboError, lines: &[&str]) {
        let severity = error.kind.severity();
        let emoji = error.kind.emoji();
        let label = error.kind.label();

        // Mustard/gold for "Obo:", then severity color for the tag
        let obo_color = "\x1b[1;38;5;214m"; // warm mustard/gold
        let (sev_color, severity_str) = match severity {
            Severity::Error => ("\x1b[1;31m", "error"),
            Severity::Warning => ("\x1b[1;33m", "warning"),
            Severity::Info => ("\x1b[1;36m", "info"),
        };

        eprintln!();

        // Header: Obo: message  emoji
        //         severity[kind]
        eprintln!(
            "{} {} {}",
            self.styled("Obo:", obo_color),
            self.styled(&error.message, "\x1b[1;37m"),
            emoji,
        );
        eprintln!(
            "  {}{}",
            self.styled(severity_str, sev_color),
            self.styled(&format!("[{}]", label), "\x1b[0;37m"),
        );

        // Location with clickable link
        let location = if let Some(ref path) = self.file_path {
            format!(
                "  {} {}:{}:{}",
                self.styled("-->", "\x1b[1;34m"),
                path,
                error.span.line,
                error.span.column,
            )
        } else {
            format!(
                "  {} line {}:{}",
                self.styled("-->", "\x1b[1;34m"),
                error.span.line,
                error.span.column,
            )
        };
        eprintln!("{}", location);

        // Source code context
        if let Some(source_line) = lines.get(error.span.line.saturating_sub(1)) {
            let line_num = error.span.line;
            let gutter_width = format!("{}", line_num).len().max(4);

            // Blank gutter line
            eprintln!(
                "  {} {}",
                self.styled(&format!("{:>gutter_width$} │", ""), "\x1b[1;34m"),
                "",
            );

            // The source line
            eprintln!(
                "  {} {}",
                self.styled(
                    &format!("{:>gutter_width$} │", line_num),
                    "\x1b[1;34m",
                ),
                source_line,
            );

            // Underline with caret
            let padding = " ".repeat(error.span.column.saturating_sub(1));
            let underline_len = error.span.length.max(1);
            let underline = if underline_len == 1 {
                "^".to_string()
            } else {
                format!("^{}", "~".repeat(underline_len - 1))
            };
            eprintln!(
                "  {} {}{}",
                self.styled(&format!("{:>gutter_width$} │", ""), "\x1b[1;34m"),
                padding,
                self.styled(&underline, sev_color),
            );
        }

        // Secondary spans
        for (sec_span, sec_msg) in &error.secondary {
            if let Some(sec_line) = lines.get(sec_span.line.saturating_sub(1)) {
                let gutter_width = format!("{}", sec_span.line).len().max(4);
                eprintln!(
                    "  {} {}",
                    self.styled(
                        &format!("{:>gutter_width$} │", sec_span.line),
                        "\x1b[1;34m",
                    ),
                    sec_line,
                );
                let pad = " ".repeat(sec_span.column.saturating_sub(1));
                let ul = "~".repeat(sec_span.length.max(1));
                eprintln!(
                    "  {} {}{}",
                    self.styled(&format!("{:>gutter_width$} │", ""), "\x1b[1;34m"),
                    pad,
                    self.styled(
                        &format!("{} {}", ul, sec_msg),
                        "\x1b[1;36m",
                    ),
                );
            }
        }

        // Note
        if let Some(ref note) = error.note {
            eprintln!(
                "  {} {}",
                self.styled("  note:", "\x1b[1;37m"),
                self.styled(note, "\x1b[0;37m"),
            );
        }

        // Hint
        if let Some(ref hint) = error.hint {
            eprintln!(
                "  {} {}",
                self.styled("  hint:", "\x1b[1;32m"),
                self.styled(hint, "\x1b[0;32m"),
            );
        }
    }

    fn styled(&self, text: &str, ansi_code: &str) -> String {
        if self.use_color {
            format!("{}{}\x1b[0m", ansi_code, text)
        } else {
            text.to_string()
        }
    }
}

fn atty_check() -> bool {
    std::io::IsTerminal::is_terminal(&std::io::stderr())
}
