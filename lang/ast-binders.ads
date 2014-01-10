with Ast; use Ast;
with Ast.Names; use Ast.Names;
with Ast.Types; use Ast.Types;

package Ast.Binders is
   
   -------------
   -- Binders --
   -------------
   type Binder is new Ast_Abs with private;
   type Binder_Llist is array(0..50) of Binder;
   
   ------------------
   -- Constructors --
   ------------------
   function Build_Binder(N:in Name;T:in Stype) return Binder;
   
   -------------
   -- Printer --
   -------------
   function Image(B:in Binder) return String;
   
   --------------
   -- Equality --
   --------------
   function "="(X, Y:in Binder) return Boolean;
   
   
private 
   
   --------------------------------------------------------------------------
   -- A binder is pair whose components are the binder's name and its type --
   --------------------------------------------------------------------------   
   type Binder is new Ast_Abs with
      record
	 Binder_Var : Name;
	 Binder_Type : Stype;
      end record;
   
end Ast.Binders;
