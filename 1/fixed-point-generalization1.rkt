; Generalization of the fixed-point procedure
; in which we abstract out the procedure to be applied
; to improve the guess
; We then use two methods - average damping and newton's method
; to plug in to the fixed-point procedure when implementing sqrt

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

(define (average a b)
    (/ (+ a b) 2.0)
)

; The average damping method
(define (average-damp f)
    (lambda (x) (average x (f x)))
)

(define (average-damp-method g guess)
    (fixed-point (average-damp g) guess)
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


; Now applying to sqrt function

; Applying both methods one by one
(define (sqrt x)
    (average-damp-method
        (lambda (y) (/ x y))
        1.0
    )
    (newtons-method
        (lambda (y) (- (square y) x))
        1.0
    )
)

(define (square x) (* x x))
