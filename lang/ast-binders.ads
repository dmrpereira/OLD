with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

with Ast; use Ast;
with Ast.Names; use Ast.Names;
with Ast.Types; use Ast.Types;

package Ast.Binders is
   
   -------------
   -- Binders --
   -------------
   type Binder_Aux is new Ast_Abs with private;
   type Binder is access all Binder_Aux;
   
   type Binder_List is private;
   Empty_Binder_List : constant Binder_List;
   
   
   function Image(B:in Binder_Aux) return String;
   function "="(B1,B2:in Binder_Aux) return Boolean;
   function Image(L:in Binder_List) return String;
   procedure Push(L:in out Binder_List;B:in Binder);
   function Pop(L:in out Binder_List) return Binder;
   
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
   type Binder_Aux is new Ast_Abs with
      record
	 Binder_Var : Name;
	 Binder_Type : Stype;
      end record;
   
   package Binder_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Binder,"=" => "=");
   use Binder_Llist;
   
   type Binder_List is
      record
	 List_Val : List := Empty_List;
      end record;
   
   Empty_Binder_List : constant Binder_List := (List_Val => Empty_List);
   
end Ast.Binders;
