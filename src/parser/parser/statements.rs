use super::*;

impl Parser {
    pub(super) fn parse_statement(&mut self) -> Result<Statement, ()> {
        match self.peek_kind() {
            TokenKind::KwShow => self.parse_show(),
            TokenKind::KwPrompt => self.parse_prompt(),
            TokenKind::KwIf => self.parse_if(),
            TokenKind::KwWhile => self.parse_while(),
            TokenKind::KwForever => self.parse_forever(),
            TokenKind::KwCount => self.parse_count(),
            TokenKind::KwFor => self.parse_for_in(),
            TokenKind::KwCheck => self.parse_check(),
            TokenKind::KwOut => self.parse_out(),
            TokenKind::KwStop => {
                let span = self.advance().span;
                self.expect(TokenKind::Semicolon)?;
                Ok(Statement::Stop(span))
            }
            TokenKind::KwRestart => {
                let span = self.advance().span;
                self.expect(TokenKind::Semicolon)?;
                Ok(Statement::Restart(span))
            }
            TokenKind::KwWait => self.parse_wait(),
            TokenKind::KwRun => self.parse_run(),
            TokenKind::KwEmit => self.parse_emit(),
            TokenKind::KwAssert => self.parse_assert(),
            TokenKind::KwPossible => self.parse_possible_block(),
            TokenKind::KwSafe => {
                let span = self.advance().span;
                let body = self.parse_block()?;
                Ok(Statement::SafeBlock(body, span))
            }
            TokenKind::KwMetal => {
                let span = self.advance().span;
                let body = self.parse_block()?;
                Ok(Statement::MetalBlock(body, span))
            }
            TokenKind::KwDefer => {
                let span = self.advance().span;
                let body = self.parse_block()?;
                Ok(Statement::Defer(body, span))
            }
            TokenKind::KwByte | TokenKind::KwBits | TokenKind::KwNumber
            | TokenKind::KwDecimal | TokenKind::KwText | TokenKind::KwFlag
            | TokenKind::KwChar
            | TokenKind::KwI8 | TokenKind::KwI16 | TokenKind::KwI32 | TokenKind::KwI64
            | TokenKind::KwU8 | TokenKind::KwU16 | TokenKind::KwU32 | TokenKind::KwU64
            | TokenKind::KwF32 | TokenKind::KwF64 => {
                // Type-first variable declaration: byte x = 100;
                if self.peek_at_kind(1) == TokenKind::Identifier {
                    let type_tok = self.advance();
                    let type_name = type_tok.lexeme.clone();
                    let type_span = type_tok.span;
                    let var_name = self.expect_identifier()?;
                    self.expect(TokenKind::Equal)?;
                    let initializer = self.parse_expression()?;
                    self.expect(TokenKind::Semicolon)?;
                    return Ok(Statement::VarDecl(VarDeclStmt {
                        name: var_name,
                        type_annotation: Some(TypeExpr::Named(type_name, type_span)),
                        initializer,
                        span: type_span,
                    }));
                }
                self.parse_expr_or_assignment()
            }
            _ => self.parse_expr_or_assignment(),
        }
    }

