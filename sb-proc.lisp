;;;; Wrapping some of the SBCL particular functions to deal broadly with
;;;; starting, stopping and piping to external programs.

(in-package :sb-proc)

(defun run-prog (name &optional (arg nil))
  "Wrapper around sb-ext:run-program mainly to avoid manually setting streams 
each time. Returns the process outputted by sb-ext:run-program.
name : Program name, as a string. Eg. 'gnuplot'. Search is done in the $PATH
arg : Flags provided to the program. As one string."
  (sb-ext:run-program name (list arg)
                      :input :stream :output :stream
                      :wait nil :search T))

(defun close-proc (proc)
  "Close a process. Returns the exit code."
  (sb-ext:process-kill proc 15 :pid)
  (sb-ext:process-wait proc)
  (sb-ext:process-close proc)
  (sb-ext:process-exit-code proc))

(defun print-proc (proc str)
  "Pipe the string 'str' to process 'proc'"
  (princ str (sb-ext:process-input proc))
  (princ #\Newline (sb-ext:process-input proc)))

(defun print-proc-lstr (proc lstr)
  "Pipe the strings in the list 'lstr' to process 'proc'.
   Input each string one at a time with a newline in between each."
  (mapcar (lambda (str) (print-proc proc str)) lstr))
