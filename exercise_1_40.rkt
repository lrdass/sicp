#lang sicp
(define (cube x) (* x x x))
(define dx 0.00000001)

(define (deriv f)(lambda (x)(/ (- (f (+ x dx)) (f x))  dx )))

(define (fixed-point f first-guess)
  (define (close-enuf? a b) (< (abs (- a b)) 0.000001))
  (define (try guess)
    (let ((next (f guess)))
     (if (close-enuf? guess next) next
         (try next)) 
    )
  )
  (try first-guess)
)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x))))
)

(define (cubic a b c) (lambda (x)
                        (+ (* x x x) (* (* x x) a) (* b x) c)
))

(fixed-point (newton-transform (cubic 1.0 1.0 1.0)) 1.0)
