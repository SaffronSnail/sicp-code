(load "2.7.scm")
(load "2.10.scm")
(load "2.11.scm")

(define one-as-interval (cons-interval-vals 1 1))
(define (inverse-interval i) (divide-interval one-as-interval i))

(define (par1 i1 i2)
	(divide-interval (multiply-interval i1 i2)
									 (add-interval      i1 i2)
	)
)

(define (par2 i1 i2)
	(inverse-interval
		(add-interval (inverse-interval i1)
									(inverse-interval i2)
		)
	)
)

