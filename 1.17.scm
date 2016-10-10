; given functions
(define (double x) (* x 2))
(define (half x) (/ x 2))

; implementation
(define (mul-iter a b total)
  (cond ((= b 0) total)
        ((even? b) (+ total (double (mul a (half b)))))
        (else (mul-iter a (- b 1) (+ a total)))
  )
)

(define (mul a b)
  (mul-iter a b 0)
)

