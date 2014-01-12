with Ast; use Ast;
with Ast.Idents; use Ast.Idents;
with Ast.Names; use Ast.Names;
with Ast.Exprs; use Ast.Exprs;
with Ast.Types; use Ast.Types;

package Ast_Functions is
   
   function App(I:in Ident;L:in Expr_List) return Expr;
   
   
end Ast_Functions;
