#lang sicp

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger-one-of-two x y)
  (if(> x y) x y))

(define (sum-of-two-larger-squares x y z)
  (sum-of-squares (larger-one-of-two x y) (larger-one-of-two y z)))
