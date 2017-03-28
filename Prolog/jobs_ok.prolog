% Programming Languages Prolog HW
% Authors: Sean O'Donnell, Will Graham

% jobs_ok(+Assignment, +Employees)
% True if no duplicates in Assignment, and skills are appropriate
jobs_ok(Assignment, Employees) :- noDupes(Assignment),
				  assignOK(Assignment, Employees).

% noDupes(-L)
% True if the list contains no duplicate elements
noDupes(L) :- flatten(L, N),is_set(N).

findEmpSkills(Name, [[Name | Skills] | _ ], Skills).
findEmpSkills(Name, [_ | T], Skills) :-
    findEmpSkills(Name, T, Skills).

doesPhone(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [1, _, _].
doesComp(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [_, 1, _].
doesNet(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [_, _, 1].


shiftOK([W,X,Y,Z], Employees) :- doesPhone(W, Employees),
				 doesPhone(X, Employees),
				 doesComp(Y, Employees),
				 doesNet(Z, Employees).



assignOK([], Employees).
assignOK([Shift | OtherShifts], Employees) :- shiftOK(Shift, Employees),
					      assignOK(OtherShifts, Employees).
