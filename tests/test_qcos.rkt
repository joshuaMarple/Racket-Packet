#lang racket
(require "../src/trig.rkt")
(require "qtest_helper.rkt")

(provide test_qcos)
(define (test_qcos)
  (qtest_helper (qcos '(1 2 3 4)) '(58.934 -34.086 -51.129 -68.172))
  
  (displayln "test qcos complete"))