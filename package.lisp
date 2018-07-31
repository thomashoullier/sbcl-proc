;;;; Package creation for msb-proc.

(defpackage :msb-proc
  (:documentation "Small library to manage external processes in SBCL.")
  (:use :cl)
  (:export #:run-prog
           #:close-proc
           #:print-proc
           #:print-proc-lstr))
