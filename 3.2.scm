(define (make-monitored fn)
  (let ((num-calls 0))
    (lambda (input)
      (if (eq? input 'how-many-calls?)
        num-calls
        (begin
          (set! num-calls (+ num-calls 1))
          (fn input)
        )
      )
    )
  )
)

