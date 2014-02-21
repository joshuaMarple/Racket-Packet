#lang racket
(require "test_q+.rkt")

(require "test_qmag.rkt")
(require "test_qsin.rkt")

(define (test_ultimate)
    (test_q+)
    (test_q-)
    (test_q*)
    (test_q/)
    (test_qmag)
    (test_qsin)
    (test_qcos)
    (test_qlog)
    
    (display "ultimate test complete"))