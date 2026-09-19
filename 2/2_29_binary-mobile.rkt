; Exercise 2.29

#lang sicp

(define (make-mobile left right)
  (list left right)
)

(define (make-branch len structure)
  (list len structure)
)

(define (left-branch mob)
  (car mob)
)

(define (right-branch mob)
  (car (cdr mob))
)

(define (branch-length branch)
  (car branch)
)

(define (branch-structure branch)
  (car (cdr branch))
)

(define (total-weight mob)
  (+
    (branch-weight (left-branch mob))
    (branch-weight (right-branch mob))
  )
)

(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch)) ; branch-structure is a mobile
      (branch-structure branch) ; branch-structure is a number
  )
)

(define (is-balanced mobile)
  (and (is-balanced-branch (left-branch mobile))
       (is-balanced-branch (right-branch mobile))
       (=
         (* (branch-length (left-branch mobile))
            (branch-weight (left-branch mobile))
         )
         (* (branch-length (right-branch mobile))
            (branch-weight (right-branch mobile))
         )
       )
  )
)

(define (is-balanced-branch branch)
  (if (pair? (branch-structure branch))
      (is-balanced (branch-structure branch))
      #t
  )
)


; Test mobiles

(define mob1 (make-mobile (make-branch 1 20)
                          (make-branch 2 10)
              )
)

(define mob2 (make-mobile (make-branch 1 20)
                          (make-branch 2 10)
              )
)

(define mymob (make-mobile (make-branch 5 mob1)
                           (make-branch 5 mob2)
              )
)


