-- Homework #2
-- Programming Languages
-- Author: Will Graham
-- Date: Feb. 2017


with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Work is
   type Assignments is array (1..4, 1..4) of Character; -- 4 shifts, with 4 workers in each shift
   A: Assignments;
   N: Integer;  -- Number of worker records to take in
   
   -- Gets 4 lines of 4 characters (3 spaces in between), store them in array A
   procedure GetAssignments is 
      Delim: Character;  -- Garbage collecter for spaces between letters, not used otherwise
   begin   
      for I in A'Range(1) loop  -- Get char, throw away space, repeat, repeatx4
	 Get(A(I, 1));
	 Get(Delim);
	 Get(A(I, 2));
	 Get(Delim);
	 Get(A(I, 3));
	 Get(Delim);
	 Get(A(I, 4));
	 Skip_Line;
      end loop;
   end GetAssignments;
   
   -- Use array of 65..90, if array(Character'Pos(i)) is empty, set it to 1, move on. Else, dupe.
   function CheckDupes return Boolean is
      type Uniq is array(65..90) of Boolean with Default_Component_Value => False;
      T: Uniq;
      Curr: Integer := 1;
   begin      
      for X in A'Range(1) loop
	 for I in A'Range(2)  loop	    
	    if T(Character'Pos(A(X, I))) = False then
	       T(Character'Pos(A(X, I))) := True;
	    else  -- Dupe found
	       return True;
	    end if;
	 end loop;
      end loop;
      
      return False;  -- No dupes found
   end CheckDupes;
   
   function GetRecords return Boolean is
   begin
      return False;
      
      
   end GetRecords;
   
begin -- Main body
   
   GetAssignments;
   
   --Get(N);
   
   --TODO: This should _should_ occur after all input is entered
   if CheckDupes = True then
      Put_Line("Not Acceptable");
      return;
   else
      Put_Line("Fine.");
   end if;
   --Put(Character'Pos(A(1,2)));
   
end Work;
