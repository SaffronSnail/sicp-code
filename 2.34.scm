(load "accumulate.scm")

(define (horner-eval x coefficient-sequence)
  (define* (horner-iteration coefficient state)
    (* x (+ coefficient state))
  )
  (+ (car coefficient-sequence)
     (accumulate horner-iteration 0 (cdr coefficient-sequence))
  )
)

