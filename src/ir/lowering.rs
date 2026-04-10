use std::collections::{HashMap, HashSet};

use crate::parser::ast;
use crate::stdlib::SYSTEM_ACTORS;
use super::inst::*;

fn ast_param_ir_type(p: &ast::Param) -> IrParamType {
    match &p.type_annotation {
        Some(ast::TypeExpr::Named(name, _)) if name == "text" => IrParamType::Str,
        Some(ast::TypeExpr::Named(name, _)) if name == "flag" => IrParamType::Bool,
        Some(ast::TypeExpr::Named(name, _)) if name == "number" => IrParamType::I64,
        Some(ast::TypeExpr::Named(name, _)) if name == "decimal" => IrParamType::F64,
        Some(ast::TypeExpr::Named(name, _)) if name == "f32" || name == "f64" => IrParamType::F64,
        _ => IrParamType::I64,
    }
}

fn obo_type_to_llvm(te: &ast::TypeExpr) -> String {
    match te {
        ast::TypeExpr::Named(name, _) => match name.as_str() {
            "number" | "i64" | "u64" => "i64".to_string(),
            "i8" | "u8" => "i8".to_string(),
            "i16" | "u16" => "i16".to_string(),
            "i32" | "u32" => "i32".to_string(),
            "decimal" | "f64" => "double".to_string(),
            "f32" => "float".to_string(),
            "text" => "i8*".to_string(),
            "pointer" => "i8*".to_string(),
            "handle" => "i8*".to_string(),
            "flag" => "i64".to_string(),
            "byte" => "i8".to_string(),
            "nothing" => "void".to_string(),
            _ => "i8*".to_string(),
        },
        _ => "i8*".to_string(),
    }
}

/// Collect all identifier names referenced in an expression (non-recursive into sub-closures).
fn collect_free_vars_expr(expr: &ast::Expr, out: &mut HashSet<String>) {
    match expr {
        ast::Expr::Identifier(name, _) => { out.insert(name.clone()); }
        ast::Expr::Binary(l, _, r, _) => { collect_free_vars_expr(l, out); collect_free_vars_expr(r, out); }
        ast::Expr::Unary(_, e, _) => collect_free_vars_expr(e, out),
        ast::Expr::Logical(l, _, r, _) => { collect_free_vars_expr(l, out); collect_free_vars_expr(r, out); }
        ast::Expr::Call(callee, args, _) => {
            collect_free_vars_expr(callee, out);
            for a in args { collect_free_vars_expr(&a.value, out); }
        }
        ast::Expr::MemberAccess(obj, _, _) => collect_free_vars_expr(obj, out),
        ast::Expr::IndexAccess(obj, idx, _) => { collect_free_vars_expr(obj, out); collect_free_vars_expr(idx, out); }
        ast::Expr::ListLiteral(elems, _) => { for e in elems { collect_free_vars_expr(e, out); } }
        ast::Expr::MapLiteral(pairs, _) => { for (k, v) in pairs { collect_free_vars_expr(k, out); collect_free_vars_expr(v, out); } }
        ast::Expr::EntityInit(_, fields, _) => { for f in fields { collect_free_vars_expr(&f.value, out); } }
        ast::Expr::InlineIf(v, c, f, _) => { collect_free_vars_expr(v, out); collect_free_vars_expr(c, out); collect_free_vars_expr(f, out); }
        ast::Expr::IfPossibleElse(v, f, _) => { collect_free_vars_expr(v, out); collect_free_vars_expr(f, out); }
        ast::Expr::SafeCast(_, e, f, _) => { collect_free_vars_expr(e, out); collect_free_vars_expr(f, out); }
        ast::Expr::Interpolation(parts, _) => { for p in parts { collect_free_vars_expr(p, out); } }
        ast::Expr::Range(s, e, st, _) => { collect_free_vars_expr(s, out); collect_free_vars_expr(e, out); if let Some(st) = st { collect_free_vars_expr(st, out); } }
        ast::Expr::Run(expr, _) => collect_free_vars_expr(expr, out),
        ast::Expr::ChannelCreate(_) => {}
        ast::Expr::AtomicCreate(init, _) => { if let Some(e) = init { collect_free_vars_expr(e, out); } }
        ast::Expr::Pipe(l, r, _) => { collect_free_vars_expr(l, out); collect_free_vars_expr(r, out); }
        ast::Expr::Own(e, _) => collect_free_vars_expr(e, out),
        ast::Expr::InlineAsm(_, _, inputs, _) => {
            for e in inputs { collect_free_vars_expr(e, out); }
        }
        ast::Expr::MetalExpr(stmts, _) => {
            for s in stmts { collect_free_vars_stmt(s, out); }
        }
        ast::Expr::MemoReserve(size, _) => collect_free_vars_expr(size, out),
        ast::Expr::MemoClean(addr, _) => collect_free_vars_expr(addr, out),
        ast::Expr::MemoLoad { address, .. } => collect_free_vars_expr(address, out),
        ast::Expr::MemoStore { value, address, .. } => {
            collect_free_vars_expr(value, out);
            collect_free_vars_expr(address, out);
        }
        ast::Expr::Cast(_, e, _) => collect_free_vars_expr(e, out),
        ast::Expr::Action(_, body, _) => {
            for s in body { collect_free_vars_stmt(s, out); }
        }
        ast::Expr::ArrowAction(_, body, _) => {
            collect_free_vars_expr(body, out);
        }
        _ => {}
    }
}

fn collect_free_vars_stmt(stmt: &ast::Statement, out: &mut HashSet<String>) {
    match stmt {
        ast::Statement::Show(s) => collect_free_vars_expr(&s.value, out),
        ast::Statement::Assignment(a) => { collect_free_vars_expr(&a.target, out); collect_free_vars_expr(&a.value, out); }
        ast::Statement::VarDecl(v) => collect_free_vars_expr(&v.initializer, out),
        ast::Statement::If(i) => {
            collect_free_vars_expr(&i.condition, out);
            for s in &i.then_body { collect_free_vars_stmt(s, out); }
            if let Some(eb) = &i.else_body { for s in eb { collect_free_vars_stmt(s, out); } }
        }
        ast::Statement::While(w) => { collect_free_vars_expr(&w.condition, out); for s in &w.body { collect_free_vars_stmt(s, out); } }
        ast::Statement::Forever(f) => { for s in &f.body { collect_free_vars_stmt(s, out); } }
        ast::Statement::Count(c) => {
            collect_free_vars_expr(&c.start, out); collect_free_vars_expr(&c.end, out);
            if let Some(st) = &c.step { collect_free_vars_expr(st, out); }
            for s in &c.body { collect_free_vars_stmt(s, out); }
        }
        ast::Statement::ForIn(f) => { collect_free_vars_expr(&f.iterable, out); for s in &f.body { collect_free_vars_stmt(s, out); } }
        ast::Statement::Check(c) => {
            collect_free_vars_expr(&c.value, out);
            for a in &c.arms { for s in &a.body { collect_free_vars_stmt(s, out); } }
        }
        ast::Statement::Out(o) => { for e in &o.values { collect_free_vars_expr(e, out); } }
        ast::Statement::Expr(e) => collect_free_vars_expr(e, out),
        ast::Statement::Emit(e) => collect_free_vars_expr(&e.value, out),
        ast::Statement::Run(r) => collect_free_vars_expr(&r.expr, out),
        ast::Statement::Wait(w) => collect_free_vars_expr(&w.duration, out),
        ast::Statement::Block(stmts) | ast::Statement::SafeBlock(stmts, _) | ast::Statement::MetalBlock(stmts, _) => {
            for s in stmts { collect_free_vars_stmt(s, out); }
        }
        ast::Statement::Defer(body, _) => {
            for s in body { collect_free_vars_stmt(s, out); }
        }
        ast::Statement::PossibleBlock(p) => {
            for s in &p.body { collect_free_vars_stmt(s, out); }
            for s in &p.else_body { collect_free_vars_stmt(s, out); }
        }
        ast::Statement::MultiAssignment(m) => collect_free_vars_expr(&m.value, out),
        ast::Statement::Prompt(p) => collect_free_vars_expr(&p.message, out),
        ast::Statement::Assert(a) => {
            collect_free_vars_expr(&a.condition, out);
            if let Some(ref msg) = a.message { collect_free_vars_expr(msg, out); }
        }
        _ => {}
    }
}

pub struct Lowering {
    next_reg: u32,
    next_block: u32,
    blocks: Vec<BasicBlock>,
    current_block: usize,
    loop_stack: Vec<LoopContext>,
    /// When lowering an actor method body, `self.method(...)` lowers to `Call("Actor::method", ...)`.
    current_actor: Option<String>,
    /// Field names of the current actor (including inherited) — used to rewrite identifier access to self field access.
    current_actor_fields: HashSet<String>,
    /// Actor name → list of field names (including inherited fields).
    actor_field_map: HashMap<String, Vec<String>>,
    /// Declared `actor` names in this program — used to lower `Actor.method(args)` to `Call("Actor::method", ...)`.
    actor_names: HashSet<String>,
    /// Known top-level function names — used to distinguish direct calls from closure calls.
    function_names: HashSet<String>,
    /// Counter for generating unique closure function names.
    next_closure_id: u32,
    /// Accumulated closure functions generated during lowering.
    closure_functions: Vec<IrFunction>,
    /// Known compile-time constants — inlined at use sites.
    known_constants: HashMap<String, Constant>,
    /// Function parameter lists — used to fill default arguments at call sites.
    function_params: HashMap<String, Vec<ast::Param>>,
    /// Choice declarations: ChoiceName → { VariantName → [field_names] }.
    choice_variants: HashMap<String, HashMap<String, Vec<String>>>,
    /// Actor event declarations: ActorName → [event_name, ...].
    actor_events: HashMap<String, Vec<String>>,
    /// Track which variables are set/queue/stack for method dispatch.
    collection_types: HashMap<String, String>,
    /// Track variables that hold lists/maps/collections for mutation write-back.
    writeback_vars: HashSet<String>,
    /// Generator function names (functions that contain `emit`).
    generator_functions: HashSet<String>,
    /// Packed entity type names — these use MakePackedEntity instead of MakeEntity.
    packed_types: HashSet<String>,
    /// Function bodies (AST) — used for inlining generators.
    function_bodies: HashMap<String, (Vec<ast::Param>, Vec<ast::Statement>)>,
    /// When lowering an inlined generator, emit statements store to this var and execute this body.
    gen_consumer: Option<(String, Vec<ast::Statement>)>,
    /// Current source line being lowered (1-based, 0 = unknown).
    current_line: u32,
    /// Stack of metal expression contexts for `value = metal { out x; }` lowering.
    metal_expr_stack: Vec<MetalExprContext>,
    /// Whether the current function being lowered is a metal function.
    in_metal_fn: bool,
}

struct LoopContext {
    continue_block: BlockId,
    break_block: BlockId,
}

struct MetalExprContext {
    result_var: String,
    exit_block: BlockId,
}

impl Lowering {
    pub fn new() -> Self {
        Self {
            next_reg: 0,
            next_block: 0,
            blocks: Vec::new(),
            current_block: 0,
            loop_stack: Vec::new(),
            current_actor: None,
            current_actor_fields: HashSet::new(),
            actor_field_map: HashMap::new(),
            actor_names: HashSet::new(),
            function_names: HashSet::new(),
            next_closure_id: 0,
            closure_functions: Vec::new(),
            known_constants: HashMap::new(),
            function_params: HashMap::new(),
            choice_variants: HashMap::new(),
            actor_events: HashMap::new(),
            collection_types: HashMap::new(),
            writeback_vars: HashSet::new(),
            generator_functions: HashSet::new(),
            packed_types: HashSet::new(),
            function_bodies: HashMap::new(),
            gen_consumer: None,
            current_line: 0,
            metal_expr_stack: Vec::new(),
            in_metal_fn: false,
        }
    }

