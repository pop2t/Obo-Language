//! Minimal LSP server for OBO — zero external dependencies.
//!
//! Speaks JSON-RPC 2.0 over stdin/stdout using the LSP base protocol
//! (Content-Length headers).  Supports:
//!   - textDocument/didOpen, didChange, didClose  (document sync)
//!   - textDocument/publishDiagnostics             (lex + parse + check errors)
//!   - textDocument/hover                           (type info on identifiers)
//!   - textDocument/definition                      (go-to-definition)
//!   - textDocument/completion                      (keyword + symbol completion)

use std::collections::HashMap;
use std::io::{self, BufRead, Write};

use crate::lexer::scanner::Scanner;
use crate::lexer::token::Span;
use crate::parser::parser::Parser;
use crate::parser::ast::Program;
use crate::analyzer::checker::Checker;
use crate::analyzer::symbols::{SymbolTable, TypeInfoKind};
use crate::error::{OboError, Severity};

// ── Tiny JSON helpers (no serde) ────────────────────────────────────────

/// A minimal JSON value type — just enough for LSP messages.
#[derive(Debug, Clone)]
enum Json {
    Null,
    Bool(bool),
    Num(f64),
    Str(String),
    Arr(Vec<Json>),
    Obj(Vec<(String, Json)>),
}

impl Json {
    fn as_str(&self) -> Option<&str> {
        if let Json::Str(s) = self { Some(s) } else { None }
    }
    fn as_i64(&self) -> Option<i64> {
        if let Json::Num(n) = self { Some(*n as i64) } else { None }
    }
    fn get(&self, key: &str) -> Option<&Json> {
        if let Json::Obj(pairs) = self {
            pairs.iter().find(|(k, _)| k == key).map(|(_, v)| v)
        } else {
            None
        }
    }
    fn get_path(&self, keys: &[&str]) -> Option<&Json> {
        let mut cur = self;
        for k in keys {
            cur = cur.get(k)?;
        }
        Some(cur)
    }
    fn to_string_json(&self) -> String {
        match self {
            Json::Null => "null".into(),
            Json::Bool(b) => if *b { "true".into() } else { "false".into() },
            Json::Num(n) => {
                if *n == (*n as i64) as f64 {
                    format!("{}", *n as i64)
                } else {
                    format!("{}", n)
                }
            }
            Json::Str(s) => format!("\"{}\"", escape_json(s)),
            Json::Arr(items) => {
                let inner: Vec<String> = items.iter().map(|v| v.to_string_json()).collect();
                format!("[{}]", inner.join(","))
            }
            Json::Obj(pairs) => {
                let inner: Vec<String> = pairs
                    .iter()
                    .map(|(k, v)| format!("\"{}\":{}", escape_json(k), v.to_string_json()))
                    .collect();
                format!("{{{}}}", inner.join(","))
            }
        }
    }
}

fn escape_json(s: &str) -> String {
    let mut out = String::with_capacity(s.len());
    for ch in s.chars() {
        match ch {
            '"' => out.push_str("\\\""),
            '\\' => out.push_str("\\\\"),
            '\n' => out.push_str("\\n"),
            '\r' => out.push_str("\\r"),
            '\t' => out.push_str("\\t"),
            c if (c as u32) < 0x20 => {
                out.push_str(&format!("\\u{:04x}", c as u32));
            }
            c => out.push(c),
        }
    }
    out
}

/// Minimal JSON parser — handles the subset LSP clients send.
fn parse_json(input: &str) -> Option<Json> {
    let chars: Vec<char> = input.chars().collect();
    let (val, _) = parse_json_value(&chars, 0)?;
    Some(val)
}

fn skip_ws(chars: &[char], mut i: usize) -> usize {
    while i < chars.len() && chars[i].is_ascii_whitespace() {
        i += 1;
    }
    i
}

