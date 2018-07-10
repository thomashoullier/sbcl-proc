;;;; Testing the functions in cl-sbcl-pipes and examples.


(defparameter *gp-proc* (run-prog "gnuplot" "-persist"))

(print-proc *gp-proc* "plot sin(x)")
(finish-output (sb-ext:process-input *gp-proc*))

(sleep 1)
(close-proc *gp-proc*)

