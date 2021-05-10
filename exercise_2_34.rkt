#lang sicp
(define (acc op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (acc op initial (cdr seq)))))

(define (horner-eval x coeffs-seq)
  (acc (lambda (coeff higher-terms)
         (+ coeff (* x higher-terms)))
       0
       coeffs-seq))

(horner-eval 2 (list 1 3 0 5 0 1))