(load "accumulate.scm")

(define* (enumerate-interval low high #:key (state '()))
  (if (> low high)
      state
      (enumerate-interval low (- high 1) #:state (cons high state))
  )
)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq))
)

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))
             )
           )
           (enumerate-interval 1 n)
  )
)

(define* (prime? n #:key (state (- n 1)))
  (cond 
    ((= state 1) #t)
    ((= (remainder n state) 0) #f)
    ((<= (* state state) n) #t)
    (else (prime? n #:state (- state 1)))
  )
)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))
  )
)

