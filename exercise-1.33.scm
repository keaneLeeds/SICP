;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.33
;; You can obtain an even more general version of accumulate (exercise 1.32) by
;; introducing the notion of a filter on the terms to be combined. That is,
;; combine only those terms derived from values in the range that satisfy a
;; specified condition. The resulting filtered-accumulate abstraction takes the
;; same arguments as accumulate, together with an additional predicate of one
;; argument that specifies the filter. Write filtered-accumulate as a procedure.
;; Show how to express the following using filtered-accumulate:
;;
;; a. the sum of the squares of the prime numbers in the interval a to b
;; (assuming that you have a prime? predicate already written)
;;
;; b. the product of all the positive integers less than n that are relatively
;; prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (accumulate combiner null-value term a next b filter)
    (cond ((> a b) null-value)
          ((filter a) (combiner (term a) (accumulate combiner null-value term (next a) next b filter)))
          (else (accumulate combiner null-value term (next a) next b filter))))

; a
(define (sum-of-prime-squares a b)
    (accumulate + 0 square a inc b prime?))

; b
(define (product-of-relative-primes n)
    (define (relatively-prime? a)
        (= 1 (gcd a n)))
    (accumulate * 1 identity 1 inc n relatively-prime?))

        
