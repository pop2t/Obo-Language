mod declarations;
mod expressions;
mod statements;
mod types;

use crate::error::OboError;
use crate::lexer::token::{Span, Token, TokenKind};

use super::ast::*;

pub struct Parser {
    tokens: Vec<Token>,
    current: usize,
    errors: Vec<OboError>,
}

impl Parser {
    pub fn new(tokens: Vec<Token>) -> Self {
        Self {
            tokens,
            current: 0,
            errors: Vec::new(),
        }
    }

    pub fn parse(mut self) -> (Program, Vec<OboError>) {
        let mut program = Vec::new();

        while !self.is_at_end() {
            match self.parse_declaration() {
                Ok(decl) => program.push(decl),
                Err(_) => self.synchronize(),
            }
        }

        (program, self.errors)
    }

    fn is_at_end(&self) -> bool {
        self.peek_kind() == TokenKind::Eof
    }

    fn peek(&self) -> &Token {
        let index = self.current.min(self.tokens.len().saturating_sub(1));
        &self.tokens[index]
    }

    fn previous(&self) -> &Token {
        let index = self.current.saturating_sub(1).min(self.tokens.len().saturating_sub(1));
        &self.tokens[index]
    }

    fn advance(&mut self) -> Token {
        if !self.is_at_end() {
            self.current += 1;
        }
        self.previous().clone()
    }

    fn check(&self, kind: TokenKind) -> bool {
        !self.is_at_end() && self.peek_kind() == kind
    }

    fn match_token(&mut self, kind: TokenKind) -> bool {
        if self.check(kind) {
            self.advance();
            true
        } else {
            false
        }
    }

    fn expect(&mut self, kind: TokenKind) -> Result<Token, ()> {
        if self.check(kind) {
            Ok(self.advance())
        } else {
            self.error_at_current(&format!(
                "Expected '{}', got '{}'",
                Self::token_label(kind),
                self.peek().lexeme
            ));
            Err(())
        }
    }

    fn expect_identifier(&mut self) -> Result<String, ()> {
        if self.check(TokenKind::Identifier) {
            Ok(self.advance().lexeme)
        } else {
            self.error_at_current(&format!(
                "Expected a name here, got '{}'",
                self.peek().lexeme
            ));
            Err(())
        }
    }

    fn expect_identifier_or_type_keyword(&mut self) -> Result<String, ()> {
        if self.check(TokenKind::Identifier) || self.is_type_keyword() {
            Ok(self.advance().lexeme)
        } else {
            self.error_at_current(&format!(
                "Expected a type or identifier, got '{}'",
                self.peek().lexeme
            ));
            Err(())
        }
    }

    fn expect_member_name(&mut self) -> Result<String, ()> {
        if self.check(TokenKind::Identifier) || Self::is_keyword_like_name(self.peek_kind()) {
            Ok(self.advance().lexeme)
        } else {
            self.error_at_current(&format!(
                "Expected a member name after '.', got '{}'",
                self.peek().lexeme
            ));
            Err(())
        }
    }

    fn current_span(&self) -> Span {
        self.peek().span
    }

    fn peek_kind(&self) -> TokenKind {
        self.peek().kind
    }

    fn peek_lexeme(&self) -> &str {
        &self.peek().lexeme
    }

    fn peek_at_kind(&self, offset: usize) -> TokenKind {
        self.tokens
            .get(self.current + offset)
            .map(|token| token.kind)
            .unwrap_or(TokenKind::Eof)
    }

    fn peek_at_lexeme(&self, offset: usize) -> &str {
        self.tokens
            .get(self.current + offset)
            .map(|token| token.lexeme.as_str())
            .unwrap_or("")
    }

    fn error_at_current(&mut self, message: &str) {
        self.errors
            .push(OboError::parse(message.to_string(), self.current_span()));
    }

