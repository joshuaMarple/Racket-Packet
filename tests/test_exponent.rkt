#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")

(provide test_qexpt)
(define (test_qexpt)
  (qtest_helper (qexpt '(((1 1 1 1) (2 0 0 0)) (-2 2 2 2))))
  
  (displayln "test qexpt complete"))