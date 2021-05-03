#lang sicp
(define (append L1 L2)
  (if (null? (cdr L1))
      (cons (car L1) L2)
      (cons (car L1) (append (cdr L1) L2))))

(define (list? p)
  (if (and (not (pair? (car p)))
           (pair? (cdr p)))
      #t
      #f
      ))

(define (fringe L)
 (append
   (if (list? (car L))
      (car L)
      (append (fringe (car L)) (fringe (cdr L))))
  (if (list? (cdr L))
      (cdr L)
      (append (fringe (car L)) (fringe (cdr L))))))

(define L1 (list (list 1 2) (list 3 4)))

(list?  (cdr L1))
(cdr L1)
