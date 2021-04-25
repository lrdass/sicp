#lang sicp
(define (last? L)
  (null? (cdr L)))

(define (list-ref items n )
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (prev-last? L)
  (null? (cdr (cdr L))))

(define (last-pair L)
  (if (last? L)
      (car L)
      (last-pair (cdr L))))


(define (list-except-last L)
  (if (prev-last? L)
      (cons (car L) nil)
      (cons (car L) (list-except-last (cdr L)))))

(define (reverse L)
  (if (last? L)
      (cons (car L) nil)
      (cons (last-pair L) (reverse (list-except-last L)))))

(list-except-last (list 1 2 3 4))
(reverse (list 1 4 9 16 25))
;;; (list-ref (reverse (list 1 4 9 16 25)) 3)

;(define (reverse-wrong L)
;  (if (last? L)
;      (car L)
;      (cons (reverse (cdr L)) (car L))))