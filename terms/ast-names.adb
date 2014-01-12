package body Ast.Names is
   
   function Build_Name(S:in String) return Name is
   begin
      return (new Name_Aux'(Name_Val => To_Unbounded_String(S)));
   end Build_Name;
      
   function Image(X:in Name_Aux) return String is
   begin
      return To_String(X.Name_Val);
   end Image;
   
   function "="(N1:in Name_Aux;N2:in Name_Aux) return Boolean is
   begin
      return (N1.Name_Val = N2.Name_Val);
   end "=";
   
   function "<"(N1:in Name_Aux;N2:in Name_Aux) return Boolean is
   begin
      return (N1.Name_Val < N2.Name_Val);
   end "<";
   
   
   function Image(X:in Name) return String is
   begin
      return Image(X.all);
   end Image;
   
   function "="(N1:in Name;N2:in Name) return Boolean is
   begin
      return (N1.all = N2.all);
   end "=";
   
   function "<"(N1:in Name;N2:in Name) return Boolean is
   begin
      return (N1.all < N2.all);
   end "<";
   
   procedure Push(N:in Name;L:in out Name_List) is
   begin
      null;
   end Push;
   
   function Pop(L:in out Name_List) return Name is
   begin
      return null;
   end Pop;
   
   function Image(L:in Name_List) return String is
      C : Name_Llist.Cursor := First(L.List_Val);
      U : Unbounded_String := Null_Unbounded_String;
   begin
      while C /= Last(L.List_Val) loop
	 Append(U,"(" & Image(Element(C)) & ")");
	 C := Next(C);
      end loop;
      return To_String(U);
   end Image;
      
end Ast.Names;

