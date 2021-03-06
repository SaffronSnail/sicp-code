(load "accumulate.scm")

(define* (map proc sequence)
  (define (iteration operand state)
    (cons (proc operand) state)
  )
  (accumulate iteration '() sequence)
)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
)

(define (length seq)
  (define (iteration operand state)
    (+ state 1)
  )
  (accumulate iteration 0 seq)
)