fn parse_json_value(chars: &[char], pos: usize) -> Option<(Json, usize)> {
    let i = skip_ws(chars, pos);
    if i >= chars.len() {
        return None;
    }
    match chars[i] {
        '"' => parse_json_string(chars, i),
        '{' => parse_json_object(chars, i),
        '[' => parse_json_array(chars, i),
        't' => {
            if chars[i..].starts_with(&['t', 'r', 'u', 'e']) {
                Some((Json::Bool(true), i + 4))
            } else {
                None
            }
        }
        'f' => {
            if chars[i..].starts_with(&['f', 'a', 'l', 's', 'e']) {
                Some((Json::Bool(false), i + 5))
            } else {
                None
            }
        }
        'n' => {
            if chars[i..].starts_with(&['n', 'u', 'l', 'l']) {
                Some((Json::Null, i + 4))
            } else {
                None
            }
        }
        c if c == '-' || c.is_ascii_digit() => parse_json_number(chars, i),
        _ => None,
    }
}

fn parse_json_string(chars: &[char], pos: usize) -> Option<(Json, usize)> {
    if chars[pos] != '"' {
        return None;
    }
    let mut i = pos + 1;
    let mut s = String::new();
    while i < chars.len() && chars[i] != '"' {
        if chars[i] == '\\' && i + 1 < chars.len() {
            i += 1;
            match chars[i] {
                '"' => s.push('"'),
                '\\' => s.push('\\'),
                '/' => s.push('/'),
                'n' => s.push('\n'),
                'r' => s.push('\r'),
                't' => s.push('\t'),
                'u' => {
                    if i + 4 < chars.len() {
                        let hex: String = chars[i + 1..i + 5].iter().collect();
                        if let Ok(cp) = u32::from_str_radix(&hex, 16) {
                            if let Some(c) = char::from_u32(cp) {
                                s.push(c);
                            }
                        }
                        i += 4;
                    }
                }
                _ => {
                    s.push('\\');
                    s.push(chars[i]);
                }
            }
        } else {
            s.push(chars[i]);
        }
        i += 1;
    }
    if i < chars.len() {
        Some((Json::Str(s), i + 1)) // skip closing "
    } else {
        None
    }
}

fn parse_json_number(chars: &[char], pos: usize) -> Option<(Json, usize)> {
    let mut i = pos;
    if i < chars.len() && chars[i] == '-' {
        i += 1;
    }
    while i < chars.len() && chars[i].is_ascii_digit() {
        i += 1;
    }
    if i < chars.len() && chars[i] == '.' {
        i += 1;
        while i < chars.len() && chars[i].is_ascii_digit() {
            i += 1;
        }
    }
    // exponent
    if i < chars.len() && (chars[i] == 'e' || chars[i] == 'E') {
        i += 1;
        if i < chars.len() && (chars[i] == '+' || chars[i] == '-') {
            i += 1;
        }
        while i < chars.len() && chars[i].is_ascii_digit() {
            i += 1;
        }
    }
    let s: String = chars[pos..i].iter().collect();
    let n: f64 = s.parse().ok()?;
    Some((Json::Num(n), i))
}

fn parse_json_object(chars: &[char], pos: usize) -> Option<(Json, usize)> {
    let mut i = pos + 1; // skip {
    let mut pairs = Vec::new();
    i = skip_ws(chars, i);
    if i < chars.len() && chars[i] == '}' {
        return Some((Json::Obj(pairs), i + 1));
    }
    loop {
        i = skip_ws(chars, i);
        let (key, next) = parse_json_string(chars, i)?;
        let key_str = if let Json::Str(s) = key { s } else { return None; };
        i = skip_ws(chars, next);
        if i >= chars.len() || chars[i] != ':' {
            return None;
        }
        i += 1;
        let (val, next) = parse_json_value(chars, i)?;
        pairs.push((key_str, val));
        i = skip_ws(chars, next);
        if i >= chars.len() {
            return None;
        }
        if chars[i] == '}' {
            return Some((Json::Obj(pairs), i + 1));
        }
        if chars[i] == ',' {
            i += 1;
        }
    }
}

