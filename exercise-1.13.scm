;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.13
;; Prove that Fib(n) is the closest integer to (/ (expt theta n) (sqrt 5)),
;; where theta = (/ (+ 1 (sqrt 5)) 2). Hint: Let = sigma = (/ (- 1 (sqrt 5)) 2).
;; Use induction and the definition of the Fibonacci numbers (see section 1.2.2)
;; to prove that Fib(n) = (/ (- (expt theta n) (expt sigma n)) (sqrt 5)). 

(define (theta) 
    (/ (+ 1 (sqrt 5)) 2))

(define (sigma)
    (/ (- 1 (sqrt 5)) 2))

(define (fib-proof n)
    (/ (- (expt theta n) (expt sigma n)) (sqrt 5)))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;; BASIS
;; Fib(2) = (theta^2 - sigma^2)/(sqrt 5)
;; Fib(1) + Fib(0) = (((2 + 2(sqrt5))/4) - ((2 -2(sqrt 5))/4))/(sqrt 5)
;; 1 + 0 = (4(sqrt 5)/4)/(sqrt 5)
;; 1 = 1

;; INDUCTION
;; Fib(n+2) = (theta^(n+2) - sigma^(n+2))/(sqrt 5)
;; (theta^(n+2) - sigma^(n+2))/(sqrt 5)
;;      = (theta^(n+1)-sigma^(n+1))/(sqrt 5) + (theta^(n)-sigma^(n))/(sqrt 5)
;; (theta^n * theta^2) - (sigma^n * simga^2)
;;      = (theta^n * theta) + (theta^n) - (sigma^n * sigma) - sigma^n
;; theta^2 = theta + 1 (by definition)
;; sigma^2 = sigma + 1
;;  -> 6 - 2(sqrt 5)/2 = 1 - (sqrt 5) + 2
;;  -> 3 - (sqrt 5) = 3 - (sqrt 5)
;;

