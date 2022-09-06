(defpackage lispmakr
  (:use :cl :markr :clog))

(in-package :lispmakr)

(defcom :main ()
  `(:div (:style "margin: 50px; border: 5px solid #4CAF50")
         (:input (:type "text"))
         (:h1 () "API Testing")
         (:h2 () "This is so fucking amazing!!!")
         (:h3 () "Is this thing working?")
         ,(:textbox)))

(defun on-new-window (body)
  (render (:main) body))

(defun run-app ()
  (initialize 'on-new-window :host "10.2.57.103")
  (open-browser))
