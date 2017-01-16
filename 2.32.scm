; <??> was filled with (lambda (arg) (append (list (car s)) arg))
; When subsets begins executing, the first thing that happens is it recurses
; until it finds the end of the list, '(). Once it finds the end, it begins
; unwinding through all of the calls above, each of which remembers a possible
; subset of the list. These subsets represent every way that the list can be
; divided by truncating the *beginning* of the list. Mapping these values over
; the values that each successive call has created combines all of the values
; in every possible way.
(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (arg) (append (list (car s)) arg)) rest))
    )
  )
)

