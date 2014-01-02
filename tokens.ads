with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Util; use Util;

package Tokens is

   type Token_Kind is
     ( Numeral_Tok,
       Decimal_Tok,
       Binary_Tok,
       Hex_Tok,
       String_Tok,
       Symb_Tok,
       Keyword_Tok,
       Reserved_Tok );
   -- Kinds of tokens

   type Token is private;
   -- The type of tokens

   function Make_Numeral(Arg:in Natural) return Token;
   function Make_Decimal(Arg:in Float) return Token;
   function Make_Binary(Arg:in Bin_Array;Size:in Array_Limit) return Token;
   function Make_Hex(Arg:in Hex_Array;Size:in Array_Limit) return Token;
   function Make_Symbol(Arg:in String) return Token;
   function Make_Keyword(Arg:in String) return Token;
   function Make_Reserved(Arg:in String) return Token;
   -- Functions to create new tokens, each for each possible kind

   function Get_Token_Kind(Arg:in Token) return Token_Kind;
   -- Get the kind of a given token

private
   

   type Token_Internal(Kind:Token_Kind := Numeral_Tok ) is
      record
         case Kind is
            when Numeral_Tok =>
               Numeral_Val : Natural;
            when Decimal_Tok =>
               Decimal_Val : Float ;
            when Binary_Tok  =>
	       Bin_Array_Size : Array_Limit;
	       Binary_Val : Bin_Array ;
            when Hex_Tok => 
	       Hex_Array_Size : Array_Limit;
	       Hex_Val : Hex_Array;
            when String_Tok  =>
               String_Val : Unbounded_String ;
            when Symb_Tok =>
               Symb_Val : Unbounded_String ;
            when Keyword_Tok =>
               Keyword_Val : Unbounded_String ;
            when Reserved_Tok =>
               Reserved_Val : Unbounded_String ;
         end case;
      end record;
   
   type Token is 
      record
	 Token_Val : Token_Internal;
      end record;

end Tokens;
