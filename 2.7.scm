(define cons-interval-vals cons)
(define lower-interval car)
(define upper-interval cdr)

(define (cons-interval-base-tol base tolerance)
	(let ((tol-val (* base tolerance)))
		(cons-interval-vals (- base tol-val) (+ base tol-val))
	)
)

(define (interval=? i1 i2)
	(and (= (lower-interval i1) (lower-interval i2))
			 (= (upper-interval i1) (upper-interval i2))
	)
)

(define (interval->string i)
	(string-append "(" (number->string (lower-interval i)) ", " (number->string (upper-interval i)) ")")
)

