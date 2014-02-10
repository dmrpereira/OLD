package body Bridge.Yices is
   
   function Mk_Context return Context is
      Ctx : Context ;
   begin
      Ctx := new Yices_Context_Val'( Ctx_Val => Yices_Mk_Context ) ;
      return Ctx ;
   end Mk_Context ;
   
   
end Bridge.Yices ;
