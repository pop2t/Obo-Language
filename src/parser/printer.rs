use crate::parser::ast::*;

pub struct AstPrinter {
    indent: usize,
}

impl AstPrinter {
    pub fn new() -> Self {
        Self { indent: 0 }
    }

    pub fn print_program(&mut self, program: &Program) -> String {
        let mut out = String::from("Program\n");
        for decl in program {
            out.push_str(&self.print_declaration(decl));
        }
        out
    }

    fn pad(&self) -> String {
        "  ".repeat(self.indent)
    }

    fn line(&self, text: &str) -> String {
        format!("{}├── {}\n", self.pad(), text)
    }

    fn print_declaration(&mut self, decl: &Declaration) -> String {
        self.indent += 1;
        let result = match decl {
            Declaration::Function(f) => self.print_function(f),
            Declaration::Entity(e) => self.print_entity(e),
            Declaration::Actor(a) => self.print_actor(a),
            Declaration::Choice(c) => self.print_choice(c),
            Declaration::Trait(t) => self.print_trait(t),
            Declaration::Use(u) => {
                let items = if let Some(specific) = &u.specific {
                    format!("{} from {}", specific.join(", "), u.path.join("."))
                } else {
                    u.path.join(", ")
                };
                self.line(&format!("Use {{ {} }}", items))
            }
            Declaration::TypeAlias(t) => self.line(&format!("TypeAlias {{ {} }}", t.name)),
            Declaration::Extend(e) => {
                let mut s = self.line(&format!("Extend {{ {} }}", e.target));
                self.indent += 1;
                for m in &e.methods {
                    s.push_str(&self.print_function(m));
                }
                self.indent -= 1;
                s
            }
            Declaration::Const(c) => {
                let val = self.print_expr_inline(&c.value);
                self.line(&format!("Const {{ {} = {} }}", c.name, val))
            }
            Declaration::Bridge(b) => {
                let mut s = self.line(&format!("Bridge {{ \"{}\" }}", b.lib_name));
                self.indent += 1;
                for f in &b.functions {
                    let params: Vec<String> = f.params.iter().map(|p| p.name.clone()).collect();
                    let variadic = if f.is_variadic { ", ..." } else { "" };
                    s.push_str(&self.line(&format!("function {}({}{})", f.name, params.join(", "), variadic)));
                }
                self.indent -= 1;
                s
            }
            Declaration::ConditionalCompilation(c) => {
                self.line(&format!("#if {} {}", c.condition, c.value))
            }
            Declaration::Statement(s) => self.print_statement(s),
        };
        self.indent -= 1;
        result
    }

    fn print_function(&mut self, f: &FunctionDecl) -> String {
        let modifiers = [
            if f.is_public { "public " } else { "" },
            if f.is_static { "shared " } else { "" },
            if f.is_abstract { "template " } else { "" },
            if f.is_metal { "metal " } else { "" },
        ]
        .concat();

        let params: Vec<String> = f.params.iter().map(|p| {
            let mut s = p.name.clone();
            if let Some(t) = &p.type_annotation {
                s.push_str(&format!(" as {:?}", t));
            }
            if p.default_value.is_some() {
                s.push_str(" = ...");
            }
            s
        }).collect();

        let mut s = self.line(&format!(
            "{}Function {{ {}({}) }}",
            modifiers,
            f.name,
            params.join(", ")
        ));

        if !f.body.is_empty() {
            self.indent += 1;
            for stmt in &f.body {
                s.push_str(&self.print_statement(stmt));
            }
            self.indent -= 1;
        }

        s
    }

    fn print_entity(&mut self, e: &EntityDecl) -> String {
        let mut s = self.line(&format!("Entity {{ {} }}", e.name));
        self.indent += 1;
        for field in &e.fields {
            s.push_str(&self.line(&format!("Field {{ {} }}", field.name)));
        }
        self.indent -= 1;
        s
    }

