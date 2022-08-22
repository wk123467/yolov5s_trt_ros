
(cl:in-package :asdf)

(defsystem "yolo_detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "target" :depends-on ("_package_target"))
    (:file "_package_target" :depends-on ("_package"))
  ))