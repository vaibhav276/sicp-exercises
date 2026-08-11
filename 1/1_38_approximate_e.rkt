; Exercise 1.38: De Fractionibus Continuis
; Continued fraction in which all numerators are 1, and the denominators
; follow this sequence: 1,2,1,1,4,1,1,6,1,1,8,1,...

#lang sicp

; Denominators are mapped as follows
; 1 --> mod 3 = 1 --> 1
; 2 --> mod 3 = 2 --> 2 <-- (((2 + 3) / 3) * 2)
; 3 --> mod 3 = 0 --> 1
; 4 --> mod 3 = 1 --> 1
; 5 --> mod 3 = 2 --> 4 <-- (((5 + 3) / 3) * 2)
; 6 --> mod 3 = 0 --> 1
; 7 --> mod 3 = 1 --> 1
; 8 --> mod 3 = 2 --> 6 <-- (((8 + 3) / 3) * 2)
; 9 --> mod 3 = 0 --> 1
; 10 --> mod 3 = 1 --> 1
; 11 --> mod 3 = 2 --> 8 <-- (((11 + 3) / 3) * 2)
; 12 --> mod 3 = 0 --> 1

; switch impl here
(define (cont-frac n d k)
    ; (cont-frac-rec n d k)
    (cont-frac-iter n d k)
)

; Recursive procedure
(define (cont-frac-rec n d k)
    (define (iter i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (iter (+ i 1))))
        )
    )
    (if (> k 0)
        (iter 1)
        (error "k must be greater than 0")
    )
)

; Iterative approach
(define (cont-frac-iter n d k)
    (define (iter res i)
        (if (= i 0)
            res
            (iter (/ (n i) (+ (d i) res)) (- i 1))
        )
    )
    (if (> k 0)
        (iter (/ (n k) (d k)) (- k 1))
        (error "k must be greater than 0")
    )
)

(define (approx-e k)
    (
        +
        (cont-frac
            (lambda (i) 1.0)
            (lambda (i)
                (let
                    ((mod3 (remainder i 3)))
                    (if (or (= 0 mod3) (= 1 mod3))
                        1
                        (* (quotient (+ i 3) 3) 2)
                    )
                )
            )
            k
        )
        2
    )
)
