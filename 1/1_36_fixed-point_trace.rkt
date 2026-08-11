; Exercise 1.36: Modify fixed-point so that it prints the
; sequence of approximations it generates, using the newline
; and display primitives shown in Exercise 1.22. Then ﬁnd
; a solution to x^x = 1000 by ﬁnding a ﬁxed point of x →
; log(1000)/ log(x). (Use Scheme’s primitive log procedure,
; which computes natural logarithms.) Compare the number
; of steps this takes with and without average damping. (Note
; that you cannot start fixed-point with a guess of 1, as this
; would cause division by log(1) = 0.)

#lang sicp

; The fixed-point function
(define (fixed-point f guess)
    (define tolerance 0.0001)
    (define (good-enough? guess)
        (< (abs (- (f guess) guess)) tolerance)
    )
    (define (improve guess)
        (f guess)
    )
    (display "--> ") (display guess) (newline)
    (if (good-enough? guess)
        guess
        (fixed-point f (improve guess))
    )
)

(define (average a b) (/ (+ a b) 2.0))

(define (without-average-damping)
    (fixed-point
        (lambda (x) (/ (log 1000) (log x)))
        2.0
    )
)

(define (with-average-damping)
    (fixed-point
        (lambda (x) (average x (/ (log 1000) (log x))))
        2.0
    )
)
