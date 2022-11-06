;;;;
;;;; Build.lisp - build the application
;;;;
;;; Assumption: ASDF and quicklisp are already loaded

;;; Make sure all the dependencies are downloaded
(ql:quickload "com.kjcjohnson.ks2.runner")

;;; Then compile everything and dump an image
(asdf:oos 'asdf:program-op "com.kjcjohnson.ks2.runner")


