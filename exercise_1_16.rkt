#lang sicp

(define (exp b n)
  (define (square x) (* x x) )
  (define (is-even? n) (= (remainder n 2) 0))
  
  (define (exp-iter n b a)
    (cond ((= n 0) (* a))
          ((is-even? n)(exp-iter (/ n 2) (square b) a))
          (else (exp-iter (- n 1) b (* a b)))
    )
  )
  (exp-iter n b 1)
)
(exp 2 2)


(define (expt-it a b n)
  (define (is-even? n) (= (remainder n 2) 0))
  (cond ((= n 0) a)
        ((is-even? n) (expt-it a (* b b) (/ n 2)))
        (else (expt-it (* a b) b (- n 1)))
  )
)

(expt-it 1 3 2)