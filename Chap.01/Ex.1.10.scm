#lang sicp
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; Pass function name as parameter to evoke corresponding function
(define (first10terms func)
  (let n 10)
  (term-iter func n)
  )

(define term-iter func counter
  (if (= counter 0)
      