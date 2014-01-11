package body Ast.Binders is
   
   function Build_Binder(N:in Name;T:in Stype) return Binder is
   begin
      return (new Binder_Aux'(Binder_Var => N, Binder_Type => T));
   end Build_Binder;
   
   function Image(B:in Binder_Aux) return String is
   begin
      return (Image(B.Binder_Var) & ":" & Image(B.Binder_Type));
   end Image;
   
   function "="(B1,B2:in Binder_Aux) return Boolean is
   begin
      return (B1.Binder_Var = B2.Binder_Var and B1.Binder_Type = B2.Binder_Type);
   end "=";
   
   function Image(B:in Binder) return String is
   begin
      return Image(B.all);
   end Image;
   
   function Image(L:in Binder_List) return String is
      C : Binder_Llist.Cursor := First(L.List_Val);
      U : Unbounded_String := Null_Unbounded_String;
   begin
      while C /= Last(L.List_Val) loop
	 Append(U,"(" & Image(Element(C)) & ")");
	 C := Next(C);
      end loop;
      return To_String(U);
   end Image;
   
   function "="(X, Y:in Binder) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   procedure Push(L:in out Binder_List;B:in Binder) is
   begin
      L.List_Val.Insert(L.List_Val.Last,B);
   end Push;
   
   function Pop(L:in out Binder_List) return Binder is
      P : Binder_Llist.Cursor;
   begin
      if L.List_Val.Length > 0 then
	 P := L.List_Val.Last;
	 L.List_Val.Delete(P);
	 return Binder_Llist.Element(P);
      else
	 return null;
      end if;
   end Pop;
   
   
end Ast.Binders;
