with Ada.Containers.Doubly_Linked_Lists;
with Util; use Util;

with Ast; use Ast;
with Ast.Name; use Ast.Name;

package Ast.Ident is
   
   ----------------------------
   -- The type of identifiers -
   ----------------------------
   type Ident is new Ast_Abs with private;
   
   function Build_Ident(N:in String) return Ident;
   --function Exists_Ident_Idx(N:in Ident;I:in Natural) return Boolean;
   --procedure Add_Idx(Id:in out Ident;N:in Natural);
   --procedure Rm_Idx(Id:in out Ident;N:in Natural);
   
   function Image(X:in Ident) return String;
   function "="(X, Y:in Ident) return Boolean;
   function "<"(X, Y:in Ident) return Boolean;
   
private
   
   package Bin_Linked_List is 
      new Ada.Containers.Doubly_Linked_Lists(Element_Type => Bin_Num,"=" => "=");
   
   type Ident is new Ast_Abs with 
      record
	 Ident_Name : Name;
	 Ident_Idxs : Bin_Linked_List.List := Bin_Linked_List.Empty_List;
      end record;

   
end Ast.Ident;
