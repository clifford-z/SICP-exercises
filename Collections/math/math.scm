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


; Find divisor
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (next n)
    (if (= n 2)
        3
        (+ n 2)))


; Fermat test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))


; Sum
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


; Half-interval roots finding
(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
              (cond ((positive? test-value)
                     (search f neg-point midpoint))
                    ((negative? test-value)
                     (search f midpoint pos-point))
                    (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "values are not opposite sign" a b)))))


; Fixed-point finding
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


; Derivative
 (define (deriv g)
   (let ((dx 0.00001))
     (lambda (x)
            (/ (g (+ x dx) (g x))
               dx))))
   

; Rational number defination
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

(define (make-rat n d)
  (cons n d))

; Reduce numerator when invoked
(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))

; Reduce denominator when invoked
(define (denom x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (cdr x) g)))

; Reduce when constructed
; (define (make-rat n d)
;   (let ((g (gcd n d)))
;     (cons (/ n g) (/ d g))))
; (define (numer x) (car x))
; (define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))