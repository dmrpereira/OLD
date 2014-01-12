with Ast; use Ast;

package Ast.Names is
   
   ----------------------
   -- The type of names -
   ----------------------
   type Name is new Ast_Abs with private;
     
   --------------------------------------------------------
   -- Function to build a new name given its string value -
   --------------------------------------------------------
   function Build_Name(S:in String) return Name;
   
   ---------------------------
   -- Inherited subprograms --
   ---------------------------
   function Image(X:in Name) return String;
   function "="(N1:in Name;N2:in Name) return Boolean;
   function "<"(N1:in Name;N2:in Name) return Boolean;
   
private
   
   type Name is new Ast_Abs with 
      record
	 Name_Val : Unbounded_String := Null_Unbounded_String;
      end record;
   
      
end Ast.Names;

