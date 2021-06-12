#lang sicp
(define (make-leaf symbol weight)(list 'leaf symbol weight))
(define (leaf? obj)(eq? (car obj) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (lookup symbol set)
  (cond ((null? set) #f)
        ((eq? symbol (car set)) #t)
        (else (lookup symbol (cdr set)))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree)'())
        ((lookup symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        ((lookup symbol (symbols (right-branch tree)))
         (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "symbol doesnt exist" tree))))

(define sample-tree
(make-code-tree (make-leaf 'A 4)
(make-code-tree
(make-leaf 'B 2)
(make-code-tree
(make-leaf 'D 1)
(make-leaf 'C 1)))))

(encode-symbol 'A sample-tree)