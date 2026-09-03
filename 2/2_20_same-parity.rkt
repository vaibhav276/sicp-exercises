; Exercise 2.20: ...write a procedure same-parity that
; takes one or more integers and returns a list of all the ar-
; guments that have the same even-odd parity as the ﬁrst
; argument. For example,
; (same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)
; (same-parity 2 3 4 5 6 7)
; (2 4 6)

#lang sicp

(define (same-parity x . l)
  (if (even? x)
      (filter even? l)
      (filter odd? l)
  )
)

(define (filter pred l)
  (cond
    ((= 0 (length l)) l)
    ((pred (car l)) ( cons (car l) (filter pred (cdr l) )))
    (else (filter pred (cdr l)))
  )
)

