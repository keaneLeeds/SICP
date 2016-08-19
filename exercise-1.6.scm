;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.6
;; Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
;; ``Why can't I just define it as an ordinary procedure in terms of cond?''
;; she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and
;; she defines a new version of if:
;;
;; (define (new-if predicate then-clause else-clause)
;;   (cond (predicate then-clause)
;;         (else else-clause)))
;;
;; Eva demonstrates the program for Alyssa:
;;
;; (new-if (= 2 3) 0 5)
;; 5
;;
;; (new-if (= 1 1) 0 5)
;; 0
;;
;; Delighted, Alyssa uses new-if to rewrite the square-root program:
;;
;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x)
;;                      x)))
;;
;; What happens when Alyssa attempts to use this to compute square roots?
;; Explain.

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

;; SUPPORTING INFORMATION
;; A minor difference between if and cond is that the <e> part of each cond
;; clause may be a sequence of expressions. If the corresponding <p> is found
;; to be true, the expressions <e> are evaluated in sequence and the value of
;; the final expression in the sequence is returned as the value of the cond.
;; In an if expression, however, the <consequent> and <alternative> must be
;; single expressions.

;; (cond (<p1> <e1>)
;;       (<p2> <e2>)
;;       ...
;;       (<pn> <en>))

;; (if <predicate> <consequent> <alternative>)

;; ANSWER
;; because new-if is an ordinary procedure, and Scheme is an applicative-order
;; language, the recursing subexpression needs to be evaluated. Since it must
;; always expand the subexpression, it never finds a stopping condition (on the
;; iteration that should be a stopping condition, it still has to expand the
;; second subexpression).

