-- Homework #2
-- Programming Languages
-- Author: Will Graham
-- Date: Feb. 2017


with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Work is
   type Assignments is array (1..4) of String(1..7); --Array length 4, of size 7 Strings (allows for "A B C D")
   A: Assignments;
   
   -- Gets 4 lines of 4 characters (3 spaces in between), store them in array A
   procedure GetAssignments is 
   begin   
      for I in A'Range loop
	 Get(A(I));
      end loop;
   end GetAssignments;
   
   -- Use array of 65..90, if array(Character'Pos(i)) is empty, set it to 1, move on. Else, dupe.
   function CheckDupes return Boolean is
      type Temp is array(65..90) of Boolean with Default_Component_Value => False;
      T: Temp;
      Curr: Integer := 1;
   begin      
      for X in A'Range loop
	 for I in Integer range 1..7  loop
	    if A(X)(I) /= ' ' then
	       if T(Character'Pos(A(X)(I))) = False then
		  T(Character'Pos(A(X)(I))) := True;
	       else
		  return True;
	       end if;   
	    end if;
	 end loop;
      end loop;
      
      return False;
   end CheckDupes;
   
   
   
begin -- Main bodt
   
   GetAssignments;
   
   --TODO: This should _should_ occur after all input is entered
   if CheckDupes = True then
      Put_Line("Not Acceptable");
   end if;
   
   --Put(Character'Pos('A'));
   
end Work;
