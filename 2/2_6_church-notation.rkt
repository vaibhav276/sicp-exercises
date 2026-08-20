#lang sicp

(define (zero)
    (lambda (f)
        (lambda (x) x)
    )
)

(define (add-1 n)
    (lambda (f)
        (lambda (x) ( f ((n f) x) ) )
    )
)

(define (one)
    (lambda (f)
        (lambda (x) (f x))
    )
)

(define (two)
    (lambda (f)
        (lambda (x) (f (f x)))
    )
)

(define (add a b)
    (lambda (f)
        (lambda (x) 
            ( (a f) ((b f) x) ) 
        )
    )
)

; define a function that could be used for testing
(define (print x)
    (display x)
    x
)

(define (print-7-times x)
    (let
        (
            (three (add (one) (two)))
            (four (add (two) (two)))
        )
        (((add three four) print) x)
    )
)

; test it as...
; (((add (add (one) (two)) (add (two) (two))) print) "z")
; (print-7-times "z")
