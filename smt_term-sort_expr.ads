with Smt_Term.

package Smt_Term.Sort_Expr is

  type Sort_Expr;

  type Sort_Expr_Access is access all Sort_Expr;

  type Sort_Expr_Seq is
     record
        Head : Unbounded_String;
        Tail : Sort_Expr_Access;
     end record;

  type Sort_Expr is
     record
        Sort_Expr_Id : Unbounded_String;
        Sort_Expr_Rest : Sort_Expr_Seq;
     end record;

  type Sort(N:Natural) is new Smt_Term with
     record
        Sort_Id : Unbounded_String;
        Sort_Params : array(range 0 .. N) of Unbounded_String;
        Sort_Sort_Expr : Sort_Expr;
     end record;

end Smt_Temr.Sort_Expr;
