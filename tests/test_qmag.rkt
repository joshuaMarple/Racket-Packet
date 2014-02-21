#lang racket
(require "../src/arithmetic.rkt")
(require rackunit)

(provide test_qmag)
(define (test_qmag)
  (check-= (qmag '(1 1 1 1)) 2 0.01 "#1")
  (check-= (qmag '(1 1 1 2)) 2.6458 0.01 "#2")
  (check-= (qmag '(-1 -3 4 5)) 7.1414 0.01 "#3")
  (check-= (qmag '(2 2 2 2)) 4 0.01 "#4")
  (check-= (qmag '(1 1 1 1)) 2 0.01 "#5")
  (displayln "test qmag complete"))