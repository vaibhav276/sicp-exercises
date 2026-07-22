; Exercise 1.30: The sum procedure above generates a linear
; recursion. The procedure can be rewritten so that the sum
; is performed iteratively

#lang sicp

(define (sum term next a b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))
        )
    )
    (iter a 0)
)

(define (sum-sq a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (sum square inc a b)
)
