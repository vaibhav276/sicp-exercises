#lang sicp

(define (smallest-divisor n)
    (smallest-divisor-iter n 2)
)

(define (smallest-divisor-iter n i)
    (cond
        ((> (square i) n) n)
        ((= 0 (remainder n i)) i)
        (else (smallest-divisor-iter n (+ 1 i)))
    )
)

(define (square x) (* x x))