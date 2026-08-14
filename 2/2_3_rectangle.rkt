; Exercise 2.3: Implement a representation for rectangles in
; a plane. (Hint: You may want to make use of Exercise 2.2.) In
; terms of your constructors and selectors, create procedures
; that compute the perimeter and the area of a given rectan-
; gle. Now implement a diﬀerent representation for rectan-
; gles. Can you design your system with suitable abstraction
; barriers, so that the same perimeter and area procedures
; will work using either representation?

#lang sicp

; ------------------- primitives ---------------------------

(define (make-point x y)
    (cons x y)
)

(define (x-point p)
    (car p)
)

(define (y-point p)
    (cdr p)
)

(define (make-segment p1 p2)
    (cons p1 p2)
)

(define (start-segment s)
    (car s)
)

(define (end-segment s)
    (cdr s)
)

; ---------------------- impl1 - just storing the diagonally opposite points ---------------------
(define (make-rect-1 p1 p2)
    (cons p1 p2)
)

(define (get-point1-1 rect)
    (car rect)
)

(define (get-point2-1 rect)
    (cdr rect)
)

; --------------------- impl2 - storing the base segment and height segment ------------------------
(define (make-rect-2 p1 p2)
    (let
        (
            (base-segment (make-segment p1 (make-point (x-point p2) (y-point p1))))
            (height-segment (make-segment (make-point (x-point p2) (y-point p1)) p2))
        )
        (cons base-segment height-segment)
    )
)

(define (get-point1-2 rect)
    (start-segment (car rect))
)

(define (get-point2-2 rect)
    (end-segment (cdr rect))
)

; --------------- switch impl here --------------

; (define (make-rect p1 p2) (make-rect-1 p1 p2))
; (define (get-point1 rect) (get-point1-1 rect))
; (define (get-point2 rect) (get-point2-1 rect))

(define (make-rect p1 p2) (make-rect-2 p1 p2))
(define (get-point1 rect) (get-point1-2 rect))
(define (get-point2 rect) (get-point2-2 rect))

; ------------ storage independent calculations --------------------

(define (perimeter rect)
    (let
        (
            (x-diff (abs (- (x-point (get-point1 rect)) (x-point (get-point2 rect)))))
            (y-diff (abs (- (y-point (get-point1 rect)) (y-point (get-point2 rect)))))
        )
        (* 2 (+ x-diff y-diff))
    )
)

(define (area rect)
    (let
        (
            (x-diff (abs (- (x-point (get-point1 rect)) (x-point (get-point2 rect)))))
            (y-diff (abs (- (y-point (get-point1 rect)) (y-point (get-point2 rect)))))
        )
        (* x-diff y-diff)
    )
)
