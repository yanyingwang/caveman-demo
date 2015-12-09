(in-package :cl-user)
(defpackage caveman-demo.web
  (:use :cl
        :caveman2
        :caveman-demo.config
        :caveman-demo.view
        :caveman-demo.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :caveman-demo.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

@route GET "/welcome"
(lambda (&key (|name| "Gues"))
  (format nil "Welcome, ~A" |name|))
;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
