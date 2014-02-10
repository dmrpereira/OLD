with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Ast, Ast.Exprs, Engine;

package Engine.Options is
   
   use Ast, Ast.Exprs, Engine;
  
   type Option_Kind is ( Opt_Print_Success, Opt_Expand_Definitions, Opt_Interactive_Mode, Opt_Produce_Proofs, Opt_Produce_Unsat_Cores,
			 Opt_Produce_Models, Opt_Produce_Assignments, Opt_Regular_Output_Channel, Opt_Diagnostic_Output_Channel,
			 Opt_Random_Seed, Opt_Verbosity, Opt_Attr );
   
   type Option_Aux(O:Option_Kind) is new Instr_Aux with private;
   type Option is access all Option_Aux;
   
   function Image(O:in Option_Aux) return String;
   function Image(O:in Option) return String;
   
private
   
   type Option_Aux(O:Option_Kind) is new Instr_Aux with
      record
	 case O is
	    when Opt_Print_Success | Opt_Expand_Definitions | Opt_Interactive_Mode | Opt_Produce_Proofs |
	      Opt_Produce_Unsat_Cores | Opt_Produce_Models | Opt_Produce_Assignments => 
	       Bval : Boolean;
	    when Opt_Regular_Output_Channel | Opt_Diagnostic_Output_Channel => 
	       Sval : Unbounded_String;
	    when Opt_Random_Seed | Opt_Verbosity => 
	       Ival : Integer;
	    when Opt_Attr => 
	       Aval : Attr;
	 end case;
      end record;
   
end Engine.Options;
