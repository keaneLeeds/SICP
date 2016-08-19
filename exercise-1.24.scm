;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.24.
;; Modify the timed-prime-test procedure of exercise 1.22 to use fast-prime?
;; (the Fermat method), and test each of the 12 primes you found in that
;; exercise. Since the Fermat test has (log n) growth, how would you expect the
;; time to test primes near 1,000,000 to compare with the time needed to test
;; primes near 1000? Do your data bear this out? Can you explain any discrepancy
;; you find? 

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n) (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
    
(define (search-for-primes n x)
    (if (= x 0)
        (end-display)
      (if (even? n)
          (search-for-primes (+ n 1) x)
        (if (fast-prime? n)
            (timer n x)
          (search-for-primes (+ n 2) x)))))

(define (timer n x)
    (timed-prime-test n)
    (search-for-primes (+ n 2) (- x 1)))

(define (end-display)
    (newline)
    (display " done "))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent) (remainder (square (expmod base (/ exponent 2) m)) m))
        (else (remainder (* base (expmod base (- exponent 1) m)) m)))) 

;; holy crap. previous to using the fast-prime, 10^13 took about 3 seconds. Now,
;; 10^1000 is taking about 0.4 seconds. Which is what I guess I should be
;; expecting from an O(log(n)) algorithm.
;; I like the log(n)
