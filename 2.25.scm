(display (car (cdaddr '(1 3 (5 7) 9)))) (newline)
(display (caar '((7)))) (newline)

(define nesting-op '(1 (2 (3 (4 (5 (6 7)))))))
(display (cadar (cdadar (cdadar (cdr nesting-op))))) (newline)

