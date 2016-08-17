;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.39
;; A continued fraction representation of the tangent function was published in
;; 1770 by the German mathematician J.H. Lambert:
;;
;;         x
;; tan x = ---------------
;;         1 - x^2
;;             -----------
;;             3 - x^2
;;                 -------
;;                 5 - ...
;;
;; where x is in radians. Define a procedure (tan-cf x k) that computes an
;; approximation to the tangent function based on Lambert's formula. K specifies
;; the number of terms to compute, as in exercise 1.37.

(define (tan-cf x k)
    (define (ni i)
        (if (= i 1)
            x
            (- (square x))))
    (define (di i)
        (+ 1 (* 2 (- i 1))))
    (cont-frac ni di k))

