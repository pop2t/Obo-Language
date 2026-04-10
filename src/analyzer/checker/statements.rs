use crate::error::{ErrorKind, OboError};
use crate::lexer::token::Span;
use crate::parser::ast::*;

use super::super::symbols::{Symbol, SymbolKind, TypeInfoKind};
use super::super::types::OboType;
use super::Checker;

impl Checker {
    pub(super) fn check_statements(&mut self, stmts: &[Statement]) {
        for stmt in stmts {
            self.check_statement(stmt);
        }
    }

    pub(super) fn check_statement(&mut self, stmt: &Statement) {
        match stmt {
            Statement::VarDecl(v) => {
                let ty = self.infer_expr_type(&v.initializer);
                // OBO uses define_or_set at runtime: reassign an existing
                // variable anywhere in the scope chain, only create a new
                // binding when none exists.  Mirror that here so we don't
                // produce false shadowing/unused warnings.
                if self.symbols.lookup(&v.name).is_some() {
                    self.symbols.mark_used(&v.name);
                } else {
                    self.symbols
                        .define_variable(&v.name, ty, SymbolKind::Variable, false, v.span);
                }
            }
            Statement::Assignment(a) => {
                let rhs_type = self.infer_expr_type(&a.value);

                if let Expr::Identifier(name, span) = &a.target {
                    if let Some(sym) = self.symbols.lookup(name).cloned() {
                        if sym.is_const {
                            self.errors.push(
                                OboError::new(
                                    ErrorKind::ConstReassignment,
                                    format!(
                                        "'{}' is a constant — you can't change it after it's set",
                                        name
                                    ),
                                    *span,
                                )
                                .with_secondary(sym.defined_at, "declared as const here".to_string())
                                .with_hint(
                                    "Use a regular variable if you need to change this value",
                                ),
                            );
                        } else {
                            if sym.ty == OboType::Null || sym.ty.is_nullable() {
                                if let Some(sym_mut) = self.symbols.lookup_mut(name) {
                                    sym_mut.ty = rhs_type.clone();
                                }
                            } else if !sym.ty.is_unknown()
                                && !rhs_type.is_unknown()
                                && !rhs_type.is_error()
                                && !rhs_type.can_assign_to(&sym.ty)
                            {
                                self.errors.push(
                                    OboError::new(
                                        ErrorKind::TypeMismatch,
                                        format!(
                                            "'{}' is a {}, but you're trying to assign a {}",
                                            name,
                                            sym.ty.display_name(),
                                            rhs_type.display_name(),
                                        ),
                                        a.span,
                                    )
                                    .with_hint(format!(
                                        "Expected {}, got {}",
                                        sym.ty.display_name(),
                                        rhs_type.display_name(),
                                    )),
                                );
                            }
                            self.symbols.mark_used(name);
                        }
                    } else {
                        self.symbols
                            .define_variable(name, rhs_type, SymbolKind::Variable, false, *span);
                    }
                } else {
                    self.infer_expr_type(&a.target);
                }
            }
            Statement::MultiAssignment(m) => {
                let rhs_type = self.infer_expr_type(&m.value);
                for target in &m.targets {
                    self.symbols.define_variable(
                        target,
                        OboType::Unknown,
                        SymbolKind::Variable,
                        false,
                        m.span,
                    );
                }
                let _ = rhs_type;
            }
            Statement::Show(s) => {
                self.infer_expr_type(&s.value);
            }
            Statement::Prompt(p) => {
                self.infer_expr_type(&p.message);
                self.symbols.define_variable(&p.target, OboType::Text, SymbolKind::Variable, false, p.span);
            }
            Statement::If(i) => {
                let cond_type = self.infer_expr_type(&i.condition);
                if !cond_type.is_unknown() && !cond_type.is_error() && cond_type != OboType::Flag {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::TypeMismatch,
                            format!(
                                "if condition should be a flag (true/false), but this is a {}",
                                cond_type.display_name()
                            ),
                            i.span,
                        )
                        .with_hint("Conditions must evaluate to true or false"),
                    );
                }

                // Null-narrowing: detect `if (x is null)` / `if (x is not null)`
                let null_check = Self::extract_null_check(&i.condition);

                // If condition is `x is not null`, narrow x inside then-body
                if let Some((ref var_name, false)) = null_check {
                    if let Some(inner) = self.unwrap_nullable(var_name) {
                        self.symbols.push_scope();
                        // Temporarily narrow the variable type
                        if let Some(sym) = self.symbols.lookup_mut(var_name) {
                            sym.ty = inner;
                        }
                        self.check_statements(&i.then_body);
                        let locals = self.symbols.pop_scope();
                        self.check_unused_variables(&locals);

                        if let Some(ref else_body) = i.else_body {
                            self.symbols.push_scope();
                            self.check_statements(else_body);
                            let locals = self.symbols.pop_scope();
                            self.check_unused_variables(&locals);
                        }
                        // Skip the rest — we already handled this if
                        return;
                    }
                }

                self.symbols.push_scope();
                self.check_statements(&i.then_body);
                let locals = self.symbols.pop_scope();
                self.check_unused_variables(&locals);

                if let Some(ref else_body) = i.else_body {
                    // If condition is `x is null`, narrow x inside else-body
                    if let Some((ref var_name, true)) = null_check {
                        if let Some(inner) = self.unwrap_nullable(var_name) {
                            if let Some(sym) = self.symbols.lookup_mut(var_name) {
                                sym.ty = inner;
                            }
                        }
                    }
                    self.symbols.push_scope();
                    self.check_statements(else_body);
                    let locals = self.symbols.pop_scope();
                    self.check_unused_variables(&locals);
                }

                // If condition is `x is null` and then-body always exits,
                // narrow x for code after the if.
                if let Some((ref var_name, true)) = null_check {
                    if Self::body_always_exits(&i.then_body) {
                        if let Some(inner) = self.unwrap_nullable(var_name) {
                            if let Some(sym) = self.symbols.lookup_mut(var_name) {
                                sym.ty = inner;
                            }
                        }
                    }
                }
            }
            Statement::While(w) => {
                let cond_type = self.infer_expr_type(&w.condition);
                if !cond_type.is_unknown() && !cond_type.is_error() && cond_type != OboType::Flag {
                    self.errors.push(OboError::new(
                        ErrorKind::TypeMismatch,
                        format!(
                            "while condition should be a flag, but this is a {}",
                            cond_type.display_name()
                        ),
                        w.span,
                    ));
                }
                let prev_in_loop = self.in_loop;
                self.in_loop = true;
                self.symbols.push_scope();
                self.check_statements(&w.body);
                let locals = self.symbols.pop_scope();
                self.check_unused_variables(&locals);
                self.in_loop = prev_in_loop;
            }
            Statement::Forever(f) => {
                let prev_in_loop = self.in_loop;
                self.in_loop = true;
                self.symbols.push_scope();
                self.check_statements(&f.body);
                let locals = self.symbols.pop_scope();
                self.check_unused_variables(&locals);
                self.in_loop = prev_in_loop;
            }
            Statement::Count(c) => {
                let start_type = self.infer_expr_type(&c.start);
                let end_type = self.infer_expr_type(&c.end);

                if !start_type.is_unknown() && !start_type.is_error() && !start_type.is_numeric() {
                    self.errors.push(OboError::new(
                        ErrorKind::TypeMismatch,
                        format!("count start must be a number, got {}", start_type),
                        c.span,
                    ));
                }
                if !end_type.is_unknown() && !end_type.is_error() && !end_type.is_numeric() {
                    self.errors.push(OboError::new(
                        ErrorKind::TypeMismatch,
                        format!("count end must be a number, got {}", end_type),
                        c.span,
                    ));
                }
                if let Some(ref step) = c.step {
                    let step_type = self.infer_expr_type(step);
                    if !step_type.is_unknown()
                        && !step_type.is_error()
                        && !step_type.is_numeric()
                    {
                        self.errors.push(OboError::new(
                            ErrorKind::TypeMismatch,
                            format!("count step must be a number, got {}", step_type),
                            c.span,
                        ));
                    }
                }

                let prev_in_loop = self.in_loop;
                self.in_loop = true;
                self.symbols.push_scope();
                self.symbols.define_variable(
                    &c.var_name,
                    OboType::Number,
                    SymbolKind::LoopVar,
                    false,
                    c.span,
                );
                self.check_statements(&c.body);
                let locals = self.symbols.pop_scope();
                self.check_unused_variables(&locals);
                self.in_loop = prev_in_loop;
            }
            Statement::ForIn(f) => {
                let iter_type = self.infer_expr_type(&f.iterable);
                let elem_type = match &iter_type {
                    OboType::List(inner) => *inner.clone(),
                    OboType::Text => OboType::Char,
                    _ => OboType::Unknown,
                };

                let prev_in_loop = self.in_loop;
                self.in_loop = true;
                self.symbols.push_scope();
                self.symbols.define_variable(
                    &f.var_name,
                    elem_type,
                    SymbolKind::LoopVar,
                    false,
                    f.span,
                );
                self.check_statements(&f.body);
                let locals = self.symbols.pop_scope();
                self.check_unused_variables(&locals);
                self.in_loop = prev_in_loop;
            }
            Statement::Check(c) => {
                self.infer_expr_type(&c.value);
                for arm in &c.arms {
                    self.check_pattern(&arm.pattern);
                    self.symbols.push_scope();
                    // Register destructured bindings inside the arm scope
                    match &arm.pattern {
                        CheckPattern::TypeCheck(_, Some(bindings))
                        | CheckPattern::TypeWithGuard(_, Some(bindings), _) => {
                            for name in bindings {
                                self.symbols.define_variable(
                                    name,
                                    OboType::Unknown,
                                    SymbolKind::Variable,
                                    false,
                                    arm.span,
                                );
                            }
                        }
                        _ => {}
                    }
                    self.check_statements(&arm.body);
                    self.symbols.pop_scope();
                }
            }
            Statement::Out(o) => {
                for val in &o.values {
                    self.infer_expr_type(val);
                }
            }
            Statement::Stop(span) => {
                if !self.in_loop {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "stop can only be used inside a loop (while, forever, count, for)",
                            *span,
                        )
                        .with_hint(
                            "stop breaks out of the current loop — but there's no loop here",
                        ),
                    );
                }
            }
            Statement::Restart(span) => {
                if !self.in_loop {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "restart can only be used inside a loop",
                            *span,
                        )
                        .with_hint(
                            "restart skips to the next iteration — but there's no loop here",
                        ),
                    );
                }
            }
            Statement::Expr(e) => {
                self.infer_expr_type(e);
            }
            Statement::PossibleBlock(p) => {
                self.symbols.push_scope();
                self.check_statements(&p.body);
                self.symbols.pop_scope();
                self.symbols.push_scope();
                if let Some(ref err_name) = p.error_name {
                    self.symbols.define_variable(
                        err_name,
                        OboType::Text,
                        SymbolKind::Variable,
                        false,
                        p.span,
                    );
                }
                self.check_statements(&p.else_body);
                self.symbols.pop_scope();
            }
            Statement::Block(stmts) => {
                self.symbols.push_scope();
                self.check_statements(stmts);
                self.symbols.pop_scope();
            }
            Statement::SafeBlock(stmts, _) => {
                let was_metal = self.in_metal;
                self.in_metal = false; // safe {} resets to safe context
                self.symbols.push_scope();
                self.check_statements(stmts);
                self.symbols.pop_scope();
                self.in_metal = was_metal;
            }
            Statement::MetalBlock(stmts, _) => {
                let was_metal = self.in_metal;
                self.in_metal = true;
                self.symbols.push_scope();
                self.check_statements(stmts);
                self.symbols.pop_scope();
                self.in_metal = was_metal;
            }
            Statement::Defer(body, span) => {
                if !self.in_metal {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "defer is only allowed inside metal blocks",
                            *span,
                        )
                        .with_hint("Wrap this code in a metal { } block to use defer."),
                    );
                }
                self.check_statements(body);
            }
            Statement::Wait(w) => {
                if w.is_wait_for_all {
                    return;
                }

                let wait_type = self.infer_expr_type(&w.duration);
                if wait_type.is_unknown() || wait_type.is_error() {
                    return;
                }

                if w.is_wait_for {
                    if wait_type != OboType::Task {
                        self.errors.push(
                            OboError::new(
                                ErrorKind::TypeMismatch,
                                format!(
                                    "wait for expects a task handle, but this is a {}",
                                    wait_type.display_name()
                                ),
                                w.span,
                            )
                            .with_hint("Use `run ...` to create a task before waiting for it"),
                        );
                    }
                } else if !wait_type.is_numeric() {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::TypeMismatch,
                            format!(
                                "wait(duration) expects a number, but this is a {}",
                                wait_type.display_name()
                            ),
                            w.span,
                        )
                        .with_hint("Pass a millisecond count like wait(100)"),
                    );
                }
            }
            Statement::Run(r) => {
                if self.in_metal {
                    self.errors.push(
                        OboError::new(
                            ErrorKind::InvalidOperation,
                            "run (async tasks) can't be used inside metal blocks",
                            r.span,
                        )
                        .with_hint("Move async operations outside the metal block."),
                    );
                }
                self.infer_expr_type(&r.expr);
            }
            Statement::Emit(e) => {
                self.infer_expr_type(&e.value);
            }
            Statement::Assert(a) => {
                self.infer_expr_type(&a.condition);
                if let Some(ref msg) = a.message {
                    self.infer_expr_type(msg);
                }
            }
        }
    }

    fn check_pattern(&mut self, pattern: &CheckPattern) {
        match pattern {
            CheckPattern::Value(expr) | CheckPattern::Comparison(_, expr) => {
                self.infer_expr_type(expr);
            }
            CheckPattern::TypeCheck(type_name, _) => {
                if self.symbols.lookup_type(type_name).is_none()
                    && !self.is_known_variant(type_name)
                {
                    self.errors.push(OboError::new(
                        ErrorKind::UndeclaredType,
                        format!("Unknown type '{}' in pattern", type_name),
                        Span {
                            line: 0,
                            column: 0,
                            length: 0,
                        },
                    ));
                }
            }
            CheckPattern::TypeWithGuard(_, _, guard) => {
                self.infer_expr_type(guard);
            }
            CheckPattern::Null => {}
        }
    }

    fn is_known_variant(&self, name: &str) -> bool {
        for ty in self.symbols.type_names() {
            if let Some(info) = self.symbols.lookup_type(&ty) {
                if let TypeInfoKind::Choice { variants } = &info.kind {
                    if variants.iter().any(|v| v.name == name) {
                        return true;
                    }
                }
            }
        }
        false
    }

    pub(super) fn check_unused_variables(&mut self, locals: &[Symbol]) {
        for sym in locals {
            if !sym.used
                && sym.kind != SymbolKind::LoopVar
                && sym.kind != SymbolKind::Parameter
                && !sym.name.starts_with('_')
            {
                self.errors.push(
                    OboError::new(
                        ErrorKind::UnusedVariable,
                        format!("'{}' is defined but never used — that's a waste!", sym.name),
                        sym.defined_at,
                    )
                    .with_hint(format!(
                        "Remove it or prefix with _ to silence this: _{}",
                        sym.name
                    )),
                );
            }
        }
    }

    /// Extract a null-check pattern from a condition expression.
    /// Returns `Some((var_name, is_null_check))` where `is_null_check` is true
    /// for `x is null` and false for `x is not null`.
    fn extract_null_check(expr: &Expr) -> Option<(String, bool)> {
        match expr {
            Expr::Binary(left, BinOp::Eq, right, _) => {
                if let (Expr::Identifier(name, _), Expr::NullLit(_)) = (left.as_ref(), right.as_ref()) {
                    return Some((name.clone(), true));
                }
                if let (Expr::NullLit(_), Expr::Identifier(name, _)) = (left.as_ref(), right.as_ref()) {
                    return Some((name.clone(), true));
                }
                None
            }
            Expr::Binary(left, BinOp::NotEq, right, _) => {
                if let (Expr::Identifier(name, _), Expr::NullLit(_)) = (left.as_ref(), right.as_ref()) {
                    return Some((name.clone(), false));
                }
                if let (Expr::NullLit(_), Expr::Identifier(name, _)) = (left.as_ref(), right.as_ref()) {
                    return Some((name.clone(), false));
                }
                None
            }
            _ => None,
        }
    }

    /// Check if a block always exits (ends with stop, restart, or out).
    fn body_always_exits(body: &[Statement]) -> bool {
        if let Some(last) = body.last() {
            matches!(last,
                Statement::Stop(_)
                | Statement::Restart(_)
                | Statement::Out(_)
            )
        } else {
            false
        }
    }

    /// If the variable has a Nullable type, return the inner type.
    fn unwrap_nullable(&self, name: &str) -> Option<OboType> {
        let sym = self.symbols.lookup(name)?;
        match &sym.ty {
            OboType::Nullable(inner) => Some(*inner.clone()),
            _ => None,
        }
    }
}