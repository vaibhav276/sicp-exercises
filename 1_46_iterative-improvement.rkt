; Exercise 1.46: Several of the numerical methods described
; in this chapter are instances of an extremely general com-
; putational strategy known as iterative improvement. Itera-
; tive improvement says that, to compute something, we start
; with an initial guess for the answer, test if the guess is good
; enough, and otherwise improve the guess and continue the
; process using the improved guess as the new guess. Write
; a procedure iterative-improve that takes two procedures
; as arguments: a method for telling whether a guess is good
; enough and a method for improving a guess. iterative-
; improve should return as its value a procedure that takes a
; guess as argument and keeps improving the guess until it is
; good enough. Rewrite the sqrt procedure of Section 1.1.7
; and the fixed-point procedure of Section 1.3.3 in terms of
; iterative-improve.

#lang sicp

(define (iterative-improvement good-enough? improve-guess)
    (define (iter guess)
        (if (good-enough? guess)
            guess
            (iter (improve-guess guess))
        )
    )
    iter
)

; sqrt
(define (sqrt-newton guess x)
    (define (square x) (* x x))
    (define threshold 0.001)

    (define (good-enough? guess)
       (< (abs (- (square guess) x)) threshold)
    )

    (define (improve-guess guess)
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
    ((iterative-improvement good-enough? improve-guess) guess)
)

; The fixed-point function
(define (fixed-point f guess)
    (define tolerance 0.0001)

    (define (good-enough? guess)
        (< (abs (- (f guess) guess)) tolerance)
    )
    (define (improve-guess guess)
        (f guess)
    )
    ((iterative-improvement good-enough? improve-guess) guess)
)

; Applied to golden-ratio for reference
(define (golden-ratio)
    (define (average a b) (/ (+ a b) 2.0))

    (fixed-point
        (lambda (x) (average x (+ 1.0 (/ 1.0 x))))
        1.0
    )
)