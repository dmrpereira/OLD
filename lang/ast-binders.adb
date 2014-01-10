package body Ast.Binders is
   
   function Build_Binder(N:in Name;T:in Stype) return Binder is
   begin
      return (Binder_Var => N, Binder_Type => T);
   end Build_Binder;
   
   function Image(B:in Binder) return String is
   begin
      return (Image(B.Binder_Var) & ":" & Image(B.Binder_Type));
   end Image;
   
   function "="(X, Y:in Binder) return Boolean is
   begin
      return (X.Binder_Var = Y.Binder_Var and X.Binder_Type = Y.Binder_Type);
   end "=";
        
end Ast.Binders;