fn parse_json_array(chars: &[char], pos: usize) -> Option<(Json, usize)> {
    let mut i = pos + 1; // skip [
    let mut items = Vec::new();
    i = skip_ws(chars, i);
    if i < chars.len() && chars[i] == ']' {
        return Some((Json::Arr(items), i + 1));
    }
    loop {
        let (val, next) = parse_json_value(chars, i)?;
        items.push(val);
        i = skip_ws(chars, next);
        if i >= chars.len() {
            return None;
        }
        if chars[i] == ']' {
            return Some((Json::Arr(items), i + 1));
        }
        if chars[i] == ',' {
            i += 1;
            i = skip_ws(chars, i);
        }
    }
}

// ── LSP transport ────────────────────────────────────────────────────────

fn read_message(stdin: &mut impl BufRead) -> io::Result<Option<String>> {
    let mut content_length: Option<usize> = None;
    loop {
        let mut header = String::new();
        let n = stdin.read_line(&mut header)?;
        if n == 0 {
            return Ok(None); // EOF
        }
        let trimmed = header.trim();
        if trimmed.is_empty() {
            break; // end of headers
        }
        if let Some(val) = trimmed.strip_prefix("Content-Length:") {
            content_length = val.trim().parse().ok();
        }
        // ignore other headers (Content-Type, etc.)
    }
    let len = match content_length {
        Some(l) => l,
        None => return Ok(None),
    };
    let mut body = vec![0u8; len];
    stdin.read_exact(&mut body)?;
    Ok(Some(String::from_utf8_lossy(&body).into_owned()))
}

fn send_message(stdout: &mut impl Write, json: &str) -> io::Result<()> {
    let msg = format!("Content-Length: {}\r\n\r\n{}", json.len(), json);
    stdout.write_all(msg.as_bytes())?;
    stdout.flush()
}

fn make_response(id: &Json, result: Json) -> String {
    Json::Obj(vec![
        ("jsonrpc".into(), Json::Str("2.0".into())),
        ("id".into(), id.clone()),
        ("result".into(), result),
    ])
    .to_string_json()
}

fn make_notification(method: &str, params: Json) -> String {
    Json::Obj(vec![
        ("jsonrpc".into(), Json::Str("2.0".into())),
        ("method".into(), Json::Str(method.into())),
        ("params".into(), params),
    ])
    .to_string_json()
}

// ── LSP server state ─────────────────────────────────────────────────────

struct LspState {
    /// uri → source text
    documents: HashMap<String, String>,
    /// uri → last analysis results
    analyses: HashMap<String, AnalysisResult>,
}

#[allow(dead_code)]
struct AnalysisResult {
    program: Program,
    symbols: SymbolTable,
    all_errors: Vec<OboError>,
}

impl LspState {
    fn new() -> Self {
        Self {
            documents: HashMap::new(),
            analyses: HashMap::new(),
        }
    }

    fn analyse(&mut self, uri: &str) {
        let source = match self.documents.get(uri) {
            Some(s) => s.clone(),
            None => return,
        };

        let scanner = Scanner::new(&source);
        let (tokens, lex_errors) = scanner.scan_tokens();

        let parser = Parser::new(tokens);
        let (program, parse_errors) = parser.parse();

        let checker = Checker::new();
        let (symbols, check_errors) = checker.check(&program);

        let mut all_errors = Vec::new();
        all_errors.extend(lex_errors);
        all_errors.extend(parse_errors);
        all_errors.extend(check_errors);

        self.analyses.insert(
            uri.to_string(),
            AnalysisResult {
                program,
                symbols,
                all_errors,
            },
        );
    }

