#lang sicp
(define (enumerate low high)
  (if (> low high)
      nil
      (cons low (enumerate (+ 1 low) high))))

(define (acc op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (acc op init (cdr seq)))))

(define (flatmap proc seq)
  (acc append nil (map proc seq)))

(define (filter pred seq)
  (cond ((null? seq) nil)
        ((pred (car seq)) (cons (car seq) (filter pred (cdr seq))))
        (else (filter pred (cdr seq)))))


(define (pair-permutation p) (list (car (cdr p)) (car p)))

(define (pairs-are-equal? p1 p2)
  (and (= (car p1) ( car (cdr p2)))
       (= (car (cdr p1)) (car p2))))

(pairs-are-equal? (list 1 2) (list 2 1))
(filter (lambda(pair) (not (pairs-are-equal? pair (pair-permutation pair))))
        (list (list 1 2) (list 3 4) (list 2 1)))

(define (remove item seq)
  (filter (lambda (x) (not (= x item))) seq))

(define (unique-pairs n)
(flatmap (lambda(i)
             (map (lambda(j) (list i j))
                  (enumerate 1 (- i 1))))
           (enumerate 1 n)))
(unique-pairs 4)