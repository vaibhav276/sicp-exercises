#lang sicp

(define initial-guess 1.0)
(define threshold 0.001)

(define (cube-root x)
    (cube-root-newton initial-guess x)
)

(define (cube-root-newton guess x)
    (if (good-enough? x guess)
        guess
        (cube-root-newton (improve-guess x guess) x)
    )
)

(define (good-enough? x guess)
    (< (abs (- (cube guess) x)) threshold)
)

(define (improve-guess x guess)
    (
        / 
        (
            + 
            (/ x (* guess guess)) 
            (* 2 guess)
        ) 
        3
    )
)

(define (cube x) (* x x x))

(define (abs x)
    (if (< x 0) (- x) x)
)
