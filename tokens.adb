package body Tokens is
   
   function Make_Numeral(Arg:in Natural) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Numeral_Tok, Numeral_Val => Arg);
      return (Token_Val => X);
   end Make_Numeral;
   
   function Make_Decimal(Arg:in Float) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Decimal_Tok, Decimal_Val => Arg);
      return (Token_Val => X);
   end Make_Decimal;
   
   function Make_Binary(Arg:in Bin_Array; Size:in Array_Limit) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Binary_Tok, Bin_Array_Size => Size, Binary_Val => Arg); 
      return (Token_Val => X);
   end Make_Binary;
   
   function Make_Hex(Arg:in Hex_Array;Size:in Array_Limit) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Hex_Tok, Hex_Array_Size => Size, Hex_Val => Arg); 
      return (Token_Val => X);
   end Make_Hex;
   
   function Make_String(Arg:in String) return Token is
      X : Token_Internal;
   begin
      X := (Kind => String_Tok, String_Val => To_Unbounded_String(Arg));
      return (Token_Val => X);
   end Make_String;
   
   function Make_Symbol(Arg:in String) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Symb_Tok, Symb_Val => To_Unbounded_String(Arg));
      return (Token_Val => X);
   end Make_Symbol;
   
   function Make_Keyword(Arg:in String) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Keyword_Tok, Keyword_Val => To_Unbounded_String(Arg));
      return (Token_Val => X);
   end Make_Keyword;
   
   function Make_Reserved(Arg:in String) return Token is
      X : Token_Internal;
   begin
      X := (Kind => Reserved_Tok, Reserved_Val => To_Unbounded_String(Arg));
      return (Token_Val => X);
   end Make_Reserved;

   function Get_Token_Kind(Arg:in Token) return Token_Kind is
   begin
      return Arg.Token_Val.Kind;
   end Get_Token_Kind;
      
end Tokens;
