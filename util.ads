with Ada.Strings; use Ada.Strings;

package Util is
   
   -- Binary numbers
   subtype Bin_Num is Natural range 0..1;
      
   -- Access to string datatypes   
   type String_Access is access all String;
   
   -- The type of binary arrays for identifier indexing, 
   -- and access types to them
   type Idxs_Array is array(Natural range <>) of Bin_Num;
   type Idxs_Array_Access is access all Idxs_Array;
   
   --subtype Hex_Num is Natural range 0..15;
   --subtype Array_Limit is Natural;
   --type Bin_Array is array(Array_Limit) of Bin_Num;
   --type Hex_Array is array(Array_Limit) of Hex_Num;
      
end Util;
