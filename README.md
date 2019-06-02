# SBCL Processus management wrapper
Very thin wrapping around some of the utilities of SBCL for starting, stopping
and piping strings to processes.
Wrote mainly to avoid the lengthy syntax of some of the functions provided by
SBCL. You're probably better off using them as they are without this wrapper.
I publish this as it gives some examples on how to run and communicate with
external programs with SBCL.
## Usage
Let us launch a `gnuplot` process and pipe it some commands so as to produce
a graph. From `tests.lisp`:
```{common-lisp}
(defparameter *gp-proc* (sb-proc:run-prog "gnuplot" "-persist"))
(sb-proc:print-proc-lstr *gp-proc* '("plot sin(x)" "set grid"))
(finish-output (sb-ext:process-input *gp-proc*))
(sleep 1)
(sb-proc:close-proc *gp-proc*)
```
A window should open with a plot of a sinus.
## Test
Known to work in Linux 5.1.6_1 and SBCL 1.5.3.
Apart from that, be careful as this wrapper is very crude.
## References
  * http://www.sbcl.org/manual/#Running-external-programs
