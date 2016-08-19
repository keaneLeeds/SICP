;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.19
;; There is a clever algorithm for computing the Fibonacci numbers in a
;; logarithmic number of steps. Recall the transformation of the state variables
;; a and b in the fib-iter process of section 1.2.2:
;;
;; a <-- a + b and b <-- a
;;
;; Call this transformation T, and observe that applying T over and over again n
;; times, starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n). In
;; other words, the Fibonacci numbers are produced by applying Tn, the nth power
;; of the transformation T, starting with the pair (1,0). Now consider T to be
;; the special case of p = 0 and q = 1 in a family of transformations Tpq, where
;; Tpq transforms the pair (a,b) according to
;;
;; a <-- bq + aq + ap and b <-- bp + aq.
;;
;; Show that if we apply such a transformation Tpq twice, the effect is the same
;; as using a single transformation Tp'q' of the same form, and compute
;; p' and q' in terms of p and q. This gives us an explicit way to square these
;; transformations, and thus we can compute Tn using successive squaring, as in
;; the fast-expt procedure. Put this all together to complete the following
;; procedure, which runs in a logarithmic number of steps:

(define (fib n)
  (fib-iter 1 0 0 1 n))
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

;; a2 = b1q+a1q+a1p
;; b2 = b1p+a1q
;; a1 = b0q+a0q+a0p
;; b1 = b0p+a0q
;;
;; a2 = (b0p+a0q)q + (b0q+a0q+a0p)q + (b0q+a0q+a0p)p
;; b2 = (b0p+a0q)p + (b0q+a0q+a0p)q
;;
;; a2 = b0pq+a0qq + b0qq+a0qq+a0pq + b0pq+a0pq+a0pp
;; b2 = b0pp+a0pq + b0qq+a0qq+a0pq

;; a <= app+2aqq+bqq+2apq+2bpq
;; b <= aqq+bpp+bqq+2apq

;; a <-- bq + aq + ap
;; b <-- bp + aq.

;; a <= b(qq + 2pq) + a(qq + 2pq) + a(pp + qq)
;; b <= b(pp+qq) + a(qq+2pq)

;; q' = qq+2pq
;; p' = pp+qq
