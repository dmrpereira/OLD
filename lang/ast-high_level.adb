package body Ast.High_Level is
   
   function Image(X:in Option_Aux) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Option_Aux) return Boolean is
   begin
      return True;
   end "=";
     
   function "<"(X, Y:in Option_Aux) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Option) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Option) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Option) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Info_Flag_Aux) return String  is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Info_Flag_Aux) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Info_Flag_Aux) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Info_Flag) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Info_Flag) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Info_Flag) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Command_Aux) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Command_Aux) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Command_Aux) return Boolean is
   begin
      return True;
   end "<";
   
   function Image(X:in Command) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Command) return Boolean is
   begin
      return True;
   end "=";
   
   function "<"(X, Y:in Command) return Boolean is
   begin
      return True;
   end "<";
   
   
end Ast.High_Level;
   
