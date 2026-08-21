; Exercise 2.10: Define interval division with errors for divide by zero

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

(define (mul-interval x y)
  (let
    (
      (p1 (* (lower-bound x) (lower-bound y)))
      (p2 (* (lower-bound x) (upper-bound y)))
      (p3 (* (upper-bound x) (lower-bound y)))
      (p4 (* (upper-bound x) (upper-bound y)))
    )
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4)
    )
  )
)

(define (div-interval x y)
  (if (or (= (lower-bound y) 0)
          (= (upper-bound y) 0)
      )
      (error "can't divide by interval that has one of the bounds as zero")
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))
        )
      )
  )
)

