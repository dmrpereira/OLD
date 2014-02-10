package body Ast_Functions is
   
   function App(I:in Ident;L:in Expr_List) return Expr is
   begin
      return Build_Eapp(I,Undef_Stype,L);
   end App;
   
end Ast_Functions;
