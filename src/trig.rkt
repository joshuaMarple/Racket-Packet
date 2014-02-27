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
   (if (= (qmag (list (gi q) (gj q) (gk q))) 0)  (list (log (real q)) 0 0 0)
       (cons (log (qmag q)) (map (lambda (x) (* (acos(/ (real q) (qmag q))) x)) (toUnit(rest q))))))

(define (qexp q)
   (if (= (qmag (list (gi q) (gj q) (gk q))) 0) (list (exp (real q)) 0 0 0)
       (q* (list(exp(real q)) 0 0 0) (ve (rest q)))))

(define (ve v)
  (cons (cos (qmag v)) (map (lambda (x) (* (sin(qmag v)) x)) (toUnit v))))
          
(define (qsin q)
  (if (= (qmag (list (gi q) (gj q) (gk q))) 0)  (list (sin (real q)) 0 0 0)
      (q/ (q- (qexp (q* q (append (list 0)(toUnit(rest q)))))
              (qexp (map - (q* q (append (list 0)(toUnit(rest q)))))))
          (q* '(2 0 0 0 ) (append (list 0)(toUnit(rest q)))))))

(define (qcos q)
  (if (= (qmag (list (gi q) (gj q) (gk q))) 0)  (list (cos (real q)) 0 0 0)
      (q/ (q+ (qexp (q* q (append (list 0)(toUnit(rest q)))))
              (qexp (map - (q* q (append (list 0)(toUnit(rest q)))))))
          '(2 0 0 0))))

;'(-2.958 -3.81 ...)
;'(2.4525 .853 ...)

(define q '(0 1 1 1))
(qlog q)
(qexp q)
(q* q (append (list 0)(toUnit(rest q))))
(qsin q)
(qcos q)