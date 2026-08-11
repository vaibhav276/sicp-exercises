#lang sicp

; Exercise 1.16: Design a procedure that evolves an iterative exponentiation process that uses successive squaring
; and uses a logarithmic number of steps, as does fast-expt.

; switch impl here
(define (expt b n)
    (fast-expt-iter 1 b n)
    ; (fast-expt b n)
)

; fast-expr, for reference
(define (fast-expt b n)
    (cond
        ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))
    )
)

(define (even? n) (= (remainder n 2 ) 0))

(define (square x) (* x x))



;   b           n           a       a.(b^n)
;-------------------------------------------
;   b           n           a       a.(b^n)
;   b^2         n/2         a       a.(b^n)       <-- If n was even
;   b           n-1         a*b     a.(b^n)       <-- If n was odd
; ...
; 'n' never becomes 0 without ever becoming an odd number. In the most extreme case (when initial 'n'
; is a power of 2, 'n' will at least become 1 before becoming 0 and we will be able to "transfer" the
; product to 'a' there)
; 
; In all cases, when n becomes 0, a becomes b^n


(define (fast-expt-iter a b n)
    (cond
        ((= 0 n) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))
    )
)
