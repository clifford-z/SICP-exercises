#lang racket
; Iteration
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

; Sum
(define (sum term a next b)
  (accumulate + 0 term a next b))

; Product
(define (product term a next b)
  (accumulate * 1.0 term a next b))

; Cube
(define (cube x)
  (* x x x))

(define (sum-cubes a b)
  (define (next a)
    (+ a 1))
  (sum cube a next b))

(define (pi-product a b)
  (define (term n)
    (if (odd? n)
        (/ (+ n 1) (+ n 2))
        (/ (+ n 2) (+ n 1))))
  (define (next a)
    (+ a 1))
  (product term a next b))

(sum-cubes 1 3)
(* 4 (pi-product 1 1000))
(* 4 (pi-product 1 1000000))