package Ast.Defns is
   
   type Defn_Aux is new Ast_Abs with private;
   type Defn is access all Defn_Aux'Class;
   
private
   
   type Defn_Aux is new Ast_Abs with
      record
	 Fun_Name : Ident;
	 Fun_Args : Sort_List_Access;
  	 Fun_Res  : Sort;
  	 Fun_Annots : Annot_List_Access;
      end record;
   
end Ast.Defns;
