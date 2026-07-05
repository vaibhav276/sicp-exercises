#lang sicp

; (a ^ n) modulo b
(define (expmod a n b)
    (cond
        ((= n 0) 1)
        ((even? n) 
            (
                remainder
                (square (expmod a (/ n 2) b))
                b
            )
        )
        (else 
            (
                remainder
                (* a (expmod a (- n 1) b))
                b
            )
        )
    )
)

(define (square x) (* x x))

(define (fermet-test n)
    (define (try-it a)
        (if (= (expmod a n n) a)
            #t
            #f
        )
    )
    (try-it (+ 1 (random (- n 1))))
)

; degree = how much certainty you want?
(define (fast-prime? n degree)
    (if (= degree 0)
        #t
        (and (fermet-test n) (fast-prime? n (- degree 1)))
    )
)


; --- And now the benchmark
(define certainty-degree 10)

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (fast-prime? n certainty-degree)
        (report-prime (- (runtime) start-time))
    )
)

(define (report-prime time)
    (display " *** ")
    (display time)
)

(define (search-for-primes n remaining)
    (if (> remaining 0)
        (if (fast-prime? (next-odd n) certainty-degree)
            (
                begin
                (timed-prime-test (next-odd n))
                (search-for-primes (+ (next-odd n) 2) (- remaining 1))
            )
            (search-for-primes (+ (next-odd n) 2) remaining)
        )
    )
)

(define (next-odd n)
    (if (even? n) (+ 1 n) n)
)