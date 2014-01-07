package body Ast.Exprs is
   
   function Image(X:in Expr)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Expr) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Expr) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Elit)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Elit) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Elit) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Eapp)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Eapp) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Eapp) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Equant)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Equant) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Equant) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Elet)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Elet) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Elet) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Eannot)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Eannot) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Eannot) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Defn)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Defn) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Defn) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Attr)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Attr) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Attr) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Attr_Val)  return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Attr_Val) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Attr_Val) return Boolean is
   begin
      return True;
   end "<";
   
end Ast.Exprs;
