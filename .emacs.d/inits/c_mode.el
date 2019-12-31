;; Set tab width, c basic offset:
(setq-default c-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Open .cilk and .cilkh with C-Mode
(add-to-list 'auto-mode-alist '("\\.cilk\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cilkh\\'" . c-mode))

;; Function decides whether .h file is C or C++ header, sets C++ by
;; default because there's more chance of there being a .h without a
;; .cc than a .h without a .c (ie. for C++ template files)
(defun c-c++-header ()
  "sets either c-mode or c++-mode, whichever is appropriate for header"
  (interactive)
  (let ((c-file (concat (substring (buffer-file-name) 0 -1) "c")))
    (if (file-exists-p c-file)
        (c-mode)
      (c++-mode))))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-c++-header))

;; Google style
(require 'google-c-style)
(add-hook 'c-mode-hook 'google-set-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
