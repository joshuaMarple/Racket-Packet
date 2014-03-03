#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_e)
(define (test_e)
  (qtest_helper (qexp '(1 1 1 1)) '(-0.43644 1.549 1.549 1.549))
  (qtest_helper (qexp '(0 0 0 1)) '(0.5403 0 0 0.84147))
  (qtest_helper (qexp '(0 0 1 0)) '(0.5403 0 0.84147 0))
  (qtest_helper (qexp '(0 1 0 0)) '(0.5403 0.84147 0 0))
  (qtest_helper (qexp '(1 0 0 0)) '(2.7183 0 0 0))
  (qtest_helper (qexp '(8 -2 3 -1)) '(-2460.2 899.78 -1349.7 449.89))
  (qtest_helper (qexp '(3 3 -1 -2)) '(-16.577 -9.094 3.0313 6.0627))
  (qtest_helper (qexp '(-1 -2 -3 -4)) '(0.22925 0.10686 0.16028 0.21371))
  
  ;(qtest_helper (qexp '()) '())
  
  (displayln "test e^ complete"))