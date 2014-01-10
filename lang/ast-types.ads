with Ada.Tags; use Ada.Tags;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

with Ast.Names; use Ast.Names;
with Ast.Idents; use Ast.Idents;

package Ast.Types is
   
   -----------
   -- Types --
   -----------
   type Stype_Ext is abstract new Ast_Abs with private;
   type Stype is access all Stype_Ext'Class;
   
   -------------------
   -- List of types --
   -------------------
   type Stype_List is private;
   
    ---------------------------------------------
   -- Constructor and modifiers of type lists --
   ---------------------------------------------
   procedure Push(L:in out Stype_List;T:in Stype);
   function Pop(L:in out Stype_List) return Stype;
   
   Empty_Stype_List : constant Stype_List;
   
   --------------------
   -- Kinds of types --
   --------------------
   type Stype_Var is new Stype_Ext with private;
   type Stype_App is new Stype_Ext with private;
   
   -----------------------------------
   -- Functions to build type terms --
   -----------------------------------
   function Mk_Stype_Var(S:in String) return Stype;
   function Mk_Stype_App(S:in Ident;X:in Stype_List := Empty_Stype_List) return Stype;
   
   --------------
   -- Printers --
   --------------
   function Image(X:in Stype) return String;
   function Image(X:in Stype_Var) return String;
   function Image(X:in Stype_App) return String;
   function Image(L:in Stype_List) return String;
   
   ----------------
   -- Equalities --
   ----------------
   function "="(X, Y:in Stype) return Boolean;
   function "="(X, Y:in Stype_Var) return Boolean;
   function "="(X, Y:in Stype_App) return Boolean;
   
   
private
   
   type Stype_Ext is abstract new Ast_Abs with null record;
   
   package Types_Args_List is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Stype,"=" => "=");
   use Types_Args_List;
   
   ------------------------------------------------------------------------
   -- A stype list is just a doubly linked list instantiated with stypes --
   ------------------------------------------------------------------------
   type Stype_List is
      record
	 List_Val  : List := Empty_List;
      end record;
   
   Empty_Stype_List : constant Stype_List := (List_Val => Empty_List);
      
   type Stype_Var is new Stype_Ext with 
      record
	 Stype_Var_Name : Name;
      end record;
   
   type Stype_App is new Stype_Ext with
      record
	 Stype_App_Ident : Ident;
	 Stype_App_Args  : Stype_List := Empty_Stype_List;
      end record;
   
   function Image_Of_App_Args(L:in List) return String;   
   
end Ast.Types;


