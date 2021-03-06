#lang racket
(provide qtest_helper)
(require rackunit)

(define (qtest_helper result answer)
  (check-= (list-ref result 0) (list-ref answer 0) 0.1 "real component is off by at least 0.1")
  (check-= (list-ref result 1) (list-ref answer 1) 0.1 "'i' component is off by at least 0.1")
  (check-= (list-ref result 2) (list-ref answer 2) 0.1 "'j' component is off by at least 0.1")
  (check-= (list-ref result 3) (list-ref answer 3) 0.1 "'k' component is off by at least 0.1"))