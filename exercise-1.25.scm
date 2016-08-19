;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.25
;; Alyssa P. Hacker complains that we went to a lot of extra work in writing
;; expmod. After all, she says, since we already know how to compute
;; exponentials, we could have simply written

(define (expmod base exponent m)
  (remainder (fast-expt base exponent) m))

;; Is she correct? Would this procedure serve as well for our fast prime tester?
;; Explain.

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent) (remainder (square (expmod base (/ exponent 2) m)) m))
        (else (remainder (* base (expmod base (- exponent 1) m)) m))))

(define (fast-expt base exponent)
  (cond ((= exponent 0) 1)
        ((even? exponent) (square (fast-expt base (/ exponent 2))))
        (else (* base (fast-expt base (- exponent 1))))))

;; Yes, it would work for the fast prime tester, and would do so in about half
;; as many steps. However, the expmod procedure has good numerical stability,
;; as the numbers being used never grow larger than (square exponent), rather
;; than (expt base exponent). That can be useful.
