#lang racket
(require "../src/arithmetic.rkt")
(require "../src/trig.rkt")
(require rackunit "../src/arithmetic.rkt")

(define (quicktest)
  (check-equal? (q/ '((1 0 0 0) ( 0 1 0 0))) '(0 -1 0 0) "division"))

(define (test lists)
  (for ([i lists])
    (test_set i)))

(define (test_set set)
  (begin
  (check-equal? (q+ (list-ref set 0)) (list-ref set 1) "Addition")
  (check-equal? (q- (list-ref set 0)) (list-ref set 2) "Subtraction")
  (check-equal? (q* (list-ref set 0)) (list-ref set 3) "Multiplication")
  (check-equal? (q/ (list-ref set 0)) (list-ref set 4) "Division")
  ))
  
(define (run_test qs q3 operation)
  (let ([result (operation qs)])
  (unless (q= (list result q3))
      (display (format "Using ~a on quats: ~a Program got: ~a Correct answer is: ~a\n" operation qs  result q3)))))

(define test_pairs 
                  ;      q1           q2             +            -           *            /
             '( ;( ((0  0  0  0) (0  0  0  0)) (0  0  0  0) (0  0  0  0) (0  0  0  0) (0  0  0  0))
           
                ( ((0  0  0  0) (0  0  0  1)) (0  0  0  1) (0  0  0 -1) (0  0  0  0) (0  0  0  0))
                ( ((0  0  0  0) (0  0  1  0)) (0  0  1  0) (0  0 -1  0) (0  0  0  0) (0  0  0  0))
                ( ((0  0  0  0) (0  1  0  0)) (0  1  0  0) (0 -1  0  0) (0  0  0  0) (0  0  0  0))
                ( ((0  0  0  0) (1  0  0  0)) (1  0  0  0) (-1 0  0  0) (0  0  0  0) (0  0  0  0))
           
                ( ((0  0  0  1) (0  0  0  1)) (0  0  0  2) (0  0  0  0) (-1 0  0  0) (1  0  0  0))
                ( ((0  0  0  1) (0  0  1  0)) (0  0  1  1) (0  0 -1  1) (0 -1  0  0) (0  1  0  0))
                ( ((0  0  0  1) (0  1  0  0)) (0  1  0  1) (0 -1  0  1) (0  0  1  0) (0  0 -1  0))
                ( ((0  0  0  1) (1  0  0  0)) (1  0  0  1) (-1 0  0  1) (0  0  0  1) (0  0  0  1))
                
                ( ((0  0  1  0) (0  0  0  1)) (0  0  1  1) (0  0  1 -1) (0  1  0  0) (0 -1  0  0))
                ( ((0  0  1  0) (0  0  1  0)) (0  0  2  0) (0  0  0  0) (-1 0  0  0) (1  0  0  0))
                ( ((0  0  1  0) (0  1  0  0)) (0  1  1  0) (0  -1 1  0) (0  0  0 -1) (0  0  0  1))
                ( ((0  0  1  0) (1  0  0  0)) (1  0  1  0) (-1 0  1  0) (0  0  1  0) (0  0  1  0))
                
                ( ((0  1  0  0) (0  0  0  1)) (0  1  0  1) (0  1  0 -1) (0  0 -1  0) (0  0  1  0))
                ( ((0  1  0  0) (0  0  1  0)) (0  1  1  0) (0  1 -1  0) (0  0  0  1) (0  0  0 -1))
                ( ((0  1  0  0) (0  1  0  0)) (0  2  0  0) (0  0  0  0) (-1 0  0  0) (1  0  0  0))
                ( ((0  1  0  0) (1  0  0  0)) (1  1  0  0) (-1 1  0  0) (0  1  0  0) (0  1  0  0))
                
                ( ((1  0  0  0) (0  0  0  1)) (1  0  0  1) (1  0  0 -1) (0  0  0  1) (0  0  0 -1))
                ( ((1  0  0  0) (0  0  1  0)) (1  0  1  0) (1  0 -1  0) (0  0  1  0) (0  0 -1  0))
                ( ((1  0  0  0) (0  1  0  0)) (1  1  0  0) (1 -1  0  0) (0  1  0  0) (0 -1  0  0))
                ( ((1  0  0  0) (1  0  0  0)) (2  0  0  0) (0  0  0  0) (1  0  0  0) (1  0  0  0))
                
                ( ((1  2  3  4) (1  2  3  4)) (2  4  6  8) (0  0  0  0) (-28 4  6  8) (1  0  0  0))
                ( ((1  2  3  40) (1  2  3  4)) (2  4  6  44) (0  0  0  36) (-172 -104  78  44) (5.8  3.6  -2.4  1.2))
                
                ))

(define test_singles
                  ;    q1           qlog                 qsin         qcos
             '(
               ( ((0  0  0  1)) (0  0  0  1.5708) (0  0  0  1.1752) (1.5431  0  0  0))
               ( ((0  0  1  0)) (0  0  1.5708  0) (0  0  1.1752  0) (1.5431  0  0  0))
               ( ((0  1  0  0)) (0  1.5708  0  0) (0  1.1752  0  0) (1.5431  0  0  0))
               ( ((1  0  0  0)) (0  0  0  0) (0.84147  0  0  0) (0.5403  0  0  0))))



(define (test_qmag)
  (check-= (qmag '(1 1 1 1)) 2 1.0 "#1")
  (check-= (qmag '(1 1 1 2)) 2.6458 1.0 "#2")
  (check-= (qmag '(-1 -3 4 5)) 7.1414 1.0 "#3")
  (check-= (qmag '(2 2 2 2)) 4 "#4")
  (check-equal? (qmag '(1 1 1 1)) 2 "#5")
  (display "test qmag complete"))


(define (test_qsin)
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773) "#1")
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773) "#1")
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773) "#1")
  
  (display "test qsin complete"))



(define (qtest_helper result answer)
  (check-= (list-ref result 0) (list-ref answer 0) 1.0 "component is off by at least 1.0")
  (check-= (list-ref result 1) (list-ref answer 1) 1.0 "component is off by at least 1.0")
  (check-= (list-ref result 2) (list-ref answer 2) 1.0 "component is off by at least 1.0")
  (check-= (list-ref result 3) (list-ref answer 3) 1.0 "component is off by at least 1.0"))

