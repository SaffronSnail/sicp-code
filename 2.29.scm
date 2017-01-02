(use-modules (srfi srfi-64))

; given in the text
(define (make-mobile left right)
  (list left right)
)

(define (make-branch length structure)
  (list length structure)
)

; utilities not given in the text
(define mobile? pair?)

(define branch? pair?)
(define weight? number?)

(define length? number?)

; a
(define left-branch  car)
(define right-branch cadr)

(define branch-length    car)
(define branch-structure cadr)

; b
(define (total-weight mobile)
  (define (iter branch current-total)
    (let ((structure (branch-structure branch)))
      (if (weight? structure)
        (+ structure current-total)

        ; else is mobile
        (iter (left-branch structure)
              (iter (right-branch structure) current-total)
        )
      )
    )
  )

  (iter (left-branch mobile)
        (iter (right-branch mobile) 0)
  )
)

; tests
;(define (test-weight? obj) (and (weight? obj) (even? obj)))
;(define (test-length? obj) (and (length? obj) (odd?  obj)))
(let ((test-weight? (lambda (obj) (and (weight? obj) (even? obj))))
      (test-length? (lambda (obj) (and (length? obj) (odd?  obj))))
     )
  (define simplest-mobile (make-mobile (make-branch 1 2) (make-branch 3 4)))
  ;(define simple-mobile (make-mobile (make-branch (make-mobile (make-branch 1 2)
  ;                                                             (make-branch 3 4)
  ;                                                )
  ;                                                (make-mobile (make-branch 5 6)
  ;                                                             (make-branch 7 8)
  ;                                                )
  ;                                   )
  ;                                   (make-branch (make-mobile (make-branch 9 10)
  ;                                                             (make-branch 11 12)
  ;                                                )
  ;                                                (make-mobile (make-branch 13 14)
  ;                                                             (make-branch 15 16)
  ;                                                )
  ;                                   )
  ;                      )
  ;)
  
  (let ((test-name "a) Accessor Tests"))
    (test-begin test-name)
    
    (let ((test-target (left-branch simplest-mobile)))
      (test-assert (= (branch-length    test-target) 1))
      (test-assert (test-weight? (branch-structure test-target)))
      (test-assert (= (branch-structure test-target) 2))
    )
    
    (let ((test-target (right-branch simplest-mobile)))
      (test-assert (= (branch-length    test-target) 3))
      (test-assert (test-weight? (branch-structure test-target)))
      (test-assert (= (branch-structure test-target) 4))
    )
    
    (test-end test-name)
  )

  (let ((test-name "b) Total Weight Test"))
    (test-begin test-name)
    (test-eqv (total-weight simplest-mobile) 6)
    (test-end test-name)
  )
)

