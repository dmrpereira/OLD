with Ada.Strings; use Ada.Strings;


with Ada.Containers; use Ada.Containers;
with Ada.Containers.Doubly_Linked_Lists;

package Util is
   
   -- Maximum number of arguments in any construction 
   -- with requires them
   Max_Args : constant Natural := 50;
   subtype Max_Range is Natural range 0..Max_Args;
   
   -- Binary numbers
   subtype Bin_Num is Natural range 0..1;
   
   -- Access to string datatypes   
   type String_Access is access all String;
   
end Util;
