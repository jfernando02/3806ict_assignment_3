
(cl:in-package :asdf)

(defsystem "assignment_3-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Sensor" :depends-on ("_package_Sensor"))
    (:file "_package_Sensor" :depends-on ("_package"))
    (:file "UpdateGrid" :depends-on ("_package_UpdateGrid"))
    (:file "_package_UpdateGrid" :depends-on ("_package"))
  ))