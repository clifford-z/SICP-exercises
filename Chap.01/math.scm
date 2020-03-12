#lang racket
;Sauare
(define (square x)
  (* x x))

; Factorial, Iteration
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

; Exponent, Recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

; Fast-Exponent
(define (fast-expt b n)
 (cond ((= n 0) 1)
       ((even? n) (square (fast-expt b (/ n 2))))
       (else (* b (fast-expt b (- n 1))))))

(provide (all-defined-out))