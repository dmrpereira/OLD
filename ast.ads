with Util; use Util;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Ast is
   
   ----------------------------------------------
   -- Parent type represent an abstrat ast-node -
   ----------------------------------------------
   type Ast_Abs is abstract tagged null record;
   type Ast is access all Ast_Abs'Class;
   
   function Image(X:in Ast_Abs) return String is abstract;
   function "="(X, Y:in Ast_Abs) return Boolean is abstract;
   function "<"(X, Y:in Ast_Abs) return Boolean is abstract;
   
  
   
   
   
--     -- Logical quantifiers
--     type Quantifier is new Ast_Abs with null record;
--     type Forall is new Quantifier with null record;
--     type Exists is new Quantifier with null record;
   
--     -- Logical connectives
--     type LConn_Kind is (LNot,LImplies,LAnd,LOr,LXor,LIff,LIte);
--     type LConn is new Ast_Abs with
--        record
--  	 LConn_Kind_Val : LConn_Kind;
--        end record;
--     type LConn_Access is access all LConn'Class;
--     function Get_LConn_Kind(C:in LConn) return LConn_Kind;
--     function Build_LConn(Val:in String) return LConn;
   
--     -- Literals
--     type Literal is abstract new Ast_Abs with null record;
--     type Literal_Access is access all Literal'Class;
   
--     type Lit_Bv is new Literal with
--        record
--  	 Lit_Value : Integer;
--  	 Lit_Width : Natural;
--        end record;
--     type LitNum is new Literal with
--        record
--  	 LitNum_Val : Integer;
--        end record;
--     type LitFrac is new Literal with
--        record
--  	 LitFrac : Float;
--        end record;
--     type LitStr is new Literal with
--        record
--  	 LitStr : String_Access := null;
--        end record;
   
--     -- Definition of attributes
--     type Annot is new Ast_Abs with
--        record
--  	 Attr_Name : Name;
--  	 Attr_Val  : String_Access := null;
--        end record;
--     type Annot_Access is access all Annot;
--     type Annot_List is array(Natural range <>) of Annot_Access;
--     type Annot_List_Access is access all Annot_List;
   
--     -- Types for sorts
--     type Sort is new Ast_Abs with
--        record
--  	 Sort_Ident : Ident;
--        end record;
--     type Sort_Access is access all Sort'Class;
--     type Sort_List is array(Natural range <>) of Sort_Access;
--     type Sort_List_Access is access all Sort_List;
   
--     -- Completion of type of binders
--     type Binder is new Ast_Abs with
--        record
--  	 Binder_Var : Name;
--  	 Binder_Sort : Sort;
--        end record;
--     type Binder_Access is access all Binder'Class;
--     type Binder_List is array(Natural range <>) of Binder_Access;
--     type Binder_List_Access is access all Binder_List;

   
--     -- Terms and logical formulas
--     type Formula is abstract new Ast_Abs with null record;
--     type Term is abstract new Ast_Abs with null record;
   
--     type Formula_Access is access all Formula'Class;
--     type Term_Access is access all Term'Class;
   
--     type Formula_List is array(Natural range <>) of Formula_Access;
--     type Formula_List_Access is access all Formula_List;
--     type Term_List is array(Natural range <>) of Term_Access;
--     type Term_List_Access is access all Term_List;
     
--     -- Types for formulas
--     type FTrue is abstract new Formula with null record;
--     type FFalse is new Formula with null record;
--     type FPred is new Formula with
--        record
--       	 FPred_Ident : Ident;
--       	 Fpred_Term  : Term_Access := null;
--        end record;
--     type FVar is new Formula with
--        record
--  	 FVar_Name : Name;
--        end record;
--     type Conn is new Formula with
--        record
--  	 Conn_Value : LConn_Access := null; 
--  	 Conn_Args : Formula_List_Access := null; --[Formula]
--        end record;
   
--     type Quant is new Formula with
--        record
--  	 Quant_Val : Quantifier;
--  	 Quant_Binders : Binder_Access := null;
--  	 Quant_Arg : Formula_Access := null;
--        end record;
--     type Let is new Formula with
--        record
--  	 Let_Name : Name;
--  	 Let_Term : Term_Access := null;
--  	 Let_Formula : Formula_Access := null;
--        end record;
--     type FLet is new Formula with
--        record
--  	 FLet_Name : Name;
--  	 FLet_Formula_1 : Formula_Access := null;
--  	 FLet_Formula_2 : Formula_Access := null;
--        end record;
--     type FAnnot is new Formula with
--        record
--  	 FAnnot_Formula : Formula_Access := null;
--  	 FAnnot_Annot : Annot_Access := null;
--        end record;
   
--     -- Completion of type of terms
--     type TVar is new Term with
--        record
--  	 TVar_Name : Name;
--        end record;
--     type TApp is new Term with
--        record
--  	 TApp_Ident : Ident;
--  	 TApp_Term_List : Term_List_Access := null;
--        end record;
--     type TLit is new Term with
--        record
--  	 TLit_Literal : Literal_Access := null;
--        end record;
--     type TIte is new Term with
--       record
--  	TIte_Formula : Formula_Access := null;
--  	TIte_Term_L : Term_Access := null;
--  	TIte_Term_R : Term_Access := null;
--       end record;
--     type TAnnot is new Term with
--        record
--  	 TAnnot_Term : Term_Access := null;
--  	 TAnnot_Annot : Annot_List_Access := null;
--        end record;
   
