(define (double func) (lambda (n) (func (func n))))

(define double-inc (double (lambda (n) (+ n 1))))

