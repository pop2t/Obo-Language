use crate::parser::ast::*;

/// Generates Markdown documentation from an OBO program's AST.
pub struct DocGenerator {
    buf: String,
    source_file: String,
}

/// Parsed doc comment with optional @param and @out tags.
struct DocParts {
    description: Vec<String>,
    params: Vec<(String, String)>, // (name, description)
    returns: Vec<String>,
}

fn parse_doc_comments(docs: &[String]) -> DocParts {
    let mut description = Vec::new();
    let mut params = Vec::new();
    let mut returns = Vec::new();

    for line in docs {
        let trimmed = line.trim();
        if let Some(rest) = trimmed.strip_prefix("@param ") {
            // Split on first whitespace: "@param name description..."
            let rest = rest.trim();
            if let Some(pos) = rest.find(|c: char| c.is_whitespace()) {
                let name = rest[..pos].to_string();
                let desc = rest[pos..].trim().to_string();
                params.push((name, desc));
            } else {
                params.push((rest.to_string(), String::new()));
            }
        } else if let Some(rest) = trimmed.strip_prefix("@out ") {
            returns.push(rest.trim().to_string());
        } else {
            description.push(trimmed.to_string());
        }
    }

    DocParts { description, params, returns }
}

fn format_type(ty: &TypeExpr) -> String {
    match ty {
        TypeExpr::Named(name, _) => format!("`{}`", name),
        TypeExpr::Generic(name, params, _) => {
            let parts: Vec<String> = params.iter().map(|p| format_type(p)).collect();
            format!("`{} of {}`", name, parts.join(", "))
        }
        TypeExpr::MapType(k, v, _) => {
            format!("`map of {} to {}`", format_type(k).trim_matches('`'), format_type(v).trim_matches('`'))
        }
        TypeExpr::Union(types, _) => {
            let parts: Vec<String> = types.iter().map(|t| format_type(t).trim_matches('`').to_string()).collect();
            format!("`{}`", parts.join(" or "))
        }
    }
}

fn format_param(p: &Param) -> String {
    let mut s = format!("`{}`", p.name);
    if let Some(ref ty) = p.type_annotation {
        s.push_str(&format!(" as {}", format_type(ty)));
    }
    if p.default_value.is_some() {
        s.push_str(" *(optional)*");
    }
    s
}

fn visibility(is_public: bool) -> &'static str {
    if is_public { "public " } else { "" }
}

impl DocGenerator {
    pub fn new(source_file: &str) -> Self {
        Self {
            buf: String::new(),
            source_file: source_file.to_string(),
        }
    }

    pub fn generate(mut self, program: &Program) -> String {
        // Title
        let name = std::path::Path::new(&self.source_file)
            .file_stem()
            .map(|s| s.to_string_lossy().to_string())
            .unwrap_or_else(|| self.source_file.clone());
        self.push(&format!("# {}\n\n", name));

        // Collect top-level items by category
        let mut constants = Vec::new();
        let mut functions = Vec::new();
        let mut entities = Vec::new();
        let mut actors = Vec::new();
        let mut choices = Vec::new();
        let mut traits = Vec::new();

        for decl in program {
            match decl {
                Declaration::Const(c) => constants.push(c),
                Declaration::Function(f) => functions.push(f),
                Declaration::Entity(e) => entities.push(e),
                Declaration::Actor(a) => actors.push(a),
                Declaration::Choice(c) => choices.push(c),
                Declaration::Trait(t) => traits.push(t),
                _ => {}
            }
        }

        // Table of contents
        let mut toc_items = Vec::new();
        if !constants.is_empty() { toc_items.push("- [Constants](#constants)"); }
        if !choices.is_empty() { toc_items.push("- [Choices](#choices)"); }
        if !traits.is_empty() { toc_items.push("- [Traits](#traits)"); }
        if !entities.is_empty() { toc_items.push("- [Entities](#entities)"); }
        if !actors.is_empty() { toc_items.push("- [Actors](#actors)"); }
        if !functions.is_empty() { toc_items.push("- [Functions](#functions)"); }
        if toc_items.len() > 1 {
            for item in &toc_items {
                self.push(item);
                self.push("\n");
            }
            self.push("\n---\n\n");
        }

        // Sections
        if !constants.is_empty() {
            self.push("## Constants\n\n");
            for c in &constants {
                self.gen_const(c);
            }
        }

        if !choices.is_empty() {
            self.push("## Choices\n\n");
            for c in &choices {
                self.gen_choice(c);
            }
        }

        if !traits.is_empty() {
            self.push("## Traits\n\n");
            for t in &traits {
                self.gen_trait(t);
            }
        }

        if !entities.is_empty() {
            self.push("## Entities\n\n");
            for e in &entities {
                self.gen_entity(e);
            }
        }

        if !actors.is_empty() {
            self.push("## Actors\n\n");
            for a in &actors {
                self.gen_actor(a);
            }
        }

        if !functions.is_empty() {
            self.push("## Functions\n\n");
            for f in &functions {
                self.gen_function(f);
            }
        }

        self.buf
    }

