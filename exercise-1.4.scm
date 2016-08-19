;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.4
;; Observe that our model of evaluation allows for combinations whose operators
;; are compound expressions. Use this observation to describe the behavior of
;; the following procedure:
;;
;; (define (a-plus-abs-b a b)
;;   ((if (> b 0) + -) a b))

;; ANSWER
;; 1) Evaluate subexpressions of the combination.
;; 2) Apply the procedure that is the value of the leftmost subexpression (the
;;    operator) to the arguments that are the values of the other subexpressions
;;    (the operands).

;; retrieve body of a-plus-abs b -> ((if (> b 0) + -) a b)
;; replace formal parameters with arguments ((if (> y 0) + - ) x y)
;; the (if (> y 0) + -) expression is evaluated
;; the values of x and (possibly (- y)) y are added

