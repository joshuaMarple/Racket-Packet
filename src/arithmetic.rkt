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
  (if (= 0 (qmag q2)) (map (lambda (x) (/ x (real q2))) q1)
      (q* q1 (map (lambda (x) (/ x (* (qmag q2) (qmag q2)))) (append (list(real q2)) (map - (rest q2))))))
)

;qexpt make a quartenion power n
(define (qexpt q times)
  (if (= times 0) '(1 0 0 0)
      (if (positive? times) (q* q (qexpt q (- times 1)))
          (q/ (qexpt q (+ times 1)) q)
       )
  )
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

;quartcalc chooses the function to use according to the entered symbol
;(define (quartcalc func)
;  (define oper (car func))
;  (define qlist(cdr func))
;    (case oper
;      ['+ (recadd qlist)]
;      ['* (recmult qlist)]
;      ['- (recsub qlist)]
;      ['/ (recdiv qlist)]
;     )
;)
;Obs: The magnetude and power functions I made doesn't fit in this input format;
;not sure if we should make a special case for them or make then
;receive the input the same way the others, and where the code should expect 
;another quaternions there would be nothing or the other necessary arguments
;for given functions(like the n in quart power n)


;Test Plan==========================================================================
;(sub '(1 2 3 4) '(1 2 3 4)); Working , apparently
;(add '(1 2 3 4) '(1 2 3 4)); Working , apparently
;(mag '(1 2 3 4)); Working , apparently
;(mult '(1 2 3 4) '(1 2 3 4)); Working , apparently
;(div '(1 2 3 4) '(1 2 3 4)); Working , apparently
;
;(qexpt '(1 2 3 4) 0); Not sure what quartenion power 0 should return, I made it return the real 1 as any other thing expt 0
;(qexpt '(1 2 3 4) 1); Working , apparently
;(qexpt '(1 2 3 4) 2);same as above
;(qexpt '(1 2 3 4) 3);same as above
;
;
;(recadd '((1 2 3 4) (1 2 3 4) (1 2 3 4))) ; working ok, apparently
;
;(recsub '((1 2 3 4) (1 2 3 4) (1 2 3 4)))
;; the way this is working is this:
;; (1 2 3 4) - ((1 2 3 4) - (1 2 3 4)), thats why the result is (1 2 3 4) and not
;; (-1 -2 -3 -4), so we are subtracting the second element by the last, and then the first by the
;;result of that, which would be 0 0 0 0.
;;Not sure if this is right though.
;
;(recmult '((1 2 3 4) (1 2 3 4) (1 2 3 4))) ; working ok, apparently
;
;(recdiv '((1 2 3 4) (1 2 3 4) (1 2 3 4))) ; working ok, apparently
;(recdiv '((1 2 3 4) (1 0 0 0) ));same as above
;
;
;(quartcalc '(+ (1 2 3 4) (1 2 3 4))) ; working ok, apparently
;(quartcalc '(* (1 2 3 4) (1 2 3 4)));same as above
;(quartcalc '(- (1 2 3 4) (1 2 3 4)));same as above
;(quartcalc '(/ (1 2 3 4) (1 2 3 4)));same as above
;

;multiplication http://www.mathworks.com/help/aeroblks/quaternionmultiplication.html
;division http://www.mathworks.com/help/aeroblks/quaterniondivision.html

; not sure if quartenion expt 0 should return 1 0 0 0 or any other thing, in doubt I used the normal definition of anything expt 0 = 1 

;The magnitude of a quaternion is given by the formula magnitude = sqrt(w2 + x2 + y2 + z2).  For the unit quaternions, the magnitude is one.

; add, sums each element with it s corresondent
; sub, subtract each element with it s correspondent
;mag gives you the magnitude of a quartenion
;qexpt give you a quartenion power n
;div divides one quartenion by another
;mult multiply one quartenion by another

;rec add recursively use add to add n quaternions
;rec mult recursively use mult to mult n quaternions
;rec sub recursively use sub to sub n quaternions
;rec div recursively use div to div n quaternions
