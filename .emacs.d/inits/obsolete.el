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

;; Python hook for setting tab width
(add-hook 'python-mode-hook
          (function (lambda () 
                      (setq python-indent-offset 4))))

;; smex: M-x enhancement for Emacs, built on top of ido
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; livedown: view markdown files lively
;; (custom-set-variables
;;  '(livedown-autostart nil) ; automatically open preview when opening markdown files
;;  '(livedown-open t)        ; automatically open the browser window
;;  '(livedown-port 1337)     ; port for livedown server
;;  '(livedown-browser nil))  ; browser to use
;; (require 'livedown)

;; ;; markdown-preview-mode: minor mode to preview markdown output as you save
;; (require 'markdown-preview-mode)

;; ivy: a generic completion mechanism for Emacs (ref: https://github.com/abo-abo/swiper)
(add-to-list 'load-path "~/.emacs.d/swiper/")
;(ivy-mode 1)
;; counsel: a collection of Ivy-enhanced versions of common Emacs commands
(require 'counsel)
(global-set-key (kbd "C-x C-S-f") 'counsel-find-file)
(global-set-key (kbd "C-x C-f") 'find-file)
;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;; swiper: an alternative to isearch that uses ivy to show an overview of all matches
(global-set-key (kbd "C-S-s") 'swiper)
(global-set-key (kbd "C-s") 'isearch-forward)
;; ivy-smex: an ivy interface to smex
;(require 'ivy-smex)
;(global-set-key (kbd "M-x") 'ivy-smex)

;; switch-window (ref: https://github.com/dimitri/switch-window)
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
;; more convenient window switching
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-S-o") 'previous-multiframe-window)

;; cc-mode
;;(add-to-list 'load-path "~/.emacs.d/lisp/cc-mode-5.33")
;;(require 'cc-mode)
