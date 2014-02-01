#lang racket
(provide qCalc)
(require "QuaternionCalc.rkt")

(define (qCalc op elements)
  (case (op)
    [("add") (q+ elements)]
    [("subtract") (q- elements)]
    [("multiply") (q* elements)]
    [("divide") (q/ elements)]
    [("sin") (qsin elements)]
    [("cos") (qcos elements)]
    [("magnitude") (qmag elements)]
    [("log") (qlog elements)]
    [("exponent") (qexp elements)]
    [("e") (qexpt elements)]
    [("equals") (q= elements)]
    [else "Error"]))