;; bm
(add-to-list 'load-path (concat user-emacs-dir "/lisp/bm"))
(require 'bm)

;; key bindings
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "C-c b") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
