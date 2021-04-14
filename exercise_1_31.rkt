#lang sicp
(define (next x)(+ 1.0 x))
(define (even-sq-over-odd-sq i)
  (/ (* (* 2.0 i) (* 2.0 (+ 1.0 i)))
     (* (+ 1.0 (* 2.0 i)) (+ 1.0 (* 2.0 i)))))

(define (prdt term a next b)
  (if (> a b) 1
      (* (term a) (prdt term (next a) next b))))
(define pi-over-four (prdt even-sq-over-odd-sq 1 next 1000))
(* 4.0 pi-over-four)
