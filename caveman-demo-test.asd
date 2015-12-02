(in-package :cl-user)
(defpackage caveman-demo-test-asd
  (:use :cl :asdf))
(in-package :caveman-demo-test-asd)

(defsystem caveman-demo-test
  :author "yanyingwang"
  :license ""
  :depends-on (:caveman-demo
               :prove)
  :components ((:module "t"
                :components
                ((:file "caveman-demo"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
