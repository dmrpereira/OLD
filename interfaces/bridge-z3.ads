with Interfaces.C, Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
with System;

package Bridge.Z3 is
   
   pragma Preelaborate;
   
   --------------------------------------------------------------------------
   -- Main data structures provided by "z3_api.h". All are opaque pointers --
   --------------------------------------------------------------------------
   
   -- Configuration object used to initialize logical contexts.
   type Z3_Config is new System.Address;

   -- Manager of all other Z3 objects, global configuration options, etc.   
   type Z3_Context is new System.Address;

   -- Lisp-like symbol used to name types, constants, and functions.  
   -- A symbol can be created using string or integers.
   type Z3_Symbol is new System.Address;
   
   -- Abstract syntax tree node. 
   -- That is, the data-structure used in Z3 to represent terms, formulas and types.
   type Z3_Ast is new System.Address;
   
   subtype Z3_Ast_Opt is Z3_Ast;
   
   --  Kind of AST used to represent types.
   type Z3_Sort is new System.Address;

   subtype Z3_Sort_Opt is Z3_Sort;
   
   -- Kind of AST used to represent function symbols.
   type Z3_Func_Decl is new System.Address;
   
   -- Kind of AST used to represent function applications.
   type Z3_App is new System.Address;
   
   -- Kind of AST used to represent pattern and multi-patterns used to guide quantifier 
   -- instantiation.   
   type Z3_Pattern is new System.Address;

   -- Type constructor for a (recursive) datatype.   
   type Z3_Constructor is new System.Address;
   
   type Z3_Constructor_List is new System.Address;
   
   -- Parameter set used to configure many components such as: simplifiers, tactics, solvers, etc.
   type Z3_Params is new System.Address;

   type Z3_Param_Descrs is new System.Address;
   
   -- Model for the constraints asserted into the logical context.
   type Z3_Model is new System.Address;

   -- Interpretation of a function in a model.   
   type Z3_Func_Interp is new System.Address;

   -- Representation of the value of a [Z3_func_interp] at a particular point.   
   type Z3_Func_Entry is new System.Address;

   -- Context for the recursive predicate solver.   
   type Z3_Fixedpoint is new System.Address;

   -- Cector of [Z3_ast] objects.   
   type Z3_Ast_Vector is new System.Address;

   -- Mapping from [Z3_ast] to [Z3_ast] objects.   
   type Z3_Ast_Map is new System.Address;

   -- Set of formulas that can be solved and/or transformed using tactics and solvers.   
   type Z3_Goal is new System.Address;

   -- Basic building block for creating custom solvers for specific problem domains.   
   type Z3_Tactic is new System.Address;

   -- Function/predicate used to inspect a goal and collect information that may be used 
   -- to decide which solver and/or preprocessing step will be used.
   type Z3_Probe is new System.Address;
   
   -- Collection of subgoals resulting from applying of a tactic to a goal.
   type Z3_Apply_Result is new System.Address;

   -- (incremental) solver, possibly specialized by a particular tactic or logic.
   type Z3_Solver is new System.Address;
   
   -- Statistical data for a solver.
   type Z3_Stats is new System.Address;
         
      
   ---------------------
   -- Booleans --
   ---------------------
   
   Z3_TRUE : constant Interfaces.C.Int := 1;
   Z3_FALSE : constant Interfaces.C.Int := 0;    

   
   type Z3_Bool is new Interfaces.C.Int;
   
   subtype Z3_Bool_Opt is Z3_Bool;
   
   
   ---------------------------------
   -- Strings and string pointers --
   ---------------------------------
   type Z3_String is new Interfaces.C.Strings.Chars_Ptr;
   
   type Z3_String_Ptr is access all Z3_String;
   
   
   ---------------------
   -- Lifted Booleans --
   ---------------------
   type Z3_Lbool is 
     ( Z3_L_False, 
       Z3_L_Undef, 
       Z3_L_True );
   
   for Z3_Lbool use  
     ( Z3_L_False => -1, 
       Z3_L_Undef => 0, 
       Z3_L_True  => 1 );
   
   pragma Convention(C,Z3_lbool);
   
   ----------------
   -- Z3's kinds --
   ----------------
   
   -- The different kinds of symbol. In Z3, a symbol can be represented using 
   -- integers and strings (See #Z3_get_symbol_kind).                          
   type Z3_Symbol_Kind is 
     ( Z3_INT_SYMBOL, 
       Z3_STRING_SYMBOL );
   
   pragma Convention (C, Z3_symbol_kind);

   
   -- The different kinds of parameters that can be associated with function symbols
   type Z3_Parameter_Kind is
     ( Z3_PARAMETER_INT, -- integer parameters
       Z3_PARAMETER_DOUBLE, -- float parameters
       Z3_PARAMETER_RATIONAL, -- parameters that are rational numbers
       Z3_PARAMETER_SYMBOL, -- parameters that are symbols
       Z3_PARAMETER_SORT, -- sort parameters
       Z3_PARAMETER_AST, -- expression parameters
       Z3_PARAMETER_FUNC_DECL); -- function declaration parameters
   
   pragma Convention (C, Z3_parameter_kind);
   
   
   -- The different kinds of Z3 types
   type Z3_Sort_Kind is
     ( Z3_UNINTERPRETED_SORT,
       Z3_BOOL_SORT,
       Z3_INT_SORT,
       Z3_REAL_SORT,
       Z3_BV_SORT,
       Z3_ARRAY_SORT,
       Z3_DATATYPE_SORT,
       Z3_RELATION_SORT,
       Z3_FINITE_DOMAIN_SORT,
       Z3_UNKNOWN_SORT );
   
   for Z3_Sort_Kind use  
     ( Z3_UNINTERPRETED_SORT => 0,
       Z3_BOOL_SORT          => 1,
       Z3_INT_SORT           => 2,
       Z3_REAL_SORT          => 3,
       Z3_BV_SORT            => 4,
       Z3_ARRAY_SORT         => 5,
       Z3_DATATYPE_SORT      => 6,
       Z3_RELATION_SORT      => 7,
       Z3_FINITE_DOMAIN_SORT => 8,
       Z3_UNKNOWN_SORT       => 1000 );
   
   for Z3_Sort_Kind'Size use  Interfaces.C.Unsigned'Size;
   
   
   -- The different kinds of Z3 AST (abstract syntax trees). 
   -- That is, terms, formulas and types.
   type Z3_Ast_Kind is
     ( Z3_NUMERAL_AST,
       Z3_APP_AST,         
       Z3_VAR_AST,          
       Z3_QUANTIFIER_AST,    
       Z3_SORT_AST,
       Z3_FUNC_DECL_AST,
       Z3_UNKNOWN_AST );
   
   for Z3_Ast_Kind use  
     ( Z3_NUMERAL_AST    => 0,
       Z3_APP_AST        => 1,         
       Z3_VAR_AST        => 2,          
       Z3_QUANTIFIER_AST => 3,    
       Z3_SORT_AST       => 4,
       Z3_FUNC_DECL_AST  => 5,
       Z3_UNKNOWN_AST => 1000 );
   
   for Z3_Ast_Kind'Size use  Interfaces.C.Unsigned'Size;
			    
   
   type Z3_Decl_Kind is
     ( Z3_OP_TRUE,
       Z3_OP_FALSE,
       Z3_OP_EQ,
       Z3_OP_DISTINCT,
       Z3_OP_ITE,
       Z3_OP_AND,
       Z3_OP_OR,
       Z3_OP_IFF,
       Z3_OP_XOR,
       Z3_OP_NOT,
       Z3_OP_IMPLIES,
       Z3_OP_OEQ,

       -- Arithmetic
       Z3_OP_ANUM,
       Z3_OP_AGNUM,                
       Z3_OP_LE,
       Z3_OP_GE,
       Z3_OP_LT,
       Z3_OP_GT,
       Z3_OP_ADD,
       Z3_OP_SUB,
       Z3_OP_UMINUS,
       Z3_OP_MUL,
       Z3_OP_DIV,
       Z3_OP_IDIV,
       Z3_OP_REM,
       Z3_OP_MOD,
       Z3_OP_TO_REAL,
       Z3_OP_TO_INT,
       Z3_OP_IS_INT,
       Z3_OP_POWER,                

       -- Arrays & Sets
       Z3_OP_STORE,
       Z3_OP_SELECT,
       Z3_OP_CONST_ARRAY,
       Z3_OP_ARRAY_MAP,
       Z3_OP_ARRAY_DEFAULT,
       Z3_OP_SET_UNION,
       Z3_OP_SET_INTERSECT,
       Z3_OP_SET_DIFFERENCE,
       Z3_OP_SET_COMPLEMENT,
       Z3_OP_SET_SUBSET,
       Z3_OP_AS_ARRAY,

       -- Bit-vectors
       Z3_OP_BNUM,
       Z3_OP_BIT1,
       Z3_OP_BIT0,
       Z3_OP_BNEG,
       Z3_OP_BADD,
       Z3_OP_BSUB,
       Z3_OP_BMUL,
       
       Z3_OP_BSDIV,
       Z3_OP_BUDIV,
       Z3_OP_BSREM,
       Z3_OP_BUREM,
       Z3_OP_BSMOD,
       
       -- special functions to record the division by 0 cases
       -- these are internal functions 
       Z3_OP_BSDIV0, 
       Z3_OP_BUDIV0,
       Z3_OP_BSREM0,
       Z3_OP_BUREM0,
       Z3_OP_BSMOD0,
       
       Z3_OP_ULEQ,
       Z3_OP_SLEQ,
       Z3_OP_UGEQ,
       Z3_OP_SGEQ,
       Z3_OP_ULT,
       Z3_OP_SLT,
       Z3_OP_UGT,
       Z3_OP_SGT,

       Z3_OP_BAND,
       Z3_OP_BOR,
       Z3_OP_BNOT,
       Z3_OP_BXOR,
       Z3_OP_BNAND,
       Z3_OP_BNOR,
       Z3_OP_BXNOR,
       
       Z3_OP_CONCAT,
       Z3_OP_SIGN_EXT,
       Z3_OP_ZERO_EXT,
       Z3_OP_EXTRACT,
       Z3_OP_REPEAT,
       
       Z3_OP_BREDOR,
       Z3_OP_BREDAND,
       Z3_OP_BCOMP,

       Z3_OP_BSHL,
       Z3_OP_BLSHR,
       Z3_OP_BASHR,
       Z3_OP_ROTATE_LEFT,
       Z3_OP_ROTATE_RIGHT,
       Z3_OP_EXT_ROTATE_LEFT,
       Z3_OP_EXT_ROTATE_RIGHT,
       
       Z3_OP_INT2BV,
       Z3_OP_BV2INT,
       Z3_OP_CARRY,
       Z3_OP_XOR3,
    
       -- Proofs
       Z3_OP_PR_UNDEF,     
       Z3_OP_PR_TRUE,
       Z3_OP_PR_ASSERTED, 
       Z3_OP_PR_GOAL, 
       Z3_OP_PR_MODUS_PONENS, 
       Z3_OP_PR_REFLEXIVITY, 
       Z3_OP_PR_SYMMETRY, 
       Z3_OP_PR_TRANSITIVITY, 
       Z3_OP_PR_TRANSITIVITY_STAR, 
       Z3_OP_PR_MONOTONICITY, 
       Z3_OP_PR_QUANT_INTRO,
       Z3_OP_PR_DISTRIBUTIVITY, 
       Z3_OP_PR_AND_ELIM, 
       Z3_OP_PR_NOT_OR_ELIM, 
       Z3_OP_PR_REWRITE, 
       Z3_OP_PR_REWRITE_STAR, 
       Z3_OP_PR_PULL_QUANT, 
       Z3_OP_PR_PULL_QUANT_STAR, 
       Z3_OP_PR_PUSH_QUANT, 
       Z3_OP_PR_ELIM_UNUSED_VARS, 
       Z3_OP_PR_DER, 
       Z3_OP_PR_QUANT_INST,
       Z3_OP_PR_HYPOTHESIS, 
       Z3_OP_PR_LEMMA, 
       Z3_OP_PR_UNIT_RESOLUTION, 
       Z3_OP_PR_IFF_TRUE, 
       Z3_OP_PR_IFF_FALSE, 
       Z3_OP_PR_COMMUTATIVITY, 
       Z3_OP_PR_DEF_AXIOM,
       Z3_OP_PR_DEF_INTRO, 
       Z3_OP_PR_APPLY_DEF, 
       Z3_OP_PR_IFF_OEQ, 
       Z3_OP_PR_NNF_POS, 
       Z3_OP_PR_NNF_NEG, 
       Z3_OP_PR_NNF_STAR, 
       Z3_OP_PR_CNF_STAR, 
       Z3_OP_PR_SKOLEMIZE,
       Z3_OP_PR_MODUS_PONENS_OEQ, 
       Z3_OP_PR_TH_LEMMA, 
       Z3_OP_PR_HYPER_RESOLVE,

       -- Sequences
       Z3_OP_RA_STORE,
       Z3_OP_RA_EMPTY,
       Z3_OP_RA_IS_EMPTY,
       Z3_OP_RA_JOIN,
       Z3_OP_RA_UNION,
       Z3_OP_RA_WIDEN,
       Z3_OP_RA_PROJECT,
       Z3_OP_RA_FILTER,
       Z3_OP_RA_NEGATION_FILTER,
       Z3_OP_RA_RENAME,
       Z3_OP_RA_COMPLEMENT,
       Z3_OP_RA_SELECT,
       Z3_OP_RA_CLONE,
       Z3_OP_FD_LT,
       
       -- Auxiliary
       Z3_OP_LABEL,
       Z3_OP_LABEL_LIT,
       
       -- Datatypes
       Z3_OP_DT_CONSTRUCTOR,
       Z3_OP_DT_RECOGNISER,
       Z3_OP_DT_ACCESSOR,
       
       Z3_OP_UNINTERPRETED);
   
   for Z3_Decl_Kind use  
     ( Z3_OP_TRUE     => 16#100#,
       Z3_OP_FALSE    => 16#101#,
       Z3_OP_EQ       => 16#102#,
       Z3_OP_DISTINCT => 16#103#,
       Z3_OP_ITE      => 16#104#, 
       Z3_OP_AND      => 16#105#,
       Z3_OP_OR       => 16#106#,
       Z3_OP_IFF      => 16#107#,
       Z3_OP_XOR      => 16#108#,
       Z3_OP_NOT      => 16#109#,
       Z3_OP_IMPLIES  => 16#110#,
       Z3_OP_OEQ      => 16#111#,

       -- Arithmetic
       Z3_OP_ANUM    => 16#200#,
       Z3_OP_AGNUM   => 16#201#,                
       Z3_OP_LE      => 16#202#,
       Z3_OP_GE      => 16#203#,
       Z3_OP_LT      => 16#204#,
       Z3_OP_GT      => 16#205#,
       Z3_OP_ADD     => 16#206#,
       Z3_OP_SUB     => 16#207#,
       Z3_OP_UMINUS  => 16#208#,
       Z3_OP_MUL     => 16#209#,
       Z3_OP_DIV     => 16#210#,
       Z3_OP_IDIV    => 16#211#,
       Z3_OP_REM     => 16#212#,
       Z3_OP_MOD     => 16#213#,
       Z3_OP_TO_REAL => 16#214#,
       Z3_OP_TO_INT  => 16#215#,
       Z3_OP_IS_INT  => 16#216#,
       Z3_OP_POWER   => 16#217#,                

       -- Arrays & Sets
       Z3_OP_STORE          => 16#300#,
       Z3_OP_SELECT         => 16#301#,
       Z3_OP_CONST_ARRAY    => 16#302#,
       Z3_OP_ARRAY_MAP      => 16#303#,
       Z3_OP_ARRAY_DEFAULT  => 16#304#,
       Z3_OP_SET_UNION      => 16#305#,
       Z3_OP_SET_INTERSECT  => 16#306#,
       Z3_OP_SET_DIFFERENCE => 16#307#,
       Z3_OP_SET_COMPLEMENT => 16#308#,
       Z3_OP_SET_SUBSET     => 16#309#,
       Z3_OP_AS_ARRAY       => 16#310#,

       -- Bit-vectors
       Z3_OP_BNUM => 16#400#,
       Z3_OP_BIT1 => 16#401#,
       Z3_OP_BIT0 => 16#402#,
       Z3_OP_BNEG => 16#403#,
       Z3_OP_BADD => 16#404#,
       Z3_OP_BSUB => 16#405#,
       Z3_OP_BMUL => 16#406#,
       
       Z3_OP_BSDIV => 16#407#,
       Z3_OP_BUDIV => 16#408#,
       Z3_OP_BSREM => 16#409#,
       Z3_OP_BUREM => 16#410#,
       Z3_OP_BSMOD => 16#411#,
       
       -- special functions to record the division by 0 cases
       -- these are internal functions 
       Z3_OP_BSDIV0 => 16#412#, 
       Z3_OP_BUDIV0 => 16#413#,
       Z3_OP_BSREM0 => 16#414#,
       Z3_OP_BUREM0 => 16#415#,
       Z3_OP_BSMOD0 => 16#416#,
       
       Z3_OP_ULEQ => 16#417#,
       Z3_OP_SLEQ => 16#418#,
       Z3_OP_UGEQ => 16#419#,
       Z3_OP_SGEQ => 16#420#,
       Z3_OP_ULT  => 16#421#,
       Z3_OP_SLT  => 16#422#,
       Z3_OP_UGT  => 16#423#,
       Z3_OP_SGT  => 16#424#,

       Z3_OP_BAND  => 16#425#,
       Z3_OP_BOR   => 16#426#,
       Z3_OP_BNOT  => 16#427#,
       Z3_OP_BXOR  => 16#428#,
       Z3_OP_BNAND => 16#429#,
       Z3_OP_BNOR  => 16#430#,
       Z3_OP_BXNOR => 16#431#,
       
       Z3_OP_CONCAT   => 16#432#,
       Z3_OP_SIGN_EXT => 16#433#,
       Z3_OP_ZERO_EXT => 16#434#,
       Z3_OP_EXTRACT  => 16#435#,
       Z3_OP_REPEAT   => 16#436#,
       
       Z3_OP_BREDOR  => 16#437#,
       Z3_OP_BREDAND => 16#438#,
       Z3_OP_BCOMP   => 16#439#,

       Z3_OP_BSHL              => 16#440#,
       Z3_OP_BLSHR             => 16#441#,
       Z3_OP_BASHR             => 16#442#,
       Z3_OP_ROTATE_LEFT       => 16#443#,
       Z3_OP_ROTATE_RIGHT      => 16#444#,
       Z3_OP_EXT_ROTATE_LEFT   => 16#445#,
       Z3_OP_EXT_ROTATE_RIGHT  => 16#446#,
       
       Z3_OP_INT2BV => 16#447#,
       Z3_OP_BV2INT => 16#448#,
       Z3_OP_CARRY  => 16#449#,
       Z3_OP_XOR3   => 16#450#,
    
       -- Proofs
       Z3_OP_PR_UNDEF             => 16#500#,     
       Z3_OP_PR_TRUE              => 16#501#,
       Z3_OP_PR_ASSERTED          => 16#502#, 
       Z3_OP_PR_GOAL              => 16#503#, 
       Z3_OP_PR_MODUS_PONENS      => 16#504#, 
       Z3_OP_PR_REFLEXIVITY       => 16#505#, 
       Z3_OP_PR_SYMMETRY          => 16#506#, 
       Z3_OP_PR_TRANSITIVITY      => 16#507#, 
       Z3_OP_PR_TRANSITIVITY_STAR => 16#508#, 
       Z3_OP_PR_MONOTONICITY      => 16#509#, 
       Z3_OP_PR_QUANT_INTRO       => 16#510#,
       Z3_OP_PR_DISTRIBUTIVITY    => 16#511#, 
       Z3_OP_PR_AND_ELIM          => 16#512#, 
       Z3_OP_PR_NOT_OR_ELIM       => 16#513#, 
       Z3_OP_PR_REWRITE           => 16#514#, 
       Z3_OP_PR_REWRITE_STAR      => 16#515#, 
       Z3_OP_PR_PULL_QUANT        => 16#516#, 
       Z3_OP_PR_PULL_QUANT_STAR   => 16#517#, 
       Z3_OP_PR_PUSH_QUANT        => 16#518#, 
       Z3_OP_PR_ELIM_UNUSED_VARS  => 16#519#, 
       Z3_OP_PR_DER               => 16#520#, 
       Z3_OP_PR_QUANT_INST        => 16#521#,
       Z3_OP_PR_HYPOTHESIS        => 16#522#, 
       Z3_OP_PR_LEMMA             => 16#523#, 
       Z3_OP_PR_UNIT_RESOLUTION   => 16#524#, 
       Z3_OP_PR_IFF_TRUE          => 16#525#, 
       Z3_OP_PR_IFF_FALSE         => 16#526#, 
       Z3_OP_PR_COMMUTATIVITY     => 16#527#, 
       Z3_OP_PR_DEF_AXIOM         => 16#528#,
       Z3_OP_PR_DEF_INTRO         => 16#529#, 
       Z3_OP_PR_APPLY_DEF         => 16#530#, 
       Z3_OP_PR_IFF_OEQ           => 16#531#, 
       Z3_OP_PR_NNF_POS           => 16#532#, 
       Z3_OP_PR_NNF_NEG           => 16#533#, 
       Z3_OP_PR_NNF_STAR          => 16#534#, 
       Z3_OP_PR_CNF_STAR          => 16#535#, 
       Z3_OP_PR_SKOLEMIZE         => 16#536#,
       Z3_OP_PR_MODUS_PONENS_OEQ  => 16#537#, 
       Z3_OP_PR_TH_LEMMA          => 16#538#, 
       Z3_OP_PR_HYPER_RESOLVE     => 16#539#,

       -- Sequences
       Z3_OP_RA_STORE            => 16#600#,
       Z3_OP_RA_EMPTY            => 16#601#, 
       Z3_OP_RA_IS_EMPTY         => 16#602#,
       Z3_OP_RA_JOIN             => 16#603#,
       Z3_OP_RA_UNION            => 16#604#,
       Z3_OP_RA_WIDEN            => 16#605#,
       Z3_OP_RA_PROJECT          => 16#606#,
       Z3_OP_RA_FILTER           => 16#607#,
       Z3_OP_RA_NEGATION_FILTER  => 16#608#,
       Z3_OP_RA_RENAME           => 16#609#,
       Z3_OP_RA_COMPLEMENT       => 16#610#,
       Z3_OP_RA_SELECT           => 16#611#,
       Z3_OP_RA_CLONE            => 16#612#,
       Z3_OP_FD_LT               => 16#613#,
       
       -- Auxiliary
       Z3_OP_LABEL     => 16#700#,
       Z3_OP_LABEL_LIT => 16#701#,
       
       -- Datatypes
       Z3_OP_DT_CONSTRUCTOR => 16#800#,
       Z3_OP_DT_RECOGNISER  => 16#801#,
       Z3_OP_DT_ACCESSOR    => 16#802#,
       
       Z3_OP_UNINTERPRETED  => 16#803#);
   pragma Convention(C, Z3_decl_kind );
   
   
   -- The different kinds of parameters that can be associated with parameter sets.
   type Z3_param_kind is 
     (Z3_PK_UINT,
      Z3_PK_BOOL,
      Z3_PK_DOUBLE,
      Z3_PK_SYMBOL,
      Z3_PK_STRING,
      Z3_PK_OTHER,
      Z3_PK_INVALID);
   pragma Convention (C, Z3_param_kind);  
   
   
   -- The different kinds of search failure types.
   type Z3_search_failure is 
     (Z3_NO_FAILURE,
      Z3_UNKNOWN,
      Z3_TIMEOUT,
      Z3_MEMOUT_WATERMARK,
      Z3_CANCELED,
      Z3_NUM_CONFLICTS,
      Z3_THEORY,
      Z3_QUANTIFIERS);
   pragma Convention (C, Z3_search_failure);  
   
   
   -- Z3 pretty printing modes
   type Z3_ast_print_mode is 
     (Z3_PRINT_SMTLIB_FULL,
      Z3_PRINT_LOW_LEVEL,
      Z3_PRINT_SMTLIB_COMPLIANT,
      Z3_PRINT_SMTLIB2_COMPLIANT);
   pragma Convention (C, Z3_ast_print_mode);  
   
   
   -- Z3 error codes
   type Z3_error_code is 
     (Z3_OK,
      Z3_SORT_ERROR,
      Z3_IOB,
      Z3_INVALID_ARG,
      Z3_PARSER_ERROR,
      Z3_NO_PARSER,
      Z3_INVALID_PATTERN,
      Z3_MEMOUT_FAIL,
      Z3_FILE_ACCESS_ERROR,
      Z3_INTERNAL_FATAL,
      Z3_INVALID_USAGE,
      Z3_DEC_REF_ERROR,
      Z3_EXCEPTION);
   pragma Convention (C, Z3_error_code); 
   
   
   -- 
   type Z3_goal_prec is 
     (Z3_GOAL_PRECISE,
      Z3_GOAL_UNDER,
      Z3_GOAL_OVER,
      Z3_GOAL_UNDER_OVER);
   pragma Convention (C, Z3_goal_prec);
   
   procedure Z3_Error_Handler(C:in Z3_Context;E:in Z3_Error_Code);
   pragma Import(C,Z3_Error_Handler,"Z3_error_handler");
      
   
   
   type Z3_Symbol_Array is array(Integer range <>) of Z3_Symbol;
   pragma Convention(C,Z3_Symbol_Array);
   
   type Z3_Sort_Array is array(Integer range <>) of Z3_Sort;
   pragma Convention(C,Z3_Sort_Array);
   
   type Z3_Func_Decl_Array is array(Integer range <>) of Z3_Func_Decl;
   pragma Convention(C,Z3_Func_Decl_Array);
      
   type Z3_Func_Decl_Access is access all Z3_Func_Decl;
   
   type Z3_Constructor_Array is array(Integer range <>) of Z3_Constructor;
   pragma Convention(C,Z3_Constructor_Array);
   
   type Z3_Sort_Opt_Array is array(Integer range <>) of Z3_Sort_Opt;
   
   type Unsigned_Array is array(Integer range <>) of Interfaces.C.Unsigned;
   
   --------------------------------
   -- Constants and applications --
   --------------------------------
   
   -- Declare a constant or function.
   function Z3_Mk_Func_Decl(C:in Z3_Context;
			    S:in Z3_Symbol;
			    Domain_Size:in Interfaces.C.Int;
			    Domain:in Z3_Sort_Array;
			    R:in Z3_Sort) return Z3_Func_Decl;
   pragma Import(C,Z3_Mk_Func_Decl,"Z3_mk_func_decl");
   
   type Z3_Ast_Array is array(Integer range <>) of Z3_Ast;
   
   -- Create a constant or function application.
   function Z3_Mk_App(C:in Z3_Context;
		      D:in Z3_Func_Decl;
		      Num_Args:in Interfaces.C.Unsigned;
		      Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_App,"Z3_mk_app");
   
   -- Declare and create a constant.
   function Z3_Mk_Const(C:in Z3_Context;S:in Z3_Symbol;Ty:in Z3_Sort) return Z3_Ast;
   pragma Import(C,Z3_Mk_Const,"Z3_mk_const");
   
   -- Declare a fresh constant or function.
   function Z3_Mk_Fresh_Func_Decl(C:in Z3_Context; 
				  Prefix:in Z3_String;
				  Domain_Size:in Interfaces.C.Int;
				  Domain:in Z3_Sort_Array;
				  R:in Z3_Sort) return Z3_Func_Decl;
   pragma Import(C,Z3_Mk_Fresh_Func_Decl,"Z3_mk_fresh_func_decl");
   
   -- Declare and create a fresh constant.
   function Z3_Mk_Fresh_Const(C:in Z3_Context;Prefix:in Z3_String;Ty:in Z3_Sort) return Z3_Ast;
   pragma Import(C,Z3_Mk_Fresh_Const,"Z3_mk_fresh_const");
   
   -- Create an AST node representing \c true.
   function Z3_Mk_True(C:in Z3_Context) return Z3_Ast;
   pragma Import(C,Z3_Mk_True,"Z3_mk_true");
   
   -- Create an AST node representing \c false.
   function Z3_Mk_False(C:in Z3_Context) return Z3_Ast;
   pragma Import(C,Z3_Mk_False,"Z3_mk_false");
   
   -- Create an AST node representing <tt>l = r</tt>.
   function Z3_Mk_Eq(C:in Z3_Context;L:in Z3_Ast;R:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Eq,"Z3_mk_eq");
   
   -- Create an AST node represeting a distinct construct. It is used for declaring
   -- the arguments t_i pairwise distinct.
   function Z3_Mk_Distinct(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_Distinct,"Z3_mk_distinct");
      
   -- Create an AST node representing not(a). 
   function Z3_Mk_Not(C:in Z3_Context;A:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Not,"Z3_mk_not");

   --  	Create an AST node representing an if-then-else: ite(t1, t2, t3). 
   function Z3_Mk_Ite(C:in Z3_Context;T1, T2, T3:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Ite,"Z3_mk_ite");
  
   -- Create an AST node representing t1 iff t2. 
   function Z3_Mk_Iff(C:in Z3_Context;T1, T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Iff,"Z3_mk_iff");
   
   -- Create an AST node representing t1 implies t2. 
   function Z3_Mk_Implies(C:in Z3_Context;T1, T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Implies,"Z3_mk_implies");
 
   --  	Create an AST node representing t1 xor t2. 
   function Z3_Mk_Xor(C:in Z3_Context;T1, T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Xor,"Z3_mk_xor");

   -- Create an AST node representing args[0] and ... and args[num_args-1].
   -- The array args must have num_args elements. 
   -- All arguments must have Boolean sort. 
   function Z3_Mk_And(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_And,"Z3_mk_and");
   
   -- Create an AST node representing args[0] or ... or args[num_args-1].
   -- The array args must have num_args elements.
   -- All arguments must have Boolean sort. 
   function Z3_Mk_Or(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_Or,"Z3_mk_or");
   
   ------------------------------------
   -- Arithmetic: Integers and Reals --
   ------------------------------------
   
   -- Create an AST node representing args[0] + ... + args[num_args-1].
   -- The array args must have num_args elements. 
   -- All arguments must have int or real sort. 
   function Z3_Mk_Add(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_Add,"Z3_mk_add");
   
   -- Create an AST node representing args[0] * ... * args[num_args-1].
   -- The array args must have num_args elements.
   -- All arguments must have int or real sort. 
   function Z3_Mk_Mul(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_Mul,"Z3_mk_mul");

   -- Create an AST node representing args[0] - ... - args[num_args - 1].
   -- The array args must have num_args elements.
   -- All arguments must have int or real sort. 
   function Z3_Mk_Sub(C:in Z3_Context;Num_Args:in Interfaces.C.Unsigned;Args:in Z3_Ast_Array) return Z3_Ast;
   pragma Import(C,Z3_Mk_Sub,"Z3_mk_sub");

   -- Create an AST node representing -arg.The arguments must have int or real type. 
   function Z3_Mk_Unary_Minus(C:in Z3_Context;Arg:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Unary_Minus,"Z3_mk_unary_minus");

   -- Create an AST node representing arg1 div arg2.
   -- The arguments must either both have int type or both have real type.
   -- If the arguments have int type, then the result type is an int type, otherwise the the result type is real. 
   function Z3_Mk_Div(C:in Z3_Context ; Arg1, Arg2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Div,"Z3_mk_div");

   --  	Create an AST node representing arg1 mod arg2.The arguments must have int type. 
   function Z3_Mk_Mod(C:in Z3_Context ; Arg1, Arg2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Mod,"Z3_mk_mod");

   --  	Create an AST node representing arg1 rem arg2.The arguments must have int type. 
   function Z3_Mk_Rem(C:in Z3_Context ; Arg1, Arg2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Rem,"Z3_mk_rem");
   
   --  	Create an AST node representing arg1^arg2. 
   function Z3_Mk_Power(C:in Z3_Context ; Arg1, Arg2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Power,"Z3_mk_power");

   -- 	Create less than. 
   function Z3_Mk_Lt(C:in Z3_Context ; T1, T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Lt,"Z3_mk_lt");

   -- 	Create less than or equal to. 
   function Z3_Mk_Le(C:in Z3_Context;T1, T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Le,"Z3_mk_le");

   -- 	Create greater than. 
   function Z3_Mk_Gt(C:in Z3_Context;T1,T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Gt,"Z3_mk_gt");

   --	Create greater than or equal to. 
   function Z3_Mk_Ge(C:in Z3_Context;T1,T2:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Ge,"Z3_mk_ge");
   
   --  	Coerce an integer to a real. 
   function Z3_Mk_Int2real(C:in Z3_Context;T1:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Int2real,"Z3_mk_int2real");

   -- Coerce a real to an integer.  
   function Z3_Mk_Real2int(C:in Z3_Context;T1:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Real2int,"Z3_mk_real2int");

   -- Check if a real number is an integer.  
   function Z3_Mk_Is_Int(C:in Z3_Context;T1:in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Is_Int,"Z3_mk_is_int");
   
   -----------------
   -- Bit-vectors --
   -----------------
   
   --  	Bitwise negation. 
   function Z3_Mk_Bvnot( C : in Z3_Context ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvnot,"Z3_mk_bvnot");

   -- 	Take conjunction of bits in vector, return vector of length 1.  
   function Z3_Mk_Bvredand( C : in Z3_Context ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvredand,"Z3_mk_bvredand");
   
   -- Take disjunction of bits in vector, return vector of length 1. 
   function Z3_Mk_Bvredor( C : in Z3_Context ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvredor,"Z3_mk_bvredor");

   -- Bitwise and. 
   function Z3_Mk_Bvand( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvand,"Z3_mk_bvand"); 
 
   -- Bitwise or. 
   function Z3_Mk_Bvor( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvor,"Z3_mk_bvor");
   
   -- Bitwise exclusive-or. 
   function Z3_Mk_Bvxor( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvxor,"Z3_mk_bvxor");

   -- Bitwise nand. 
   function Z3_Mk_Bvnand( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvnand,"Z3_mk_bvnand");

   -- Bitwise nor
   function Z3_Mk_Bvnor( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvnor,"Z3_mk_bvnor");

   -- Bitwise xnor. 
   function Z3_Mk_Bvxnor( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvxnor,"Z3_mk_bvxnor");
   
   -- Standard two's complement unary minus. 
   function Z3_Mk_Bvneg( C : in Z3_Context ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvneg,"Z3_mk_bvneg");
   
   -- Standard two's complement addition.    
   function Z3_Mk_Bvadd( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvadd,"Z3_mk_bvadd");

   -- Standard two's complement subtraction.    
   function Z3_Mk_Bvsub( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsub,"Z3_mk_bvsub");

   -- Standard two's complement multiplication. 
   function Z3_Mk_Bvmul( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvmul,"Z3_mk_bvmul");
      
   -- Unsigned division.    
   function Z3_Mk_Bvudiv( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvudiv,"Z3_mk_bvudiv");

   -- Two's complement signed division.       
   function Z3_Mk_Bvsdiv( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsdiv,"Z3_mk_bvsdiv");

   -- Unsigned remainder. 
   function Z3_Mk_Bvurem( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvurem,"Z3_mk_bvurem");

   -- Two's complement signed remainder (sign follows dividend).       
   function Z3_Mk_Bvsrem( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsrem,"Z3_mk_bvsrem");

   -- Two's complement signed remainder (sign follows divisor).    
   function Z3_Mk_Bvsmod( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsmod,"Z3_mk_bvsmod");

   -- Unsigned less than.       
   function Z3_Mk_Bvult( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvult,"Z3_mk_bvult");

   -- Two's complement signed less than. 
   function Z3_Mk_Bvslt( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvslt,"Z3_mk_bvslt");
      
   -- Unsigned less than or equal to.    
   function Z3_Mk_Bvule( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvule,"Z3_mk_bvule");

   -- Two's complement signed less than or equal to. 
   function Z3_Mk_Bvsle( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsle,"Z3_mk_bvsle");

   -- Unsigned greater than or equal to.       
   function Z3_Mk_Bvuge( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvuge,"Z3_mk_bvuge");

   -- Two's complement signed greater than or equal to.       
   function Z3_Mk_Bvsge( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsge,"Z3_mk_bvsge");

   -- Unsigned greater than. 
   function Z3_Mk_Bvugt( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvugt,"Z3_mk_bvugt");
      
   -- Two's complement signed greater than.    
   function Z3_Mk_Bvsgt( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsgt,"Z3_mk_bvsgt");
   
   -- Concatenate the given bit-vectors. 
   function Z3_Mk_Concat( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Concat,"Z3_mk_concat");
   
   -- Extract the bits high down to low from a bitvector of size m to yield a new bitvector of size n, where n = high - low + 1. 
   function Z3_Mk_Extract( C : in Z3_Context ; High, Low : in Interfaces.C.Unsigned ; T1 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Extract,"Z3_mk_extract");

   -- Sign-extend of the given bit-vector to the (signed) equivalent bitvector of size m+i, where m is the size of the given bit-vector. 
   function Z3_Mk_Sign_Ext( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Sign_Ext,"Z3_mk_sign_ext");
   
   -- Extend the given bit-vector with zeros to the (unsigned) equivalent bitvector of size m+i, where m is the size of the given bit-vector.    
   function Z3_Mk_Zero_Ext( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Zero_Ext,"Z3_mk_zero_ext");

   -- Repeat the given bit-vector up length i.       
   function Z3_Mk_Repeat( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Repeat,"Z3_mk_repeat");

   -- Shift left. 
   function Z3_Mk_Bvshl( C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvshl,"Z3_mk_bvshl");

   -- Logical shift right.  
   function Z3_Mk_Bvlshr(  C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvlshr,"Z3_mk_bvlshr");

   -- Arithmetic shift right.  
   function Z3_Mk_Bvashr(  C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvashr,"Z3_mk_bvashr");

   -- Rotate bits of t1 to the left i times. 	 
   function Z3_Mk_Rotate_Left( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Rotate_Left,"Z3_mk_rotate_left");

   -- Rotate bits of t1 to the right i times. 	    
   function Z3_Mk_Rotate_Right( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Rotate_Right,"Z3_mk_rotate_right");

   -- Rotate bits of t1 to the left t2 times. 	       
   function Z3_Mk_Ext_Rotate_Left( C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Ext_Rotate_Left,"Z3_mk_ext_rotate_left");

   -- Rotate bits of t1 to the right t2 times.  
   function Z3_Mk_Ext_Rotate_Right(  C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Ext_Rotate_Right,"Z3_mk_ext_rotate_right");

   -- Create an n bit bit-vector from the integer argument t1. 	       
   function Z3_Mk_Int2bv( C : in Z3_Context ; I : in Interfaces.C.Unsigned ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Int2bv,"Z3_mk_int2bv");
   
   -- Create an integer from the bit-vector argument t1. 
   -- If is_signed is false, then the bit-vector t1 is treated as unsigned. 
   -- So the result is non-negative and in the range [0..2^N-1], where N are the number of bits in t1.
   -- If is_signed is true, t1 is treated as a signed bit-vector. 
   function Z3_Mk_Bv2int( C : in Z3_Context ; T1 : in Z3_Ast ; Is_Signed : Z3_Bool ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bv2int,"Z3_mk_bv2int");
   
   -- Create a predicate that checks that the bit-wise addition of t1 and t2 does not overflow. 
   function Z3_Mk_Bvadd_No_Overflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ; Is_Signed : in Z3_Bool ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvadd_No_Overflow,"Z3_mk_bvadd_no_overflow");

   -- Create a predicate that checks that the bit-wise signed addition of t1 and t2 does not underflow.  
   function Z3_Mk_Bvadd_No_Underflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvadd_No_Underflow,"Z3_mk_bvadd_no_underflow");

   -- Create a predicate that checks that the bit-wise signed subtraction of t1 and t2 does not overflow.  
   function Z3_Mk_Bvsub_No_Overflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsub_No_Overflow,"Z3_mk_bvsub_no_overflow");

   -- Create a predicate that checks that the bit-wise subtraction of t1 and t2 does not underflow. 
   function Z3_Mk_Bvsub_No_Underflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsub_No_Underflow,"Z3_mk_bvsub_no_underflow");
   
   -- Create a predicate that checks that the bit-wise signed division of t1 and t2 does not overflow. 
   function Z3_Mk_Bvsdiv_No_Overflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvsdiv_No_Overflow,"Z3_mk_bvsdiv_no_overflow");
   
   -- Check that bit-wise negation does not overflow when t1 is interpreted as a signed bit-vector.    
   function Z3_Mk_Bvneg_No_Overflow( C : in Z3_Context ; T1 : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvneg_No_Overflow,"Z3_mk_bvneg_no_overflow");

   -- Create a predicate that checks that the bit-wise multiplication of t1 and t2 does not overflow.  
   function Z3_Mk_Bvmul_No_Overflow( C : in Z3_Context ; T1, T2 : in Z3_Ast ; Is_Signed : in Z3_Bool ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvmul_No_Overflow,"Z3_mk_bvmul_no_overflow");

   -- Create a predicate that checks that the bit-wise signed multiplication of t1 and t2 does not underflow.  
   function Z3_Mk_Bvmul_No_Underflow( C : in Z3_Context ; T1, T2 : Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Bvmul_No_Underflow,"Z3_mk_bvmul_no_underflow");
   
   ------------
   -- Arrays --
   ------------
   
   -- Array read. The argument a is the array and i is the index of the array that gets read. 
   function Z3_Mk_Select( C : in Z3_Context ; A, I : in Z3_Ast ) return Z3_Ast; 
   pragma Import(C,Z3_Mk_Select,"Z3_mk_select");
 
   -- Array update. 
   function Z3_Mk_Store( C : in Z3_Context ; A, I, V : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Store,"Z3_mk_store");

   -- Create the constant array. 
   function Z3_Mk_Const_Array(C: in Z3_Context ; Domain : in Z3_Sort ; V : in Z3_Ast) return Z3_Ast;
   pragma Import(C,Z3_Mk_Const_Array,"Z3_mk_const_array");

   -- Map f on the the argument arrays.  
   function Z3_Mk_Map(C : in Z3_Context ; F : in Z3_Func_Decl ; N : access constant Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Map,"Z3_mk_map");

   -- Access the array default value. Produces the default range value,
   -- for arrays that can be represented as finite maps with a default range value. 
   function Z3_Mk_Array_Default( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Ast;
   pragma Import(C,Z3_Mk_Array_Default,"z3_mk_array_default");
 
--  Sets
--  Z3_sort Z3_API 	Z3_mk_set_sort (__in Z3_context c, __in Z3_sort ty)
--   	Create Set type. 
 
--  Z3_ast Z3_API 	Z3_mk_empty_set (__in Z3_context c, __in Z3_sort domain)
--   	Create the empty set. 
 
--  Z3_ast Z3_API 	Z3_mk_full_set (__in Z3_context c, __in Z3_sort domain)
--   	Create the full set. 
 
--  Z3_ast Z3_API 	Z3_mk_set_add (__in Z3_context c, __in Z3_ast set, __in Z3_ast elem)
--   	Add an element to a set. 
 
--  Z3_ast Z3_API 	Z3_mk_set_del (__in Z3_context c, __in Z3_ast set, __in Z3_ast elem)
--   	Remove an element to a set. 
 
--  Z3_ast Z3_API 	Z3_mk_set_union (__in Z3_context c, __in unsigned num_args, __in_ecount(num_args) Z3_ast const args[])
--   	Take the union of a list of sets. 
 
--  Z3_ast Z3_API 	Z3_mk_set_intersect (__in Z3_context c, __in unsigned num_args, __in_ecount(num_args) Z3_ast const args[])
--   	Take the intersection of a list of sets. 
 
--  Z3_ast Z3_API 	Z3_mk_set_difference (__in Z3_context c, __in Z3_ast arg1, __in Z3_ast arg2)
--   	Take the set difference between two sets. 
 
--  Z3_ast Z3_API 	Z3_mk_set_complement (__in Z3_context c, __in Z3_ast arg)
--   	Take the complement of a set. 
 
--  Z3_ast Z3_API 	Z3_mk_set_member (__in Z3_context c, __in Z3_ast elem, __in Z3_ast set)
--   	Check for set membership. 
 
--  Z3_ast Z3_API 	Z3_mk_set_subset (__in Z3_context c, __in Z3_ast arg1, __in Z3_ast arg2)
--   	Check for subsetness of sets. 
   
--     Numerals
--  Z3_ast Z3_API 	Z3_mk_numeral (__in Z3_context c, __in Z3_string numeral, __in Z3_sort ty)
--   	Create a numeral of a given sort. 
 
--  Z3_ast Z3_API 	Z3_mk_real (__in Z3_context c, __in int num, __in int den)
--   	Create a real from a fraction. 
 
--  Z3_ast Z3_API 	Z3_mk_int (__in Z3_context c, __in int v, __in Z3_sort ty)
--   	Create a numeral of an int, bit-vector, or finite-domain sort. 
 
--  Z3_ast Z3_API 	Z3_mk_unsigned_int (__in Z3_context c, __in unsigned v, __in Z3_sort ty)
--   	Create a numeral of a int, bit-vector, or finite-domain sort. 
 
--  Z3_ast Z3_API 	Z3_mk_int64 (__in Z3_context c, __in __int64 v, __in Z3_sort ty)
--   	Create a numeral of a int, bit-vector, or finite-domain sort. 
 
--  Z3_ast Z3_API 	Z3_mk_unsigned_int64 (__in Z3_context c, __in unsigned __int64 v, __in Z3_sort ty)
--   	Create a numeral of a int, bit-vector, or finite-domain sort. 
 
--  Quantifiers
--  Z3_pattern Z3_API 	Z3_mk_pattern (__in Z3_context c, __in unsigned num_patterns, __in_ecount(num_patterns) Z3_ast const terms[])
--   	Create a pattern for quantifier instantiation. 
 
--  Z3_ast Z3_API 	Z3_mk_bound (__in Z3_context c, __in unsigned index, __in Z3_sort ty)
--   	Create a bound variable. 
 
--  Z3_ast Z3_API 	Z3_mk_forall (__in Z3_context c, __in unsigned weight, __in unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in unsigned num_decls, __in_ecount(num_decls) Z3_sort const sorts[], __in_ecount(num_decls) Z3_symbol const decl_names[], __in Z3_ast body)
--   	Create a forall formula. It takes an expression body that contains bound variables of the same sorts as the sorts listed in the array sorts. The bound variables are de-Bruijn indices created using Z3_mk_bound. The array decl_names contains the names that the quantified formula uses for the bound variables. Z3 applies the convention that the last element in the decl_names and sorts array refers to the variable with index 0, the second to last element of decl_names and sorts refers to the variable with index 1, etc. 
 
--  Z3_ast Z3_API 	Z3_mk_exists (__in Z3_context c, __in unsigned weight, __in unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in unsigned num_decls, __in_ecount(num_decls) Z3_sort const sorts[], __in_ecount(num_decls) Z3_symbol const decl_names[], __in Z3_ast body)
--   	Create an exists formula. Similar to Z3_mk_forall. 
 
--  Z3_ast Z3_API 	Z3_mk_quantifier (__in Z3_context c, __in Z3_bool is_forall, __in unsigned weight, __in unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in unsigned num_decls, __in_ecount(num_decls) Z3_sort const sorts[], __in_ecount(num_decls) Z3_symbol const decl_names[], __in Z3_ast body)
--   	Create a quantifier - universal or existential, with pattern hints. See the documentation for Z3_mk_forall for an explanation of the parameters. 
 
--  Z3_ast Z3_API 	Z3_mk_quantifier_ex (__in Z3_context c, __in Z3_bool is_forall, __in unsigned weight, __in Z3_symbol quantifier_id, __in Z3_symbol skolem_id, __in unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in unsigned num_no_patterns, __in_ecount(num_no_patterns) Z3_ast const no_patterns[], __in unsigned num_decls, __in_ecount(num_decls) Z3_sort const sorts[], __in_ecount(num_decls) Z3_symbol const decl_names[], __in Z3_ast body)
--   	Create a quantifier - universal or existential, with pattern hints, no patterns, and attributes. 
 
--  Z3_ast Z3_API 	Z3_mk_forall_const (__in Z3_context c, unsigned weight, unsigned num_bound, __in_ecount(num_bound) Z3_app const bound[], unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in Z3_ast body)
--   	Create a universal quantifier using a list of constants that will form the set of bound variables. 
 
--  Z3_ast Z3_API 	Z3_mk_exists_const (__in Z3_context c, unsigned weight, unsigned num_bound, __in_ecount(num_bound) Z3_app const bound[], unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in Z3_ast body)
--   	Similar to Z3_mk_forall_const. 
 
--  Z3_ast Z3_API 	Z3_mk_quantifier_const (__in Z3_context c, Z3_bool is_forall, unsigned weight, unsigned num_bound, __in_ecount(num_bound) Z3_app const bound[], unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], __in Z3_ast body)
--   	Create a universal or existential quantifier using a list of constants that will form the set of bound variables. 
 
