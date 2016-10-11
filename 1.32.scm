(define (accumulate a b term next accumulator base)
  (letrec ((iter (lambda (a result)
                   (if (> a b)
                       result
                       (iter (next a) (accumulator (term a) result))
                   )
                 )
          ))
    (iter a base)
  )
)

(define (sum a b term next)
  (accumulate a b term next + 0)
)

(define (product a b term next)
  (accumulate a b term next * 1)
)

(define (accumulate-the-terrible-recursive-way term a next b accumulator base)
  (if (> a b)
    base
    (accumulator (term a)
                 (accumulate term (next a) next b accumulator base)
    )
  )
)

