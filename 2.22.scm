; this function produces the list in reverse order because the cons call
; prepends instead of appends
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
        (cons (square (car things))
              answer)
      )
    )
  )
  (iter items nil)
)

; this function doesn't work properly because the first call to iter puts the
; nil at the beginning of the list, when it needs to go to the end
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
        (cons answer
              (square (car things))))
    )
  )
  (iter items nil)
)

