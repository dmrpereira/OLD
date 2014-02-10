package body Ast.Exprs is
   
   ------------------
   -- Constructors --
   ------------------
   function Build_Elit(L:in Literal) return Expr is
   begin
      return (new Elit'(Elit_Val => L));
   end Build_Elit;
   
   function Build_Eapp(I:in Ident;T:in Stype;L:in Expr_List) return Expr is
   begin
      return (new Eapp'(Eapp_Ident => I, Eapp_Type => T, Eapp_Expr_List => L));
   end Build_Eapp;
   
   function Build_Equant(Q:in Quant;L:in Binder_List;E:in Expr) return Expr is
   begin
      return (new Equant'(Equant_Quant => Q, Equant_Binders => L, Equant_Expr => E));
   end Build_Equant;
      
   function Build_Elet(L:in Defn_List;E:in Expr) return Expr is
   begin
      return (new Elet'(Elet_Defn => L, Elet_Expr => E));
   end Build_Elet;
   
   function Build_Eannot(E:in Expr;L:in Attr_List) return Expr is
   begin
      return (new Eannot'(Eannot_Expr => E, Eannot_Attrs =>L));
   end Build_Eannot;
   
   
   --------------
   -- Printers --
   --------------
   function Image(X:in Expr)  return String is
   begin
      return Image(X.all);
   end Image;
   
   function Image(L:in Expr_List) return String is
      C : Expr_Llist.Cursor := Expr_Llist.First(L.List_Val);
      E : Expr := null;
      U : Unbounded_String := Null_Unbounded_String;
   begin
      while C /= Expr_Llist.Last(L.List_Val) loop
	 Append(U,Image(Element(C)));
	 C := Expr_Llist.Next(C);
      end loop;
      return To_String(U);
   end Image;
   
   function Image(X:in Elit)  return String is
   begin
      return Image(X.Elit_Val);
   end Image;
   
   function Image(X:in Eapp)  return String is
      function Image_Aux(T:Stype) return String is
      begin
	 if T = null then
	    return Image(X.Eapp_Ident);
	 else
	    return "(" & Image(X.Eapp_Ident) & " as " & Image(X.Eapp_Type) & ")";
	 end if;
      end Image_Aux;
   begin
      if X.Eapp_Expr_List = Empty_Expr_List then
	 return Image_Aux(null);
      else
	 return "(" & Image_Aux(X.Eapp_Type) & Image(X.Eapp_Expr_List) & ")";
      end if;
   end Image;
   
   function Image(X:in Equant)  return String is
      function Dump_Binder_List(L:in Binder_List) return String is
	 B : Binder;
	 U : Unbounded_String := Null_Unbounded_String;
	 M : Binder_List := L;
      begin
	 B := Pop(M);
	 while B /= null loop
	    Append(U,Image(B));
	    B := Pop(M);
	 end loop;
	 return To_String(U);
      end Dump_Binder_List;
   begin
      if X.Equant_Binders = Empty_Binder_List then 
	 return Image(X.Equant_Expr);
      else
	 return (Image(X.Equant_Quant) & " " & Dump_Binder_List(X.Equant_Binders) & " " & Image(X.Equant_Expr));
      end if;
   end Image;
      
   function Image(X:in Elet)  return String is
      function Dump_Defn_List(L:in Defn_List) return String is
	 B : Defn;
	 U : Unbounded_String := Null_Unbounded_String;
	 M : Defn_List := L;
      begin
	 B := Pop(M);
	 while B /= null loop
	    Append(U,Image(B));
	    B := Pop(M);
	 end loop;
	 return To_String(U);
      end Dump_Defn_List;
   begin
      if X.Elet_Defn = Empty_Defn_List then
	 return Image(X.Elet_Expr);
      else
	 return ("let (" & Dump_Defn_List(X.Elet_Defn) & ") = " & Image(X.Elet_Expr));
      end if;
   end Image;
   
   function Image(X:in Eannot)  return String is
      function Dump_Attrs_List(L:in Attr_List) return String is
	 B : Attr;
	 U : Unbounded_String := Null_Unbounded_String;
	 M : Attr_List := L;
      begin
	 B := Pop(M);
	 while B /= null loop
	    Append(U,Image(B));
	    B := Pop(M);
	 end loop;
	 return To_String(U);
      end Dump_Attrs_List;
   begin
      if X.Eannot_Attrs = Empty_Attr_List then
	 return Image(X.Eannot_Expr);
      else
	 return ("!" & Image(X.Eannot_Expr) & "(" & Dump_Attrs_List(X.Eannot_Attrs) & ")");
      end if;
   end Image;
   
   function Image(D:in Defn_Aux) return String is
   begin
      return ("(" & Image(D.Defn_var) & " " & Image(D.Defn_Expr) & ")");
   end Image;
   
   function Image(X:in Defn)  return String is
   begin
      return Image(X.all);
   end Image;
   
   function Image(X:in Attr_Aux)  return String is
   begin
      return (":" & Image(X.Attr_Name) & " " & Image(X.Attr_Attr_Val));
   end Image;
   
   function Image(X:in Attr)  return String is
   begin
      return Image(X.all);
   end Image;
   
   
   ----------------
   -- Equalities --
   ----------------
   function "="(X, Y:in Expr) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   function "="(X, Y:in Elit) return Boolean is
   begin
      return (X.Elit_Val = Y.Elit_Val);
   end "=";
   
   function "="(X, Y:in Eapp) return Boolean is
   begin
      return (X.Eapp_Ident = Y.Eapp_Ident and X.Eapp_Type = Y.Eapp_Type and X.Eapp_Expr_List = Y.Eapp_Expr_List);
   end "=";
    
   function "="(X, Y:in Equant) return Boolean is
   begin
      return (X.Equant_Quant = Y.Equant_Quant and X.Equant_Binders = Y.Equant_Binders and X.Equant_Expr = Y.Equant_Expr);
   end "=";
      
   function "="(X, Y:in Elet) return Boolean is
   begin
      return (X.Elet_Defn = Y.Elet_Defn and X.Elet_Expr = Y.Elet_Expr);
   end "=";
   
   function "="(X, Y:in Eannot) return Boolean is
   begin
      return (X.Eannot_Expr = Y.Eannot_Expr and X.Eannot_Attrs = Y.Eannot_Attrs);
   end "=";
   
   function "="(X,Y:in Defn_Aux) return Boolean is
   begin
      return (X.Defn_Var = Y.Defn_Var and X.Defn_Expr = Y.Defn_Expr);
   end "=";
   
   function "="(X, Y:in Defn) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   function "="(X, Y:in Attr_Aux) return Boolean is
   begin
      return (X.Attr_Name = Y.Attr_Name and X.Attr_Attr_Val = Y.Attr_Attr_Val);
   end "=";
   
   function "="(X, Y:in Attr) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   ---------------------
   -- List Operations --
   ---------------------
   
   procedure Push(L:in out Expr_List;E:in Expr) is
   begin
      L.List_Val.Insert(L.List_Val.Last,E);
   end Push;
   
   function Pop(L:in out Expr_List) return Expr is
      P : Expr_Llist.Cursor;
   begin
      if L.List_Val.Length > 0 then
	 P := L.List_Val.Last;
	 L.List_Val.Delete(P);
	 return Expr_Llist.Element(P);
      else
	 return null;
      end if;
   end Pop;
   
   procedure Push(L:in out Attr_List;A:in Attr) is
   begin
      L.List_Val.Insert(L.List_Val.Last,A);
   end Push;
   
   function Pop(L:in out Attr_List) return Attr is
      P : Attr_Llist.Cursor;
   begin
      if L.List_Val.Length > 0 then
	 P := L.List_Val.Last;
	 L.List_Val.Delete(P);
	 return Attr_Llist.Element(P);
      else
	 return null;
      end if;
   end Pop;
   
   procedure Push(L:in out Defn_List;D:in Defn) is
   begin
      L.List_Val.Insert(L.List_Val.Last,D);
   end Push;
   
   function Pop(L:in out Defn_List) return Defn is
      P : Defn_Llist.Cursor;
   begin
      if L.List_Val.Length > 0 then
	 P := L.List_Val.Last;
	 L.List_Val.Delete(P);
	 return Defn_Llist.Element(P);
      else
	 return null;
      end if;
   end Pop;
   
end Ast.Exprs;
