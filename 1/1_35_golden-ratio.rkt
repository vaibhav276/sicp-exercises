; Exercise 1.35: Show that the golden ratio ϕ (Section 1.2.2)
; is a ﬁxed point of the transformation x → 1 + 1/x , and
; use this fact to compute ϕ by means of the fixed-point
; procedure.

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
    (if (good-enough? guess)
        guess
        (fixed-point f (improve guess))
    )
)

(define (average a b) (/ (+ a b) 2.0))

; Applied to sqrt for reference
(define (sqrt x)
    (fixed-point 
        (lambda (y) (average y (/ x y))) 
        1.0
    )
)

; And now the actual problem to solve...
; How to use fixed-point to find out golden ratio?

(define (golden-ratio)
    (fixed-point
        (lambda (x) (average x (+ 1.0 (/ 1.0 x))))
        1.0
    )
)
