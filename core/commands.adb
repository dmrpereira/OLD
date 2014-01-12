package body Commands is
   
   function Build_Info_Flag(J:in Info_Flag_Kind;A:Attr := null) return Info_Flag is
      Iflag : Info_Flag := new Info_Flag_Aux(J);
   begin
      case J is
	 when Info_Attr =>
	    Iflag.Info_Attr_Val := A;
	 when others => null;
      end case;
      return Iflag;
   end Build_Info_Flag;
   
   function String_Of_Info_Flag_Aux(I:in Info_Flag_Aux) return String is   
   begin
      case I.I is
	 when Info_AllStatistics =>
	    return "all-statistics";
	 when Info_ErrorBehavior =>
	    return "error-behavior";
	 when Info_Name =>
	    return "name";
	 when Info_Authors =>
	    return "authors";
	 when Info_Version =>
	    return "versions";
	 when Info_Status =>
	    return "status";
	 when Info_ReasonUnknown =>
	    return "reason-unkonwn";
	 when Info_Attr =>
	    return Image(I.Info_Attr_Val);
      end case;
   end String_Of_Info_Flag_Aux;
   
   function String_Of_Info_Flag(I:in Info_Flag) return String is
   begin
      return String_Of_Info_Flag_Aux(I.all);
   end String_Of_Info_Flag;
   
   function String_Of_Option_Aux(O:in Option_Aux) return String is
   begin
      case O.O is
	 when OptPrintSuccess =>
	    return ("print-success " & O.Bval'Img);
	 when OptExpandDefinitions =>
	    return ("expand-definitions " & O.Bval'Img);
	 when OptInteractiveMode =>
	    return ("interactive-mode " & O.Bval'Img);
	 when OptProduceProofs =>
	    return ("produce-proofs " & O.Bval'Img);
	 when OptProduceUnsatCores => 
	    return ("produce-unsat-cores " & O.Bval'Img);
	 when OptProduceModels => 
	    return ("produce-models " & O.Bval'Img);
	 when OptProduceAssignments =>
	    return ("produce-assignments " & O.Bval'Img);
	 when OptRegularOutputChannel =>
	    return ("regular-output-channel " & To_String(O.Sval));
	 when OptDiagnosticOutputChannel =>
	    return ("diagnostic-output-channel " & To_String(O.Sval));
	 when OptRandomSeed => 
	    return ("random-seed " & O.Ival'Img);
	 when OptVerbosity =>
	    return ("verbosity " & O.Ival'Img);
	 when OptAttr =>
	    return (Image(O.Aval));
      end case;
   end String_Of_Option_Aux;
   
   function String_Of_Option(O:in Option) return String is
   begin
      return String_Of_Option_Aux(O.all);
   end String_Of_Option;
      
   function String_Of_Command_Aux(C:in Command_Aux) return String is
   begin
      case C.C is
	 when Cmd_Set_Logic =>
	    return ("set-logic " & Image(C.Set_Logic_Name));
	 when Cmd_Set_Option =>
	    return ("set-options " & String_Of_Option(C.Set_Option_Option));
	 when Cmd_Set_Info =>
	    return ("set-info " & Image(C.Set_Info_Attr));
	 when Cmd_Declare_Type =>
	    return ("declare-sort " & Image(C.Declare_Type_Name) & " " & C.Declare_Type_Int'Img);
	 when Cmd_Define_Type =>
	    return ("define-sort " & Image(C.Define_Type_Name) & " " & Image(C.Define_Type_Name_List) & " " & Image(C.Define_Type_Type));
	 when Cmd_Declare_Fun =>
	    return ("declare-fun " & Image(C.Declare_Fun_Name) & " " & Image(C.Declare_Fun_Type_List) & " " & Image(C.Declare_Fun_Type));
	 when Cmd_Define_Fun =>
	    return ("define-fun " & Image(C.Define_Fun_Name) & " " & Image(C.Define_Fun_Binder_List) & " " 
		      & Image(C.Define_Fun_Type) & " " & Image(C.Define_Fun_Expr));
	 when Cmd_Push =>
	    return ("push " & C.Push_Int'Img);
	 when Cmd_Pop =>
	    return ("pop " & C.Pop_Int'Img);
	 when Cmd_Assert =>
	    return ("assert " & Image(C.Assert_Expr));
	 when Cmd_Get_Value =>
	    return ("get-value " & Image(C.Get_Value_Expr_List));
	 when Cmd_Get_Info => 
	    return ("get-info " & String_Of_Info_Flag(C.Get_Info_Info_Flag));
	 when Cmd_Get_Option =>
	    return ("get-option " & Image(C.Get_Option_Name));
	 when others => return "";
      end case;
   end String_Of_Command_Aux;
   
   function "="(X,Y:in Command_Aux) return Boolean is
   begin
      if X.C /= Y.C then
	 return False;
      else
	 case X.C is
	    when Cmd_Set_Logic =>
	       return (X.Set_Logic_Name = Y.Set_Logic_Name);
	    when Cmd_Set_Option =>
	       return (X.Set_Option_Option = Y.Set_Option_Option);
	    when Cmd_Set_Info =>
	       return (X.Set_Info_Attr = Y.Set_Info_Attr);
	    when Cmd_Declare_Type =>
	       return (X.Declare_Type_Name = Y.Declare_Type_Name and
			 X.Declare_Type_Int = Y.Declare_Type_Int);
	    when Cmd_Define_Type =>
	       return (X.Define_Type_Name = Y.Define_Type_Name and 
			 X.Define_Type_Name_List = Y.Define_Type_Name_List and
			 X.Define_Type_Type = Y.Define_Type_Type);
	    when Cmd_Declare_Fun =>
	       return (X.Declare_Fun_Name = Y.Declare_Fun_Name and
			 X.Declare_Fun_Type_List  = Y.Declare_Fun_Type_List and
			 X.Declare_Fun_Type = Y.Declare_Fun_Type);
	    when Cmd_Define_Fun =>
	       return (X.Define_Fun_Name = Y.Define_Fun_Name and
			 X.Define_Fun_Binder_List = Y.Define_Fun_Binder_List and
			 X.Define_Fun_Type = Y.Define_Fun_Type and
			 X.Define_Fun_Expr = Y.Define_Fun_Expr);
	    when Cmd_Push =>
	       return (X.Push_Int = Y.Push_Int);
	    when Cmd_Pop =>
	       return (X.Pop_Int = Y.Pop_Int);
	    when Cmd_Assert =>
	       return (X.Assert_Expr = Y.Assert_Expr);
	    when Cmd_Get_Value =>
	       return (X.Get_Value_Expr_List = Y.Get_Value_Expr_List);
	    when Cmd_Get_Info => 
	       return (X.Get_Info_Info_Flag = Y.Get_Info_Info_Flag);
	    when Cmd_Get_Option =>
	       return (X.Get_Option_Name = Y.Get_Option_Name);
	    when others =>
	       return True;
	 end case;
      end if;
   end "=";
   
   function Mk_Cmd_Set_Logic(N:in Name) return Command is
      C : Command := new Command_Aux(Cmd_Set_Logic);
   begin
      C.Set_Logic_Name := N;
      return C;
   end Mk_Cmd_Set_Logic;
   
   function Mk_Cmd_Set_Option(O:in Option) return Command is
      C : Command := new Command_Aux(Cmd_Set_Option);
   begin
      C.Set_Option_Option := O;
      return C;
   end Mk_Cmd_Set_Option;
   
   function Mk_Cmd_Set_Info(A:in Attr) return Command is
      C : Command := new Command_Aux(Cmd_Set_Info);
   begin
      C.Set_Info_Attr := A;
      return C;
   end Mk_Cmd_Set_Info;
   
   function Mk_Cmd_Declare_Type(N:in Name;I:in Integer) return Command is
      C : Command := new Command_Aux(Cmd_Declare_Type);
   begin
      C.Declare_Type_Name := N;
      C.Declare_Type_Int := I;
      return C;
   end Mk_Cmd_Declare_Type;
   
   function Mk_Cmd_Define_Type(N:in Name;L:in Name_List;T:in Stype) return Command is
      C : Command := new Command_Aux(Cmd_Define_Type);
   begin
      C.Define_Type_Name := N;
      C.Define_Type_Name_List := L;
      C.Define_Type_Type := T;
      return C;
   end Mk_Cmd_Define_Type;
   
   function Mk_Cmd_Declare_Fun(N:in Name;L:in Stype_List;T:in Stype) return Command is
      C : Command := new Command_Aux(Cmd_Declare_Fun);
   begin
      C.Declare_Fun_Name := N;
      C.Declare_Fun_Type_List := L;
      C.Declare_Fun_Type := T;
      return C;
   end Mk_Cmd_Declare_Fun;
   
   function Mk_Cmd_Define_Fun(N:in Name;L:in Binder_List;T:in Stype;E:in Expr) return Command is
      C : Command := new Command_Aux(Cmd_Define_Fun);
   begin
      C.Define_Fun_Name := N;
      C.Define_Fun_Binder_List := L;
      C.Define_Fun_Type := T;
      C.Define_Fun_Expr := E;
      return C;
   end Mk_Cmd_Define_Fun;
   
   function Mk_Cmd_Push(I:in Integer) return Command is
      C : Command := new Command_Aux(Cmd_Push);
   begin
      C.Push_Int := I;
      return C;
   end Mk_Cmd_Push;
   
   function Mk_Cmd_Pop(I:in Integer) return Command is
      C : Command := new Command_Aux(Cmd_Pop);
   begin
      C.Pop_Int := I;
      return C;
   end Mk_Cmd_Pop;
   
   function Mk_Cmd_Assert(E:in Expr) return Command is
      C : Command := new Command_Aux(Cmd_Assert);
   begin
      C.Assert_Expr := E;
      return C;
   end Mk_Cmd_Assert;
   
   function Mk_Cmd_Check_Sat return Command is
   begin
      return (new Command_Aux(Cmd_Check_Sat));
   end Mk_Cmd_Check_Sat;
   
   function Mk_Cmd_Get_Assertions return Command is
   begin
      return (new Command_Aux(Cmd_Get_Assertions));
   end Mk_Cmd_Get_Assertions;
   
   function Mk_Cmd_Get_Value(L:in Expr_List) return Command is
      C : Command := new Command_Aux(Cmd_Get_Value);
   begin
      C.Get_Value_Expr_List := L;
      return C;
   end Mk_Cmd_Get_Value;
   
   function Mk_Cmd_Get_Proof return Command is
      C : Command := new Command_Aux(Cmd_Get_Proof);
   begin
      return C;
   end Mk_Cmd_Get_Proof;
   
   function Mk_Cmd_Get_Unsat_Core return Command is
      C : Command := new Command_Aux(Cmd_Get_Unsat_Core);
   begin
      return C;
   end Mk_Cmd_Get_Unsat_Core;
   
   function Mk_Cmd_Get_Info(F:in Info_Flag) return Command is
      C : Command := new Command_Aux(Cmd_Get_Info);
   begin
      C.Get_Info_Info_Flag := F;
      return C;
   end Mk_Cmd_Get_Info;
   
   function Mk_Cmd_Get_Option(N:in Name) return Command is
      C : Command := new Command_Aux(Cmd_Get_Option);
   begin
      C.Get_Option_Name := N;
      return C;
   end Mk_Cmd_Get_Option;
   
   function Mk_Cmd_Exit return Command is
      C : Command := new Command_Aux(Cmd_Exit);
   begin
      return C;
   end Mk_Cmd_Exit;
   
end Commands;
