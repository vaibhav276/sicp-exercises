; Exercise 1.37: Continued fraction, used to approximate golden ratio

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

(define (approx-golden-ratio k)
    (cont-frac
        (lambda (i) 1.0)
        (lambda (i) 1.0)
        k
    )
)