use crate::error::OboError;
use crate::lexer::token::{Span, Token, TokenKind};

pub struct Scanner {
    source: Vec<char>,
    tokens: Vec<Token>,
    errors: Vec<OboError>,

    start: usize,
    current: usize,
    line: usize,
    column: usize,
    start_column: usize,
}

impl Scanner {
    pub fn new(source: &str) -> Self {
        Self {
            source: source.chars().collect(),
            tokens: Vec::new(),
            errors: Vec::new(),
            start: 0,
            current: 0,
            line: 1,
            column: 1,
            start_column: 1,
        }
    }

    pub fn scan_tokens(mut self) -> (Vec<Token>, Vec<OboError>) {
        while !self.is_at_end() {
            self.start = self.current;
            self.start_column = self.column;
            self.scan_token();
        }

        self.tokens.push(Token {
            kind: TokenKind::Eof,
            lexeme: String::new(),
            span: Span {
                line: self.line,
                column: self.column,
                length: 0,
            },
        });

        (self.tokens, self.errors)
    }

    fn scan_token(&mut self) {
        let c = self.advance();

        match c {
            ' ' | '\r' | '\t' => {}
            '\n' => {
                self.line += 1;
                self.column = 1;
            }

            '(' => self.add_token(TokenKind::LeftParen),
            ')' => self.add_token(TokenKind::RightParen),
            '{' => self.add_token(TokenKind::LeftBrace),
            '}' => self.add_token(TokenKind::RightBrace),
            '[' => self.add_token(TokenKind::LeftBracket),
            ']' => self.add_token(TokenKind::RightBracket),
            ',' => self.add_token(TokenKind::Comma),
            '.' => {
                if self.peek() == '.' && self.peek_next() == '.' {
                    self.advance();
                    self.advance();
                    self.add_token(TokenKind::Ellipsis);
                } else {
                    self.add_token(TokenKind::Dot);
                }
            }
            ';' => self.add_token(TokenKind::Semicolon),
            ':' => self.add_token(TokenKind::Colon),
            '@' => self.add_token(TokenKind::At),
            '#' => self.add_token(TokenKind::Hash),
            '%' => self.add_token(TokenKind::Percent),

            '+' => self.add_token(TokenKind::Plus),
            '-' => self.add_token(TokenKind::Minus),
            '*' => self.add_token(TokenKind::Star),

            '=' => {
                if self.match_char('>') {
                    self.add_token(TokenKind::Arrow);
                } else if self.match_char('=') {
                    self.add_token(TokenKind::EqualEqual);
                } else {
                    self.add_token(TokenKind::Equal);
                }
            }

            '!' => {
                if self.match_char('=') {
                    self.add_token(TokenKind::BangEqual);
                } else {
                    self.error("Unexpected character '!'. Did you mean 'not'?");
                }
            }

            '<' => {
                if self.match_char('=') {
                    self.add_token(TokenKind::LessEqual);
                } else {
                    self.add_token(TokenKind::Less);
                }
            }

            '>' => {
                if self.match_char('=') {
                    self.add_token(TokenKind::GreaterEqual);
                } else {
                    self.add_token(TokenKind::Greater);
                }
            }

            '|' => {
                if self.match_char('>') {
                    self.add_token(TokenKind::Pipe);
                } else {
                    self.error("Unexpected '|'. Did you mean '|>' for piping?");
                }
            }

            '/' => {
                if self.match_char('/') {
                    if self.match_char('/') {
                        self.doc_comment();
                    } else {
                        self.line_comment();
                    }
                } else {
                    self.add_token(TokenKind::Slash);
                }
            }

            '"' => {
                if self.peek() == '"' && self.peek_next() == '"' {
                    self.advance();
                    self.advance();
                    self.multi_line_string();
                } else {
                    self.string();
                }
            }

            '\'' => self.char_literal(),

            _ => {
                if c.is_ascii_digit() {
                    self.number();
                } else if c.is_alphabetic() || c == '_' {
                    self.identifier();
                } else {
                    self.error(&format!("I don't recognize '{}'", c));
                }
            }
        }
    }

    // --- Literal Scanners ---

