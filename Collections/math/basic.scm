#lang racket
; Export package
(provide (all-defined-out))

; Average
(define (average a b)
  (/ (+ a b) 2))

; Square
(define (square x)
  (* x x))

; Cube
(define (cube x)
  (* x x x))

; Devides?
(define (divides? a b)
  (= (remainder b a) 0))

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

; Greatest common factor
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Derivative
 (define (deriv g)
   (let ((dx 0.00001))
     (lambda (x)
            (/ (g (+ x dx) (g x))
               dx))))

; Sum
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))