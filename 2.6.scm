(define (zero f)
  (lambda (x) x)
)

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x))
    )
  )
)

; it seems like the number is defined
; by the number of times the function
; is applied to x... it's not clear
; to me how that's actually useful as
; a numeric representation

(define (one f)
  (lambda (f)
    (lambda (x)
      (f (f x))
    )
  )
)

(define (two f)
	(lambda (f)
		(lambda (x)
			(f (f (f x)))
		)
	)
)

(define (+ m n)
	(m n)
)

