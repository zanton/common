;; lua mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 2)

;; key bindings
;;(global-set-key (kbd "C-M-f") 'lua-forward-sexp)
;;(global-set-key (kbd "C-M-b") 'backward-sexp)
;;(global-set-key (kbd "C-M-b") 'lua-backward-up-list)
