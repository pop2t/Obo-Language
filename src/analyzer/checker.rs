mod declarations;
mod diagnostics;
mod expressions;
mod registration;
mod statements;

use crate::error::OboError;
use crate::parser::ast::Program;

use super::symbols::SymbolTable;

pub struct Checker {
    pub symbols: SymbolTable,
    pub errors: Vec<OboError>,
    current_function: Option<String>,
    in_loop: bool,
    in_metal: bool,
    /// Number of extra arguments injected by a surrounding pipe operator.
    pipe_extra_args: usize,
}

impl Checker {
    pub fn new() -> Self {
        Self {
            symbols: SymbolTable::new(),
            errors: Vec::new(),
            current_function: None,
            in_loop: false,
            in_metal: false,
            pipe_extra_args: 0,
        }
    }

    pub fn check(mut self, program: &Program) -> (SymbolTable, Vec<OboError>) {
        for decl in program {
            self.register_declaration(decl);
        }

        for decl in program {
            self.check_declaration(decl);
        }

        (self.symbols, self.errors)
    }
}