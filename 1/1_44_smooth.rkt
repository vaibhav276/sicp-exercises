; Exercise 1.44: The idea of smoothing a function is an im-
; portant concept in signal processing. If f is a function and
; dx is some small number, then the smoothed version of f is
; the function whose value at a point x is the average of f (x −
; dx), f (x), and f (x +dx). Write a procedure smooth that takes
; as input a procedure that computes f and returns a proce-
; dure that computes the smoothed f . It is sometimes valu-
; able to repeatedly smooth a function (that is, smooth the
; smoothed function, and so on) to obtain the n-fold smoothed
; function. Show how to generate the n-fold smoothed func-
; tion of any given function using smooth and repeated from
; Exercise 1.43.

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

(define dx 0.0001)

(define (smooth f)
    (lambda (x)
        (
            /
            (
                +
                (f (- x dx))
                (f x)
                (f (+ x dx))
            )
            3.0
        )
    )
)

(define (repeated-smooth f n)
    (repeated (smooth f) n)
)