#lang sicp
(define (subsets s)
  (if(null? s)
     (list nil)
     (let ((rest (subsets (cdr s))))
       (append rest (map (lambda (elem)
                           (cons (car s) elem)) rest)))))

(subsets (list 1 2 3))