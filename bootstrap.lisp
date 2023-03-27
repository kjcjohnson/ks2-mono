;;;;
;;;; Bootstrap.lisp - bootstraps the repository configuration for building
;;;;
(require 'asdf)
(format *trace-output* "~&; Starting ks2 bootstrapping...~%")

;;; Point ASDF to only the systems in this repository
(format *trace-output* "~&; Bootstrapping ASDF...~%")
(asdf:clear-source-registry)
(asdf:initialize-source-registry
 `(:source-registry
   (:tree ,(uiop:getcwd))
   :ignore-inherited-configuration))

;;; Load quicklisp, initializing it if necessary
#-quicklisp
(format *trace-output* "~&; Bootstrapping Quicklisp...~%")
(if (uiop:file-exists-p #P"quicklisp/setup.lisp")
    (load "quicklisp/setup.lisp")
    (progn
      (load "quicklisp.lisp")
      (eval (read-from-string "(setf quicklisp-quickstart:*after-initial-setup-message* \"  ==== quicklisp installed ====\")"))
      (funcall (fdefinition (find-symbol "INSTALL" "QUICKLISP-QUICKSTART")) :path "quicklisp")))

(format *trace-output* "~&; Bootstrap complete.~%")
