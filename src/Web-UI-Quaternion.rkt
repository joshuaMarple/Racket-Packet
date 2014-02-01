#lang web-server/insta


          
(define (start request)
  (response/xexpr
   '(html
     (head (title "Quaternion Calcluator"))
     (body ((style "background-color: #070719;
 background-image: url(http://www.subblue.com/assets/0000/4446/Quaternion-Julia-7_large.jpg); background-repeat: no-repeat; background-position: center;
 font-family: frosty; font-size: 12pt; font-color: #FFFFFF"))
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
                  