    fn diagnostics_json(&self, uri: &str) -> Json {
        let diags = match self.analyses.get(uri) {
            Some(a) => &a.all_errors,
            None => return Json::Arr(vec![]),
        };

        let items: Vec<Json> = diags
            .iter()
            .map(|e| {
                let severity = match e.kind.severity() {
                    Severity::Error => 1,
                    Severity::Warning => 2,
                    Severity::Info => 3,
                };
                let line = if e.span.line > 0 { e.span.line - 1 } else { 0 };
                let col = if e.span.column > 0 { e.span.column - 1 } else { 0 };
                let end_col = col + e.span.length.max(1);

                let mut msg = e.message.clone();
                if let Some(ref hint) = e.hint {
                    msg.push_str(&format!("\nhint: {}", hint));
                }

                Json::Obj(vec![
                    (
                        "range".into(),
                        Json::Obj(vec![
                            (
                                "start".into(),
                                Json::Obj(vec![
                                    ("line".into(), Json::Num(line as f64)),
                                    ("character".into(), Json::Num(col as f64)),
                                ]),
                            ),
                            (
                                "end".into(),
                                Json::Obj(vec![
                                    ("line".into(), Json::Num(line as f64)),
                                    ("character".into(), Json::Num(end_col as f64)),
                                ]),
                            ),
                        ]),
                    ),
                    ("severity".into(), Json::Num(severity as f64)),
                    ("source".into(), Json::Str("obo".into())),
                    ("message".into(), Json::Str(msg)),
                ])
            })
            .collect();

        Json::Arr(items)
    }

    /// Find the word at (0-based line, 0-based col) in the given document.
    fn word_at(&self, uri: &str, line: usize, col: usize) -> Option<String> {
        let src = self.documents.get(uri)?;
        let target_line = src.lines().nth(line)?;
        let chars: Vec<char> = target_line.chars().collect();
        if col >= chars.len() {
            return None;
        }
        if !chars[col].is_alphanumeric() && chars[col] != '_' {
            return None;
        }
        let mut start = col;
        while start > 0 && (chars[start - 1].is_alphanumeric() || chars[start - 1] == '_') {
            start -= 1;
        }
        let mut end = col;
        while end < chars.len() && (chars[end].is_alphanumeric() || chars[end] == '_') {
            end += 1;
        }
        Some(chars[start..end].iter().collect())
    }

    fn handle_hover(&self, uri: &str, line: usize, col: usize) -> Option<String> {
        let word = self.word_at(uri, line, col)?;
        let analysis = self.analyses.get(uri)?;

        // Check types first (entities, actors, choices, traits)
        if let Some(info) = analysis.symbols.lookup_type(&word) {
            let kind = match &info.kind {
                TypeInfoKind::Entity { fields, .. } => {
                    let f: Vec<String> = fields
                        .keys()
                        .map(|k| k.clone())
                        .collect();
                    format!(
                        "**entity** `{}`\n\nFields: {}",
                        word,
                        if f.is_empty() {
                            "(none)".into()
                        } else {
                            f.join(", ")
                        }
                    )
                }
                TypeInfoKind::Actor {
                    parent,
                    traits,
                    fields,
                    methods,
                } => {
                    let mut parts = vec![format!("**actor** `{}`", word)];
                    if let Some(p) = parent {
                        parts.push(format!("Inherits: `{}`", p));
                    }
                    if !traits.is_empty() {
                        parts.push(format!(
                            "Traits: {}",
                            traits.iter().map(|t| format!("`{}`", t)).collect::<Vec<_>>().join(", ")
                        ));
                    }
                    if !fields.is_empty() {
                        parts.push(format!(
                            "Fields: {}",
                            fields.keys().cloned().collect::<Vec<_>>().join(", ")
                        ));
                    }
                    if !methods.is_empty() {
                        parts.push(format!(
                            "Methods: {}",
                            methods.keys().cloned().collect::<Vec<_>>().join(", ")
                        ));
                    }
                    parts.join("\n\n")
                }
                TypeInfoKind::Choice { variants } => {
                    let v: Vec<String> = variants.iter().map(|v| v.name.clone()).collect();
                    format!("**choice** `{}`\n\nVariants: {}", word, v.join(", "))
                }
                TypeInfoKind::Trait { methods, fields } => {
                    let mut parts = vec![format!("**trait** `{}`", word)];
                    if !methods.is_empty() {
                        parts.push(format!(
                            "Methods: {}",
                            methods.keys().cloned().collect::<Vec<_>>().join(", ")
                        ));
                    }
                    if !fields.is_empty() {
                        parts.push(format!("Fields: {}", fields.join(", ")));
                    }
                    parts.join("\n\n")
                }
            };
            return Some(kind);
        }

        // Check functions
        if let Some(sig) = analysis.symbols.lookup_function(&word) {
            let params: Vec<String> = sig
                .params
                .iter()
                .map(|p| {
                    if p.has_default {
                        format!("{}?", p.name)
                    } else {
                        p.name.clone()
                    }
                })
                .collect();
            return Some(format!(
                "**function** `{}({})`\n\nReturns: `{:?}`",
                word,
                params.join(", "),
                sig.return_type
            ));
        }

        // Check if it's a keyword
        if is_obo_keyword(&word) {
            return Some(format!("**keyword** `{}`", word));
        }

        None
    }