    fn synchronize(&mut self) {
        if !self.is_at_end() {
            self.advance();
        }

        while !self.is_at_end() {
            if self.previous().kind == TokenKind::Semicolon || self.previous().kind == TokenKind::RightBrace {
                return;
            }

            match self.peek_kind() {
                TokenKind::KwFunction
                | TokenKind::KwEntity
                | TokenKind::KwActor
                | TokenKind::KwChoice
                | TokenKind::KwTrait
                | TokenKind::KwUse
                | TokenKind::KwType
                | TokenKind::KwExtend
                | TokenKind::KwConst
                | TokenKind::KwIf
                | TokenKind::KwWhile
                | TokenKind::KwForever
                | TokenKind::KwCount
                | TokenKind::KwFor
                | TokenKind::KwCheck
                | TokenKind::KwShow
                | TokenKind::KwPrompt
                | TokenKind::KwOut
                | TokenKind::KwWait
                | TokenKind::KwRun
                | TokenKind::KwEmit
                | TokenKind::KwPossible
                | TokenKind::KwSafe
                | TokenKind::KwMetal => return,
                _ => {
                    self.advance();
                }
            }
        }
    }

    fn is_type_keyword(&self) -> bool {
        Self::is_type_keyword_kind(self.peek_kind())
    }

    fn is_type_at(&self, offset: usize) -> bool {
        Self::is_type_keyword_kind(self.peek_at_kind(offset))
    }

    fn looks_like_entity_init(&self) -> bool {
        if self.peek_kind() != TokenKind::LeftBrace {
            return false;
        }

        matches!(
            (self.peek_at_kind(1), self.peek_at_kind(2)),
            (TokenKind::RightBrace, _) | (TokenKind::Identifier, TokenKind::Equal)
        )
    }

    fn looks_like_multi_param_arrow(&self) -> bool {
        if self.peek_kind() != TokenKind::LeftParen {
            return false;
        }

        let mut index = self.current + 1;
        let mut expect_param = true;

        while let Some(token) = self.tokens.get(index) {
            match token.kind {
                TokenKind::RightParen => {
                    return self
                        .tokens
                        .get(index + 1)
                        .map(|next| next.kind == TokenKind::Arrow)
                        .unwrap_or(false);
                }
                TokenKind::Identifier if expect_param => {
                    expect_param = false;
                }
                TokenKind::Comma if !expect_param => {
                    expect_param = true;
                }
                _ => return false,
            }
            index += 1;
        }

        false
    }

    fn check_block_after_if(&self) -> bool {
        if self.peek_kind() != TokenKind::KwIf || self.peek_at_kind(1) != TokenKind::LeftParen {
            return false;
        }

        let mut depth = 0usize;
        let mut index = self.current + 1;

        while let Some(token) = self.tokens.get(index) {
            match token.kind {
                TokenKind::LeftParen => depth += 1,
                TokenKind::RightParen => {
                    depth = depth.saturating_sub(1);
                    if depth == 0 {
                        return self
                            .tokens
                            .get(index + 1)
                            .map(|next| next.kind == TokenKind::LeftBrace)
                            .unwrap_or(false);
                    }
                }
                _ => {}
            }
            index += 1;
        }

        false
    }

