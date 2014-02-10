package Engine is
   
   type Instr_Aux is abstract tagged null record;
   type Instr is access all Instr_Aux'Class;
   
   function Image(I:in Instr_Aux) return String is abstract;
   
end Engine;
