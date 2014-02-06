

with Interfaces.C;
with Interfaces.C.Strings;
with System; 
with System.Address_Image;
with Ada.Text_Io; use Ada.Text_Io;

with GNAT.OS_Lib ; 

with Z3.Example_C_Api ; use Z3, Z3.Example_C_Api;

with Yices; use Yices ;

procedure Teste is
   X : Interfaces.C.Strings.Chars_Ptr ;
   Y_Ctx : Yices_Context ;
begin
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