--  Z3_ast Z3_API 	Z3_mk_quantifier_const_ex (__in Z3_context c, Z3_bool is_forall, unsigned weight, __in Z3_symbol quantifier_id, __in Z3_symbol skolem_id, unsigned num_bound, __in_ecount(num_bound) Z3_app const bound[], unsigned num_patterns, __in_ecount(num_patterns) Z3_pattern const patterns[], unsigned num_no_patterns, __in_ecount(num_no_patterns) Z3_ast const no_patterns[], __in Z3_ast body)
--   	Create a universal or existential quantifier using a list of constants that will form the set of bound variables. 
 
--  Accessors
--  Z3_symbol_kind Z3_API 	Z3_get_symbol_kind (__in Z3_context c, __in Z3_symbol s)
--   	Return Z3_INT_SYMBOL if the symbol was constructed using Z3_mk_int_symbol, and Z3_STRING_SYMBOL if the symbol was constructed using Z3_mk_string_symbol. 
 
--  int Z3_API 	Z3_get_symbol_int (__in Z3_context c, __in Z3_symbol s)
--   	Return the symbol int value. 
 
--  Z3_string Z3_API 	Z3_get_symbol_string (__in Z3_context c, __in Z3_symbol s)
--   	Return the symbol name. 
 
--  Z3_symbol Z3_API 	Z3_get_sort_name (__in Z3_context c, __in Z3_sort d)
--   	Return the sort name as a symbol. 
 
