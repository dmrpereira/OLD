------------------------------------------------------------------------------
--                                                                          --
-- SMT-Ada : an Ada frontend to SMT provers.                                --
-- Author : David Pereira                                                   --
--          Research Associate at CISTER, ISEP, Porto, Portugal             --
--          dmrpe@isep.ipp.pt                                               --
--                                                                          --
-- This is free software;  you can redistribute it  and/or modify it  under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  This software is distributed in the hope  that it will be useful, --
-- but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHAN- --
-- TABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General  Public  License  distributed  with  this  software;   see  file --
-- COPYING3.  If not, go to http://www.gnu.org/licenses for a complete copy --
-- of the license.                                                          --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;
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
   
   --------------------------
   -- Lists of expressions --
   --------------------------
   type Expr_List is private;
   
   Empty_Expr_List : constant Expr_List;
      
   --------------------------
   -- Kinds of expressions --
   --------------------------
   type Elit   is new Expr_Aux with private;
   type Eapp   is new Expr_Aux with private;
   type Equant is new Expr_Aux with private;
   type Elet   is new Expr_Aux with private;
   type Eannot is new Expr_Aux with private;
   
   ---------------------------
   -- Function declarations --
   ---------------------------
   type Defn_Aux is new Ast_Abs with private;
   type Defn is access all Defn_Aux;
   type Defn_List is private;
   
   Empty_Defn_List : constant Defn_List;
   
   ----------------
   -- Attributes --
   ----------------
   type Attr_Aux is new Ast_Abs with private;
   type Attr is access all Attr_Aux;
   type Attr_List is private;
   
   Empty_Attr_List : constant Attr_List;
   
   
   ---------------------------------
   -- Constructors of expressions --
   ---------------------------------
   function Build_Elit(L:in Literal) return Expr;
   function Build_Eapp(I:in Ident;T:in Stype;L:in Expr_List) return Expr;
   function Build_Equant(Q:in Quant;L:in Binder_List;E:in Expr) return Expr;
   function Build_Elet(L:in Defn_List;E:in Expr) return Expr;
   function Build_Eannot(E:in Expr;L:in Attr_List) return Expr;
   
   ---------------------
   -- Pretty printers --
   ---------------------
   function Image(X:in Elit)  return String;
   function Image(X:in Eapp)  return String;
   function Image(X:in Equant)  return String;
   function Image(X:in Elet)  return String;
   function Image(X:in Eannot)  return String;
   function Image(X:in Expr)  return String;
   function Image(L:in Expr_List) return String;
   
   ----------------
   -- Equalities --
   ----------------
   function "="(X, Y:in Elit) return Boolean;
   function "="(X, Y:in Eapp) return Boolean;
   function "="(X, Y:in Equant) return Boolean;
   function "="(X, Y:in Elet) return Boolean;
   function "="(X, Y:in Eannot) return Boolean;
   function "="(X, Y:in Expr) return Boolean;
   
   ---------------------
   -- List operations --
   ---------------------
   procedure Push(L:in out Expr_List;E:in Expr);
   function Pop(L:in out Expr_List) return Expr;
      
   --------------
   -- Printers --
   --------------
   function Image(D:in Defn_Aux) return String;
   function Image(X:in Defn)  return String;
   
   ----------------
   -- Equalities --
   ----------------
   function "="(X,Y:in Defn_Aux) return Boolean;
   function "="(X, Y:in Defn) return Boolean;
   
   ---------------------
   -- List operations --
   ---------------------
   procedure Push(L:in out Defn_List;D:in Defn);
   function Pop(L:in out Defn_List) return Defn;
      
   --------------
   -- Printers --
   --------------
   function Image(X:in Attr_Aux)  return String;
   function Image(X:in Attr)  return String;
   
   ----------------
   -- Equalities --
   ----------------
   function "="(X, Y:in Attr_Aux) return Boolean;
   function "="(X, Y:in Attr) return Boolean;
   
   ---------------------
   -- List operations --
   ---------------------
   procedure Push(L:in out Attr_List;A:in Attr);
   function Pop(L:in out Attr_List) return Attr;
   
private
   
   -----------------
   -- Definitions --
   -----------------
   type Defn_Aux is new Ast_Abs with 
      record
	 Defn_Var : Name;
	 Defn_Expr : Expr;
      end record;
   
   package Defn_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Defn,"=" => "=");
   use Defn_Llist;
   
   type Defn_List is
      record
	 List_Val : Defn_Llist.List := Defn_Llist.Empty_List;
      end record;
   
   Empty_Defn_List : constant Defn_List := (List_Val => Defn_Llist.Empty_List);
   
   ----------------
   -- Attributes --
   ----------------
   type Attr_Aux is new Ast_Abs with 
      record
	 Attr_Name : Name;
	 Attr_Attr_Val : Expr;
      end record;
   
   package Attr_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Attr,"=" => "=");
   use Attr_Llist;
   
   type Attr_List is
      record
	 List_Val : Attr_Llist.List := Attr_Llist.Empty_List;
      end record;
   
   Empty_Attr_List : constant Attr_List := (List_Val => Attr_Llist.Empty_List);
   
   -----------------
   -- Expressions --
   -----------------
   type Expr_Aux is abstract new Ast_Abs with null record;
   
   package Expr_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Expr,"=" => "=");
   
   use Expr_Llist;
   
   type Expr_List is 
      record
	 List_Val : Expr_Llist.List := Expr_Llist.Empty_List;
      end record;
   
   Empty_Expr_List : constant Expr_List := (List_Val => Expr_Llist.Empty_List);
   
   --------------------------
   -- Kinds of expressions -- 
   --------------------------
   type Elit is new Expr_Aux with 
      record
	 Elit_Val : Literal;
      end record;
   
   type Eapp is new Expr_Aux with
      record
	 Eapp_Ident : Ident;
	 Eapp_Type  : Stype;
	 Eapp_Expr_List : Expr_List;
      end record;
   
   type Equant is new Expr_Aux with 
      record
	 Equant_Quant : Quant;
	 Equant_Binders : Binder_List;
	 Equant_Expr : Expr;
      end record;
   
   type Elet is new Expr_Aux with
      record
	 Elet_Defn : Defn_List;
	 Elet_Expr : Expr;
      end record;
   
   type Eannot is new Expr_Aux with
      record
	 Eannot_Expr : Expr;
	 Eannot_Attrs : Attr_List;
      end record;
   
end Ast.Exprs;
