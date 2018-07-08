;;;; Testing the functions in cl-sbcl-pipes and examples.


(defparameter *gp-proc* (run-prog "gnuplot" "-persist"))

(princ #\Newline (sb-ext:process-input *gp-proc*))
(princ "plot sin(x)" (sb-ext:process-input *gp-proc*))
(princ #\Newline (sb-ext:process-input *gp-proc*))
(finish-output (sb-ext:process-input *gp-proc*))
