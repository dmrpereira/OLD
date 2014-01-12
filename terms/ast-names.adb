package body Ast.Names is
   
   function Build_Name(S:in String) return Name is
      N:Name;
   begin
      N.Name_Val := To_Unbounded_String(S);
      return N;
   end Build_Name;
   
   function Image(X:in Name) return String is
   begin
      return To_String(X.Name_Val);
   end Image;
   
   function "="(N1:in Name;N2:in Name) return Boolean is
   begin
      return (N1.Name_Val = N2.Name_Val);
   end "=";
   
   function "<"(N1:in Name;N2:in Name) return Boolean is
   begin
      return (N1.Name_Val < N2.Name_Val);
   end "<";
      
end Ast.Names;

