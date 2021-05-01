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
      (list (car L) )
      (cons (car L) (list-except-last (cdr L)))))

(define (reverse L)
  (if (last? L)
      (list (car L) )
      (cons (last-pair L) (reverse (list-except-last L)))))

(define (deep-reverse L)
 (let ((reversed-list (reverse L)))
   (display reversed-list)
   (newline)
   (define (iter L)
     (if (null? L)
         nil
         (cons (if (pair? (car L))
                          (reverse (car L))
                          (car L))
               (iter (cdr L)))))
   (iter reversed-list)
   ))


;(list-except-last (list 1 2 3 4))
(deep-reverse (list (list 1 4) (list 9 16) 25))
;;; (list-ref (reverse (list 1 4 9 16 25)) 3)

;(define (reverse-wrong L)
;  (if (last? L)
;      (car L)
;      (cons (reverse (cdr L)) (car L))))