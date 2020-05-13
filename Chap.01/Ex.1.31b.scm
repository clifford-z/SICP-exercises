#lang racket
; Iterarion
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter 1 1.0))
  

(define (pi-product a b)
  (define (term n)
    (if (odd? n)
        (/ (+ n 1) (+ n 2))
        (/ (+ n 2) (+ n 1))))
  (define (next a)
    (+ a 1))
  (product term a next b))

(* 4 (pi-product 1 1000))
(* 4 (pi-product 1 1000000))