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

(define (sum-int a b)
    (define (id x) x)
    (define (inc x) (+ x 1))
    (sum id inc a b)
)

(define (sum-sq a b)
    (define (square x) (* x x))
    (define (inc x) (+ x 1))
    (sum square inc a b)
)

(define (pi-sum n)
    (define (pi-term x) (/ 1.0 (* x (+ x 2))))
    (define (pi-next x) (+ 4 x))
    (sum pi-term pi-next 1 n)
)

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (
        *
        dx
        (sum f add-dx (+ a (/ dx 2)) b)
    )
)

(define (cube x) (* x x x))