--  unsigned Z3_API 	Z3_get_sort_id (__in Z3_context c, Z3_sort s)
--   	Return a unique identifier for s. 
 
--  Z3_ast Z3_API 	Z3_sort_to_ast (__in Z3_context c, __in Z3_sort s)
--   	Convert a Z3_sort into Z3_ast. This is just type casting. 
 
--  Z3_bool Z3_API 	Z3_is_eq_sort (__in Z3_context c, __in Z3_sort s1, __in Z3_sort s2)
--   	compare sorts. 
 
--  Z3_sort_kind Z3_API 	Z3_get_sort_kind (__in Z3_context c, __in Z3_sort t)
--   	Return the sort kind (e.g., array, tuple, int, bool, etc). 
 
--  unsigned Z3_API 	Z3_get_bv_sort_size (__in Z3_context c, __in Z3_sort t)
--   	Return the size of the given bit-vector sort. 
 
--  Z3_bool Z3_API 	Z3_get_finite_domain_sort_size (__in Z3_context c, __in Z3_sort s, __out unsigned __int64 *r)
--   	Store the size of the sort in r. Return Z3_FALSE if the call failed. That is, Z3_get_sort_kind(s) == Z3_FINITE_DOMAIN_SORT. 
 
--  Z3_sort Z3_API 	Z3_get_array_sort_domain (__in Z3_context c, __in Z3_sort t)
--   	Return the domain of the given array sort. 
 
