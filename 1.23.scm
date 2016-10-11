(define (smallest-divisor n) (find-divisor n 2))
(define (prime? n) (= n (smallest-divisor n)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next-term test-divisor)))
  )
)

(define (divides? a b) (= (remainder b a) 0))

(define (next-term n)
  (+ n 1)

  ; this is not being used anymore because find-divisor
  ; is being used in other contexts where this optimization
  ; breaks it, ex 1.33
  ;(if (= n 2)
  ;  3
  ;  (+ n 2)
  ;)
)

(define (square n) (* n n))

