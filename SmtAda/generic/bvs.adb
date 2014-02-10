package body Bvs is

   function Mk_Bit_Vec(N:in Natural) return Stype is
      L : Indexes_List.List := Indexes_List.Empty_List;
      C : Indexes_List.Cursor := Indexes_List.First(L);
   begin
      Indexes_List.Insert(L,C,N);
      return (Mk_Stype_app(Build_Ident("BitVec",L)));
   end Mk_Bit_Vec;
   
   function Bv(I,J:in Integer) return Expr is
   begin
      return (Build_Elit(Build_Lit_Bv(I,J)));
   end Bv;


end Bvs;
