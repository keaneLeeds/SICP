;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.38
;; In 1737, the Swiss mathematician Leonhard Euler published a memoir
;; 'De Fractionibus Continuis', which included a continued fraction expansion
;; for e - 2, where e is the base of the natural logarithms. In this fraction,
;; the Ni are all 1, and the Di are successively
;; 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ....
;; Write a program that uses your cont-frac procedure from exercise 1.37 to
;; approximate e, based on Euler's expansion.

(define (euler-expansion-e-2 i)
    (if (= (modulo i 3) 2)
        (* 2 (+ 1 (quotient i 3)))
        1))

(cont-frac (lambda (i) 1.0) (euler-expansion i) 11)         
