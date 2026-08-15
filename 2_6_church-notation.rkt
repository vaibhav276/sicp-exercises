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
        ; (lambda (x) (f ((one f) x))) <-- alternatively
    )
)

; No idea how to implement addition in this system directly
; We do have a concept of incrementing
; But we don't have a concept of decrementing and comparison, so recursion isn't possible
; Need to think more...