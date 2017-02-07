; Homework 1
; Will Graham

(define (jobs_ok? Assignment Employees)
  (cond ((dupes? (flatten Assignment)) #F)
	((employees_ok? Assignment Employees) #T)
	(else #F)

  )
)

; Checks input list for duplicate elements
(define (dupes? lst)
  (cond ((null? lst) #f)
	((member (car lst) (cdr lst)) #t)
	(else (dupes? (cdr lst)))
	)
)

; Flattens a list with nested lists into a list of depth 1
(define (flatten lst)
  (cond ((null? lst) '())
	((pair? (car lst)) (append (flatten (car lst)) (flatten (cdr lst))))
	(else (cons (car lst) (flatten (cdr lst)))))
  )

; Finds skills list for given employee
(define (findSkills emplst name)
  (cond ((null? emplst) #f)
	((eqv? name (caar emplst)) (cdar emplst))
	(else (findSkills (cdr emplst) name))
  )
)

; Checks a name for phone skill
(define (phoneSkill? emplst name)
  (cond ((= 1 (car (findSkills emplst name))) #T)
	(else #F)
  )
)

; Checks a name for computers skill
(define (compSkill? emplst name)
  (cond ((= 1 (cadr (findSkills emplst name))) #T)
	(else #F)
  )
)

; Checks a name for network skill
(define (netSkill? emplst name)
  (cond ((= 1 (caddr (findSkills emplst name))) #T)
	(else #F)
  )
)

; Checks list of 4 employees for required skills
(define (skills_ok? shiftlst emplst)
  (cond ((eqv? #F (phoneSkill? emplst (car shiftlst))) #F)
	((eqv? #F (phoneSkill? emplst (cadr shiftlst))) #F)
	((eqv? #F (compSkill? emplst (caddr shiftlst))) #F)
	((eqv? #F (netSkill? emplst (cadddr shiftlst))) #F)
  )
)

; Overall method to check all shifts of employees for skills
(define (employees_ok? shiftlst emplst)
  (cond ((null? shiftlst) #T)
	((eqv? #F (skills_ok? (car shiftlst) emplst)) #F)
	(else (employees_ok? (cdr shiftlst) emplst))
  )
)
