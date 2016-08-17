;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.20
;; The process that a procedure generates is of course dependent on the rules
;; used by the interpreter. As an example, consider the iterative gcd procedure
;; given above. Suppose we were to interpret this procedure using normal-order
;; evaluation, as discussed in section 1.1.5. (The normal-order-evaluation rule
;; for if is described in exercise 1.5.) Using the substitution method (for
;; normal order), illustrate the process generated in evaluating (gcd 206 40)
;; and indicate the remainder operations that are actually performed. How many
;; remainder operations are actually performed in the normal-order evaluation of
;; (gcd 206 40)? In the applicative-order evaluation?

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; normal order evaluation rule -> expand in order as needed
;; substitution method -> To apply a compound procedure to arguments, evaluate
;;  the body of the procedure with each formal parameter replaced by the
;;  corresponding argument.
;; 'if' evaluation rule -> The predicate expression
;; is evaluated first, and the result determines whether to evaluate the
;; consequent or the alternative expression.

;; NORMAL ORDER
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))

(if (= 4 0)
    6
    (gcd 6 (remainder 6 4)))

(if (= 2 0)
    4
    (gcd 4 (remainder 4 2)))

(if (= 0 0)
    2
    _)
;; 4 remainder operations

;; APPLICATIVE ORDER
; 1
(gcd 206 40)
(if (= b 0)
    a
    (gcd b (remainder a b)))
; a = 206
; b = 40
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

; 2
(gcd 40 (remainder 206 40))
(if (= b 0)
    a
    (gcd b (remainder a b)))
; a = 40
; b = (remainder 206 40)
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))
(if (= 6 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

; 3
(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))
(if (= b 0)
    a
    (gcd b (remainder a b)))
;; a = (remainder 206 40)
;; b = (remainder 40 (remainder 206 40))   
(if (= (remainder 40 (remainder 206 40))
       0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))
(if (= 4 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))))

; 4
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))
(if (= b 0)
    a
    (gcd b (remainder a b)))
; a = (remainder 40 (remainder 206 40))
; b = (remainder (remainder 206 40)
;                (remainder 40 (remainder 206 40)))
(if (= (remainder (remainder 206 40)
                  (remainder 40 (remainder 206 40)))
       0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))
(if (= 2 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))))

; 5
(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))
(if (= b 0)
    a
    (gcd b (remainder a b)))
; a = (remainder (remainder 206 40)
;                (remainder 40 (remainder 206 40)))
; b = (remainder (remainder 40 (remainder 206 40))
;                (remainder (remainder 206 40)
;                           (remainder 40 (remainder 206 40))))
(if (= (remainder (remainder 40 (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40 (remainder 206 40))))
       0)
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))

(if (= 0 0)
    (remainder (remainder 206 40)
               (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))
                    (remainder (remainder 40 (remainder 206 40))
                               (remainder (remainder 206 40)
                                          (remainder 40 (remainder 206 40)))))))

(remainder (remainder 206 40)
           (remainder 40 (remainder 206 40)))
(remainder 6 (remainder 40 6))
(remainder 6 4)
(remainder 2)

;; 18 calls to remainder for applicative order
