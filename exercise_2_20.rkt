#lang sicp
(define (is-even? num)
  (= (remainder num 2) 0) )

(define (even-numbers nums)
  (if (null? nums)
      nil
      (if (is-even? (car nums))
          (cons (car nums) (even-numbers (cdr nums)))
          (even-numbers (cdr nums)))))

(define (odd-numbers nums)
  (if (null? nums)
      nil
      (if (not (is-even? (car nums)))
          (cons (car nums) (odd-numbers (cdr nums)))
          (odd-numbers (cdr nums)))))


(define (same-parity x . rest)
  (if (is-even? x)
      (even-numbers (cons x rest))
      (odd-numbers (cons x rest))))

(same-parity 1 2 3 4 5 6 7 8 9 )