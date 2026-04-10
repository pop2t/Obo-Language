use crate::parser::ast::*;

pub struct Formatter {
    buf: String,
    indent: usize,
}

impl Formatter {
    pub fn new() -> Self {
        Self {
            buf: String::new(),
            indent: 0,
        }
    }

    pub fn format(mut self, program: &Program) -> String {
        for (i, decl) in program.iter().enumerate() {
            if i > 0 {
                self.newline();
            }
            self.fmt_declaration(decl);
        }
        // Ensure trailing newline
        if !self.buf.ends_with('\n') {
            self.buf.push('\n');
        }
        self.buf
    }

    // ── helpers ──────────────────────────────────────────────

    fn push(&mut self, s: &str) {
        self.buf.push_str(s);
    }

    fn newline(&mut self) {
        self.buf.push('\n');
    }

    fn indent_str(&self) -> String {
        "    ".repeat(self.indent)
    }

    fn line(&mut self, s: &str) {
        let indent = self.indent_str();
        self.buf.push_str(&indent);
        self.buf.push_str(s);
        self.buf.push('\n');
    }

    fn line_no_newline(&mut self, s: &str) {
        let indent = self.indent_str();
        self.buf.push_str(&indent);
        self.buf.push_str(s);
    }

    // ── attributes ──────────────────────────────────────────

    fn fmt_attributes(&mut self, attrs: &[Attribute]) {
        for attr in attrs {
            let mut s = format!("@{}", attr.name);
            if !attr.args.is_empty() {
                s.push('(');
                for (i, arg) in attr.args.iter().enumerate() {
                    if i > 0 {
                        s.push_str(", ");
                    }
                    s.push_str(&self.fmt_expr_inline(arg));
                }
                s.push(')');
            }
            self.line(&s);
        }
    }

    fn fmt_doc_comments(&mut self, docs: &[String]) {
        for doc in docs {
            self.line(&format!("/// {}", doc.trim()));
        }
    }

    // ── type expressions ────────────────────────────────────

    fn fmt_type_expr(&self, ty: &TypeExpr) -> String {
        match ty {
            TypeExpr::Named(name, _) => name.clone(),
            TypeExpr::Generic(name, params, _) => {
                let parts: Vec<String> = params.iter().map(|p| self.fmt_type_expr(p)).collect();
                format!("{} of {}", name, parts.join(", "))
            }
            TypeExpr::MapType(k, v, _) => {
                format!("map of {} to {}", self.fmt_type_expr(k), self.fmt_type_expr(v))
            }
            TypeExpr::Union(types, _) => {
                let parts: Vec<String> = types.iter().map(|t| self.fmt_type_expr(t)).collect();
                parts.join(" or ")
            }
        }
    }

    // ── params ──────────────────────────────────────────────

    fn fmt_param(&self, p: &Param) -> String {
        let mut s = p.name.clone();
        if let Some(ref ty) = p.type_annotation {
            s.push_str(&format!(" as {}", self.fmt_type_expr(ty)));
        }
        if let Some(ref default) = p.default_value {
            s.push_str(&format!(" = {}", self.fmt_expr_inline(default)));
        }
        s
    }

    fn fmt_params(&self, params: &[Param]) -> String {
        params.iter().map(|p| self.fmt_param(p)).collect::<Vec<_>>().join(", ")
    }

    // ── declarations ────────────────────────────────────────

    fn fmt_declaration(&mut self, decl: &Declaration) {
        match decl {
            Declaration::Function(f) => self.fmt_function(f, false),
            Declaration::Entity(e) => self.fmt_entity(e),
            Declaration::Actor(a) => self.fmt_actor(a),
            Declaration::Choice(c) => self.fmt_choice(c),
            Declaration::Trait(t) => self.fmt_trait(t),
            Declaration::Use(u) => self.fmt_use(u),
            Declaration::TypeAlias(t) => self.fmt_type_alias(t),
            Declaration::Extend(e) => self.fmt_extend(e),
            Declaration::Const(c) => self.fmt_const_decl(c),
            Declaration::Bridge(b) => self.fmt_bridge(b),
            Declaration::ConditionalCompilation(cc) => self.fmt_conditional(cc),
            Declaration::Statement(s) => self.fmt_statement(s),
        }
    }

