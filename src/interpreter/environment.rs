use std::collections::HashMap;

use crate::interpreter::value::Value;

#[derive(Debug)]
pub struct Environment {
    scopes: Vec<HashMap<String, Value>>,
}

impl Environment {
    pub fn new() -> Self {
        Self {
            scopes: vec![HashMap::new()],
        }
    }

    pub fn from_snapshot(snapshot: HashMap<String, Value>) -> Self {
        Self {
            scopes: vec![snapshot],
        }
    }

    pub fn push_scope(&mut self) {
        self.scopes.push(HashMap::new());
    }

    pub fn pop_scope(&mut self) {
        if self.scopes.len() > 1 {
            self.scopes.pop();
        }
    }

    pub fn define(&mut self, name: &str, value: Value) {
        if let Some(scope) = self.scopes.last_mut() {
            scope.insert(name.to_string(), value);
        }
    }

    pub fn get(&self, name: &str) -> Option<&Value> {
        for scope in self.scopes.iter().rev() {
            if let Some(value) = scope.get(name) {
                return Some(value);
            }
        }
        None
    }

    pub fn set(&mut self, name: &str, value: Value) -> bool {
        for scope in self.scopes.iter_mut().rev() {
            if scope.contains_key(name) {
                scope.insert(name.to_string(), value);
                return true;
            }
        }
        false
    }

    pub fn define_or_set(&mut self, name: &str, value: Value) {
        if !self.set(name, value.clone()) {
            self.define(name, value);
        }
    }

    /// Snapshot all visible bindings (inner scopes shadow outer).
    pub fn snapshot_all(&self) -> HashMap<String, Value> {
        let mut snapshot = HashMap::new();
        for scope in &self.scopes {
            for (k, v) in scope {
                snapshot.insert(k.clone(), v.clone());
            }
        }
        snapshot
    }
}
