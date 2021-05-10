#lang sicp
(define (acc op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
          (acc op initial (cdr seq)))))

(define (map p seq)
  (acc (lambda (x y)
         (cons (p x) y))
       nil
       seq))

(define (square x) (* x x))
(map square (list 1 2 3))
(define (append seq1 seq2)
  (acc cons seq2 seq1))
(append (list 1 2 3) (list 4 5 6))
(define (length seq)
  (acc (lambda (x y) (+ 1 y)) 0 seq))

(length (list 1 2 3 4))