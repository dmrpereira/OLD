with Interfaces.C, Interfaces.C.Strings;
with Ada.Unchecked_Conversion;
with System;

package Bridge.Z3.Models is 
   
   -------------
   --  Models --
   -------------
   
   -- Increment the reference counter of the given model. 
   --  void Z3_API 	Z3_model_inc_ref (__in Z3_context c, __in Z3_model m)
   
   -- Decrement the reference counter of the given model. 
   --  void Z3_API 	Z3_model_dec_ref (__in Z3_context c, __in Z3_model m)
   
   -- Evaluate the AST node t in the given model. Return Z3_TRUE if succeeded, and store the result in v.If model_completion
   -- is Z3_TRUE, then Z3 will assign an interpretation for any consta     nt or function that does not have an interpretation
   -- in m. These constants and functions were essentially don't cares. 
   --  Z3_bool Z3_API 	Z3_model_eval (__in Z3_context c, __in Z3_model m, __in Z3_ast t, __in Z3_bool model_completion, __out Z3_ast *v)

   -- Return the interpretation (i.e., assignment) of constant a in the model m. Return NULL, if the model does not assign an interpretation for a. That should be interpreted as: the value of a does not matter.    
   --  Z3_ast Z3_API 	Z3_model_get_const_interp (__in Z3_context c, __in Z3_model m, __in Z3_func_decl a)

   -- Return the interpretation of the function f in the model m. Return NULL, if the model does not assign an interpretation for f. That should be interpreted as: the f does not matter.    
   --  Z3_func_interp Z3_API 	Z3_model_get_func_interp (__in Z3_context c, __in Z3_model m, __in Z3_func_decl f)
   
   -- Return the number of constants assigned by the given model.    
   --  unsigned Z3_API 	Z3_model_get_num_consts (__in Z3_context c, __in Z3_model m)
   
   -- Return the i-th constant in the given model. 
   --  Z3_func_decl Z3_API 	Z3_model_get_const_decl (__in Z3_context c, __in Z3_model m, __in unsigned i)
   
   -- Return the number of function interpretations in the given model.  
   --  unsigned Z3_API 	Z3_model_get_num_funcs (__in Z3_context c, __in Z3_model m)

   -- Return the declaration of the i-th function in the given model.  
   --  Z3_func_decl Z3_API 	Z3_model_get_func_decl (__in Z3_context c, __in Z3_model m, __in unsigned i)

   -- Return the number of uninterpreted sorts that m assigs an interpretation to.  
   --  unsigned Z3_API 	Z3_model_get_num_sorts (__in Z3_context c, __in Z3_model m)

   -- Return a uninterpreted sort that m assigns an interpretation.  
   --  Z3_sort Z3_API 	Z3_model_get_sort (__in Z3_context c, __in Z3_model m, __in unsigned i)

   -- Return the finite set of distinct values that represent the interpretation for sort s.  
   --  Z3_ast_vector Z3_API 	Z3_model_get_sort_universe (__in Z3_context c, __in Z3_model m, __in Z3_sort s)

   -- The (_ as-array f) AST node is a construct for assigning interpretations for arrays in Z3. It is the array such that forall indices i we have that (select (_ as-array f) i) is equal to (f i). This procedure returns Z3_TRUE if the a is an as-array AST node.  
   --  Z3_bool Z3_API 	Z3_is_as_array (__in Z3_context c, __in Z3_ast a)

   -- Return the function declaration f associated with a (_ as_array f) node.  
   --  Z3_func_decl Z3_API 	Z3_get_as_array_func_decl (__in Z3_context c, __in Z3_ast a)

   -- Increment the reference counter of the given Z3_func_interp object.  
   --  void Z3_API 	Z3_func_interp_inc_ref (__in Z3_context c, __in Z3_func_interp f)

   -- Decrement the reference counter of the given Z3_func_interp object.  
   --  void Z3_API 	Z3_func_interp_dec_ref (__in Z3_context c, __in Z3_func_interp f)

   -- Return the number of entries in the given function interpretation.  
   --  unsigned Z3_API 	Z3_func_interp_get_num_entries (__in Z3_context c, __in Z3_func_interp f)

   -- Return a "point" of the given function intepretation. It represents the value of f in a particular point.  
   --  Z3_func_entry Z3_API 	Z3_func_interp_get_entry (__in Z3_context c, __in Z3_func_interp f, unsigned i)

   -- Return the 'else' value of the given function interpretation.  
   --  Z3_ast Z3_API 	Z3_func_interp_get_else (__in Z3_context c, __in Z3_func_interp f)

   -- Return the arity (number of arguments) of the given function interpretation.  
   --  unsigned Z3_API 	Z3_func_interp_get_arity (__in Z3_context c, __in Z3_func_interp f)

   -- Increment the reference counter of the given Z3_func_entry object.  
   --  void Z3_API 	Z3_func_entry_inc_ref (__in Z3_context c, __in Z3_func_entry e)

   -- Decrement the reference counter of the given Z3_func_entry object.  
   --  void Z3_API 	Z3_func_entry_dec_ref (__in Z3_context c, __in Z3_func_entry e)

   -- Return the value of this point.  
   --  Z3_ast Z3_API 	Z3_func_entry_get_value (__in Z3_context c, __in Z3_func_entry e)

   -- Return the number of arguments in a Z3_func_entry object.  
   --  unsigned Z3_API 	Z3_func_entry_get_num_args (__in Z3_context c, __in Z3_func_entry e)

   -- Return an argument of a Z3_func_entry object.    
   --  Z3_ast Z3_API 	Z3_func_entry_get_arg (__in Z3_context c, __in Z3_func_entry e, __in unsigned i)
   
end Bridge.Z3.Models ;
