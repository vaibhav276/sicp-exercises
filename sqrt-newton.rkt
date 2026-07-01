; How does one compute square roots? The most common way is to
; use Newton’s method of successive approximations, which says that
; whenever we have a guess y for the value of the square root of a number
; x , we can perform a simple manipulation to get a better guess (one closer
; to the actual square root) by averaging y with x/y.21 For example, we
; can compute the square root of 2 as follows. Suppose our initial guess
; is 1:
; Guess       Quotient               Average
; 1           (2/1) = 2              ((2 + 1)/2) = 1.5
; 1.5         (2/1.5) = 1.3333       ((1.3333 + 1.5)/2) = 1.4167
; 1.4167      (2/1.4167) = 1.4118    ((1.4167 + 1.4118)/2) = 1.4142
; 1.4142      ...                    ...

#lang sicp

(define initial-guess 1.0)
(define threshold 0.001)

(define (sqrt x)
    (sqrt-newton initial-guess x)
)

(define (sqrt-newton guess x)
    (if (good-enough? x guess) 
        guess
        (sqrt-newton (improve-guess x guess) x)
    )
)

(define (good-enough? x guess)
   (< (abs (- (square guess) x)) threshold)
)

(define (improve-guess x guess)
    (
        /
        (
            +
            guess
            (/ x guess)
        )
        2
    )
)

(define (square x) (* x x))

(define (abs x)
    (if (< x 0) (- x) x)
)
