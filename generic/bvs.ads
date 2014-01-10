with Ast; use Ast;
with Ast.Names; use Ast.Names;
with Ast.Types; use Ast.Types;
with Ast.Exprs; use Ast.Exprs;
with Ast.Idents; use Ast.Idents;
with Ast.Binders; use Ast.Binders;
with Ast.Literals; use Ast.Literals;
with Ast.High_Level; use Ast.High_Level;

package Bvs is
   
   function Mk_Bit_Vec(N:in Natural) return Stype;
   
   function Bv(I,J:in Integer) return Expr;
   
   --  function Concat(E1,E2:in Expr) return Expr;
   --  function Extract(I,J:in Integer;E:in Expr) return Expr;
   
   --  function Bv_Not(E:in Expr) return Expr;
   --  function Bv_And(E1,E2:in Expr) return Expr;
   --  function Bv_Or(E1,E2:in Expr) return Expr;
   --  function Bv_Neg(E:in Expr) return Expr;
   --  function Bv_Add(E1,E2:in Expr) return Expr;
   --  function Bv_Mul(E1,E2:in Expr) return Expr;
   --  function Bv_Udiv(E1,E2:in Expr) return Expr;
   --  function Bv_Urem(E1,E2:in Expr) return Expr;
   --  function Bv_Shl(E1,E2:in Expr) return Expr;
   --  function Bv_Shr(E1,E2:in Expr) return Expr;
   --  function Bv_Ult(E1,E2:in Expr) return Expr;
   --  function Bv_Nand(E1,E2:in Expr) return Expr;
   --  function Bv_Nor(E1,E2:in Expr) return Expr;
   --  function Bv_Xor(E1,E2:in Expr) return Expr;
   --  function Bv_Xnor(E1,E2:in Expr) return Expr;
   --  function Bv_Comp(E1,E2:in Expr) return Expr;
   --  function Bv_Sub(E1,E2:in Expr) return Expr;
   --  function Bv_Sdiv(E1,E2:in Expr) return Expr;
   --  function Bv_Srem(E1,E2:in Expr) return Expr;
   --  function Bv_Smod(E1,E2:in Expr) return Expr;
   --  function Bv_Ashr(E1,E2:in Expr) return Expr;
   --  function Bv_Ugt(E1,E2:in Expr) return Expr;
   --  function Bv_Uge(E1,E2:in Expr) return Expr;
   --  function Bv_Slt(E1,E2:in Expr) return Expr;
   --  function Bv_Sle(E1,E2:in Expr) return Expr;
   --  function Bv_Sgt(E1,E2:in Expr) return Expr;
   --  function Bv_Sge(E1,E2:in Expr) return Expr;
		      
   --  function Repeat(I:in Integer) return Expr;
   --  function Zero_Extend(I:in Integer;E:in Expr) return Expr;
   --  function Sing_Extend(I:in Integer;E:in Expr) return Expr;
   --  function Rotate_Left(I:in Integer;E:in Expr) return Expr;
   --  function Rotate_Right(I:in Integer;E:in Expr) return Expr;
   
end Bvs;
