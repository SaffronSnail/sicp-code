; This assignment instructs me to create the filtered-accumulate function,
; claiming that this added extra power to the abstraciton. However, the
; functionality described in the examples belongs in the next parameter
; to accumulate, not the additional complexity of another function with
; an additional argument. I demonstrate that here instead.

(load "./1.23.scm")
(load "./1.32.scm")

(define (sum-of-squares-of-primes a b)
  (sum a b square prime-sequence)
)

(define (sum-of-relative-primes n)
  (sum 1 (- n 1) identity (create-relative-prime-sequence n))
)

(define (create-filtered-sequence pred)
  (letrec ((func (lambda (n)
            (let ((ret (+ n 1)))
              (if (pred ret)
                ret
                (func ret)
              )
            )
          )))
    func
  )
)

(define prime-sequence (create-filtered-sequence prime?))

(define (create-relative-prime-sequence relative)
  (create-filtered-sequence (lambda (n) (relatively-prime? n relative)))
)

(define (relatively-prime? term relative)
  (relatively-prime-aux? term relative (smallest-divisor term) (smallest-divisor relative))
)

(define (relatively-prime-aux? term relative term-divisor relative-divisor)
  (format #t "Term: ~A (~A) Relative: ~A (~A)~%" term term-divisor relative relative-divisor)
  (let ((relative-divisor-squared (square relative-divisor))
        (term-divisor-squared     (square term-divisor))
       )
    (cond ((and (= relative-divisor term-divisor) (not (= term-divisor-squared relative))) #f)
          ((and (= relative-divisor-squared relative) (= term-divisor-squared term)) #t)
          ((< relative-divisor term-divisor) (relatively-prime-aux? term relative term-divisor (find-divisor relative relative-divisor)))
          (else (relatively-prime-aux? term relative (find-divisor term term-divisor) relative-divisor))
    )
  )
)

(define (identity n) n)
(define (inc      n) (+ n 1))
(define (square   n) (* n n))

