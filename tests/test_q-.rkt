#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(define (test_q-)
  (qtest_helper (q- '((0 0 0 1) (0 0 0 1))) '(0 0 0 0))
  (qtest_helper (q- '((0 0 0 1) (0 0 1 0))) '(0 0 -1 1))
  (qtest_helper (q- '((0 0 0 1) (0 1 0 0))) '(0 -1 0 1))
  (qtest_helper (q- '((0 0 0 1) (1 0 0 0))) '(-1 0 0 1))
  
  (qtest_helper (q- '((0 0 1 0) (0 0 0 1))) '(0 0 1 -1))
  (qtest_helper (q- '((0 0 1 0) (0 0 1 0))) '(0 0 0 0))
  (qtest_helper (q- '((0 0 1 0) (0 1 0 0))) '(0 -1 1 0))
  (qtest_helper (q- '((0 0 1 0) (1 0 0 0))) '(-1 0 1 0))
  
  (qtest_helper (q- '((0 1 0 0) (0 0 0 1))) '(0 1 0 -1))
  (qtest_helper (q- '((0 1 0 0) (0 0 1 0))) '(0 1 -1 0))
  (qtest_helper (q- '((0 1 0 0) (0 1 0 0))) '(0 0 0 0))
  (qtest_helper (q- '((0 1 0 0) (1 0 0 0))) '(-1 1 0 0))
  
  (qtest_helper (q- '((1 0 0 0) (0 0 0 1))) '(1 0 0 -1))
  (qtest_helper (q- '((1 0 0 0) (0 0 1 0))) '(1 0 -1 0))
  (qtest_helper (q- '((1 0 0 0) (0 1 0 0))) '(1 -1 0 0))
  (qtest_helper (q- '((1 0 0 0) (1 0 0 0))) '(0 0 0 0))
  
  (displayln "test q- complete"))