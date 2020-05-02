#lang racket
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; No type restriction here. Problems could occur if start and end are not point type.
(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (average a b)
  (/ (+ a b) 2))

(define (midpoint-segment s)
  (make-point (average (x-point (start-segment s)) (x-point (end-segment s )))
              (average (y-point (start-segment s)) (y-point (end-segment s)))))

; Test
(define x (make-point -13 -8))
(define y (make-point 3 4))
(define s (make-segment x y))
(define midpoint (midpoint-segment s))
(print-point midpoint)