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

(define (iterative n max-n one-less two-less three-less current-total)
  (if (> n max-n)
    current-total
    (let ((current-iteration (+ one-less (* 2 two-less) (* 3 three-less))))
      (iterative (+ n 1) max-n
                 current-iteration one-less two-less
                 (+ current-total current-iteration)
      )
    )
  )
)

(define (start-iterative n)
  (iterative 3 n 2 1 0 0)
)

