; Exercise 2.7, 2.8: Subtraction on intervals

#lang sicp

(define (make-interval a b)
  (cons a b)
)

(define (upper-bound i)
  (cdr i)
)

(define (lower-bound i)
  (car i)
)

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))
  )
)

