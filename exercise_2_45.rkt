#lang sicp 
(#%require sicp-pict) 
  
;(define (up-split painter n) 
;   (if (= n 0) 
;       painter 
;       (let ((smaller (up-split painter (- n 1)))) 
;         (below painter (beside smaller smaller)))))

(define (split first second)
  (lambda (painter)
    (first painter (second painter painter))))

(define up-split (split below beside))
  
(paint (up-split einstein)) 