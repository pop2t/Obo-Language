#![allow(dead_code)]

use std::collections::HashMap;
use crate::lexer::token::Span;
use super::types::OboType;

#[derive(Debug, Clone)]
pub struct Symbol {
    pub name: String,
    pub ty: OboType,
    pub kind: SymbolKind,
    pub is_public: bool,
    pub is_const: bool,
    pub defined_at: Span,
    pub used: bool,
}

#[derive(Debug, Clone, PartialEq)]
pub enum SymbolKind {
    Variable,
    Constant,
    Parameter,
    Function,
    Entity,
    Actor,
    Choice,
    Trait,
    LoopVar,
}

#[derive(Debug, Clone)]
pub struct FunctionSig {
    pub name: String,
    pub params: Vec<ParamSig>,
    pub return_type: OboType,
    pub is_static: bool,
    pub is_abstract: bool,
    pub is_public: bool,
    pub is_deprecated: bool,
    pub is_test: bool,
    pub defined_at: Span,
}

#[derive(Debug, Clone)]
pub struct ParamSig {
    pub name: String,
    pub ty: OboType,
    pub has_default: bool,
}

#[derive(Debug, Clone)]
pub struct TypeInfo {
    pub name: String,
    pub kind: TypeInfoKind,
    pub is_public: bool,
    pub is_abstract: bool,
    pub is_sealed: bool,
    pub is_deprecated: bool,
    pub is_reflectable: bool,
    pub is_serializable: bool,
    pub is_packed: bool,
    pub is_value: bool,
    pub defined_at: Span,
}

#[derive(Debug, Clone)]
pub enum TypeInfoKind {
    Entity {
        fields: HashMap<String, FieldInfo>,
    },
    Actor {
        parent: Option<String>,
        traits: Vec<String>,
        fields: HashMap<String, FieldInfo>,
        methods: HashMap<String, FunctionSig>,
    },
    Choice {
        variants: Vec<VariantInfo>,
    },
    Trait {
        methods: HashMap<String, FunctionSig>,
        fields: Vec<String>,
    },
}

#[derive(Debug, Clone)]
pub struct FieldInfo {
    pub name: String,
    pub ty: OboType,
    pub is_public: bool,
    pub has_default: bool,
    pub defined_at: Span,
}

#[derive(Debug, Clone)]
pub struct VariantInfo {
    pub name: String,
    pub fields: Vec<ParamSig>,
    pub defined_at: Span,
}

#[derive(Debug)]
struct Scope {
    variables: HashMap<String, Symbol>,
}

#[derive(Debug)]
pub struct SymbolTable {
    scopes: Vec<Scope>,
    pub functions: HashMap<String, FunctionSig>,
    pub types: HashMap<String, TypeInfo>,
    pub constants: HashMap<String, Symbol>,
}

impl SymbolTable {
    pub fn new() -> Self {
        Self {
            scopes: vec![Scope {
                variables: HashMap::new(),
            }],
            functions: HashMap::new(),
            types: HashMap::new(),
            constants: HashMap::new(),
        }
    }

    pub fn push_scope(&mut self) {
        self.scopes.push(Scope {
            variables: HashMap::new(),
        });
    }

    pub fn pop_scope(&mut self) -> Vec<Symbol> {
        if self.scopes.len() > 1 {
            let scope = self.scopes.pop().unwrap();
            scope.variables.into_values().collect()
        } else {
            Vec::new()
        }
    }

    pub fn define_variable(&mut self, name: &str, ty: OboType, kind: SymbolKind, is_public: bool, span: Span) -> Option<Symbol> {
        let existing = self.lookup_current_scope(name).cloned();
        let symbol = Symbol {
            name: name.to_string(),
            ty,
            kind,
            is_public,
            is_const: false,
            defined_at: span,
            used: false,
        };
        if let Some(scope) = self.scopes.last_mut() {
            scope.variables.insert(name.to_string(), symbol);
        }
        existing
    }

    pub fn define_constant(&mut self, name: &str, ty: OboType, span: Span) -> Option<Symbol> {
        let existing = self.lookup_current_scope(name).cloned();
        let symbol = Symbol {
            name: name.to_string(),
            ty: ty.clone(),
            kind: SymbolKind::Constant,
            is_public: false,
            is_const: true,
            defined_at: span,
            used: false,
        };
        self.constants.insert(name.to_string(), symbol.clone());
        if let Some(scope) = self.scopes.last_mut() {
            scope.variables.insert(name.to_string(), symbol);
        }
        existing
    }

    pub fn lookup(&self, name: &str) -> Option<&Symbol> {
        for scope in self.scopes.iter().rev() {
            if let Some(sym) = scope.variables.get(name) {
                return Some(sym);
            }
        }
        self.constants.get(name)
    }

    pub fn lookup_mut(&mut self, name: &str) -> Option<&mut Symbol> {
        for scope in self.scopes.iter_mut().rev() {
            if let Some(sym) = scope.variables.get_mut(name) {
                return Some(sym);
            }
        }
        self.constants.get_mut(name)
    }

    pub fn lookup_current_scope(&self, name: &str) -> Option<&Symbol> {
        self.scopes.last()?.variables.get(name)
    }

    pub fn mark_used(&mut self, name: &str) {
        if let Some(sym) = self.lookup_mut(name) {
            sym.used = true;
        }
    }

    pub fn define_function(&mut self, sig: FunctionSig) -> Option<FunctionSig> {
        let existing = self.functions.get(&sig.name).cloned();
        self.functions.insert(sig.name.clone(), sig);
        existing
    }

    pub fn lookup_function(&self, name: &str) -> Option<&FunctionSig> {
        self.functions.get(name)
    }

    pub fn define_type(&mut self, info: TypeInfo) -> Option<TypeInfo> {
        let existing = self.types.get(&info.name).cloned();
        self.types.insert(info.name.clone(), info);
        existing
    }

    pub fn lookup_type(&self, name: &str) -> Option<&TypeInfo> {
        self.types.get(name)
    }

    pub fn scope_depth(&self) -> usize {
        self.scopes.len()
    }

    pub fn scopes_count(&self) -> usize {
        self.scopes.len()
    }

    pub fn scope_var_names(&self, idx: usize) -> Option<Vec<String>> {
        self.scopes.get(idx).map(|s| s.variables.keys().cloned().collect())
    }

    pub fn function_names(&self) -> Vec<String> {
        self.functions.keys().cloned().collect()
    }

    pub fn type_names(&self) -> Vec<String> {
        self.types.keys().cloned().collect()
    }

    pub fn all_functions(&self) -> impl Iterator<Item = (&String, &FunctionSig)> {
        self.functions.iter()
    }

    pub fn all_types(&self) -> impl Iterator<Item = (&String, &TypeInfo)> {
        self.types.iter()
    }
}
