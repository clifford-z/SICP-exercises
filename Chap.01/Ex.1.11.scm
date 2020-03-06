#lang sicp
; Recrusive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; Iteration
(define (g n)
   (g-iter 2 1 0 n))

(define (g-iter a b c counter)
  (if (= counter 0)
      c
      (g-iter (+ a (* 2 b) (* 3 c)) a b (- counter 1))))