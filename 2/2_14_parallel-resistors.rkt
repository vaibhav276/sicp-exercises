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

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (lower-bound y) (lower-bound y))
  )
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

; two ways of parallel resistors interval calculation

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)
  )
)

(define (par2 r1 r2)
  (let
    (
      (one (make-interval 1 1))
    )
    (div-interval
      one
      (add-interval (div-interval one r1)
                    (div-interval one r2)
      )
    )
  )
)
