#lang sicp
(#%require "math.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n )
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; _Note: How to implement do-whitle in C? As need to excute once before conditioning
(define (search-for-primes start end n)
  (if (> start end)
      (display "Search ends.")
      (
      