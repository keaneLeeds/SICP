;; Structure and Interpretation of Computer Programs
;; Chapter 1.2.5 Greatest Common Divisors

;; Euclid's Algorithm
;; O(log n) S(1)
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

;; Exercise 1.20
;; The process that a procedure generates is of course dependent on the rules
;; used by the interpreter. As an example, consider the iterative gcd procedure
;; given above. Suppose we were to interpret this procedure using normal-order
;; evaluation, as discussed in section 1.1.5.
;; (The normal-order-evaluation rule for if is described in exercise 1.5.)
;; Using the substitution method (for normal order), illustrate the process
;; generated in evaluating (gcd 206 40) and indicate the remainder operations
;; that are actually performed. How many remainder operations are actually
;; performed in the normal-order evaluation of (gcd 206 40)? In the
;; applicative-order evaluation?

;; 'evaluate the arguments and then apply' -> 'applicative order'.
;; (gcd 206 40)
;; -> (if (= b 0) a (gcd b (remainder a b)))
;; -> (if (false) a (gcd 40 (remainder 206 40)))
;; -> (if (false) a (gcd 40 26))
;; -> (gcd 40 26)
;; -> (if (= 26 0) a (gcd 40 (remainder 40 26)))
;; -> (if (false) a (gcd 40 (remainder 40 26)))
;; -> (if (false) a (gcd 26 14))
;; -> (gcd 26 14)
;; -> (if (= 14 0) a (gcd 14 (remainder 26 14)))
;; -> (if (false) a (gcd 14 (remainder 26 14)))
;; -> (if (false) a (gcd 14 12))
;; -> (gcd 14 12)
;; -> (if (= 12 0) a (gcd 12 (remainder 14 12)))
;; -> (if (false) a (gcd 12 (remainder 14 12)))
;; -> (if (false) a (gcd 12 2))
;; -> (gcd 12 2)
;; -> (if (= 2 0) a (gcd 2 (remainder 12 2)))
;; -> (if (false) a (gcd 2 (remainder 12 2)))
;; -> (if (= b 0) a (gcd 2 0))
;; -> (gcd 2 0)
;; -> (if (= 0 0) 2 (gcd 0 (remainder 2 0)))
;; -> 2

;; fully expand, and then reduce -> 'normal-order'
;; (gcd 206 40)
;; -> (if (= b 0) a (gcd b (remainder a b)))
;; -> (if (= 40 0) 206 (gcd 40 (remainder 206 40)))
;; -> (if (= 40 0) 206 (gcd 40 26))
;; -> (gcd 40 26)
;; -> (if (= 26 0) 40 (gcd 26 (remainder 40 26)))
;; -> (if (= 26 0) 40 (gcd 26 14))
;; -> (gcd 26 14)
;; -> (if (= 14 0) 26 (gcd 14 (remainder 26 14)))
;; -> (if (= 14 0) 26 (gcd 14 12))
;; -> (gcd 14 12)
;; -> (if (= 12 0) 14 (gcd 12 (remainder 14 12))
;; -> (if (= 12 0) 14 (gcd 12 2))
;; -> (gcd 12 2)
;; -> (if (= 2 0) 12 (gcd 2 (remainder 12 2)))
;; -> (if (= 2 0) 12 (gcd 2 0))
;; -> (gcd 2 0)
;; -> (if (= 0 0) 2 (gcd 2 (remainder 2 0)))
;; -> (if (= 0 0) 2 (gcd 2 0))
;; -> 2