    fn print_actor(&mut self, a: &ActorDecl) -> String {
        let mut desc = a.name.clone();
        if let Some(parent) = &a.parent {
            desc.push_str(&format!(" is {}", parent));
        }
        if !a.traits.is_empty() {
            desc.push_str(&format!(" has {}", a.traits.join(", ")));
        }

        let modifiers = [
            if a.is_system { "system " } else { "" },
            if a.is_abstract { "template " } else { "" },
            if a.is_sealed { "final " } else { "" },
        ]
        .concat();

        let mut s = self.line(&format!("{}Actor {{ {} }}", modifiers, desc));
        self.indent += 1;
        for member in &a.members {
            match member {
                ActorMember::Field(f) => {
                    let pub_str = if f.is_public { "public " } else { "" };
                    s.push_str(&self.line(&format!("{}Field {{ {} }}", pub_str, f.name)));
                }
                ActorMember::Method(f) => s.push_str(&self.print_function(f)),
                ActorMember::Property(p) => {
                    let has_get = if p.getter.is_some() { "get" } else { "" };
                    let has_set = if p.setter.is_some() { "set" } else { "" };
                    s.push_str(&self.line(&format!(
                        "Property {{ {} [{} {}] }}",
                        p.name, has_get, has_set
                    )));
                }
                ActorMember::Event(e) => {
                    s.push_str(&self.line(&format!("Event {{ {} }}", e.name)));
                }
                ActorMember::Const(c) => {
                    s.push_str(&self.line(&format!("Const {{ {} }}", c.name)));
                }
                ActorMember::Operator(o) => {
                    s.push_str(&self.line(&format!("Operator {{ {} }}", o.op)));
                }
            }
        }
        self.indent -= 1;
        s
    }

    fn print_choice(&mut self, c: &ChoiceDecl) -> String {
        let mut s = self.line(&format!("Choice {{ {} }}", c.name));
        self.indent += 1;
        for v in &c.variants {
            if v.fields.is_empty() {
                s.push_str(&self.line(&v.name));
            } else {
                let fields: Vec<&str> = v.fields.iter().map(|f| f.name.as_str()).collect();
                s.push_str(&self.line(&format!("{}({})", v.name, fields.join(", "))));
            }
        }
        self.indent -= 1;
        s
    }

    fn print_trait(&mut self, t: &TraitDecl) -> String {
        let mut s = self.line(&format!("Trait {{ {} }}", t.name));
        self.indent += 1;
        for m in &t.members {
            match m {
                TraitMember::Field(f) => {
                    s.push_str(&self.line(&format!("Field {{ {} }}", f.name)));
                }
                TraitMember::Method(f) => s.push_str(&self.print_function(f)),
            }
        }
        self.indent -= 1;
        s
    }

