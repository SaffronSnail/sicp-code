(define (make-account password balance)

  (define (withdraw amount)
    (if (>= balance amount)
    (begin (set! balance (- balance amount))
    balance)
    "Insufficient funds")
  )

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance
  )

  (let ((num-bad-accesses 0))
    (define (dispatch given-password m)
      (if (eq? given-password password)
        (begin
          (set! num-bad-accesses 0)
          (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                (else (error "Unknown request: MAKE-ACCOUNT" m))
          )
        )
        (begin
          (set! num-bad-accesses (+ num-bad-accesses 1))
          (when (> num-bad-accesses 7) (call-the-cops))
          (error "Bad password!")
        )
      )
    )
    dispatch
  )
)

