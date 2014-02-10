with Ast; use Ast;
with Ast.Exprs; use Ast.Exprs;

package Engine.Infos is
   
   --------------------------------------------
   -- The several kinds of information flags --
   --------------------------------------------
   type Info_Flag_Kind is ( Info_All_Statistics, Info_Error_Behavior, Info_Name, Info_Authors,
			    Info_Version, Info_Status, Info_Reason_Unknown, Info_Attr );
   
   -------------------------------------
   -- The types for information flags --
   -------------------------------------
   type Info_Flag_Aux(I:Info_Flag_Kind) is new Instr_Aux with private;
   type Info_Flag is access all Info_Flag_Aux;
   
   -----------------
   -- Constructor --
   -----------------
   function Build_Info_Flag(J:in Info_Flag_Kind;A:Attr := null) return Info_Flag;
   
   ---------------------
   -- Pretty printers --
   ---------------------
   function Image(I:in Info_Flag_Aux) return String;
   function Image(I:in Info_Flag) return String;
   
private
   
   type Info_Flag_Aux(I:Info_Flag_Kind) is new Instr_Aux with
      record
	 case I is
	    when Info_Attr => Info_Attr_Val : Attr;
	    when others => null; 
	 end case;
      end record;
   
end Engine.Infos;