    fn print_statement(&mut self, stmt: &Statement) -> String {
        match stmt {
            Statement::Show(s) => {
                let val = self.print_expr_inline(&s.value);
                self.line(&format!("Show {{ {} }}", val))
            }
            Statement::Prompt(p) => {
                self.line(&format!("Prompt {{ into {} }}", p.target))
            }
            Statement::If(i) => {
                let cond = self.print_expr_inline(&i.condition);
                let mut s = self.line(&format!("If {{ {} }}", cond));
                self.indent += 1;
                s.push_str(&self.line("Then"));
                self.indent += 1;
                for stmt in &i.then_body {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                if let Some(else_body) = &i.else_body {
                    s.push_str(&self.line("Else"));
                    self.indent += 1;
                    for stmt in else_body {
                        s.push_str(&self.print_statement(stmt));
                    }
                    self.indent -= 1;
                }
                self.indent -= 1;
                s
            }
            Statement::While(w) => {
                let cond = self.print_expr_inline(&w.condition);
                let mut s = self.line(&format!("While {{ {} }}", cond));
                self.indent += 1;
                for stmt in &w.body {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                s
            }
            Statement::Forever(f) => {
                let mut s = self.line("Forever");
                self.indent += 1;
                for stmt in &f.body {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                s
            }
            Statement::Count(c) => {
                let start = self.print_expr_inline(&c.start);
                let end = self.print_expr_inline(&c.end);
                let mut s = self.line(&format!("Count {{ {} = {} to {} }}", c.var_name, start, end));
                self.indent += 1;
                for stmt in &c.body {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                s
            }
            Statement::ForIn(f) => {
                let iter = self.print_expr_inline(&f.iterable);
                let mut s = self.line(&format!("ForIn {{ {} in {} }}", f.var_name, iter));
                self.indent += 1;
                for stmt in &f.body {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                s
            }
            Statement::Check(c) => {
                let val = self.print_expr_inline(&c.value);
                let mut s = self.line(&format!("Check {{ {} }}", val));
                self.indent += 1;
                for arm in &c.arms {
                    let pattern = match &arm.pattern {
                        CheckPattern::Value(e) => format!("is {}", self.print_expr_inline(e)),
                        CheckPattern::Comparison(op, e) => {
                            format!("is {} {}", op, self.print_expr_inline(e))
                        }
                        CheckPattern::TypeCheck(t, bindings) => {
                            if let Some(b) = bindings {
                                format!("is {}({})", t, b.join(", "))
                            } else {
                                format!("is {}", t)
                            }
                        }
                        CheckPattern::TypeWithGuard(t, _, guard) => {
                            format!("is {} and {}", t, self.print_expr_inline(guard))
                        }
                        CheckPattern::Null => "is null".to_string(),
                    };
                    s.push_str(&self.line(&pattern));
                    self.indent += 1;
                    for stmt in &arm.body {
                        s.push_str(&self.print_statement(stmt));
                    }
                    self.indent -= 1;
                }
                self.indent -= 1;
                s
            }
            Statement::Out(o) => {
                if o.values.is_empty() {
                    self.line("Out")
                } else {
                    let vals: Vec<String> =
                        o.values.iter().map(|v| self.print_expr_inline(v)).collect();
                    self.line(&format!("Out {{ {} }}", vals.join(", ")))
                }
            }
            Statement::Stop(_) => self.line("Stop"),
            Statement::Restart(_) => self.line("Restart"),
            Statement::Wait(w) => {
                if w.is_wait_for_all {
                    self.line("WaitForAll")
                } else if w.is_wait_for {
                    let d = self.print_expr_inline(&w.duration);
                    self.line(&format!("WaitFor {{ {} }}", d))
                } else {
                    let d = self.print_expr_inline(&w.duration);
                    self.line(&format!("Wait {{ {} }}", d))
                }
            }
            Statement::Run(r) => {
                let e = self.print_expr_inline(&r.expr);
                self.line(&format!("Run {{ {} }}", e))
            }
            Statement::Emit(e) => {
                let v = self.print_expr_inline(&e.value);
                self.line(&format!("Emit {{ {} }}", v))
            }
            Statement::VarDecl(v) => {
                let val = self.print_expr_inline(&v.initializer);
                self.line(&format!("VarDecl {{ {} = {} }}", v.name, val))
            }
            Statement::Assignment(a) => {
                let target = self.print_expr_inline(&a.target);
                let val = self.print_expr_inline(&a.value);
                self.line(&format!("Assign {{ {} = {} }}", target, val))
            }
            Statement::MultiAssignment(m) => {
                let targets = m.targets.join(", ");
                let val = self.print_expr_inline(&m.value);
                self.line(&format!("MultiAssign {{ {} = {} }}", targets, val))
            }
            Statement::Expr(e) => {
                let val = self.print_expr_inline(e);
                self.line(&format!("Expr {{ {} }}", val))
            }
            Statement::PossibleBlock(_) => self.line("PossibleBlock { ... }"),
            Statement::SafeBlock(_, _) => self.line("SafeBlock { ... }"),
            Statement::MetalBlock(_, _) => self.line("MetalBlock { ... }"),
            Statement::Defer(_, _) => self.line("Defer { ... }"),
            Statement::Assert(a) => {
                let cond = self.print_expr_inline(&a.condition);
                if let Some(ref msg) = a.message {
                    self.line(&format!("Assert({}, {})", cond, self.print_expr_inline(msg)))
                } else {
                    self.line(&format!("Assert({})", cond))
                }
            }
            Statement::Block(stmts) => {
                let mut s = self.line("Block");
                self.indent += 1;
                for stmt in stmts {
                    s.push_str(&self.print_statement(stmt));
                }
                self.indent -= 1;
                s
            }
        }
    }

    fn print_expr_inline(&self, expr: &Expr) -> String {
        match expr {
            Expr::NumberLit(n, _) => n.to_string(),
            Expr::DecimalLit(n, _) => n.to_string(),
            Expr::StringLit(s, _) => format!("\"{}\"", s),
            Expr::CharLit(c, _) => format!("'{}'", c),
            Expr::BoolLit(b, _) => b.to_string(),
            Expr::NullLit(_) => "null".to_string(),
            Expr::Identifier(name, _) => name.clone(),
            Expr::Binary(left, op, right, _) => {
                format!(
                    "({} {} {})",
                    self.print_expr_inline(left),
                    op,
                    self.print_expr_inline(right)
                )
            }
            Expr::Unary(op, operand, _) => {
                let op_str = match op {
                    UnaryOp::Neg => "-",
                    UnaryOp::Not => "not ",
                    UnaryOp::BitNot => "~",
                };
                format!("({}{})", op_str, self.print_expr_inline(operand))
            }
            Expr::Logical(left, op, right, _) => {
                format!(
                    "({} {} {})",
                    self.print_expr_inline(left),
                    op,
                    self.print_expr_inline(right)
                )
            }
            Expr::Call(callee, args, _) => {
                let args_str: Vec<String> = args
                    .iter()
                    .map(|a| {
                        if let Some(name) = &a.name {
                            format!("{} = {}", name, self.print_expr_inline(&a.value))
                        } else {
                            self.print_expr_inline(&a.value)
                        }
                    })
                    .collect();
                format!("{}({})", self.print_expr_inline(callee), args_str.join(", "))
            }
            Expr::MemberAccess(obj, member, _) => {
                format!("{}.{}", self.print_expr_inline(obj), member)
            }
            Expr::IndexAccess(obj, idx, _) => {
                format!("{}[{}]", self.print_expr_inline(obj), self.print_expr_inline(idx))
            }
            Expr::ListLiteral(elems, _) => {
                let items: Vec<String> = elems.iter().map(|e| self.print_expr_inline(e)).collect();
                format!("[{}]", items.join(", "))
            }
            Expr::MapLiteral(pairs, _) => {
                let items: Vec<String> = pairs
                    .iter()
                    .map(|(k, v)| {
                        format!("{}: {}", self.print_expr_inline(k), self.print_expr_inline(v))
                    })
                    .collect();
                format!("[{}]", items.join(", "))
            }
            Expr::EntityInit(name, fields, _) => {
                let f: Vec<String> = fields
                    .iter()
                    .map(|fi| format!("{} = {}", fi.name, self.print_expr_inline(&fi.value)))
                    .collect();
                format!("{} {{ {} }}", name, f.join("; "))
            }
            Expr::Cast(_, expr, _) => format!("(cast){}", self.print_expr_inline(expr)),
            Expr::SafeCast(_, expr, fallback, _) => {
                format!(
                    "{} if possible else {}",
                    self.print_expr_inline(expr),
                    self.print_expr_inline(fallback)
                )
            }
            Expr::InlineIf(value, cond, fallback, _) => {
                format!(
                    "{} if {} else {}",
                    self.print_expr_inline(value),
                    self.print_expr_inline(cond),
                    self.print_expr_inline(fallback)
                )
            }
            Expr::IfPossibleElse(expr, fallback, _) => {
                format!(
                    "{} if possible else {}",
                    self.print_expr_inline(expr),
                    self.print_expr_inline(fallback)
                )
            }
            Expr::Range(start, end, step, _) => {
                let mut s = format!(
                    "{} to {}",
                    self.print_expr_inline(start),
                    self.print_expr_inline(end)
                );
                if let Some(step) = step {
                    s.push_str(&format!(" step {}", self.print_expr_inline(step)));
                }
                s
            }
            Expr::Run(expr, _) => {
                format!("run {}", self.print_expr_inline(expr))
            }
            Expr::ChannelCreate(_) => {
                "channel".to_string()
            }
            Expr::AtomicCreate(init, _) => {
                if let Some(expr) = init {
                    format!("atomic({})", self.print_expr_inline(expr))
                } else {
                    "atomic".to_string()
                }
            }
            Expr::Action(params, _, _) => {
                let p: Vec<&str> = params.iter().map(|p| p.name.as_str()).collect();
                format!("action({}) {{ ... }}", p.join(", "))
            }
            Expr::ArrowAction(params, body, _) => {
                let p: Vec<&str> = params.iter().map(|p| p.name.as_str()).collect();
                format!("{} => {}", p.join(", "), self.print_expr_inline(body))
            }
            Expr::Pipe(left, right, _) => {
                format!(
                    "{} |> {}",
                    self.print_expr_inline(left),
                    self.print_expr_inline(right)
                )
            }
            Expr::Own(expr, _) => {
                format!("own {}", self.print_expr_inline(expr))
            }
            Expr::InlineAsm(template, constraints, inputs, _) => {
                let inp: Vec<String> = inputs.iter().map(|e| self.print_expr_inline(e)).collect();
                if inp.is_empty() {
                    format!("asm(\"{}\", \"{}\")", template, constraints)
                } else {
                    format!("asm(\"{}\", \"{}\", {})", template, constraints, inp.join(", "))
                }
            }
            Expr::Interpolation(parts, _) => {
                let p: Vec<String> = parts.iter().map(|e| self.print_expr_inline(e)).collect();
                format!("interp({})", p.join(", "))
            }
            Expr::MetalExpr(_, _) => {
                "metal { ... }".to_string()
            }
            Expr::MemoStore { width, .. } => format!("memo.drop{}(...)", width),
            Expr::MemoLoad { width, .. } => format!("memo.grab{}(...)", width),
            Expr::MemoReserve(_, _) => "memo.reserve(...)".to_string(),
            Expr::MemoClean(_, _) => "memo.clean(...)".to_string(),
        }
    }
}
