

with Interfaces.C;
with Interfaces.C.Strings;
with System; 
with System.Address_Image;
with Ada.Text_Io; use Ada.Text_Io;

with GNAT.OS_Lib ; 

with Z3.Example_C_Api ; use Z3, Z3.Example_C_Api;

procedure Z3_Teste is
begin
   Display_Version;
end Z3_Teste;
		   
-- Interfaces.C.Strings.Value(Interfaces.C.Strings.Chars_Ptr(Z3_Get_Error_Msg(Z3_SORT_ERROR))));
