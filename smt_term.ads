with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Smt_Term is

   type Smt_Term is abstract tagged null record;

   type Smt_Term_Access is access all Smt_Term'Class;

   function Smt_Term_Image(T:in Smt_Term) return Unbounded_String is abstract;


end Smt_Term;
