#lang sicp
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (average x y)(/ (+ x y) 2))


(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-point segment) (car segment))
(define (end-point segment) (cdr segment))

(define (mid-point segment)
  (make-point (average (x-point(start-point segment)) (x-point(end-point segment)))
              (average (y-point(start-point segment)) (y-point(end-point segment)))))
(let
    ((p1 (make-point 0 0))
     (p2 (make-point 2 2)))
  (let ((seg (make-segment p1 p2)))
    
  (print-point (mid-point seg))
  (print-point p1)
  (print-point p2)
  )
)