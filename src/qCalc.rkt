#lang racket
(provide qCalc)
(require "arithmetic.rkt")
(require "trig.rkt")

(define (qCalc op elements)
  (case op
    [(add) (q+ elements)]
    [(subtract) (q- elements)]
    [(multiply) (q* elements)]
    [(divide) (q/ elements)]
    [(sin) (qsin elements)]
    [(cos) (qcos elements)]
    [(magnitude) (qmag elements)]
    [(log) (qlog elements)]
    [(exponent) (qexpt elements)]
    [(e) (qexp elements)]
    [(equals) (q= elements)]
    [else "Error"]))