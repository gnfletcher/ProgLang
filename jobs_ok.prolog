% Programming Prolog Languages HW
% Authors: Sean O'Donnell, Will Graham

% jobs_ok(+Assignment, +Employees)
% True if no duplicates in Assignment, and skills are appropriate
jobs_ok(Assignment, Employees) :- noDupes(Assignment), %CHECK SKILLS HERE

% noDupes(-L)
% True if the list contains no duplicate elements				  
noDupes(L) :- flatten(L, N), is_set(N).
