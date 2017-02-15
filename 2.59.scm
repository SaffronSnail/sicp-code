(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)
  )
)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))
  )
)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2))
        )
        (else (intersection-set (cdr set1) set2))
  )
)

(define (union-set taker-set giver-set)
  (if (null? giver-set)
    taker-set
    (union-set (adjoin-set (car giver-set) taker-set) (cdr giver-set))
  )
)

