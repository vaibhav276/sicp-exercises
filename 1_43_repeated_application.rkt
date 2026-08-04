; Exercise 1.43: If f is a numerical function and n is a posi-
; tive integer, then we can form the n th repeated application
; of f , which is deﬁned to be the function whose value at
; x is f (f (. . . (f (x )) . . . )). For example, if f is the function
; x → x + 1, then the n th repeated application of f is the
; function x → x + n. If f is the operation of squaring a num-
; ber, then the nth repeated application of f is the function
; that raises its argument to the 2^n -th power. Write a proce-
; dure that takes as inputs a procedure that computes f and a
; positive integer n and returns the procedure that computes
; the n th repeated application of f . Your procedure should be
; able to be used as follows:
; ((repeated square 2) 5)
; 625

#lang sicp

(define (compose f g)
    (lambda (x)
        (f (g x))
    )
)

(define (repeated f n)
    (cond 
        ((< n 1) (error "n can't be less than 1"))
        ((= n 1) (lambda(x) (f x)))
        (else (compose f (repeated f (- n 1))))
    )
)

(define (square x) (* x x))