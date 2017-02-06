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

