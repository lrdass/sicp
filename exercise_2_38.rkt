#lang sicp
(define (fold-right op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
          (fold-right op init (cdr seqs)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter init seq))


(fold-right / 1.0 (list 1.0 2.0 3.0))
(fold-left / 1.0 (list 1.0 2.0 3.0))

(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))