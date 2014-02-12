#lang racket
(require "arithmetic.rkt")
(require math)

(provide qlog)
(provide qexp)

;Creates a unit vector for i j k
(define (toUnit v)
  (map (lambda (x) (/ x (qmag (append v '(0))))) v))

(define (qlog q)
  (cons 0 (map (lambda (x) (* (acos(car q)) x)) (toUnit(rest q)))))

(define (qexp q)
  (q* (list(list(exp(real q)) 0 0 0) (ve (rest q)))))

(define (ve v)
  (cons (cos (qmag v)) (map (lambda (x) (* (sin(qmag v)) x)) (toUnit v))))
