#lang racket
(require "arithmetic.rkt")
(require math)

(provide qlog)
(provide qexp)
(provide qsin)
(provide qcos)

;Creates a unit vector for i j k
(define (toUnit v)
  (map (lambda (x) (/ x (qmag v))) v))

(define (qlog q)
  (cons 0 (map (lambda (x) (* (acos(car q)) x)) (toUnit(rest q)))))

(define (qexp q)
  (q* (list(list(exp(real q)) 0 0 0) (ve (rest q)))))

(define (ve v)
  (cons (cos (qmag v)) (map (lambda (x) (* (sin(qmag v)) x)) (toUnit v))))

(define (qsin q)
  (q/ (list (q- (list (qexp (q* (list q (append (list 0) (toUnit(rest q)))))) 
  (qexp (q* (list(list -1 0 0 0) (q* (list q (append (list 0) (toUnit(rest q))))))))
                      (q* (list (list 2 0 0 0) (append (list 0) (toUnit(rest q))))))))))
                      
(define (qcos q)
  (q/ (list (q+ (list (qexp (q* (list (append (list 0) (toUnit(rest q))) q))) 
  (qexp (q* (list (list -1 0 0 0) (q* (list (append (list 0) (toUnit(rest q))) q)))))))
                      (q* (list (list 2 0 0 0) (append (list 0) (toUnit(rest q))))))))
;'(-2.958 -3.81 ...)
;'(2.4525 .853 .. . )