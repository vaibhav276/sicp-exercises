#lang sicp

; Exercise 1.19: There is a clever algorithm for computing
; the Fibonacci numbers in a logarithmic number of steps.
; Recall the transformation of the state variables a and b in
; the fib-iter process of Section 1.2.2: a ← a +b and b ← a.
; Call this transformation T , and observe that applying T
; over and over again n times, starting with 1 and 0, produces
; the pair Fib(n + 1) and Fib(n). In other words, the Fibonacci
; numbers are produced by applying T n , the n th power of the
; transformationT , starting with the pair (1, 0). Now consider
; T to be the special case of p = 0 and q = 1 in a family of
; transformations T pq , where Tpq transforms the pair (a, b)
; according to a ← bq + aq + ap and b ← bp + aq. Show
; that if we apply such a transformation T pq twice, the eﬀect
; is the same as using a single transformation Tp ′ q ′ of the
; same form, and compute p ′ and q ′ in terms of p and q. is
; gives us an explicit way to square these transformations,
; and thus we can compute T n using successive squaring, as
; in the fast-expt procedure. Put this all together to com-
; plete the following procedure, which runs in a logarithmic
; number of steps.


; To start with
; a = b.q + a.q + a.p
; b = b.p + a.q
; 
; Which becomes this when applied onto itself
; a = (b.p + a.q).q + (b.q + a.q + a.p).q + (b.q + a.q + a.p).p
; b = (b.p + a.q).p + (b.q + a.q + a.p).q
; 
; Expanding...
; a = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
; b = bp^2 + apq + bq^2 + aq^2 + apq
; 
; Rearranging...
; a = bpq + bpq + bq^2 + aq^2 + apq + apq + ap^2 + aq^2 
; b = bp^2 + bq^2 + aq^2 + apq + apq 
; 
; Restating to recognize p' and q'...
; a = b.(2pq + q^2) + a.(q^2 + 2pq) + a.(p^2 + q^2)
; b = b.(p^2 + q^2) + a.(2pq + q^2)
; 
; Therefore,
; p' = p^2 + q^2
; q' = q^2 + 2pq

(define (fib n)
    (fib-iter 1 0 0 1 n)
)

(define (fib-iter a b p q count)
    (cond 
        ((= count 0) b)
        ((even? count)
            (
                fib-iter
                a
                b
                (+ (square p) (square q))
                (+ (square q) (* 2 p q))
                (/ count 2)
            )
        )
        (else 
            (
                fib-iter 
                (+ (* b q) (* a q) (* a p))
                (+ (* b p) (* a q)) 
                p
                q
                (- count 1)
            )
        )
    )
)

(define (square x) (* x x))