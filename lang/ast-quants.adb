package body Ast.Quants is

   function Build_Forall return Quant is
   begin
      return (Quant_Kind_Val => Forall);
   end Build_Forall;

   function Build_Exists return Quant is
   begin
      return (Quant_Kind_Val => Exists);
   end Build_Exists;

   function Get_Kind(Q:in Quant) return Quant_Kind is
   begin
      return Q.Quant_Kind_Val;
   end Get_Kind;

   function Image(X:in Quant) return String is
   begin
      case X.Quant_Kind_Val is
         when Forall => return "Forall";
         when others => return "Exists";
      end case;
   end Image;

   function "="(X, Y:in Quant) return Boolean is
   begin
      return (X.Quant_Kind_Val = Y.Quant_Kind_Val);
   end "=";

   function "<"(X, Y:in Quant) return Boolean is
   begin
      return (X.Quant_Kind_Val < Y.Quant_Kind_Val);
   end "<";

end Ast.Quants;
