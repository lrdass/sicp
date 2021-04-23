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

(define (make-rectangle p1 width height)
  ( let (make-left-side (lambda (p1 p2)(cons p1 p2))
        (make-right-side (lambda (p1 p2)(cons p1 p2))))
  (cons (make-left-side (make-point (x-point p1) (y-point p1)) (make-point (x-point p1)(- (y-point p1)  height)))
        (make-right-side (make-point (+ (x-point p1) width) (y-point p1) ) (make-right-side (+ (x-point p1) width) (- (y-point p1) height))) ) ))
(make-rectangle (make-point 0 0) 10 5)