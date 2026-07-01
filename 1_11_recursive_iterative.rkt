#lang sicp

; Exercise 1.11: A function f is defined by the rule that
;
; f(n) = n if n < 3
; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;
; Write a procedure that computes f by means of a recursive
; process. Write a procedure that computes f by means of an
; iterative process.


;; Examples for recursive calculation
; f(4) = f(3) + 2 f(2) + 3 f(1)
; = 4 + 2 * 2 + 3 * 1
; = 4 + 4 + 3
; = 11

; f(3) = f (2) + 2 f (1) + 3 f(0)
; = 2 + 2 * 1 + 3 * 0
; = 4

;; Switch by uncommenting and commenting out the implementation function
; (define (f n) (f_r n))
(define (f n) (f_i 0 1 2 0 n))

(define (f_r n)
    (if 
        (< n 3)
        n
        (
            +
            (f_r (- n 1))
            (* 2 (f_r (- n 2)))
            (* 3 (f_r (- n 3)))
        )
    )
)


;; Examples for iterative calculation
; Idea: What if we pass in last three numbers of the sequence in a bottom-up build?
; Assumption: n is a non-negative number
;
;       a       b       c       counter     n
;--------------------------------------------------
; f_i   0       1       2       0           5
; f_i   0       1       2       1           5
; f_i   0       1       2       2           5
; f_i   1       2       4       3           5
; f_i   2       4       11      4           5
; f_i   4       11      25      5           5

;; Detailed walkthrough for 3, 4, 5
; n = 3
; a = 0, b = 1, c = 2, counter = 0, n = 3 --> (f_i 1 2 (+ 2 (* 2 1) (* 3 0) 3 3)) <-- We jump counter from 0 to 3 directly
; a = 1, b = 2, c = 4, counter = 3, n = 3 --> 4

; n = 4
; a = 0, b = 1, c = 2, counter = 0, n = 4 --> (f_i 1 2 (+ (2) (* 2 1) (* 3 0) 3 4))
; a = 1, b = 2, c = 4, counter = 3, n = 4 --> (f_i 2 4 (+ (4) (* 2 2) (* 3 1) 4 4)) <-- We increment counter
; a = 2, b = 4, c = 11, counter = 4, n = 4 --> 11

; n = 5
; a = 0, b = 1, c = 2, counter = 0, n = 5 --> (f_i 1 2 (+ (2) (* 2 1) (* 3 0) 3 5))
; a = 1, b = 2, c = 4, counter = 3, n = 5 --> (f_i 2 4 (+ (4) (* 2 2) (* 3 1) 4 5))
; a = 2, b = 4, c = 11, counter = 4, n = 5 --> (f_i 4 11 (+ (11) (* 2 4) (* 3 2) 5 5)) <-- We increment counter
; a = 4, b = 11, c = 25, counter = 5, n = 5 --> 25

(define (f_i a b c counter n)
    (cond
        ((= n 0) a)
        ((= n 1) b)
        ((= n 2) c)
        ((= counter n) c)
        (else 
            (
                f_i 
                b
                c 
                (+ c (* 2 b) (* 3 a)) 
                (if
                    (< counter 3)
                    3
                    (+ 1 counter) 
                )
                n
            )
        )
    )   
)
