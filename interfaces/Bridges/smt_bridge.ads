package Smt_Bridge is
   
   type Smt_Context_Base is tagged private ;
   type Smt_Context is access all Smt_Context_Base'Class ;
   
   ---------------------------------
   -- Construction of expressions --
   ---------------------------------
   
   -------------------------
   -- Boolean expressions --
   -------------------------
   
   ---------------------------
   -- Numerical expressions --
   ---------------------------
   
   ------------------
   -- Declarations --
   ------------------
   
   --------------
   -- Checking --
   --------------
   
private
   
   type Smt_Context_Base is tagged null record ;
   
   
end Smt_Bridge ;
