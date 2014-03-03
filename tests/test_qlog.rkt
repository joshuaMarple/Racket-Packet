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
  (qtest_helper (qlog '(10 -2 10 -5)) '(2.7169 -0.14948 0.7474 -0.3737))
  (qtest_helper (qlog '(-1 -2 -2 -4)) '(1.6094 -0.72348 -0.72348 -1.447))
  (qtest_helper (qlog '(5 3 4 1)) '(1.8688 0.53281 0.71041 0.1776))
  (qtest_helper (qlog '(1 4 3 0)) '(1.629 1.0987 0.82404 0))
  
  ;(qtest_helper (qlog '()) '())

  
  (displayln "test qlog complete"))