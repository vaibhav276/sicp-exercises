; Exercise 1.40: Deﬁne a procedure cubic that can be used
; together with the newtons-method procedure in expressions
; of the form
; (newtons-method (cubic a b c) 1)
; to approximate zeros of the cubic x^3 + ax^2 + bx + c.

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

; Newton's method
(define dx 0.00001)

(define (deriv g)
    (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
)

(define (newton-transform g)
    (lambda (x) 
        (
            - 
            x 
            (/ (g x) ((deriv g) x))
        )
    )
)

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess)
)

; ...and finally, the cubic method for this exercise
(define (cubic a b c)
    (lambda (x)
        (
            +
            (expt x 3)
            (* a (expt x 2))
            (* b x)
            c
        )
    )
)
