; Exercise 1.39: Use J.H Lambert's tan approximation continued fraction
; to write (tan-cf x k) that calculates approximate value of `tan x`

#lang sicp

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

(define (tan-cf x k)
    (cont-frac
        (lambda (i)
            (if (= i 1)
                x
                (* -1 (* x x))
            )
        )
        (lambda (i) (- (* i 2) 1))
        k
    )
)