#lang web-server/insta


          
(define (start request)
  (response/xexpr
   '(html
     (head (title "Quaternion Calcluator"))
     (body ((style "background-color: BLACK; font-family: frosty; font-size: 12pt; color: WHITE"))
            (center (h1 "Quaternion Calculator"))(hr)
            (form 
                  (nbsp "Enter: ")
                  (input ((name "constant1")(size "2")))
                  (nbsp " + ")
                  (input ((name "i1")(size "2")))
                  (nbsp "i + ")
                  (input ((name "j1")(size "2")))
                  (nbsp "j + ")
                  (input ((name "k1")(size "2")))
                  (nbsp "k")(br)
                  
                  (nbsp "Enter: ")
                  (input ((name "constant2")(size "2")))
                  (nbsp " + ")
                  (input ((name "i2")(size "2")))
                  (nbsp "i + ")
                  (input ((name "j2")(size "2")))
                  (nbsp "j + ")
                  (input ((name "k2")(size "2")))
                  (nbsp "k"))))))
                  

