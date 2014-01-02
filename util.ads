package Util is
   
   subtype Bin_Num is Natural range 0..1;
   subtype Hex_Num is Natural range 0..15;
   subtype Array_Limit is Natural range 0 .. 64;
   type Bin_Array is array(Array_Limit) of Bin_Num;
   type Hex_Array is array(Array_Limit) of Hex_Num;
      
end Util;
