(load "2.62.scm")
(load "2.63.scm")
(load "2.64.scm")

(define (union-set-tree s1 s2)
  (list->tree (union-set (tree->list s1)
                         (tree->list s2)
              )
  )
)

