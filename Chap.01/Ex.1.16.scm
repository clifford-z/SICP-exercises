#lang sicp
; Wrong
(define (expt2 b n)
  (expt-iter b 1 1 (floor (log n 2))))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt-iter0 b expo counter max-count)
  (cond ((> counter max-count)
         expo)
        ((> (sqrt counter) max-count)
         (expt-iter0 b (* b expo) (inc counter) max-count))
        (else (expt-iter0 b (sqrt expo) (sqrt counter) max-count))))

; Solution
;;; 16-fast-expt.scm

(define (fast-expt b n)
    (expt-iter b n 1))

(define (expt-iter b n a)
    (cond ((= n 0)
            a)
          ((even? n)
            (expt-iter (sqrt b)
                       (/ n 2)
                       a))
          ((odd? n)
            (expt-iter b
                       (- n 1)
                       (* b a)))))

