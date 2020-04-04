#lang racket
(#%require "math.scm")
(#%require "Ex.1.22_new.scm")

; Re-write find-divisor, add an incrementor)
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (next test-divisor)))))

(define (next n)
    (if (= n 2)
        3
        (+ n 2)))
