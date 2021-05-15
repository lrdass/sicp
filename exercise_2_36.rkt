#lang sicp
(define (acc op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
          (acc op init (cdr seqs)))))

(define (accu-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (acc op init
                 (map
                  (lambda (sub-list)
                    (if (null? sub-list)
                        nil
                        (car sub-list)))
                  seqs))
            (accu-n op init
                    (map (lambda (sub-list)
                           (if (null? sub-list)
                               nil
                               (cdr sub-list)))
                         seqs)))))

(accu-n + 0 (list (list 1 2 3) (list 4 5 6) ( list 7 8 9) (list 10 11 12)))