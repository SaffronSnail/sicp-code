(load "1.23.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (time))
)

(define (start-prime-test n start-time)
  (prime? n)
  (report-prime (- (time) start-time))
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
)

