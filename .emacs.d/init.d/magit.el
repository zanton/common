;; magit: emacs interface to git
(add-to-list 'load-path (concat user-emacs-dir "/lisp/dash"))
(add-to-list 'load-path (concat user-emacs-dir "/lisp/with-editor"))
(add-to-list 'load-path (concat user-emacs-dir "/lisp/ghub"))
(add-to-list 'load-path (concat user-emacs-dir "/lisp/graphql"))
(add-to-list 'load-path (concat user-emacs-dir "/lisp/treepy"))
(add-to-list 'load-path (concat user-emacs-dir "/lisp/magit/lisp"))
(load (concat user-emacs-dir "/lisp/magit/lisp/magit-autoloads"))
(global-set-key (kbd "C-x g") 'magit-status)
