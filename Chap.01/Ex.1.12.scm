#lang racket/load
; 每个 pascal(row, col) 由 pascal(row-1, col-1) (左上边的元素)
; 和 pascal(row-1, col) (右上边的元素)组成

; 当 col 等于 0 (最左边元素)，或者 row 等于 col (最右边元素)时，
; pascal(row, col) 等于 1

; 未独立完成的原因：没有考虑到用二维数组；离散数学全集分割错误
; Recursive, slow, redundant
(define (pascal row col)
  (cond ((> col row)
         (error "invalid col value"))
        ((or (= col 0) (= row col))
         1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

; Iteration, fast, linear
(#%require "factorial-iter.scm")

(define (pascal-iter row col)
    (/ (factorial row)
       (* (factorial col)
          (factorial (- row col)))))