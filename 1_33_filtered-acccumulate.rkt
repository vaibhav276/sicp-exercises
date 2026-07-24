; Exercise 1.33: filtered-acccumulate, which is the generalized version
; of accumulate from exercise 1.32, but with a predicate function to filter values 

#lang sicp

(define (filtered-accumulate-iter pred combiner null-term term next a b)
    (define (iter result a)
        (if (> a b)
            result
            (if (pred a)
                (iter (combiner result (term a)) (next a))
                (iter result (next a))
            )
        )
    )
    (iter null-term a)
)

(define (filtered-accumulate pred combiner null-term term next a b)
    (filtered-accumulate-iter pred combiner null-term term next a b)
)

; ================================ Applications ==========================
; --------- a) Sum of squares of prime numbers in an interval ------------

; Pulling in prime? from Exercise 1.22
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

(define (prime? n)
    (= (smallest-divisor n) n)
)

; Defining a couple of abstractions for helping the cause

(define (sum-filtered pred term next a b)
    (filtered-accumulate pred + 0 term next a b)
)

(define (sum-sq-filtered pred a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (sum-filtered pred square inc a b)
)

(define (sum-sq-primes a b)
    (sum-sq-filtered prime? a b)
)

; --------- b) Sum of all positive numbers less than `n` which are relatively prime to `n`
; i.e. all i < n, such that GCD(i, n) = 1

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(define (sum-relative-primes n)
    (define (relative-prime? x)
        (= (gcd n x) 1)
    )
    (define (id x) x)
    (define (inc x) (+ x 1))
    (sum-filtered relative-prime? id inc 1 n)
)
