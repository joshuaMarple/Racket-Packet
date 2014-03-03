#lang racket

(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_q*)
(define (test_q*)
  (qtest_helper (q* '(0 0 0 1) '(0 0 0 1)) '(-1 0 0 0))
  (qtest_helper (q* '(0 0 0 1) '(0 0 1 0)) '(0 -1 0 0))
  (qtest_helper (q* '(0 0 0 1) '(0 1 0 0)) '(0 0 1 0))
  (qtest_helper (q* '(0 0 0 1) '(1 0 0 0)) '(0 0 0 1))
  
  (qtest_helper (q* '(0 0 1 0) '(0 0 0 1)) '(0 1 0 0))
  (qtest_helper (q* '(0 0 1 0) '(0 0 1 0)) '(-1 0 0 0))
  (qtest_helper (q* '(0 0 1 0) '(0 1 0 0)) '(0 0 0 -1))
  (qtest_helper (q* '(0 0 1 0) '(1 0 0 0)) '(0 0 1 0))
  
  (qtest_helper (q* '(0 1 0 0) '(0 0 0 1)) '(0 0 -1 0))
  (qtest_helper (q* '(0 1 0 0) '(0 0 1 0)) '(0 0 0 1))
  (qtest_helper (q* '(0 1 0 0) '(0 1 0 0)) '(-1 0 0 0))
  (qtest_helper (q* '(0 1 0 0) '(1 0 0 0)) '(0 1 0 0))
  
  (qtest_helper (q* '(1 0 0 0) '(0 0 0 1)) '(0 0 0 1))
  (qtest_helper (q* '(1 0 0 0) '(0 0 1 0)) '(0 0 1 0))
  (qtest_helper (q* '(1 0 0 0) '(0 1 0 0)) '(0 1 0 0))
  (qtest_helper (q* '(1 0 0 0) '(1 0 0 0)) '(1 0 0 0))
  
  (qtest_helper (q* '(1 2 3 4) '(1 2 3 4)) '(-28 4 6 8))
  (qtest_helper (q* '(-1 -2 -5 -4) '(-3 -1 -3 -2)) '(-22 5 18 15))
  (qtest_helper (q* '(1 -2 3 -4) '(4 -2 3 -1)) '(-13 -1 21 -17))
  (qtest_helper (q* '(0 1 2 3) '(0 4 1 3)) '(-15 3 9 -7))
  
  ;(qtest_helper (q* '() '()) '())
  
  
  (displayln "test q* complete"))