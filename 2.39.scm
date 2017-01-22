(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest)
      )
    )
  )
  (iter init seq)
)

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y) (cons x y)) '() sequence)
)

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence)
)