    pub fn lower(mut self, program: &ast::Program) -> IrProgram {
        let mut ir = IrProgram::new();

        // Pre-pass: collect names, parameter defaults, and constants.
        for decl in program {
            match decl {
                ast::Declaration::Actor(a) => {
                    self.actor_names.insert(a.name.clone());
                    let mut events = Vec::new();
                    let mut fields = Vec::new();
                    for member in &a.members {
                        if let ast::ActorMember::Field(f) = member {
                            fields.push(f.name.clone());
                        }
                        if let ast::ActorMember::Method(m) = member {
                            let mangled = format!("{}::{}", a.name, m.name);
                            self.function_params.insert(mangled, m.params.clone());
                        }
                        if let ast::ActorMember::Event(e) = member {
                            events.push(e.name.clone());
                        }
                        if let ast::ActorMember::Property(p) = member {
                            if p.getter.is_some() {
                                let mangled = format!("{}::__get_{}", a.name, p.name);
                                self.function_params.insert(mangled, vec![]);
                            }
                            if p.setter.is_some() {
                                let mangled = format!("{}::__set_{}", a.name, p.name);
                                let (ref param_name, _) = p.setter.as_ref().unwrap();
                                let param = ast::Param {
                                    name: param_name.clone(),
                                    type_annotation: None,
                                    default_value: None,
                                    span: p.span,
                                };
                                self.function_params.insert(mangled, vec![param]);
                            }
                        }
                    }
                    self.actor_field_map.insert(a.name.clone(), fields);
                    if !events.is_empty() {
                        self.actor_events.insert(a.name.clone(), events);
                    }
                }
                ast::Declaration::Function(f) => {
                    self.function_names.insert(f.name.clone());
                    self.function_params.insert(f.name.clone(), f.params.clone());
                    if Self::ast_body_contains_emit(&f.body) {
                        self.generator_functions.insert(f.name.clone());
                        self.function_bodies.insert(f.name.clone(), (f.params.clone(), f.body.clone()));
                    }
                }
                ast::Declaration::Extend(ext) => {
                    for m in &ext.methods {
                        let mangled = format!("{}::{}", ext.target, m.name);
                        self.function_names.insert(mangled.clone());
                        self.function_params.insert(mangled, m.params.clone());
                    }
                }
                ast::Declaration::Const(c) => {
                    if let Some(val) = self.const_eval(&c.value) {
                        self.known_constants.insert(c.name.clone(), val);
                    }
                }
                ast::Declaration::Choice(c) => {
                    let mut variants = HashMap::new();
                    for v in &c.variants {
                        let fields: Vec<String> = v.fields.iter().map(|p| p.name.clone()).collect();
                        variants.insert(v.name.clone(), fields);
                    }
                    self.choice_variants.insert(c.name.clone(), variants);
                }
                ast::Declaration::Bridge(b) => {
                    for f in &b.functions {
                        self.function_names.insert(f.name.clone());
                    }
                }
                ast::Declaration::Entity(e) => {
                    if e.is_packed {
                        let fields: Vec<(String, String)> = e.fields.iter().map(|f| {
                            let type_name = match &f.type_annotation {
                                Some(ast::TypeExpr::Named(n, _)) => n.clone(),
                                _ => "i64".to_string(),
                            };
                            (f.name.clone(), type_name)
                        }).collect();
                        ir.packed_layouts.insert(e.name.clone(), fields);
                        self.packed_types.insert(e.name.clone());
                        if e.is_value {
                            ir.value_types.insert(e.name.clone());
                        }
                    } else {
                        let fields: Vec<String> = e.fields.iter().map(|f| f.name.clone()).collect();
                        ir.entity_layouts.insert(e.name.clone(), fields);
                    }
                }
                _ => {}
            }
        }

        // Resolve inherited fields: walk parent chains and prepend parent fields.
        {
            let mut parent_map: HashMap<String, String> = HashMap::new();
            for decl in program {
                if let ast::Declaration::Actor(a) = decl {
                    if let Some(ref parent) = a.parent {
                        parent_map.insert(a.name.clone(), parent.clone());
                    }
                }
            }
            // For each actor with a parent, collect all ancestor fields.
            let actor_names: Vec<String> = self.actor_field_map.keys().cloned().collect();
            for name in &actor_names {
                let mut inherited = Vec::new();
                let mut cur = parent_map.get(name).cloned();
                while let Some(ref p) = cur {
                    if let Some(parent_fields) = self.actor_field_map.get(p) {
                        // Prepend parent fields (parent first, then grandparent, etc.)
                        let mut pf = parent_fields.clone();
                        pf.append(&mut inherited);
                        inherited = pf;
                    }
                    cur = parent_map.get(p).cloned();
                }
                if !inherited.is_empty() {
                    let own = self.actor_field_map.get(name).cloned().unwrap_or_default();
                    let mut all = inherited;
                    all.extend(own);
                    self.actor_field_map.insert(name.clone(), all);
                }
            }
        }

        // Resolve conditional compilation blocks
        let mut resolved_decls: Vec<&ast::Declaration> = Vec::new();
        for decl in program {
            if let ast::Declaration::ConditionalCompilation(cond) = decl {
                let matches = match cond.condition.as_str() {
                    "platform" => {
                        let current = if cfg!(target_os = "macos") { "macos" }
                            else if cfg!(target_os = "linux") { "linux" }
                            else if cfg!(target_os = "windows") { "windows" }
                            else { "unknown" };
                        cond.value == current
                    }
                    "debug" => cond.value == "true",
                    _ => false,
                };
                let body = if matches {
                    &cond.then_body
                } else if let Some(ref else_body) = cond.else_body {
                    else_body
                } else {
                    continue;
                };
                for d in body {
                    resolved_decls.push(d);
                }
            } else {
                resolved_decls.push(decl);
            }
        }

        // Main pass: lower all declarations.
        for decl in &resolved_decls {
            match decl {
                ast::Declaration::Function(f) => {
                    if let Some(func) = self.lower_function(f) {
                        ir.functions.push(func);
                    }
                }
                ast::Declaration::Const(c) => {
                    if let Some(val) = self.const_eval(&c.value) {
                        ir.constants.push((c.name.clone(), val));
                    }
                }
                ast::Declaration::Actor(a) => {
                    let actor_fields: HashSet<String> = self.actor_field_map
                        .get(&a.name)
                        .cloned()
                        .unwrap_or_default()
                        .into_iter()
                        .collect();
                    for member in &a.members {
                        if let ast::ActorMember::Method(m) = member {
                            let mangled = format!("{}::{}", a.name, m.name);
                            self.current_actor = Some(a.name.clone());
                            if !m.is_static {
                                self.current_actor_fields = actor_fields.clone();
                            }
                            let lowered = self.lower_function(m);
                            self.current_actor = None;
                            self.current_actor_fields.clear();
                            if let Some(mut func) = lowered {
                                func.name = mangled;
                                if !m.is_static {
                                    func.params.insert(0, "self".to_string());
                                    func.param_types.insert(0, IrParamType::Str);
                                }
                                ir.functions.push(func);
                            }
                        }
                        if let ast::ActorMember::Property(p) = member {
                            self.current_actor = Some(a.name.clone());
                            self.current_actor_fields = actor_fields.clone();
                            if let Some(ref getter_body) = p.getter {
                                let getter_fn = ast::FunctionDecl {
                                    name: format!("__get_{}", p.name),
                                    params: vec![],
                                    body: getter_body.clone(),
                                    is_public: p.is_public,
                                    is_abstract: false,
                                    is_static: false,
                                    is_metal: false,
                                    doc_comments: vec![],
                                    attributes: vec![],
                                    span: p.span,
                                };
                                if let Some(mut func) = self.lower_function(&getter_fn) {
                                    func.name = format!("{}::__get_{}", a.name, p.name);
                                    func.params.insert(0, "self".to_string());
                                    func.param_types.insert(0, IrParamType::Str);
                                    ir.functions.push(func);
                                }
                            }
                            if let Some((ref param_name, ref setter_body)) = p.setter {
                                let setter_fn = ast::FunctionDecl {
                                    name: format!("__set_{}", p.name),
                                    params: vec![ast::Param {
                                        name: param_name.clone(),
                                        type_annotation: None,
                                        default_value: None,
                                        span: p.span,
                                    }],
                                    body: setter_body.clone(),
                                    is_public: p.is_public,
                                    is_abstract: false,
                                    is_static: false,
                                    is_metal: false,
                                    doc_comments: vec![],
                                    attributes: vec![],
                                    span: p.span,
                                };
                                if let Some(mut func) = self.lower_function(&setter_fn) {
                                    func.name = format!("{}::__set_{}", a.name, p.name);
                                    func.params.insert(0, "self".to_string());
                                    func.param_types.insert(0, IrParamType::Str);
                                    ir.functions.push(func);
                                }
                            }
                            self.current_actor = None;
                            self.current_actor_fields.clear();
                        }
                    }
                }
                ast::Declaration::Extend(ext) => {
                    for m in &ext.methods {
                        let mangled = format!("{}::{}", ext.target, m.name);
                        let lowered = self.lower_function(m);
                        if let Some(mut func) = lowered {
                            func.name = mangled;
                            if !func.params.is_empty() {
                                func.params[0] = "self".to_string();
                                func.param_types[0] = self.infer_extend_self_type(&ext.target);
                            }
                            ir.functions.push(func);
                        }
                    }
                }
                _ => {}
            }
        }

        // Collect bridge declarations.
        for decl in &resolved_decls {
            if let ast::Declaration::Bridge(b) = decl {
                for f in &b.functions {
                    let param_types: Vec<String> = f.params.iter().map(|p| {
                        obo_type_to_llvm(&p.type_annotation)
                    }).collect();
                    let return_type = match &f.return_type {
                        Some(te) => obo_type_to_llvm(te),
                        None => "void".to_string(),
                    };
                    ir.bridge_fns.push(IrBridgeFn {
                        lib_name: b.lib_name.clone(),
                        name: f.name.clone(),
                        param_types,
                        return_type,
                        is_variadic: f.is_variadic,
                    });
                }
            }
        }

        ir.functions.append(&mut self.closure_functions);

        // Collect @export function names for function-pointer references.
        for f in &ir.functions {
            if f.is_export {
                ir.export_fns.insert(f.name.clone());
            }
        }

        ir
    }

    fn infer_extend_self_type(&self, target: &str) -> IrParamType {
        match target {
            "number" => IrParamType::I64,
            "text" => IrParamType::Str,
            "flag" => IrParamType::Bool,
            "decimal" => IrParamType::F64,
            "f32" | "f64" => IrParamType::F64,
            _ => IrParamType::Str, // entities, actors, lists, maps are all i8*
        }
    }

    // ================================================================
    // Functions
    // ================================================================

