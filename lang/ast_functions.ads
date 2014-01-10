with Ast; use Ast;
with Ast.Idents; use Ast.Idents;
with Ast.Names; use Ast.Names;
with Ast.Exprs; use Ast.Exprs;

package Ast_Functions is
   
   function App(I:in Ident;El:in Expr_List.List) return Expr;
   
   
end Ast_Functions;
