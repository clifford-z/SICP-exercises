#lang racket
(#%require "math.scm")

(define (timed-prime-test n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (prime? n )
      (report-prime n (- (current-inexact-milliseconds) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

; _Note: How to implement do-whitle in C? As need to excute once before conditioning
(define (search-for-primes-prob start end n)
  (when (> start end)
      (display "Search ends.")
      ))
; Solution@SchemeWiki
(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower) lower (+ lower 1))))

(search-for-primes 1000 1019)       ; 1e3 
(search-for-primes 10000 10037)     ; 1e4 
(search-for-primes 100000 100043)   ; 1e5 
(search-for-primes 1000000 1000037) ; 1e6 
  
; As of 2008, computers have become too fast to appreciate the time 
; required to test the primality of such small numbers. 
; To get meaningful results, we should perform the test with numbers 
; greater by, say, a factor 1e6. 
(newline) 
(search-for-primes 1000000000 1000000021)       ; 1e9 
(search-for-primes 10000000000 10000000061)     ; 1e10 
(search-for-primes 100000000000 100000000057)   ; 1e11 
(search-for-primes 1000000000000 1000000000063) ; 1e12
(search-for-primes 1000000000000 1000000000063) ; 1e12

; Export package
(provide (all-defined-out))