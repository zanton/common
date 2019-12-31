;; Basic files & directories
(setq user-emacs-dir "~/.emacs.d")
(add-to-list 'load-path (concat user-emacs-dir "/lisp"))
(setq init-dir (concat user-emacs-dir "/init.d"))
(setq custom-file (concat user-emacs-dir "/custom.el"))

;; Basic key bindings & options
(load-file (concat init-dir "/basics.el"))
(load-file (concat init-dir "/misc.el"))

;; Language modes
(load-file (concat init-dir "/c_mode.el"))
(load-file (concat init-dir "/markdown_mode.el"))
(load-file (concat init-dir "/cuda_mode.el"))
(load-file (concat init-dir "/cmake_mode.el"))

;; Highlight
(load-file (concat init-dir "/highlight_symbol.el"))
(load-file (concat init-dir "/breadcrumb.el"))
(load-file (concat init-dir "/symbol_overlay.el"))

;; Copy
(load-file (concat init-dir "/thing_edit.el"))

;; Auto-Complete
(load-file (concat init-dir "/company_mode.el"))
;(load-file (concat init-dir "/auto_complete.el"))

;; Magit
(load-file (concat init-dir "/magit.el"))

;; Helm
(load-file (concat init-dir "/helm.el"))

;;(package-initialize)

;; init.el ends here.
