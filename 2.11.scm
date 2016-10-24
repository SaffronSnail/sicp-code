(load "2.7.scm")

(define (multiply-interval i1 i2)
	(let* ((case1  (symbol->string (neg-pos-case i1)))
				 (case2  (symbol->string (neg-pos-case-i2)))
				 (solver (eval (string->symbol (string-append "multiply-interval-" case1 "-" case2))))
				)
		(solver i1 i2)
	)
)

(define (neg-pos-case interval)
	(let ((lower (lower-interval interval))
				(upper (upper-interval interval))
			 )
		(if (negative? lower)
			(if (negative? upper)
				'neg-neg
				'neg-pos
			)
			'pos-pos ; it's invalid to have a pos-neg case
		)
	)
)

(define (multiply-interval-neg-neg-neg-neg i1 i2)
	(cons-interval-vals (* (upper-interval i1) (upper-interval i2))
	                    (* (lower-interval i1) (lower-interval i2))
	)
)

(define (multiply-interval-neg-neg-neg-pos i1 i2)
	(cons-interval-vals (* (lower-interval i1) (upper-interval i2))
	                    (* (lower-interval i1) (lower-interval i2))
	)
)

(define (multiply-interval-neg-neg-pos-pos i1 i2)
	(cons-interval-vals (* (lower-interval i1) (upper-interval i2))
	                    (* (upper-interval i1) (lower-interval i2))
	)
)

(define (multiply-interval-neg-pos-neg-neg i1 i2)
	(cons-interval-vals (* (upper-interval i1) (lower-interval i2))
	                    (* (lower-interval i1) (lower-interval i2))
	)
)

(define (multiply-interval-neg-pos-neg-pos i1 i2)
	; I am 99% certain there is a more efficient way to do this, but
	; I'm going to worry about that after I refactor the code
	(let ((j1 (* (lower-interval i1) (lower-interval i2)))
	      (j2 (* (lower-interval i1) (upper-interval i2)))
	      (j3 (* (upper-interval i1) (lower-interval i2)))
	      (j4 (* (upper-interval i1) (upper-interval i2)))
	     )
		(cons-interval-vals (min j1 j2 j3 j4) (max j1 j2 j3 j4))
	)
)

(define (multiply-interval-neg-pos-pos-pos i1 i2)
	(cons-interval-vals (* (lower-interval i1) (upper-interval i2))
	                    (* (upper-interval i1) (upper-interval i2))
	)
)

(define (multiply-interval-pos-pos-neg-neg i1 i2)
	(cons-interval-vals (* (upper-interval i1) (lower-interval i2))
	                    (* (lower-interval i1) (upper-interval i2))
	)
)

(define (multiply-interval-pos-pos-neg-pos i1 i2)
	(cons-interval-vals (* (upper-interval i1) (lower-interval i2))
	                    (* (upper-interval i1) (upper-interval i2))
	)
)

(define (multiply-interval-pos-pos-pos-pos i1 i2)
	(cons-interval-vals (* (lower-interval i1) (lower-interval i2))
	                    (* (upper-interval i1) (upper-interval i2))
	)
)

