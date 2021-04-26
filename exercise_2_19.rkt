#lang sicp
(define (count-change amount) (cc amount 5))

;(define (fist-denomination kinds-of-coins)
;  (cond ((= kinds-of-coins 1) 1)
;        ((= kinds-of-coins 2) 2)
;        ((= kinds-of-coins 3) 10)))

(define us-coins (list 50 25 10 5 1))

(define (first-denomination coin-values)
  (car coin-values))

(define (except-first-denomination coins)
  (cdr coins))

(define (no-more? coins) (null? coins))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination
                 coin-values))
            (cc (- amount
                   (first-denomination
                    coin-values))
                coin-values)))))

(cc 100 us-coins)