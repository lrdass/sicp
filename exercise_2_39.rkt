#lang sicp
(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq) (fold-right op init (cdr seq)))))

(define (reverse seq)
  (fold-right
   (lambda (x y)
     (display "x: ")
     (display x)
     (newline)
     (display "y: ")
     (display y)
     (newline)
     (append y (list x))
   )
   nil
   seq))

(reverse (list 1 2 3))