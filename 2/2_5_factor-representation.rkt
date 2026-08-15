; Exercise 2.5: Show that we can represent pairs of nonneg-
; ative integers using only numbers and arithmetic opera-
; tions if we represent the pair a and b as the integer that is
; the product 2^a * 3^b . Give the corresponding deﬁnitions of the
; procedures cons, car, and cdr.

#lang sicp

; How many times y goes into x?
(define (num-times y x)
    (define (iter res n)
        (if (= 0 (remainder n y))
            (iter (+ res 1) (/ n y))
            res
        )
    )
    (iter 0 x)
)

(define (cons a b)
    (* (expt 2 a) (expt 3 b))
)

(define (car x)
    (num-times 2 x)
)

(define (cdr x)
    (num-times 3 x)
)