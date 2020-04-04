#lang sicp
(#%require "math.scm")
(#%require "Ex.1.22.scm")


; Re-write find-divisor, add an incrementor)
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))
