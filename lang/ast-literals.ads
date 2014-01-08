with Ast; use Ast;

package Ast.Literals is
   
   type Literal_Aux is abstract new Ast_Abs with private;
   type Literal is access all Literal_Aux'Class;
   
   function Image(X:in Literal) return String;
   function "="(X, Y:in Literal) return Boolean;

   
   type Lit_Bv  is new Literal_Aux with private;
   type Lit_Num  is new Literal_Aux with private;
   type Lit_Frac is new Literal_Aux with private;
   type Lit_Str  is new Literal_Aux with private;
   
   function Image(X:in Lit_Bv) return String;
   function "="(X, Y:in Lit_Bv) return Boolean;
 
   
   function Image(X:in Lit_Num) return String;
   function "="(X, Y:in Lit_Num) return Boolean;

   
   function Image(X:in Lit_Frac) return String;
   function "="(X, Y:in Lit_Frac) return Boolean;
 
   
   function Image(X:in Lit_Str) return String;
   function "="(X, Y:in Lit_Str) return Boolean;
    
private
   
   type Literal_Aux is abstract new Ast_Abs with null record;
   
   type Lit_Bv is new Literal_Aux with
      record
   	 Lit_Value : Integer;
     	 Lit_Width : Integer;
      end record;
   
   type Lit_Num is new Literal_Aux with
      record
	 Lit_Num_Val : Integer;
      end record;
   
   type Lit_Frac is new Literal_Aux with
      record
   	 Lit_Frac_Val : Float;
      end record;
   
   type Lit_Str is new Literal_Aux with
      record
   	 Lit_Str_Val : Unbounded_String;
      end record;
      
end Ast.Literals;
