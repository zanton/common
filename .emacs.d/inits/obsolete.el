;; Toggle input method by zenkaku-hankaku key
;(global-set-key [(zenkaku-hankaku)] 'toggle-input-method)

;; Reload buffer's content from file
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))
(global-set-key (kbd "C-x C-r") 'revert-buffer-no-confirm)

;; Make C-RET the same as RET, C-tab as tab
;;(global-set-key (kbd "<C-return>") 'newline-and-indent)
(global-set-key (kbd "<C-tab>") 'c-indent-line-or-region)

;; GUI options: no menu bar, no tool bar
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("400994f0731b2109b519af2f2d1f022e7ced630a78890543526b9342a3b04cf1" "86d4a623c8d77c2f7db3007e58a3947c013b3bd983578db640f56ed785d5c657" default)))
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil) ;(quote right))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Org-mode
;; Set insert-subheading
(add-hook 'org-mode-hook
      '(lambda ()
         (local-set-key "\M-j" 'org-insert-subheading)
         ))

;; Go back to previous position
;; C-u C-space
;; For between buffers: C-x C-space

;; Making buffer names unique by uniquify
;(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;(require 'package)
;(package-initialize)
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))

;; imenu, idomenu ?
;; https://www.emacswiki.org/emacs/ImenuMode
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key "\M-i" 'idomenu)

;; Sometimes C-j is bound to electric-newline-and-maybe-indent which is not desirable
(global-set-key (kbd "C-j") 'newline-and-indent)

;; Bind keys to turn off truncate-lines in org-mode
;(define-key org-mode-map (kbd "C-c C-/") 'toggle-truncate-lines)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))

;; jedi: a generic python code-completion tool
;(autoload 'jedi:setup "jedi" nil t)
;(add-hook 'python-mode-hook 'jedi:setup)

;(setq jedi:complete-on-dot t)
