(load "accumulate.scm")
(load "2.36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m)
)

(define (transpose m)
  (define (operator current state)
    (cons current state)
  )
  (accumulate-n operator '() m)
)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (define (operator x)
      (display x) (newline)
      (display n) (newline)
      (matrix-*-vector cols x)
    )
    (map operator m)
  )
)

