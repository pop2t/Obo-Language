use crate::error::{ErrorKind, OboError};
use crate::lexer::token::Span;

use super::Checker;

impl Checker {
    pub(super) fn suggest_similar_name(&self, name: &str) -> String {
        let mut best: Option<(&str, usize)> = None;

        for scope_idx in (0..self.symbols.scopes_count()).rev() {
            if let Some(vars) = self.symbols.scope_var_names(scope_idx) {
                for known in vars {
                    let dist = levenshtein(name, &known);
                    if dist <= 2 && (best.is_none() || dist < best.unwrap().1) {
                        best = Some((Box::leak(known.into_boxed_str()), dist));
                    }
                }
            }
        }

        for known in self.symbols.function_names() {
            let dist = levenshtein(name, &known);
            if dist <= 2 && (best.is_none() || dist < best.unwrap().1) {
                best = Some((Box::leak(known.into_boxed_str()), dist));
            }
        }

        for known in self.symbols.type_names() {
            let dist = levenshtein(name, &known);
            if dist <= 2 && (best.is_none() || dist < best.unwrap().1) {
                best = Some((Box::leak(known.into_boxed_str()), dist));
            }
        }

        if let Some((suggestion, _)) = best {
            format!("Did you mean '{}' ?", suggestion).replace("' ?", "'?")
        } else {
            "Check the spelling or make sure it's defined above this line".to_string()
        }
    }

    pub(super) fn error_duplicate_type(&mut self, name: &str, span: Span, prev_span: Span) {
        self.errors.push(
            OboError::new(
                ErrorKind::DuplicateDeclaration,
                format!("'{}' is already defined — pick a different name!", name),
                span,
            )
            .with_secondary(prev_span, "first defined here".to_string()),
        );
    }
}

fn levenshtein(a: &str, b: &str) -> usize {
    let a: Vec<char> = a.chars().collect();
    let b: Vec<char> = b.chars().collect();
    let m = a.len();
    let n = b.len();

    let mut dp = vec![vec![0usize; n + 1]; m + 1];
    for (i, row) in dp.iter_mut().enumerate().take(m + 1) {
        row[0] = i;
    }
    for j in 0..=n {
        dp[0][j] = j;
    }

    for i in 1..=m {
        for j in 1..=n {
            let cost = if a[i - 1] == b[j - 1] { 0 } else { 1 };
            dp[i][j] = (dp[i - 1][j] + 1)
                .min(dp[i][j - 1] + 1)
                .min(dp[i - 1][j - 1] + cost);
        }
    }

    dp[m][n]
}