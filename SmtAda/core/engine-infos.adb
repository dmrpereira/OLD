package body Engine.Infos is
   
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
      
   
   function Image(I:in Info_Flag_Aux) return String is
   begin
      case I.I is
	 when Info_All_Statistics =>
	    return "all-statistics";
	 when Info_Error_Behavior =>
	    return "error-behavior";
	 when Info_Name =>
	    return "name";
	 when Info_Authors =>
	    return "authors";
	 when Info_Version =>
	    return "versions";
	 when Info_Status =>
	    return "status";
	 when Info_Reason_Unknown =>
	    return "reason-unkonwn";
	 when Info_Attr =>
	    return Image(I.Info_Attr_Val);
      end case;
   end Image;
   
   function Image(I:in Info_Flag) return String is
   begin
      return Image(I.all);
   end Image;
   
   
end Engine.Infos;
