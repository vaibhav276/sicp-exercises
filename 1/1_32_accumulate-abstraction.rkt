; Exercise 1.32: Generalized abstraction for acccumulation over a list

#lang sicp

; Recursive
(define (accumulate-rec combiner null-term term next a b)
    (if (> a b) 
        null-term
        (
            combiner
            (term a)
            (accumulate-rec combiner null-term term next (next a) b)
        )
    )
)

; Iterative
(define (accumulate-iter combiner null-term term next a b)
    (define (iter result a)
        (if (> a b)
            result
            (iter (combiner result (term a)) (next a))
        )
    )
    (iter null-term a)
)

; Switch here
(define (accumulate combiner null-term term next a b)
    ; (accumulate-rec combiner null-term term next a b)
    (accumulate-iter combiner null-term term next a b)
)

; Applications

(define (sum term next a b)
    (accumulate + 0 term next a b)
)

(define (sum-sq a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (sum square inc a b)
)

(define (product term next a b)
    (accumulate * 1 term next a b)
)

(define (factorial n)
    (define (id x) x)
    (define (inc x) (+ x 1))
    (product id inc 1 n)
)
