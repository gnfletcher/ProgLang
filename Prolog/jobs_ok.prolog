% Programming Languages Prolog HW
% Authors: Sean O'Donnell, Will Graham

% jobs_ok(+Assignment, +Employees)
% True if no duplicates in Assignment, and skills are appropriate
jobs_ok(Assignment, Employees) :- noDupes(Assignment),
				  assignOK(Assignment, Employees).

% noDupes(-L)
% True if the list contains no duplicate elements
noDupes(L) :- flatten(L, N),
	      is_set(N).

% findEmpSkills(+Name, +Employees, -Skills)
% Given an employee's name and the list of employee records, union the
% employee's skills list into Skills variable.
findEmpSkills(Name, [[Name | Skills] | _ ], Skills).
findEmpSkills(Name, [_ | T], Skills) :-
    findEmpSkills(Name, T, Skills).

% doesSkill(+Name, +Employees)
% True if for specified skill, the named employee can perform said skill.
doesPhone(Name, Employees) :- findEmpSkills(Name, Employees, X),
			      X = [1, _, _].
doesComp(Name, Employees) :- findEmpSkills(Name, Employees, X),
			     X = [_, 1, _].
doesNet(Name, Employees) :- findEmpSkills(Name, Employees, X),
			    X = [_, _, 1].

% shiftOK(+Shift, +Employees)
% True if the given shift list (4 employees) can all perform required skills.
shiftOK([W,X,Y,Z], Employees) :- doesPhone(W, Employees),
				 doesPhone(X, Employees),
				 doesComp(Y, Employees),
				 doesNet(Z, Employees).

% assignOK(+Assignment, +Employees)
% True if every shift is a valid shift, given the overall shift list and list
% employee records
assignOK([], _).
assignOK([Shift | OtherShifts], Employees) :- shiftOK(Shift, Employees),
					      assignOK(OtherShifts, Employees).
