(use-modules (srfi srfi-1))

(define (average-aux items num-processed total)
  (if (null? items)
    (/ total num-processed)
    (average-aux (drop items 1) (+ num-processed 1) (+ total (first items)))
  )
)

(define (average items)
  (average-aux items 0 0)
)

(define (smooth func dx)
  (letrec ((ret (lambda (n)
                  (average (list (func (- n dx)) (func n) (func (+ n dx))))
                )
          ))
    ret
  )
)

