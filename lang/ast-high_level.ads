with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;

with Ast; use Ast;
with Ast.Exprs; use Ast.Exprs;
with Ast.Types; use Ast.Types;
with Ast.Binders; use Ast.Binders;
with Ast.Names; use Ast.Names;

package Ast.High_Level is
   
   type Option_Kind is 
     ( Opt_Print_Success,
       Opt_Expand_Definitions,
       Opt_Interactive_Mode,
       Opt_Produce_Proofs,
       Opt_Produce_Unsat_Cores,
       Opt_Produce_Models,
       Opt_Produce_Assignments,
       Opt_Regular_Output_Channel,
       Opt_Diagonostic_Output_Channel,
       Opt_Random_Seed,
       Opt_Verbosity,
       Opt_Attr );
   
   type Option_Aux(O:Option_Kind) is new Ast_Abs with private;
   type Option is access all Option_Aux;
   
   function Image(X:in Option_Aux) return String;
   function "="(X, Y:in Option_Aux) return Boolean;
   function "<"(X, Y:in Option_Aux) return Boolean;
   
   function Image(X:in Option) return String;
   function "="(X, Y:in Option) return Boolean;
   function "<"(X, Y:in Option) return Boolean;
   
   type Info_Flag_Kind is
     ( Info_All_Statistics,
       Info_Error_Behavior,
       Info_Name,
       Info_Authors,
       Info_Version,
       Info_Status,
       Info_Reason_Unknown,
       Info_Attr );
   
   type Info_Flag_Aux(I:Info_Flag_Kind) is new Ast_Abs with private;
   type Info_Flag is access all Info_Flag_Aux;
   
   function Image(X:in Info_Flag_Aux) return String;
   function "="(X, Y:in Info_Flag_Aux) return Boolean;
   function "<"(X, Y:in Info_Flag_Aux) return Boolean;
   
   function Image(X:in Info_Flag) return String;
   function "="(X, Y:in Info_Flag) return Boolean;
   function "<"(X, Y:in Info_Flag) return Boolean;
      
   
   type Command_Kind is
     ( Cmd_Set_Logic,
       Cmd_Set_Option,
       Cmd_Set_Info,
       Cmd_Declare_Type,
       Cmd_Define_Type,
       Cmd_Define_Fun,
       Cmd_Push,
       Cmd_Pop,
       Cmd_Assert,
       Cmd_Check_Sat,
       Cmd_Get_Assertions,
       Cmd_Get_Value,
       Cmd_Get_Proof,
       Cmd_Get_Unsat_Core,
       Cmd_Get_Info,
       Cmd_Get_Option,
       Cmd_Exit );
   
   type Command_Aux(C:Command_Kind) is new Ast_Abs with private;
   type Command is access all Command_Aux;
   
   function Image(X:in Command_Aux) return String;
   function "="(X, Y:in Command_Aux) return Boolean;
   function "<"(X, Y:in Command_Aux) return Boolean;
   
   function Image(X:in Command) return String;
   function "="(X, Y:in Command) return Boolean;
   function "<"(X, Y:in Command) return Boolean;

private
   
   type Option_Aux(O:Option_Kind) is new Ast_Abs with
      record
	 case O is
	    when Opt_Print_Success =>
	       Print_Success_Val : Boolean;
	    when Opt_Expand_Definitions => 
	       Expand_Definitions : Boolean;
	    when Opt_Interactive_Mode => 
	       Interactive_Mode : Boolean;
	    when Opt_Produce_Proofs => 
	       Produce_Proofs : Boolean;
	    when Opt_Produce_Unsat_Cores => 
	       Produce_Unsat_Cores : Boolean;
	    when Opt_Produce_Models => 
	       Produce_Models : Boolean;
	    when Opt_Produce_Assignments => 
	       Produce_Assignments : Boolean;
	    when Opt_Regular_Output_Channel =>
	       Regular_Output_Channel : Unbounded_String;
	    when Opt_Diagonostic_Output_Channel =>
	       Diagonostic_Output_Channel : Unbounded_String;
	    when Opt_Random_Seed => 
	       Random_Seed : Integer;
	    when Opt_Verbosity => 
	       Verbosity : Integer;
	    when Opt_Attr => 
	       Attr_val : Attr;
	    when others => null;
	 end case;
      end record;
   
   
   type Info_Flag_Aux(I:Info_Flag_Kind) is new Ast_Abs with 
      record
	 Info_Flag_Val : Info_Flag_Kind := I;
      end record;
   
   package Name_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Name,"=" => "=");
   
   package Stype_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Stype,"=" => "=");
   
   package Binder_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Binder,"=" => "=");
   
   package Expr_Llist is new
     Ada.Containers.Doubly_Linked_Lists(Element_Type => Expr,"=" => "=");
   
   type Command_Aux(C:Command_Kind) is new Ast_Abs with
      record
	 case C is
	    when Cmd_Set_Logic => 
	       Set_Logic : Unbounded_String;
	    when Cmd_Set_Option => 
	       Set_Option : Option;
	    when Cmd_Set_Info => 
	       Set_Info : Attr;
	    when Cmd_Declare_Type => 
	       Declare_Type_Name : Name;
	       Declare_Type_Val : Integer;
	    when Cmd_Define_Type =>
	       Define_Type_Name : Name;
	       Define_Type_Name_List : Name_Llist.List;
	       Define_Type_Type : Stype;
	    when Cmd_Define_Fun =>
	       Define_Fun_Name : Name;
	       Define_Fun_Types : Stype_Llist.List;
	       Define_Fun_Type : Stype;
	    when Cmd_Push => 
	       Push : Integer;
	    when Cmd_Pop => 
	       Pop : Integer;
	    when Cmd_Assert => 
	       Assert : Expr;
	    when Cmd_Get_Value => 
	       Get_Value : Expr_Llist.List;
	    when Cmd_Get_Info => 
	       Get_Info : Info_Flag;
	    when Cmd_Get_Option => 
	       Get_Option : Name;
	    when others => 
	       null;
	 end case;
      end record;
   
   
end Ast.High_Level;
