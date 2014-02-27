#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qlog)
(define (test_qlog)
  (qtest_helper (qlog '(1 2 3 4)) '(1.7006 0.51519 0.77279 1.0304))
  (qtest_helper (qlog '(-3 1 1 12)) '(2.5217 0.15014 0.15014 1.8017))
  (qtest_helper (qlog '(0 0 0 1)) '(0 0 0 1.5708))
  (qtest_helper (qlog '(0 0 1 0)) '(0 0 1.5708 0))
  (qtest_helper (qlog '(0 1 0 0)) '(0 1.5708 0 0))
  (qtest_helper (qlog '(1 0 0 0)) '(0 0 0 0))
  (qtest_helper (qlog '(0 1 2 3)) '(1.3195 0.41981 0.83963 1.2594))
  ;(qtest_helper (qlog '()) '())

  
  (displayln "test qlog complete"))