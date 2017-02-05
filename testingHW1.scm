; Test methods for Homework 1
; Will Graham

; Should return #T
(define (test1)
  (jobs_ok?
   '(
	(Park Dunbar Khan Lloyd)
	(Bashir Trivedi Ramos Franklin)
	(Schmidt Nakamura Andrews Chen)
	(Evans Goldberg Macmillan Ortiz))
   '(
	(Andrews 1 1 1)
	(Bashir 1 1 1)
	(Chen 1 1 1)
	(Dunbar 1 1 1)
	(Evans 1 1 1)
	(Franklin 1 1 1)
	(Goldberg 1 1 1)
	(Jefferson 1 1 1)
	(Khan 1 1 1)
	(Lloyd 1 1 1)
	(Macmillan 1 1 1)
	(Nakamura 1 1 1)
	(Ortiz 1 1 1)
	(Park 1 1 1)
	(Ramos 1 1 1)
	(Schmidt 1 1 1)
	(Trivedi 1 1 1)))
  )

; Should return #F
(define (test2)
  (jobs_ok?
   '(
	(Young Collins Vieira Liu)
	(Davis Ericson Kelly Singh)
	(Fitzgerald Gutierrez Martinez Tortorella)
	(Hughes Jones Patel Zimmerman))
   '(
	(Aziz 1 0 0)
	(Blumenthal 0 1 1)
	(Collins 1 1 1)
	(Davis 1 0 0)
	(Ericson 1 0 0)
	(Fitzgerald 1 0 1)
	(Gutierrez 1 0 1)
	(Hughes 1 0 0)
	(Jones 1 1 1)
	(Kelly 0 1 1)
	(Liu 1 0 1)
	(Martinez 0 1 1)
	(Patel 1 1 1)
	(Qureshi 1 1 0)
	(Rodriguez 1 0 0)
	(Singh 0 1 1)
	(Tortorella 0 0 1)
	(Vieira 0 1 0)
	(Young 0 1 0)
	(Zimmerman 1 1 1)))
  )
