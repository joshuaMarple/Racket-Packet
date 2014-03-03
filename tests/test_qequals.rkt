#lang racket
(require "../src/arithmetic.rkt")
(require "qtest_helper.rkt")
(require rackunit)

(provide test_qequals)
(define (test_qequals)
  (check-eq? (q= '((1 1 1 1) (1 1 1 1))) #t)
  (check-eq? (q= '((1 1 1 1) (1 1 1 2))) #f)
  (check-eq? (q= '((0 1 3 0) (0 1 3 0))) #t)
  (check-eq? (q= '((0 1 3 0) (0 1 3 2))) #f)
  (check-eq? (q= '((0 1 3/2 0) (0 1 1.5 0))) #t)
  
  (displayln "test q= complete"))