--  Z3_sort Z3_API 	Z3_get_array_sort_range (__in Z3_context c, __in Z3_sort t)
--   	Return the range of the given array sort. 
 
--  Z3_func_decl Z3_API 	Z3_get_tuple_sort_mk_decl (__in Z3_context c, __in Z3_sort t)
--   	Return the constructor declaration of the given tuple sort. 
 
--  unsigned Z3_API 	Z3_get_tuple_sort_num_fields (__in Z3_context c, __in Z3_sort t)
--   	Return the number of fields of the given tuple sort. 
 
--  Z3_func_decl Z3_API 	Z3_get_tuple_sort_field_decl (__in Z3_context c, __in Z3_sort t, __in unsigned i)
--   	Return the i-th field declaration (i.e., projection function declaration) of the given tuple sort. 
 
--  unsigned Z3_API 	Z3_get_datatype_sort_num_constructors (__in Z3_context c, __in Z3_sort t)
--   	Return number of constructors for datatype. 
 
--  Z3_func_decl Z3_API 	Z3_get_datatype_sort_constructor (__in Z3_context c, __in Z3_sort t, unsigned idx)
--   	Return idx'th constructor. 
 
--  Z3_func_decl Z3_API 	Z3_get_datatype_sort_recognizer (__in Z3_context c, __in Z3_sort t, unsigned idx)
--   	Return idx'th recognizer. 
 
