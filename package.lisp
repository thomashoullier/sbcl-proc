;;;; Package creation for msb-proc.

(defpackage :sb-proc
  (:documentation "Thin wrapper around the SBCL external programs utilities")
  (:use :cl)
  (:export #:run-prog
           #:close-proc
           #:print-proc
           #:print-proc-lstr))
