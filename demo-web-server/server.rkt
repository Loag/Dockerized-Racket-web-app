#lang racket/base

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; this example heavily influenced by
; https://sagegerard.com/racket-webserver-notes.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; required dependencies
(require web-server/servlet-dispatch
  web-server/http
  (prefix-in pathprocedure: web-server/dispatchers/dispatch-pathprocedure))

; export run-demo-server procedure
(provide run-demo-server)

; the request handler
(define (display-page req)
  (response
  200 #"OK"
  (current-seconds)
  TEXT/HTML-MIME-TYPE
  '()
  (λ (op)
    (write-bytes #"<html><body><h1>Hello World!</h1></body></html>" ; obligatory hello world
                  op)))) 

; the server
(define run-demo-server 
(serve/launch/wait
  #:listen-ip "0.0.0.0" ; specify ip
  #:port 8081 ; specify port
  (λ (quit)
  (pathprocedure:make "/" ; serve on the base path.
    display-page)))
)
