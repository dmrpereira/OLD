package body Ast.Types is
   
   function Image(X:in Stype) return String is
   begin
      return Image(X.all);
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
   
   function "<"(X, Y:in Stype) return Boolean is
   begin
      if X'Tag = Stype_Var'Tag then
	 if Y'Tag = Stype_App'Tag then
	    return True;
	 elsif Y'Tag = Stype_Var'Tag then
	    return (Stype_Var(X.all) < Stype_Var(Y.all));
	 else
	    return False;
	 end if;
      elsif X'Tag = Stype_App'Tag then
	 if Y'Tag = Stype_App'Tag then
	    return (Stype_App(X.all) < Stype_App(Y.all));
	 else
	    return False;
	 end if;
      else
	 return False;
      end if;
   end "<";
   
   function Image(X:in Stype_Var) return String is 
   begin
      return Image(X.Stype_Var_Name);
   end Image;
   
   function "="(X, Y:in Stype_Var) return Boolean is
   begin
      return (X.Stype_Var_Name = Y.Stype_Var_Name);
   end "=";
   
   function "<"(X, Y:in Stype_Var) return Boolean is 
   begin
      return (X.Stype_Var_Name < Y.Stype_Var_Name);
   end "<";
   
   function Image(X:in Stype_App) return String is 
   begin
      return Image(X.Stype_App_Ident);
   end Image;
   
   function "="(X, Y:in Stype_App) return Boolean is 
   begin
      return (X.Stype_App_Ident = Y.Stype_App_Ident);
   end "=";
   
   function "<"(X, Y:in Stype_App) return Boolean is
   begin
      return (X.Stype_App_Ident < Y.Stype_App_Ident);
   end "<";
   
   -- Further implementation required
   function Image_Of_App_Args(L:in List) return String is
   begin
      return "";
   end Image_Of_App_Args;
   
end Ast.Types;