    fn push(&mut self, s: &str) {
        self.buf.push_str(s);
    }

    fn gen_doc_description(&mut self, docs: &DocParts) {
        if !docs.description.is_empty() {
            for line in &docs.description {
                if line.is_empty() {
                    self.push("\n");
                } else {
                    self.push(line);
                    self.push("\n");
                }
            }
            self.push("\n");
        }
    }

    fn gen_function(&mut self, f: &FunctionDecl) {
        let docs = parse_doc_comments(&f.doc_comments);

        // Signature
        let params_str: Vec<String> = f.params.iter().map(|p| {
            let mut s = p.name.clone();
            if let Some(ref ty) = p.type_annotation {
                s.push_str(&format!(" as {}", format_type(ty).trim_matches('`')));
            }
            if p.default_value.is_some() {
                s.push_str(" = ...");
            }
            s
        }).collect();

        self.push(&format!("### `{}function {}({})`\n\n",
            visibility(f.is_public), f.name, params_str.join(", ")));

        self.gen_doc_description(&docs);

        // Parameters (from @param tags or inferred from signature)
        let has_params = !f.params.is_empty();
        if has_params {
            self.push("**Parameters:**\n\n");
            for p in &f.params {
                let mut line = format!("- {}", format_param(p));
                // Add @param description if available
                if let Some((_, desc)) = docs.params.iter().find(|(name, _)| name == &p.name) {
                    if !desc.is_empty() {
                        line.push_str(&format!(" — {}", desc));
                    }
                }
                self.push(&line);
                self.push("\n");
            }
            self.push("\n");
        }

        // Return info
        if !docs.returns.is_empty() {
            self.push(&format!("**Returns:** {}\n\n", docs.returns.join("; ")));
        }
    }

    fn gen_entity(&mut self, e: &EntityDecl) {
        let docs = parse_doc_comments(&e.doc_comments);
        self.push(&format!("### `{}entity {}`\n\n", visibility(e.is_public), e.name));
        self.gen_doc_description(&docs);

        if !e.fields.is_empty() {
            self.push("**Fields:**\n\n");
            for f in &e.fields {
                let mut s = format!("- `{}`", f.name);
                if let Some(ref ty) = f.type_annotation {
                    s.push_str(&format!(" as {}", format_type(ty)));
                }
                if f.default_value.is_some() {
                    s.push_str(" *(has default)*");
                }
                if f.is_public {
                    s.push_str(" — public");
                }
                self.push(&s);
                self.push("\n");
            }
            self.push("\n");
        }
    }

