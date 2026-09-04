; Exercise 2.21: Two implementations of square-list

#lang sicp

(define (square-list items)
  (if (null? items)
      items
      (cons (square (car items)) (square-list (cdr items)))
  )
)

(define (square-list1 items)
  (map square items)
)

(define (square x) (* x x))