    fn lower_function(&mut self, f: &ast::FunctionDecl) -> Option<IrFunction> {
        if f.is_abstract {
            return None;
        }

        let fn_start_line = f.span.line as u32;
        self.current_line = fn_start_line;
        self.next_reg = 0;
        self.next_block = 0;
        self.blocks = Vec::new();
        self.loop_stack.clear();

        let entry = self.new_block();
        self.set_current(entry);

        let params: Vec<String> = f.params.iter().map(|p| p.name.clone()).collect();
        let param_types: Vec<IrParamType> = f.params.iter().map(ast_param_ir_type).collect();

        // If this is a non-static actor method, reserve reg 0 for self (inserted later)
        let param_offset = if self.current_actor.is_some() && !f.is_static { 1 } else { 0 };
        if param_offset == 1 {
            self.next_reg = 1;
            self.emit(Inst::Store("self".to_string(), Operand::Reg(Reg(0))));
        }

        for (i, p) in params.iter().enumerate() {
            let reg = Reg((i + param_offset) as u32);
            self.next_reg = self.next_reg.max((i + param_offset) as u32 + 1);
            self.emit(Inst::Store(p.clone(), Operand::Reg(reg)));
        }

        // Enter metal mode for metal functions
        if f.is_metal {
            let r = self.fresh_reg();
            self.emit(Inst::Call(r, "obo_metal_enter".to_string(), vec![]));
        }
        self.in_metal_fn = f.is_metal;

        self.lower_statements(&f.body);

        if !self.current().is_terminated() {
            // Exit metal mode before return
            if f.is_metal {
                let r = self.fresh_reg();
                self.emit(Inst::Call(r, "obo_metal_exit".to_string(), vec![]));
            }
            self.emit(Inst::Return(Vec::new()));
        }

        let export_attr = f.attributes.iter().find(|a| a.name == "export");
        let is_export = export_attr.is_some();
        let is_interrupt = f.attributes.iter().any(|a| a.name == "interrupt");

        let (export_param_types, export_ret_type) = if is_export {
            let epts: Vec<String> = f.params.iter().map(|p| {
                match &p.type_annotation {
                    Some(te) => obo_type_to_llvm(te),
                    None => "i64".to_string(),
                }
            }).collect();
            // Return type from @export("void"), @export("i32"), etc.
            let ert = export_attr.and_then(|a| {
                if let Some(ast::Expr::StringLit(s, _)) = a.args.first() {
                    Some(match s.as_str() {
                        "void" | "nothing" => "void".to_string(),
                        "i8" => "i8".to_string(),
                        "i16" => "i16".to_string(),
                        "i32" => "i32".to_string(),
                        "i64" | "number" => "i64".to_string(),
                        "f32" | "float" => "float".to_string(),
                        "f64" | "double" | "decimal" => "double".to_string(),
                        "pointer" | "i8*" => "i8*".to_string(),
                        _ => "i64".to_string(),
                    })
                } else {
                    None
                }
            });
            (epts, ert)
        } else {
            (Vec::new(), None)
        };

        Some(IrFunction {
            name: f.name.clone(),
            params,
            param_types,
            blocks: std::mem::take(&mut self.blocks),
            start_line: fn_start_line,
            is_export,
            export_param_types,
            export_ret_type,
            is_interrupt,
        })
    }

    // ================================================================
    // Statements
    // ================================================================

    fn lower_statements(&mut self, stmts: &[ast::Statement]) {
        for stmt in stmts {
            self.lower_statement(stmt);
            if self.current().is_terminated() {
                break;
            }
        }
    }

    fn stmt_line(stmt: &ast::Statement) -> u32 {
        match stmt {
            ast::Statement::VarDecl(s) => s.span.line as u32,
            ast::Statement::Assignment(s) => s.span.line as u32,
            ast::Statement::MultiAssignment(s) => s.span.line as u32,
            ast::Statement::Show(s) => s.span.line as u32,
            ast::Statement::Prompt(s) => s.span.line as u32,
            ast::Statement::If(s) => s.span.line as u32,
            ast::Statement::While(s) => s.span.line as u32,
            ast::Statement::Forever(s) => s.span.line as u32,
            ast::Statement::Count(s) => s.span.line as u32,
            ast::Statement::ForIn(s) => s.span.line as u32,
            ast::Statement::Check(s) => s.span.line as u32,
            ast::Statement::Out(s) => s.span.line as u32,
            ast::Statement::Stop(span) => span.line as u32,
            ast::Statement::Restart(span) => span.line as u32,
            ast::Statement::Wait(s) => s.span.line as u32,
            ast::Statement::Run(s) => s.span.line as u32,
            ast::Statement::Emit(s) => s.span.line as u32,
            ast::Statement::PossibleBlock(s) => s.span.line as u32,
            ast::Statement::SafeBlock(_, span) => span.line as u32,
            ast::Statement::MetalBlock(_, span) => span.line as u32,
            ast::Statement::Defer(_, span) => span.line as u32,
            ast::Statement::Assert(s) => s.span.line as u32,
            ast::Statement::Expr(_) | ast::Statement::Block(_) => 0,
        }
    }

