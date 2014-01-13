package body Engine.Commands is
   
   --------------------
   -- Pretty printers -
   --------------------
   function Par(S:in String) return String is
   begin
      return ("(" & S & ")");
   end Par;
   
   function Image(C:in Command_Aux) return String is
   begin
      case C.C is
	 when Cmd_Set_Logic =>
	    return Par("set-logic " & Image(C.Set_Logic_Name));
	 when Cmd_Set_Option =>
	    return Par("set-options " & Image(C.Set_Option_Option));
	 when Cmd_Set_Info =>
	    return Par("set-info " & Image(C.Set_Info_Attr));
	 when Cmd_Declare_Type =>
	    return Par("declare-sort " & Image(C.Declare_Type_Name) & " " & C.Declare_Type_Int'Img);
	 when Cmd_Define_Type =>
	    return Par("define-sort " & Image(C.Define_Type_Name) & " " & Image(C.Define_Type_Name_List) & " " & Image(C.Define_Type_Type));
	 when Cmd_Declare_Fun =>
	    return Par("declare-fun " & Image(C.Declare_Fun_Name) & " " & Image(C.Declare_Fun_Type_List) & " " & Image(C.Declare_Fun_Type));
	 when Cmd_Define_Fun =>
	    return Par("define-fun " & Image(C.Define_Fun_Name) & " " & Image(C.Define_Fun_Binder_List) & " " 
		      & Image(C.Define_Fun_Type) & " " & Image(C.Define_Fun_Expr));
	 when Cmd_Push =>
	    return Par("push " & C.Push_Int'Img);
	 when Cmd_Pop =>
	    return Par("pop " & C.Pop_Int'Img);
	 when Cmd_Assert =>
	    return Par("assert " & Image(C.Assert_Expr));
	 when Cmd_Get_Value =>
	    return Par("get-value " & Image(C.Get_Value_Expr_List));
	 when Cmd_Get_Info => 
	    return Par("get-info " & Image(C.Get_Info_Info_Flag));
	 when Cmd_Get_Option =>
	    return Par("get-option " & Image(C.Get_Option_Name));
	 when Cmd_Exit =>
	    return Par("exit");
	 when others => return "";
      end case;
   end Image;
   
   function Image(C:in Command) return String is
   begin
      return Image(C.all);
   end Image;
   
   ------------------
   -- Constructors --
   ------------------
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
   
   
end Engine.Commands;