    fn fmt_function(&mut self, f: &FunctionDecl, is_trait_method: bool) {
        if !is_trait_method {
            self.fmt_doc_comments(&f.doc_comments);
        }
        self.fmt_attributes(&f.attributes);

        let mut prefix = String::new();
        if f.is_public { prefix.push_str("public "); }
        if f.is_static { prefix.push_str("shared "); }
        if f.is_abstract && !is_trait_method { prefix.push_str("template "); }
        if f.is_metal { prefix.push_str("metal "); }

        let sig = format!("{}function {}({})", prefix, f.name, self.fmt_params(&f.params));

        if f.is_abstract && f.body.is_empty() {
            self.line(&format!("{};", sig));
            return;
        }

        self.line(&sig);
        self.line("{");
        self.indent += 1;
        self.fmt_statements(&f.body);
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_entity(&mut self, e: &EntityDecl) {
        self.fmt_doc_comments(&e.doc_comments);
        self.fmt_attributes(&e.attributes);

        let prefix = if e.is_public { "public " } else { "" };
        self.line(&format!("{}entity {}", prefix, e.name));
        self.line("{");
        self.indent += 1;
        for field in &e.fields {
            self.fmt_field_decl(field);
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_field_decl(&mut self, f: &FieldDecl) {
        let mut s = String::new();
        if f.is_public { s.push_str("public "); }
        s.push_str(&f.name);
        if let Some(ref ty) = f.type_annotation {
            s.push_str(&format!(" as {}", self.fmt_type_expr(ty)));
        }
        if let Some(ref default) = f.default_value {
            s.push_str(&format!(" = {}", self.fmt_expr_inline(default)));
        }
        s.push(';');
        self.line(&s);
    }

    fn fmt_actor(&mut self, a: &ActorDecl) {
        self.fmt_doc_comments(&a.doc_comments);
        self.fmt_attributes(&a.attributes);

        let mut header = String::new();
        if a.is_public { header.push_str("public "); }
        if a.is_abstract { header.push_str("template "); }
        if a.is_sealed { header.push_str("final "); }
        if a.is_system { header.push_str("system "); }
        header.push_str(&format!("actor {}", a.name));

        if !a.generic_params.is_empty() {
            header.push_str(&format!(" of {}", a.generic_params.join(", ")));
        }
        if let Some(ref parent) = a.parent {
            header.push_str(&format!(" is {}", parent));
        }
        if !a.traits.is_empty() {
            header.push_str(&format!(" has {}", a.traits.join(", ")));
        }

        self.line(&header);
        self.line("{");
        self.indent += 1;
        for (i, member) in a.members.iter().enumerate() {
            if i > 0 {
                self.newline();
            }
            match member {
                ActorMember::Field(f) => self.fmt_field_decl(f),
                ActorMember::Method(m) => self.fmt_function(m, false),
                ActorMember::Property(p) => self.fmt_property(p),
                ActorMember::Event(e) => {
                    let prefix = if e.is_public { "public " } else { "" };
                    self.line(&format!("{}event {};", prefix, e.name));
                }
                ActorMember::Operator(op) => self.fmt_operator(op),
                ActorMember::Const(c) => self.fmt_const_decl(c),
            }
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_property(&mut self, p: &PropertyDecl) {
        let prefix = if p.is_public { "public " } else { "" };
        self.line(&format!("{}property {}", prefix, p.name));
        self.line("{");
        self.indent += 1;
        if let Some(ref getter) = p.getter {
            self.line("get");
            self.line("{");
            self.indent += 1;
            self.fmt_statements(getter);
            self.indent -= 1;
            self.line("}");
        }
        if let Some((ref param, ref setter)) = p.setter {
            self.line(&format!("set({})", param));
            self.line("{");
            self.indent += 1;
            self.fmt_statements(setter);
            self.indent -= 1;
            self.line("}");
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_operator(&mut self, op: &OperatorDecl) {
        self.line(&format!("operator {}({})", op.op, self.fmt_param(&op.param)));
        self.line("{");
        self.indent += 1;
        self.fmt_statements(&op.body);
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_choice(&mut self, c: &ChoiceDecl) {
        self.fmt_doc_comments(&c.doc_comments);
        let prefix = if c.is_public { "public " } else { "" };
        self.line(&format!("{}choice {}", prefix, c.name));
        self.line("{");
        self.indent += 1;
        for (i, variant) in c.variants.iter().enumerate() {
            let mut s = variant.name.clone();
            if !variant.fields.is_empty() {
                s.push('(');
                s.push_str(&self.fmt_params(&variant.fields));
                s.push(')');
            }
            if i < c.variants.len() - 1 {
                s.push(',');
            }
            self.line(&s);
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_trait(&mut self, t: &TraitDecl) {
        self.fmt_doc_comments(&t.doc_comments);
        let prefix = if t.is_public { "public " } else { "" };
        self.line(&format!("{}trait {}", prefix, t.name));
        self.line("{");
        self.indent += 1;
        for member in &t.members {
            match member {
                TraitMember::Field(f) => self.fmt_field_decl(f),
                TraitMember::Method(m) => self.fmt_function(m, true),
            }
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_use(&mut self, u: &UseDecl) {
        let path = u.path.join(".");
        if let Some(ref specific) = u.specific {
            self.line(&format!("use {}.{{{}}};", path, specific.join(", ")));
        } else {
            self.line(&format!("use {};", path));
        }
    }

    fn fmt_type_alias(&mut self, t: &TypeAliasDecl) {
        self.line(&format!("type {} = {};", t.name, self.fmt_type_expr(&t.value)));
    }

    fn fmt_extend(&mut self, e: &ExtendDecl) {
        self.line(&format!("extend {}", e.target));
        self.line("{");
        self.indent += 1;
        for (i, method) in e.methods.iter().enumerate() {
            if i > 0 {
                self.newline();
            }
            self.fmt_function(method, false);
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_const_decl(&mut self, c: &ConstDecl) {
        self.fmt_doc_comments(&c.doc_comments);
        let prefix = if c.is_public { "public " } else { "" };
        self.line(&format!("{}const {} = {};", prefix, c.name, self.fmt_expr_inline(&c.value)));
    }

    fn fmt_bridge(&mut self, b: &BridgeDecl) {
        self.line(&format!("bridge \"{}\"", b.lib_name));
        self.line("{");
        self.indent += 1;
        for func in &b.functions {
            let params: Vec<String> = func.params.iter().map(|p| {
                format!("{} as {}", p.name, self.fmt_type_expr(&p.type_annotation))
            }).collect();
            let mut s = format!("function {}({})", func.name, params.join(", "));
            if func.is_variadic {
                if params.is_empty() {
                    s = format!("function {}(...)", func.name);
                } else {
                    s = format!("function {}({}, ...)", func.name, params.join(", "));
                }
            }
            if let Some(ref ret) = func.return_type {
                s.push_str(&format!(" out {}", self.fmt_type_expr(ret)));
            }
            s.push(';');
            self.line(&s);
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_conditional(&mut self, cc: &ConditionalBlock) {
        self.line(&format!("#if {} == \"{}\"", cc.condition, cc.value));
        self.indent += 1;
        for decl in &cc.then_body {
            self.fmt_declaration(decl);
        }
        self.indent -= 1;
        if let Some(ref else_body) = cc.else_body {
            self.line("#else");
            self.indent += 1;
            for decl in else_body {
                self.fmt_declaration(decl);
            }
            self.indent -= 1;
        }
        self.line("#end");
    }

    // ── statements ──────────────────────────────────────────

    fn fmt_statements(&mut self, stmts: &[Statement]) {
        for stmt in stmts {
            self.fmt_statement(stmt);
        }
    }

    fn fmt_statement(&mut self, stmt: &Statement) {
        match stmt {
            Statement::VarDecl(v) => {
                let mut s = format!("{} = {}", v.name, self.fmt_expr_inline(&v.initializer));
                if let Some(ref ty) = v.type_annotation {
                    s = format!("{} as {} = {}", v.name, self.fmt_type_expr(ty), self.fmt_expr_inline(&v.initializer));
                }
                s.push(';');
                self.line(&s);
            }
            Statement::Assignment(a) => {
                self.line(&format!("{} = {};", self.fmt_expr_inline(&a.target), self.fmt_expr_inline(&a.value)));
            }
            Statement::MultiAssignment(m) => {
                self.line(&format!("{} = {};", m.targets.join(", "), self.fmt_expr_inline(&m.value)));
            }
            Statement::Expr(e) => {
                self.line(&format!("{};", self.fmt_expr_inline(e)));
            }
            Statement::Show(s) => {
                self.line(&format!("show {};", self.fmt_expr_inline(&s.value)));
            }
            Statement::Prompt(p) => {
                self.line(&format!("prompt {} into {};", self.fmt_expr_inline(&p.message), p.target));
            }
            Statement::If(i) => self.fmt_if(i),
            Statement::While(w) => {
                self.line(&format!("while ({})", self.fmt_expr_inline(&w.condition)));
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&w.body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Forever(f) => {
                self.line("forever");
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&f.body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Count(c) => {
                let mut header = format!("count ({} = {}, {}", c.var_name, self.fmt_expr_inline(&c.start), self.fmt_expr_inline(&c.end));
                if let Some(ref step) = c.step {
                    header.push_str(&format!(", {}", self.fmt_expr_inline(step)));
                }
                header.push(')');
                self.line(&header);
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&c.body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::ForIn(f) => {
                self.line(&format!("for ({} in {})", f.var_name, self.fmt_expr_inline(&f.iterable)));
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&f.body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Check(c) => self.fmt_check(c),
            Statement::Out(o) => {
                if o.values.is_empty() {
                    self.line("out;");
                } else {
                    let vals: Vec<String> = o.values.iter().map(|v| self.fmt_expr_inline(v)).collect();
                    self.line(&format!("out {};", vals.join(", ")));
                }
            }
            Statement::Stop(_) => {
                self.line("stop;");
            }
            Statement::Restart(_) => {
                self.line("restart;");
            }
            Statement::Wait(w) => {
                if w.is_wait_for_all {
                    self.line("wait for all;");
                } else if w.is_wait_for {
                    self.line(&format!("wait for {};", self.fmt_expr_inline(&w.duration)));
                } else {
                    self.line(&format!("wait ({});", self.fmt_expr_inline(&w.duration)));
                }
            }
            Statement::Run(r) => {
                self.line(&format!("run {};", self.fmt_expr_inline(&r.expr)));
            }
            Statement::Emit(e) => {
                self.line(&format!("emit {};", self.fmt_expr_inline(&e.value)));
            }
            Statement::PossibleBlock(p) => {
                self.line("possible");
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&p.body);
                self.indent -= 1;
                self.line("}");
                if let Some(ref err_name) = p.error_name {
                    self.line(&format!("else ({})", err_name));
                } else {
                    self.line("else");
                }
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&p.else_body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::SafeBlock(stmts, _) => {
                self.line("safe");
                self.line("{");
                self.indent += 1;
                self.fmt_statements(stmts);
                self.indent -= 1;
                self.line("}");
            }
            Statement::MetalBlock(stmts, _) => {
                self.line("metal");
                self.line("{");
                self.indent += 1;
                self.fmt_statements(stmts);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Defer(body, _) => {
                self.line("defer");
                self.line("{");
                self.indent += 1;
                self.fmt_statements(body);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Block(stmts) => {
                self.line("{");
                self.indent += 1;
                self.fmt_statements(stmts);
                self.indent -= 1;
                self.line("}");
            }
            Statement::Assert(a) => {
                if let Some(ref msg) = a.message {
                    self.line(&format!("assert({}, {});", self.fmt_expr_inline(&a.condition), self.fmt_expr_inline(msg)));
                } else {
                    self.line(&format!("assert({});", self.fmt_expr_inline(&a.condition)));
                }
            }
        }
    }

    fn fmt_if(&mut self, i: &IfStmt) {
        self.line(&format!("if ({})", self.fmt_expr_inline(&i.condition)));
        self.line("{");
        self.indent += 1;
        self.fmt_statements(&i.then_body);
        self.indent -= 1;
        self.line("}");
        if let Some(ref else_body) = i.else_body {
            // Check if the else body is a single if statement (else if chain)
            if else_body.len() == 1 {
                if let Statement::If(ref nested_if) = else_body[0] {
                    self.line_no_newline("else ");
                    // Remove the indent from the nested if since we're inlining it
                    let cond = self.fmt_expr_inline(&nested_if.condition);
                    self.push(&format!("if ({})\n", cond));
                    self.line("{");
                    self.indent += 1;
                    self.fmt_statements(&nested_if.then_body);
                    self.indent -= 1;
                    self.line("}");
                    if nested_if.else_body.is_some() {
                        self.fmt_if_else_tail(&nested_if.else_body);
                    }
                    return;
                }
            }
            self.line("else");
            self.line("{");
            self.indent += 1;
            self.fmt_statements(else_body);
            self.indent -= 1;
            self.line("}");
        }
    }

    fn fmt_if_else_tail(&mut self, else_body: &Option<Vec<Statement>>) {
        if let Some(ref body) = else_body {
            if body.len() == 1 {
                if let Statement::If(ref nested_if) = body[0] {
                    self.line_no_newline("else ");
                    let cond = self.fmt_expr_inline(&nested_if.condition);
                    self.push(&format!("if ({})\n", cond));
                    self.line("{");
                    self.indent += 1;
                    self.fmt_statements(&nested_if.then_body);
                    self.indent -= 1;
                    self.line("}");
                    if nested_if.else_body.is_some() {
                        self.fmt_if_else_tail(&nested_if.else_body);
                    }
                    return;
                }
            }
            self.line("else");
            self.line("{");
            self.indent += 1;
            self.fmt_statements(body);
            self.indent -= 1;
            self.line("}");
        }
    }

    fn fmt_check(&mut self, c: &CheckStmt) {
        self.line(&format!("check ({})", self.fmt_expr_inline(&c.value)));
        self.line("{");
        self.indent += 1;
        for arm in &c.arms {
            let pattern = self.fmt_check_pattern(&arm.pattern);
            if arm.body.len() == 1 {
                // Single-line arm
                let saved = std::mem::take(&mut self.buf);
                let saved_indent = self.indent;
                self.indent = 0;
                self.fmt_statement(&arm.body[0]);
                let inner = std::mem::replace(&mut self.buf, saved).trim().to_string();
                self.indent = saved_indent;
                self.line(&format!("{} {{ {} }}", pattern, inner));
            } else {
                self.line(&pattern);
                self.line("{");
                self.indent += 1;
                self.fmt_statements(&arm.body);
                self.indent -= 1;
                self.line("}");
            }
        }
        self.indent -= 1;
        self.line("}");
    }

    fn fmt_check_pattern(&self, pattern: &CheckPattern) -> String {
        match pattern {
            CheckPattern::Value(e) => format!("is {}", self.fmt_expr_inline(e)),
            CheckPattern::Comparison(op, e) => format!("is {} {}", op, self.fmt_expr_inline(e)),
            CheckPattern::TypeCheck(name, bindings) => {
                if let Some(ref fields) = bindings {
                    format!("is {}({})", name, fields.join(", "))
                } else {
                    format!("is {}", name)
                }
            }
            CheckPattern::TypeWithGuard(name, bindings, guard) => {
                let base = if let Some(ref fields) = bindings {
                    format!("is {}({})", name, fields.join(", "))
                } else {
                    format!("is {}", name)
                };
                format!("{} and {}", base, self.fmt_expr_inline(guard))
            }
            CheckPattern::Null => "is null".to_string(),
        }
    }

    // ── expressions (inline) ────────────────────────────────

    fn fmt_expr_inline(&self, expr: &Expr) -> String {
        match expr {
            Expr::NumberLit(n, _) => n.to_string(),
            Expr::DecimalLit(f, _) => {
                let s = f.to_string();
                if s.contains('.') { s } else { format!("{}.0", s) }
            }
            Expr::StringLit(s, _) => format!("\"{}\"", s.replace('\\', "\\\\").replace('"', "\\\"").replace('\n', "\\n").replace('\r', "\\r").replace('\t', "\\t")),
            Expr::CharLit(c, _) => format!("'{}'", c),
            Expr::BoolLit(b, _) => if *b { "true".into() } else { "false".into() },
            Expr::NullLit(_) => "null".into(),
            Expr::Identifier(name, _) => name.clone(),

            Expr::Binary(left, op, right, _) => {
                format!("{} {} {}", self.fmt_expr_inline(left), op, self.fmt_expr_inline(right))
            }
            Expr::Unary(op, expr, _) => {
                let prefix = match op {
                    UnaryOp::Neg => "-",
                    UnaryOp::Not => "not ",
                    UnaryOp::BitNot => "~",
                };
                format!("{}{}", prefix, self.fmt_expr_inline(expr))
            }
            Expr::Logical(left, op, right, _) => {
                format!("{} {} {}", self.fmt_expr_inline(left), op, self.fmt_expr_inline(right))
            }

            Expr::Call(callee, args, _) => {
                let args_str: Vec<String> = args.iter().map(|a| {
                    if let Some(ref name) = a.name {
                        format!("{} = {}", name, self.fmt_expr_inline(&a.value))
                    } else {
                        self.fmt_expr_inline(&a.value)
                    }
                }).collect();
                format!("{}({})", self.fmt_expr_inline(callee), args_str.join(", "))
            }
            Expr::MemberAccess(obj, member, _) => {
                format!("{}.{}", self.fmt_expr_inline(obj), member)
            }
            Expr::IndexAccess(obj, index, _) => {
                format!("{}[{}]", self.fmt_expr_inline(obj), self.fmt_expr_inline(index))
            }

            Expr::ListLiteral(items, _) => {
                let items_str: Vec<String> = items.iter().map(|e| self.fmt_expr_inline(e)).collect();
                format!("[{}]", items_str.join(", "))
            }
            Expr::MapLiteral(pairs, _) => {
                let pairs_str: Vec<String> = pairs.iter().map(|(k, v)| {
                    format!("{}: {}", self.fmt_expr_inline(k), self.fmt_expr_inline(v))
                }).collect();
                format!("[{}]", pairs_str.join(", "))
            }

            Expr::EntityInit(name, fields, _) => {
                if fields.is_empty() {
                    format!("{} {{}}", name)
                } else {
                    let fields_str: Vec<String> = fields.iter().map(|f| {
                        format!("{} = {}", f.name, self.fmt_expr_inline(&f.value))
                    }).collect();
                    format!("{} {{ {} }}", name, fields_str.join("; ") + ";")
                }
            }

            Expr::Cast(ty, expr, _) => {
                format!("({}){}",self.fmt_type_expr(ty), self.fmt_expr_inline(expr))
            }
            Expr::SafeCast(ty, expr, fallback, _) => {
                format!("({}){}  if possible else {}", self.fmt_type_expr(ty), self.fmt_expr_inline(expr), self.fmt_expr_inline(fallback))
            }

            Expr::InlineIf(value, cond, fallback, _) => {
                format!("{} if {} else {}", self.fmt_expr_inline(value), self.fmt_expr_inline(cond), self.fmt_expr_inline(fallback))
            }
            Expr::IfPossibleElse(expr, fallback, _) => {
                format!("{} if possible else {}", self.fmt_expr_inline(expr), self.fmt_expr_inline(fallback))
            }

            Expr::Range(start, end, step, _) => {
                let mut s = format!("{} to {}", self.fmt_expr_inline(start), self.fmt_expr_inline(end));
                if let Some(ref step) = step {
                    s.push_str(&format!(" step {}", self.fmt_expr_inline(step)));
                }
                s
            }

            Expr::Run(expr, _) => {
                format!("run {}", self.fmt_expr_inline(expr))
            }

            Expr::ChannelCreate(_) => "channel".into(),

            Expr::AtomicCreate(init, _) => {
                if let Some(ref val) = init {
                    format!("atomic({})", self.fmt_expr_inline(val))
                } else {
                    "atomic()".into()
                }
            }

            Expr::Action(params, body, _) => {
                let params_str = self.fmt_params(params);
                // Action always uses block form: action(params) { body }
                let stmts: Vec<String> = body.iter().map(|s| {
                    let mut f = Formatter::new();
                    f.fmt_statement(s);
                    f.buf.trim().to_string()
                }).collect();
                format!("action({}) {{ {} }}", params_str, stmts.join(" "))
            }
            Expr::ArrowAction(params, expr, _) => {
                let params_str = self.fmt_params(params);
                format!("({}) => {}", params_str, self.fmt_expr_inline(expr))
            }

            Expr::Pipe(left, right, _) => {
                format!("{} |> {}", self.fmt_expr_inline(left), self.fmt_expr_inline(right))
            }

            Expr::Own(expr, _) => {
                format!("own {}", self.fmt_expr_inline(expr))
            }

            Expr::InlineAsm(template, constraints, inputs, _) => {
                let inp: Vec<String> = inputs.iter().map(|e| self.fmt_expr_inline(e)).collect();
                if inp.is_empty() {
                    format!("asm(\"{}\", \"{}\")", template, constraints)
                } else {
                    format!("asm(\"{}\", \"{}\", {})", template, constraints, inp.join(", "))
                }
            }

            Expr::Interpolation(parts, _) => {
                // Reconstruct interpolated string: alternate string parts and expr parts
                let mut result = String::from("\"");
                for part in parts {
                    match part {
                        Expr::StringLit(s, _) => result.push_str(s),
                        other => {
                            result.push('{');
                            result.push_str(&self.fmt_expr_inline(other));
                            result.push('}');
                        }
                    }
                }
                result.push('"');
                result
            }

            Expr::MetalExpr(stmts, _) => {
                // For inline formatting, just indicate it's a metal expression
                let _ = stmts;
                "metal { ... }".to_string()
            }
            Expr::MemoStore { width, .. } => format!("memo.drop{}(...)", width),
            Expr::MemoLoad { width, .. } => format!("memo.grab{}(...)", width),
            Expr::MemoReserve(_, _) => "memo.reserve(...)".to_string(),
            Expr::MemoClean(_, _) => "memo.clean(...)".to_string(),
        }
    }
}
