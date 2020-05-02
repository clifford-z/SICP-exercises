#lang sicp
; Basic rational number definitions
(#%require "../Collections/math/basic.scm")

; Reduce when constructed
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; Refined make-rat
(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
        (cond ((or (and (> n 0) (> d 0)) (and (< n 0) (< d 0)))
               (cons (abs (/ n g)) (abs (/ d g))))
              (else (cons (* -1 (/ n g)) (abs (/ d g)))))))
         