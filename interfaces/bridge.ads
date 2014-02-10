package Bridge is
   
   type Context_Val is tagged private ;
   
   type Context is access all Context_Val'Class ;
   
   function Mk_Context return Context is abstract ;
   
private
   
   type Context_Val is tagged null record ;
   
end Bridge ;
