;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.29
;; Simpson's Rule is a more accurate method of numerical integration than the
;; method illustrated above. Using Simpson's Rule, the integral of a function f
;; between a and b is approximated as
;;
;; h/3 [y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2y(n-1) + 4y(n-1) + yn]
;;
;; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing
;; n increases the accuracy of the approximation.) Define a procedure that takes
;; as arguments f, a, b, and n and returns the value of the integral, computed
;; using Simpson's Rule. Use your procedure to integrate cube between 0 and 1
;; (with n = 100 and n = 1000), and compare the results to those of the integral
;; procedure shown above.

(define (simpsons f a b n)
    (* (/ h 3) (simpsons-iter f a b n (- n 1) 0)))

(define (h a b n)
    (/ (- b a) n))

(define (y f a b n k)
    (f (+ a (* k (h a b n)))))

(define (simpsons-iter f a b n k accumulator)
    (define (simpsons-iter-template)
        (simpsons-iter f a b n (- k 1) (* (coefficient k) (accumulate))))
    (define (coefficient k)
        (cond ((= (modulo k 2) 0) 2)
              ((= k 0) 1)
              ((= (- n 1) k) 1)
              (else 4)))
    (define (accumulate)
        (+ accumulator (y f a b n k)))
    (cond
        ((= k 0) (accumulate))
        (else (simpsons-iter-template))))

