with Bridge;
with Bridge.Z3; use Bridge.Z3;
with Bridge.Z3.Configurations; use Bridge.Z3.Configurations;
with Bridge.Z3.Contexts; use Bridge.Z3.Contexts;
with Bridge.Z3.Symbols_And_Sorts; use Bridge.Z3.Symbols_And_Sorts;
with Bridge.Z3.Consts_And_Apps; use Bridge.Z3.Consts_And_Apps;
with Bridge.Z3.Arith; use Bridge.Z3.Arith;
with Bridge.Z3.Logic_And_Equal; use Bridge.Z3.Logic_And_Equal;
with Bridge.Z3.Bvectors; use Bridge.Z3.Bvectors;
with Bridge.Z3.Solvers; use Bridge.Z3.Solvers;
with Bridge.Z3.Arrays_And_Sets ; use Bridge.Z3.Arrays_And_Sets;
with Bridge.Z3.Numerals ; use Bridge.Z3.Numerals ;
with Bridge.Z3.Quants ; use Bridge.Z3.Quants ;
with Bridge.Z3.Accessors ; use Bridge.Z3.Accessors ;
with Bridge.Z3.Parameters ; use Bridge.Z3.Parameters;

with Interfaces.C;
with Interfaces.C.Strings;
with System; 
with System.Address_Image;
with Ada.Text_Io; use Ada.Text_Io;

procedure Z3_Teste is
   
   package Nio is new Ada.Text_Io.Enumeration_Io(Enum => Z3_Decl_Kind);
   
   C : Z3_Config;
   K : Z3_Context;
   L : Z3_Ast;
   S : Z3_String;
begin
   C := Z3_Mk_Config;
   K := Z3_Mk_Context(C);
   L := Z3_Mk_Eq(K,Z3_Mk_True(K),Z3_Mk_False(K));
   S := Z3_Ast_To_String(K,L);
   Ada.Text_Io.Put(Interfaces.C.Strings.Value(Interfaces.C.Strings.Chars_Ptr(S)));
   --  D := C;
   --  if D = C then 
   --     Put("First:");
   --     New_Line;
   --     Put(System.Address_Image(C'Address));
   --     New_Line;
   --     Put(System.Address_Image(D'Address));
   --     New_Line;
   --     Put("--");
   --     New_Line;
   --  end if;
   --  D := Z3_Mk_Config;
   --  if D = C then 
   --     Put(System.Address_Image(C'Address));
   --     New_Line;
   --     Put(System.Address_Image(D'Address));
   --  end if;

   --Put("Done!!!!!");
   --Put(System.Address_Image(C'Address));
end Z3_Teste;
