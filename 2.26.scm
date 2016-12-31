(define (println obj) (display obj) (newline))

(define x (list 1 2 3))
(define y (list 4 5 6))

(println (append x y))
; (1 2 3 4 5 6)

(println (cons x y))
; ((1 2 3) 4 5 6)

(println (list x y))
;((1 2 3) (4 5 6))

