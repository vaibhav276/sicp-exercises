; Exercise 2.17: Define a procedure last-pair that returns
; the list that contains only the last element of a given (nonempty)
; list:
; (last-pair (list 23 72 149 34))
; (34)

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
(define (last-pair l)
  (if (= 1 (length l))
      l
      (last-pair (cdr l))
  )
)