    fn string(&mut self) {
        let mut value = String::new();
        let mut has_interpolation = false;

        while !self.is_at_end() && self.peek() != '"' {
            if self.peek() == '\n' {
                self.error_at_current("This string never ends. Did you forget the closing '\"'?");
                return;
            }

            if self.peek() == '\\' {
                self.advance();
                match self.peek() {
                    'n' => { self.advance(); value.push('\n'); }
                    't' => { self.advance(); value.push('\t'); }
                    'r' => { self.advance(); value.push('\r'); }
                    '\\' => { self.advance(); value.push('\\'); }
                    '"' => { self.advance(); value.push('"'); }
                    '{' => { self.advance(); value.push('{'); }
                    _ => {
                        let ch = self.advance();
                        self.error(&format!(
                            "Unknown escape '\\{}'. I know: \\n, \\t, \\r, \\\\, \\\", \\{{",
                            ch
                        ));
                        value.push(ch);
                    }
                }
                continue;
            }

            if self.peek() == '{' {
                has_interpolation = true;
            }

            value.push(self.advance());
        }

        if self.is_at_end() {
            self.error("This string never ends. Did you forget the closing '\"'?");
            return;
        }

        self.advance(); // closing "

        if has_interpolation {
            self.tokenize_interpolated_string(&value);
        } else {
            self.add_token_with_lexeme(TokenKind::StringLiteral, value);
        }
    }

    fn tokenize_interpolated_string(&mut self, value: &str) {
        let mut chars = value.chars().peekable();
        let mut current_text = String::new();
        let span = self.current_span();

        while let Some(&c) = chars.peek() {
            if c == '{' {
                chars.next();
                if !current_text.is_empty() {
                    self.tokens.push(Token {
                        kind: TokenKind::StringLiteral,
                        lexeme: current_text.clone(),
                        span,
                    });
                    self.tokens.push(Token {
                        kind: TokenKind::Plus,
                        lexeme: "+".to_string(),
                        span,
                    });
                    current_text.clear();
                }

                let mut expr = String::new();
                let mut depth = 1;
                while let Some(&ec) = chars.peek() {
                    if ec == '{' {
                        depth += 1;
                    } else if ec == '}' {
                        depth -= 1;
                        if depth == 0 {
                            chars.next();
                            break;
                        }
                    }
                    expr.push(ec);
                    chars.next();
                }

                self.tokens.push(Token {
                    kind: TokenKind::InterpolationStart,
                    lexeme: "{".to_string(),
                    span,
                });

                let inner_scanner = Scanner::new(&expr);
                let (inner_tokens, inner_errors) = inner_scanner.scan_tokens();
                for token in inner_tokens {
                    if token.kind != TokenKind::Eof {
                        self.tokens.push(token);
                    }
                }
                self.errors.extend(inner_errors);

                self.tokens.push(Token {
                    kind: TokenKind::InterpolationEnd,
                    lexeme: "}".to_string(),
                    span,
                });

                if chars.peek().is_some() {
                    self.tokens.push(Token {
                        kind: TokenKind::Plus,
                        lexeme: "+".to_string(),
                        span,
                    });
                }
            } else {
                current_text.push(c);
                chars.next();
            }
        }

        if !current_text.is_empty() {
            self.tokens.push(Token {
                kind: TokenKind::StringLiteral,
                lexeme: current_text,
                span,
            });
        }
    }

    fn multi_line_string(&mut self) {
        let mut value = String::new();

        // Skip leading newline after opening """
        if self.peek() == '\n' {
            self.advance();
            self.line += 1;
            self.column = 1;
        }

        loop {
            if self.is_at_end() {
                self.error("This multi-line string never ends. Expected '\"\"\"'");
                return;
            }

            if self.peek() == '"' && self.peek_next() == '"' && self.peek_at(2) == '"' {
                self.advance();
                self.advance();
                self.advance();
                break;
            }

            let c = self.advance();
            if c == '\n' {
                self.line += 1;
                self.column = 1;
            }
            value.push(c);
        }

        // Trim trailing newline before closing """
        if value.ends_with('\n') {
            value.pop();
        }

        self.add_token_with_lexeme(TokenKind::MultiLineStringLiteral, value);
    }

    fn char_literal(&mut self) {
        if self.is_at_end() {
            self.error("Expected a character after '");
            return;
        }

        let c = if self.peek() == '\\' {
            self.advance();
            match self.advance() {
                'n' => '\n',
                't' => '\t',
                'r' => '\r',
                '\\' => '\\',
                '\'' => '\'',
                other => {
                    self.error(&format!("Unknown escape '\\{}'", other));
                    other
                }
            }
        } else {
            self.advance()
        };

        if self.peek() != '\'' {
            self.error("Expected closing ' after character literal");
            return;
        }
        self.advance();

        self.add_token_with_lexeme(TokenKind::CharLiteral, c.to_string());
    }

