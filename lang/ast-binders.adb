package body Ast.Binders is
   
   function Image(B:in Binder) return String is
   begin
      return (Image(B.Binder_Var) & ":" & Image(B.Binder_Type));
   end Image;
   
   function "="(X, Y:in Binder) return Boolean is
   begin
      return (X.Binder_Var = Y.Binder_Var and X.Binder_Type = Y.Binder_Type);
   end "=";
   
     
end Ast.Binders;
