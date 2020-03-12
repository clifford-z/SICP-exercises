#lang sicp
(define (* a b)
  (mult-iter a b 0))

(define (mult-iter a b product)
  (cond ((= b 0) product)
        ((even? b) (mult-iter (double a) (halve b) product))
        (else (mult-iter a (- b 1) (+ product a)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))