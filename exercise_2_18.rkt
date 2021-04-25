#lang sicp
(define (last? L)
  (null? (cdr L)))
(define (reverse L)
  (if (last? L)
      (car L)
      (cons (reverse (cdr L)) (car L))))

(reverse (list 1 4 9 16 25))