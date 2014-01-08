package body Ast.Literals is
   
   function Image(X:in Literal) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Literal) return Boolean is
   begin
      return True;
   end "=";
   
   function Image(X:in Lit_Bv) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Lit_Bv) return Boolean is
   begin
      return True;
   end "=";
   
     function Image(X:in Lit_Num) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Lit_Num) return Boolean is
   begin
      return True;
   end "=";
   
   function Image(X:in Lit_Frac) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Lit_Frac) return Boolean is
   begin
      return True;
   end "=";
   
   function Image(X:in Lit_Str) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Lit_Str) return Boolean is
   begin
      return True;
   end "=";
      
end Ast.Literals;
