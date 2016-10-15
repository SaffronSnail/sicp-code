(define (percentage num)
	(/ num 100)
)

(define (cons-interval base tolerance)
	(let (tol-val (* base tolerance))
		(cons (- base tol-val) (+ base tol-val))
	)
)

(define (lower-interval interval)
	(car interval)
)

(define (upper-interval interval)
	(cdr interval)
)

(define (add-interval i1 i2)
	(cons-interval (+ (lower-interval i1) (lower-interval i2))
								 (+ (upper-interval i1) (upper-interval i2))
	)
)

(define (divide-interval i1 i2)
	(when (or (= (upper-interval i2) 0) (= (lower-interval i2) 0)
						(= (upper-interval i1) 0) (= (lower-interval i2) 0)
				)
		(error "cannot divide when an interval endpoint is 0!")
	)

	(cons-interval (/ (lower-interval i1) (upper-interval i2))
								 (/ (upper-interval i1) (lower-interval i2))
	)
)

(define (multiply-interval i1 i2)
	(cons-interval (* (lower-interval i1) (lower-interval i2))
								 (* (upper-interval i1) (upper-interval i2))
	)
)

(define (subtract-interval i1 i2)
	
)

(define one-as-interval (cons-interval 1 0))
(define (inverse-interval i) (divide-interval one-as-interval i))

(define (parallel-equivalent i1 i2)
	(inverse-interval
		(add-interval (inverse-interval i1)
									(inverse-interval i2)
		)
	)
)

