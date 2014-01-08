with Ast.Names; use Ast.Names;
with Ast.Idents; use Ast.Idents;

with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Tags; use Ada.Tags;


package Ast.Types is
   
   type Stype_Ext is abstract new Ast_Abs with private;
   type Stype is access all Stype_Ext'Class;
   
   function Image(X:in Stype) return String;
   function "="(X, Y:in Stype) return Boolean;
   
   type Stype_Var is new Stype_Ext with private;
   type Stype_App is new Stype_Ext with private;
   
   function Image(X:in Stype_Var) return String;
   function "="(X, Y:in Stype_Var) return Boolean;
   
   function Image(X:in Stype_App) return String;
   function "="(X, Y:in Stype_App) return Boolean;
  
private
   
   type Stype_Ext is abstract new Ast_Abs with null record;
   
   type Stype_Var is new Stype_Ext with 
      record
	 Stype_Var_Name : Name;
      end record;
   
   package Types_Args_List is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Stype,"=" => "=");
   use Types_Args_List;
      
   type Stype_App is new Stype_Ext with
      record
	 Stype_App_Ident : Ident;
	 Stype_App_Args  : List := Empty_List;
      end record;
   
   function Image_Of_App_Args(L:in List) return String;   
   
end Ast.Types;


