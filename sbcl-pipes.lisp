;;;; Wrapping some of the SBCL particular functions to deal broadly with piping to external programs.

(defun run-prog (name &optional (arg nil))
  "Wraps around sb-ext:run-program mainly to avoid manually setting streams each
 time. Returns the process outputted by sb-ext:run-program.
name : Program name, as a string. Eg. 'gnuplot'. Search is done in the $PATH
arg : Flags provided to the program. As one string."
  (sb-ext:run-program name (list arg)
                      :input :stream
                      :output :stream
                      :wait nil
                      :search T))

(defun close-proc (proc)
  "Closes a process. Returns the exit code."
  (sb-ext:process-kill proc 15 :pid)
  (sb-ext:process-wait proc)
  (sb-ext:process-close proc)
  (sb-ext:process-exit-code proc))
