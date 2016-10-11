(define (square n) (* n n))

(define (fast-expt b n total)
  (cond ((= n 0) total)
	((even? n) (let ((half (/ n 2)))
		     (fast-expt b half (* total (init-expt b half)))
		   )
        )
	(else (fast-expt b (- n 1) (* b total)))
  )
)

(define (init-expt b n)
  (fast-expt b n 1)
)

