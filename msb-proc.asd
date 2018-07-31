;;;; ASDF file defining the library msb-proc

(asdf:defsystem "msb-proc"
  :description "msb-proc: SBCL functions and wrappers to manage external programs and piping"
  :version "0.1"
  :author "karl"
  :components ((:file "package")
               (:file "sbcl-pipes" :depends-on ("package"))))
