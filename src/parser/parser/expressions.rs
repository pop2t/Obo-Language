use super::*;

impl Parser {
    pub fn parse_expression(&mut self) -> Result<Expr, ()> {
        self.parse_pipe()
    }

    fn parse_pipe(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_inline_if()?;

        while self.check(TokenKind::Pipe) || self.check(TokenKind::KwThen) {
            let span = self.advance().span;
            let right = self.parse_inline_if()?;
            expr = Expr::Pipe(Box::new(expr), Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_inline_if(&mut self) -> Result<Expr, ()> {
        let expr = self.parse_or()?;

        if self.check(TokenKind::KwIf) && !self.check_block_after_if() {
            self.advance();

            if self.match_token(TokenKind::KwPossible) {
                self.expect(TokenKind::KwElse)?;
                let fallback = self.parse_or()?;
                let span = expr.span();
                return Ok(Expr::IfPossibleElse(
                    Box::new(expr),
                    Box::new(fallback),
                    span,
                ));
            }

            let condition = self.parse_or()?;
            self.expect(TokenKind::KwElse)?;
            let fallback = self.parse_or()?;
            let span = expr.span();
            return Ok(Expr::InlineIf(
                Box::new(expr),
                Box::new(condition),
                Box::new(fallback),
                span,
            ));
        }

        Ok(expr)
    }

    fn parse_or(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_and()?;

        while self.check(TokenKind::KwOr) {
            let span = self.advance().span;
            let right = self.parse_and()?;
            expr = Expr::Logical(Box::new(expr), LogicalOp::Or, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_and(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_equality()?;

        while self.check(TokenKind::KwAnd) {
            let span = self.advance().span;
            let right = self.parse_equality()?;
            expr = Expr::Logical(Box::new(expr), LogicalOp::And, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_equality(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_bitwise_or()?;

        while self.check(TokenKind::EqualEqual)
            || self.check(TokenKind::BangEqual)
            || self.check(TokenKind::KwIs)
        {
            if self.check(TokenKind::KwIs) {
                let span = self.advance().span;
                let negated = self.match_token(TokenKind::KwNot);

                if self.check(TokenKind::KwNull) {
                    self.advance();
                    let null_expr = Expr::NullLit(span);
                    let op = if negated { BinOp::NotEq } else { BinOp::Eq };
                    expr = Expr::Binary(Box::new(expr), op, Box::new(null_expr), span);
                } else {
                    let right = self.parse_bitwise_or()?;
                    let op = if negated { BinOp::NotEq } else { BinOp::Eq };
                    expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
                }
            } else {
                let token = self.advance();
                let op = match token.kind {
                    TokenKind::EqualEqual => BinOp::Eq,
                    TokenKind::BangEqual => BinOp::NotEq,
                    _ => unreachable!(),
                };
                let span = token.span;
                let right = self.parse_bitwise_or()?;
                expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
            }
        }

        Ok(expr)
    }

    fn parse_bitwise_or(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_bitwise_xor()?;

        while self.check(TokenKind::KwBitOr) {
            let span = self.advance().span;
            let right = self.parse_bitwise_xor()?;
            expr = Expr::Binary(Box::new(expr), BinOp::BitOr, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_bitwise_xor(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_bitwise_and()?;

        while self.check(TokenKind::Caret) {
            let span = self.advance().span;
            let right = self.parse_bitwise_and()?;
            expr = Expr::Binary(Box::new(expr), BinOp::BitXor, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_bitwise_and(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_comparison()?;

        while self.check(TokenKind::Ampersand) {
            let span = self.advance().span;
            let right = self.parse_comparison()?;
            expr = Expr::Binary(Box::new(expr), BinOp::BitAnd, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_comparison(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_range()?;

        while self.check(TokenKind::Less)
            || self.check(TokenKind::Greater)
            || self.check(TokenKind::LessEqual)
            || self.check(TokenKind::GreaterEqual)
        {
            let token = self.advance();
            let op = match token.kind {
                TokenKind::Less => BinOp::Less,
                TokenKind::Greater => BinOp::Greater,
                TokenKind::LessEqual => BinOp::LessEq,
                TokenKind::GreaterEqual => BinOp::GreaterEq,
                _ => unreachable!(),
            };
            let span = token.span;
            let right = self.parse_range()?;
            expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_range(&mut self) -> Result<Expr, ()> {
        let expr = self.parse_shift()?;

        if self.match_token(TokenKind::KwTo) {
            let end = self.parse_shift()?;
            let step = if self.match_token(TokenKind::KwStep) {
                Some(Box::new(self.parse_shift()?))
            } else {
                None
            };
            let span = expr.span();
            return Ok(Expr::Range(Box::new(expr), Box::new(end), step, span));
        }

        Ok(expr)
    }

    fn parse_shift(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_addition()?;

        while self.check(TokenKind::LessLess) || self.check(TokenKind::GreaterGreater) {
            let token = self.advance();
            let op = match token.kind {
                TokenKind::LessLess => BinOp::Shl,
                TokenKind::GreaterGreater => BinOp::Shr,
                _ => unreachable!(),
            };
            let span = token.span;
            let right = self.parse_addition()?;
            expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_addition(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_multiplication()?;

        while self.check(TokenKind::Plus) || self.check(TokenKind::Minus) {
            let token = self.advance();
            let op = match token.kind {
                TokenKind::Plus => BinOp::Add,
                TokenKind::Minus => BinOp::Sub,
                _ => unreachable!(),
            };
            let span = token.span;
            let right = self.parse_multiplication()?;
            expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_multiplication(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_unary()?;

        while self.check(TokenKind::Star)
            || self.check(TokenKind::Slash)
            || self.check(TokenKind::Percent)
        {
            let token = self.advance();
            let op = match token.kind {
                TokenKind::Star => BinOp::Mul,
                TokenKind::Slash => BinOp::Div,
                TokenKind::Percent => BinOp::Mod,
                _ => unreachable!(),
            };
            let span = token.span;
            let right = self.parse_unary()?;
            expr = Expr::Binary(Box::new(expr), op, Box::new(right), span);
        }

        Ok(expr)
    }

    fn parse_unary(&mut self) -> Result<Expr, ()> {
        if self.check(TokenKind::Minus) {
            let span = self.advance().span;
            let operand = self.parse_unary()?;
            return Ok(Expr::Unary(UnaryOp::Neg, Box::new(operand), span));
        }

        if self.check(TokenKind::KwNot) {
            let span = self.advance().span;
            let operand = self.parse_unary()?;
            return Ok(Expr::Unary(UnaryOp::Not, Box::new(operand), span));
        }

        if self.check(TokenKind::Tilde) {
            let span = self.advance().span;
            let operand = self.parse_unary()?;
            return Ok(Expr::Unary(UnaryOp::BitNot, Box::new(operand), span));
        }

        if self.check(TokenKind::KwOwn) {
            let span = self.advance().span;
            let operand = self.parse_unary()?;
            return Ok(Expr::Own(Box::new(operand), span));
        }

        // asm("template", "constraints", input1, input2, ...)
        if self.check(TokenKind::KwAsm) {
            let span = self.advance().span;
            self.expect(TokenKind::LeftParen)?;
            // Template string
            let template = if self.check(TokenKind::StringLiteral) {
                let s = self.advance().lexeme.clone();
                s
            } else {
                self.error_at_current("expected asm template string");
                return Err(());
            };
            let mut constraints = String::new();
            let mut inputs = Vec::new();
            if self.check(TokenKind::Comma) {
                self.advance();
                // Constraints string
                if self.check(TokenKind::StringLiteral) {
                    constraints = self.advance().lexeme.clone();
                } else {
                    self.error_at_current("expected asm constraints string");
                    return Err(());
                }
                // Optional input operands
                while self.check(TokenKind::Comma) {
                    self.advance();
                    inputs.push(self.parse_expression()?);
                }
            }
            self.expect(TokenKind::RightParen)?;
            return Ok(Expr::InlineAsm(template, constraints, inputs, span));
        }

        if self.check(TokenKind::LeftParen)
            && self.is_type_at(1)
            && self.peek_at_kind(2) == TokenKind::RightParen
        {
            let span = self.advance().span;
            let type_expr = self.parse_type_expr()?;
            self.expect(TokenKind::RightParen)?;
            let operand = self.parse_unary()?;
            return Ok(Expr::Cast(Box::new(type_expr), Box::new(operand), span));
        }

        self.parse_postfix()
    }

    fn parse_postfix(&mut self) -> Result<Expr, ()> {
        let mut expr = self.parse_primary()?;

        loop {
            if self.match_token(TokenKind::Dot) {
                let span = self.current_span();
                let member = self.expect_member_name()?;

                if self.check(TokenKind::LeftParen) {
                    self.advance();
                    let args = self.parse_call_args()?;
                    self.expect(TokenKind::RightParen)?;
                    let access = Expr::MemberAccess(Box::new(expr), member, span);
                    expr = Expr::Call(Box::new(access), args, span);
                } else {
                    expr = Expr::MemberAccess(Box::new(expr), member, span);
                }
            } else if self.match_token(TokenKind::LeftParen) {
                let span = expr.span();
                let args = self.parse_call_args()?;
                self.expect(TokenKind::RightParen)?;
                expr = Expr::Call(Box::new(expr), args, span);
            } else if self.match_token(TokenKind::LeftBracket) {
                let span = expr.span();
                let index = self.parse_expression()?;
                self.expect(TokenKind::RightBracket)?;
                expr = Expr::IndexAccess(Box::new(expr), Box::new(index), span);
            } else {
                break;
            }
        }

        Ok(expr)
    }

    fn parse_call_args(&mut self) -> Result<Vec<CallArg>, ()> {
        let mut args = Vec::new();
        if self.check(TokenKind::RightParen) {
            return Ok(args);
        }

        loop {
            if self.check(TokenKind::Identifier) && self.peek_at_kind(1) == TokenKind::Equal {
                let name = self.expect_identifier()?;
                self.expect(TokenKind::Equal)?;
                let value = self.parse_expression()?;
                args.push(CallArg {
                    name: Some(name),
                    value,
                });
            } else {
                let value = self.parse_expression()?;
                args.push(CallArg { name: None, value });
            }

            if !self.match_token(TokenKind::Comma) {
                break;
            }
        }

        Ok(args)
    }

    fn parse_primary(&mut self) -> Result<Expr, ()> {
        let token = self.peek().clone();

        match token.kind {
            TokenKind::NumberLiteral => {
                self.advance();
                let val: i64 = token.lexeme.parse().unwrap_or(0);
                Ok(Expr::NumberLit(val, token.span))
            }
            TokenKind::DecimalLiteral => {
                self.advance();
                let val: f64 = token.lexeme.parse().unwrap_or(0.0);
                Ok(Expr::DecimalLit(val, token.span))
            }
            TokenKind::StringLiteral => {
                self.advance();
                Ok(Expr::StringLit(token.lexeme.clone(), token.span))
            }
            TokenKind::MultiLineStringLiteral => {
                self.advance();
                Ok(Expr::StringLit(token.lexeme.clone(), token.span))
            }
            TokenKind::CharLiteral => {
                self.advance();
                let c = token.lexeme.chars().next().unwrap_or('\0');
                Ok(Expr::CharLit(c, token.span))
            }
            TokenKind::KwTrue => {
                self.advance();
                Ok(Expr::BoolLit(true, token.span))
            }
            TokenKind::KwFalse => {
                self.advance();
                Ok(Expr::BoolLit(false, token.span))
            }
            TokenKind::KwNull => {
                self.advance();
                Ok(Expr::NullLit(token.span))
            }
            TokenKind::KwRun => {
                self.advance();
                let expr = self.parse_expression()?;
                Ok(Expr::Run(Box::new(expr), token.span))
            }
            TokenKind::KwChannel => {
                self.advance();
                // Parse optional "of <type>" — we ignore the type at runtime
                if self.check(TokenKind::KwOf) {
                    self.advance();
                    // consume the type token (e.g., number, text, identifier)
                    if !self.is_at_end() {
                        self.advance();
                    }
                }
                Ok(Expr::ChannelCreate(token.span))
            }
            TokenKind::KwAtomic => {
                self.advance();
                // Parse optional "of <type>" — we ignore the type at runtime
                if self.check(TokenKind::KwOf) {
                    self.advance();
                    if !self.is_at_end() {
                        self.advance();
                    }
                }
                // Parse optional initial value in parens: atomic of number(42)
                let init = if self.check(TokenKind::LeftParen) {
                    self.advance();
                    let val = self.parse_expression()?;
                    self.expect(TokenKind::RightParen)?;
                    Some(Box::new(val))
                } else {
                    None
                };
                Ok(Expr::AtomicCreate(init, token.span))
            }
            TokenKind::InterpolationStart => {
                self.advance();
                let mut parts = Vec::new();
                while !self.check(TokenKind::InterpolationEnd) && !self.is_at_end() {
                    parts.push(self.parse_expression()?);
                }
                self.expect(TokenKind::InterpolationEnd)?;
                if parts.len() == 1 {
                    Ok(parts.into_iter().next().unwrap())
                } else {
                    Ok(Expr::Interpolation(parts, token.span))
                }
            }
            TokenKind::Identifier => {
                let name = token.lexeme.clone();
                let span = token.span;
                self.advance();

                if self.check(TokenKind::LeftBrace) && self.looks_like_entity_init() {
                    self.advance();
                    let mut fields = Vec::new();

                    while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
                        let fspan = self.current_span();
                        let fname = self.expect_identifier()?;
                        self.expect(TokenKind::Equal)?;
                        let fval = self.parse_expression()?;
                        self.expect(TokenKind::Semicolon)?;
                        fields.push(FieldInit {
                            name: fname,
                            value: fval,
                            span: fspan,
                        });
                    }

                    self.expect(TokenKind::RightBrace)?;
                    return Ok(Expr::EntityInit(name, fields, span));
                }

                if self.check(TokenKind::Arrow) {
                    self.advance();
                    let body = self.parse_expression()?;
                    let param = Param {
                        name: name.clone(),
                        type_annotation: None,
                        default_value: None,
                        span,
                    };
                    return Ok(Expr::ArrowAction(vec![param], Box::new(body), span));
                }

                Ok(Expr::Identifier(name, span))
            }
            TokenKind::KwAction => {
                self.advance();
                self.expect(TokenKind::LeftParen)?;
                let params = self.parse_param_list()?;
                self.expect(TokenKind::RightParen)?;
                let body = self.parse_block()?;
                Ok(Expr::Action(params, body, token.span))
            }
            TokenKind::LeftParen => {
                if self.looks_like_multi_param_arrow() {
                    let span = self.advance().span;
                    let mut params = Vec::new();
                    if !self.check(TokenKind::RightParen) {
                        let pname = self.expect_identifier()?;
                        params.push(Param {
                            name: pname,
                            type_annotation: None,
                            default_value: None,
                            span,
                        });
                        while self.match_token(TokenKind::Comma) {
                            let pspan = self.current_span();
                            let pname = self.expect_identifier()?;
                            params.push(Param {
                                name: pname,
                                type_annotation: None,
                                default_value: None,
                                span: pspan,
                            });
                        }
                    }
                    self.expect(TokenKind::RightParen)?;
                    self.expect(TokenKind::Arrow)?;
                    let body = self.parse_expression()?;
                    return Ok(Expr::ArrowAction(params, Box::new(body), span));
                }

                self.advance();
                let expr = self.parse_expression()?;
                self.expect(TokenKind::RightParen)?;
                Ok(expr)
            }
            TokenKind::LeftBracket => {
                self.advance();
                let mut elements = Vec::new();

                if !self.check(TokenKind::RightBracket) {
                    let first = self.parse_expression()?;

                    if self.match_token(TokenKind::Colon) {
                        let val = self.parse_expression()?;
                        let mut pairs = vec![(first, val)];
                        while self.match_token(TokenKind::Comma) {
                            let k = self.parse_expression()?;
                            self.expect(TokenKind::Colon)?;
                            let v = self.parse_expression()?;
                            pairs.push((k, v));
                        }
                        self.expect(TokenKind::RightBracket)?;
                        return Ok(Expr::MapLiteral(pairs, token.span));
                    }

                    elements.push(first);
                    while self.match_token(TokenKind::Comma) {
                        elements.push(self.parse_expression()?);
                    }
                }

                self.expect(TokenKind::RightBracket)?;
                Ok(Expr::ListLiteral(elements, token.span))
            }
            TokenKind::KwSet | TokenKind::KwQueue | TokenKind::KwStack
            | TokenKind::KwMap
            | TokenKind::KwPointer | TokenKind::KwHandle | TokenKind::KwBag | TokenKind::KwPair
            | TokenKind::KwSlice | TokenKind::KwBuffer
            | TokenKind::KwGrid2d | TokenKind::KwGrid3d
            | TokenKind::KwReflect => {
                let name = token.lexeme.clone();
                let span = token.span;
                self.advance();
                Ok(Expr::Identifier(name, span))
            }
            _ => {
                self.error_at_current(&format!("I didn't expect '{}'", token.lexeme));
                Err(())
            }
        }
    }
}