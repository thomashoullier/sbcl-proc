;;;; ASDF file defining the library msb-proc

(asdf:defsystem "sb-proc"
  :description
  "sb-proc: SBCL functions and wrappers to manage external programs and piping"
  :version "0.1"
  :author "karl"
  :components ((:file "package")
               (:file "sb-proc" :depends-on ("package"))))
