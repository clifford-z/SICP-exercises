#lang sicp
(#%require "math.scm")
(#%require "Ex.1.22_new.scm")

(define (prime? n)
    (fast-prime? n 10))

