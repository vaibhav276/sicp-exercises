; Exercise 2.23: Provide an implementation of for-each

#lang sicp

(define (for-each proc items)
  (if (not (null? items))
      (
        (proc (car items))
        (for-each proc (cdr items))
      )
  )
)

(define (print-all items)
  (for-each (lambda (x)
                    (newline)
                    (display x)
            )
            items
  )
)

