#lang racket
(require "arithmetic.rkt")
(require math)

(provide qlog)
(provide qexp)
(provide qsin)
(provide qcos)

;Creates a unit vector for i j k
(define (toUnit v)
  (map (lambda (x) (/ x (qmag (append v '(0))))) v))

(define (qlog q)
  (cons 0 (map (lambda (x) (* (acos(car q)) x)) (toUnit(rest q)))))

(define (qexp q)
  (q* (list(list(exp(real q)) 0 0 0) (ve (rest q)))))

(define (ve v)
  (cons (cos (qmag v)) (map (lambda (x) (* (sin(qmag v)) x)) (toUnit v))))

(define (qsin q)
  (q/ (q- (qexp (q* (list (list 0 (toUnit(rest q))) q))) 
  (qexp (q* (list (list -1 0 0 0) (q* (list (list 0 (toUnit(rest q))) q)))))
                      (q* (list 2 0 0 0) (list 0 (toUnit(rest q)))))))
                      
(define (qcos q)
  (q/ (q+ (qexp (q* (list (list 0 (toUnit(rest q))) q))) 
  (qexp (q* (list (list -1 0 0 0) (q* (list (list 0 (toUnit(rest q))) q)))))
                      (q* (list (list 2 0 0 0) (list 0 (toUnit(rest q))))))))
