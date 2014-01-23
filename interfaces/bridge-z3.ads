with Interfaces.C, Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
with System;

package Bridge.Z3 is
   
   pragma Preelaborate;
   
   --------------------------------------------------------------------------
   -- Main data structures provided by "z3_api.h". All are opaque pointers --
   --------------------------------------------------------------------------
   
   type Z3_Config is new System.Address;
   -- Configuration object used to initialize logical contexts.
   
   type Z3_Context is new System.Address;
   -- Manager of all other Z3 objects, global configuration options, etc.
   
   type Z3_Symbol is new System.Address;
   -- Lisp-like symbol used to name types, constants, and functions.  
   -- A symbol can be created using string or integers.
   
   type Z3_Ast is new System.Address;
   -- Abstract syntax tree node. 
   -- That is, the data-structure used in Z3 to represent terms, formulas and types.
   
   subtype Z3_Ast_Opt is Z3_Ast;
   
   type Z3_Sort is new System.Address;
   --  Kind of AST used to represent types.
   
   subtype Z3_Sort_Opt is Z3_Sort;
   
   type Z3_Func_Decl is new System.Address;
   -- Kind of AST used to represent function symbols.
   
   type Z3_App is new System.Address;
   -- Kind of AST used to represent function applications.
   
   type Z3_Pattern is new System.Address;
   -- Kind of AST used to represent pattern and multi-patterns used to guide quantifier 
   -- instantiation.
   
   type Z3_Constructor is new System.Address;
   -- Type constructor for a (recursive) datatype.
   
   type Z3_Constructor_List is new System.Address;
   
   type Z3_Params is new System.Address;
   -- Parameter set used to configure many components such as: simplifiers, tactics, solvers, etc.
   
   type Z3_Param_Descrs is new System.Address;
   
   type Z3_Model is new System.Address;
   -- Model for the constraints asserted into the logical context.
   
   type Z3_Func_Interp is new System.Address;
   -- Interpretation of a function in a model.
   
   type Z3_Func_Entry is new System.Address;
   -- Representation of the value of a [Z3_func_interp] at a particular point.
   
   type Z3_Fixedpoint is new System.Address;
   -- Context for the recursive predicate solver.
   
   type Z3_Ast_Vector is new System.Address;
   -- Cector of [Z3_ast] objects.
   
   type Z3_Ast_Map is new System.Address;
   -- Mapping from [Z3_ast] to [Z3_ast] objects.
   
   type Z3_Goal is new System.Address;
   -- Set of formulas that can be solved and/or transformed using tactics and solvers.
   
   type Z3_Tactic is new System.Address;
   -- Basic building block for creating custom solvers for specific problem domains.
   
   type Z3_Probe is new System.Address;
   -- Function/predicate used to inspect a goal and collect information that may be used 
   -- to decide which solver and/or preprocessing step will be used.
   
   type Z3_Apply_Result is new System.Address;
   -- Collection of subgoals resulting from applying of a tactic to a goal.
   
   type Z3_Solver is new System.Address;
   -- (incremental) solver, possibly specialized by a particular tactic or logic.
   
   type Z3_Stats is new System.Address;
   -- Statistical data for a solver.
      
      
   ---------------------
   -- Booleans --
   ---------------------
   
   Z3_TRUE : constant Interfaces.C.Int := 1;
   Z3_FALSE : constant Interfaces.C.Int := 0;    

   
   type Z3_Bool is new Interfaces.C.Int;
   
   
   ---------------------------------
   -- Strings and string pointers --
   ---------------------------------
   type Z3_String is new Interfaces.C.Strings.Chars_Ptr;
   
   type Z3_String_Ptr is access all Z3_String;
   
   
   ---------------------
   -- Lifted Booleans --
   ---------------------
   type Z3_Lbool is ( Z3_L_False, Z3_L_Undef, Z3_L_True);
   
   for Z3_Lbool use  (Z3_L_False => -1, Z3_L_Undef => 0, Z3_L_True  => 1);
   pragma Convention(C,Z3_lbool);
   
   --for Z3_Bool'Size use  Interfaces.C.Unsigned'Size;
   
   
   ----------------
   -- Z3's kinds --
   ----------------
   
   -- The different kinds of symbol. In Z3, a symbol can be represented using 
   -- integers and strings (See #Z3_get_symbol_kind).                          
   type Z3_Symbol_Kind is ( Z3_INT_SYMBOL, Z3_STRING_SYMBOL );
   pragma Convention (C, Z3_symbol_kind);

   
   -- The different kinds of parameters that can be associated with function symbols
   type Z3_Parameter_Kind is
     (Z3_PARAMETER_INT, -- integer parameters
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
	 

   
   ----------------------------------
   -- API functions and procedures --
   ----------------------------------
   
   
   procedure Z3_Error_Handler(C:in Z3_Context;E:in Z3_Error_Code);
   pragma Import(C,Z3_Error_Handler,"Z3_error_handler");
      
   -- Create a configuration.                                                    --
   function Z3_Mk_Config return Z3_Config;
   pragma Import(C,Z3_Mk_Config,"Z3_mk_config");
   
   -- Delete the given configuration object.
   procedure Z3_Del_Config(C:in Z3_Config);
   pragma Import(C,Z3_Del_Config,"Z3_del_config");
   
   -- Set a configuration parameter
   procedure Z3_Set_Param_Value(C:in Z3_Config;Param_Id:in Z3_String;Param_Value:in Z3_String);
   pragma Import(C,Z3_Set_Param_Value,"Z3_set_param_value");

   -- Create context
   function Z3_Mk_Context(C:in Z3_Config) return Z3_Context;
   pragma Import(C,Z3_Mk_Context,"Z3_mk_context");
   
   function Z3_Mk_Context_Rc(C:in Z3_Config) return Z3_Context;
   pragma Import(C,Z3_Mk_Context_Rc,"Z3_mk_context_rc");
   
   -- Delete the given logical context.
   procedure Z3_Del_Context(C:in Z3_Context);
   Pragma Import(C,Z3_Del_Context,"Z3_del_context");
   
   -- Increment the reference counter of the given AST.
   procedure Z3_Inc_Ref(C:in Z3_Context;A:in Z3_Ast);
   pragma Import(C,Z3_Inc_Ref,"Z3_inc_ref");
   
   -- Decrement the reference counter of the given AST.
   procedure Z3_Dec_Ref(C:in Z3_Context;A:in Z3_Ast);
   pragma Import(C,Z3_Dec_Ref,"Z3_dec_ref");
   
   -- Update a mutable configuration parameter.
   procedure Z3_Update_Param_Value(C:in Z3_Context;Param_Id:in Z3_String;Param_Value:in Z3_String);
   pragma Import(C,Z3_Update_Param_Value,"Z3_update_param_value");
   
   -- Get a configuration parameter.
   -- Z3_bool_opt Z3_API Z3_get_param_value(__in Z3_context c, __in Z3_string param_id, __out_opt Z3_string_ptr param_value);
   
   -- Interrupt the execution of a Z3 procedure.
   procedure Z3_Interrupt(C:in Z3_Context);
   pragma Import(C,Z3_Interrupt,"Z3_interrupt");
   
   -- Create a Z3 (empty) parameter set.
   function Z3_Mk_Params(C:in Z3_Context) return Z3_Params;
   pragma Import(C,Z3_Mk_Params,"Z3_mk_params");
   
   procedure Z3_Params_Inc_Ref(C:in Z3_Context;P:in Z3_Params);
   pragma Import(C,Z3_Params_Inc_Ref,"Z3_params_inc_ref");
   
   procedure Z3_Params_Dec_Ref(C:in Z3_Context;P:in Z3_Params);
   pragma Import(C,Z3_Params_Dec_Ref,"Z3_params_dec_ref");
   
   -- Add a Boolean parameter k with value v to the parameter set p
   procedure Z3_Params_Set_Bool(C:in Z3_Context;P:in Z3_Params;K:in Z3_Symbol;V:in Z3_Bool);
   pragma Import(C,Z3_Params_Set_Bool,"Z3_params_set_bool");
   
   -- Add a unsigned parameter k with value v to the parameter set p.
   procedure Z3_Params_Set_Uint(C:in Z3_Context;P:in Z3_Params;K:in Z3_Symbol;V:in Interfaces.C.Unsigned);
   pragma Import(C,Z3_Params_Set_Uint,"Z3_params_set_uint");
   
   -- Add a double parameter k with value v to the parameter set p.
   procedure Z3_Params_Set_Double(C:in Z3_Context;P:in Z3_Params;K:in Z3_Symbol;V:in Interfaces.C.Double);
   pragma Import(C,Z3_Params_Set_Double,"Z3_params_set_double");
   
   -- Add a symbol parameter k with value v to the parameter set p.
   procedure Z3_Params_Set_Symbol(C:in Z3_Context;P:in Z3_Params;K:in Z3_Symbol;V:in Z3_Symbol);
   pragma Import(C,Z3_Params_Set_Symbol,"Z3_params_set_symbol");
   
   -- Convert a parameter set into a string. This function is mainly used for printing the
   -- contents of a parameter set.
   function Z3_Params_To_String(C:in Z3_Context;P:in Z3_Params) return Z3_String;
   pragma Import(C,Z3_Params_To_String,"Z3_params_to_string");
   
   -- Validate the parameter set p against the parameter description set d.
   procedure Z3_Params_Validate(C:in Z3_Context;P:in Z3_Params;D:in Z3_Param_Descrs);
   pragma Import(C,Z3_Params_Validate,"Z3_params_validate");
   
   procedure Z3_Param_Descrs_Inc_Ref(C:in Z3_Context;P:in Z3_Param_Descrs);
   pragma Import(C,Z3_Param_Descrs_Inc_Ref,"Z3_params_descrs_inc_ref");
   
   procedure Z3_Param_Descrs_Dec_Ref(C:in Z3_Context;P:in Z3_Param_Descrs);
   pragma Import(C,Z3_Param_Descrs_Dec_Ref,"Z3_params_descrs_dec_ref");
   
   -- Return the kind associated with the given parameter name c n.
   function Z3_Param_Descrs_Get_Kind(C:in Z3_Context;P:in Z3_Param_Descrs;N:in Z3_Symbol) return Z3_Param_Kind;
   pragma Import(C,Z3_Param_Descrs_Get_Kind,"Z3_param_descrs_get_kind");
   
   -- Return the number of parameters in the given parameter description set.
   function Z3_Param_Descrs_Size(C:in Z3_Context;P:in Z3_Param_Descrs) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Param_Descrs_Size,"Z3_param_descrs_size");
   
   -- Return the number of parameters in the given parameter description set.
   function Z3_Param_Descrs_Get_Name(C:in Z3_Context;P:in Z3_Param_Descrs;I:in Interfaces.C.Unsigned) return Z3_Symbol;
   pragma Import(C,Z3_Param_Descrs_Get_Name,"Z3_param_descrs_get_name");
   
   -- Convert a parameter description set into a string. This function is mainly used for printing the
   -- contents of a parameter description set.
   function Z3_Param_Descrs_To_String(C:in Z3_Context;P:in Z3_Param_Descrs) return Z3_String;
   pragma Import(C,Z3_Param_Descrs_To_String,"Z3_param_descrs_to_string");
   
   -- Create a Z3 symbol using an integer
   function Z3_Mk_Int_Symbol(C:in Z3_Context;I:in Interfaces.C.Int) return Z3_Symbol;
   pragma Import(C,Z3_Mk_Int_Symbol,"Z3_mk_int_symbol");
   
   -- Create a Z3 symbol using a C string.
   function Z3_Mk_String_Symbol(C:in Z3_Context;S:in Z3_String) return Z3_Symbol;
   pragma Import(C,Z3_Mk_String_Symbol,"Z3_mk_string_symbol");
   
   -- Create a free (uninterpreted) type using the given name (symbol).
   function Z3_Mk_Uninterpreted_Sort(C:in Z3_Context;S:in Z3_Symbol) return Z3_Sort;
   pragma Import(C,Z3_Mk_Uninterpreted_Sort,"Z3_mk_uninterpreted_sort");
   
   -- Create the Boolean type.
   function Z3_Mk_Bool_Sort(C:in Z3_Context) return Z3_Sort;
   pragma Import(C,Z3_Mk_Bool_Sort,"Z3_mk_bool_sort");
   
   -- Create the integer type.
   function Z3_Mk_Int_Sort(C:in Z3_Context) return Z3_Sort;
   pragma Import(C,Z3_Mk_Int_Sort,"Z3_mk_int_sort");
   
   -- Create the real type.
   function Z3_Mk_Real_Sort(C:in Z3_Context) return Z3_Sort;
   pragma Import(C,Z3_Mk_Real_Sort,"Z3_mk_real_sort");
   
   -- Create a bit-vector type of the given size.
   function Z3_Mk_Bv_Sort(C:in Z3_Context;Sz:in Interfaces.C.Unsigned) return Z3_Sort;
   pragma Import(C,Z3_Mk_Bv_Sort,"Z3_mk_bv_sort");
   
   -- Create a named finite domain sort.
   function Z3_Mk_Finite_Domain_Sort(C:in Z3_Context;Name:in Z3_Symbol;Size:in Interfaces.C.Unsigned_Long) return Z3_Sort;
   pragma Import(C,Z3_Mk_Finite_Domain_Sort,"Z3_mk_finite_domain_sort");

   -- Create an array type.
   function Z3_Mk_Array_Sort(C:in Z3_Context;Domain:in Z3_Sort;Rg:in Z3_Sort) return Z3_Sort;
   pragma Import(C,Z3_Mk_Array_Sort,"Z3_mk_array_sort");
   
   type Z3_Symbol_Array is array(Integer range <>) of Z3_Symbol;
   pragma Convention(C,Z3_Symbol_Array);
   -- for Z3_Symbol_Array'Component_size use Z3_Symbol'Size;
   
   type Z3_Sort_Array is array(Integer range <>) of Z3_Sort;
   pragma Convention(C,Z3_Sort_Array);
   
   type Z3_Func_Decl_Array is array(Integer range <>) of Z3_Func_Decl;
   pragma Convention(C,Z3_Func_Decl_Array);
      
   type Z3_Func_Decl_Access is access all Z3_Func_Decl;
   
   -- Create a tuple type.
   function Z3_Mk_Tuple_Sort(C:in Z3_Context;
			     Mk_Tuple_Name:in Z3_Symbol;
			     Num_Fields:in Interfaces.C.Unsigned;
			     Field_Names:in Z3_Symbol_Array;
			     Field_Sorts:in Z3_Sort_Array;
			     Mk_Tuple_Decl:in Z3_Func_Decl_Access;
			     Proj_Decl:in Z3_Func_Decl_Array) return Z3_Sort;
   pragma Import(C,Z3_Mk_Tuple_Sort,"Z3_mk_tuple_sort");
   
   -- Create a enumeration sort.
   function Z3_Mk_Enumeration_Sort(C:in Z3_Context;
				   Name:in Z3_Symbol;
				   N:in Interfaces.C.Unsigned;
				   Enum_Names:in Z3_Symbol_Array;
				   Enum_Consts:in Z3_Func_Decl_Array;
				   Enum_Testers:in Z3_Func_Decl_Array) return Z3_Sort;
   pragma Import(C,Z3_Mk_Enumeration_Sort,"Z3_mk_enumeration_sort");
   
   -- Create a list sort
   function Z3_Mk_List_Sort(C:in Z3_Context;
			    Name:in Z3_Symbol;
			    Elem_Sort:in Z3_Sort;
			    Nil_Decl:out Z3_Func_Decl_Access;
			    Is_Nil_Decl:out Z3_Func_Decl_Access;
			    Cons_Decl:out Z3_Func_Decl_Access;
			    Is_Cons_decl:out Z3_Func_Decl_Access;
			    Head_decl:out Z3_Func_Decl_Access;
			    Tail_decl:out Z3_Func_Decl_Access) return Z3_Sort;
   pragma Import(C,Z3_Mk_List_Sort,"Z3_mk_list_sort");
   
   
   type Z3_Sort_Opt_Array is array(Integer range <>) of Z3_Sort_Opt;
   
   -- Create a constructor.
   --function Z3_Mk_Constructor(C:in Z3_Context;
   --Name:in Z3_Symbol;
   --Recognizer:in Z3_Symbol;
   --Num_Fields:in Interfaces.C.Unsigned;
   --Field_Names:in Z3_Symbol_Array;
   --  Z3_constructor Z3_API Z3_mk_constructor(__in Z3_context c,
   --                                           __in Z3_symbol name,
   --                                           __in Z3_symbol recognizer,
   --                                           __in unsigned num_fields,
   --                                           __in_ecount(num_fields) Z3_symbol const field_names[],
   --                                           __in_ecount(num_fields) Z3_sort_opt const sorts[],
   --                                           __in_ecount(num_fields) unsigned sort_refs[]
   --  					  );
   
   --  Reclaim memory allocated to constructor.
   procedure Z3_Del_Constructor(C:in Z3_Context;Constr:in Z3_Constructor);
   pragma Import(C,Z3_Del_Constructor,"Z3_del_constructor");
   
   type Z3_Constructor_Array is array(Integer range <>) of Z3_Constructor;
   pragma Convention(C,Z3_Constructor_Array);
   
   --  Create datatype, such as lists, trees, records, enumerations or unions of records. 
   --  The datatype may be recursive. Return the datatype sort.
   function Z3_Mk_Datatype(C:in Z3_Context;
			   Name:in Z3_Symbol;
			   Num_Constructor:in Interfaces.C.Unsigned;
			   Construtors:in out Z3_Constructor_Array) return Z3_Sort;
   pragma Import(C,Z3_Mk_Datatype,"Z3_mk_datatype");
   
   --  Create list of constructors.
   function Z3_Mk_Constructor_List( C:in Z3_Context;
				    Num_Constructors: in Interfaces.C.Unsigned;
				    Constructors: in out Z3_Constructor_Array) return Z3_Constructor_List;
   pragma Import(C,Z3_Mk_Constructor_List,"Z3_mk_constructor_list");
   
   
   --  Reclaim memory allocated for constructor list.
   procedure Z3_Del_Constructor_List(C:in Z3_Context;Clist:in Z3_Constructor_List);
   pragma Import(C,Z3_Del_Constructor_List,"Z3_del_constructor_list");
   
   --  Create mutually recursive datatypes.
   procedure Z3_Mk_Datatypes( C:in Z3_Context;
			      Num_Sorts: in Interfaces.C.Unsigned;
			      Sort_Names: in Z3_Symbol_Array;
			      Sorts: out Z3_Sort_Array;
			      Constructor_List: in out Z3_Constructor_List);
   pragma Import(C,Z3_Mk_Datatypes,"Z3_mk_datatypes");
   
   -- Query constructor for declared functions.
   procedure Z3_Query_Constructor(C:in Z3_Context;
				  Constr:in Z3_Constructor;
				  Num_Fields:in Interfaces.C.Unsigned;
				  Constructor:out Z3_Func_Decl_Access;
				  Tester:out Z3_Func_Decl_Access;
				  Accessors:out Z3_Func_Decl_Array);
   pragma Import(C,Z3_Query_Constructor,"Z3_query_constructor");
   
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

   
   
     
   
   
end Bridge.Z3;

