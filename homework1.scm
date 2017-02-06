; Homework 1
; Will Graham

(define (jobs_ok? Assignment Employees)
  (cond ((dupes? (flatten Assignment)) #F)
	(else #T)

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
(define (findSkills lst name)
  (cond ((null? lst) #f)
	((eqv? name (caar lst)) (cdar lst))
	(else (findSkills (cdr lst) name))
  )
)

; Checks a name for phone skill
(define (phoneSkill? lst name)
  (cond ((= 1 (car (findSkills lst name))) #T)
	(else #F)
  )
)

; Checks a name for computers skill
(define (compSkill? lst name)
  (cond ((= 1 (cadr (findSkills lst name))) #T)
	(else #F)
  )
)

; Checks a name for network skill
(define (netSkill? lst name)
  (cond ((= 1 (caddr (findSkills lst name))) #T)
	(else #F)
  )
)
