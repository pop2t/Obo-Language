use super::*;

impl Parser {
    pub(super) fn parse_declaration(&mut self) -> Result<Declaration, ()> {
        let attributes = self.parse_attributes()?;
        let doc_comments = self.collect_doc_comments();

        let is_public = self.match_token(TokenKind::KwPublic);
        let is_abstract = self.match_token(TokenKind::KwAbstract);
        let is_sealed = self.match_token(TokenKind::KwSealed);
        let is_system = self.match_token(TokenKind::KwSystem);
        let is_static = self.match_token(TokenKind::KwStatic);

        if self.peek_kind() == TokenKind::Identifier && self.peek_lexeme() == "value" {
                // value TypeName { x as f32; y as f32; }
                let span = self.advance().span; // consume 'value'
                let name = self.expect_identifier()?;
                self.expect(TokenKind::LeftBrace)?;
                let mut fields = Vec::new();
                while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
                    let is_pub = self.match_token(TokenKind::KwPublic);
                    let fspan = self.current_span();
                    let fname = self.expect_identifier()?;
                    let type_annotation = if self.match_token(TokenKind::KwAs) {
                        Some(self.parse_type_expr()?)
                    } else {
                        None
                    };
                    self.expect(TokenKind::Semicolon)?;
                    fields.push(FieldDecl {
                        name: fname,
                        type_annotation,
                        default_value: None,
                        is_public: is_pub,
                        span: fspan,
                    });
                }
                self.expect(TokenKind::RightBrace)?;
                return Ok(Declaration::Entity(EntityDecl {
                    name,
                    fields,
                    is_public: is_public,
                    is_packed: true,
                    is_value: true,
                    doc_comments,
                    attributes,
                    span,
                }));
        }

