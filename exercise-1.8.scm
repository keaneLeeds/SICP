;; Structure and Interpretation of Computer Programs
;; Chapter 1

;; Exercise 1.8
;; Newton's method for cube roots is based on the fact that if y is an
;; approximation to the cube root of x, then a better approximation is given by
;; the value
;;
;; (/ (+ (/ x (square y)) (* 2 y)) 3)
;;
;; Use this formula to implement a cube-root procedure analogous to the
;; square-root procedure. (In section 1.3.4 we will see how to implement
;; Newton's method in general as an abstraction of these square-root and
;; cube-root procedures.) 

(define (cubrt x)
    (cube-iter 1.0 x))

(define (cube-iter guess x)
    (define (abs-diff a b)
        (abs (- a b)))
    (define (good-enough? guess x)
        (< (abs-diff (improve guess x) 0.001)
    (define improve guess x)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3))
    (if (close-enough? guess x)
        guess
        (cube-rt-iter (improve guess x) x)))

