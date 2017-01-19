(load "accumulate.scm")

(define (count-leaves tree)
  (define (count-if-leaf tree state)
    (if (pair? tree)
      (+ state (count-leaves tree))
      (+ state 1)
    )
  )
  (accumulate count-if-leaf 0 tree)
)

