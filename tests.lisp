;;;; Testing the functions in cl-sbcl-pipes and examples.

;;(in-package :msb-proc)
;;(load "package.lisp")
;;(load "package.lisp")
(ql:quickload "msb-proc")

;;; Plotting a sinus on gnuplot using pipes.
(defparameter *gp-proc* (msb-proc:run-prog "gnuplot" "-persist"))
(msb-proc:print-proc-lstr *gp-proc* '("plot sin(x)" "set grid"))
(finish-output (sb-ext:process-input *gp-proc*))
(sleep 1)
(msb-proc:close-proc *gp-proc*)
