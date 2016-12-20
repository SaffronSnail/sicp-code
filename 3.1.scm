(define (make-accumulator init)
  (let ((total init))
    (lambda (number)
      (set! total (+ total number))
      total
    )
  )
)

