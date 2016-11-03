(define (filter-out lst predicate)
	(define (filter-out-iter lst predicate accumulator)
		(if (null? lst)
			accumulator
			(if (predicate (car lst))
				(filter-out-iter (cdr lst) predicate (cons (car lst) accumulator))
				(filter-out-iter (cdr lst) predicate accumulator)
			)
		)
	)
	(filter-out-iter lst predicate '())
)

(define (same-parity source . lst)
	(display lst) (newline)
	(filter-out lst (lambda (i) (= (modulo source 2) (modulo i 2))))
)

