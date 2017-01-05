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

;c
(define* (balanced-aux branch #:optional (total-weight 0))
  (let ((structure (branch-structure branch)))
    (if (weight? structure)
      (+ structure total-weight)
      (let ((structure-is-balanced (balanced? structure)))
        (if structure-is-balanced
          (+ structure-is-balanced total-weight)
          #f
        )
      )
    )
  )
)

(define (balanced? mobile)
  (let ((left  (balanced-aux (left-branch  mobile)))
        (right (balanced-aux (right-branch mobile)))
       )
    (if (and left right)
      (let ((left-total (* left  (branch-length (left-branch  mobile))))
            (right-total (* right (branch-length (right-branch mobile))))
           )
        (if (= left-total right-total)
          (+ left right)
          #f
        )
      )
      #f
    )
  )
)

