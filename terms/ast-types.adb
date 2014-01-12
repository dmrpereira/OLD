package body Ast.Types is
   
   function Image(X:in Stype) return String is
   begin
      return Image(X.all);
   end Image;
   
   function Image(X:in Stype_Var) return String is 
   begin
      return Image(X.Stype_Var_Name);
   end Image;
   
   function Image(X:in Stype_App) return String is 
   begin
      return Image(X.Stype_App_Ident);
   end Image;
   
   function Image(L:in Stype_List) return String is
   begin
      return Image_Of_App_Args(L.List_Val);
   end Image;
   
   function "="(X, Y:in Stype) return Boolean is
   begin
      if X'Tag = Y'Tag then
	 if X'Tag = Stype_Var'Tag then
	    return (Stype_Var(X.all) = Stype_Var(Y.all));
	 elsif X'Tag = Stype_App'Tag then
	    return (Stype_App(X.all) = Stype_App(Y.all));
	 else 
	    return False;
	 end if;
      else
	 return False;
      end if;
   end "=";
      
   function "="(X, Y:in Stype_Var) return Boolean is
   begin
      return (X.Stype_Var_Name = Y.Stype_Var_Name);
   end "=";
      
   function "="(X, Y:in Stype_App) return Boolean is 
   begin
      return (X.Stype_App_Ident = Y.Stype_App_Ident);
   end "=";
      
   -- Further implementation required!!!!
   function Image_Of_App_Args(L:in List) return String is
      S : Unbounded_String := Null_Unbounded_String;
      C : Cursor := First(L);
      N : Natural := Natural(Length(L));
      Tmp : Stype := null;
   begin
      Append(S,"[");
      while C /= Last(L) loop
	 Tmp := Element(C);
	if Tmp'Tag = Stype_Var'Tag then
	   Append(S,Image(Tmp));
	end if;
	if Tmp'Tag = Stype_App'Tag then
	   Append(S,Image(Stype_App(Tmp.all).Stype_App_Args));
	end if;
	C := Next(C);
	if C /= Last(L) then
	   Append(S,",");
	end if;
      end loop;
      Append(S,"]");
      return "";
   end Image_Of_App_Args;
   
   function Mk_Stype_Var(S:in String) return Stype is
   begin
      return (new Stype_Var'(Stype_Var_Name => Build_Name(S)));
   end Mk_Stype_Var;
   
   function Mk_Stype_App(S:in Ident;X:in Stype_List := Empty_Stype_List) return Stype is
   begin
      return (new Stype_App'(Stype_App_Ident => S,Stype_App_Args => X));
   end Mk_Stype_App;
   
   ----------------------------------
   -- Operations on lists of types --
   ----------------------------------
   procedure Push(L:in out Stype_List;T:in Stype) is
   begin
      L.List_Val.Insert(L.List_Val.Last,T);
   end Push;
   
   function Pop(L:in out Stype_List) return Stype is
      P : Types_Args_List.Cursor;
   begin
      if L.List_Val.Length > 0 then
	 P := L.List_Val.Last;
	 L.List_Val.Delete(P);
	 return Types_Args_List.Element(P);
      else
	 return null;
      end if;
   end Pop;
   
end Ast.Types;
