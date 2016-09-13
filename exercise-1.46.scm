;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.46.  Several of the numerical methods described in this chapter are instances
;; of an extremely general computational strategy known as iterative improvement. Iterative
;; improvement says that, to compute something, we start with an initial guess for the
;; answer, test if the guess is good enough, and otherwise improve the guess and continue
;; the process using the improved guess as the new guess. Write a procedure
;; iterative-improve that takes two procedures as arguments: a method for telling whether a
;; guess is good enough and a method for improving a guess. Iterative-improve should return
;; as its value a procedure that takes a guess as argument and keeps improving the guess
;; until it is good enough. Rewrite the sqrt procedure of section 1.1.7 and the fixed-point
;; procedure of section 1.3.3 in terms of iterative-improve.

(define (iterative-improve threshold? improve)
  (define (iterate guess)
    (let ((next (improve guess)))
      (if (threshold? guess next)
	  guess
	  (iterate next))))
  (lambda (guess)
    (iterate guess)))
      
(define (sqrt-iter starting-guess target)
  (define (good-enough? guess target)
    (< (abs (- target guess)) 0.0001))
  (define (improve guess)
    (define (average x y)
      (/ (+ x y) 2.))
    (average guess (/ target guess)))
  ((iterative-improve good-enough? improve) starting-guess))

(define (fixed-point func starting-guess)
  (define (good-enough? guess target)
    (< (abs (- target guess)) 0.0001))
  (define (try guess)
    (let ((next (func guess)))
      (if (good-enough? guess next)
	  next
	  (try next))))
  ((iterative-improve good-enough? try) starting-guess))
