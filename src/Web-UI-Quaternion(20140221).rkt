#lang web-server/insta
(static-files-path (current-directory))
(require mzlib/string)
(define-namespace-anchor a)
(define ns (namespace-anchor->namespace a))
(define dx .0001)

(struct blog (posts) #:mutable)
(struct post (value))
 

(define BLOG
  (blog '()))
   ;(list (post "Have fun with quaternions!" ))))
 
(define (blog-insert-post! a-blog a-post)
  (set-blog-posts! a-blog
                   (cons a-post (blog-posts a-blog))))

(define (start request)
  (render-blog-page request))

(define (parse-post1 bindings)
  (post 5));(FUNCTIONFORPARSING
 ;                   (read-from-string(extract-binding/single 'variable bindings)))))
                   
             
 

(define (render-blog-page request)
  (local [(define (response-generator embed/url)
            (response/xexpr
            `(html(head(title "Quaternion Calculator"))
                  (h1 (center "Quaternion Calculator"))(hr)
                  (center
                   (body ((style "background-color: #08088A; font-family: frosty; font-size: 12pt; color: WHITE; width: 100%; height: 90%"))
                     (form ((action ,(embed/url insert-post-handler)))
                           (input ((type "text")(name "quaternion")))
                           (input ((type "submit"))))
                     ,(render-posts))
                   (br)(br)(br)(br)(br)(br)(br))
                  (footer(left(img((src "http://upload.wikimedia.org/wikipedia/en/4/4c/University_of_Kansas_Jayhawk_logo.svg")(width "10%")(height "10%")))
                              (p "Created by: Racket-Packet")
                              (p "Copyrght 2014")))
                  )))
          (define (insert-post-handler request)
            (blog-insert-post!
             BLOG (parse-post1 (request-bindings request)))
            (render-blog-page request))]
 
    (send/suspend/dispatch response-generator)))
 
(define (render-post a-post)
  `(div ((class "post"))
        (p ,(expr->string (post-value a-post)))))
       
(define (render-posts)
  `(div ((class "posts"))
        ,@(map render-post (blog-posts BLOG))))

