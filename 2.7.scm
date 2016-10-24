(define cons-interval-vals cons)
(define lower-interval car)
(define upper-interval cdr)

(define (cons-interval-base-tol base tolerance)
	(let ((tol-val (* base tolerance)))
		(cons-interval-vals (- base tol-val) (+ base tol-val))
	)
)

