#lang web-server/insta


          
(define (start request)
  (response/xexpr
   '(html
     (head (title "Quaternion Calcluator"))
     (body ((style "background-color: BLACK; font-family: frosty; font-size: 12pt; font-color: WHITE"))
            (center (h1 "Quaternion Calculator"))(hr)
            (form 
                  (nbsp "Enter: ")
                  (input ((name "constant")(size "2")))
                  (nbsp " + ")
                  (input ((name "i")(size "2")))
                  (nbsp " + ")
                  (input ((name "j")(size "2")))
                  (nbsp " + ")
                  (input ((name "k")(size "2"))))))))
                  

