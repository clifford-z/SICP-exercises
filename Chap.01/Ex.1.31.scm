#lang racket
(define (product term a next b)
  (if (> a b)
      ; Convert fraction to decimal
      1.0
      (* (term a)
         (product term (next a) next b))))

(define (pi-product a b)
  (define (term n)
    (cond ((= n 1) (/ 2 3))
          ((even? n) (/ (+ n 2) (+ n 1)))
          (else (/ (+ n 1) (+ n 2)))))
  (define (next a)
    (+ a 1))
  (product term a next b))