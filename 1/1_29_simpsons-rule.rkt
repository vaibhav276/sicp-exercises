; Exercise 1.29: Use Simpson's rule to perform integral

#lang sicp

(define (sum term next a b)
    (if (> a b) 
        0
        (
            +
            (term a)
            (sum term next (next a) b)
        )
    )
)

(define (integral f a b n)
    (define h (/ (- a b) n))
    (define (term k)
        (define (find-y) (f (+ a (* k h))))
        (
            *
            (cond 
                ((or (= k 0) (= k n)) 1)
                ((even? k) 2)
                (else 4)
            )
            (find-y)
        )
    )
    (define (inc x) (+ x 1))
    (/ (* h (sum term inc 0 n)) 3)
)

(define (cube x) (* x x x))