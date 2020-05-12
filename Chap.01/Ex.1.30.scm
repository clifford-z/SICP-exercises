#lang racket
; Sum, iteration ver.
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term (next a))))))
  (iter 0 0))

; Cube
(define (cube x)
  (* x x x))

(define (integral f a b dx)
  (* (sum f (+ a (/ dx 2)) (lambda (x) (+ x dx)) b)
     dx))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (next k)
    (+ k 1))
  (define (factor k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((odd? k ) 4)
          (else 2)))
  (define (term k)
    (* (factor k) (y k)))
  
  (if (not (even? n))
    (error "n can't be odd")
    (* (/ h 3)
       (sum term (exact->inexact 0) next n))))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(integral-simpson cube 0 1 100)
(integral-simpson cube 0 1 1000)
  