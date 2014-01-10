package body Ast.Literals is
   
   function Build_Lit_Bv(I,J:in Integer) return Literal is
   begin
      return (new Lit_Bv'(Lit_Value => I,Lit_Width => J));
   end Build_Lit_Bv;
      
   function Image(X:in Lit_Bv) return String is
   begin
      return "bool_vec(" & X.Lit_Value'Img & "," & X.Lit_Width'Img & ")";
   end Image;
   
   function "="(X, Y:in Lit_Bv) return Boolean is
   begin
      return (X.Lit_Value = Y.Lit_Value and X.Lit_Width = Y.Lit_Width);
   end "=";
   
   function Build_Lit_Num(I:in Integer) return Literal is
   begin
      return (new Lit_Num'(Lit_Num_Val => I));
   end Build_Lit_Num;
   
     function Image(X:in Lit_Num) return String is
   begin
      return X.Lit_Num_Val'Img;
   end Image;
   
   function "="(X, Y:in Lit_Num) return Boolean is
   begin
      return (X.Lit_Num_Val = Y.Lit_Num_Val);
   end "=";
   
   function Build_Lit_Frac(F:in Float) return Literal is
   begin
      return (new Lit_Frac'(Lit_Frac_Val => F));
   end Build_Lit_Frac;
   
   function Image(X:in Lit_Frac) return String is
   begin
      return X.Lit_Frac_Val'Img;
   end Image;
   
   function "="(X, Y:in Lit_Frac) return Boolean is
   begin
      return (X.Lit_Frac_Val = Y.Lit_Frac_Val);
   end "=";
   
   function Build_Lit_Str(S:in String) return Literal is
   begin
      return (new Lit_Str'(Lit_Str_Val => To_Unbounded_String(S)));
   end Build_Lit_Str;
   
   function Image(X:in Lit_Str) return String is
   begin
      return To_String(X.Lit_Str_Val);
   end Image;
   
   function "="(X, Y:in Lit_Str) return Boolean is
   begin
      return (X.Lit_Str_Val = Y.Lit_Str_Val);
   end "=";
   
   -------------------------------------
   -- Functions for abstract literals --
   -------------------------------------
   
   function Image(L:in Literal) return String is
   begin
      if L'Tag = Lit_Bv'Tag then
	 return Image(Lit_Bv(L.all));
      elsif L'Tag = Lit_Num'Tag then
	 return Image(Lit_Num(L.all));
      elsif L'Tag = Lit_Frac'Tag then
	 return Image(Lit_Frac(L.all));
      else
	 return Image(Lit_Str(L.all));
      end if;
   end Image;
   
   function "="(L1, L2:in Literal) return Boolean is
   begin
      if L1'Tag = L2'Tag then
	 if L1'Tag = Lit_Bv'Tag then
	    return Lit_Bv(L1.all) = Lit_Bv(L2.all);
	 elsif L1'Tag = Lit_Num'Tag then
	    return Lit_Num(L1.all) = Lit_Num(L2.all);
	 elsif L1'Tag = Lit_Frac'Tag then
	    return Lit_Frac(L1.all) = Lit_Frac(L2.all);
	 else
	    return Lit_Str(L1.all) = Lit_Str(L2.all);
	 end if;
      else
	 return False;
      end if;
   end "=";
   
   function Get_Lit_Kind(L:in Literal) return Lit_Kind is
   begin
      if L'Tag = Lit_Bv'Tag then
	 return Lit_Bv_Kind;
      elsif L'Tag = Lit_Num'Tag then
	 return Lit_Num_Kind;
      elsif L'Tag = Lit_Frac'Tag then
	 return Lit_Frac_Kind;
      else
	 return Lit_Str_Kind;
      end if;
   end Get_Lit_Kind;
      
end Ast.Literals;
