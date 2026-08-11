; Exercise 1.3: Define a procedure that takes three numbers
; as arguments and returns the sum of the squares of the two
; larger numbers.

#lang sicp

(define (sum-squares x y)
    (+
        (* x x)
        (* y y)
    )
)

(define (sum-squares-largest-2-of-3 x y z)
    (cond 
        ((and (< z x) (< z y)) (sum-squares x y)) ; z is the smallest
        ((and (< y x) (< y z)) (sum-squares x z)) ; y is the smallest
        (else (sum-squares y z))                  ; x is the smallest
    )
)
