;;;; Testing the functions in cl-sbcl-pipes and examples.

;;(in-package :msb-proc)

;;; Plotting a sinus on gnuplot using pipes.
(defparameter *gp-proc* (run-prog "gnuplot" "-persist"))
(print-proc-lstr *gp-proc* '("plot sin(x)" "set grid"))
(finish-output (sb-ext:process-input *gp-proc*))
(sleep 1)
(close-proc *gp-proc*)
