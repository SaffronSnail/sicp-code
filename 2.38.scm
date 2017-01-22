; (fold-right / 1 (list 1 2 3))
; This produces 3/2

; (fold-left / 1 (list 1 2 3))
; This produces 2/3

; (fold-right list '() (list 1 2 3))
; This produces (3 (2 (1 ())))

; (fold-left list '() (list 1 2 3))
; This produces (1 (2 (3 ())))

