#lang racket
(provide executor)
(provide adder)
(require "arithmetic.rkt")
(require "trig.rkt")
(require racket/string)

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

(define (executor text)
  (eval (read (open-input-string (parser text)))))

;for loop with switch statement to do the string-replace
(define (parser text) 
  (string-replace
   (string-replace
    (string-replace
     (string-replace
      (string-replace
       (string-replace
        (string-replace
         (string-replace 
          (string-replace
           (string-replace
            (string-replace text "+" "adder")
            "-" "minuser")
           "*" "multiplier")
          "/" "divider") 
         "=" "equaler")
        "sin" "sinner")
       "cos" "coser")
      "log" "logger")
     "^" "exper")
    "e" "eer")
   "mag" "magger"))
   

(define (adder a b) 
  (if (complex? a)
      (if (complex? b)
          (+ a b)
          (if (quaternion? b)
              (add (quaternion (real-part a) (imag-part a) 0 0) b)
              "error, b is invalid"))
      (if (complex? b)
          (if (quaternion? a)
              (add a (quaternion (real-part b) (imag-part b) 0 0))
              ("error, a is invalid"))
          (if (and (quaternion? a) (quaternion? b))
              (add a b)
              ("error, invalid input")))))

(define (minuser a b) 
  (if (complex? a)
      (if (complex? b)
          (- a b)
          (if (quaternion? b)
              (minus (quaternion (real-part a) (imag-part a) 0 0) b)
              "error, b is invalid"))
      (if (complex? b)
          (if (quaternion? a)
              (minus a (quaternion (real-part b) (imag-part b) 0 0))
              ("error, a is invalid"))
          (if (and (quaternion? a) (quaternion? b))
              (minus a b)
              ("error, invalid input")))))

(define (multiplier a b) 
  (if (complex? a)
      (if (complex? b)
          (* a b)
          (if (quaternion? b)
              (multiply (quaternion (real-part a) (imag-part a) 0 0) b)
              "error, b is invalid"))
      (if (complex? b)
          (if (quaternion? a)
              (multiply a (quaternion (real-part b) (imag-part b) 0 0))
              ("error, a is invalid"))
          (if (and (quaternion? a) (quaternion? b))
              (multiply a b)
              ("error, invalid input")))))

(define (divider a b) 
  (if (complex? a)
      (if (complex? b)
          (/ a b)
          (if (quaternion? b)
              (division (quaternion (real-part a) (imag-part a) 0 0) b)
              "error, b is invalid"))
      (if (complex? b)
          (if (quaternion? a)
              (division a (quaternion (real-part b) (imag-part b) 0 0))
              ("error, a is invalid"))
          (if (and (quaternion? a) (quaternion? b))
              (division a b)
              ("error, invalid input")))))

(define 

(define (magger a)
  (if (complex? a)
      (magnitude a)
      (if (quaternion? a)
          (mag a)
          ("error, invalid input"))))


(define-struct quaternion (a b c d)
  #:transparent)


(define-match-expander quaternion:
  (λ (stx)
    (syntax-case stx ()
      [(_ a b c d)
       #'(or (quaternion a b c d)
             (and a (app (λ(_) 0) b) (app (λ(_) 0) c) (app (λ(_) 0) d)))])))

(define (norm q)
  (match q
    [(quaternion: a b c d)
     (sqrt (+ (sqr a) (sqr b) (sqr c) (sqr d)))]))

(define (negate q)
  (match q
    [(quaternion: a b c d)
     (quaternion (- a) (- b) (- c) (- d))]))

(define (conjugate q)
  (match q
    [(quaternion: a b c d)
     (quaternion a (- b) (- c) (- d))]))

(define (add q1 q2 . q-rest)
  (let ((ans (match* (q1 q2)
               [((quaternion: a1 b1 c1 d1) (quaternion: a2 b2 c2 d2))
                (q+ (list (list a1 b1 c1 d1) (list a2 b2 c2 d2)))])))
    (if (empty? q-rest)
        ans
        (apply add (cons ans q-rest)))))

(define (minus q1 q2 . q-rest)
  (let ((ans (match* (q1 q2)
               [((quaternion: a1 b1 c1 d1) (quaternion: a2 b2 c2 d2))
                (q- (list (list a1 b1 c1 d1) (list a2 b2 c2 d2)))])))
    (if (empty? q-rest)
        ans
        (apply minus (cons ans q-rest)))))

(define (multiply q1 q2 . q-rest)
  (let ((ans (match* (q1 q2)
               [((quaternion: a1 b1 c1 d1) (quaternion: a2 b2 c2 d2))
                (q* (list (list a1 b1 c1 d1) (list a2 b2 c2 d2)))])))
    (if (empty? q-rest)
        ans
        (apply multiply (cons ans q-rest)))))

(define (division q1 q2 . q-rest)
  (let ((ans (match* (q1 q2)
               [((quaternion: a1 b1 c1 d1) (quaternion: a2 b2 c2 d2))
                (q/ (list (list a1 b1 c1 d1) (list a2 b2 c2 d2)))])))
    (if (empty? q-rest)
        ans
        (apply division (cons ans q-rest)))))

(define (mag q)
  (qmag (list (quaternion-a q) (quaternion-b q) (quaternion-c q) (quaternion-d q))))

;(define (multiply q1 q2 . q-rest)
;  (let ((ans (match* (q1 q2)
;               [((quaternion: a1 b1 c1 d1) (quaternion: a2 b2 c2 d2))
;                (quaternion (- (* a1 a2) (* b1 b2) (* c1 c2) (* d1 d2))
;                            (+ (* a1 b2) (* b1 a2) (* c1 d2) (- (* d1 c2)))
;                            (+ (* a1 c2) (- (* b1 d2)) (* c1 a2) (* d1 b2))
;                            (+ (* a1 d2) (* b1 c2) (- (* c1 b2)) (* d1 a2)))])))
;    (if (empty? q-rest)
;        ans
;        (apply multiply (cons ans q-rest)))))

;; Tests
(module+ main
  (define i (quaternion 0 1 0 0))
  (define j (quaternion 0 0 1 0))
  (define k (quaternion 0 0 0 1))
  ;(displayln (multiply i j k))
  (newline)

  (define q (quaternion 1 2 3 4))
  (define q1 (quaternion 2 3 4 5))
  (define q2 (quaternion 3 4 5 6))
  (define r 7)

  (for ([quat (list q q1 q2)])
    (displayln quat)
    (displayln (norm quat))
    (displayln (negate quat))
    (displayln (conjugate quat))
    (newline))

  (add r q)
  (add q1 q2)
  (multiply r q)

  (newline)
  (multiply q1 q2)
  (multiply q2 q1)
  (equal? (multiply q1 q2)
          (multiply q2 q1)))

