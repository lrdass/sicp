#lang sicp

(define (fringe L)
  (cond  ((null? L )nil)
       ((not (pair? (car L))) L)
      (else (append (fringe (car L)) (fringe (cdr L))))))
;; fringe become a map?

(define (acc op initial items)
  (if (null? items)
      initial
      (op (car items)
          (acc op initial (cdr items)))))


(define (count-leaves t)
  (acc (lambda (x y) (+ 1 y))
       0
       (fringe t)))

(count-leaves (list (list (list 1 2) (list 3 4)) (list 5 6)))


(define (count-leaves t)
  (acc + 0 
    (map (lambda (x) 1) (fringe t))))
