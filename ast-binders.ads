with Ast; use Ast;
with Ast.Names; use Ast.Names;
with Ast.Types; use Ast.Types;

package Ast.Binders is
   
   -----------------------------------
   -- Completion of type of binders --
   -----------------------------------
   type Binder is new Ast_Abs with private;
   type Binder_Access is access all Binder'Class;
   
   function Image(B:in Binder) return String;
   function "="(X, Y:in Binder) return Boolean;
   function "<"(X, Y:in Binder) return Boolean;
   
private 
   
   type Binder is new Ast_Abs with
      record
	 Binder_Var : Name;
	 Binder_Type : Stype;
      end record;

   
end Ast.Binders;
