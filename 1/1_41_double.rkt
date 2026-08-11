; Exercise 1.41: Deﬁne a procedure double that takes a pro-
; cedure of one argument as argument and returns a proce-
; dure that applies the original procedure twice. For exam-
; ple, if inc is a procedure that adds 1 to its argument, then
; (double inc) should be a procedure that adds 2. 
; What value is returned by
; (((double (double double)) inc) 5)

#lang sicp

(define (double f)
    (lambda (x) (f (f x)))
)

(define (inc x) (+ x 1))