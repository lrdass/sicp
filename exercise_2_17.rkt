#lang sicp

(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))))

(define (lenght list)
  (define (iter-list list count)
    (if (null? (cdr list)) count (iter-list (cdr list) (+ 1 count))))
  (iter-list list 0))

(lenght (list 1 2 3 4 5))

(define (last-pair-it list count)
  (if (null? (cdr list))
      (last-pair-it (cdr list) (+ 1 count))))

(last-pair (list 23 72 149 34))

