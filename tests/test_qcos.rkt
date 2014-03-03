#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qcos)
(define (test_qcos)
  (qtest_helper (qcos '(1 2 3 4)) '(58.934 -34.086 -51.129 -68.172))
  (qtest_helper (qcos '(0 0 0 1)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(0 0 1 0)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(0 1 0 0)) '(1.5431 0 0 0))
  (qtest_helper (qcos '(1 0 0 0)) '(0.5403 0 0 0))
  (qtest_helper (qcos '(4 3 1 1)) '(-9.0214 9.4232 3.1411 3.1411))
  (qtest_helper (qcos '(-4 -3 -1 -1)) '(-9.0214 9.4232 3.1411 3.1411))
  (qtest_helper (qcos '(4 -3 -1 1)) '(-9.0214 -9.4232 -3.1411 3.1411))
  (qtest_helper (qcos '(-2 1 4 -6)) '(-301.95 90.625 362.5 -543.75))
  
  ;(qtest_helper (qcos '()) '())
  
  (displayln "test qcos complete"))