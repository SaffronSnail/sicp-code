(define (for-each consumer lst)
	(unless (null? lst)
		(consumer (car lst))
		(for-each consumer (cdr lst))
	)
)

