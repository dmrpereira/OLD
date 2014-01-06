package body Ast.Ident is
   
   function Build_Ident(N:in String) return Ident is
      I : Ident;
   begin
      I.Ident_Name := Build_Name(N);
      return I;
   end Build_Ident;
   
   --  procedure Add_Idx(Id:in out Ident;N:in Natural) is
   --  begin
   --  end Add_Idx;
   
   --  procedure Rm_Idx(Id:in out Ident;N:in Natural) is
   --  begin
   --  end Rm_Idx;
      
   function Image(X:in Ident) return String is
   begin
      return (X.Ident_Name'Image);
   end Image;
   
   function "="(X, Y:in Ident) return Boolean is
   begin
      return (X.Ident_Name = Y.Ident_Name);
   end "=";
   
   function "<"(X, Y:in Ident) return Boolean is
   begin
      return (X.Ident_Name < Y.Ident_Name);
   end "<";
   
end Ast.Ident;
