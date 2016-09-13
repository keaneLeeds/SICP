;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.36
;; Modify fixed-point so that it prints the sequence of approximations it
;; generates, using the newline and display primitives shown in exercise 1.22.
;; Then find a solution to x^x = 1000 by finding a fixed point of
;; x --> log(1000)/log(x). (Use Scheme's primitive log procedure, which
;; computes natural logarithms.) Compare the number of steps this takes with
;; and without average damping. (Note that you cannot start fixed-point with a
;; guess of 1, as this would cause division by log(1) = 0.)

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(define (search f neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? x y)
    (< (abs (- x y)) 0.001))            

(define tolerance 0.00001)

(define (print guess)
    (newline)
    (newline)
    (display "guess: ")
    (display guess))

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (print guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))
  
; x --> log10(1000) / log10(x)
