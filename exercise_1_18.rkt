#lang sicp
(define (mul-it a b prod)
  (define (is-even? n)(= 0 (remainder 2 n)))
  (define (double n)(* 2 n))
  (define (halve n)(/ 2 n))
  
  (cond ((= b 1) prod)
        ((is-even? b) (mul-it a (halve b) (+ prod (double a))))
        (else (mul-it a (- b 1) (+ prod a)))
  )
)

(mul-it 4 11 0)
