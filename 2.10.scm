(load "2.7.scm")

(define (divide-interval i1 i2)
	(when (or (= (upper-interval i2) 0) (= (lower-interval i2) 0)
						(= (upper-interval i1) 0) (= (lower-interval i2) 0)
				)
		(error "cannot divide when an interval endpoint is 0!")
	)

	(cons-interval-vals (/ (lower-interval i1) (upper-interval i2))
								 (/ (upper-interval i1) (lower-interval i2))
	)
)

