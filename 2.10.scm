(load "2.7.scm")

(define (divide-interval i1 i2)
	(when (or (= (upper-interval i2) 0) (= (lower-interval i2) 0)
						(= (upper-interval i1) 0) (= (lower-interval i2) 0)
				)
		(error "cannot divide when an interval endpoint is 0!")
	)
	(let ((val1 (/ (lower-interval i1) (lower-interval i2)))
				(val2 (/ (lower-interval i1) (upper-interval i2)))

				(val3 (/ (upper-interval i1) (lower-interval i2)))
				(val4 (/ (upper-interval i1) (upper-interval i2)))
			 )

		(cons-interval-vals (min val1 val2 val3 val4)
		                    (max val1 val2 val3 val4)
		)
	)
)

