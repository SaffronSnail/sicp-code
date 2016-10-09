; this is an implementation of Exercise 1.11

(define (square n) (* n n))

(define (fast-expt b n total)
  (cond ((= n 2) (* total (square n)))
        ((= n 1) total)
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

; (init-expt 2 4)
; (fast-expt 2 4 1)
; (fast-expt 2 2 4)
; 16

; (init-expt 2 2)
; (fast-expt 

