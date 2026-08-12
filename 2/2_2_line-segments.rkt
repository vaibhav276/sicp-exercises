; Exercise 2.2: Consider the problem of representing line
; segments in a plane. Each segment is represented as a pair
; of points: a starting point and an ending point. Deﬁne a
; constructor make-segment and selectors start-segment and
; end-segment that deﬁne the representation of segments in
; terms of points. Furthermore, a point can be represented
; as a pair of numbers: the x coordinate and the y coordi-
; nate. Accordingly, specify a constructor make-point and
; selectors x-point and y-point that deﬁne this representa-
; tion. Finally, using your selectors and constructors, deﬁne a
; procedure midpoint-segment that takes a line segment as
; argument and returns its midpoint (the point whose coor-
; dinates are the average of the coordinates of the endpoints).

#lang sicp

(define (make-point x y)
    (cons x y)
)

(define (x-point p)
    (car p)
)

(define (y-point p)
    (cdr p)
)

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
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

(define (mid-segment s)
    (define (avg a b)
        (/ (+ a b) 2.0)
    )

    (let
        (
            (mx (avg (x-point (start-segment s)) (x-point (end-segment s))))
            (my (avg (y-point (start-segment s)) (y-point (end-segment s))))
        )
        (make-point mx my)
    )
)
