; Exercise 2.13: Show that under the assumption of small
; percentage tolerances there is a simple formula for the ap-
; proximate percentage tolerance of the product of two in-
; tervals in terms of the tolerances of the factors. You may
; simplify the problem by assuming that all numbers are pos-
; itive

#lang sicp

; Conclusion after some simple experiments:
; -------------------------------------------
; We can simply add the tolerance percentages of the parts to get the tolerance percentage of the whole


; priliminaries
(define (make-interval a b)
  (cons a b)
)

(define (upper-bound i)
  (cdr i)
)

(define (lower-bound i)
  (car i)
)

(define (make-center-percent c p)
  (let
    (
      (width (/ (* c p) 100.0))
    )
    (make-interval (- c width) (+ c width))
  )
)

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0)
)

(define (percent i)
  (* (/ (- (center i) (lower-bound i)) (center i)) 100.0)
)

; solution
(define (percent-of-mul i1 i2)
  (+ (percent i1) (percent i2))
)