    fn parse_show(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwShow)?.span;
        let value = self.parse_expression()?;
        self.expect(TokenKind::Semicolon)?;
        Ok(Statement::Show(ShowStmt { value, span }))
    }

    fn parse_assert(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwAssert)?.span;
        self.expect(TokenKind::LeftParen)?;
        let condition = self.parse_expression()?;
        let message = if self.match_token(TokenKind::Comma) {
            Some(self.parse_expression()?)
        } else {
            None
        };
        self.expect(TokenKind::RightParen)?;
        self.expect(TokenKind::Semicolon)?;
        Ok(Statement::Assert(AssertStmt { condition, message, span }))
    }

    fn parse_prompt(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwPrompt)?.span;
        let message = self.parse_expression()?;
        self.expect(TokenKind::KwInto)?;
        let target = self.expect_identifier()?;
        self.expect(TokenKind::Semicolon)?;
        Ok(Statement::Prompt(PromptStmt {
            message,
            target,
            span,
        }))
    }

    fn parse_if(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwIf)?.span;
        self.expect(TokenKind::LeftParen)?;
        let condition = self.parse_expression()?;
        self.expect(TokenKind::RightParen)?;
        let then_body = self.parse_block()?;

        let else_body = if self.match_token(TokenKind::KwElse) {
            if self.check(TokenKind::KwIf) {
                Some(vec![self.parse_if()?])
            } else {
                Some(self.parse_block()?)
            }
        } else {
            None
        };

        Ok(Statement::If(IfStmt {
            condition,
            then_body,
            else_body,
            span,
        }))
    }

    fn parse_while(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwWhile)?.span;
        self.expect(TokenKind::LeftParen)?;
        let condition = self.parse_expression()?;
        self.expect(TokenKind::RightParen)?;
        let body = self.parse_block()?;

        Ok(Statement::While(WhileStmt {
            condition,
            body,
            span,
        }))
    }

    fn parse_forever(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwForever)?.span;
        let body = self.parse_block()?;
        Ok(Statement::Forever(ForeverStmt { body, span }))
    }

    fn parse_count(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwCount)?.span;
        self.expect(TokenKind::LeftParen)?;

        let var_name = self.expect_identifier()?;
        self.expect(TokenKind::Equal)?;
        let start = self.parse_expression()?;

        let end = if self.match_token(TokenKind::Comma) || self.match_token(TokenKind::KwTo) {
            self.parse_expression()?
        } else {
            self.error_at_current("Expected ',' or 'to' after start value in count");
            return Err(());
        };

        let step = if self.match_token(TokenKind::Comma) {
            if self.match_token(TokenKind::KwStep) {
                self.expect(TokenKind::Equal)?;
            }
            Some(self.parse_expression()?)
        } else if self.match_token(TokenKind::KwStep) {
            self.expect(TokenKind::Equal)?;
            Some(self.parse_expression()?)
        } else {
            None
        };

        self.expect(TokenKind::RightParen)?;
        let body = self.parse_block()?;

        Ok(Statement::Count(CountStmt {
            var_name,
            start,
            end,
            step,
            body,
            span,
        }))
    }

    fn parse_for_in(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwFor)?.span;
        self.expect(TokenKind::LeftParen)?;
        let var_name = self.expect_identifier()?;
        self.expect(TokenKind::KwIn)?;
        let iterable = self.parse_expression()?;
        self.expect(TokenKind::RightParen)?;
        let body = self.parse_block()?;

        Ok(Statement::ForIn(ForInStmt {
            var_name,
            iterable,
            body,
            span,
        }))
    }

    fn parse_check(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwCheck)?.span;
        self.expect(TokenKind::LeftParen)?;
        let value = self.parse_expression()?;
        self.expect(TokenKind::RightParen)?;
        self.expect(TokenKind::LeftBrace)?;

        let mut arms = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            arms.push(self.parse_check_arm()?);
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(Statement::Check(CheckStmt { value, arms, span }))
    }

    fn parse_check_arm(&mut self) -> Result<CheckArm, ()> {
        let span = self.current_span();
        self.expect(TokenKind::KwIs)?;

        let pattern = if self.check(TokenKind::KwNull) {
            self.advance();
            CheckPattern::Null
        } else if self.check(TokenKind::Less)
            || self.check(TokenKind::Greater)
            || self.check(TokenKind::LessEqual)
            || self.check(TokenKind::GreaterEqual)
            || self.check(TokenKind::EqualEqual)
            || self.check(TokenKind::BangEqual)
        {
            let op = self.advance().lexeme.clone();
            let value = self.parse_expression()?;
            CheckPattern::Comparison(op, value)
        } else if self.check(TokenKind::Identifier)
            && self.peek_lexeme().starts_with(|c: char| c.is_uppercase())
        {
            let mut type_name = self.advance().lexeme.clone();
            // Support qualified variant: is Tool.Hammer → match on "Hammer"
            if self.check(TokenKind::Dot) {
                self.advance();
                let variant = self.expect(TokenKind::Identifier)?.lexeme.clone();
                type_name = variant;
            }
            let bindings = if self.check(TokenKind::LeftParen) {
                self.advance();
                let mut names = Vec::new();
                if !self.check(TokenKind::RightParen) {
                    names.push(self.expect(TokenKind::Identifier)?.lexeme.clone());
                    while self.match_token(TokenKind::Comma) {
                        names.push(self.expect(TokenKind::Identifier)?.lexeme.clone());
                    }
                }
                self.expect(TokenKind::RightParen)?;
                Some(names)
            } else {
                None
            };
            if self.check(TokenKind::KwAnd) || self.check(TokenKind::KwOr) {
                let _guard_op = self.advance().lexeme.clone();
                let guard = self.parse_expression()?;
                CheckPattern::TypeWithGuard(type_name, bindings, guard)
            } else {
                CheckPattern::TypeCheck(type_name, bindings)
            }
        } else {
            let expr = self.parse_expression()?;
            CheckPattern::Value(expr)
        };

        let body = self.parse_block()?;

        Ok(CheckArm {
            pattern,
            body,
            span,
        })
    }

    fn parse_out(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwOut)?.span;

        if self.check(TokenKind::Semicolon) {
            self.advance();
            return Ok(Statement::Out(OutStmt {
                values: Vec::new(),
                span,
            }));
        }

        let mut values = vec![self.parse_expression()?];
        while self.match_token(TokenKind::Comma) {
            values.push(self.parse_expression()?);
        }

        self.expect(TokenKind::Semicolon)?;

        Ok(Statement::Out(OutStmt { values, span }))
    }

    fn parse_wait(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwWait)?.span;

        if self.check(TokenKind::KwFor) {
            self.advance();
            if self.check(TokenKind::Identifier) && self.peek_lexeme() == "all" {
                self.advance();
                self.expect(TokenKind::Semicolon)?;
                return Ok(Statement::Wait(WaitStmt {
                    duration: Expr::NullLit(span),
                    is_wait_for: false,
                    is_wait_for_all: true,
                    span,
                }));
            }
            let expr = self.parse_expression()?;
            self.expect(TokenKind::Semicolon)?;
            return Ok(Statement::Wait(WaitStmt {
                duration: expr,
                is_wait_for: true,
                is_wait_for_all: false,
                span,
            }));
        }

        self.expect(TokenKind::LeftParen)?;
        let duration = self.parse_expression()?;
        self.expect(TokenKind::RightParen)?;
        self.expect(TokenKind::Semicolon)?;

        Ok(Statement::Wait(WaitStmt {
            duration,
            is_wait_for: false,
            is_wait_for_all: false,
            span,
        }))
    }

    fn parse_run(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwRun)?.span;
        let expr = self.parse_expression()?;
        self.expect(TokenKind::Semicolon)?;
        Ok(Statement::Run(RunStmt { expr, span }))
    }

    fn parse_emit(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwEmit)?.span;
        let value = self.parse_expression()?;
        self.expect(TokenKind::Semicolon)?;
        Ok(Statement::Emit(EmitStmt { value, span }))
    }

    fn parse_possible_block(&mut self) -> Result<Statement, ()> {
        let span = self.expect(TokenKind::KwPossible)?.span;
        let body = self.parse_block()?;
        self.expect(TokenKind::KwElse)?;

        let error_name = if self.match_token(TokenKind::LeftParen) {
            let name = self.expect_identifier()?;
            self.expect(TokenKind::RightParen)?;
            Some(name)
        } else {
            None
        };

        let else_body = self.parse_block()?;

        Ok(Statement::PossibleBlock(PossibleBlockStmt {
            body,
            error_name,
            else_body,
            span,
        }))
    }

    fn parse_expr_or_assignment(&mut self) -> Result<Statement, ()> {
        let expr = self.parse_expression()?;

        if let Expr::Identifier(name, span) = &expr {
            if self.match_token(TokenKind::KwAs) {
                let type_annotation = Some(self.parse_type_expr()?);
                self.expect(TokenKind::Equal)?;
                let initializer = self.parse_expression()?;
                self.expect(TokenKind::Semicolon)?;
                return Ok(Statement::VarDecl(VarDeclStmt {
                    name: name.clone(),
                    type_annotation,
                    initializer,
                    span: *span,
                }));
            }
        }

        if self.check(TokenKind::Comma) {
            if let Expr::Identifier(first_name, span) = &expr {
                let first = first_name.clone();
                let span = *span;
                let mut targets = vec![first];
                while self.match_token(TokenKind::Comma) {
                    targets.push(self.expect_identifier()?);
                }
                self.expect(TokenKind::Equal)?;
                let value = self.parse_expression()?;
                self.expect(TokenKind::Semicolon)?;
                return Ok(Statement::MultiAssignment(MultiAssignStmt {
                    targets,
                    value,
                    span,
                }));
            }
        }

        if self.match_token(TokenKind::Equal) {
            let value = self.parse_expression()?;
            self.expect(TokenKind::Semicolon)?;
            let span = expr.span();
            if let Expr::Identifier(name, _) = &expr {
                Ok(Statement::VarDecl(VarDeclStmt {
                    name: name.clone(),
                    type_annotation: None,
                    initializer: value,
                    span,
                }))
            } else {
                Ok(Statement::Assignment(AssignStmt {
                    target: expr,
                    value,
                    span,
                }))
            }
        } else {
            self.expect(TokenKind::Semicolon)?;
            Ok(Statement::Expr(expr))
        }
    }

    pub(super) fn parse_block(&mut self) -> Result<Vec<Statement>, ()> {
        self.expect(TokenKind::LeftBrace)?;
        let mut stmts = Vec::new();

        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            match self.parse_statement() {
                Ok(stmt) => stmts.push(stmt),
                Err(_) => self.synchronize(),
            }
        }

        self.expect(TokenKind::RightBrace)?;
        Ok(stmts)
    }
}