        match self.peek_kind() {
            TokenKind::KwFunction => {
                let mut f = self.parse_function_decl()?;
                f.is_public = is_public;
                f.is_static = is_static;
                f.is_abstract = is_abstract;
                f.doc_comments = doc_comments;
                f.attributes = attributes;
                Ok(Declaration::Function(f))
            }
            TokenKind::KwPacked => {
                // packed entity Name { ... }
                self.advance(); // consume 'packed'
                let mut e = self.parse_entity_decl()?;
                e.is_packed = true;
                e.is_public = is_public;
                e.doc_comments = doc_comments;
                e.attributes = attributes;
                Ok(Declaration::Entity(e))
            }

            TokenKind::KwEntity => {
                let mut e = self.parse_entity_decl()?;
                e.is_public = is_public;
                e.doc_comments = doc_comments;
                e.attributes = attributes;
                Ok(Declaration::Entity(e))
            }
            TokenKind::KwActor => {
                let mut a = self.parse_actor_decl()?;
                a.is_public = is_public;
                a.is_abstract = is_abstract;
                a.is_sealed = is_sealed;
                a.is_system = is_system;
                a.doc_comments = doc_comments;
                a.attributes = attributes;
                Ok(Declaration::Actor(a))
            }
            TokenKind::KwChoice => {
                let mut c = self.parse_choice_decl()?;
                c.is_public = is_public;
                c.doc_comments = doc_comments;
                Ok(Declaration::Choice(c))
            }
            TokenKind::KwTrait => {
                let mut t = self.parse_trait_decl()?;
                t.is_public = is_public;
                t.doc_comments = doc_comments;
                Ok(Declaration::Trait(t))
            }
            TokenKind::KwUse => Ok(Declaration::Use(self.parse_use_decl()?)),
            TokenKind::KwType => Ok(Declaration::TypeAlias(self.parse_type_alias()?)),
            TokenKind::KwExtend => Ok(Declaration::Extend(self.parse_extend_decl()?)),
            TokenKind::KwConst => {
                let mut c = self.parse_const_decl()?;
                c.is_public = is_public;
                c.doc_comments = doc_comments;
                Ok(Declaration::Const(c))
            }
            TokenKind::KwBridge => Ok(Declaration::Bridge(self.parse_bridge_decl()?)),
            TokenKind::Hash => Ok(Declaration::ConditionalCompilation(
                self.parse_conditional_compilation()?,
            )),
            _ => {
                let stmt = self.parse_statement()?;
                Ok(Declaration::Statement(stmt))
            }
        }
    }

    pub(super) fn parse_function_decl(&mut self) -> Result<FunctionDecl, ()> {
        let span = self.expect(TokenKind::KwFunction)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::LeftParen)?;
        let params = self.parse_param_list()?;
        self.expect(TokenKind::RightParen)?;

        if self.check(TokenKind::Semicolon) {
            self.advance();
            return Ok(FunctionDecl {
                name,
                params,
                body: Vec::new(),
                is_public: false,
                is_static: false,
                is_abstract: true,
                doc_comments: Vec::new(),
                attributes: Vec::new(),
                span,
            });
        }

        let body = self.parse_block()?;

        Ok(FunctionDecl {
            name,
            params,
            body,
            is_public: false,
            is_static: false,
            is_abstract: false,
            doc_comments: Vec::new(),
            attributes: Vec::new(),
            span,
        })
    }

    pub(super) fn parse_param_list(&mut self) -> Result<Vec<Param>, ()> {
        let mut params = Vec::new();
        if self.check(TokenKind::RightParen) {
            return Ok(params);
        }

        loop {
            let span = self.current_span();
            let name = self.expect_identifier()?;

            let mut type_annotation = if self.match_token(TokenKind::KwAs) {
                Some(self.parse_type_expr()?)
            } else {
                None
            };

            if type_annotation.is_none() && self.is_type_keyword() {
                let tspan = self.current_span();
                let tname = self.expect_identifier_or_type_keyword()?;
                type_annotation = Some(TypeExpr::Named(tname, tspan));
            }

            let default_value = if self.match_token(TokenKind::Equal) {
                Some(self.parse_expression()?)
            } else {
                None
            };

            params.push(Param {
                name,
                type_annotation,
                default_value,
                span,
            });

            if !self.match_token(TokenKind::Comma) {
                break;
            }
        }

        Ok(params)
    }

    fn parse_entity_decl(&mut self) -> Result<EntityDecl, ()> {
        let span = self.expect(TokenKind::KwEntity)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::LeftBrace)?;

        let mut fields = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let is_pub = self.match_token(TokenKind::KwPublic);
            let fspan = self.current_span();
            let fname = self.expect_identifier()?;

            let type_annotation = if self.match_token(TokenKind::KwAs) {
                Some(self.parse_type_expr()?)
            } else {
                None
            };

            let default_value = if self.match_token(TokenKind::Equal) {
                Some(self.parse_expression()?)
            } else {
                None
            };

            self.expect(TokenKind::Semicolon)?;

            fields.push(FieldDecl {
                name: fname,
                type_annotation,
                default_value,
                is_public: is_pub,
                span: fspan,
            });
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(EntityDecl {
            name,
            fields,
            is_public: false,
            is_packed: false,
            is_value: false,
            doc_comments: Vec::new(),
            attributes: Vec::new(),
            span,
        })
    }

    fn parse_actor_decl(&mut self) -> Result<ActorDecl, ()> {
        let span = self.expect(TokenKind::KwActor)?.span;
        let name = self.expect_identifier()?;

        let mut generic_params = Vec::new();
        if self.match_token(TokenKind::KwOf) {
            loop {
                generic_params.push(self.expect_identifier()?);
                if !self.match_token(TokenKind::Comma) {
                    break;
                }
            }
        }

        let parent = if self.match_token(TokenKind::KwIs) {
            Some(self.expect_identifier()?)
        } else {
            None
        };

        let mut traits = Vec::new();
        if self.match_token(TokenKind::KwHas) {
            loop {
                traits.push(self.expect_identifier()?);
                if !self.match_token(TokenKind::Comma) {
                    break;
                }
            }
        }

        self.expect(TokenKind::LeftBrace)?;

        let mut members = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            members.push(self.parse_actor_member()?);
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(ActorDecl {
            name,
            parent,
            traits,
            generic_params,
            members,
            is_public: false,
            is_abstract: false,
            is_sealed: false,
            is_system: false,
            doc_comments: Vec::new(),
            attributes: Vec::new(),
            span,
        })
    }

    fn parse_actor_member(&mut self) -> Result<ActorMember, ()> {
        let attributes = self.parse_attributes()?;
        let doc_comments = self.collect_doc_comments();
        let is_public = self.match_token(TokenKind::KwPublic);
        let is_abstract = self.match_token(TokenKind::KwAbstract);
        let is_static = self.match_token(TokenKind::KwStatic);

        match self.peek_kind() {
            TokenKind::KwFunction => {
                let mut f = self.parse_function_decl()?;
                f.is_public = is_public;
                f.is_static = is_static;
                f.is_abstract = is_abstract || f.is_abstract;
                f.doc_comments = doc_comments;
                f.attributes = attributes;
                Ok(ActorMember::Method(f))
            }
            TokenKind::KwProperty => Ok(ActorMember::Property(self.parse_property_decl(is_public)?)),
            TokenKind::KwEvent => Ok(ActorMember::Event(self.parse_event_decl(is_public)?)),
            TokenKind::KwOperator => Ok(ActorMember::Operator(self.parse_operator_decl()?)),
            TokenKind::KwConst => {
                let mut c = self.parse_const_decl()?;
                c.is_public = is_public;
                Ok(ActorMember::Const(c))
            }
            TokenKind::Identifier if self.peek_at_kind(1) == TokenKind::Semicolon
                || self.peek_at_kind(1) == TokenKind::Equal => {
                let fspan = self.current_span();
                let fname = self.expect_identifier()?;

                let default_value = if self.match_token(TokenKind::Equal) {
                    Some(self.parse_expression()?)
                } else {
                    None
                };

                self.expect(TokenKind::Semicolon)?;

                Ok(ActorMember::Field(FieldDecl {
                    name: fname,
                    type_annotation: None,
                    default_value,
                    is_public,
                    span: fspan,
                }))
            }
            _ if self.is_type_keyword() => {
                let fspan = self.current_span();
                let type_ann = self.parse_type_expr()?;
                let fname = self.expect_identifier()?;

                let default_value = if self.match_token(TokenKind::Equal) {
                    Some(self.parse_expression()?)
                } else {
                    None
                };

                self.expect(TokenKind::Semicolon)?;

                Ok(ActorMember::Field(FieldDecl {
                    name: fname,
                    type_annotation: Some(type_ann),
                    default_value,
                    is_public,
                    span: fspan,
                }))
            }
            _ => {
                let fspan = self.current_span();
                let fname = self.expect_identifier()?;

                let type_annotation = if self.match_token(TokenKind::KwAs) {
                    Some(self.parse_type_expr()?)
                } else {
                    None
                };

                let default_value = if self.match_token(TokenKind::Equal) {
                    Some(self.parse_expression()?)
                } else {
                    None
                };

                self.expect(TokenKind::Semicolon)?;

                Ok(ActorMember::Field(FieldDecl {
                    name: fname,
                    type_annotation,
                    default_value,
                    is_public,
                    span: fspan,
                }))
            }
        }
    }

    fn parse_property_decl(&mut self, is_public: bool) -> Result<PropertyDecl, ()> {
        let span = self.expect(TokenKind::KwProperty)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::LeftBrace)?;

        let mut getter = None;
        let mut setter = None;

        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let ident = self.expect_identifier()?;
            match ident.as_str() {
                "get" => {
                    let body = self.parse_block()?;
                    getter = Some(body);
                }
                "set" => {
                    let param = if self.match_token(TokenKind::LeftParen) {
                        let p = self.expect_identifier()?;
                        self.expect(TokenKind::RightParen)?;
                        p
                    } else {
                        "value".to_string()
                    };
                    let body = self.parse_block()?;
                    setter = Some((param, body));
                }
                other => {
                    self.error_at_current(&format!(
                        "Expected 'get' or 'set' inside property, got '{}'",
                        other
                    ));
                    return Err(());
                }
            }
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(PropertyDecl {
            name,
            getter,
            setter,
            is_public,
            span,
        })
    }

    fn parse_event_decl(&mut self, is_public: bool) -> Result<EventDecl, ()> {
        let span = self.expect(TokenKind::KwEvent)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::Semicolon)?;

        Ok(EventDecl {
            name,
            is_public,
            span,
        })
    }

    fn parse_choice_decl(&mut self) -> Result<ChoiceDecl, ()> {
        let span = self.expect(TokenKind::KwChoice)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::LeftBrace)?;

        let mut variants = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let vspan = self.current_span();
            let vname = self.expect_identifier()?;

            let fields = if self.match_token(TokenKind::LeftParen) {
                let params = self.parse_param_list()?;
                self.expect(TokenKind::RightParen)?;
                params
            } else {
                Vec::new()
            };

            variants.push(ChoiceVariant {
                name: vname,
                fields,
                span: vspan,
            });

            self.match_token(TokenKind::Comma);
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(ChoiceDecl {
            name,
            variants,
            is_public: false,
            doc_comments: Vec::new(),
            span,
        })
    }

    fn parse_operator_decl(&mut self) -> Result<OperatorDecl, ()> {
        let span = self.expect(TokenKind::KwOperator)?.span;

        // Expect an operator token (+, -, *, /, ==, !=, <, >, <=, >=)
        let op = match self.peek_kind() {
            TokenKind::Plus => { self.advance(); "+".to_string() }
            TokenKind::Minus => { self.advance(); "-".to_string() }
            TokenKind::Star => { self.advance(); "*".to_string() }
            TokenKind::Slash => { self.advance(); "/".to_string() }
            TokenKind::EqualEqual => { self.advance(); "==".to_string() }
            TokenKind::BangEqual => { self.advance(); "!=".to_string() }
            TokenKind::Less => { self.advance(); "<".to_string() }
            TokenKind::Greater => { self.advance(); ">".to_string() }
            TokenKind::LessEqual => { self.advance(); "<=".to_string() }
            TokenKind::GreaterEqual => { self.advance(); ">=".to_string() }
            TokenKind::Percent => { self.advance(); "%".to_string() }
            _ => {
                self.error_at_current("Expected operator symbol (+, -, *, /, ==, !=, <, >, <=, >=, %)");
                return Err(());
            }
        };

        self.expect(TokenKind::LeftParen)?;
        let pspan = self.current_span();
        let pname = self.expect_identifier()?;
        let param = Param {
            name: pname,
            type_annotation: None,
            default_value: None,
            span: pspan,
        };
        self.expect(TokenKind::RightParen)?;

        let body = self.parse_block()?;

        Ok(OperatorDecl { op, param, body, span })
    }

    fn parse_trait_decl(&mut self) -> Result<TraitDecl, ()> {
        let span = self.expect(TokenKind::KwTrait)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::LeftBrace)?;

        let mut members = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let is_public = self.match_token(TokenKind::KwPublic);

            if self.check(TokenKind::KwFunction) {
                let mut f = self.parse_function_decl()?;
                f.is_public = is_public;
                members.push(TraitMember::Method(f));
            } else {
                let fspan = self.current_span();
                let fname = self.expect_identifier()?;
                self.expect(TokenKind::Semicolon)?;
                members.push(TraitMember::Field(FieldDecl {
                    name: fname,
                    type_annotation: None,
                    default_value: None,
                    is_public,
                    span: fspan,
                }));
            }
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(TraitDecl {
            name,
            members,
            is_public: false,
            doc_comments: Vec::new(),
            span,
        })
    }

    fn parse_use_decl(&mut self) -> Result<UseDecl, ()> {
        let span = self.expect(TokenKind::KwUse)?.span;
        let mut path = vec![self.expect_identifier()?];

        let specific = if self.match_token(TokenKind::KwFrom) {
            let specific_items = path.clone();
            path = vec![self.expect_identifier()?];

            while self.match_token(TokenKind::Dot) {
                path.push(self.expect_identifier()?);
            }

            Some(specific_items)
        } else {
            while self.match_token(TokenKind::Comma) {
                path.push(self.expect_identifier()?);
            }
            None
        };

        self.expect(TokenKind::Semicolon)?;

        Ok(UseDecl {
            path,
            specific,
            span,
        })
    }

    fn parse_type_alias(&mut self) -> Result<TypeAliasDecl, ()> {
        let span = self.expect(TokenKind::KwType)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::Equal)?;
        let value = self.parse_type_expr()?;
        self.expect(TokenKind::Semicolon)?;

        Ok(TypeAliasDecl { name, value, span })
    }

    fn parse_extend_decl(&mut self) -> Result<ExtendDecl, ()> {
        let span = self.expect(TokenKind::KwExtend)?.span;
        let target = self.expect_identifier_or_type_keyword()?;
        self.expect(TokenKind::LeftBrace)?;

        let mut methods = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let doc_comments = self.collect_doc_comments();
            let is_pub = self.match_token(TokenKind::KwPublic);
            let mut f = self.parse_function_decl()?;
            f.is_public = is_pub;
            f.doc_comments = doc_comments;
            methods.push(f);
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(ExtendDecl {
            target,
            methods,
            span,
        })
    }

    fn parse_const_decl(&mut self) -> Result<ConstDecl, ()> {
        let span = self.expect(TokenKind::KwConst)?.span;
        let name = self.expect_identifier()?;
        self.expect(TokenKind::Equal)?;
        let value = self.parse_expression()?;
        self.expect(TokenKind::Semicolon)?;

        Ok(ConstDecl {
            name,
            value,
            is_public: false,
            doc_comments: Vec::new(),
            span,
        })
    }

    fn parse_conditional_compilation(&mut self) -> Result<ConditionalBlock, ()> {
        let span = self.expect(TokenKind::Hash)?.span;
        let keyword = self.expect_identifier()?;
        if keyword != "if" {
            self.error_at_current(&format!("Expected '#if', got '#{}'", keyword));
            return Err(());
        }

        let condition = self.expect_identifier()?;
        let value = self.expect_identifier()?;
        let then_body_stmts = self.parse_block()?;
        let then_body = then_body_stmts
            .into_iter()
            .map(Declaration::Statement)
            .collect();

        let else_body = if self.check(TokenKind::Hash) && self.peek_at_lexeme(1) == "else" {
            self.advance();
            self.advance();
            let else_stmts = self.parse_block()?;
            Some(else_stmts.into_iter().map(Declaration::Statement).collect())
        } else {
            None
        };

        Ok(ConditionalBlock {
            condition,
            value,
            then_body,
            else_body,
            span,
        })
    }

    fn parse_attributes(&mut self) -> Result<Vec<Attribute>, ()> {
        let mut attrs = Vec::new();
        while self.check(TokenKind::At) {
            let span = self.advance().span;
            let name = self.expect_identifier()?;
            let args = if self.match_token(TokenKind::LeftParen) {
                let mut parsed_args = Vec::new();
                if !self.check(TokenKind::RightParen) {
                    loop {
                        parsed_args.push(self.parse_expression()?);
                        if !self.match_token(TokenKind::Comma) {
                            break;
                        }
                    }
                }
                self.expect(TokenKind::RightParen)?;
                parsed_args
            } else {
                Vec::new()
            };

            attrs.push(Attribute { name, args, span });
        }
        Ok(attrs)
    }

    fn collect_doc_comments(&mut self) -> Vec<String> {
        let mut docs = Vec::new();
        while self.check(TokenKind::DocComment) {
            docs.push(self.advance().lexeme.clone());
        }
        docs
    }

    fn parse_bridge_decl(&mut self) -> Result<BridgeDecl, ()> {
        let span = self.expect(TokenKind::KwBridge)?.span;

        let lib_name = if self.check(TokenKind::StringLiteral) {
            let tok = self.advance();
            tok.lexeme.clone()
        } else {
            self.error_at_current("Expected library name string after 'bridge'");
            return Err(());
        };

        self.expect(TokenKind::LeftBrace)?;

        let mut functions = Vec::new();
        while !self.check(TokenKind::RightBrace) && !self.is_at_end() {
            let fspan = self.expect(TokenKind::KwFunction)?.span;
            let name = self.expect_identifier()?;
            self.expect(TokenKind::LeftParen)?;

            let mut params = Vec::new();
            let mut is_variadic = false;

            if !self.check(TokenKind::RightParen) {
                loop {
                    if self.check(TokenKind::Ellipsis) {
                        self.advance();
                        is_variadic = true;
                        break;
                    }
                    let pspan = self.current_span();
                    let pname = self.expect_member_name()?;
                    self.expect(TokenKind::KwAs)?;
                    let ptype = self.parse_type_expr()?;
                    params.push(BridgeParam {
                        name: pname,
                        type_annotation: ptype,
                        span: pspan,
                    });
                    if !self.match_token(TokenKind::Comma) {
                        break;
                    }
                }
            }

            self.expect(TokenKind::RightParen)?;

            let return_type = if self.match_token(TokenKind::KwOut) {
                Some(self.parse_type_expr()?)
            } else {
                None
            };

            self.expect(TokenKind::Semicolon)?;

            functions.push(BridgeFnDecl {
                name,
                params,
                return_type,
                is_variadic,
                span: fspan,
            });
        }

        self.expect(TokenKind::RightBrace)?;

        Ok(BridgeDecl {
            lib_name,
            functions,
            span,
        })
    }
}