    fn handle_definition(&self, uri: &str, line: usize, col: usize) -> Option<(String, Span)> {
        let word = self.word_at(uri, line, col)?;
        let analysis = self.analyses.get(uri)?;

        // Type definitions
        if let Some(info) = analysis.symbols.lookup_type(&word) {
            return Some((uri.to_string(), info.defined_at));
        }

        // Function definitions
        if let Some(sig) = analysis.symbols.lookup_function(&word) {
            return Some((uri.to_string(), sig.defined_at));
        }

        None
    }

    fn handle_completion(&self, uri: &str, _line: usize, _col: usize) -> Vec<Json> {
        let mut items: Vec<Json> = Vec::new();

        // Add keywords
        for kw in OBO_KEYWORDS {
            items.push(Json::Obj(vec![
                ("label".into(), Json::Str(kw.to_string())),
                ("kind".into(), Json::Num(14.0)), // Keyword
            ]));
        }

        // Add symbols from analysis
        if let Some(analysis) = self.analyses.get(uri) {
            // Add functions
            for (name, _sig) in analysis.symbols.all_functions() {
                items.push(Json::Obj(vec![
                    ("label".into(), Json::Str(name.clone())),
                    ("kind".into(), Json::Num(3.0)), // Function
                ]));
            }
            // Add types
            for (name, info) in analysis.symbols.all_types() {
                let kind = match &info.kind {
                    TypeInfoKind::Entity { .. } => 22.0, // Struct
                    TypeInfoKind::Actor { .. } => 7.0,   // Class
                    TypeInfoKind::Choice { .. } => 13.0,  // Enum
                    TypeInfoKind::Trait { .. } => 8.0,    // Interface
                };
                items.push(Json::Obj(vec![
                    ("label".into(), Json::Str(name.clone())),
                    ("kind".into(), Json::Num(kind)),
                ]));
            }
        }

        items
    }
}

// ── OBO keywords for completion ──────────────────────────────────────────

const OBO_KEYWORDS: &[&str] = &[
    "function", "entity", "actor", "choice", "trait", "system",
    "template", "final", "shared", "public", "property", "extend",
    "type", "const", "event", "operator",
    "if", "else", "while", "forever", "count", "for", "in",
    "check", "is", "stop", "restart", "out", "wait",
    "and", "or", "not",
    "of", "as", "to", "step",
    "list", "map", "set", "bag", "queue", "stack",
    "grid2d", "grid3d", "pair", "slice", "buffer",
    "action", "emit", "listen", "override",
    "use", "from",
    "safe", "metal", "bridge", "gc",
    "run", "channel",
    "possible",
    "show", "prompt", "into",
    "then", "has",
    "assert", "inspect",
    "number", "decimal", "text", "flag", "nothing", "any",
    "null", "true", "false",
];

fn is_obo_keyword(word: &str) -> bool {
    OBO_KEYWORDS.contains(&word)
}

// ── Main event loop ──────────────────────────────────────────────────────

