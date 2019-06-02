;;;; Testing the functions in cl-sbcl-pipes and examples.

(asdf:load-system :sb-proc)

;;; Plotting a sinus on gnuplot using pipes.
(defparameter *gp-proc* (sb-proc:run-prog "gnuplot" "-persist"))
(sb-proc:print-proc-lstr *gp-proc* '("plot sin(x)" "set grid"))
(finish-output (sb-ext:process-input *gp-proc*))
(sleep 1)
(sb-proc:close-proc *gp-proc*)
