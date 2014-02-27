#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_qexpt)
(define (test_qexpt)
  (qtest_helper (qexpt '((1 1 1 1) (2 0 0 0))) '(-2 2 2 2))
  (qtest_helper (qexpt '((-4 1 -2 3) (4 0 0 0))) '(-892 -32 64 -96))
  (qtest_helper (qexpt '((-1 -2 -1 -5) (2 0 0 0))) '(-29 -4 -2 -10))
  (qtest_helper (qexpt '((-1 -2 -1 -5) (-1 0 0 0))) '(-0.1778 -0.88279 -0.44139 -2.207))
  (qtest_helper (qexpt '((-4 1 -2 3) (-1 0 0 0))) '(-0.1333 -0.033333 0.066667 -.1))
  
  ;(qtest_helper (qexpt '(() ())) '())
  
  (displayln "test qexpt complete"))