pub fn run_lsp() {
    let stdin = io::stdin();
    let stdout = io::stdout();
    let mut reader = stdin.lock();
    let mut writer = stdout.lock();

    let mut state = LspState::new();

    // Read stderr for log lines
    eprintln!("Obo LSP: starting...");

    loop {
        let body = match read_message(&mut reader) {
            Ok(Some(b)) => b,
            Ok(None) => break, // EOF
            Err(e) => {
                eprintln!("Obo LSP: read error: {}", e);
                break;
            }
        };

        let msg = match parse_json(&body) {
            Some(m) => m,
            None => {
                eprintln!("Obo LSP: bad JSON");
                continue;
            }
        };

        let method = msg.get("method").and_then(|m| m.as_str()).unwrap_or("");
        let id = msg.get("id");
        let params = msg.get("params");

        match method {
            "initialize" => {
                let caps = Json::Obj(vec![
                    (
                        "capabilities".into(),
                        Json::Obj(vec![
                            (
                                "textDocumentSync".into(),
                                Json::Obj(vec![
                                    ("openClose".into(), Json::Bool(true)),
                                    ("change".into(), Json::Num(1.0)), // Full sync
                                ]),
                            ),
                            ("hoverProvider".into(), Json::Bool(true)),
                            ("definitionProvider".into(), Json::Bool(true)),
                            (
                                "completionProvider".into(),
                                Json::Obj(vec![
                                    (
                                        "triggerCharacters".into(),
                                        Json::Arr(vec![Json::Str(".".into())]),
                                    ),
                                ]),
                            ),
                        ]),
                    ),
                    (
                        "serverInfo".into(),
                        Json::Obj(vec![
                            ("name".into(), Json::Str("obo-lsp".into())),
                            ("version".into(), Json::Str("0.5.0".into())),
                        ]),
                    ),
                ]);
                if let Some(id) = id {
                    let resp = make_response(id, caps);
                    let _ = send_message(&mut writer, &resp);
                }
                eprintln!("Obo LSP: initialized ✅");
            }

            "initialized" => {
                // Client acknowledges — nothing to do
            }

            "shutdown" => {
                if let Some(id) = id {
                    let resp = make_response(id, Json::Null);
                    let _ = send_message(&mut writer, &resp);
                }
                eprintln!("Obo LSP: shutdown");
            }

            "exit" => {
                break;
            }

            "textDocument/didOpen" => {
                if let Some(params) = params {
                    if let (Some(uri), Some(text)) = (
                        params.get_path(&["textDocument", "uri"]).and_then(|v| v.as_str()),
                        params
                            .get_path(&["textDocument", "text"])
                            .and_then(|v| v.as_str()),
                    ) {
                        state.documents.insert(uri.to_string(), text.to_string());
                        state.analyse(uri);
                        let diags = state.diagnostics_json(uri);
                        let note = make_notification(
                            "textDocument/publishDiagnostics",
                            Json::Obj(vec![
                                ("uri".into(), Json::Str(uri.to_string())),
                                ("diagnostics".into(), diags),
                            ]),
                        );
                        let _ = send_message(&mut writer, &note);
                    }
                }
            }

            "textDocument/didChange" => {
                if let Some(params) = params {
                    if let Some(uri) = params
                        .get_path(&["textDocument", "uri"])
                        .and_then(|v| v.as_str())
                    {
                        // Full sync: take the last content change
                        if let Some(Json::Arr(changes)) = params.get("contentChanges") {
                            if let Some(last) = changes.last() {
                                if let Some(text) = last.get("text").and_then(|v| v.as_str()) {
                                    state
                                        .documents
                                        .insert(uri.to_string(), text.to_string());
                                    state.analyse(uri);
                                    let diags = state.diagnostics_json(uri);
                                    let note = make_notification(
                                        "textDocument/publishDiagnostics",
                                        Json::Obj(vec![
                                            ("uri".into(), Json::Str(uri.to_string())),
                                            ("diagnostics".into(), diags),
                                        ]),
                                    );
                                    let _ = send_message(&mut writer, &note);
                                }
                            }
                        }
                    }
                }
            }

            "textDocument/didClose" => {
                if let Some(params) = params {
                    if let Some(uri) = params
                        .get_path(&["textDocument", "uri"])
                        .and_then(|v| v.as_str())
                    {
                        state.documents.remove(uri);
                        state.analyses.remove(uri);
                        // Clear diagnostics
                        let note = make_notification(
                            "textDocument/publishDiagnostics",
                            Json::Obj(vec![
                                ("uri".into(), Json::Str(uri.to_string())),
                                ("diagnostics".into(), Json::Arr(vec![])),
                            ]),
                        );
                        let _ = send_message(&mut writer, &note);
                    }
                }
            }

            "textDocument/hover" => {
                if let Some(id) = id {
                    let result = params
                        .and_then(|p| {
                            let uri = p
                                .get_path(&["textDocument", "uri"])
                                .and_then(|v| v.as_str())?;
                            let line = p
                                .get_path(&["position", "line"])
                                .and_then(|v| v.as_i64())? as usize;
                            let col = p
                                .get_path(&["position", "character"])
                                .and_then(|v| v.as_i64())? as usize;
                            let text = state.handle_hover(uri, line, col)?;
                            Some(Json::Obj(vec![(
                                "contents".into(),
                                Json::Obj(vec![
                                    ("kind".into(), Json::Str("markdown".into())),
                                    ("value".into(), Json::Str(text)),
                                ]),
                            )]))
                        })
                        .unwrap_or(Json::Null);
                    let resp = make_response(id, result);
                    let _ = send_message(&mut writer, &resp);
                }
            }

            "textDocument/definition" => {
                if let Some(id) = id {
                    let result = params
                        .and_then(|p| {
                            let uri = p
                                .get_path(&["textDocument", "uri"])
                                .and_then(|v| v.as_str())?;
                            let line = p
                                .get_path(&["position", "line"])
                                .and_then(|v| v.as_i64())? as usize;
                            let col = p
                                .get_path(&["position", "character"])
                                .and_then(|v| v.as_i64())? as usize;
                            let (def_uri, span) = state.handle_definition(uri, line, col)?;
                            let def_line = if span.line > 0 { span.line - 1 } else { 0 };
                            let def_col = if span.column > 0 { span.column - 1 } else { 0 };
                            Some(Json::Obj(vec![
                                ("uri".into(), Json::Str(def_uri)),
                                (
                                    "range".into(),
                                    Json::Obj(vec![
                                        (
                                            "start".into(),
                                            Json::Obj(vec![
                                                ("line".into(), Json::Num(def_line as f64)),
                                                ("character".into(), Json::Num(def_col as f64)),
                                            ]),
                                        ),
                                        (
                                            "end".into(),
                                            Json::Obj(vec![
                                                ("line".into(), Json::Num(def_line as f64)),
                                                ("character".into(), Json::Num(def_col as f64)),
                                            ]),
                                        ),
                                    ]),
                                ),
                            ]))
                        })
                        .unwrap_or(Json::Null);
                    let resp = make_response(id, result);
                    let _ = send_message(&mut writer, &resp);
                }
            }

            "textDocument/completion" => {
                if let Some(id) = id {
                    let items = params
                        .and_then(|p| {
                            let uri = p
                                .get_path(&["textDocument", "uri"])
                                .and_then(|v| v.as_str())?;
                            let line = p
                                .get_path(&["position", "line"])
                                .and_then(|v| v.as_i64())? as usize;
                            let col = p
                                .get_path(&["position", "character"])
                                .and_then(|v| v.as_i64())? as usize;
                            Some(state.handle_completion(uri, line, col))
                        })
                        .unwrap_or_default();
                    let result = Json::Arr(items);
                    let resp = make_response(id, result);
                    let _ = send_message(&mut writer, &resp);
                }
            }

            _ => {
                // Unknown method — if it has an id, reply with method-not-found
                if let Some(id) = id {
                    let err = Json::Obj(vec![
                        ("jsonrpc".into(), Json::Str("2.0".into())),
                        ("id".into(), id.clone()),
                        (
                            "error".into(),
                            Json::Obj(vec![
                                ("code".into(), Json::Num(-32601.0)),
                                ("message".into(), Json::Str(format!("Method not found: {}", method))),
                            ]),
                        ),
                    ]);
                    let _ = send_message(&mut writer, &err.to_string_json());
                }
            }
        }
    }

    eprintln!("Obo LSP: exiting.");
}
