#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")
(require rackunit)

(provide test_qequals)
(define (test_qequals)
  (check-eq? (q= '((1 1 1 1) (1 1 1 1))) #t)
  (check-eq? (q= '((1 1 1 1) (1 1 1 2))) #f)
  
  (displayln "test q= complete"))