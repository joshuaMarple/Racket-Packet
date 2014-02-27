#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_e)
(define (test_e)
  (qtest_helper (qexp '(1 1 1 1)) '(-0.43644 1.549 1.549 1.549))
  
  (displayln "test e^ complete"))