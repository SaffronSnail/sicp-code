(define f
  (let ((persistent 0))
    (lambda (arg)
      (let ((ret persistent))
        (set! persistent arg)
        ret
      )
    )
  )
)

