(load "2.40.scm")

(define (target-sum-pairs n target-sum)
  (map make-pair-sum
       (filter (lambda (pair) (= (+ (car pair) (cadr pair)) target-sum)) (unique-pairs n))
  )
)

