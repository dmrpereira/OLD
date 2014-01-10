package body Ast_Function is
   
   function Buid_App(I:in Ident) return Expr is
   begin
      end Build_app
   procedure Add_App_Arg(A:in out App;E:in Expr);
   
   function App(I:in Ident;El:in array(Max_Args) of Expr) return Expr is
   begin
      return null;
   end App;
   
end Ast_Functions;
