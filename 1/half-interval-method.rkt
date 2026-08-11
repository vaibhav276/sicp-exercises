#lang sicp

(define (search f neg-point pos-point)
    (let ((mid-point (avg pos-point neg-point)))
        (if (close-enough? neg-point pos-point)
            mid-point
            (cond
                ((positive? (f mid-point)) (search f neg-point mid-point))
                ((negative? (f mid-point)) (search f mid-point pos-point))
                (else mid-point)
            )
        )
    )
)

(define (close-enough? x y) (< (abs (- x y)) 0.001))
(define (avg x y) (/ (+ x y) 2.0))

(define (half-interval-method f a b)
    (let 
        (
            (a-value (f a))
            (b-value (f b))
        )
        (cond 
            (
                (and (positive? a-value) (negative? b-value))
                (search f b a)
            )
            (
                (and (negative? a-value) (positive? b-value))
                (search f a b)
            )
            (
                else
                (error "Values are not of opposite sign" a b)
            )
        )
    )
)