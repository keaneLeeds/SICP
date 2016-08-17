;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.30
;; The sum procedure above generates a linear recursion. The procedure can be
;; rewritten so that the sum is performed iteratively. Show how to do this by
;; filling in the missing expressions in the following definition:

; linear recursion
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; iterative O(1) space, time is bound by 'next' function
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a a))
