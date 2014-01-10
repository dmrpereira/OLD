with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Tags; use Ada.Tags;

---------------------------------
-- Library level constructions --
---------------------------------
with Ast; use Ast;
with Ast.Literals; use Ast.Literals;
with Ast.Idents; use Ast.Idents;
with Ast.Binders; use Ast.Binders;
with Ast.Names; use Ast.Names;
with Ast.Types; use Ast.Types;
with Ast.Quants; use Ast.Quants;

package Ast.Exprs is
   
   type Expr_Aux is abstract new Ast_Abs with private;
   type Expr is access all Expr_Aux'Class;
     
   function Image(X:in Expr)  return String;
   function "="(X, Y:in Expr) return Boolean;
   
   type Elit   is new Expr_Aux with private;
   type Eapp   is new Expr_Aux with private;
   type Equant is new Expr_Aux with private;
   type Elet   is new Expr_Aux with private;
   type Eannot is new Expr_Aux with private;
   
   function Build_Elit(L:in Literal) return Expr;
   function Image(X:in Elit)  return String;
   function "="(X, Y:in Elit) return Boolean;
   
   function Image(X:in Eapp)  return String;
   function "="(X, Y:in Eapp) return Boolean;
   
   function Image(X:in Equant)  return String;
   function "="(X, Y:in Equant) return Boolean;
 
   function Image(X:in Elet)  return String;
   function "="(X, Y:in Elet) return Boolean;
 
   function Image(X:in Eannot)  return String;
   function "="(X, Y:in Eannot) return Boolean;
 
   ---------------------------
   -- Function declarations --
   ---------------------------
   type Defn is new Ast_Abs with private;
     
   function Image(X:in Defn)  return String;
   function "="(X, Y:in Defn) return Boolean;
   
   ----------------
   -- Attributes --
   ----------------
   type Attr is new Ast_Abs with private;
   
   function Image(X:in Attr)  return String;
   function "="(X, Y:in Attr) return Boolean;
   
   ----------------------
   -- Attribute values --
   ----------------------
   type Attr_Val  is new Ast_Abs with private;
   
   function Image(X:in Attr_Val)  return String;
   function "="(X, Y:in Attr_Val) return Boolean;
   
    
private
      
   type Defn is new Ast_Abs with 
      record
	 Defn_Var : Name;
	 Defn_Expr : Expr;
      end record;
   
   package Defn_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Defn,"=" => "=");
   
   type Attr_Val  is new Ast_Abs with 
      record
	 Attr_Val_Expr : Expr;
      end record;
   
   type Attr is new Ast_Abs with 
      record
	 Attr_Name : Name;
	 Attr_Attr_Val : Attr_Val;
      end record;
   
   package Attr_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Attr,"=" => "=");
   
   type Expr_Aux is abstract new Ast_Abs with null record;
   
   package Expr_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Expr,"=" => "=");
   
   type Elit is new Expr_Aux with 
      record
	 Elit_Val : Literal;
      end record;
   
   type Eapp is new Expr_Aux with
      record
	 Eapp_Ident : Ident;
	 Eapp_Type  : Stype;
	 Eapp_Expr_List : Expr_Llist.List;
      end record;
   
   type Equant is new Expr_Aux with 
      record
	 Equant_Quant : Quant;
	 Equant_Binders : Binder_Llist;
	 Equant_Expr : Expr;
      end record;
   
   type Elet is new Expr_Aux with
      record
	 Elet_Defn : Defn_Llist.List;
	 Elet_Expr : Expr;
      end record;
   
   type Eannot is new Expr_Aux with
      record
	 Eannot_Expr : Expr;
	 Eannot_Attrs : Attr_Llist.List;
      end record;
   
   
       
end Ast.Exprs;
