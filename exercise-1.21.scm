;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.21
;; Use the smallest-divisor procedure to find the smallest divisor of each of
;; the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
  
;; 199
(smallest-divisor 199)
(find-divisor 199 2)
(cond ((> 4 199) 199)
      ((divides? 2 199) 2)
      (else (find-divisor 199 3)))

(find-divisor 199 3)
(cond ((> 9 199) 199)
      ((divides? 3 199) 3)
      (else (find-divisor 199 4)))

(find-divisor 199 4)
(cond ((> 16 199) 199)
      ((divides? 4 199) 4)
      (else (find-divisor 199 5)))

(find-divisor 199 5)
(cond ((> 25 199) 199)
      ((divides? 5 199) 5)
      (else (find-divisor 199 6)))

(find-divisor 199 6)
(cond ((> 36 199) 199)
      ((divides? 6 199) 6)
      (else (find-divisor 199 7)))

(find-divisor 199 7)
(cond ((> 49 199) 199)
      ((divides? 7 199) 7)
      (else (find-divisor 199 8)))

(keep-fucking-going-until 14)

(find-divisor 199 14)
(cond ((> 196 199) 199)
      ((divides? 14 199) 14)
      (else (find-divisor 199 15)))

(find-divisor 199 15)
(cond ((> 225 199) 199)
      ((divides? 15 199) 15)
      (else (find-divisor 199 16)))

199

;; 1999
(smallest-divisor 1999)
(find-divisor 1999 2)
(cond ((> 4 1999) 1999)
      ((divides? 2 1999) 2)
      (else (find-divisor 1999 3)))

(find-divisor 1999 3)
(cond ((> 9 1999) 1999)
      ((divides? 3 1999) 3)
      (else (find-divisor 1999 4)))

(find-divisor 1999 4)
(cond ((> 16 1999) 1999)
      ((divides? 4 1999) 4)
      (else (find-divisor 1999 5)))

(find-divisor 1999 5)
(cond ((> 25 1999) 1999)
      ((divides? 5 1999) 5)
      (else (find-divisor 1999 6)))

(find-divisor 1999 6)
(cond ((> 36 1999) 1999)
      ((divides? 6 1999) 6)
      (else (find-divisor 1999 7)))

(find-divisor 1999 7)
(cond ((> 49 1999) 1999)
      ((divides? 7 1999) 7)
      (else (find-divisor 1999 8)))

(keep-fucking-going-until 44)

(find-divisor 1999 44)
(cond ((> 1936 1999) 1999)
      ((divides? 44 1999) 44)
      (else (find-divisor 1999 45)))

(find-divisor 1999 45)
(cond ((> 2025 1999) 1999)
      ((divides? 45 1999) 45)
      (else (find-divisor 1999 46)))

1999

;; 19999
(smallest-divisor 19999)
(find-divisor 19999 2)
(cond ((> 4 19999) 19999)
      ((divides? 2 19999) 2)
      (else (find-divisor 19999 3)))

(find-divisor 19999 3)
(cond ((> 9 19999) 19999)
      ((divides? 3 19999) 3)
      (else (find-divisor 19999 4)))

(find-divisor 19999 4)
(cond ((> 16 19999) 19999)
      ((divides? 4 19999) 4)
      (else (find-divisor 19999 5)))

(find-divisor 19999 5)
(cond ((> 25 19999) 19999)
      ((divides? 5 19999) 5)
      (else (find-divisor 19999 6)))

(find-divisor 19999 6)
(cond ((> 36 19999) 19999)
      ((divides? 6 19999) 6)
      (else (find-divisor 19999 7)))

(find-divisor 19999 7)
(cond ((> 49 19999) 19999)
      ((divides? 7 19999) 7)
      (else (find-divisor 19999 8)))
7

