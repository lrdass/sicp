#lang sicp
(define (mul a b)
  (if ((= b 0) a)
      (+ a (mul a (- b 1)))
   )
)

(define (mult a b)
  (define (is-even? n)(= 0 (remainder 2 n)))
  (define (double n)(* 2 n))
  (define (halve n)(/ 2 n))
  
  (cond ((= b 1) a)
        ((is-even? b) (+ (double a) (* a (halve b)) ))
        (else (+ a (* a (- b 1))))
  )
)
(mult 2 9)
