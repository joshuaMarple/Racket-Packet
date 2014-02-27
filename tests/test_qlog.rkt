#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qlog)
(define (test_qlog)
  (qtest_helper (qlog '(1 2 3 4)) '(1.7006 0.51519 0.77279 1.0304))
  
  (displayln "test qlog complete"))