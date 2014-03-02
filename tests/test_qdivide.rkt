#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_q/)
(define (test_q/)
  (qtest_helper (q/ '(0 0 0 1) '(0 0 0 1)) '(1 0 0 0))
  (qtest_helper (q/ '(0 0 0 1) '(0 0 1 0)) '(0 1 0 0))
  (qtest_helper (q/ '(0 0 0 1) '(0 1 0 0)) '(0 0 -1 0))
  (qtest_helper (q/ '(0 0 0 1) '(1 0 0 0)) '(0 0 0 1))
  
  (qtest_helper (q/ '(0 0 1 0) '(0 0 0 1)) '(0 -1 0 0))
  (qtest_helper (q/ '(0 0 1 0) '(0 0 1 0)) '(1 0 0 0))
  (qtest_helper (q/ '(0 0 1 0) '(0 1 0 0)) '(0 0 0 1))
  (qtest_helper (q/ '(0 0 1 0) '(1 0 0 0)) '(0 0 1 0))
  
  (qtest_helper (q/ '(0 1 0 0) '(0 0 0 1)) '(0 0 1 0))
  (qtest_helper (q/ '(0 1 0 0) '(0 0 1 0)) '(0 0 0 -1))
  (qtest_helper (q/ '(0 1 0 0) '(0 1 0 0)) '(1 0 0 0))
  (qtest_helper (q/ '(0 1 0 0) '(1 0 0 0)) '(0 1 0 0))
  
  (qtest_helper (q/ '(1 0 0 0) '(0 0 0 1)) '(0 0 0 -1))
  (qtest_helper (q/ '(1 0 0 0) '(0 0 1 0)) '(0 0 -1 0))
  (qtest_helper (q/ '(1 0 0 0) '(0 1 0 0)) '(0 -1 0 0))
  (qtest_helper (q/ '(1 0 0 0) '(1 0 0 0)) '(1 0 0 0))
  
  (qtest_helper (q/ '(8 10 5 3) '(12 2 1 8)) '(0.68075 0.31455 0.59155 -0.13146))
  (qtest_helper (q/ '(-12 -3 -2 -1) '(-2 -2 -5 -6)) '(0.66667 -0.36232 -0.57971 -1.1739))
  (qtest_helper (q/ '(8 10 5 3) '(-2 -2 -5 -6)) '(-1.1449 0.15942 -0.34783 1.1884))
  (qtest_helper (q/ '(-12 -3 -2 -1) '(12 2 1 8)) '(-0.751170 .014085 -0.15962 0.38967))
  (qtest_helper (q/ '(0 0 0 0) '(0 0 0 1)) '(0 0 0 0))
  (qtest_helper (q/ '(0 0 0 0) '(0 0 1 0)) '(0 0 0 0))
  (qtest_helper (q/ '(0 0 0 0) '(0 1 0 0)) '(0 0 0 0))
  (qtest_helper (q/ '(0 0 0 0) '(1 0 0 0)) '(0 0 0 0))
  (qtest_helper (q/ '(1 1 1 1) '(-1 -1 -1 -1)) '(-1 0 0 0))
  
  ;(qtest_helper (q/ '() '()) '())
  
  (displayln "test q/ complete"))