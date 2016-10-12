(use-modules (srfi srfi-1))

(load "1.44.scm") ; definition of average

; base assignment 

(define (iterative-improve check-guess improve-guess)
  (define (recursive guess)
    (if (check-guess guess)
      guess
      (recursive (improve-guess guess))
    )
  )

  recursive
)

; well, I didn't read the assignment closely enough... this is an implementation
; of the half-interval method in 1.3.3, though Exercise 1.44 only asks us to
; reimplement fixed-point.

(define (get-f lst)   (first lst))
(define (get-neg lst) (second lst))
(define (get-pos lst) (third lst))

(define search-delta 0.001)
(define (search-check lst) (< (abs (- (get-neg lst) (get-pos lst))) search-delta))

(define (search-improve lst)
  (let* ((f (get-f lst))
         (neg (get-neg lst))
         (pos (get-pos lst))
         (midpoint (average (list neg pos)))
         (test-value (f midpoint))
        )
    (cond ((positive? test-value) (list f neg  midpoint))
          ((negative? test-value) (list f midpoint pos))
          (else (list f midpoint midpoint))
    )
  )
)


(define (search f neg-point pos-point)
  (let* ((retlist ((iterative-improve search-check search-improve) (list f neg-point pos-point)))
         (neg (get-neg retlist))
         (pos (get-pos retlist))
        )
    (if (= neg pos)
      neg
      (average (list neg pos))
    )
  )
)

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b))
       )
    (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
          ((and (negative? b-value) (positive? a-value)) (search f b a))
          (else (error "Values are not of opposite sign" a a-value b b-value))
    )
  )
)

; reimplementaiton of sqrt in 1.1.7

(define sqrt-delta .001)
(define (sqrt-check guess n) (< (abs (- (square guess) n)) sqrt-delta))
(define (sqrt-improve guess n) (average (list guess (/ n guess))))
(define (square n) (* n n))

(define (sqrt n)
  ((iterative-improve (lambda (guess) (sqrt-check guess n))
                      (lambda (guess) (sqrt-improve guess n)))
   1
  )
)

