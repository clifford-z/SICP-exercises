#lang racket
(#%require "math.scm")
(provide (all-defined-out))

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