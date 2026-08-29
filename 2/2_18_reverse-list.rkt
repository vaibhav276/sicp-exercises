; Exercise 2.18: Define a procedure reverse that takes a list
; as argument and returns a list of the same elements in re-
; verse order:
; (reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

#lang sicp

; preliminaries
(define (length l)
  (define (iter res m)
    (if (null? m)
        res
        (iter (+ 1 res) (cdr m))
    )
  )
  (iter 0 l)
)

; solution
(define (reverse l)
  (define (iter res m)
    (if (= 0 (length m))
        res
        (iter (cons (car m) res) (cdr m))
    )
  )
  (iter (car l) (cdr l))
)

