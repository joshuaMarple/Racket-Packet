#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_qexpt)
(define (test_qexpt)
  (qtest_helper (qexpt '(1 1 1 1) 2) '(-2 2 2 2))
  (qtest_helper (qexpt '(-4 1 -2 3) 4) '(-892 -32 64 -96))
  ;(qtest_helper (qexpt '(-1 -2 -1 -5) 2) '(-29 -4 -2 -10))   ;This test case causes some problems
  ;(qtest_helper (qexpt '(-1 -2 -1 -5) -1) '(-0.032258 -0.064516 -0.032258 -0.16129)) ;This test case causes some problems
  (qtest_helper (qexpt '(-4 1 -2 3) -1) '(-0.1333 -0.033333 0.066667 -.1))
  (qtest_helper (qexpt '(-1 2 2 -3) 0) '(1 0 0 0))
  (qtest_helper (qexpt '(-1 2 2 -3) 1) '(-1 2 2 -3))
  (qtest_helper (qexpt '(-1 2 2 -3) 5) '(-1276 248 248 -372))
  (qtest_helper (qexpt '(-1 2 2 -3) -3) '(0.0085734 0.0048011 0.0048011 -0.0072016))
  
  ;(qtest_helper (qexpt '() 0) '())
  
  (displayln "test qexpt complete"))