--     ----------------------------------------
--     -- Definition of function declarations -
--     ----------------------------------------
--     type Fun_Decl is new Ast_Abs with
--        record
--  	 Fun_Name : Ident;
--  	 Fun_Args : Sort_List_Access;
--  	 Fun_Res  : Sort;
--  	 Fun_Annots : Annot_List_Access;
--        end record;
--     type Fun_Decl_Access is access all Fun_Decl;
--     type Fun_Decl_List is array(Natural range <>) of Fun_Decl_Access;
--     type Fun_Decl_List_Access is access all Fun_Decl_List;
   
--     ---------------------------
--     -- Predicate declarations -
--     ---------------------------
--     type Pred_Decl is new Ast_Abs with
--        record
--  	 Pred_Name : Ident;
--  	 Pred_Args : Sort_List_Access;
--  	 Pred_Annots : Annot_List_Access;
--        end record;
--     type Pred_Decl_Access is access all Pred_Decl;
--     type Pred_Decl_List is array(Natural range <>) of Pred_Decl_Access;
--     type Pred_Decl_List_Access is access all Pred_Decl_List;

   
--     -----------------------
--     -- SMT result status --
--     -----------------------
--     type Status_Kind is (Sat,Unsat,Unknown);
--     type Status is new Ast_Abs with
--       record
--  	Status_Val : Status_Kind := Unknown;
--       end record;
   
--     -----------------------
--     -- Types of commands --
--     -----------------------
--     type Command is abstract new Ast_Abs with null record;
--     type Command_Access is access all Command'Class;
   
--     type Cmd_Logic is new Command with
--        record
--  	 Logic_Ident : Ident;
--        end record;
--     type Cmd_Assumption is new Command with
--        record
--  	 Assumption_Val : Formula_Access := null;
--        end record;
--     type Cmd_Formula is new Command with
--        record
--  	 Formula_Val : Formula_Access := null;
--        end record;
--     type Cmd_Status is new Command with
--        record
--  	 Status_Val : Status;
--        end record;
--     type Cmd_Extra_Sorts is new Command with
--        record
--  	 Extra_Sorts : Sort_List_Access;
--        end record;
--     type Cmd_Extra_Funs is new Command with
--        record
--  	 Extra_Funs : Fun_Decl_List_Access := null;
--        end record;
--     type Cmd_Extra_Preds is new Command with
--        record
--  	 Extra_Preds_Value : Pred_Decl_List_Access := null;
--        end record;
--     type Cmd_Notes is new Command with
--       record
--  	Notes : String_Access := null;
--       end record;
   
--     type Cmd_Annot is new Command with
--        record
--  	 Annot_Val : Annot ;
--        end record;
   
--     -- http://hackage.haskell.org/package/smtLib-1.0.2/docs/src/
   
--  --  -- aka "benchmark"
--  --  data Script = Script { scrName :: Ident, scrCommands :: [Command] }


--  --  --------------------------------------------------------------------------------
--  --  -- To make it a bit simpler to write terms in the above AST
--  --  -- we provide some instances.  They are intended to be used only
--  --  -- for writing simple literals, and not any of the computational
--  --  -- operations associated with the classes.

--  --  -- Strings
--  --  instance IsString Name      where fromString x = N x
--  --  instance IsString Ident     where fromString x = I (fromString x) []
--  --  instance IsString Term      where fromString x = Lit (LitStr x)

--  --  -- Integral operations
--  --  instance Num Term where
--  --    fromInteger = Lit . LitNum
--  --    x + y       = App "+" [x,y]
--  --    x - y       = App "-" [x,y]
--  --    x * y       = App "*" [x,y]
--  --    signum x    = App "signum" [x]
--  --    abs x       = App "abs" [x]

--  --  -- Fractional numbers
--  --  instance Fractional Term where
--  --    fromRational  = Lit . LitFrac . fromRational
--  --    x / y         = App "/" [x,y]

--  --  --------------------------------------------------------------------------------
--  --  -- XXX: move to a separate module?

--  --  (===) :: Term -> Term -> Formula
--  --  x === y   = FPred "=" [x,y]

--  --  (=/=) :: Term -> Term -> Formula
--  --  x =/= y   = FPred "distinct" [x,y]

--  --  -- | For 'Int'
--  --  (.<.) :: Term -> Term -> Formula
--  --  x .<. y   = FPred "<" [x,y]

--  --  -- | For 'Int'
--  --  (.>.) :: Term -> Term -> Formula
--  --  x .>. y   = FPred ">" [x,y]

--  --  tInt :: Sort
--  --  tInt = "Int"

--  --  funDef :: Ident -> [Sort] -> Sort -> Command
--  --  funDef x as b = CmdExtraFuns [ FunDecl { funName = x
--  --                                         , funArgs = as
--  --                                         , funRes = b
--  --                                         , funAnnots = []
--  --                                         } ]

--  --  constDef :: Ident -> Sort -> Command
--  --  constDef x t = funDef x [] t


--  --  logic :: Ident -> Command
--  --  logic = CmdLogic

--  --  assume :: Formula -> Command
--  --  assume = CmdAssumption

--  --  goal :: Formula -> Command
--  --  goal = CmdFormula
   
   
end Ast;
