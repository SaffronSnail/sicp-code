(load "2.67.scm")

(define (encode-symbol symbol tree)
  (define (iteration tree code)
    (if (memq symbol (symbols tree))
      (if (and (leaf? tree) (eq? (symbol-leaf tree) symbol))
        code
        (or (iteration (left-branch tree)  (append code '(0)))
            (iteration (right-branch tree) (append code '(1)))
        )
      )
      #f
    )
  )
  (let ((result (iteration tree '())))
    (if result
      result
      (error "Symbol not found: " symbol)
    )
  )
)

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode        (cdr message) tree)
    )
  )
)

