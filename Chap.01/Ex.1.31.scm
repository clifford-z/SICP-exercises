#lang racket
(define (product term a next b)
  (if (> a b)
      ; Convert fraction to decimal
      1.0
      (* (term a)
         (product term (next a) next b))))

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