; I'm not completely satisfied with this answer because it would seem to me that
; reversing the list doesn't keep in the spirit of the question (he wanted it in
; O(n/2) time in the average case), but I can't find a better way of doing it
; because you can't insert into the middle of a list without being destructive.
(define* (adjoin-set x set #:key (beginning-of-set-reverse '()))
  (cond ((null? set) (reverse (cons x beginning-of-set)))
        ((< x (car set))
         (adjoin-set x (cdr set) 
                     #:beginning-of-set-reverse (cons x beginning-of-set)
         )
        )
        ((= x (car set))
           set
        )
        ((> x (car set))
         (append (reverse (cons x beginning-of-set)) set)
        )
  )
)

