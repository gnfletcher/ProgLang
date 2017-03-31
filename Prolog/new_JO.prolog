% jobs_ok(+Assignment, +Employees)
% True if no duplicates in Assignments, and every employee has required skill.
jobs_ok(Assignment, Employees) :- noDupes(Assignment), assignOK(Assignment, Employees).

% noDupes(+List)
% True if list, when flattened contains no duplicate elements
noDupes(Assignment) :- flatten(Assignment, X), is_set(X).

% findEmpSkills(+Name, +List, -Skills)
% True if Name is 1st element of 1st element, and Skills is unioned with Employee's skill list
findEmpSkills(Name, [[Name | Skills] | _], Skills).
findEmpSkills(Name, [_ | T], Skills) :- findEmpSkills(Name, T, Skills).

% doesSkill(+Name, +List)
% True if named employee can perform specified skill
doesPhone(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [1, _, _].
doesComp(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [_, 1, _].
doesNet(Name, Employees) :- findEmpSkills(Name, Employees, X), X = [_, _, 1].

shift_OK([A,B,C,D], Employees) :- doesPhone(A, Employees),
				  doesPhone(B, Employees),
				  doesComp(C, Employees),
				  doesNet(D, Employees).

assignOK([], _).
assignOK([H | T], Employees) :- shift_OK(H, Employees),
				assignOK(T, Employees).
