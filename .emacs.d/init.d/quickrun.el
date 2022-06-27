;; Quickrun: quickly compile and execute current buffer
(require 'quickrun)

;; key bindings
(global-set-key (kbd "C-c x") 'quickrun)
(global-set-key (kbd "C-c c") 'quickrun-compile-only)
(global-set-key (kbd "C-c r") 'quickrun-shell)
(global-set-key (kbd "C-c a") 'quickrun-with-arg)

(quickrun-add-command "c++11"
  '((:command . "g++")
    (:cmdopt . "-x c++ -std=c++11")
    (:exec . ("%c %o -o %e %s" "%e %a"))
    (:compile-only . "%c -Wall -Werror %o -o %e %s")
    (:remove . ("%e"))
    (:description . "Compile C++ file with 'g++ -std=c++11' and execute"))
  :default "c++")

(quickrun-add-command "c"
  '((:command . "gcc")
    (:cmdopt . "-x c")
    (:exec . ("%c %o -o %e %s" "%e %a"))
    (:compile-only . "%c -Wall -Werror %o -o %e %s")
    (:remove . ("%e"))
    (:description . "Compile C file with gcc and execute"))
  :default "c")