    fn number(&mut self) {
        // Check for binary (0b) or hex (0x) prefix
        let raw_start = self.current_lexeme();
        if raw_start == "0" && (self.peek() == 'b' || self.peek() == 'B') {
            self.advance(); // consume 'b'
            if self.peek() != '0' && self.peek() != '1' {
                self.error("Binary literal needs at least one digit (0 or 1) after '0b' 🤔");
                return;
            }
            while self.peek() == '0' || self.peek() == '1' || self.peek() == '_' {
                self.advance();
            }
            let lexeme = self.current_lexeme();
            let digits = lexeme[2..].replace('_', "");
            let value = i64::from_str_radix(&digits, 2).unwrap_or(0);
            self.add_token_with_lexeme(TokenKind::NumberLiteral, value.to_string());
            return;
        }
        if raw_start == "0" && (self.peek() == 'x' || self.peek() == 'X') {
            self.advance(); // consume 'x'
            if !self.peek().is_ascii_hexdigit() {
                self.error("Hex literal needs at least one digit after '0x' 🤔");
                return;
            }
            while self.peek().is_ascii_hexdigit() || self.peek() == '_' {
                self.advance();
            }
            let lexeme = self.current_lexeme();
            let digits = lexeme[2..].replace('_', "");
            let value = i64::from_str_radix(&digits, 16).unwrap_or(0);
            self.add_token_with_lexeme(TokenKind::NumberLiteral, value.to_string());
            return;
        }

        while self.peek().is_ascii_digit() || self.peek() == '_' {
            self.advance();
        }

        if self.peek() == '.' && self.peek_next().is_ascii_digit() {
            self.advance(); // consume .
            while self.peek().is_ascii_digit() || self.peek() == '_' {
                self.advance();
            }
            let lexeme = self.current_lexeme().replace('_', "");
            self.add_token_with_lexeme(TokenKind::DecimalLiteral, lexeme);
        } else {
            let lexeme = self.current_lexeme().replace('_', "");
            self.add_token_with_lexeme(TokenKind::NumberLiteral, lexeme);
        }
    }

    fn identifier(&mut self) {
        while self.peek().is_alphanumeric() || self.peek() == '_' {
            self.advance();
        }

        let word = self.current_lexeme();

        if let Some(keyword) = TokenKind::from_keyword(&word) {
            self.add_token(keyword);
        } else {
            self.add_token(TokenKind::Identifier);
        }
    }

    // --- Comments ---

    fn line_comment(&mut self) {
        while !self.is_at_end() && self.peek() != '\n' {
            self.advance();
        }
    }

    fn doc_comment(&mut self) {
        let mut content = String::new();

        // Skip leading whitespace
        while self.peek() == ' ' {
            self.advance();
        }

        while !self.is_at_end() && self.peek() != '\n' {
            content.push(self.advance());
        }

        self.add_token_with_lexeme(TokenKind::DocComment, content.trim().to_string());
    }

    // --- Helpers ---

    fn advance(&mut self) -> char {
        let c = self.source[self.current];
        self.current += 1;
        self.column += 1;
        c
    }

    fn peek(&self) -> char {
        if self.is_at_end() {
            '\0'
        } else {
            self.source[self.current]
        }
    }

    fn peek_next(&self) -> char {
        if self.current + 1 >= self.source.len() {
            '\0'
        } else {
            self.source[self.current + 1]
        }
    }

    fn peek_at(&self, offset: usize) -> char {
        let idx = self.current + offset;
        if idx >= self.source.len() {
            '\0'
        } else {
            self.source[idx]
        }
    }

    fn match_char(&mut self, expected: char) -> bool {
        if self.is_at_end() || self.source[self.current] != expected {
            return false;
        }
        self.current += 1;
        self.column += 1;
        true
    }

    fn is_at_end(&self) -> bool {
        self.current >= self.source.len()
    }

    fn current_lexeme(&self) -> String {
        self.source[self.start..self.current].iter().collect()
    }

    fn current_span(&self) -> Span {
        Span {
            line: self.line,
            column: self.start_column,
            length: self.current - self.start,
        }
    }

    fn add_token(&mut self, kind: TokenKind) {
        let lexeme = self.current_lexeme();
        let span = self.current_span();
        self.tokens.push(Token { kind, lexeme, span });
    }

    fn add_token_with_lexeme(&mut self, kind: TokenKind, lexeme: String) {
        let span = self.current_span();
        self.tokens.push(Token { kind, lexeme, span });
    }

    fn error(&mut self, message: &str) {
        self.errors.push(OboError::syntax(message, self.current_span()));
    }

    fn error_at_current(&mut self, message: &str) {
        self.errors.push(OboError::syntax(
            message,
            Span {
                line: self.line,
                column: self.column,
                length: 1,
            },
        ));
    }
}
