;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.18
;; Using the results of exercises 1.16 and 1.17, devise a procedure that
;; generates an iterative process for multiplying two integers in terms of
;; adding, doubling, and halving and uses a logarithmic number of steps.

;; ANSWER: same as for exercise-1.17.scm
(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (even? n)
    (= (remainder n 2) 0))

(define (my* a b)
    (define (*-iter a b c)
        (cond ((= b 1) (+ a c))
              ((even? b) (*-iter (double a) (halve b) c))
              (else (*-iter a (- b 1) (+ a c)))))
    (*-iter a b 0))

