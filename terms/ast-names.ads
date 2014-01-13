with Ada.Containers.Doubly_Linked_Lists; 

with Ast; use Ast;

package Ast.Names is
   
   ----------------------
   -- The type of names -
   ----------------------
   type Name_Aux is new Ast_Abs with private;
   type Name is access all Name_Aux;
   
   --------------------
   -- Lists of names --
   --------------------
   type Name_List is private;
   
   Empty_Name_List : constant Name_List;
     
   --------------------------------------------------------
   -- Function to build a new name given its string value -
   --------------------------------------------------------
   function Build_Name(S:in String) return Name;
   
   ---------------------
   -- List operations --
   ---------------------
   function Image(L:in Name_List) return String;
   procedure Push(N:in Name;L:in out Name_List);
   function Pop(L:in out Name_List) return Name;
   
   ---------------------------
   -- Inherited subprograms --
   ---------------------------
   function Image(X:in Name) return String;
   function "="(N1:in Name;N2:in Name) return Boolean;
   function "<"(N1:in Name;N2:in Name) return Boolean;
   
   function Image(X:in Name_Aux) return String;
   function "="(N1:in Name_Aux;N2:in Name_Aux) return Boolean;
   function "<"(N1:in Name_Aux;N2:in Name_Aux) return Boolean;
   
private
   
   type Name_Aux is new Ast_Abs with 
      record
	 Name_Val : Unbounded_String := Null_Unbounded_String;
      end record;
   
   use Ada.Containers;
   package Name_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Name,"=" => "=");
   use Name_Llist;
   
   type Name_List is
      record
	 List_Val : List := Empty_List;
      end record;
   
   Empty_Name_List : Constant Name_List := (List_Val => Empty_List);
   
      
end Ast.Names;

