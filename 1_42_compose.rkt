; Exercise 1.42: Let f and д be two one-argument functions.
; the composition f aer д is deﬁned to be the function x→
; f (g(x)). Deﬁne a procedure compose that implements com-
; position. For example, if inc is a procedure that adds 1 to
; its argument,
; ((compose square inc) 6)
; 49

#lang sicp

(define (compose f g)
    (lambda (x)
        (f (g x))
    )
)

(define (square x) (* x x))

(define (inc x) (+ x 1))