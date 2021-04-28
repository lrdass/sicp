#lang sicp


(define (for-each f L)
  (define (iter f L eval)
    (if (not (null? L))
        (iter f (cdr L) (f (car L)))))
  (iter f L nil))


(for-each (lambda (x)
            (newline)
            (display x))
          (list 1 2 3 4 5))