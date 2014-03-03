#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qsin)
(define (test_qsin)
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773))
  (qtest_helper (qsin '(0 0 0 1)) '(0 0 0 1.1752))
  (qtest_helper (qsin '(0 0 1 0)) '(0 0 1.1752 0))
  (qtest_helper (qsin '(0 1 0 0)) '(0 1.1752 0 0))
  (qtest_helper (qsin '(1 0 0 0)) '(0.84147 0 0 0))
  (qtest_helper (qsin '(0 1 2 3)) '(0 5.6317 11.263 16.895))
  (qtest_helper (qsin '(0 -1 -2 -3)) '(0 -5.6317 -11.263 -16.895))
  (qtest_helper (qsin '(-10 -3 -4 -1)) '(44.574 40.445 53.926 13.482))
  (qtest_helper (qsin '(-1 -2 -3 -4)) '(-91.784 -21.886 -32.83 -43.773))
  (qtest_helper (qsin '(1 -2 -8 1)) '(1704.2 -263.47 -1053.9 131.74))
  
  ;(qtest_helper (qsin '()) '())
  
  (displayln "test qsin complete"))