#lang sicp
(#%require "math.scm")

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))