    fn gen_actor(&mut self, a: &ActorDecl) {
        let docs = parse_doc_comments(&a.doc_comments);

        let mut header = format!("{}", visibility(a.is_public));
        if a.is_abstract { header.push_str("template "); }
        if a.is_sealed { header.push_str("final "); }
        if a.is_system { header.push_str("system "); }
        header.push_str(&format!("actor {}", a.name));

        if !a.generic_params.is_empty() {
            header.push_str(&format!(" of {}", a.generic_params.join(", ")));
        }

        self.push(&format!("### `{}`\n\n", header));
        self.gen_doc_description(&docs);

        if let Some(ref parent) = a.parent {
            self.push(&format!("**Inherits:** `{}`\n\n", parent));
        }
        if !a.traits.is_empty() {
            let t: Vec<String> = a.traits.iter().map(|t| format!("`{}`", t)).collect();
            self.push(&format!("**Implements:** {}\n\n", t.join(", ")));
        }

        // Categorize members
        let mut fields = Vec::new();
        let mut events = Vec::new();
        let mut methods = Vec::new();
        let mut properties = Vec::new();

        for m in &a.members {
            match m {
                ActorMember::Field(f) => fields.push(f),
                ActorMember::Event(e) => events.push(e),
                ActorMember::Method(f) => methods.push(f),
                ActorMember::Property(p) => properties.push(p),
                ActorMember::Operator(_) | ActorMember::Const(_) => {}
            }
        }

        if !fields.is_empty() {
            self.push("**Fields:**\n\n");
            for f in &fields {
                let mut s = format!("- `{}`", f.name);
                if let Some(ref ty) = f.type_annotation {
                    s.push_str(&format!(" as {}", format_type(ty)));
                }
                if f.is_public { s.push_str(" — public"); }
                self.push(&s);
                self.push("\n");
            }
            self.push("\n");
        }

        if !events.is_empty() {
            self.push("**Events:**\n\n");
            for e in &events {
                let prefix = if e.is_public { "public " } else { "" };
                self.push(&format!("- `{}event {}`\n", prefix, e.name));
            }
            self.push("\n");
        }

        if !properties.is_empty() {
            self.push("**Properties:**\n\n");
            for p in &properties {
                let mut caps = Vec::new();
                if p.getter.is_some() { caps.push("get"); }
                if p.setter.is_some() { caps.push("set"); }
                let prefix = if p.is_public { "public " } else { "" };
                self.push(&format!("- `{}property {}` — {}\n", prefix, p.name, caps.join(", ")));
            }
            self.push("\n");
        }

        if !methods.is_empty() {
            self.push("**Methods:**\n\n");
            for f in &methods {
                let method_docs = parse_doc_comments(&f.doc_comments);
                let params_str: Vec<String> = f.params.iter().map(|p| {
                    let mut s = p.name.clone();
                    if let Some(ref ty) = p.type_annotation {
                        s.push_str(&format!(" as {}", format_type(ty).trim_matches('`')));
                    }
                    s
                }).collect();

                let mut line = format!("- `{}function {}({})`",
                    visibility(f.is_public), f.name, params_str.join(", "));

                if !method_docs.description.is_empty() {
                    let desc: Vec<&String> = method_docs.description.iter()
                        .filter(|s| !s.is_empty())
                        .collect();
                    if !desc.is_empty() {
                        line.push_str(&format!(" — {}", desc[0]));
                    }
                }
                self.push(&line);
                self.push("\n");
            }
            self.push("\n");
        }
    }

    fn gen_choice(&mut self, c: &ChoiceDecl) {
        let docs = parse_doc_comments(&c.doc_comments);
        self.push(&format!("### `{}choice {}`\n\n", visibility(c.is_public), c.name));
        self.gen_doc_description(&docs);

        if !c.variants.is_empty() {
            self.push("**Variants:**\n\n");
            for v in &c.variants {
                if v.fields.is_empty() {
                    self.push(&format!("- `{}`\n", v.name));
                } else {
                    let params: Vec<String> = v.fields.iter().map(|p| {
                        let mut s = p.name.clone();
                        if let Some(ref ty) = p.type_annotation {
                            s.push_str(&format!(" as {}", format_type(ty).trim_matches('`')));
                        }
                        s
                    }).collect();
                    self.push(&format!("- `{}({})`\n", v.name, params.join(", ")));
                }
            }
            self.push("\n");
        }
    }

    fn gen_trait(&mut self, t: &TraitDecl) {
        let docs = parse_doc_comments(&t.doc_comments);
        self.push(&format!("### `{}trait {}`\n\n", visibility(t.is_public), t.name));
        self.gen_doc_description(&docs);

        let mut fields = Vec::new();
        let mut methods = Vec::new();

        for m in &t.members {
            match m {
                TraitMember::Field(f) => fields.push(f),
                TraitMember::Method(f) => methods.push(f),
            }
        }

        if !fields.is_empty() {
            self.push("**Required fields:**\n\n");
            for f in &fields {
                self.push(&format!("- `{}`\n", f.name));
            }
            self.push("\n");
        }

        if !methods.is_empty() {
            self.push("**Required methods:**\n\n");
            for f in &methods {
                let params_str: Vec<String> = f.params.iter().map(|p| p.name.clone()).collect();
                self.push(&format!("- `function {}({})`\n", f.name, params_str.join(", ")));
            }
            self.push("\n");
        }
    }

    fn gen_const(&mut self, c: &ConstDecl) {
        let docs = parse_doc_comments(&c.doc_comments);
        self.push(&format!("### `{}const {}`\n\n", visibility(c.is_public), c.name));
        self.gen_doc_description(&docs);
    }
}