--  Z3_func_decl Z3_API 	Z3_get_datatype_sort_constructor_accessor (__in Z3_context c, __in Z3_sort t, unsigned idx_c, unsigned idx_a)
--   	Return idx_a'th accessor for the idx_c'th constructor. 
 
--  unsigned Z3_API 	Z3_get_relation_arity (__in Z3_context c, __in Z3_sort s)
--   	Return arity of relation. 
 
--  Z3_sort Z3_API 	Z3_get_relation_column (__in Z3_context c, __in Z3_sort s, unsigned col)
--   	Return sort at i'th column of relation sort. 
 
--  Z3_ast Z3_API 	Z3_func_decl_to_ast (__in Z3_context c, __in Z3_func_decl f)
--   	Convert a Z3_func_decl into Z3_ast. This is just type casting. 
 
--  Z3_bool Z3_API 	Z3_is_eq_func_decl (__in Z3_context c, __in Z3_func_decl f1, Z3_func_decl f2)
--   	compare terms. 
 
--  unsigned Z3_API 	Z3_get_func_decl_id (__in Z3_context c, Z3_func_decl f)
--   	Return a unique identifier for f. 
 
--  Z3_symbol Z3_API 	Z3_get_decl_name (__in Z3_context c, __in Z3_func_decl d)
--   	Return the constant declaration name as a symbol. 
 
