;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.16
;; Design a procedure that evolves an iterative exponentiation process that uses
;; successive squaring and uses a logarithmic number of steps, as does
;; fast-expt. (Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep,
;; along with the exponent n and the base b, an additional state variable a, and
;; define the state transformation in such a way that the product a*b^n is
;; unchanged from state to state. At the beginning of the process a is taken to
;; be 1, and the answer is given by the value of a at the end of the process.
;; In general, the technique of defining an invariant quantity that remains
;; unchanged from state to state is a powerful way to think about the design of
;; iterative algorithms.) 

;; theta(log n) steps, theta(1) space implementation of exponential
(define (fast-expt b n)
    (define (fast-expt-iter b counter product)
        (define (even? n)
            (= (remainder n 2) 0))
        (cond ((= counter 0) product)
              ((even? counter) (fast-expt-iter b (/ counter 2) (square product)))
              (else (* b (fast-expt-iter b (- counter 1) product)))))
    (fast-expt-iter b n 1))
