(define (equal? a b)
  (if (list? a)
    (if (list? b)
      ; both a and b are lists
      (and (eq? (car a) (car b))
           (eq? (cdr a) (cdr b))
      )
      ; else b is not a list but a is
      #f
    )
    (if (list? b)
      ; b is a list but a isn't
      #f
      ; else neither a nor b are lists
      (eq? a b)
    )
  )
)

(use-modules (srfi srfi-64))

(test-begin "equal?")
(test-assert (equal? 1 1))
(test-assert (equal? 'a 'a))
(test-assert (not (equal? 1 2)))
(test-assert (not (equal? 'a 'b)))

(test-assert (equal? '(1 2) '(1 2)))
(test-assert (equal? '(a b) '(a b)))
(test-assert (not (equal? '(1 1) '(1 2))))
(test-assert (not (equal? '(a a) '(a b))))
(test-end "equal?")

