package Ast.Quants is
   
   ------------------------------------
   -- Kinds of supported quantifiers --
   ------------------------------------
   type Quant_Kind is (Forall,Exists);
   
   -------------------------
   -- Logical quantifiers --
   -------------------------
   type Quant is new Ast_Abs with private;
   
   function Build_Forall return Quant;
   function Build_Exists return Quant;
   function Get_Kind(Q:in Quant) return Quant_Kind;
		       
   function Image(X:in Quant) return String;
   function "="(X, Y:in Quant) return Boolean;
   function "<"(X, Y:in Quant) return Boolean;
   
private
   
   type Quant is new Ast_Abs with
      record
	 Quant_Kind_Val : Quant_Kind;
      end record;
   
end Ast.Quants;
