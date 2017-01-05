(use-modules (srfi srfi-64))

(load "2.29.scm")

; Note that all WEIGHTS must be EVEN numbers and LENGTHS must be ODD numbers for
; input to this test suite. This is to distinguish the two from each other, so
; that if a function is accessing the wrong one it is readily apparent

; the "simplest" mobile is contains the minimum structure need to exercise all
; possible situations in this data structure. minimum includes a mobile with two
; branches, a nested mobile, and weights.
(define simplest-mobile (make-mobile (make-branch 1 2)
                                     (make-branch 3
                                                  (make-mobile (make-branch 5 4)
                                                               (make-branch 7 6)
                                                  )
                                     )
                        )
)

(define (test-branch-aux branch expected-length)
  (test-assert (branch? branch))
  (test-eqv (branch-length branch) expected-length)
)

(define test-mobile mobile?)

(define (test-branch-weight branch expected-length expected-weight)
  (test-branch-aux branch expected-length)
  (let ((structure (branch-structure branch)))
    (test-assert (weight? structure))
    (test-assert (even?   structure))
    (test-eqv expected-weight structure)
  )
)

(define (test-branch-mobile branch expected-length)
  (test-branch-aux branch expected-length)
  (test-assert (test-mobile (branch-structure branch)))
  (branch-structure branch)
)

(let ((test-name "Accessor Tests (exercise a)")
      (test-target simplest-mobile)
     )
  (test-begin test-name)
  (test-assert (test-mobile test-target))

  (test-branch-weight (left-branch test-target) 1 2)
  (let ((nested (test-branch-mobile (right-branch test-target) 3)))
    (test-branch-weight (left-branch nested) 5 4)
    (test-branch-weight (right-branch nested) 7 6)
  )

  (test-end test-name)
)

(let ((test-name "Total Weight Test (exercise b)")
      (test-target simplest-mobile)
     )
  (test-begin test-name)
  (test-eqv (total-weight test-target) 12)
  (test-end test-name)
)

(define balanced-mobile (make-mobile (make-branch 16 (make-mobile (make-branch 3 4)
                                                                  (make-branch 1 12)
                                                     )
                                     )
                                     (make-branch 16 (make-mobile (make-branch 5 6)
                                                                  (make-branch 3 10)
                                                     )
                                     )
                        )
)

(let ((test-name "Balanced Test (exercise c)"))
  (test-begin test-name)
  (test-assert (balanced? balanced-mobile))
  (test-expect-fail 1)
  (test-assert (balanced? simplest-mobile))
  (test-end test-name)
)

