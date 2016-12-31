(define left car)
(define right cdr)

(define (fringe lst)
  (define (iter lst accumulator)
    (if (null? lst)
      accumulator
      (if (pair? lst)
        (iter (left lst) (iter (right lst) accumulator))
        (cons lst accumulator)
      )
    )
  )
  (iter lst '())
)

