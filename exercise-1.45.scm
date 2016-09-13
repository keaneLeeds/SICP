;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.45
;; We saw in section 1.3.3 that attempting to compute square roots by naively
;; finding a fixed point of y -> x/y does not converge, and that this can be fixed
;; by average damping. The same method works for finding cube roots as fixed
;; points of the average-damped y -> x/y^2. Unfortunately, the process does not work
;; for fourth roots -- a single average damp is not enough to make a fixed-point
;; search for y -> x/y^3 converge. On the other hand, if we average damp twice
;; (i.e., use the average damp of the average damp of y -> x/y^3) the fixed-point search
;; does converge. Do some experiments to determine how many average damps are
;; required to compute nth roots as a fixed-point search based upon repeated
;; average damping of y -> x/y^n-1. Use this to implement a simple procedure for
;; computing nth roots using fixed-point, average-damp, and the repeated procedure
;; of exercise 1.43. Assume that any arithmetic operations you need are available
;; as primitives.

(define (nth-root x n)
  (let ((damp (lambda (y)
		(/ x (expt y (- n 1)))))
	(dampenings (fib (- n 1)))
	(starting-guess 1.0))
    (fixed-point (repeated (average-damp damp) dampenings) starting-guess)))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.01))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
  
(define (repeated f n)
  (define (compose f g)
    (lambda (x)
      (f (g x))))
  (define (r g m)
    (cond ((equal? m 1) f)
	  (else (r (compose f g) (- m 1)))))
  (lambda (x)
    ((r f n) x)))
  
(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))


(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
	  ((even? count)
	   (fib-iter a
		     b
		     (+ (* p p) (* q q))      ; compute p'
		     (+ (* q q) (* 2 p q))    ; compute q
		     (/ count 2)))
	  (else (fib-iter (+ (* b q) (* a q) (* a p))
			  (+ (* b p) (* a q))
			  p
			  q
			  (- count 1)))))
  (fib-iter 1 0 0 1 n))
