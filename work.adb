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
   
begin -- Main bodt
   
   GetAssignments;
   Put(A(2)(3));
   
end Work;
