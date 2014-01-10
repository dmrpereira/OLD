with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
--with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;
--with Ada.Containers.Cursors; use Ada.Containers.Cursors;

with Util; use Util;
with Ast; use Ast;
with Ast.Names; use Ast.Names;

package Ast.Idents is
   
   -----------------------------
   -- The type of identifiers --
   -----------------------------
   type Ident is new Ast_Abs with private;
   
    package Indexes_List is 
       new Ada.Containers.Doubly_Linked_Lists(Element_Type => Natural,"=" => "=");
   use Indexes_List;
   ------------------------------------------------------------------
   -- Build a new identifier, first with, secondly without indexes --
   ------------------------------------------------------------------
   function Build_Ident(N:in String;I:in List := Empty_List) return Ident;
   --function Build_Ident(N:in String) return Ident;
   
   -----------------------------------------------------
   -- Indexed indentifier consulting and manipulation --
   -----------------------------------------------------
   function Exists_Ident_Idx(N:in Ident;I:in Natural) return Boolean;
   procedure Add_Idx(Id:in out Ident;N:in Natural);
   procedure Rm_Idx(Id:in out Ident;N:in Natural);
   
   function Image(X:in Ident) return String;
   function "="(X, Y:in Ident) return Boolean;
   
   function Idxs_Image(X:in Ident) return String;
   
private
   
   type Ident is new Ast_Abs with 
      record
	 Ident_Name : Name;
	 Ident_Idxs : Indexes_List.List := Indexes_List.Empty_List;
      end record;

   
end Ast.Idents;
