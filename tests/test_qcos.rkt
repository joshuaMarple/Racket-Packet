#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qcos)
(define (test_qcos)
  (qtest_helper (qcos '(1 2 3 4)) '(23.653 -16.47 0 -32.94))
  (qtest_helper (qcos '(0 0 0 1)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(0 0 1 0)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(0 1 0 0)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(1 0 0 0)) '(0.5403 0 0 0))
  
  (displayln "test qcos complete"))