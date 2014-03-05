;Quartenion Calc
;Last Edited by Fernando , 01/31/1




#lang racket

(provide q=)
(provide q+)
(provide q-)
(provide q*)
(provide q/)
(provide qmag)
(provide qexpt)

(provide real)
(provide gi)
(provide gj)
(provide gk)

(define (real l) (car l))
(define (gi l) (cadr l)) ;get i
(define (gj l) (caddr l));get j
(define (gk l) (cadddr l)); get k


;Mag gives you the Magnetude of a quartenion
(define (qmag qlist)
  (sqrt
   (apply +(for/list ([d1 qlist])
             (expt d1 2)
           )
   ) )
)


;Add sums two quaternions
(define (q+ q1 q2)
  (for/list ([d1 q1]
             [d2 q2])
  (+ d1 d2)
  )
)

;Sub subtracts the first quartenion by the second
(define (q- q1 q2)
 (q+ q1 (map - q2))
)

;Mult multiply one quartenion by another
(define (q* q1 q2)
  (list   
    (- (- (- (* (real q1) (real q2)) (* (gi q1) (gi q2))) (* (gj q1)(gj q2))) (*(gk q1) (gk q2)))
           
    (- (+ (+ (* (real q1) (gi q2)) (* (gi q1) (real q2))) (* (gj q1)(gk q2))) (*(gk q1) (gj q2)))
           
    (+ (+ (- (* (real q1) (gj q2)) (* (gi q1) (gk q2))) (* (gj q1)(real q2))) (*(gk q1) (gi q2)))
           
    (+ (- (+ (* (real q1) (gk q2)) (* (gi q1) (gj q2))) (* (gj q1)(gi q2))) (*(gk q1) (real q2)))
   )
)

;Div divide one quartenion by another
(define (q/ q1 q2)
  (if (= 0 (qmag  q2)) q1
      (if (= 0 (qmag  (rest q2)))(map (lambda (x) (/ x (real q2))) q1)
          (q* q1 (map (lambda (x) (/ x (* (qmag q2) (qmag q2)))) (append (list(real q2)) (map - (rest q2)))))))
)

;qexpt make a quartenion power n
;(define (qexpt q times)
;  (if (= times 0) '(1 0 0 0)
;      (if (positive? times) (q* q (qexpt q (- times 1)))
;          (q/ (qexpt q (+ times 1)) q)
;      )
;  )
;)

(define (qexpt q times)
  (define v (list (gi q) (gj q) (gk q)))
  (define magv (qmag (list 0 (gi q) (gj q) (gk q))))
  (define n (map (lambda (x) (/ x magv)) v ))
  (define theta (acos (/ (real q) (qmag q))))
  (define multfactor (expt (qmag q) times))
  (define realnumber (cos (* theta times)))
  (define restnumbers (map (lambda (x) (* x (sin (* theta times)))) n))
  (map (lambda (x)  (* x multfactor)) (cons realnumber restnumbers))
  )


;recursively compare n quarternions
(define (q= allq)
  (if (equal? (cdr allq) '())
      #t
      (if (q= (cdr allq))
          (andmap equal? (map inexact->exact (car allq)) (map inexact->exact (cadr allq)))
          #f
       )
  )
)

