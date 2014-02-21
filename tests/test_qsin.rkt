#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qsin)
(define (test_qsin)
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773))
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773))
  (qtest_helper (qsin '(1 2 3 4)) '(91.784 21.886 32.83 43.773))
  
  (displayln "test qsin complete"))