;; Structure and Interpretation of Computer Programs
;; Chapter 1
;;
;; Exercise 1.40
;; Define a procedure cubic that can be used together with the newtons-method
;; procedure in expressions of the form

(newtons-method (cubic a b c) 1)

;; to approximate zeros of the cubic x^3 + ax^2 + bx + c. 

; f(x) = x
; y^3 + ay^2 + by + c  = x
; x^3 + ax^2 + bx + c = x
; 
; y = (x - c) / (y^2 + ay + b)
; 0 = (x - c) / b
; (define (cubic a b c)
;   (lambda (x) (/ (- x c) b)))
(define (cubic a b c)
    (lambda (x) (/ (- x c) b)))

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)
(define dx 0.00001)

(define (newton-transform g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
           dx)))

(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))

