(define first-denomination car)
(define except-first-denomination cdr)
(define no-more? null?)

(define (cc amount coin-values)
	(cond ((= amount 0) 1)
				((or (< amount 0) (no-more? coin-values)) 0)
				(else (+ (cc amount
										 (except-first-denomination coin-values)
								 )
								 (cc (- amount (first-denomination coin-values))
										 coin-values
								 )
							)
				)
	)
)

(define (count-change amount) (cc amount 5))
(define us-coins (list 1 5 10 25 50))
(define uk-coins (list 100 50 20 10 5 2 1 .5))
(define uk-coins (reverse uk-coins))

