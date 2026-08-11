#lang sicp

(define (smallest-divisor n)
    (smallest-divisor-iter n 2)
)

(define (smallest-divisor-iter n i)
    (cond
        ((> (square i) n) n)
        ((= 0 (remainder n i)) i)
        (else (smallest-divisor-iter n (next i)))
    )
)

(define (next i)
    (if (= i 2) 3 (+ i 2))
)

(define (square x) (* x x))

(define (prime? n)
    (= (smallest-divisor n) n)
)

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
    )
)

(define (report-prime time)
    (display " *** ")
    (display time)
)

(define (search-for-primes n remaining)
    (if (> remaining 0)
        (if (prime? (next-odd n))
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
