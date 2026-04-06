#![allow(dead_code)]

use std::fmt;

#[derive(Debug, Clone, PartialEq)]
pub enum OboType {
    Number,
    Decimal,
    Text,
    Char,
    Flag,
    Byte,
    Null,
    Void,

    List(Box<OboType>),
    Map(Box<OboType>, Box<OboType>),
    Set(Box<OboType>),

    Named(String),
    Choice(String),
    Entity(String),
    Actor(String),
    Trait(String),
    Task,

    Action(Vec<OboType>, Box<OboType>),

    Union(Vec<OboType>),
    Nullable(Box<OboType>),

    /// Inferred but not yet resolved
    Unknown,
    /// Type error — propagates without cascading more errors
    Error,
}

impl OboType {
    pub fn is_numeric(&self) -> bool {
        matches!(self, OboType::Number | OboType::Decimal)
    }

    pub fn is_error(&self) -> bool {
        matches!(self, OboType::Error)
    }

    pub fn is_unknown(&self) -> bool {
        matches!(self, OboType::Unknown)
    }

    pub fn is_nullable(&self) -> bool {
        matches!(self, OboType::Null | OboType::Nullable(_))
    }

    pub fn can_assign_to(&self, target: &OboType) -> bool {
        if self.is_error() || target.is_error() {
            return true;
        }
        if target.is_unknown() || self.is_unknown() {
            return true;
        }
        if self == target {
            return true;
        }
        match (self, target) {
            (OboType::Number, OboType::Decimal) => true,
            (OboType::Null, OboType::Nullable(_)) => true,
            (inner, OboType::Nullable(expected)) => inner.can_assign_to(expected),
            (OboType::List(a), OboType::List(b)) => a.can_assign_to(b),
            (OboType::Map(ak, av), OboType::Map(bk, bv)) => {
                ak.can_assign_to(bk) && av.can_assign_to(bv)
            }
            // source is assignable to union if it's assignable to any member
            (_, OboType::Union(members)) => members.iter().any(|m| self.can_assign_to(m)),
            // union source is assignable if all members can assign to target
            (OboType::Union(members), _) => members.iter().all(|m| m.can_assign_to(target)),
            _ => false,
        }
    }

    pub fn display_name(&self) -> String {
        match self {
            OboType::Number => "number".to_string(),
            OboType::Decimal => "decimal".to_string(),
            OboType::Text => "text".to_string(),
            OboType::Char => "char".to_string(),
            OboType::Flag => "flag".to_string(),
            OboType::Byte => "byte".to_string(),
            OboType::Null => "null".to_string(),
            OboType::Void => "void".to_string(),
            OboType::List(inner) => format!("list of {}", inner.display_name()),
            OboType::Map(k, v) => format!("map of {} to {}", k.display_name(), v.display_name()),
            OboType::Set(inner) => format!("set of {}", inner.display_name()),
            OboType::Named(n) => n.clone(),
            OboType::Choice(n) => n.clone(),
            OboType::Entity(n) => n.clone(),
            OboType::Actor(n) => n.clone(),
            OboType::Trait(n) => n.clone(),
            OboType::Task => "task".to_string(),
            OboType::Action(params, ret) => {
                let p: Vec<String> = params.iter().map(|t| t.display_name()).collect();
                format!("action({}) -> {}", p.join(", "), ret.display_name())
            }
            OboType::Union(types) => {
                let parts: Vec<String> = types.iter().map(|t| t.display_name()).collect();
                parts.join(" or ")
            }
            OboType::Nullable(inner) => format!("{} or null", inner.display_name()),
            OboType::Unknown => "unknown".to_string(),
            OboType::Error => "<error>".to_string(),
        }
    }
}

impl fmt::Display for OboType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.display_name())
    }
}
