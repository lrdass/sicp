#lang sicp
(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if(null? rest)
       result
       (iter (op result (car rest))
             (cdr rest))))
  (iter init seq))

(define (reverse seq)
  (fold-left
   (lambda (x y)
     (display "x: ")
     (display x)
     (newline)
     (display "y: ")
     (display y)
     (newline)
     (append (list y) x)
   )
   nil
   seq))

(reverse (list 1 2 3))
;(fold-left + 0 (list 1 2 3))