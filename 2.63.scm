(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right)
)

(define (make-leaf entry) (make-tree entry '() '()))
(define balanced-tree (make-tree 4 (make-tree 2 (make-leaf 1) (make-leaf 3))
                                   (make-tree 6 (make-leaf 5) (make-leaf 7))
                      )
)
(define unbalanced-tree (make-tree 3 (make-tree 2 (make-leaf 1) '())
                                     (make-leaf 6)
                        )
)

; a)
; both of these algorithms traverse the tree in in-fix order; that is, they
; both visit the left node, then the current node, then the right node.
; Therefore, they will both always produce the same list.

; b)
; tree->list-1 requires significantly more steps than tree->list-2. This is
; because tree->list-1 is a recursive algorithm while tree->list-2 is an
; iterative algorithm

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1 (right-branch tree))
            )
    )
  )
)

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list (right-branch tree)
                                        result-list
                          )
                    )
      )
    )
  )
  (copy-to-list tree '())
)

(define tree->list tree->list-2)

