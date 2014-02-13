with Interfaces.C;
with Interfaces.C.Strings;
with System; 
with System.Address_Image;
with Ada.Text_Io; use Ada.Text_Io;

with GNAT.OS_Lib ; 

with Z3.Example_C_Api ; use Z3, Z3.Example_C_Api;

with Yices; use Yices ;

with CVC3_Kinds, CVC3_Defs, CVC3 ; 
with CVC4_Defs, CVC4 ; 

procedure Teste is
   X : Interfaces.C.Strings.Chars_Ptr ;
   Y_Ctx : Yices_Context ;
   Cvc_Checker : Cvc3_Defs.Cvc_VC ;
   Che : Cvc4_Defs.Vc;
   Cvc_Int : Cvc3_Defs.Cvc_Ctype ;
   E1, E2 : Cvc3_Defs.Cvc_Expr ;
   Zero, P1, P2  : Cvc3_Defs.Cvc_Expr ;
begin
   -- cvc3 tryout
   Cvc_Checker :=  Cvc3.Vc_CreateValidityChecker(Cvc3_Defs.CVC_Flags(System.Null_Address)) ;
   Cvc_Int := Cvc3.Vc_IntType(Cvc_Checker) ;
   
   E1 := Cvc3.Vc_VarExpr(Cvc_Checker,Interfaces.C.Strings.New_String("x"),Cvc_Int);
   E2 := Cvc3.Vc_VarExpr(Cvc_Checker,Interfaces.C.Strings.New_String("y"),Cvc_Int);
   Zero := Cvc3.Vc_RatExpr(Cvc_Checker,0,1);
   Cvc3.Vc_PrintExpr(Cvc_Checker,E1);
   Cvc3.Vc_PrintExpr(Cvc_Checker,E2);
   Cvc3.Vc_PrintExpr(Cvc_Checker,Zero);
   
   p1 := Cvc3.Vc_GtExpr(Cvc_Checker,E1,Zero);
   p2 := Cvc3.Vc_GtExpr(Cvc_Checker,E2,Zero);
   
   Cvc3.Vc_PrintExpr(Cvc_Checker,p1);
   Cvc3.Vc_PrintExpr(Cvc_Checker,p2);
   
   -- Yices tryout
   X := Yices_Version ;
   Put(Interfaces.C.Strings.Value(X));
   New_Line ;
   Put("Now building an Yices context ...") ;
   New_Line ;
   Y_Ctx := Yices_Mk_Context ;
   Put("Now deleting it ...") ;
   New_Line ;
   Yices_Del_Context(Y_Ctx) ;
   -- Z3 tryout
   Display_Version;
end Teste;
		   
-- Interfaces.C.Strings.Value(Interfaces.C.Strings.Chars_Ptr(Z3_Get_Error_Msg(Z3_SORT_ERROR))));
