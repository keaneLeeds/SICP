;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.3
;; Define a procedure that takes three numbers as arguments and returns
;; the sum of the squares of the two larger numbers.

(define (sum-of-squares-drop-lowest a b c)
    (define (smallest a b c)
        (cond ((and (< a b) (< a c)) a)
              ((< b c) b)
              (else c)))
    (define (sum-of-squares a b)
        (+ (square a) (square b)))
    (cond ((= (smallest a b c) a) (sum-of-squares b c))
          ((= (smallest a b c) b) (sum-of-squares a c))
          (else (sum-of-squares a b))))

