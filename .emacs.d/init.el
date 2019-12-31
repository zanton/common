;; Basic files & directories
(setq user-emacs-dir "~/.emacs.d")
(add-to-list 'load-path (concat user-emacs-dir "/lisp"))
(setq inits-dir (concat user-emacs-dir "/inits"))
(setq custom-file (concat user-emacs-dir "/custom.el"))

;; Basic key bindings & options
(load-file (concat inits-dir "/basics.el"))
(load-file (concat inits-dir "/misc.el"))

;; Language modes
(load-file (concat inits-dir "/c_mode.el"))
(load-file (concat inits-dir "/markdown_mode.el"))
(load-file (concat inits-dir "/cuda_mode.el"))
(load-file (concat inits-dir "/cmake_mode.el"))

;; Highlight
(load-file (concat inits-dir "/highlight_symbol.el"))
(load-file (concat inits-dir "/breadcrumb.el"))
(load-file (concat inits-dir "/symbol_overlay.el"))

;; Copy
(load-file (concat inits-dir "/thing_edit.el"))

;; Auto-Complete
(load-file (concat inits-dir "/company_mode.el"))
;(load-file (concat inits-dir "/auto_complete.el"))

;; Magit
(load-file (concat inits-dir "/magit.el"))

;; Helm
(load-file (concat inits-dir "/helm.el"))

;;(package-initialize)

;; init.el ends here.
