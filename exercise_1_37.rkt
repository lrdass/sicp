#lang sicp
(define (cont-frac N D k)
  (if (= k 0)
      (D 1.0)
      (/ (N 1.0) (+ (D 1.0) (cont-frac N D (- k 1)))))
)

(/ 1 (cont-frac (lambda (i) 1.0) (lambda(i) 1.0) 1000))
