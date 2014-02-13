with Z3.Contexts, Z3.Configurations ;

use Z3, Z3.Configurations, Z3.Contexts ;

package Bridge.Z3 is
   
   type Z3_Context_Val is new Context_Val with private ;
   
   function Mk_Context return Context ;
   
private
   
   type Z3_Context_Val is new Context_Val with
      record
	 Cfg_Val : Z3_Config;
	 Ctx_Val : Z3_Context;
      end record ;
   
end Bridge.Z3 ;
