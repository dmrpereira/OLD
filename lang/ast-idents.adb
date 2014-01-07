package body Ast.Idents is
   
   function Build_Ident(N:in String;I:in Natural) return Ident is
      Id : Ident;
   begin
      Id.Ident_Name := Build_Name(N);
      Id.Ident_Idxs.Append(I);
      return Id;
   end Build_Ident;
   
   function Build_Ident(N:in String) return Ident is
      Id : Ident;
   begin
      Id.Ident_Name := Build_Name(N);
      return Id;
   end Build_Ident;
   
   function Exists_Ident_Idx(N:in Ident;I:in Natural) return Boolean is
      C : Cursor;
   begin
      C := Find(N.Ident_Idxs,I);
      return (C /= No_Element);
   end Exists_Ident_Idx;
   
   procedure Add_Idx(Id:in out Ident;N:in Natural) is
      C : Cursor;
   begin
      C := Find(Id.Ident_Idxs,N);
      if C = No_Element then
	 Append(Id.Ident_Idxs,N);
      end if;
   end Add_Idx;
   
   procedure Rm_Idx(Id:in out Ident;N:in Natural) is
      C : Cursor;
   begin
      C := Find(Id.Ident_Idxs,N);
      if C /= No_Element then
	 Delete(Id.Ident_Idxs,C);
      end if;
   end Rm_Idx;
      
   function Image(X:in Ident) return String is
   begin
      return (Image(X.Ident_Name));
   end Image;
   
   function "="(X, Y:in Ident) return Boolean is
   begin
      return (X.Ident_Name = Y.Ident_Name);
   end "=";
   
   function "<"(X, Y:in Ident) return Boolean is
   begin
      return (X.Ident_Name < Y.Ident_Name);
   end "<";
      
   function Idxs_Image(X:in Ident) return String is
      Xs : String := Image(X);
   begin
      if Indexes_List.Length(X.Ident_idxs) > 0 then
	 declare
	    C : Cursor := First(X.Ident_Idxs);
	    S : Unbounded_String := Null_Unbounded_String;
	 begin
	    while C /= Last(X.Ident_Idxs) loop
	       Append(S,Xs&"_"&Element(C)'Img);
	       C := Next(C);
	       if C /= Last(X.Ident_Idxs) then
		  Append(S,",");
	       end if;
	    end loop;
	    return To_String(S);
	 end;
      end if;
      return Xs;
   end Idxs_Image; 
         
end Ast.Idents;
