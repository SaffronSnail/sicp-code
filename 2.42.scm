(load "2.40.scm")

(define* (adjoin-position new-row col rest-of-queens #:key (state '()))
  (cond
    ((= col 1) (reverse (cons new-row state)))
    (else (adjoin-position new-row (- col 1) (cdr rest-of-queens)
                           #:state (cons (car rest-of-queens) state)
    ))
  )
)

(define empty-board '())

(define* (index i target-list)
  (cond
    ((not (pair? target-list)) (map display (list "ERROR: list \"" target-list
                                                  "\" does not have " i
                                                  " elements!"
                                            )
                               ) (newline)
                               #f
    )
    ((= i 1) (car target-list))
    (else (index (- i 1) (cdr target-list)))
  )
)

(define (safe? test-column rows)
  (define test-row (index test-column rows))
  (define (single-test other-column)
    (if (= test-column other-column)
      #t
      (let ((other-row (index other-column rows)))
        (not (or (= test-row other-row)
                 (= (- test-row other-row)
                    (- test-column other-column)
                 )
             )
        )
      )
    )
  )
  (map single-test (enumerate-interval 1 (length rows)))
)


; answer, 8x8
; '((2 4 6 8 3 1 7 5) (1 7 4 6 8 2 5 3) ...)

; one of the answers, 5x5
; '(1 3 5 2 4)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter (lambda (positions) (safe? k positions))
        (flatmap (lambda (rest-of-queens)
                   (map (lambda (new-row)
                          (adjoin-position new-row k rest-of-queens)
                        )
                        (enumerate-interval 1 board-size)
                   )
                 )
                 (queen-cols (- k 1))
        )
      )
    )
  )
  (queen-cols board-size)
)

