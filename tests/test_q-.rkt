#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_q-)
(define (test_q-)
  (qtest_helper (q- '(0 0 0 1) '(0 0 0 1)) '(0 0 0 0))
  (qtest_helper (q- '(0 0 0 1) '(0 0 1 0)) '(0 0 -1 1))
  (qtest_helper (q- '(0 0 0 1) '(0 1 0 0)) '(0 -1 0 1))
  (qtest_helper (q- '(0 0 0 1) '(1 0 0 0)) '(-1 0 0 1))
  
  (qtest_helper (q- '(0 0 1 0) '(0 0 0 1)) '(0 0 1 -1))
  (qtest_helper (q- '(0 0 1 0) '(0 0 1 0)) '(0 0 0 0))
  (qtest_helper (q- '(0 0 1 0) '(0 1 0 0)) '(0 -1 1 0))
  (qtest_helper (q- '(0 0 1 0) '(1 0 0 0)) '(-1 0 1 0))
  
  (qtest_helper (q- '(0 1 0 0) '(0 0 0 1)) '(0 1 0 -1))
  (qtest_helper (q- '(0 1 0 0) '(0 0 1 0)) '(0 1 -1 0))
  (qtest_helper (q- '(0 1 0 0) '(0 1 0 0)) '(0 0 0 0))
  (qtest_helper (q- '(0 1 0 0) '(1 0 0 0)) '(-1 1 0 0))
  
  (qtest_helper (q- '(1 0 0 0) '(0 0 0 1)) '(1 0 0 -1))
  (qtest_helper (q- '(1 0 0 0) '(0 0 1 0)) '(1 0 -1 0))
  (qtest_helper (q- '(1 0 0 0) '(0 1 0 0)) '(1 -1 0 0))
  (qtest_helper (q- '(1 0 0 0) '(1 0 0 0)) '(0 0 0 0))
  
  (qtest_helper (q- '(4 2 3 1) '(8 3 1 1)) '(-4 -1 2 0))
  (qtest_helper (q- '(-2 -1 -3 -4) '(-2 -3 -1 -4)) '(0 2 -2 0))
  
  ;(qtest_helper (q- '() '()) '())
  
  (displayln "test q- complete"))