package body Bridge.Z3 is
   
   function Mk_Context return Context  is
      Ctx : Context ;
      Cfg : Z3_Config := Z3_Mk_Config ;
   begin
      Ctx := new Z3_Context_Val'( Cfg_Val => Cfg , Ctx_Val => Z3_Mk_Context(Cfg) ) ;
      return Ctx ;
   end Mk_Context ;
   
   
end Bridge.Z3 ;
