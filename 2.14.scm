(load "2.7.scm")
(load "2.10.scm")
(load "2.11.scm")

(define one-as-interval (cons-interval-vals 1 1))
(define (inverse-interval i) (divide-interval one-as-interval i))
(define (add-interval i1 i2)
	(cons-interval-vals (+ (min (lower-interval i1) (upper-interval i1))
												 (min (lower-interval i2) (upper-interval i2))
											)
											(+ (max (lower-interval i1) (upper-interval i1))
												 (max (lower-interval i2) (upper-interval i2))
											)
	)
)

; these two functions calculate different answers when fed 
; the intervals (1000, 1001) and (2000, 2002). This is
; because interval division, as defined in the book, does
; not behave the same way as integral divison. When divison
; ocurrs on intervals, the maximum value of the deoninator is
; selected because that creates the lowest value. The two
; expressions are algebraically equivalent with integers because
; you can multiply par2 by (/ (* r1 r2) (* r1 r2)). However, with
; intervals that expression does not actually equal 1. As the
; book originally defined the equation for parallel equivalent
; resistance as par2 implements it, it would seem that that is
; the "correct" implementation, and par1 is making an invalid
; assumption by applying integer arithmetic rules to interval
; arithmetic (alternatively, you could argue that the notation
; itself is invalid because "integral arithmetic" defines
; arithmetic rules).

(define (par1 i1 i2)
	(let ((numer (multiply-interval i1 i2))
				(denom (add-interval      i1 i2))
			 )
	  (divide-interval numer denom)
	)
)

(define (par2 i1 i2)
	(inverse-interval
		(add-interval (inverse-interval i1)
									(inverse-interval i2)
		)
	)
)

