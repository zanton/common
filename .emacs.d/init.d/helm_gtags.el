;; helm gtags
(require 'helm-gtags)
(setq helm-gtags-path-style 'root)
(setq helm-gtags-auto-update t)

(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'python-mode-hook 'helm-gtags-mode)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-s t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-s r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "M-s .") 'helm-gtags-find-tag-from-here)
             (local-set-key (kbd "M-s p") 'helm-gtags-previous-history)
             (local-set-key (kbd "M-s n") 'helm-gtags-next-history)
             (local-set-key (kbd "M-s ,") 'helm-gtags-pop-stack)))
