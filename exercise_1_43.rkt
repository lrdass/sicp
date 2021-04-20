#lang sicp
(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f times)
  (if (= times 1) f
      (repeated (compose f f) (- times 1))
  )
)
(define (square x)(* x x))


((repeated square 2) 5)

