;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.41
;; Define a procedure double that takes a procedure of one argument as argument
;; and returns a procedure that applies the original procedure twice. For
;; example, if inc is a procedure that adds 1 to its argument, then (double inc)
;; should be a procedure that adds 2. What value is returned by
;;
;; (((double (double double)) inc) 5)

(define (double p)
  (lambda (a)
    (p (p a))))

(((double (double double)) inc) 5)

;; produces 21. Each double squares the exponent
;; (expt 2 1), (expt 2 2), (expt 2 4), (expt 2 8)
;; (expt 2 (expt 2 n))
