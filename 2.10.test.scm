(load "2.10.scm")

(define (division-test i1 i2 iexpected)
	(let ((result (divide-interval i1 i2)))
		(unless (interval=? result iexpected)
			(error (string-append "When dividing " (interval->string i1) " and " (interval->string i2)
														" recieved " (interval->string result) " instead of "
														(interval->string iexpected)
						 )
			) 
		)
	)
)

; normally I would cover all the positive/negative cases, but
; I wrote these really just to make sure the code didn't do
; anything really stupid (like bad syntax) before working on
; 2.13; if I were to opitmize the division code like the
; multiplication code, I would expand the coverage
(division-test (cons-interval-vals 2 4)
               (cons-interval-vals 3 5)
               (cons-interval-vals (/ 2 5) (/ 4 3))
)

(division-test (cons-interval-vals -2 -4)
							 (cons-interval-vals 3 5)
							 (cons-interval-vals (/ -4 3) (/ -2 5))
)

(division-test (cons-interval-vals -2 4)
							 (cons-interval-vals -3 5)
							 (cons-interval-vals (/ 4 -3) (/ 4 5))
)

(division-test (cons-interval-vals -2 -4)
               (cons-interval-vals -3 5)
							 (cons-interval-vals (/ -4 5) (/ -4 -3))
)

(display "All tests passed successfully!")
(newline)

