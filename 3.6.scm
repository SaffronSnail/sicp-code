(define (create-rand seed upper-limit)
  (let* ((current-seed (seed->random-state seed)))
    (lambda (proc)
      (if (eq? proc 'reset)
        (set! current-seed (seed->random-state seed))
        (random upper-limit current-seed)
      )
    )
  )
)

(define rand (create-rand 5 100))

