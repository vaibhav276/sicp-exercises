; Exercise 2.12: Define a constructor make-center-percent
; that takes a center and a percentage tolerance and pro-
; duces the desired interval. You must also deﬁne a selector
; percent that produces the percentage tolerance for a given
; interval

#lang sicp

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

; solution
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
