; Exercise 1.31: Define a product procedure with similar abstration as
; sum in previous exercises.
; Then use it to calculate value of PI
; PI / 4 = (2.4.4.6.6.8.8 ...) / (1.3.3.5.5.7.7 ...)

#lang sicp

; Recursive procedure
; (define (product term next a b)
;     (if (> a b)
;         1
;         (
;             *
;             (term a)
;             (product term next (next a) b)
;         )
;     )
; )

; Iterative procedure
(define (product term next a b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))
        )
    )
    (iter a 1)
)

(define (factorial x)
    (define (id x) x)
    (define (inc x) (+ x 1))
    (product id inc 1 x)
)

(define (pi n)
    (define (next-even x) 
        (if (even? x)
            (+ x 2)
            (+ x 1)
        )
    )
    (define (next-odd x)
        (if (even? x)
            (+ x 1)
            (+ x 2)
        )
    )
    (define (term x) (/ (* 1.0 (next-even x)) (next-odd x)))
    (define (inc x) (+ x 1))
    (* 4.0 (product term inc 1 n)) ; faster

    ; slower
    ; (
    ;     *
    ;     4.0
    ;     (
    ;         /
    ;         (product next-even inc 1 n) ; 2.4.4.6.6.8.8 ...
    ;         (product next-odd inc 1 n)  ; 1.3.3.5.5.7.7 ...
    ;     )
    ; )
)
