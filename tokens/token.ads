-- Description on shared data and inheritance is page 21
package Token is

   type Token is tagged null record;

   type Token_Access is access all Token'Class;

end Token;