    fn lower_statement(&mut self, stmt: &ast::Statement) {
        // Track source line for debug info
        let line = Self::stmt_line(stmt);
        if line > 0 { self.current_line = line; }

        match stmt {
            ast::Statement::Show(s) => {
                let val = self.lower_expr(&s.value);
                self.emit(Inst::Show(val));
            }

            ast::Statement::Assignment(a) => {
                // Track collection type for set/queue/stack/pair/bag/buffer reassignment
                if let ast::Expr::Identifier(name, _) = &a.target {
                    if let ast::Expr::Call(callee_expr, _, _) = &a.value {
                        if let ast::Expr::Identifier(cname, _) = callee_expr.as_ref() {
                            if matches!(cname.as_str(), "set" | "queue" | "stack" | "pair" | "bag" | "buffer" | "TextBuilder" | "Arena") {
                                let ctype = if cname == "TextBuilder" { "textbuilder".to_string() } else if cname == "Arena" { "arena".to_string() } else { cname.clone() };
                                self.collection_types.insert(name.clone(), ctype);
                                self.writeback_vars.insert(name.clone());
                            }
                        }
                        // Track method calls on collection variables: b2 = b.add(42) → b2 is same type as b
                        if let ast::Expr::MemberAccess(obj, _, _) = callee_expr.as_ref() {
                            if let ast::Expr::Identifier(var_name, _) = obj.as_ref() {
                                if let Some(coll_type) = self.collection_types.get(var_name).cloned() {
                                    self.collection_types.insert(name.clone(), coll_type);
                                    self.writeback_vars.insert(name.clone());
                                }
                            }
                        }
                    }
                    // Track list and map literals for write-back (but NOT in collection_types to avoid dispatch intercept)
                    if matches!(&a.value, ast::Expr::ListLiteral(_, _) | ast::Expr::MapLiteral(_, _)) {
                        self.writeback_vars.insert(name.clone());
                    }
                }
                let val = self.lower_expr(&a.value);
                match &a.target {
                    ast::Expr::Identifier(name, _) => {
                        if self.current_actor_fields.contains(name) {
                            let self_reg = self.fresh_reg();
                            self.emit(Inst::Load(self_reg, "self".to_string()));
                            self.emit(Inst::SetField(Operand::Reg(self_reg), name.clone(), val));
                        } else {
                            self.emit(Inst::Store(name.clone(), val));
                        }
                    }
                    ast::Expr::MemberAccess(obj, field, _) => {
                        let obj_op = self.lower_expr(obj);
                        self.emit(Inst::SetField(obj_op, field.clone(), val));
                    }
                    ast::Expr::IndexAccess(obj, idx, _) => {
                        let obj_op = self.lower_expr(obj);
                        let idx_op = self.lower_expr(idx);
                        self.emit(Inst::SetIndex(obj_op, idx_op, val));
                    }
                    _ => {}
                }
            }

            ast::Statement::MultiAssignment(m) => {
                let val = self.lower_expr(&m.value);
                let list_reg = self.to_reg(val);
                for (i, name) in m.targets.iter().enumerate() {
                    let idx = Operand::Const(Constant::Number(i as i64));
                    let elem = self.fresh_reg();
                    self.emit(Inst::GetIndex(elem, Operand::Reg(list_reg), idx));
                    self.emit(Inst::Store(name.clone(), Operand::Reg(elem)));
                }
            }

            ast::Statement::VarDecl(v) => {
                // Track set/queue/stack/pair/bag/buffer variable types for method dispatch
                if let ast::Expr::Call(callee_expr, _, _) = &v.initializer {
                    if let ast::Expr::Identifier(cname, _) = callee_expr.as_ref() {
                        if matches!(cname.as_str(), "set" | "queue" | "stack" | "pair" | "bag" | "buffer" | "grid2d" | "grid3d" | "TextBuilder" | "Arena") {
                            let ctype = if cname == "TextBuilder" { "textbuilder".to_string() } else if cname == "Arena" { "arena".to_string() } else { cname.clone() };
                            self.collection_types.insert(v.name.clone(), ctype);
                            self.writeback_vars.insert(v.name.clone());
                        }
                    }
                    // Track method calls on collection variables: let b2 = b.add(42) → b2 is same type as b
                    if let ast::Expr::MemberAccess(obj, _, _) = callee_expr.as_ref() {
                        if let ast::Expr::Identifier(var_name, _) = obj.as_ref() {
                            if let Some(coll_type) = self.collection_types.get(var_name).cloned() {
                                self.collection_types.insert(v.name.clone(), coll_type);
                                self.writeback_vars.insert(v.name.clone());
                            }
                        }
                    }
                }
                // Track list and map literals for write-back (but NOT in collection_types)
                if matches!(&v.initializer, ast::Expr::ListLiteral(_, _) | ast::Expr::MapLiteral(_, _)) {
                    self.writeback_vars.insert(v.name.clone());
                }
                let val = self.lower_expr(&v.initializer);
                if self.current_actor_fields.contains(&v.name) {
                    let self_reg = self.fresh_reg();
                    self.emit(Inst::Load(self_reg, "self".to_string()));
                    self.emit(Inst::SetField(Operand::Reg(self_reg), v.name.clone(), val));
                } else {
                    self.emit(Inst::Store(v.name.clone(), val));
                }
            }

            ast::Statement::If(i) => {
                self.lower_if(i);
            }

            ast::Statement::While(w) => {
                self.lower_while(w);
            }

            ast::Statement::Forever(f) => {
                self.lower_forever(f);
            }

            ast::Statement::Count(c) => {
                self.lower_count(c);
            }

            ast::Statement::ForIn(f) => {
                self.lower_for_in(f);
            }

            ast::Statement::Check(c) => {
                self.lower_check(c);
            }

            ast::Statement::Out(o) => {
                let vals: Vec<Operand> = o.values.iter().map(|e| self.lower_expr(e)).collect();
                if let Some(mctx) = self.metal_expr_stack.last() {
                    // Inside a metal expression: store result and jump to exit block
                    let val = vals.into_iter().next().unwrap_or(Operand::Const(Constant::Null));
                    let exit = mctx.exit_block;
                    let var = mctx.result_var.clone();
                    self.emit(Inst::Store(var, val));
                    self.emit(Inst::Jump(exit));
                } else {
                    // Exit metal mode before returning from a metal function
                    if self.in_metal_fn {
                        let r = self.fresh_reg();
                        self.emit(Inst::Call(r, "obo_metal_exit".to_string(), vec![]));
                    }
                    self.emit(Inst::Return(vals));
                }
            }

            ast::Statement::Stop(_) => {
                if let Some(ctx) = self.loop_stack.last() {
                    let target = ctx.break_block;
                    self.emit(Inst::Jump(target));
                }
            }

            ast::Statement::Restart(_) => {
                if let Some(ctx) = self.loop_stack.last() {
                    let target = ctx.continue_block;
                    self.emit(Inst::Jump(target));
                }
            }

            ast::Statement::Expr(e) => {
                // For mutating collection methods called on a variable
                // (e.g. `items.add(4)`), write the result back to the variable.
                if let ast::Expr::Call(callee, _, _) = e {
                    if let ast::Expr::MemberAccess(obj, method, _) = callee.as_ref() {
                        let is_mutating = matches!(
                            method.as_str(),
                            "add" | "insert" | "remove" | "removeAt"
                            | "set" | "push" | "enqueue" | "pop" | "dequeue"
                            | "sort" | "reverse" | "filter" | "map"
                        );
                        if is_mutating {
                            if let ast::Expr::Identifier(var_name, _) = obj.as_ref() {
                                if self.writeback_vars.contains(var_name) {
                                    let result_op = self.lower_expr(e);
                                    self.emit(Inst::Store(var_name.clone(), result_op));
                                    return;
                                }
                            }
                        }
                    }
                }
                self.lower_expr(e);
            }

            ast::Statement::PossibleBlock(p) => {
                let body_block = self.new_block();
                let else_block = self.new_block();
                let exit_block = self.new_block();

                // Push possible frame (returns jmp_buf pointer)
                let jb = self.fresh_reg();
                self.emit(Inst::Call(jb, "obo_possible_push".to_string(), vec![]));

                // setjmp returns 0 on first call, 1 on longjmp
                let rv = self.fresh_reg();
                self.emit(Inst::Call(rv, "_setjmp".to_string(), vec![Operand::Reg(jb)]));
                let zero = Operand::Const(Constant::Number(0));
                let is_err = self.fresh_reg();
                self.emit(Inst::BinOp(is_err, BinOp::NotEq, Operand::Reg(rv), zero));
                self.emit(Inst::Branch(Operand::Reg(is_err), else_block, body_block));

                // Body block — normal execution
                self.set_current(body_block);
                self.lower_statements(&p.body);
                let pop1 = self.fresh_reg();
                self.emit(Inst::Call(pop1, "obo_possible_pop".to_string(), vec![]));
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(exit_block));
                }

                // Else block — error was thrown
                self.set_current(else_block);
                if let Some(ref err_name) = p.error_name {
                    let err_reg = self.fresh_reg();
                    self.emit(Inst::Call(err_reg, "obo_possible_get_error".to_string(), vec![]));
                    self.emit(Inst::Store(err_name.clone(), Operand::Reg(err_reg)));
                }
                self.lower_statements(&p.else_body);
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(exit_block));
                }

                self.set_current(exit_block);
            }

            ast::Statement::Block(stmts) => {
                self.lower_statements(stmts);
            }

            ast::Statement::SafeBlock(stmts, _) | ast::Statement::MetalBlock(stmts, _) => {
                let is_metal = matches!(stmt, ast::Statement::MetalBlock(..));

                // Emit obo_metal_enter at metal block entry
                if is_metal {
                    let r = self.fresh_reg();
                    self.emit(Inst::Call(r, "obo_metal_enter".to_string(), vec![]));
                }

                // Separate defer bodies from regular statements, track owned vars
                let mut regular: Vec<&ast::Statement> = Vec::new();
                let mut defers: Vec<&Vec<ast::Statement>> = Vec::new();
                let mut owned_vars: Vec<String> = Vec::new();
                for s in stmts {
                    if let ast::Statement::Defer(body, _) = s {
                        defers.push(body);
                    } else {
                        // Track owned variables from VarDecl: x = own expr;
                        if let ast::Statement::VarDecl(v) = s {
                            if matches!(&v.initializer, ast::Expr::Own(_, _)) {
                                owned_vars.push(v.name.clone());
                            }
                        }
                        // Track owned variables from Assignment: x = own expr;
                        if let ast::Statement::Assignment(a) = s {
                            if matches!(&a.value, ast::Expr::Own(_, _)) {
                                if let ast::Expr::Identifier(name, _) = &a.target {
                                    owned_vars.push(name.clone());
                                }
                            }
                        }
                        regular.push(s);
                    }
                }

                // Lower regular statements
                for s in &regular {
                    self.lower_statement(s);
                    if self.current().is_terminated() {
                        break;
                    }
                }

                // Lower defer bodies in reverse (LIFO) at scope exit
                if !self.current().is_terminated() {
                    for defer_body in defers.iter().rev() {
                        self.lower_statements(defer_body);
                        if self.current().is_terminated() {
                            break;
                        }
                    }
                }

                // Auto-free owned variables in reverse order (LIFO)
                if !self.current().is_terminated() {
                    for var_name in owned_vars.iter().rev() {
                        let ptr_reg = self.fresh_reg();
                        self.emit(Inst::Load(ptr_reg, var_name.clone()));
                        let free_reg = self.fresh_reg();
                        self.emit(Inst::Call(free_reg, "__sys_pointer_free".to_string(), vec![Operand::Reg(ptr_reg)]));
                    }
                }

                // Emit obo_metal_exit at metal block exit
                if is_metal && !self.current().is_terminated() {
                    let r = self.fresh_reg();
                    self.emit(Inst::Call(r, "obo_metal_exit".to_string(), vec![]));
                }
            }

            ast::Statement::Defer(_, _) => {
                // Handled by MetalBlock/SafeBlock lowering above.
                // Should not be reached at top level.
            }

            ast::Statement::Wait(w) => {
                if w.is_wait_for_all {
                    self.emit(Inst::WaitAll);
                } else if w.is_wait_for {
                    let task = self.lower_expr(&w.duration);
                    self.emit(Inst::WaitTask(task));
                } else {
                    let dur = self.lower_expr(&w.duration);
                    let result = self.fresh_reg();
                    self.emit(Inst::Call(result, "__sys_Time_sleep".to_string(), vec![dur]));
                }
            }
            ast::Statement::Run(r) => {
                let _task = self.lower_run_task_expr(&r.expr);
            }
            ast::Statement::Prompt(p) => {
                let msg = self.lower_expr(&p.message);
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "obo_prompt".to_string(), vec![msg]));
                self.emit(Inst::Store(p.target.clone(), Operand::Reg(dst)));
            }
            ast::Statement::Emit(e) => {
                // emit eventName(args...) inside an actor method
                if let Some(ref actor) = self.current_actor.clone() {
                    if let ast::Expr::Call(callee, args, _) = &e.value {
                        if let ast::Expr::Identifier(event_name, _) = callee.as_ref() {
                            if self.actor_events.get(actor).map_or(false, |evts| evts.contains(event_name)) {
                                let self_op = Operand::Reg(self.fresh_reg());
                                let self_reg = if let Operand::Reg(r) = &self_op { *r } else { unreachable!() };
                                self.emit(Inst::Load(self_reg, "self".to_string()));

                                // Build args list
                                let mut arg_ops = Vec::new();
                                for arg in args {
                                    arg_ops.push(self.lower_expr(&arg.value));
                                }
                                let args_list = self.fresh_reg();
                                self.emit(Inst::MakeList(args_list, arg_ops));

                                let event_name_op = Operand::Const(Constant::Text(event_name.clone()));
                                let dst = self.fresh_reg();
                                self.emit(Inst::Call(
                                    dst,
                                    "obo_event_emit".to_string(),
                                    vec![self_op, event_name_op, Operand::Reg(args_list)],
                                ));
                                return;
                            }
                        }
                    }
                }
                // Generator emit: store emitted value to consumer var and execute consumer body
                if let Some((ref var_name, ref body)) = self.gen_consumer.clone() {
                    let val = self.lower_expr(&e.value);
                    self.emit(Inst::Store(var_name.clone(), val));
                    self.lower_statements(&body);
                    return;
                }
                self.emit(Inst::Nop);
            }
            ast::Statement::Assert(a) => {
                let cond = self.lower_expr(&a.condition);
                let msg = if let Some(ref msg_expr) = a.message {
                    self.lower_expr(msg_expr)
                } else {
                    Operand::Const(Constant::Text("Assertion failed".to_string()))
                };
                // Branch: if cond → pass, else → fail
                let fail_block = self.new_block();
                let pass_block = self.new_block();
                self.emit(Inst::Branch(cond, pass_block, fail_block));

                self.set_current(fail_block);
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "obo_assert_fail".to_string(), vec![msg]));
                self.emit(Inst::Jump(pass_block));

                self.set_current(pass_block);
            }
        }
    }

    // ================================================================
    // Control flow lowering
    // ================================================================

    fn lower_if(&mut self, i: &ast::IfStmt) {
        let cond = self.lower_expr(&i.condition);
        let then_block = self.new_block();
        let else_block = self.new_block();
        let merge_block = self.new_block();

        self.emit(Inst::Branch(cond, then_block, else_block));

        // Then branch
        self.set_current(then_block);
        self.lower_statements(&i.then_body);
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(merge_block));
        }

        // Else branch
        self.set_current(else_block);
        if let Some(ref else_body) = i.else_body {
            self.lower_statements(else_body);
        }
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(merge_block));
        }

        self.set_current(merge_block);
    }

    fn lower_while(&mut self, w: &ast::WhileStmt) {
        let cond_block = self.new_block();
        let body_block = self.new_block();
        let exit_block = self.new_block();

        self.emit(Inst::Jump(cond_block));

        // Condition
        self.set_current(cond_block);
        let cond = self.lower_expr(&w.condition);
        self.emit(Inst::Branch(cond, body_block, exit_block));

        // Body
        self.set_current(body_block);
        self.loop_stack.push(LoopContext {
            continue_block: cond_block,
            break_block: exit_block,
        });
        self.lower_statements(&w.body);
        self.loop_stack.pop();
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(cond_block));
        }

        self.set_current(exit_block);
    }

    fn lower_forever(&mut self, f: &ast::ForeverStmt) {
        let body_block = self.new_block();
        let exit_block = self.new_block();

        self.emit(Inst::Jump(body_block));

        self.set_current(body_block);
        self.loop_stack.push(LoopContext {
            continue_block: body_block,
            break_block: exit_block,
        });
        self.lower_statements(&f.body);
        self.loop_stack.pop();
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(body_block));
        }

        self.set_current(exit_block);
    }

    /// Desugar: `count (i = start, end, step = s) { body }` into while loop IR
    fn lower_count(&mut self, c: &ast::CountStmt) {
        let start_op = self.lower_expr(&c.start);
        self.emit(Inst::Store(c.var_name.clone(), start_op));

        let end_op = self.lower_expr(&c.end);
        let end_reg = self.to_reg(end_op);

        let step_op = if let Some(ref step) = c.step {
            self.lower_expr(step)
        } else {
            Operand::Const(Constant::Number(1))
        };
        let step_reg = self.to_reg(step_op);

        let cond_block = self.new_block();
        let body_block = self.new_block();
        let incr_block = self.new_block();
        let exit_block = self.new_block();

        self.emit(Inst::Jump(cond_block));

        // Condition: i < end
        self.set_current(cond_block);
        let i_val = self.fresh_reg();
        self.emit(Inst::Load(i_val, c.var_name.clone()));
        let cmp = self.fresh_reg();
        self.emit(Inst::BinOp(cmp, BinOp::Less, Operand::Reg(i_val), Operand::Reg(end_reg)));
        self.emit(Inst::Branch(Operand::Reg(cmp), body_block, exit_block));

        // Body
        self.set_current(body_block);
        self.loop_stack.push(LoopContext {
            continue_block: incr_block,
            break_block: exit_block,
        });
        self.lower_statements(&c.body);
        self.loop_stack.pop();
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(incr_block));
        }

        // Increment: i = i + step
        self.set_current(incr_block);
        let cur = self.fresh_reg();
        self.emit(Inst::Load(cur, c.var_name.clone()));
        let next = self.fresh_reg();
        self.emit(Inst::BinOp(next, BinOp::Add, Operand::Reg(cur), Operand::Reg(step_reg)));
        self.emit(Inst::Store(c.var_name.clone(), Operand::Reg(next)));
        self.emit(Inst::Jump(cond_block));

        self.set_current(exit_block);
    }

    /// Desugar: `for (x in list) { body }` into index-based while loop
    /// For generator calls: inline the generator body with emit → loop body substitution
    fn lower_for_in(&mut self, f: &ast::ForInStmt) {
        // Check if the iterable is a generator call: `for (x in gen(args))`
        if let ast::Expr::Call(callee, args, _) = &f.iterable {
            if let ast::Expr::Identifier(func_name, _) = callee.as_ref() {
                if self.generator_functions.contains(func_name) {
                    // Inline the generator function
                    if let Some((params, body)) = self.function_bodies.get(func_name).cloned() {
                        // Lower arguments and bind to parameter names
                        for (i, param) in params.iter().enumerate() {
                            let val = if i < args.len() {
                                self.lower_expr(&args[i].value)
                            } else if let Some(ref default) = param.default_value {
                                self.lower_expr(default)
                            } else {
                                Operand::Const(Constant::Number(0))
                            };
                            self.emit(Inst::Store(param.name.clone(), val));
                        }

                        // Set up generator consumer context
                        let exit_block = self.new_block();
                        let prev_consumer = self.gen_consumer.take();
                        self.gen_consumer = Some((f.var_name.clone(), f.body.clone()));

                        // Push a loop context so `stop` in the for-body jumps to exit
                        // The generator's own loops will push their own contexts
                        self.loop_stack.push(LoopContext {
                            continue_block: exit_block, // not really used
                            break_block: exit_block,
                        });

                        self.lower_statements(&body);

                        self.loop_stack.pop();
                        self.gen_consumer = prev_consumer;

                        if !self.current().is_terminated() {
                            self.emit(Inst::Jump(exit_block));
                        }
                        self.set_current(exit_block);
                        return;
                    }
                }
            }
        }

        let iter_op = self.lower_expr(&f.iterable);
        let iter_reg = self.to_reg(iter_op);

        // _idx = 0
        let idx_name = format!("__iter_idx_{}", self.next_reg);
        self.emit(Inst::Store(idx_name.clone(), Operand::Const(Constant::Number(0))));

        // _len = list.count
        let len_reg = self.fresh_reg();
        self.emit(Inst::GetField(len_reg, Operand::Reg(iter_reg), "count".to_string()));

        let cond_block = self.new_block();
        let body_block = self.new_block();
        let incr_block = self.new_block();
        let exit_block = self.new_block();

        self.emit(Inst::Jump(cond_block));

        // Condition: _idx < _len
        self.set_current(cond_block);
        let idx_val = self.fresh_reg();
        self.emit(Inst::Load(idx_val, idx_name.clone()));
        let cmp = self.fresh_reg();
        self.emit(Inst::BinOp(cmp, BinOp::Less, Operand::Reg(idx_val), Operand::Reg(len_reg)));
        self.emit(Inst::Branch(Operand::Reg(cmp), body_block, exit_block));

        // Body: x = list[_idx]
        self.set_current(body_block);
        let cur_idx = self.fresh_reg();
        self.emit(Inst::Load(cur_idx, idx_name.clone()));
        let elem = self.fresh_reg();
        self.emit(Inst::GetIndex(elem, Operand::Reg(iter_reg), Operand::Reg(cur_idx)));
        self.emit(Inst::Store(f.var_name.clone(), Operand::Reg(elem)));

        self.loop_stack.push(LoopContext {
            continue_block: incr_block,
            break_block: exit_block,
        });
        self.lower_statements(&f.body);
        self.loop_stack.pop();
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(incr_block));
        }

        // Increment: _idx = _idx + 1
        self.set_current(incr_block);
        let cur = self.fresh_reg();
        self.emit(Inst::Load(cur, idx_name.clone()));
        let next = self.fresh_reg();
        self.emit(Inst::BinOp(next, BinOp::Add, Operand::Reg(cur), Operand::Const(Constant::Number(1))));
        self.emit(Inst::Store(idx_name, Operand::Reg(next)));
        self.emit(Inst::Jump(cond_block));

        self.set_current(exit_block);
    }

    /// Desugar: `check (val) { is X { ... } is Y { ... } }` into chain of if-else branches
    fn lower_check(&mut self, c: &ast::CheckStmt) {
        let val = self.lower_expr(&c.value);
        let val_reg = self.to_reg(val);
        let exit_block = self.new_block();

        for arm in &c.arms {
            let match_block = self.new_block();
            let next_block = self.new_block();

            let cond = self.lower_check_pattern(&arm.pattern, val_reg);
            self.emit(Inst::Branch(cond, match_block, next_block));

            self.set_current(match_block);

            // Bind destructured fields for TypeCheck/TypeWithGuard with bindings
            match &arm.pattern {
                ast::CheckPattern::TypeCheck(variant_name, Some(bindings))
                | ast::CheckPattern::TypeWithGuard(variant_name, Some(bindings), _) => {
                    // Look up the choice variant's field names
                    let field_names: Vec<String> = self.choice_variants.values()
                        .filter_map(|variants| variants.get(variant_name))
                        .next()
                        .cloned()
                        .unwrap_or_default();
                    for (i, binding) in bindings.iter().enumerate() {
                        let field_name = field_names.get(i).cloned().unwrap_or_else(|| binding.clone());
                        let field_reg = self.fresh_reg();
                        self.emit(Inst::GetField(
                            field_reg,
                            Operand::Reg(val_reg),
                            field_name,
                        ));
                        self.emit(Inst::Store(binding.clone(), Operand::Reg(field_reg)));
                    }
                }
                _ => {}
            }

            self.lower_statements(&arm.body);
            if !self.current().is_terminated() {
                self.emit(Inst::Jump(exit_block));
            }

            self.set_current(next_block);
        }

        // Fall through (no match) — jump to exit
        if !self.current().is_terminated() {
            self.emit(Inst::Jump(exit_block));
        }

        self.set_current(exit_block);
    }

    fn lower_check_pattern(&mut self, pattern: &ast::CheckPattern, val_reg: Reg) -> Operand {
        match pattern {
            ast::CheckPattern::Value(expr) => {
                let rhs = self.lower_expr(expr);
                let result = self.fresh_reg();
                self.emit(Inst::BinOp(result, BinOp::Eq, Operand::Reg(val_reg), rhs));
                Operand::Reg(result)
            }
            ast::CheckPattern::Comparison(op, expr) => {
                let rhs = self.lower_expr(expr);
                let ir_op = match op.as_str() {
                    "<" => BinOp::Less,
                    ">" => BinOp::Greater,
                    "<=" => BinOp::LessEq,
                    ">=" => BinOp::GreaterEq,
                    "==" => BinOp::Eq,
                    "!=" => BinOp::NotEq,
                    _ => BinOp::Eq,
                };
                let result = self.fresh_reg();
                self.emit(Inst::BinOp(result, ir_op, Operand::Reg(val_reg), rhs));
                Operand::Reg(result)
            }
            ast::CheckPattern::Null => {
                let result = self.fresh_reg();
                self.emit(Inst::BinOp(
                    result, BinOp::Eq,
                    Operand::Reg(val_reg), Operand::Const(Constant::Null),
                ));
                Operand::Reg(result)
            }
            ast::CheckPattern::TypeCheck(type_name, _) => {
                let result = self.fresh_reg();
                self.emit(Inst::Call(
                    result,
                    "obo_type_check".to_string(),
                    vec![Operand::Reg(val_reg), Operand::Const(Constant::Text(type_name.clone()))],
                ));
                Operand::Reg(result)
            }
            ast::CheckPattern::TypeWithGuard(type_name, _, guard) => {
                let type_result = self.fresh_reg();
                self.emit(Inst::Call(
                    type_result,
                    "obo_type_check".to_string(),
                    vec![Operand::Reg(val_reg), Operand::Const(Constant::Text(type_name.clone()))],
                ));
                let guard_val = self.lower_expr(guard);
                let combined = self.fresh_reg();
                self.emit(Inst::BinOp(combined, BinOp::And, Operand::Reg(type_result), guard_val));
                Operand::Reg(combined)
            }
        }
    }

    // ================================================================
    // Expression lowering
    // ================================================================

    fn lower_expr(&mut self, expr: &ast::Expr) -> Operand {
        match expr {
            ast::Expr::NumberLit(n, _) => Operand::Const(Constant::Number(*n)),
            ast::Expr::DecimalLit(d, _) => Operand::Const(Constant::Decimal(*d)),
            ast::Expr::StringLit(s, _) => Operand::Const(Constant::Text(s.clone())),
            ast::Expr::CharLit(c, _) => Operand::Const(Constant::Char(*c)),
            ast::Expr::BoolLit(b, _) => Operand::Const(Constant::Flag(*b)),
            ast::Expr::NullLit(_) => Operand::Const(Constant::Null),

            ast::Expr::Identifier(name, _) => {
                // Inline known compile-time constants.
                if let Some(c) = self.known_constants.get(name) {
                    return Operand::Const(c.clone());
                }
                // Inside actor methods, rewrite field access to self.field
                if self.current_actor_fields.contains(name) {
                    let self_reg = self.fresh_reg();
                    self.emit(Inst::Load(self_reg, "self".to_string()));
                    let dst = self.fresh_reg();
                    self.emit(Inst::GetField(dst, Operand::Reg(self_reg), name.clone()));
                    return Operand::Reg(dst);
                }
                let dst = self.fresh_reg();
                self.emit(Inst::Load(dst, name.clone()));
                Operand::Reg(dst)
            }

            ast::Expr::Binary(left, op, right, _) => {
                let lhs = self.lower_expr(left);
                let rhs = self.lower_expr(right);
                let ir_op = match op {
                    ast::BinOp::Add => BinOp::Add,
                    ast::BinOp::Sub => BinOp::Sub,
                    ast::BinOp::Mul => BinOp::Mul,
                    ast::BinOp::Div => BinOp::Div,
                    ast::BinOp::Mod => BinOp::Mod,
                    ast::BinOp::Eq => BinOp::Eq,
                    ast::BinOp::NotEq => BinOp::NotEq,
                    ast::BinOp::Less => BinOp::Less,
                    ast::BinOp::Greater => BinOp::Greater,
                    ast::BinOp::LessEq => BinOp::LessEq,
                    ast::BinOp::GreaterEq => BinOp::GreaterEq,
                    ast::BinOp::BitAnd => BinOp::BitAnd,
                    ast::BinOp::BitOr => BinOp::BitOr,
                    ast::BinOp::BitXor => BinOp::BitXor,
                    ast::BinOp::Shl => BinOp::Shl,
                    ast::BinOp::Shr => BinOp::Shr,
                };
                let dst = self.fresh_reg();
                self.emit(Inst::BinOp(dst, ir_op, lhs, rhs));
                Operand::Reg(dst)
            }

            ast::Expr::Unary(op, operand, _) => {
                let src = self.lower_expr(operand);
                let ir_op = match op {
                    ast::UnaryOp::Neg => UnaryOp::Neg,
                    ast::UnaryOp::Not => UnaryOp::Not,
                    ast::UnaryOp::BitNot => UnaryOp::BitNot,
                };
                let dst = self.fresh_reg();
                self.emit(Inst::UnaryOp(dst, ir_op, src));
                Operand::Reg(dst)
            }

            ast::Expr::Logical(left, op, right, _) => {
                let lhs = self.lower_expr(left);

                let rhs_block = self.new_block();
                let rhs_true = self.new_block();
                let rhs_false = self.new_block();
                let merge_block = self.new_block();

                // Short-circuit constant for the skipped branch
                let short_val = match op {
                    ast::LogicalOp::And => Operand::Const(Constant::Flag(false)),
                    ast::LogicalOp::Or  => Operand::Const(Constant::Flag(true)),
                };

                // For `and`: if LHS falsy, skip to merge with false
                // For `or`:  if LHS truthy, skip to merge with true
                match op {
                    ast::LogicalOp::And => self.emit(Inst::Branch(lhs, rhs_block, merge_block)),
                    ast::LogicalOp::Or  => self.emit(Inst::Branch(lhs, merge_block, rhs_block)),
                }
                let short_pred = self.current().id;

                // Evaluate RHS in its own block, then branch on its truthiness
                self.set_current(rhs_block);
                let rhs = self.lower_expr(right);
                self.emit(Inst::Branch(rhs, rhs_true, rhs_false));

                self.set_current(rhs_true);
                self.emit(Inst::Jump(merge_block));

                self.set_current(rhs_false);
                self.emit(Inst::Jump(merge_block));

                // Merge with phi
                self.set_current(merge_block);
                let dst = self.fresh_reg();
                self.emit(Inst::Phi(
                    dst,
                    vec![
                        (short_val, short_pred),
                        (Operand::Const(Constant::Flag(true)), rhs_true),
                        (Operand::Const(Constant::Flag(false)), rhs_false),
                    ],
                ));
                Operand::Reg(dst)
            }

            ast::Expr::Call(callee, args, _) => {
                let has_named = args.iter().any(|a| a.name.is_some());

                // Determine function name for param lookup (needed for named args + defaults)
                let func_name = match callee.as_ref() {
                    ast::Expr::Identifier(name, _) if self.function_names.contains(name) || name.contains("::") => {
                        Some(name.clone())
                    }
                    _ => None,
                };

                let ordered_args: Vec<&ast::CallArg> = if has_named {
                    if let Some(ref fname) = func_name {
                        if let Some(params) = self.function_params.get(fname).cloned() {
                            self.reorder_named_call_args(args, &params)
                        } else {
                            args.iter().collect()
                        }
                    } else {
                        args.iter().collect()
                    }
                } else {
                    args.iter().collect()
                };

                let mut arg_ops: Vec<Operand> = ordered_args.iter().map(|a| self.lower_expr(&a.value)).collect();

                match callee.as_ref() {
                    ast::Expr::Identifier(name, _) => {
                        // set/queue/stack constructors → MakeList (set gets dedup)
                        if matches!(name.as_str(), "set" | "queue" | "stack")
                            && !self.function_names.contains(name)
                        {
                            let list_dst = self.fresh_reg();
                            self.emit(Inst::MakeList(list_dst, arg_ops));
                            if name == "set" {
                                let dedup_dst = self.fresh_reg();
                                self.emit(Inst::Call(dedup_dst, "obo_set_new".to_string(), vec![Operand::Reg(list_dst)]));
                                return Operand::Reg(dedup_dst);
                            }
                            return Operand::Reg(list_dst);
                        }
                        // map() constructor → empty map
                        if name == "map" && !self.function_names.contains(name) && arg_ops.is_empty() {
                            let dst = self.fresh_reg();
                            self.emit(Inst::MakeMap(dst, vec![]));
                            return Operand::Reg(dst);
                        }
                        // pair(a, b) → MakeList with 2 elements
                        if name == "pair" && !self.function_names.contains(name) {
                            let list_dst = self.fresh_reg();
                            self.emit(Inst::MakeList(list_dst, arg_ops));
                            return Operand::Reg(list_dst);
                        }
                        // bag(...) → MakeList (heterogeneous list)
                        if name == "bag" && !self.function_names.contains(name) {
                            let list_dst = self.fresh_reg();
                            self.emit(Inst::MakeList(list_dst, arg_ops));
                            return Operand::Reg(list_dst);
                        }
                        // buffer(size) → obo_buffer_new(size)
                        if name == "buffer" && !self.function_names.contains(name) {
                            let size_op = if arg_ops.is_empty() {
                                Operand::Const(Constant::Number(0))
                            } else {
                                arg_ops.into_iter().next().unwrap()
                            };
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_buffer_new".to_string(), vec![size_op]));
                            return Operand::Reg(dst);
                        }
                        // TextBuilder(cap?) → obo_textbuilder_new(cap)
                        if name == "TextBuilder" && !self.function_names.contains(name) {
                            let cap_op = if arg_ops.is_empty() {
                                Operand::Const(Constant::Number(64))
                            } else {
                                arg_ops.into_iter().next().unwrap()
                            };
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_textbuilder_new".to_string(), vec![cap_op]));
                            return Operand::Reg(dst);
                        }
                        // Arena(cap?) → obo_arena_create(cap)
                        if name == "Arena" && !self.function_names.contains(name) {
                            let cap_op = if arg_ops.is_empty() {
                                Operand::Const(Constant::Number(1024))
                            } else {
                                arg_ops.into_iter().next().unwrap()
                            };
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_arena_create".to_string(), vec![cap_op]));
                            return Operand::Reg(dst);
                        }
                        // slice(list, start, end) → obo_list_slice(list, start, end)
                        if name == "slice" && !self.function_names.contains(name) {
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_list_slice".to_string(), arg_ops));
                            return Operand::Reg(dst);
                        }
                        // grid2d(rows, cols) or grid2d(rows, cols, fill) → obo_grid2d_new(rows, cols, fill)
                        if name == "grid2d" && !self.function_names.contains(name) {
                            let mut call_args = arg_ops;
                            if call_args.len() < 3 {
                                call_args.push(Operand::Const(Constant::Number(0)));
                            }
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_grid2d_new".to_string(), call_args));
                            return Operand::Reg(dst);
                        }
                        // grid3d(x, y, z) or grid3d(x, y, z, fill) → obo_grid3d_new(x, y, z, fill)
                        if name == "grid3d" && !self.function_names.contains(name) {
                            let mut call_args = arg_ops;
                            if call_args.len() < 4 {
                                call_args.push(Operand::Const(Constant::Number(0)));
                            }
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_grid3d_new".to_string(), call_args));
                            return Operand::Reg(dst);
                        }
                        // inspect(obj) → obo_reflect(obj) — returns list of field info maps
                        if name == "inspect" && !self.function_names.contains(name) {
                            let obj_op = if arg_ops.is_empty() {
                                Operand::Const(Constant::Null)
                            } else {
                                arg_ops.into_iter().next().unwrap()
                            };
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_reflect".to_string(), vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        if self.function_names.contains(name) || name.contains("::") {
                            // Fill in default parameter values for missing arguments.
                            if let Some(params) = self.function_params.get(name).cloned() {
                                while arg_ops.len() < params.len() {
                                    let idx = arg_ops.len();
                                    if let Some(ref default_expr) = params[idx].default_value {
                                        arg_ops.push(self.lower_expr(default_expr));
                                    } else {
                                        break;
                                    }
                                }
                            }
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, name.clone(), arg_ops));
                            Operand::Reg(dst)
                        } else {
                            let callee_op = self.lower_expr(callee);
                            let dst = self.fresh_reg();
                            self.emit(Inst::CallClosure(dst, callee_op, arg_ops));
                            Operand::Reg(dst)
                        }
                    }
                    ast::Expr::MemberAccess(obj, method, _) => {
                        // Detect event.listen(closure) pattern: obj.eventName.listen(closure)
                        if method == "listen" {
                            if let ast::Expr::MemberAccess(entity_expr, event_name, _) = obj.as_ref() {
                                // Check if any actor has this event name
                                let is_event = self.actor_events.values().any(|evts| evts.contains(event_name));
                                if is_event && arg_ops.len() == 1 {
                                    let entity_op = self.lower_expr(entity_expr);
                                    let event_name_op = Operand::Const(Constant::Text(event_name.clone()));
                                    let dst = self.fresh_reg();
                                    self.emit(Inst::Call(
                                        dst,
                                        "obo_event_listen".to_string(),
                                        vec![entity_op, event_name_op, arg_ops.remove(0)],
                                    ));
                                    return Operand::Reg(dst);
                                }
                            }
                        }
                        if let ast::Expr::Identifier(name, _) = obj.as_ref() {
                            if SYSTEM_ACTORS.iter().any(|&x| x == name.as_str()) {
                                let dst = self.fresh_reg();
                                let fn_name = format!("__sys_{}_{}", name, method);
                                self.emit(Inst::Call(dst, fn_name, arg_ops));
                                return Operand::Reg(dst);
                            }
                            // Choice variant with data: Shape.Circle(5) → entity
                            if let Some(variants) = self.choice_variants.get(name).cloned() {
                                if let Some(field_names) = variants.get(method.as_str()) {
                                    let mut fields = vec![
                                        ("__variant".to_string(), Operand::Const(Constant::Text(method.clone()))),
                                    ];
                                    for (i, fname) in field_names.iter().enumerate() {
                                        if let Some(op) = arg_ops.get(i) {
                                            fields.push((fname.clone(), op.clone()));
                                        }
                                    }
                                    let dst = self.fresh_reg();
                                    self.emit(Inst::MakeEntity(dst, name.clone(), fields));
                                    return Operand::Reg(dst);
                                }
                            }
                        }
                        if let ast::Expr::Identifier(actor, _) = obj.as_ref() {
                            if self.actor_names.contains(actor) {
                                let dst = self.fresh_reg();
                                let fn_name = format!("{}::{}", actor, method);
                                self.emit(Inst::Call(dst, fn_name, arg_ops));
                                return Operand::Reg(dst);
                            }
                        }
                        if let ast::Expr::Identifier(self_name, _) = obj.as_ref() {
                            if self_name == "self" {
                                if let Some(ref actor) = self.current_actor {
                                    let fn_name = format!("{}::{}", actor, method);
                                    let obj_op = self.lower_expr(obj);
                                    let dst = self.fresh_reg();
                                    let mut call_args = vec![obj_op];
                                    call_args.extend(arg_ops);
                                    self.emit(Inst::Call(dst, fn_name, call_args));
                                    return Operand::Reg(dst);
                                }
                            }
                        }
                        // Set/queue/stack method calls → direct C runtime calls
                        if let ast::Expr::Identifier(var_name, _) = obj.as_ref() {
                            if let Some(coll_type) = self.collection_types.get(var_name).cloned() {
                                // TextBuilder.append: dispatch to appendInt/appendChar for non-string args
                                if coll_type == "textbuilder" && method == "append" && args.len() == 1 {
                                    let arg_expr = &args[0].value;
                                    let is_str_arg = matches!(arg_expr,
                                        ast::Expr::StringLit(_, _) | ast::Expr::Interpolation(_, _)
                                    );
                                    let is_char_arg = matches!(arg_expr, ast::Expr::CharLit(_, _));
                                    let fn_name = if is_str_arg {
                                        "obo_textbuilder_append".to_string()
                                    } else if is_char_arg {
                                        "obo_textbuilder_appendChar".to_string()
                                    } else {
                                        "obo_textbuilder_appendInt".to_string()
                                    };
                                    let obj_op = self.lower_expr(obj);
                                    let dst = self.fresh_reg();
                                    let mut call_args = vec![obj_op];
                                    call_args.extend(arg_ops);
                                    self.emit(Inst::Call(dst, fn_name, call_args));
                                    return Operand::Reg(dst);
                                }
                                let obj_op = self.lower_expr(obj);
                                let dst = self.fresh_reg();
                                let fn_name = format!("obo_{}_{}", coll_type, method);
                                let mut call_args = vec![obj_op];
                                call_args.extend(arg_ops);
                                self.emit(Inst::Call(dst, fn_name, call_args));
                                return Operand::Reg(dst);
                            }
                        }
                        let obj_op = self.lower_expr(obj);
                        let dst = self.fresh_reg();
                        self.emit(Inst::CallMethod(dst, obj_op, method.clone(), arg_ops));
                        Operand::Reg(dst)
                    }
                    _ => {
                        let callee_op = self.lower_expr(callee);
                        let dst = self.fresh_reg();
                        self.emit(Inst::Call(dst, format!("__indirect"), vec![callee_op].into_iter().chain(arg_ops).collect()));
                        Operand::Reg(dst)
                    }
                }
            }

            ast::Expr::MemberAccess(obj, field, _) => {
                if let ast::Expr::Identifier(name, _) = obj.as_ref() {
                    if SYSTEM_ACTORS.iter().any(|&x| x == name.as_str()) {
                        if let Some(op) = self.system_actor_member_operand(name, field) {
                            return op;
                        }
                    }
                    // Choice no-arg variant: Color.Red → entity with __variant
                    if let Some(variants) = self.choice_variants.get(name) {
                        if let Some(variant_fields) = variants.get(field) {
                            if variant_fields.is_empty() {
                                let dst = self.fresh_reg();
                                self.emit(Inst::MakeEntity(
                                    dst,
                                    name.clone(),
                                    vec![("__variant".to_string(), Operand::Const(Constant::Text(field.clone())))],
                                ));
                                return Operand::Reg(dst);
                            }
                        }
                    }
                    // Set/queue/stack field access → C runtime calls
                    if let Some(coll_type) = self.collection_types.get(name).cloned() {
                        if matches!(field.as_str(), "peek" | "front" | "top") {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            let fn_name = format!("obo_{}_{}", coll_type, field);
                            self.emit(Inst::Call(dst, fn_name, vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        if field == "toList" {
                            // Already a list internally, just return as-is
                            return self.lower_expr(obj);
                        }
                        // pair.first → obo_list_get_i64(list, 0), pair.second → obo_list_get_i64(list, 1)
                        if coll_type == "pair" {
                            if field == "first" || field == "second" {
                                let obj_op = self.lower_expr(obj);
                                let idx = if field == "first" { 0i64 } else { 1i64 };
                                let dst = self.fresh_reg();
                                self.emit(Inst::Call(dst, "obo_list_get".to_string(), vec![obj_op, Operand::Const(Constant::Number(idx))]));
                                return Operand::Reg(dst);
                            }
                        }
                        // buffer.length → obo_buffer_length(buf)
                        if coll_type == "buffer" && matches!(field.as_str(), "length" | "count") {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_buffer_length".to_string(), vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        // textbuilder.length → obo_textbuilder_length(tb)
                        if coll_type == "textbuilder" && matches!(field.as_str(), "length" | "count") {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            self.emit(Inst::Call(dst, "obo_textbuilder_length".to_string(), vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        // arena.used / arena.capacity → C runtime calls
                        if coll_type == "arena" && matches!(field.as_str(), "used" | "capacity") {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            let fn_name = format!("obo_arena_{}", field);
                            self.emit(Inst::Call(dst, fn_name, vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        if coll_type == "buffer" && field == "empty" {
                            let obj_op = self.lower_expr(obj);
                            let len_dst = self.fresh_reg();
                            self.emit(Inst::Call(len_dst, "obo_buffer_length".to_string(), vec![obj_op]));
                            let dst = self.fresh_reg();
                            self.emit(Inst::BinOp(dst, crate::ir::inst::BinOp::Eq, Operand::Reg(len_dst), Operand::Const(Constant::Number(0))));
                            return Operand::Reg(dst);
                        }
                        // grid2d/grid3d field access → C runtime calls
                        if (coll_type == "grid2d" || coll_type == "grid3d")
                            && matches!(field.as_str(), "rows" | "cols" | "x" | "y" | "z" | "count" | "width" | "height" | "depth")
                        {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            let fn_name = format!("obo_{}_{}", coll_type, field);
                            self.emit(Inst::Call(dst, fn_name, vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        if (coll_type == "grid2d" || coll_type == "grid3d") && field == "toList" {
                            let obj_op = self.lower_expr(obj);
                            let dst = self.fresh_reg();
                            let fn_name = format!("obo_{}_toList", coll_type);
                            self.emit(Inst::Call(dst, fn_name, vec![obj_op]));
                            return Operand::Reg(dst);
                        }
                        // count/empty/length → use standard list functions (same struct)
                    }
                }
                let obj_op = self.lower_expr(obj);
                let dst = self.fresh_reg();
                self.emit(Inst::GetField(dst, obj_op, field.clone()));
                Operand::Reg(dst)
            }

            ast::Expr::IndexAccess(obj, idx, _) => {
                let obj_op = self.lower_expr(obj);
                let idx_op = self.lower_expr(idx);
                let dst = self.fresh_reg();
                self.emit(Inst::GetIndex(dst, obj_op, idx_op));
                Operand::Reg(dst)
            }

            ast::Expr::ListLiteral(elements, _) => {
                let ops: Vec<Operand> = elements.iter().map(|e| self.lower_expr(e)).collect();
                let dst = self.fresh_reg();
                self.emit(Inst::MakeList(dst, ops));
                Operand::Reg(dst)
            }

            ast::Expr::MapLiteral(pairs, _) => {
                let ops: Vec<(Operand, Operand)> = pairs.iter().map(|(k, v)| {
                    (self.lower_expr(k), self.lower_expr(v))
                }).collect();
                let dst = self.fresh_reg();
                self.emit(Inst::MakeMap(dst, ops));
                Operand::Reg(dst)
            }

            ast::Expr::EntityInit(name, fields, _) => {
                let field_ops: Vec<(String, Operand)> = fields.iter().map(|f| {
                    (f.name.clone(), self.lower_expr(&f.value))
                }).collect();
                let dst = self.fresh_reg();
                if self.packed_types.contains(name) {
                    self.emit(Inst::MakePackedEntity(dst, name.clone(), field_ops));
                } else {
                    self.emit(Inst::MakeEntity(dst, name.clone(), field_ops));
                }
                Operand::Reg(dst)
            }

            ast::Expr::InlineIf(value, condition, fallback, _) => {
                let cond_op = self.lower_expr(condition);

                let then_block = self.new_block();
                let else_block = self.new_block();
                let merge_block = self.new_block();

                self.emit(Inst::Branch(cond_op, then_block, else_block));

                self.set_current(then_block);
                let then_value = self.lower_expr(value);
                let then_pred = self.current().id;
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(merge_block));
                }

                self.set_current(else_block);
                let else_value = self.lower_expr(fallback);
                let else_pred = self.current().id;
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(merge_block));
                }

                self.set_current(merge_block);
                let dst = self.fresh_reg();
                self.emit(Inst::Phi(
                    dst,
                    vec![(then_value, then_pred), (else_value, else_pred)],
                ));
                Operand::Reg(dst)
            }

            ast::Expr::IfPossibleElse(value, fallback, _) => {
                let body_block = self.new_block();
                let else_block = self.new_block();
                let exit_block = self.new_block();
                let result_var = format!("__possible_{}", self.fresh_reg());

                // Push possible frame
                let jb = self.fresh_reg();
                self.emit(Inst::Call(jb, "obo_possible_push".to_string(), vec![]));
                let rv = self.fresh_reg();
                self.emit(Inst::Call(rv, "_setjmp".to_string(), vec![Operand::Reg(jb)]));
                let zero = Operand::Const(Constant::Number(0));
                let is_err = self.fresh_reg();
                self.emit(Inst::BinOp(is_err, BinOp::NotEq, Operand::Reg(rv), zero));
                self.emit(Inst::Branch(Operand::Reg(is_err), else_block, body_block));

                // Body — evaluate value, store result
                self.set_current(body_block);
                let val = self.lower_expr(value);
                self.emit(Inst::Store(result_var.clone(), val));
                let pop1 = self.fresh_reg();
                self.emit(Inst::Call(pop1, "obo_possible_pop".to_string(), vec![]));
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(exit_block));
                }

                // Else — evaluate fallback, store result
                self.set_current(else_block);
                let fb = self.lower_expr(fallback);
                self.emit(Inst::Store(result_var.clone(), fb));
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(exit_block));
                }

                // Exit — load result
                self.set_current(exit_block);
                let out = self.fresh_reg();
                self.emit(Inst::Load(out, result_var));
                Operand::Reg(out)
            }

            ast::Expr::Interpolation(parts, _) => {
                if parts.is_empty() {
                    return Operand::Const(Constant::Text(String::new()));
                }
                let mut result = self.lower_expr(&parts[0]);
                for part in parts.iter().skip(1) {
                    let right = self.lower_expr(part);
                    let dst = self.fresh_reg();
                    self.emit(Inst::BinOp(dst, BinOp::Concat, result, right));
                    result = Operand::Reg(dst);
                }
                result
            }

            ast::Expr::Action(params, body, _) => {
                self.lower_closure(params, &ActionBodyRef::Block(body))
            }

            ast::Expr::ArrowAction(params, body, _) => {
                self.lower_closure(params, &ActionBodyRef::Expr(body))
            }

            ast::Expr::Cast(_, expr, _) => self.lower_expr(expr),
            ast::Expr::SafeCast(_, expr, _fallback, _) => self.lower_expr(expr),
            ast::Expr::Range(start, end, step_opt, _) => {
                let s = self.lower_expr(start);
                let e = self.lower_expr(end);
                let st = if let Some(step) = step_opt {
                    self.lower_expr(step)
                } else {
                    Operand::Const(Constant::Number(1))
                };
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "obo_range".to_string(), vec![s, e, st]));
                Operand::Reg(dst)
            }
            ast::Expr::Run(expr, _) => self.lower_run_task_expr(expr),
            ast::Expr::ChannelCreate(_) => {
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "obo_channel_create".to_string(), vec![]));
                Operand::Reg(dst)
            }
            ast::Expr::AtomicCreate(init, _) => {
                let init_op = if let Some(expr) = init {
                    self.lower_expr(expr)
                } else {
                    Operand::Const(Constant::Number(0))
                };
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "obo_atomic_create".to_string(), vec![init_op]));
                Operand::Reg(dst)
            }
            ast::Expr::Pipe(left, right, _) => {
                let l = self.lower_expr(left);
                match right.as_ref() {
                    ast::Expr::Call(callee, args, _) => {
                        let mut arg_ops = vec![l];
                        for a in args {
                            arg_ops.push(self.lower_expr(&a.value));
                        }
                        match callee.as_ref() {
                            ast::Expr::Identifier(name, _) if self.function_names.contains(name) => {
                                let dst = self.fresh_reg();
                                self.emit(Inst::Call(dst, name.clone(), arg_ops));
                                Operand::Reg(dst)
                            }
                            _ => {
                                let callee_op = self.lower_expr(callee);
                                let dst = self.fresh_reg();
                                self.emit(Inst::CallClosure(dst, callee_op, arg_ops));
                                Operand::Reg(dst)
                            }
                        }
                    }
                    ast::Expr::Identifier(name, _) => {
                        let dst = self.fresh_reg();
                        if self.function_names.contains(name) {
                            self.emit(Inst::Call(dst, name.clone(), vec![l]));
                        } else {
                            let callee_op = self.lower_expr(right);
                            self.emit(Inst::CallClosure(dst, callee_op, vec![l]));
                        }
                        Operand::Reg(dst)
                    }
                    _ => {
                        let callee_op = self.lower_expr(right);
                        let dst = self.fresh_reg();
                        self.emit(Inst::CallClosure(dst, callee_op, vec![l]));
                        Operand::Reg(dst)
                    }
                }
            }

            ast::Expr::Own(inner, _) => {
                // Lower the inner expression. Ownership tracking is handled
                // at the MetalBlock/SafeBlock level during scope exit.
                self.lower_expr(inner)
            }

            ast::Expr::InlineAsm(template, constraints, inputs, _) => {
                let mut input_ops = Vec::new();
                for input in inputs {
                    input_ops.push(self.lower_expr(input));
                }
                let dst = self.fresh_reg();
                self.emit(Inst::InlineAsm(dst, template.clone(), constraints.clone(), input_ops));
                Operand::Reg(dst)
            }

            ast::Expr::MetalExpr(stmts, _) => {
                // Metal expression: execute block, capture `out` value.
                // 1. Create a temp variable and exit block
                let result_var = format!("__metal_expr_{}", self.next_reg);
                self.next_reg += 1;
                let exit_block = self.new_block();

                // Initialize result var to null (in case no out is reached)
                self.emit(Inst::Store(result_var.clone(), Operand::Const(Constant::Null)));

                // Enter metal mode (pause GC)
                let me = self.fresh_reg();
                self.emit(Inst::Call(me, "obo_metal_enter".to_string(), vec![]));

                // 2. Push metal expression context so `out` becomes store+jump
                self.metal_expr_stack.push(MetalExprContext {
                    result_var: result_var.clone(),
                    exit_block,
                });

                // 3. Lower the block body (same as MetalBlock statement, with defers)
                let mut regular: Vec<&ast::Statement> = Vec::new();
                let mut defers: Vec<&Vec<ast::Statement>> = Vec::new();
                let mut owned_vars: Vec<String> = Vec::new();
                for s in stmts {
                    if let ast::Statement::Defer(body, _) = s {
                        defers.push(body);
                    } else {
                        if let ast::Statement::VarDecl(v) = s {
                            if matches!(&v.initializer, ast::Expr::Own(_, _)) {
                                owned_vars.push(v.name.clone());
                            }
                        }
                        if let ast::Statement::Assignment(a) = s {
                            if matches!(&a.value, ast::Expr::Own(_, _)) {
                                if let ast::Expr::Identifier(name, _) = &a.target {
                                    owned_vars.push(name.clone());
                                }
                            }
                        }
                        regular.push(s);
                    }
                }

                for s in &regular {
                    self.lower_statement(s);
                    if self.current().is_terminated() {
                        break;
                    }
                }

                // Lower defers in reverse (LIFO) — only if current block not terminated
                if !self.current().is_terminated() {
                    for defer_body in defers.iter().rev() {
                        self.lower_statements(defer_body);
                        if self.current().is_terminated() {
                            break;
                        }
                    }
                }

                // Free owned vars
                if !self.current().is_terminated() {
                    for var_name in owned_vars.iter().rev() {
                        let ptr_reg = self.fresh_reg();
                        self.emit(Inst::Load(ptr_reg, var_name.clone()));
                        let free_reg = self.fresh_reg();
                        self.emit(Inst::Call(free_reg, "__sys_pointer_free".to_string(), vec![Operand::Reg(ptr_reg)]));
                    }
                }

                // Fall through to exit block if not already jumped
                if !self.current().is_terminated() {
                    self.emit(Inst::Jump(exit_block));
                }

                // 4. Pop context, switch to exit block, exit metal mode, load result
                self.metal_expr_stack.pop();
                self.set_current(exit_block);
                let mx = self.fresh_reg();
                self.emit(Inst::Call(mx, "obo_metal_exit".to_string(), vec![]));
                let dst = self.fresh_reg();
                self.emit(Inst::Load(dst, result_var));
                Operand::Reg(dst)
            }

            ast::Expr::MemoReserve(size_expr, _) => {
                let size_op = self.lower_expr(size_expr);
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "__sys_pointer_alloc".to_string(), vec![size_op]));
                Operand::Reg(dst)
            }

            ast::Expr::MemoClean(addr_expr, _) => {
                let addr_op = self.lower_expr(addr_expr);
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "__sys_pointer_free".to_string(), vec![addr_op]));
                Operand::Reg(dst)
            }

            ast::Expr::MemoLoad { width, address, .. } => {
                let addr_op = self.lower_expr(address);
                let dst = self.fresh_reg();
                let fn_name = match width {
                    8 => "__sys_mem_load8",
                    16 | 32 => "__sys_mem_load32",
                    _ => "__sys_mem_load64",
                };
                self.emit(Inst::Call(dst, fn_name.to_string(), vec![addr_op]));
                Operand::Reg(dst)
            }

            ast::Expr::MemoStore { width, value, address, .. } => {
                let val_op = self.lower_expr(value);
                let addr_op = self.lower_expr(address);
                let dst = self.fresh_reg();
                let fn_name = match width {
                    8 => "__sys_mem_store8",
                    16 | 32 => "__sys_mem_store32",
                    _ => "__sys_mem_store64",
                };
                self.emit(Inst::Call(dst, fn_name.to_string(), vec![addr_op, val_op]));
                Operand::Reg(dst)
            }
        }
    }

    // ================================================================
    // Helpers
    // ================================================================

    /// System actor members that lower to constants or `Call(__sys_*)` (native parity).
    fn system_actor_member_operand(&mut self, actor: &str, field: &str) -> Option<Operand> {
        match (actor, field) {
            ("Math", "pi") => Some(Operand::Const(Constant::Decimal(std::f64::consts::PI))),
            ("Math", "e") => Some(Operand::Const(Constant::Decimal(std::f64::consts::E))),
            ("Math", "infinity") => Some(Operand::Const(Constant::Decimal(f64::INFINITY))),
            ("Math", "maxNumber") => Some(Operand::Const(Constant::Number(i64::MAX))),
            ("Math", "minNumber") => Some(Operand::Const(Constant::Number(i64::MIN))),
            ("Time", "now") => {
                let dst = self.fresh_reg();
                self.emit(Inst::Call(dst, "__sys_Time_now".to_string(), vec![]));
                Some(Operand::Reg(dst))
            }
            ("Time", "nowSeconds") => {
                let dst = self.fresh_reg();
                self.emit(Inst::Call(
                    dst,
                    "__sys_Time_nowSeconds".to_string(),
                    vec![],
                ));
                Some(Operand::Reg(dst))
            }
            _ => None,
        }
    }

    fn fresh_reg(&mut self) -> Reg {
        let r = Reg(self.next_reg);
        self.next_reg += 1;
        r
    }

    fn reorder_named_call_args<'a>(&self, args: &'a [ast::CallArg], params: &[ast::Param]) -> Vec<&'a ast::CallArg> {
        let mut result: Vec<Option<&'a ast::CallArg>> = vec![None; params.len()];
        let mut positional_idx = 0;

        for arg in args {
            if let Some(ref name) = arg.name {
                if let Some(idx) = params.iter().position(|p| &p.name == name) {
                    result[idx] = Some(arg);
                } else {
                    // Unknown named arg — keep positional
                    while positional_idx < result.len() && result[positional_idx].is_some() {
                        positional_idx += 1;
                    }
                    if positional_idx < params.len() {
                        result[positional_idx] = Some(arg);
                        positional_idx += 1;
                    }
                }
            } else {
                while positional_idx < result.len() && result[positional_idx].is_some() {
                    positional_idx += 1;
                }
                if positional_idx < params.len() {
                    result[positional_idx] = Some(arg);
                    positional_idx += 1;
                }
            }
        }

        result.into_iter().filter_map(|x| x).collect()
    }

    fn new_block(&mut self) -> BlockId {
        let id = BlockId(self.next_block);
        self.next_block += 1;
        self.blocks.push(BasicBlock::new(id));
        id
    }

    fn set_current(&mut self, block: BlockId) {
        self.current_block = block.0 as usize;
    }

    fn current(&self) -> &BasicBlock {
        &self.blocks[self.current_block]
    }

    fn emit(&mut self, inst: Inst) {
        self.blocks[self.current_block].push_with_line(inst, self.current_line);
    }

    fn to_reg(&mut self, op: Operand) -> Reg {
        match op {
            Operand::Reg(r) => r,
            Operand::Const(c) => {
                let r = self.fresh_reg();
                self.emit(Inst::Const(r, c));
                r
            }
        }
    }

    fn const_eval(&self, expr: &ast::Expr) -> Option<Constant> {
        match expr {
            ast::Expr::NumberLit(n, _) => Some(Constant::Number(*n)),
            ast::Expr::DecimalLit(d, _) => Some(Constant::Decimal(*d)),
            ast::Expr::StringLit(s, _) => Some(Constant::Text(s.clone())),
            ast::Expr::BoolLit(b, _) => Some(Constant::Flag(*b)),
            ast::Expr::NullLit(_) => Some(Constant::Null),
            _ => None,
        }
    }

    fn lower_run_task_expr(&mut self, expr: &ast::Expr) -> Operand {
        let closure = match expr {
            ast::Expr::Action(params, body, _) if params.is_empty() => {
                self.lower_closure(params, &ActionBodyRef::Block(body))
            }
            ast::Expr::ArrowAction(params, body, _) if params.is_empty() => {
                self.lower_closure(params, &ActionBodyRef::Expr(body))
            }
            _ => self.lower_closure(&[], &ActionBodyRef::Expr(expr)),
        };

        let dst = self.fresh_reg();
        self.emit(Inst::RunTask(dst, closure));
        Operand::Reg(dst)
    }

    /// Lower an action / arrow-action expression into a synthetic closure function + MakeClosure.
    fn lower_closure(&mut self, params: &[ast::Param], body: &ActionBodyRef) -> Operand {
        let closure_id = self.next_closure_id;
        self.next_closure_id += 1;
        let fn_name = format!("__closure_{}", closure_id);

        // Collect free variables from the body
        let mut referenced = HashSet::new();
        match body {
            ActionBodyRef::Block(stmts) => {
                for s in *stmts { collect_free_vars_stmt(s, &mut referenced); }
            }
            ActionBodyRef::Expr(expr) => collect_free_vars_expr(expr, &mut referenced),
        }
        let param_names: HashSet<String> = params.iter().map(|p| p.name.clone()).collect();
        let mut sorted_captures: Vec<String> = referenced.into_iter()
            .filter(|n| !param_names.contains(n) && !SYSTEM_ACTORS.contains(&n.as_str()))
            .collect();
        sorted_captures.sort();

        // Save current lowering state
        let saved_reg = self.next_reg;
        let saved_block = self.next_block;
        let saved_blocks = std::mem::take(&mut self.blocks);
        let saved_current = self.current_block;
        let saved_loop = std::mem::take(&mut self.loop_stack);

        self.next_reg = 0;
        self.next_block = 0;
        self.blocks = Vec::new();
        self.loop_stack = Vec::new();

        let entry = self.new_block();
        self.set_current(entry);

        // Closure function takes: (__closure_self: i8*, actual_params...)
        let mut all_params = vec!["__closure_self".to_string()];
        let mut all_param_types = vec![IrParamType::Str];
        for p in params {
            all_params.push(p.name.clone());
            all_param_types.push(ast_param_ir_type(p));
        }

        // Store params
        for (i, p) in all_params.iter().enumerate() {
            let reg = Reg(i as u32);
            self.next_reg = self.next_reg.max(i as u32 + 1);
            self.emit(Inst::Store(p.clone(), Operand::Reg(reg)));
        }

        // Load captures from closure struct via __closure_get_capture
        for (i, cap_name) in sorted_captures.iter().enumerate() {
            let cap_reg = self.fresh_reg();
            let self_reg = self.fresh_reg();
            self.emit(Inst::Load(self_reg, "__closure_self".to_string()));
            self.emit(Inst::Call(
                cap_reg,
                "obo_closure_get_capture".to_string(),
                vec![Operand::Reg(self_reg), Operand::Const(Constant::Number(i as i64))],
            ));
            self.emit(Inst::Store(cap_name.clone(), Operand::Reg(cap_reg)));
        }

        // Lower body
        match body {
            ActionBodyRef::Block(stmts) => self.lower_statements(stmts),
            ActionBodyRef::Expr(expr) => {
                let val = self.lower_expr(expr);
                self.emit(Inst::Return(vec![val]));
            }
        }
        if !self.current().is_terminated() {
            self.emit(Inst::Return(Vec::new()));
        }

        let closure_func = IrFunction {
            name: fn_name.clone(),
            params: all_params,
            param_types: all_param_types,
            blocks: std::mem::take(&mut self.blocks),
            start_line: 0,
            is_export: false,
            export_param_types: Vec::new(),
            export_ret_type: None,
            is_interrupt: false,
        };
        self.closure_functions.push(closure_func);

        // Restore state
        self.next_reg = saved_reg;
        self.next_block = saved_block;
        self.blocks = saved_blocks;
        self.current_block = saved_current;
        self.loop_stack = saved_loop;

        // Emit MakeClosure with capture values at the original call site
        let capture_ops: Vec<Operand> = sorted_captures.iter().map(|name| {
            let r = self.fresh_reg();
            self.emit(Inst::Load(r, name.clone()));
            Operand::Reg(r)
        }).collect();
        let dst = self.fresh_reg();
        self.emit(Inst::MakeClosure(dst, fn_name, capture_ops));
        Operand::Reg(dst)
    }

    /// Check if a list of AST statements contains an `emit` statement (recursively).
    fn ast_body_contains_emit(stmts: &[ast::Statement]) -> bool {
        for stmt in stmts {
            match stmt {
                ast::Statement::Emit(_) => return true,
                ast::Statement::If(i) => {
                    if Self::ast_body_contains_emit(&i.then_body) { return true; }
                    if let Some(else_body) = &i.else_body {
                        if Self::ast_body_contains_emit(else_body) { return true; }
                    }
                }
                ast::Statement::While(w) => {
                    if Self::ast_body_contains_emit(&w.body) { return true; }
                }
                ast::Statement::Forever(f) => {
                    if Self::ast_body_contains_emit(&f.body) { return true; }
                }
                ast::Statement::ForIn(f) => {
                    if Self::ast_body_contains_emit(&f.body) { return true; }
                }
                ast::Statement::Count(c) => {
                    if Self::ast_body_contains_emit(&c.body) { return true; }
                }
                ast::Statement::Check(c) => {
                    for arm in &c.arms {
                        if Self::ast_body_contains_emit(&arm.body) { return true; }
                    }
                }
                _ => {}
            }
        }
        false
    }
}

enum ActionBodyRef<'a> {
    Block(&'a [ast::Statement]),
    Expr(&'a ast::Expr),
}
