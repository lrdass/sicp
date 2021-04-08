#lang sicp

(define (f n)
  
  (define (f-iter prev prev-1 prev-2 n current)
    
        
            (if (< current n)
                (if (or (= current 3) (> current 3))
                    (f-iter (+ prev (* 2 prev-1) (* 3 prev-2)) prev prev-1 n (+ 1 current) )
                    (f-iter current prev prev-1 n (+ 1 current))
                )
                prev
            )
         
    
  )
  (f-iter 0 0 0 (+ n 1) 0)
)
(f 3)