;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.31
;; a.  The sum procedure is only the simplest of a vast number of similar
;; abstractions that can be captured as higher-order procedures. Write an
;; analogous procedure called product that returns the product of the values of
;; a function at points over a given range. Show how to define factorial in
;; terms of product. Also use product to compute approximations to using the
;; formula
;;
;; (/ pi 4) = (/ (* 2 4 4 6 6 8 ...) (* 3 3 5 5 7 7))
;;
;; b.  If your product procedure generates a recursive process, write one that
;; generates an iterative process. If it generates an iterative process, write
;; one that generates a recursive process.

; product
(define (product f a b)
    (if (> a b)
        1
        (* a (product f (f a) b))))

(define (inc x)
    (+ x 1))

; factorial using product
(define (factorial x)
    (product inc 1 x))

; iterative product
(define (product f a b)
    (define (product-iter f a b acc)
        (if (> a b)
            acc
            (product f (f a) b (* acc a))))
    (product-iter f a b 0)
