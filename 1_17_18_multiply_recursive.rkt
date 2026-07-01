#lang sicp

; Exercise 1.17: The exponentiation algorithms in this sec-
; tion are based on performing exponentiation by means of
; repeated multiplication. In a similar way, one can perform
; integer multiplication by means of repeated addition. e
; following multiplication procedure (in which it is assumed
; that our language can only add, not multiply) is analogous
; to the expt procedure:
; 
; (define (* a b)
;   (if (= b 0)
;       0
;       (+ a (* a (- b 1)))))
;
; This algorithm takes a number of steps that is linear in b.
; Now suppose we include, together with addition, opera-
; tions double, which doubles an integer, and halve, which
; divides an (even) integer by 2. Using these, design a mul-
; tiplication procedure analogous to fast-expt that uses a
; logarithmic number of steps.



; NOTE: switch impl here
(define (mult a b)
    ; (mult-linear a b)
    ; (mult-logarithmic-recursive a b)
    (mult-logarithmic-iter 0 a b)
)

(define (mult-linear a b)
    (if 
        (= 0 b)
        0
        (+ a (mult-linear a (- b 1)))
    )
)

; Recursive procedure
(define (mult-logarithmic-recursive a b)
    (cond
        ((= 0 b) 0)
        ((even? b) (double (mult-logarithmic-recursive a (halve b))))
        (else (+ a (mult-logarithmic-recursive a (- b 1))))
    )
)

(define (double x) (* 2 x))
(define (halve x) (/ x 2))



; Exercise 1.18: Using the results of Exercise 1.16 and Exer-
; cise 1.17, devise a procedure that generates an iterative pro-
; cess for multiplying two integers in terms of adding, dou-
; bling, and halving and uses a logarithmic number of steps


; Iterative procedure

; a         b           r
;------------------------------
; 2a        b/2         r           <-- When b is even
; a         b-1         r + a       <-- When b is odd


(define (mult-logarithmic-iter r a b)
    (cond
        ((= 0 b) r)
        ((even? b) (mult-logarithmic-iter r (double a) (halve b)))
        (else (mult-logarithmic-iter (+ a r) a (- b 1)))
    )
)