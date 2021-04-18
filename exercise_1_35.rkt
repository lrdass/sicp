#lang sicp
(define (average x y)(/ (+ x y) 2))
(define (average-damp f) (lambda (x)(average x (f x))))

(define close-enuf?(lambda (x y)(< (abs(- x y)) 0.00001)) )
(define (fixed-point f first-guess)
     (define (try guess)
     (let ((next (f guess)))
       (newline)
       (display guess)
       (if (close-enuf? guess next)
           next
           (try next)
       )
     )
  
       )
     (try first-guess)
)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
