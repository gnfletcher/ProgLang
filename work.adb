-- Homework #2
-- Programming Languages
-- Authors: Will Graham, Sean O'Donnell
-- Date: Feb. 2017


with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Work is
   type Assignments is array (1..4, 1..4) of Character;
   Assigns: Assignments;
   
   type Employee is record
      Name: Character;
      Phone: Integer;
      Repair: Integer;
      Net: Integer;
   end record;
   
   type Emp_Records is array (1..26) of Employee;
   Recs: Emp_Records;
   Num_Employees: Integer;  -- Number of worker records to take in
   
   -- Gets 4 lines of 4 characters (3 spaces in between)
   procedure GetAssignments is 
      Delim: Character;  -- Throw away spaces
   begin   
      for I in Assigns'Range(1) loop  -- Get char, throw away space, etc.
	 Get(Assigns(I, 1));
	 Get(Delim);
	 Get(Assigns(I, 2));
	 Get(Delim);
	 Get(Assigns(I, 3));
	 Get(Delim);
	 Get(Assigns(I, 4));
	 Skip_Line;
      end loop;
   end GetAssignments;
   
   -- Gets ASCII value of current char mod 32 (case insensitive) then checks
   -- position in temp array default w/ False. If false, flip to true. Else,
   -- there must be a dupe.
   function CheckDupes return Boolean is
      type Uniq is array(1..26) of Boolean with Default_Component_Value => False;
      T: Uniq;
   begin      
      for X in Assigns'Range(1) loop
	 for I in Assigns'Range(2)  loop	    
	    if T(Character'Pos(Assigns(X, I)) mod 32) = False then
	       T(Character'Pos(Assigns(X, I)) mod 32) := True;
	    else  -- Dupe found
	       return True;
	    end if;
	 end loop;
      end loop;
      
      return False;  -- No dupes found
   end CheckDupes;
   
   -- Phone, Repair, Net
   procedure GetRecords is
   begin
      for X in 1..Num_Employees loop
	 Get(Recs(X).Name);
	 Get(Recs(X).Phone);
	 Get(Recs(X).Repair);
	 Get(Recs(X).Net);
	 Skip_Line;
      end loop;     
   end GetRecords;
   
   function Does_Phone(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..Num_Employees loop
	 if Recs(X).Name = Name then
	    Rec := Recs(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Phone = 1;
   end Does_Phone;
   
   function Does_Repair(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..Num_Employees loop
	 if Recs(X).Name = Name then
	    Rec := Recs(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Repair = 1;
   end Does_Repair;
   
   function Does_Net(Name: in Character) return Boolean is
      Rec: Employee;
   begin
      for X in 1..Num_Employees loop
	 if Recs(X).Name = Name then
	    Rec := Recs(X);
	    exit;
	 end if;	    
      end loop;
      return Rec.Net = 1;
   end Does_Net;
   
   function Assignments_Fine return Boolean is
   begin
      for X in Assigns'Range(1) loop
	 if not Does_Phone(Assigns(X,1)) or not Does_Phone(Assigns(X,2)) or 
	   not Does_Repair(Assigns(X,3)) or not Does_Net(Assigns(X,4)) then
	    return False;
	 end if;	 
      end loop;            
      return True;
   end Assignments_Fine;
   
begin -- Main body
   
   GetAssignments;   
   Get(Num_Employees);
   GetRecords;
   
   
   if CheckDupes = True or Assignments_Fine = False Then
      Put_Line("Not Acceptable");
      return;
   end if;
   Put_Line("Acceptable");
   
end Work;
