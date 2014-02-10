with Yices; use Yices ;

package Bridge.Yices is
   
   type Yices_Context_Val is new Context_Val with private ;
   
   function Mk_Context return Context ;
   
private
   
   type Yices_Context_Val is new Context_Val with
      record
	 Ctx_Val : Yices_Context ;
      end record ;
   
end Bridge.Yices ;
