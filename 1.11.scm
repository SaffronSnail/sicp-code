; this is an implementation of Exercise 1.11

(define (recursive n)
  (cond
    ((< n 3) n)
    (else 
      (+ (recursive (- n 1))
         (* 2 (recursive (- n 2)))
         (* 3 (recursive (- n 3)))
      )
    )
  )
)

(define (iterative n one-less two-less three-less current-total)
  (cond
    ((< n 3) n)
    (else
      (iterative (- n 1) )
    )
  )
)

