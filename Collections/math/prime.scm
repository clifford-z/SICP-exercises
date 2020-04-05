#lang racket

(#%require "basic.scm")
; Export package
(provide (all-defined-out))

; Find divisor
; Order of groth: O(square(n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= (smallest-divisor n) n))