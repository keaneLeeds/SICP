;; Structure and Interpretation of Computer Programs
;; Chapter 1

;; Exercise 1.7
;; The good-enough? test used in computing square roots will not be very
;; effective for finding the square roots of very small numbers. Also, in real
;; computers, arithmetic operations are almost always performed with limited
;; precision. This makes our test inadequate for very large numbers. Explain
;; these statements, with examples showing how the test fails for small and
;; large numbers. An alternative strategy for implementing good-enough? is to
;; watch how guess changes from one iteration to the next and to stop when the
;; change is a very small fraction of the guess. Design a square-root procedure
;; that uses this kind of end test. Does this work better for small and large
;; numbers? 

(define (sqrt-iter guess x)
    (define (improve guess x)
        (define (average x y)
            (/ (+ x y) 2))
      (average guess (/ x guess)))
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

;;(define (good-enough? guess x)
;;  (< (abs (- (square guess) x)) 0.001))

(define (good-enough? guess x)
    (< (abs (- (improve guess x) guess)) 0.001))
    
;; too small of a number will converge to .03125, regardless of the number
;; choose a number smaller than 0.001

;; too big of a number will create an infinite loop. The number will never be
;; smaller than 0.001 because that is below the precision available to the
;; architecture
;; choose a number that's really big.