    fn token_label(kind: TokenKind) -> &'static str {
        match kind {
            TokenKind::LeftParen => "(",
            TokenKind::RightParen => ")",
            TokenKind::LeftBrace => "{",
            TokenKind::RightBrace => "}",
            TokenKind::LeftBracket => "[",
            TokenKind::RightBracket => "]",
            TokenKind::Comma => ",",
            TokenKind::Semicolon => ";",
            TokenKind::Colon => ":",
            TokenKind::Dot => ".",
            TokenKind::Equal => "=",
            TokenKind::Arrow => "=>",
            TokenKind::KwFunction => "function",
            TokenKind::KwEntity => "entity",
            TokenKind::KwActor => "actor",
            TokenKind::KwChoice => "choice",
            TokenKind::KwTrait => "trait",
            TokenKind::KwUse => "use",
            TokenKind::KwType => "type",
            TokenKind::KwExtend => "extend",
            TokenKind::KwConst => "const",
            TokenKind::KwShow => "show",
            TokenKind::KwPrompt => "prompt",
            TokenKind::KwIf => "if",
            TokenKind::KwElse => "else",
            TokenKind::KwWhile => "while",
            TokenKind::KwFor => "for",
            TokenKind::KwCheck => "check",
            TokenKind::KwOut => "out",
            TokenKind::KwWait => "wait",
            TokenKind::KwRun => "run",
            TokenKind::KwEmit => "emit",
            _ => "token",
        }
    }

    fn is_type_keyword_kind(kind: TokenKind) -> bool {
        matches!(
            kind,
            TokenKind::KwNumber
                | TokenKind::KwDecimal
                | TokenKind::KwText
                | TokenKind::KwChar
                | TokenKind::KwFlag
                | TokenKind::KwByte
                | TokenKind::KwBits
                | TokenKind::KwPointer
                | TokenKind::KwHandle
                | TokenKind::KwAtomic
                | TokenKind::KwNull
                | TokenKind::KwI8
                | TokenKind::KwI16
                | TokenKind::KwI32
                | TokenKind::KwI64
                | TokenKind::KwU8
                | TokenKind::KwU16
                | TokenKind::KwU32
                | TokenKind::KwU64
                | TokenKind::KwF32
                | TokenKind::KwF64
                | TokenKind::KwList
                | TokenKind::KwMap
                | TokenKind::KwSet
                | TokenKind::KwBag
                | TokenKind::KwQueue
                | TokenKind::KwStack
                | TokenKind::KwGrid2d
                | TokenKind::KwGrid3d
                | TokenKind::KwPair
                | TokenKind::KwSlice
                | TokenKind::KwBuffer
        )
    }

    fn is_keyword_like_name(kind: TokenKind) -> bool {
        matches!(
            kind,
            TokenKind::KwNumber
                | TokenKind::KwDecimal
                | TokenKind::KwText
                | TokenKind::KwChar
                | TokenKind::KwFlag
                | TokenKind::KwByte
                | TokenKind::KwBits
                | TokenKind::KwPointer
                | TokenKind::KwHandle
                | TokenKind::KwAtomic
                | TokenKind::KwNull
                | TokenKind::KwFunction
                | TokenKind::KwEntity
                | TokenKind::KwActor
                | TokenKind::KwChoice
                | TokenKind::KwTrait
                | TokenKind::KwSystem
                | TokenKind::KwAbstract
                | TokenKind::KwSealed
                | TokenKind::KwStatic
                | TokenKind::KwPublic
                | TokenKind::KwProperty
                | TokenKind::KwExtend
                | TokenKind::KwType
                | TokenKind::KwConst
                | TokenKind::KwEvent
                | TokenKind::KwIf
                | TokenKind::KwElse
                | TokenKind::KwWhile
                | TokenKind::KwForever
                | TokenKind::KwCount
                | TokenKind::KwFor
                | TokenKind::KwIn
                | TokenKind::KwCheck
                | TokenKind::KwIs
                | TokenKind::KwStop
                | TokenKind::KwRestart
                | TokenKind::KwOut
                | TokenKind::KwWait
                | TokenKind::KwAnd
                | TokenKind::KwOr
                | TokenKind::KwNot
                | TokenKind::KwOf
                | TokenKind::KwAs
                | TokenKind::KwTo
                | TokenKind::KwStep
                | TokenKind::KwList
                | TokenKind::KwMap
                | TokenKind::KwSet
                | TokenKind::KwBag
                | TokenKind::KwQueue
                | TokenKind::KwStack
                | TokenKind::KwGrid2d
                | TokenKind::KwGrid3d
                | TokenKind::KwPair
                | TokenKind::KwSlice
                | TokenKind::KwBuffer
                | TokenKind::KwAction
                | TokenKind::KwEmit
                | TokenKind::KwListen
                | TokenKind::KwOverride
                | TokenKind::KwUse
                | TokenKind::KwFrom
                | TokenKind::KwSafe
                | TokenKind::KwMetal
                | TokenKind::KwBridge
                | TokenKind::KwGc
                | TokenKind::KwRun
                | TokenKind::KwPossible
                | TokenKind::KwShow
                | TokenKind::KwPrompt
                | TokenKind::KwInto
                | TokenKind::KwThen
                | TokenKind::KwHas
                | TokenKind::KwAssert
                | TokenKind::KwReflect
                | TokenKind::KwTrue
                | TokenKind::KwFalse
        )
    }
}