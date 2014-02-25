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
  (q* (list(exp(real q)) 0 0 0) (ve (rest q))))

(define (ve v)
  (cons (cos (qmag v)) (map (lambda (x) (* (sin(qmag v)) x)) (toUnit v))))
          
(define (qsin q)
  (q/ (q- (qexp (q* q (append (list 0)(toUnit(rest q)))))
                (qexp (map - (q* q (append (list 0)(toUnit(rest q)))))))
            (q* '(2 0 0 0 ) (append (list 0)(toUnit(rest q))))))

(define (qcos q)
  (q/ (q+ (qexp (q* q (append (list 0)(toUnit(rest q)))))
                (qexp (map - (q* q (append (list 0)(toUnit(rest q)))))))
            (q* '(2 0 0 0 ) (append (list 0)(toUnit(rest q))))))
;'(-2.958 -3.81 ...)
;'(2.4525 .853 .. . )