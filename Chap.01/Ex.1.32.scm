#lang racket
;Recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (term (next a)) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

; Cube
(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (define (next a)
    (+ a 1))
  (sum cube a next b))