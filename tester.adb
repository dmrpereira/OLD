with Ada.Text_Io; use Ada.Text_Io;

--with Commands; use Commands;
with Engine; use Engine;
--with Engine.Infos; use Engine.Infos;
--with Engine.Options; use Engine.Options;
with Engine.Commands; use Engine.Commands;

--with Ast; use Ast;
--with Ast.Idents; use Ast.Idents;
--with Ast.Quants; use Ast.Quants;
--with Ast.Types; use Ast.Types;
with Ast.Names; use Ast.Names;
--with Ast.Binders; use Ast.Binders;
--with Ast.Literals; use Ast.Literals;
--with Ast.Exprs; use Ast.Exprs;


--with Ast.High_Level; use Ast.High_Level;
--with Bvs; use Bvs;
--with Ast_Functions; use Ast_Functions;


--with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Tester is
   C : Command := null;
   
   subtype Name is Ast.Names.Name;
   
   N : Name := null;
begin
   C := Mk_Cmd_Set_Logic(Build_Name("FOL"));
   Put(Image(C));
end Tester;
