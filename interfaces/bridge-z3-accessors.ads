with Interfaces.C, Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
with System;

package Bridge.Z3.Accessors is
   
   ----------------
   --  Accessors --
   ----------------
   
   -- Return Z3_INT_SYMBOL if the symbol was constructed using Z3_mk_int_symbol, and Z3_STRING_SYMBOL if the symbol was constructed using Z3_mk_string_symbol.    
   function Z3_Get_Symbol_Kind( C : in Z3_Context ; S : in Z3_Symbol ) return Z3_Symbol_Kind ;
   pragma Import(C,Z3_Get_Symbol_Kind,"Z3_get_symbol_kind") ; 

   -- Return the symbol int value.      
   function Z3_Get_Symbol_Int( C : in Z3_Context ; S : in Z3_Symbol ) return Interfaces.C.Int ;
   pragma Import(C,Z3_Get_Symbol_Int,"Z3_get_symbol_int") ;

   -- Return the symbol name. 
   function Z3_Get_Symbol_String( C : in Z3_Context ; S : in Z3_Symbol ) return Z3_String ;
   pragma Import(C,Z3_Get_Symbol_String,"Z3_get_symbol_string") ;

   -- Return the sort name as a symbol.      
   function Z3_Get_Sort_Name(  C : in Z3_Context ; D : in Z3_Sort ) return Z3_Symbol ;
   pragma Import(C,Z3_Get_Sort_Name,"Z3_get_sort_name") ;

   -- Return a unique identifier for s. 
   function Z3_Get_Sort_Id( C : in Z3_Context ; S : in Z3_Sort ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Sort_Id,"Z3_get_sort_id") ;

   -- Convert a Z3_sort into Z3_ast. This is just type casting.    
   function Z3_Sort_To_Ast( C : in Z3_Context ; S : in Z3_Sort ) return Z3_Ast ;
   pragma Import(C,Z3_Sort_To_Ast,"Z3_sort_to_ast") ;

   -- compare sorts. 
   function Z3_Is_Eq_Sort( C : in Z3_Context ; S1, S2 : in Z3_Sort ) return Z3_Ast ;
   pragma Import(C,Z3_Is_Eq_Sort,"Z3_is_eq_sort") ;

   -- Return the sort kind (e.g., array, tuple, int, bool, etc). 
   function Z3_Get_Sort_Kind( C : in Z3_Context ; S : in Z3_Sort ) return Z3_Sort_Kind ;
   pragma Import(C,Z3_Get_Sort_Kind,"Z3_get_sort_kind") ;

   -- Return the size of the given bit-vector sort. 
   function Z3_Get_Bv_Sort_Size( C : in Z3_Context ; S : in Z3_Sort ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Bv_Sort_Size,"Z3_get_bv_sort_size") ;

   -- Store the size of the sort in r. Return Z3_FALSE if the call failed. That is,
   -- Z3_get_sort_kind(s) == Z3_FINITE_DOMAIN_SORT.    
   function Z3_Get_Finite_Domain_Sort_Size( C : in Z3_Context ; S : in Z3_Sort ; R : out Int_64 ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Finite_Domain_Sort_Size,"Z3_get_finite_domain_sort_size") ;

   -- Return the domain of the given array sort.    
   function Z3_Get_Array_Sort_Domain( C : in Z3_Context ; S : in Z3_Sort ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Array_Sort_Domain,"Z3_get_array_sort_domain") ;
   
   -- Return the range of the given array sort.    
   function Z3_Get_Array_Sort_Range( C : in Z3_Context ; T : in Z3_Sort ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Array_Sort_Range,"Z3_get_array_sort_range") ;

   -- Return the constructor declaration of the given tuple sort.    
   function Z3_Get_Tuple_Sort_Mk_Decl( C : in Z3_Context ; T : in Z3_Sort ) return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Tuple_Sort_Mk_Decl,"Z3_get_tuple_sort_mk_decl") ;

   -- Return the number of fields of the given tuple sort.    
   function Z3_Get_Tuple_Sort_Num_Fields( C : in Z3_Context ; T : in Z3_Sort ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Tuple_Sort_Num_Fields,"Z3_get_tuple_sort_num_fields") ;
   
   -- Return the i-th field declaration (i.e., projection function declaration) of the given tuple sort.    
   function Z3_Get_Tuple_Sort_Field_Decl(  C : in Z3_Context ; T : in Z3_Sort ; I : in Interfaces.C.Unsigned ) return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Tuple_Sort_Field_Decl,"Z3_get_tuple_sort_field_decl") ;

   -- Return number of constructors for datatype. 
   function Z3_Get_Datatype_Sort_Num_Constructors(  C : in Z3_Context ; S : in Z3_Sort ) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Get_Datatype_Sort_Num_Constructors,"Z3_get_datatype_sort_num_constructors") ;
   
   -- Return idx'th constructor. 
   function Z3_Get_Datatype_Sort_Construct( C : in Z3_Context ; T : in Z3_Sort ; Idx : in Interfaces.C.Unsigned ) return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Datatype_Sort_Construct,"Z3_get_datatype_sort_constructor") ;

    -- Return idx'th recognizer. 
   function Z3_Get_Datatype_Sort_Recognizer( C : in Z3_Context ; T : in Z3_Sort ; Idx : in Interfaces.C.Unsigned ) return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Datatype_Sort_Recognizer,"Z3_get_datatype_sort_recognizer") ;

   -- Return idx_a'th accessor for the idx_c'th constructor.    
   function Z3_Get_Datatype_Sort_Constructor_Accessor( C : in Z3_Context ; T : in Z3_Sort ; Idx_C, Idx_A : in Interfaces.C.Unsigned ) Return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Datatype_Sort_Constructor_Accessor,"Z3_get_datatype_sort_constructor_accessor") ;
   
   -- Return arity of relation. 
   function Z3_Get_Relation_Arity( C : in Z3_Context ; S : in Z3_Sort ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Relation_Arity,"Z3_get_relation_arity") ;

   -- Return sort at i'th column of relation sort.      
   function Z3_Get_Relation_Column( C : in Z3_Context ; S : in Z3_sort ; Col : in Interfaces.C.Unsigned ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Relation_Column,"Z3_get_relation_column") ;

   -- Convert a Z3_func_decl into Z3_ast. This is just type casting.  
   function Z3_Func_Decl_To_Ast( C : in Z3_Context ; F : in Z3_Func_Decl ) return Z3_Ast ;
   pragma Import(C,Z3_Func_Decl_To_Ast,"Z3_func_decl_to_ast") ;

   -- compare terms.    
   function Z3_Is_Eq_Func_Decl( C : in Z3_Context ; F1, F2 : in Z3_Func_Decl ) return Z3_Bool ;
   pragma Import(C,Z3_Is_Eq_Func_Decl,"Z3_is_eq_func_decl") ;

   -- Return a unique identifier for f.       
   function Z3_Get_Func_Decl_Id( C : in Z3_Context ; F : in Z3_Func_Decl ) return Interfaces.C.Unsigned;
   pragma Import(C,Z3_Get_Func_Decl_Id,"Z3_get_func_decl_id") ;

   -- Return the constant declaration name as a symbol.      
   function Z3_Get_Func_Decl_Name( C : in Z3_Context ; D : in Z3_Func_Decl ) return Z3_Symbol ;
   pragma Import(C,Z3_Get_Func_Decl_Name,"Z3_get_decl_name") ;

   -- Return declaration kind corresponding to declaration. 	  
   function Z3_Get_Func_Decl_Kind( C : in Z3_Context ; F : in Z3_Func_Decl ) return Z3_Decl_Kind ;
   pragma Import(C,Z3_Get_Func_Decl_Kind,"Z3_get_decl_kind") ;

   -- Return the number of parameters of the given declaration.      
   function Z3_Get_Domain_Size( C : in Z3_Context ; D : in Z3_Func_Decl ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Domain_Size,"Z3_get_domain_size") ; 

   -- Alias for Z3_get_domain_size.      
   function Z3_Get_Arity( C : in Z3_Context ; D : in Z3_Func_Decl ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Arity,"Z3_get_arity") ;

   -- Return the sort of the i-th parameter of the given function declaration.    
   function Z3_Get_Domain( C : in Z3_Context ; F : in Z3_Func_Decl ; I : in Interfaces.C.Unsigned ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Domain,"Z3_get_domain") ;

   -- Return the range of the given declaration.      
   function Z3_Get_Range( C : in Z3_Context ; F : in Z3_Func_Decl ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Range,"Z3_get_range") ;

   -- Return the number of parameters associated with a declaration.      
   function Z3_Get_Decl_Num_Parameters( C : in Z3_Context ; D : in Z3_Func_Decl ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Decl_Num_Parameters,"Z3_get_decl_num_parameters") ;

   -- Return the parameter type associated with a declaration.      
   function Z3_Get_Decl_Parameter_Kind( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_Parameter_Kind;
   pragma Import(C,Z3_Get_Decl_Parameter_Kind,"Z3_get_decl_parameter_kind") ;

   -- Return the integer value associated with an integer parameter.      
   function Z3_Get_Decl_Int_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Interfaces.C.Int ;
   pragma Import(C,Z3_Get_Decl_Int_Parameter,"Z3_get_decl_int_parameter") ;

   -- Return the double value associated with an double parameter.      
   function Z3_Get_Decl_Double_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Interfaces.C.Double ;
   pragma Import(C,Z3_Get_Decl_Double_Parameter,"Z3_get_decl_double_parameter") ;

   -- Return the double value associated with an double parameter.      
   function Z3_Get_Decl_Symbol_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_Symbol ;
   pragma Import(C,Z3_Get_Decl_Symbol_Parameter,"Z3_get_decl_symbol_parameter") ;

   -- Return the sort value associated with a sort parameter.    
   function Z3_Get_Decl_Sort_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Decl_Sort_Parameter,"Z3_get_decl_sort_parameter") ;

   -- Return the expresson value associated with an expression parameter.      
   function Z3_Get_Decl_Ast_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_Sort ;
   pragma Import(C,Z3_Get_Decl_Ast_Parameter,"Z3_get_decl_ast_parameter") ;
   
   --  	Return the expresson value associated with an expression parameter. 
   function Z3_Get_Decl_Func_Decl_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_Func_Decl ;
   pragma Import(C,Z3_Get_Decl_Func_Decl_Parameter,"Z3_get_decl_func_decl_parameter") ;
   
   -- Return the rational value, as a string, associated with a rational parameter.    
   function Z3_Get_Decl_Rational_Parameter( C : in Z3_Context ; D : in Z3_Func_Decl ; Idx : in Interfaces.C.Unsigned ) return Z3_String ;     
   pragma Import(C,Z3_Get_Decl_Rational_Parameter,"Z3_get_decl_rational_parameter") ;

   -- Convert a Z3_app into Z3_ast. This is just type casting.    
   function Z3_App_To_Ast( C : in Z3_Context ; A : in Z3_App ) return Z3_Ast ;
   pragma Import(C,Z3_App_To_Ast,"Z3_app_to_ast") ;

   -- Return the declaration of a constant or function application. 
   function Z3_Get_App_Decl( C : in Z3_Context ; A : in Z3_App ) return Z3_Ast ;
   pragma Import(C,Z3_Get_App_Decl,"Z3_get_app_decl") ;

   -- Return the number of argument of an application. If t is an constant, then the number of arguments is 0.  
   function Z3_Get_App_Num_Args( C : in Z3_Context ; A : in Z3_App ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_App_Num_Args,"Z3_get_app_num_args") ;

   -- Return the i-th argument of the given application.  
   function Z3_Get_App_Arg( C : in Z3_Context ; A : in Z3_App ; I : in Interfaces.C.Unsigned ) return Z3_Ast ;
   pragma Import(C,Z3_Get_App_Arg,"Z3_get_app_arg") ;

   -- compare terms.  
   function Z3_Is_Eq_Ast( C : in Z3_Context ; T1, T2 : in Z3_Ast ) return Z3_Bool ;
   pragma Import(C,Z3_Is_Eq_Ast,"Z3_is_eq_ast") ;

   -- Return a unique identifier for t.  
   function Z3_Get_Ast_Id( C : in Z3_Context ; T : in Z3_Ast ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Ast_Id,"Z3_get_ast_id") ;

   -- Return a hash code for the given AST.  
   function Z3_Get_Ast_Hash( C : in Z3_Context ; A : in Z3_Ast ) return Interfaces.C.Unsigned ;
   pragma Import(C,Z3_Get_Ast_Hash,"Z3_get_ast_hash") ;

   -- Return the sort of an AST node.  
   function Z3_Get_Sort( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Ast ;
   pragma Import(C,Z3_Get_Sort,"Z3_get_sort") ;

   -- Return true if the given expression t is well sorted.  
   function Z3_Is_Well_Sorted( C : in Z3_Context ; T : in Z3_Ast ) return Z3_Bool ;
   pragma Import(C,Z3_Is_Well_Sorted,"Z3_is_well_sorted") ;

   -- Return Z3_L_TRUE if a is true, Z3_L_FALSE if it is false, and Z3_L_UNDEF otherwise.  
   function Z3_Get_Bool_Value( C : in Z3_Context ; T : in Z3_Ast ) return Z3_Lbool ;
   pragma Import(C,Z3_Get_Bool_Value,"Z3_get_bool_value") ;

   -- Return the kind of the given AST.  
   function Z3_Get_Ast_Kind( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Ast_Kind ;
   pragma Import(C,Z3_Get_Ast_Kind,"Z3_get_ast_kind") ;

   function Z3_Is_App( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Bool ;
   pragma Import(C,Z3_Is_App,"Z3_is_app") ;
 
   function Z3_Is_Numeral_Ast( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Bool ;
   pragma Import(C,Z3_Is_Numeral_Ast,"Z3_is_numeral_ast") ;
 
   -- Return true if the give AST is a real algebraic number.    
   function Z3_Is_Algebraic_Number( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Bool ;
   pragma Import(C,Z3_Is_Algebraic_Number,"Z3_is_algebraic_number") ;

   -- Convert an ast into an APP_AST. This is just type casting.  
   function Z3_To_App( C : in Z3_Context ; A : in Z3_Ast ) return Z3_App ;
   pragma Import(C,Z3_To_App,"Z3_to_app") ;

   -- Convert an AST into a FUNC_DECL_AST. This is just type casting.  
   function Z3_To_Func_Decl( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Func_Decl ;
   pragma Import(C,Z3_To_Func_Decl,"Z3_to_func_decl") ;

   -- Return numeral value, as a string of a numeric constant term.  
   function Z3_Get_Numeral_String( C : in Z3_Context ; A : in Z3_Ast ) return Z3_String ;
   pragma Import(C,Z3_Get_Numeral_String,"Z3_get_numeral_string") ;

   -- Return numeral as a string in decimal notation. The result has at most precision decimal places.    
   function Z3_Get_Numeral_Decimal_String( C : in Z3_Context ; A : in Z3_Ast ; Precision : in Interfaces.C.Unsigned ) return Z3_String ;
   pragma Import(C,Z3_Get_Numeral_Decimal_String,"Z3_get_numeral_decimal_string") ;

   -- Return the numerator (as a numeral AST) of a numeral AST of sort Real. 
   function Z3_Get_Numerator( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Ast ;
   pragma Import(C,Z3_Get_Numerator,"Z3_get_numerator") ;

   -- Return the denominator (as a numeral AST) of a numeral AST of sort Real. 		   
   function Z3_Get_Denominator( C : in Z3_Context ; A : in Z3_Ast ) return Z3_Ast ;
   pragma Import(C,Z3_Get_Denominator,"Z3_get_denominator") ;

   -- Return numeral value, as a pair of 64 bit numbers if the representation fits.  
   function Z3_Get_Numeral_Small( C : in Z3_Context ; A : in Z3_Ast ; Num, Den : out Int_64_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Small,"Z3_get_numeral_small") ;

   -- Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine int. Return Z3_TRUE if the call succeeded.  
   function Z3_Get_Numeral_Int( C : in Z3_Context ; A : in Z3_Ast ; I : out Int_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Int,"Z3_get_numeral_int") ;

   -- Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine unsigned int. Return Z3_TRUE if the call succeeded.  
   function Z3_Get_Numeral_Uint( C : in Z3_Context ; V : in Z3_Ast ; U : out Unsigned_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Uint,"Z3_get_numeral_uint") ;

   -- Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine unsigned __int64 int. Return Z3_TRUE if the call succeeded.  
   function Z3_Get_Numeral_Uint64( C : in Z3_Context ; V : in Z3_Ast ; U : out Uint_64_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Uint64,"Z3_get_numeral_uint64") ;

   -- Similar to Z3_get_numeral_string, but only succeeds if the value can fit in a machine __int64 int. Return Z3_TRUE if the call succeeded.  
   function Z3_Get_Numeral_Int64( C : in Z3_Context ; V : in Z3_Ast ; I : out Int_64_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Int64,"Z3_get_numeral_int64") ;
 
   -- Similar to Z3_get_numeral_string, but only succeeds if the value can fit as a rational number as machine __int64 int. Return Z3_TRUE if the call succeeded.    
   function Z3_Get_Numeral_Rational_Int64( C : in Z3_Context ; V : in Z3_Ast ; Num, Den : out Int_64_Access ) return Z3_Bool ;
   pragma Import(C,Z3_Get_Numeral_Rational_Int64,"Z3_get_numeral_rational_int64") ;

   -- Return a lower bound for the given real algebraic number. The interval isolating the number is smaller than 1/10^precision. The result is a numeral AST of sort Real.  
   function Z3_Get_Algebraic_Number_Lower( C : in Z3_Context ; A : in Z3_Ast ; Precision : in Interfaces.C.Unsigned ) return Z3_Ast ;
   pragma Import(C,Z3_Get_Algebraic_Number_Lower,"Z3_get_algebraic_number_lower") ;

   -- Return a upper bound for the given real algebraic number. The interval isolating the number is smaller than 1/10^precision. The result is a numeral AST of sort Real.  
   function Z3_Get_Algebraic_Number_Upper( C : in Z3_Context ; A : in Z3_Ast ; Precision : in Interfaces.C.Unsigned ) return Z3_Ast ;
   pragma Import(C,Z3_Get_Algebraic_Number_Upper,"Z3_get_algebraic_number_upper") ;

 
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
   
   
   
   
end Bridge.Z3.Accessors;
