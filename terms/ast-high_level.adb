package body Ast.High_Level is
   
   function Image(X:in Option_Aux) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Option_Aux) return Boolean is
   begin
      if X.O = Y.O then
	 case X.O is
	    when Opt_Print_Success =>
	       return (X.Print_Success_Val = Y.Print_Success_Val);
	    when Opt_Expand_Definitions => 
	       return (X.Expand_Definitions = Y.Expand_Definitions);
	    when Opt_Interactive_Mode => 
	       return (X.Interactive_Mode = Y.Interactive_Mode);
	    when Opt_Produce_Proofs => 
	       return (X.Produce_Proofs = Y.Produce_Proofs);
	    when Opt_Produce_Unsat_Cores => 
	       return (X.Produce_Unsat_Cores= Y.Produce_Unsat_Cores);
	    when Opt_Produce_Models => 
	       return (X.Produce_Models = Y.Produce_Models);
	    when Opt_Produce_Assignments => 
	       return (X.Produce_Assignments = Y.Produce_Assignments);
	    when Opt_Regular_Output_Channel =>
	       return (X.Regular_Output_Channel = Y.Regular_Output_Channel);
	    when Opt_Diagonostic_Output_Channel =>
	       return (X.Diagonostic_Output_Channel = Y.Diagonostic_Output_Channel);
	    when Opt_Random_Seed => 
	       return (X.Random_Seed = Y.Random_Seed);
	    when Opt_Verbosity => 
	       return (X.Verbosity = Y.Verbosity);
	    when Opt_Attr => 
	       return (X.Attr_val = Y.Attr_Val);
	 end case;
      end if;
      return False;
   end "=";
     
   function Image(X:in Option) return String is
   begin
      return Image(X.all);
   end Image;
   
   function "="(X, Y:in Option) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   function Image(X:in Info_Flag_Aux) return String  is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Info_Flag_Aux) return Boolean is
   begin
      return (X.Info_Flag_Val = Y.Info_Flag_Val);
   end "=";
   
   function Image(X:in Info_Flag) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Info_Flag) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   function Image(X:in Command_Aux) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Command_Aux) return Boolean is
   begin
      if X.C = Y.C then
	 case X.C is
	    when Cmd_Set_Logic => 
	       return (X.Set_Logic = Y.Set_Logic);
	    when Cmd_Set_Option => 
	       return (X.Set_Option = Y.Set_Option);
	    when Cmd_Set_Info => 
	       return (X.Set_Info = Y.Set_Info);
	    when Cmd_Declare_Type => 
	       return (X.Declare_Type_Name = Y.Declare_Type_Name
			 and
			 X.Declare_Type_Val = Y.Declare_Type_Val);
	    when Cmd_Define_Type =>
	       return (X.Define_Type_Name = Y.Define_Type_Name
			 and
			 Name_Llist."="(X.Define_Type_Name_List,Y.Define_Type_Name_List)
			 and 
			 X.Define_Type_Type = Y.Define_Type_Type);
	    when Cmd_Define_Fun =>
	       return (X.Define_Fun_Name = Y.Define_Fun_Name
			 and
			 Stype_Llist."="(X.Define_Fun_Types,Y.Define_Fun_Types)
			 and
			 X.Define_Fun_Type = Y.Define_Fun_Type);
	    when Cmd_Push => 
	       return (X.Push = Y.Push);
	    when Cmd_Pop => 
	       return (X.Pop = Y.Pop);
	    when Cmd_Assert => 
	       return (X.Assert = Y.Assert);
	    when Cmd_Get_Value => 
	       return (Expr_Llist."="(X.Get_Value,Y.Get_Value));
	    when Cmd_Get_Info => 
	       return (X.Get_Info = Y.Get_Info);
	    when Cmd_Get_Option => 
	       return (X.Get_Option = Y.Get_Option);
	    when others =>
	       return True;
	 end case;
      end if;
      return False;
   end "=";
   
   function Image(X:in Command) return String is
   begin
      return "";
   end Image;
   
   function "="(X, Y:in Command) return Boolean is
   begin
      return (X.all = Y.all);
   end "=";
   
   
end Ast.High_Level;
   
