#lang sicp
(define (square x)(* x x))
(define (next x)(+ 1 x))

(define (sum term a next b)
  
    (define (iter a result)
      (if (> a b) result
          (iter (next a) (+ result (term a)))
      )
     ) 
  (iter a 0)
)

(sum square 1 next 5)
