with Ast; use Ast;
with Ada.Tags; use Ada.Tags;

package Ast.Literals is
   
   ------------------------------------------------------
   -- A literal is a new abstract subtype of ast nodes --
   ------------------------------------------------------
   type Literal_Aux is abstract new Ast_Abs with private;
   type Literal is access all Literal_Aux'Class;
   
   -----------------------
   -- Kinds of literals --
   -----------------------
   type Lit_Kind is (Lit_Bv_Kind,Lit_Num_Kind,Lit_Frac_Kind,Lit_Str_Kind);
   
   type Lit_Bv  is new Literal_Aux with private;
   type Lit_Num  is new Literal_Aux with private;
   type Lit_Frac is new Literal_Aux with private;
   type Lit_Str  is new Literal_Aux with private;
   
   ------------------
   -- Constructors --
   ------------------
   function Build_Lit_Bv(I,J:in Integer) return Literal;
   function Build_Lit_Num(I:in Integer) return Literal;
   function Build_Lit_Frac(F:in Float) return Literal;
   function Build_Lit_Str(S:in String) return Literal;
   
   ---------------------
   -- Pretty printers --
   ---------------------
   function Image(X:in Lit_Bv) return String;
   function Image(X:in Lit_Num) return String;
   function Image(X:in Lit_Frac) return String;
   function Image(X:in Lit_Str) return String;
   function Image(L:in Literal) return String;
   
   -----------------
   -- Equalitites --
   -----------------
   function "="(X, Y:in Lit_Bv) return Boolean;
   function "="(X, Y:in Lit_Num) return Boolean;
   function "="(X, Y:in Lit_Frac) return Boolean;
   function "="(X, Y:in Lit_Str) return Boolean;
   function "="(L1, L2:in Literal) return Boolean;
   
   ---------------------------
   -- Extra functionalities --
   ---------------------------
   function Get_Lit_Kind(L:in Literal) return Lit_Kind;
    
private
   
   type Literal_Aux is abstract new Ast_Abs with null record;
   
   ----------------------
   -- Boolean integers --
   ----------------------
   type Lit_Bv is new Literal_Aux with
      record
   	 Lit_Value : Integer;
     	 Lit_Width : Integer;
      end record;
   
   --------------
   -- Numerals --
   --------------
   type Lit_Num is new Literal_Aux with
      record
	 Lit_Num_Val : Integer;
      end record;
   
   -----------------
   -- Fractionals --
   -----------------
   type Lit_Frac is new Literal_Aux with
      record
   	 Lit_Frac_Val : Float;
      end record;
   
   -------------
   -- Strings --
   -------------
   type Lit_Str is new Literal_Aux with
      record
   	 Lit_Str_Val : Unbounded_String;
      end record;
      
end Ast.Literals;
