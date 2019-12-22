;; Set tab width, c basic offset:
(setq-default c-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Open .cilk and .cilkh with C-Mode
(add-to-list 'auto-mode-alist '("\\.cilk\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cilkh\\'" . c-mode))
