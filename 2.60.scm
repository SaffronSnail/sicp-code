; Efficiency:
; Though only one function was changed (adjoin-set), this implications of this
; change impact every function in this file because of the way element-of-set?
; works. Now that adjoin-set simply cons's whatevery it receives, regardless of
; duplication, grows not only based on the number of elmenets in the set (in the
; mathematical sense), but also based on how many times those elments have been
; inserted. In almost every instance this is an inferior implementation. The
; only benefit it gives is that adjoin-set is now a constant time operation
; instead of having it's complexity based on element-of-set?'s comlexity. This
; means that there may be the rare case where you are continuously adding new
; members to the set, so the performance of adjoin-set is important, and you
; have a reasonable expectation that there will be few enough duplicates in the
; input that the worse performance of literally every other operation doesn't
; outweigh the gains from adjoin-set.

(define adjoin-set cons)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))
  )
)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2))
        )
        (else (intersection-set (cdr set1) set2))
  )
)

(define (union-set taker-set giver-set)
  (if (null? giver-set)
    taker-set
    (union-set (adjoin-set (car giver-set) taker-set) (cdr giver-set))
  )
)

