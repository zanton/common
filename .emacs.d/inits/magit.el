;; magit: emacs interface to git
(add-to-list 'load-path (concat user-emacs-dir "/lisp/magit/lisp"))
(global-set-key (kbd "C-x g") 'magit-status)
