(defpackage lispmakr
  (:use :cl :markr :clog :cells)
  (:shadow :value))

(in-package :lispmakr)

(defmodel buffer ()
  ((lines :accessor lines :initform (c-in ":"))))

(defparameter contents (make-instance 'buffer))

(defun reset ()
  (setf (lines contents) ":"))

(defmodel main ()
  ((body :initarg :body :accessor body :initform (c-in nil))
   (key-handler :initform (c? (and (body self) (set-on-key-down (body self)
                                                                'key-dispatcher
                                                                :disable-default t))))))



(defparameter *body* (make-instance 'main))

(defun key-dispatcher (obj data)
  (format t "~%Key Pressed: ~A~%" data)
  (setf (lines contents) (format nil "~A~A" (lines contents) (getf data :key))))

(defcom :textbox ()
  `(:div (:style "margin: 10px; border: 5px solid red")
         (:h1 () "This is the textbox")
         ,(lines contents)))

(defcom :top ()
  `(:div (:style "margin: 50px; border: 5px solid #4CAF50")
         ,(:textbox)
         (:h2 () "This is so fucking amazing!!")))

(defun on-new-window (body)
  (setf (body *body*) body)
  (render (:top) body))

(defun run-app ()
  (initialize 'on-new-window)
  (open-browser))
