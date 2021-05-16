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

(define (dot-product v w)
  (acc + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (line)
         (acc + 0 (map * v line)))
       m))
(define (transpose m)
  (accu-n cons nil m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(line)
           (map (lambda (col)
                  (acc + 0 (map * line col)))
                cols))
         m)))

(matrix-*-vector (list (list 1 1 1) (list 0 1 0) ( list 0 0 1)) (list 1 2 3))
(transpose (list (list 1 0 0) (list 1 0 0) (list 1 0 0)))
(matrix-*-matrix (list (list 1 2) (list 3 4) ) (list (list 1 0) (list 1 0)))