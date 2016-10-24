(define one-as-interval (cons-interval-vals 1 1))
(define (inverse-interval i) (divide-interval one-as-interval i))

(define (parallel-equivalent i1 i2)
	(inverse-interval
		(add-interval (inverse-interval i1)
									(inverse-interval i2)
		)
	)
)

