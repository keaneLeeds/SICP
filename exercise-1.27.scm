;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.27
;; Demonstrate that the Carmichael numbers listed in footnote 47 really do fool
;; the Fermat test. That is, write a procedure that takes an integer n and tests
;; whether a^n is congruent to a modulo n for every a<n, and try your procedure
;; on the given Carmichael numbers.

;; 47) Numbers that fool the Fermat test are called Carmichael numbers, and
;; little is known about them other than that they are extremely rare. There are
;; 255 Carmichael numbers below 100,000,000. The smallest few are 561, 1105,
;; 1729, 2465, 2821, and 6601. In testing primality of very large numbers chosen
;; at random, the chance of stumbling upon a value that fools the Fermat test is
;; less than the chance that cosmic radiation will cause the computer to make an
;; error in carrying out a ``correct'' algorithm. Considering an algorithm to be
;; inadequate for the first reason but not for the second illustrates the
;; difference between mathematics and engineering.

(define (test-all n)
    (define (try-it a)
        (= (expmod a n n) a))
    (define (iter-all m)
        (cond ((= 0 m) true))
              ((try-it m) (iter-all (- m 1)))
              (else false))
    (iter-all (- n 1)))
 
(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent) (remainder (square (expmod base (/ exponent 2) m)) m))
        (else (remainder (* base (expmod base (- exponent 1) m)) m))))

;; yep. They fool the test.
