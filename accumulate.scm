(define (accumulate-recursive op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate-recursive op initial (cdr sequence))
    )
  )
)

(define (accumulate-iterative op initial sequence)
  (define* (iteration op sequence #:key (state initial))
    (if (null? sequence)
      state
      (iteration op (cdr sequence) #:state (op (car sequence) state))
    )
  )
  (iteration op (reverse sequence))
)

(define accumulate accumulate-recursive)

