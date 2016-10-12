(load "./1.41.scm")

(define (repeated func count)
  (letrec ((ret (lambda (n)
            (aux n count)
           ))
           (aux (lambda (n count)
            (if (= count 0)
              n
              (aux (func n) (- count 1))
            )
           )))
    ret
  )
)

