use super::*;

impl Parser {
    pub(super) fn parse_type_expr(&mut self) -> Result<TypeExpr, ()> {
        let first = self.parse_single_type()?;

        if self.match_token(TokenKind::KwOr) {
            let mut types = vec![first];
            types.push(self.parse_single_type()?);
            while self.match_token(TokenKind::KwOr) {
                types.push(self.parse_single_type()?);
            }
            let span = self.current_span();
            Ok(TypeExpr::Union(types, span))
        } else {
            Ok(first)
        }
    }

    fn parse_single_type(&mut self) -> Result<TypeExpr, ()> {
        let span = self.current_span();

        if self.check(TokenKind::KwMap) {
            self.advance();
            self.expect(TokenKind::KwOf)?;
            let key = self.parse_single_type()?;
            self.expect(TokenKind::KwTo)?;
            let val = self.parse_single_type()?;
            return Ok(TypeExpr::MapType(Box::new(key), Box::new(val), span));
        }

        let name = self.expect_identifier_or_type_keyword()?;

        if self.match_token(TokenKind::KwOf) {
            let mut args = vec![self.parse_single_type()?];
            while self.match_token(TokenKind::Comma) {
                args.push(self.parse_single_type()?);
            }
            Ok(TypeExpr::Generic(name, args, span))
        } else {
            Ok(TypeExpr::Named(name, span))
        }
    }
}