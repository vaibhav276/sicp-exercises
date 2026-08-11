; Exercise 2.1: Deﬁne a better version of make-rat that han-
; dles both positive and negative arguments. make-rat should
; normalize the sign so that if the rational number is positive,
; both the numerator and denominator are positive, and if
; the rational number is negative, only the numerator is neg-
; ative.

#lang sicp

(define (make-rat n d)
    (define (sign x)
        (if (< x 0)
            -1
            1 
        )
    )

    (let
        (
            (n1 (/ n (gcd n d)))
            (d1 (/ d (gcd n d)))
        )

        (if (= (sign n) (sign d))
            (if (= (sign n) -1)
                (cons (- n1) (- d1))
                (cons n1 d1)
            )
            (if (= (sign n) 1)
                (cons (- n1) (- d1))
                (cons n1 d1)
            )
        )
    )
)