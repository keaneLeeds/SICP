;; Structure and Interpretation of Computer Programs
;; Chapter 1
;; 
;; Exercise 1.11
;; A function f is defined by the rule that
;;
;; f(n) = n if n<3 and
;; f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
;;
;; Write a procedure that computes f by means of a recursive process. Write a
;; procedure that computes f by means of an iterative process.

;; recusive
(define (f n)
    (cond ((< n 3) n)
          (else (+ (f (- n 1))
                   (* 2 (f (- n 2)))
                   (* 3 (f (- n 3)))))))

;; iterative
(define (f n)
    (f-iter n 2 1 0))                      
(define (f-iter n f1 f2 f3)
    (cond ((= n 1) f2)
          ((= n 2) f1)
          (else (f-iter (- n 1) (+ f1 (* 2 f2) (* 3 f3)) f1 f2)))))

