(define (square-tree-direct tree)
  (cond
    ((null? tree) '())
    ((pair? tree) (cons (square-tree-direct (car tree))
                        (square-tree-direct (cdr tree))
                  )
    )
    (else (* tree tree))
  )
)

(define (square-tree-mapping tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-mapping sub-tree)
           (* sub-tree sub-tree)
         )
       )
       tree
  )
)

(define square-tree square-tree-mapping)

