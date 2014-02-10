with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;

--with Ast; use Ast;
with Ast.Names, Ast.Types, Ast.Exprs, Ast.Binders, Engine, Engine.Infos, Engine.Options; 


package Engine.Commands is
   
   use Ast.Names, Ast.Types, Ast.Exprs, Ast.Binders, Engine, Engine.Infos, Engine.Options;
   
   ------------------------------------------------
   -- Kinds of supported commands for smt-lib v2 --
   ------------------------------------------------
   type Command_Kind is (Cmd_Set_Logic, Cmd_Set_Option, Cmd_Set_Info, Cmd_Declare_Type, Cmd_Define_Type, Cmd_Declare_Fun,
			 Cmd_Define_Fun, Cmd_Push, Cmd_Pop, Cmd_Assert, Cmd_Check_Sat, Cmd_Get_Assertions, Cmd_Get_Value,
			 Cmd_Get_Proof, Cmd_Get_Unsat_Core, Cmd_Get_Info, Cmd_Get_Option, Cmd_Exit );
   
   ---------------------------
   -- The types of commands --
   ---------------------------
   type Command_Aux(C:Command_Kind) is new Instr_Aux with private;
   type Command is access all Command_Aux;
   
   ------------------------------
   -- Constructors of commands --
   ------------------------------
   function Mk_Cmd_Set_Logic(N:in Name) return Command;
   function Mk_Cmd_Set_Option(O:in Option) return Command;
   function Mk_Cmd_Set_Info(A:in Attr) return Command;
   function Mk_Cmd_Declare_Type(N:in Name;I:in Integer) return Command;
   function Mk_Cmd_Define_Type(N:in Name;L:in Name_List;T:in Stype) return Command;
   function Mk_Cmd_Declare_Fun(N:in Name;L:in Stype_List;T:in Stype) return Command;
   function Mk_Cmd_Define_Fun(N:in Name;L:in Binder_List;T:in Stype;E:in Expr) return Command;
   function Mk_Cmd_Push(I:in Integer) return Command;
   function Mk_Cmd_Pop(I:in Integer) return Command;
   function Mk_Cmd_Assert(E:in Expr) return Command;
   function Mk_Cmd_Check_Sat return Command;
   function Mk_Cmd_Get_Assertions return Command;
   function Mk_Cmd_Get_Value(L:in Expr_List) return Command;
   function Mk_Cmd_Get_Proof return Command;
   function Mk_Cmd_Get_Unsat_Core return Command;
   function Mk_Cmd_Get_Info(F:in Info_Flag) return Command;
   function Mk_Cmd_Get_Option(N:in Name) return Command;
   function Mk_Cmd_Exit return Command;
   
   function Image(C:in Command_Aux) return String;
   function Image(C:in Command) return String;
   
private
   
   type Command_Aux(C:Command_Kind) is new Instr_Aux with
      record
	 case C is
	    when Cmd_Set_Logic =>
	       Set_Logic_Name : Name;
	    when Cmd_Set_Option =>
	       Set_Option_Option : Option;
	    when Cmd_Set_Info =>
	       Set_Info_Attr : Attr;
	    when Cmd_Declare_Type =>
	       Declare_Type_Name : Name;
	       Declare_Type_Int : Integer;
	    when Cmd_Define_Type =>
	       Define_Type_Name : Name;
	       Define_Type_Name_List : Name_List;
	       Define_Type_Type : Stype;
	    when Cmd_Declare_Fun =>
	       Declare_Fun_Name : Name;
	       Declare_Fun_Type_List : Stype_List;
	       Declare_Fun_Type : Stype;
	    when Cmd_Define_Fun =>
	       Define_Fun_Name : Name;
	       Define_Fun_Binder_List : Binder_List;
	       Define_Fun_Type : Stype;
	       Define_Fun_Expr : Expr;
	    when Cmd_Push =>
	       Push_Int : Integer;
	    when Cmd_Pop =>
	       Pop_Int : Integer;
	    when Cmd_Assert =>
	       Assert_Expr : Expr;
	    when Cmd_Get_Value =>
	       Get_Value_Expr_List : Expr_List;
	    when Cmd_Get_Info => 
	       Get_Info_Info_Flag : Info_Flag;
	    when Cmd_Get_Option =>
	       Get_Option_Name : Name;
	    when others => null;
	 end case;
      end record;
   
   
   --  package Command_Llist is new
   --    Ada.Containers.Doubly_Linked_Lists(Element_Type => Command,"=" => "=");
   --  use Command_Llist;
   
   --  type Command_List is 
   --     record
   --  	 List_Val : Command_Llist.List := Command_Llist.Empty_List;
   --     end record;
   
   --  Empty_Command_List : constant Command_List := (List_Val => Command_Llist.Empty_List);
   
   
end Engine.Commands;
