#lang sicp
(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f times)
  (if (= times 1) f
      (repeated (compose f f) (- times 1))
  )
)

(define (function-smoother f dx)
  (lambda (x)(/ (+ (f (- x dx)) (f x) (f (+ x dx)) ) 3))
)

(define (square x)(* x x))
((function-smoother (lambda (x)(* x x)) 0.0000001) 0.1)
((repeated (function-smoother square 0.000001) 10) 0.1)
