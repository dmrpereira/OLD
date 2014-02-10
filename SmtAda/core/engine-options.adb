package body Engine.Options is
   
   function Image(O:in Option_Aux) return String is
   begin
      case O.O is
	 when Opt_Print_Success =>
	    return ("print-success " & O.Bval'Img);
	 when Opt_Expand_Definitions =>
	    return ("expand-definitions " & O.Bval'Img);
	 when Opt_Interactive_Mode =>
	    return ("interactive-mode " & O.Bval'Img);
	 when Opt_Produce_Proofs =>
	    return ("produce-proofs " & O.Bval'Img);
	 when Opt_Produce_Unsat_Cores => 
	    return ("produce-unsat-cores " & O.Bval'Img);
	 when Opt_Produce_Models => 
	    return ("produce-models " & O.Bval'Img);
	 when Opt_Produce_Assignments =>
	    return ("produce-assignments " & O.Bval'Img);
	 when Opt_Regular_Output_Channel =>
	    return ("regular-output-channel " & To_String(O.Sval));
	 when Opt_Diagnostic_Output_Channel =>
	    return ("diagnostic-output-channel " & To_String(O.Sval));
	 when Opt_Random_Seed => 
	    return ("random-seed " & O.Ival'Img);
	 when Opt_Verbosity =>
	    return ("verbosity " & O.Ival'Img);
	 when Opt_Attr =>
	    return (Image(O.Aval));
      end case;
   end Image;
   
   function Image(O:in Option) return String is
   begin
      return Image(O.all);
   end Image;
   
end Engine.Options;
