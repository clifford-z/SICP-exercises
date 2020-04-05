#lang racket
(#%require "../Collections/math/basic.scm")

; Re-write find-divisor, add an incrementor)
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (next n)
    (if (= n 2)
        3
        (+ n 2)))

; Primes search
(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (successive-primes n count)
    (cond ((= count 0)
            (display "are primes.\n")
            (display "Time elapsed in millisecond:\n"))
          ((prime? n)
            (display n)
            (newline)
            (successive-primes (next-odd n) (- count 1)))
          (else
            (successive-primes (next-odd n) count))))

(define (search-for-primes n)
  (time (successive-primes n 3))
  (newline))

(search-for-primes 10000000000000) ;1e13
(search-for-primes 100000000000000) ;1e14
(search-for-primes 1000000000000000) ;1e15