--  Z3_decl_kind Z3_API 	Z3_get_decl_kind (__in Z3_context c, __in Z3_func_decl d)
--   	Return declaration kind corresponding to declaration. 
 
--  unsigned Z3_API 	Z3_get_domain_size (__in Z3_context c, __in Z3_func_decl d)
--   	Return the number of parameters of the given declaration. 
 
--  unsigned Z3_API 	Z3_get_arity (__in Z3_context c, __in Z3_func_decl d)
--   	Alias for Z3_get_domain_size. 
 
--  Z3_sort Z3_API 	Z3_get_domain (__in Z3_context c, __in Z3_func_decl d, __in unsigned i)
--   	Return the sort of the i-th parameter of the given function declaration. 
 
--  Z3_sort Z3_API 	Z3_get_range (__in Z3_context c, __in Z3_func_decl d)
--   	Return the range of the given declaration. 
 
--  unsigned Z3_API 	Z3_get_decl_num_parameters (__in Z3_context c, __in Z3_func_decl d)
--   	Return the number of parameters associated with a declaration. 
 
--  Z3_parameter_kind Z3_API 	Z3_get_decl_parameter_kind (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the parameter type associated with a declaration. 
 
--  int Z3_API 	Z3_get_decl_int_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the integer value associated with an integer parameter. 
 
--  double Z3_API 	Z3_get_decl_double_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the double value associated with an double parameter. 
 
--  Z3_symbol Z3_API 	Z3_get_decl_symbol_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the double value associated with an double parameter. 
 
--  Z3_sort Z3_API 	Z3_get_decl_sort_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the sort value associated with a sort parameter. 
 
--  Z3_ast Z3_API 	Z3_get_decl_ast_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the expresson value associated with an expression parameter. 
 
--  Z3_func_decl Z3_API 	Z3_get_decl_func_decl_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the expresson value associated with an expression parameter. 
 
--  Z3_string Z3_API 	Z3_get_decl_rational_parameter (__in Z3_context c, __in Z3_func_decl d, unsigned idx)
--   	Return the rational value, as a string, associated with a rational parameter. 
 
--  Z3_ast Z3_API 	Z3_app_to_ast (__in Z3_context c, __in Z3_app a)
--   	Convert a Z3_app into Z3_ast. This is just type casting. 
 
--  Z3_func_decl Z3_API 	Z3_get_app_decl (__in Z3_context c, __in Z3_app a)
--   	Return the declaration of a constant or function application. 
 
--  unsigned Z3_API 	Z3_get_app_num_args (__in Z3_context c, __in Z3_app a)
--   	Return the number of argument of an application. If t is an constant, then the number of arguments is 0. 
 
--  Z3_ast Z3_API 	Z3_get_app_arg (__in Z3_context c, __in Z3_app a, __in unsigned i)
--   	Return the i-th argument of the given application. 
 
--  Z3_bool Z3_API 	Z3_is_eq_ast (__in Z3_context c, __in Z3_ast t1, Z3_ast t2)
--   	compare terms. 
 
--  unsigned Z3_API 	Z3_get_ast_id (__in Z3_context c, Z3_ast t)
--   	Return a unique identifier for t. 
 
--  unsigned Z3_API 	Z3_get_ast_hash (__in Z3_context c, __in Z3_ast a)
--   	Return a hash code for the given AST. 
 
--  Z3_sort Z3_API 	Z3_get_sort (__in Z3_context c, __in Z3_ast a)
--   	Return the sort of an AST node. 
 
--  Z3_bool Z3_API 	Z3_is_well_sorted (__in Z3_context c, __in Z3_ast t)
--   	Return true if the given expression t is well sorted. 
 
--  Z3_lbool Z3_API 	Z3_get_bool_value (__in Z3_context c, __in Z3_ast a)
--   	Return Z3_L_TRUE if a is true, Z3_L_FALSE if it is false, and Z3_L_UNDEF otherwise. 
 
--  Z3_ast_kind Z3_API 	Z3_get_ast_kind (__in Z3_context c, __in Z3_ast a)
--   	Return the kind of the given AST. 
 
--  Z3_bool Z3_API 	Z3_is_app (__in Z3_context c, __in Z3_ast a)
 
--  Z3_bool Z3_API 	Z3_is_numeral_ast (__in Z3_context c, __in Z3_ast a)
 
--  Z3_bool Z3_API 	Z3_is_algebraic_number (__in Z3_context c, __in Z3_ast a)
--   	Return true if the give AST is a real algebraic number. 
 
--  Z3_app Z3_API 	Z3_to_app (__in Z3_context c, __in Z3_ast a)
--   	Convert an ast into an APP_AST. This is just type casting. 
 
--  Z3_func_decl Z3_API 	Z3_to_func_decl (__in Z3_context c, __in Z3_ast a)
--   	Convert an AST into a FUNC_DECL_AST. This is just type casting. 
 
--  Z3_string Z3_API 	Z3_get_numeral_string (__in Z3_context c, __in Z3_ast a)
--   	Return numeral value, as a string of a numeric constant term. 
 
--  Z3_string Z3_API 	Z3_get_numeral_decimal_string (__in Z3_context c, __in Z3_ast a, __in unsigned precision)
--   	Return numeral as a string in decimal notation. The result has at most precision decimal places. 
 
--  Z3_ast Z3_API 	Z3_get_numerator (__in Z3_context c, __in Z3_ast a)
--   	Return the numerator (as a numeral AST) of a numeral AST of sort Real. 
 
--  Z3_ast Z3_API 	Z3_get_denominator (__in Z3_context c, __in Z3_ast a)
--   	Return the denominator (as a numeral AST) of a numeral AST of sort Real. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_small (__in Z3_context c, __in Z3_ast a, __out __int64 *num, __out __int64 *den)
--   	Return numeral value, as a pair of 64 bit numbers if the representation fits. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_int (__in Z3_context c, __in Z3_ast v, __out int *i)
--   	Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine int. Return Z3_TRUE if the call succeeded. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_uint (__in Z3_context c, __in Z3_ast v, __out unsigned *u)
--   	Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine unsigned int. Return Z3_TRUE if the call succeeded. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_uint64 (__in Z3_context c, __in Z3_ast v, __out unsigned __int64 *u)
--   	Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine unsigned __int64 int. Return Z3_TRUE if the call succeeded. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_int64 (__in Z3_context c, __in Z3_ast v, __out __int64 *i)
--   	Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine __int64 int. Return Z3_TRUE if the call succeeded. 
 
--  Z3_bool Z3_API 	Z3_get_numeral_rational_int64 (__in Z3_context c, __in Z3_ast v, __out __int64 *num, __out __int64 *den)
--   	Similar to Z3_get_numeral_string, but only succeeds if the value can fit as a rational number as machine __int64 int. Return Z3_TRUE if the call succeeded. 
 
--  Z3_ast Z3_API 	Z3_get_algebraic_number_lower (__in Z3_context c, __in Z3_ast a, __in unsigned precision)
--   	Return a lower bound for the given real algebraic number. The interval isolating the number is smaller than 1/10^precision. The result is a numeral AST of sort Real. 
 
--  Z3_ast Z3_API 	Z3_get_algebraic_number_upper (Z3_context c, Z3_ast a, unsigned precision)
--   	Return a upper bound for the given real algebraic number. The interval isolating the number is smaller than 1/10^precision. The result is a numeral AST of sort Real. 
 
--  Z3_ast Z3_API 	Z3_pattern_to_ast (__in Z3_context c, __in Z3_pattern p)
--   	Convert a Z3_pattern into Z3_ast. This is just type casting. 
 
--  unsigned Z3_API 	Z3_get_pattern_num_terms (__in Z3_context c, __in Z3_pattern p)
--   	Return number of terms in pattern. 
 
--  Z3_ast Z3_API 	Z3_get_pattern (__in Z3_context c, __in Z3_pattern p, __in unsigned idx)
--   	Return i'th ast in pattern. 
 
--  unsigned Z3_API 	Z3_get_index_value (__in Z3_context c, __in Z3_ast a)
--   	Return index of de-Brujin bound variable. 
 
--  Z3_bool Z3_API 	Z3_is_quantifier_forall (__in Z3_context c, __in Z3_ast a)
--   	Determine if quantifier is universal. 
 
--  unsigned Z3_API 	Z3_get_quantifier_weight (__in Z3_context c, __in Z3_ast a)
--   	Obtain weight of quantifier. 
 
--  unsigned Z3_API 	Z3_get_quantifier_num_patterns (__in Z3_context c, __in Z3_ast a)
--   	Return number of patterns used in quantifier. 
 
--  Z3_pattern Z3_API 	Z3_get_quantifier_pattern_ast (__in Z3_context c, __in Z3_ast a, unsigned i)
--   	Return i'th pattern. 
 
--  unsigned Z3_API 	Z3_get_quantifier_num_no_patterns (__in Z3_context c, __in Z3_ast a)
--   	Return number of no_patterns used in quantifier. 
 
--  Z3_ast Z3_API 	Z3_get_quantifier_no_pattern_ast (__in Z3_context c, __in Z3_ast a, unsigned i)
--   	Return i'th no_pattern. 
 
--  unsigned Z3_API 	Z3_get_quantifier_num_bound (__in Z3_context c, __in Z3_ast a)
--   	Return number of bound variables of quantifier. 
 
--  Z3_symbol Z3_API 	Z3_get_quantifier_bound_name (__in Z3_context c, __in Z3_ast a, unsigned i)
--   	Return symbol of the i'th bound variable. 
 
--  Z3_sort Z3_API 	Z3_get_quantifier_bound_sort (__in Z3_context c, __in Z3_ast a, unsigned i)
--   	Return sort of the i'th bound variable. 
 
--  Z3_ast Z3_API 	Z3_get_quantifier_body (__in Z3_context c, __in Z3_ast a)
--   	Return body of quantifier. 
 
--  Z3_ast Z3_API 	Z3_simplify (__in Z3_context c, __in Z3_ast a)
--   	Interface to simplifier. 
 
--  Z3_ast Z3_API 	Z3_simplify_ex (__in Z3_context c, __in Z3_ast a, __in Z3_params p)
--   	Interface to simplifier. 
 
--  Z3_string Z3_API 	Z3_simplify_get_help (__in Z3_context c)
--   	Return a string describing all available parameters. 
 
--  Z3_param_descrs Z3_API 	Z3_simplify_get_param_descrs (__in Z3_context c)
--   	Return the parameter description set for the simplify procedure. 
 
--  Modifiers
--  Z3_ast Z3_API 	Z3_update_term (__in Z3_context c, __in Z3_ast a, __in unsigned num_args, __in_ecount(num_args) Z3_ast const args[])
--   	Update the arguments of term a using the arguments args. The number of arguments num_args should coincide with the number of arguments to a. If a is a quantifier, then num_args has to be 1. 
 
--  Z3_ast Z3_API 	Z3_substitute (__in Z3_context c, __in Z3_ast a, __in unsigned num_exprs, __in_ecount(num_exprs) Z3_ast const from[], __in_ecount(num_exprs) Z3_ast const to[])
--   	Substitute every occurrence of from[i] in a with to[i], for i smaller than num_exprs. The result is the new AST. The arrays from and to must have size num_exprs. For every i smaller than num_exprs, we must have that sort of from[i] must be equal to sort of to[i]. 
 
--  Z3_ast Z3_API 	Z3_substitute_vars (__in Z3_context c, __in Z3_ast a, __in unsigned num_exprs, __in_ecount(num_exprs) Z3_ast const to[])
--   	Substitute the free variables in a with the expressions in to. For every i smaller than num_exprs, the variable with de-Bruijn index i is replaced with term to[i]. 
 
--  Z3_ast Z3_API 	Z3_translate (__in Z3_context source, __in Z3_ast a, __in Z3_context target)
--   	Translate/Copy the AST a from context source to context target. AST a must have been created using context source. 
 
--  Models
--  void Z3_API 	Z3_model_inc_ref (__in Z3_context c, __in Z3_model m)
--   	Increment the reference counter of the given model. 
 
--  void Z3_API 	Z3_model_dec_ref (__in Z3_context c, __in Z3_model m)
--   	Decrement the reference counter of the given model. 
 
--  Z3_bool Z3_API 	Z3_model_eval (__in Z3_context c, __in Z3_model m, __in Z3_ast t, __in Z3_bool model_completion, __out Z3_ast *v)
--   	Evaluate the AST node t in the given model. Return Z3_TRUE if succeeded, and store the result in v.If model_completion is Z3_TRUE, then Z3 will assign an interpretation for any constant or function that does not have an interpretation in m. These constants and functions were essentially don't cares. 
 
--  Z3_ast Z3_API 	Z3_model_get_const_interp (__in Z3_context c, __in Z3_model m, __in Z3_func_decl a)
--   	Return the interpretation (i.e., assignment) of constant a in the model m. Return NULL, if the model does not assign an interpretation for a. That should be interpreted as: the value of a does not matter. 
 
--  Z3_func_interp Z3_API 	Z3_model_get_func_interp (__in Z3_context c, __in Z3_model m, __in Z3_func_decl f)
--   	Return the interpretation of the function f in the model m. Return NULL, if the model does not assign an interpretation for f. That should be interpreted as: the f does not matter. 
 
--  unsigned Z3_API 	Z3_model_get_num_consts (__in Z3_context c, __in Z3_model m)
--   	Return the number of constants assigned by the given model. 
 
--  Z3_func_decl Z3_API 	Z3_model_get_const_decl (__in Z3_context c, __in Z3_model m, __in unsigned i)
--   	Return the i-th constant in the given model. 
 
--  unsigned Z3_API 	Z3_model_get_num_funcs (__in Z3_context c, __in Z3_model m)
--   	Return the number of function interpretations in the given model. 
 
--  Z3_func_decl Z3_API 	Z3_model_get_func_decl (__in Z3_context c, __in Z3_model m, __in unsigned i)
--   	Return the declaration of the i-th function in the given model. 
 
--  unsigned Z3_API 	Z3_model_get_num_sorts (__in Z3_context c, __in Z3_model m)
--   	Return the number of uninterpreted sorts that m assigs an interpretation to. 
 
--  Z3_sort Z3_API 	Z3_model_get_sort (__in Z3_context c, __in Z3_model m, __in unsigned i)
--   	Return a uninterpreted sort that m assigns an interpretation. 
 
--  Z3_ast_vector Z3_API 	Z3_model_get_sort_universe (__in Z3_context c, __in Z3_model m, __in Z3_sort s)
--   	Return the finite set of distinct values that represent the interpretation for sort s. 
 
--  Z3_bool Z3_API 	Z3_is_as_array (__in Z3_context c, __in Z3_ast a)
--   	The (_ as-array f) AST node is a construct for assigning interpretations for arrays in Z3. It is the array such that forall indices i we have that (select (_ as-array f) i) is equal to (f i). This procedure returns Z3_TRUE if the a is an as-array AST node. 
 
--  Z3_func_decl Z3_API 	Z3_get_as_array_func_decl (__in Z3_context c, __in Z3_ast a)
--   	Return the function declaration f associated with a (_ as_array f) node. 
 
--  void Z3_API 	Z3_func_interp_inc_ref (__in Z3_context c, __in Z3_func_interp f)
--   	Increment the reference counter of the given Z3_func_interp object. 
 
--  void Z3_API 	Z3_func_interp_dec_ref (__in Z3_context c, __in Z3_func_interp f)
--   	Decrement the reference counter of the given Z3_func_interp object. 
 
--  unsigned Z3_API 	Z3_func_interp_get_num_entries (__in Z3_context c, __in Z3_func_interp f)
--   	Return the number of entries in the given function interpretation. 
 
--  Z3_func_entry Z3_API 	Z3_func_interp_get_entry (__in Z3_context c, __in Z3_func_interp f, unsigned i)
--   	Return a "point" of the given function intepretation. It represents the value of f in a particular point. 
 
--  Z3_ast Z3_API 	Z3_func_interp_get_else (__in Z3_context c, __in Z3_func_interp f)
--   	Return the 'else' value of the given function interpretation. 
 
--  unsigned Z3_API 	Z3_func_interp_get_arity (__in Z3_context c, __in Z3_func_interp f)
--   	Return the arity (number of arguments) of the given function interpretation. 
 
--  void Z3_API 	Z3_func_entry_inc_ref (__in Z3_context c, __in Z3_func_entry e)
--   	Increment the reference counter of the given Z3_func_entry object. 
 
--  void Z3_API 	Z3_func_entry_dec_ref (__in Z3_context c, __in Z3_func_entry e)
--   	Decrement the reference counter of the given Z3_func_entry object. 
 
--  Z3_ast Z3_API 	Z3_func_entry_get_value (__in Z3_context c, __in Z3_func_entry e)
--   	Return the value of this point. 
 
--  unsigned Z3_API 	Z3_func_entry_get_num_args (__in Z3_context c, __in Z3_func_entry e)
--   	Return the number of arguments in a Z3_func_entry object. 
 
--  Z3_ast Z3_API 	Z3_func_entry_get_arg (__in Z3_context c, __in Z3_func_entry e, __in unsigned i)
--   	Return an argument of a Z3_func_entry object. 
 
--  Interaction logging.
--  Z3_bool Z3_API 	Z3_open_log (__in Z3_string filename)
--   	Log interaction to a file. 
 
--  void Z3_API 	Z3_append_log (__in Z3_string string)
--   	Append user-defined string to interaction log. 
 
--  void Z3_API 	Z3_close_log ()
--   	Close interaction log. 
 
--  void Z3_API 	Z3_toggle_warning_messages (__in Z3_bool enabled)
--   	Enable/disable printing warning messages to the console. 
 
   -----------------------
   -- String conversion --
   -----------------------
   
   -- Select mode for the format used for pretty-printing AST nodes. 
   procedure Z3_Set_Ast_Print_Node(C:in Z3_Context;Mode:in Z3_Ast_Print_Mode);
   pragma Import(C,Z3_Set_Ast_Print_Node,"Z3_set_ast_print_mode");
 	
   -- Convert the given AST node into a string. 
   function Z3_Ast_To_String(C:in Z3_Context;A:in Z3_Ast) return Z3_String;
   pragma Import(C,Z3_Ast_To_String,"Z3_ast_to_string");
 
   function Z3_Pattern_To_String(C:in Z3_Context;P:in Z3_Pattern) return Z3_String;
   pragma Import(C,Z3_Pattern_To_String,"Z3_pattern_to_string");
   
   function Z3_Sort_To_String(C:in Z3_Context;S:in Z3_Sort) return Z3_String;
   pragma Import(C,Z3_Sort_To_String,"Z3_sort_to_string");
   
   function Z3_Func_Decl_To_String(C:in Z3_Context;D:in Z3_Func_Decl) return Z3_String;
   pragma Import(C,Z3_Func_Decl_To_String,"Z3_func_decl_to_string");
   
   -- Convert the given model into a string. 
   function Z3_Model_To_String(C:in Z3_Context;M:in Z3_Model) return Z3_String;
   pragma Import(C,Z3_Model_To_String,"Z3_model_to_string");
   
   -- Convert the given benchmark into SMT-LIB formatted string. 
   function Z3_Benchmark_To_Smtlib_String( C : in Z3_Context;
					   Name : in Z3_String;
					   Logic : in Z3_String;
					   Status : in Z3_String;
					   Attributes : in Z3_String;
					   Num_Assumptions : in Interfaces.C.Unsigned;
					   Assumptions : in Z3_Ast_Array;
					   Formula : in Z3_Ast) return Z3_String;
   pragma Import(C,Z3_Benchmark_To_Smtlib_String,"Z3_benchmark_to_smtlib_string"); 
   
   ---------------------
   --  Error Handling --
   ---------------------
   
   -- Return the error code for the last API call. 
   function Z3_Get_Error_Code( C : in Z3_Context ) return Z3_Error_Code;
   pragma Import(C,Z3_Get_Error_Code,"Z3_get_error_code");
   
   type Z3_Error_Handler is access procedure( C : in Z3_Context ; E : Z3_Error_Code );
   pragma Convention(C,Z3_Error_Handler);
   
   -- Register a Z3 error handler.    
   procedure Z3_Set_Error_Handler( C : in Z3_Context ; H : in Z3_Error_Handler );
   pragma Import(C,Z3_Set_Error_Handler,"Z3_set_error_handler");
   
   -- Set an error.    
   procedure Z3_Set_Error( C : in Z3_Context ; E : in Z3_Error_Code);
   pragma Import(C,Z3_Set_Error,"Z3_set_error");
   
   -- Return a string describing the given error code.    
   function Z3_Get_Error_Msg( Err : in Z3_Error_Code) return Z3_String;
   pragma Import(C,Z3_Get_Error_Msg, "Z3_get_error_msg");

   -- Return a string describing the given error code. 
   procedure Z3_Get_Error_Msg_Ex( C : in Z3_Context ; Err : in Z3_Error_Code );
   pragma Import(C,Z3_Get_Error_Msg_Ex,"Z3_get_error_msg_ex");
 
   --  Miscellaneous
   
   -- Return Z3 version number information. 
   procedure Z3_Get_Version( Major, Minor, Build_Numer, Revision_Number : out Interfaces.C.Unsigned);
   pragma Import(C,Z3_Get_Version,"Z3_get_version");
   
   -- Enable tracing messages tagged as tag when Z3 is compiled in debug mode. It is a NOOP otherwise. 
   procedure Z3_Enable_Trace( Tag : in Z3_String );
   pragma Import(C,Z3_Enable_Trace,"Z3_enable_trace");
 
   -- Disable tracing messages tagged as tag when Z3 is compiled in debug mode. It is a NOOP otherwise. 
   procedure Z3_Disable_Trace( Tag : in Z3_String );
   pragma Import(C,Z3_Disable_Trace,"Z3_disable_trace");
   
   -- Reset all allocated resources.    
   procedure Z3_Reset_Memory;
   pragma Import(C,Z3_Reset_Memory,"Z3_reset_memory");

   -----------
   -- Goals --
   -----------
   
   -- Create a goal (aka problem). A goal is essentially a set of formulas, that can be solved and/or transformed using tactics and solvers. 
   function Z3_Mk_Goal( C : in Z3_Context ; Models : in Z3_Bool ; Unsar_Cores : in Z3_Bool ; Proofs : in Z3_Bool ) return Z3_Goal;
   pragma Import(C,Z3_Mk_Goal,"Z3_mk_goal");
   
   -- Increment the reference counter of the given goal. 
   procedure Z3_Goal_Inc_Ref( C : in Z3_Context ; G : in Z3_Goal );
   pragma Import(C,Z3_Goal_Inc_Ref,"Z3_goal_inc_ref");
   
   -- Decrement the reference counter of the given goal.    
   procedure Z3_Goal_Dec_Ref( C : in Z3_Context ; G : in Z3_Goal );
   pragma Import(C,Z3_Goal_Dec_Ref,"Z3_goal_dec_ref");

   -- Return the "precision" of the given goal. Goals can be transformed using over and under approximations. 
   -- A under approximation is applied when the objective is to find a model for a given goal. An over 
   -- approximation is applied when the objective is to find a proof for a given goal. 
   function Z3_Goal_Precision( C : in Z3_Context ; G : in Z3_Goal ) return Z3_Goal_Prec;
   pragma Import(C,Z3_Goal_Precision,"Z3_goal_precision");
   
   -- Add a new formula a to the given goal. 
   procedure Z3_Goal_Assert( C : in Z3_Context ; G : in Z3_Goal ; A : in Z3_Ast );
   pragma Import(C,Z3_Goal_Assert,"Z3_goal_assert");
   
   -- Return true if the given goal contains the formula false.    
   function Z3_Goal_Inconsistent( C : in Z3_Context ; G : in Z3_Goal ) return Z3_Bool;
   pragma Import(C,Z3_Goal_Inconsistent,"Z3_goal_inconsistent");
   
   -- Return the depth of the given goal. It tracks how many transformations were applied to it. 
   function Z3_Goal_Depth( C : in Z3_Context ; G : in Z3_Goal ) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Goal_Depth,"Z3_goal_depth");
   
   -- Erase all formulas from the given goal. 
   procedure Z3_Goal_Reset( C : in Z3_Context ; G : in Z3_Goal);
   pragma Import(C,Z3_Goal_Reset,"Z3_goal_reset");

   -- Return the number of formulas in the given goal.    
   function Z3_Goal_Size( C : in Z3_Context ; G : in Z3_Goal ) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Goal_Size,"Z3_goal_size");

   -- Return a formula from the given goal.    
   function Z3_Goal_Formula( C : in Z3_Context ; G : in Z3_Goal ; Idx : in Interfaces.C.Unsigned ) return Z3_Ast;
   pragma Import(C,Z3_Goal_Formula,"Z3_goal_formula");

   -- Return the number of formulas, subformulas and terms in the given goal.  
   function Z3_Goal_Num_Exprs( C : in Z3_Context ; G : in Z3_Goal ) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Goal_Num_Exprs,"Z3_goal_num_exprs");

   -- Return true if the goal is empty, and it is precise or the product of a under approximation.  
   function Z3_Goal_Decided_Sat( C : in Z3_Context ; G : in Z3_Goal ) return Z3_Bool;
   pragma Import(C,Z3_Goal_Decided_Sat,"Z3_goal_is_decided_sat");

   -- Return true if the goal contains false, and it is precise or the product of an over approximation.  
   function Z3_Goal_Decided_Unsat( C : in Z3_Context ; G : in Z3_Goal ) return Z3_Bool;
   pragma Import(C,Z3_Goal_Decided_Unsat,"Z3_goal_is_decided_unsat");

   -- Copy a goal g from the context source to a the context target.  
   function Z3_Goal_Translate( C : in Z3_Context ; G : in Z3_Goal ) return Z3_Goal;
   pragma Import(C,Z3_Goal_Translate,"Z3_goal_translate");

   -- Convert a goal into a string. 
   function Z3_Goal_To_String( C : in Z3_Context ; G : in Z3_Goal ) return Z3_String;
   pragma Import(C,Z3_Goal_To_String,"Z3_goal_to_string");
   
   
end Bridge.Z3;

