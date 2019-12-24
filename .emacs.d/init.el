(load-file "~/.emacs.d/inits/basics.el")
(load-file "~/.emacs.d/inits/misc_options.el")

;; Add .emacs.d/lisp to load-path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; C mode
(load-file "~/.emacs.d/inits/c_mode.el")

;; Highlight
(load-file "~/.emacs.d/inits/highlight_symbol.el")
(load-file "~/.emacs.d/inits/breadcrumb.el")
(load-file "~/.emacs.d/inits/symbol_overlay.el")

;; Copy
(load-file "~/.emacs.d/inits/thing_edit.el")

;; Auto-Complete
(load-file "~/.emacs.d/inits/company_mode.el")
(load-file "~/.emacs.d/inits/auto_complete.el")


;; load another TAGS file
(global-set-key (kbd "C-c M-.") 'visit-tags-table)

;; [2016/10/28]

;; switch-window (ref: https://github.com/dimitri/switch-window)
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
;; more convenient window switching
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-S-o") 'previous-multiframe-window)

;; smex: M-x enhancement for Emacs, built on top of ido
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

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

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode")
(require 'markdown-mode)

;; [2016/11/16]

;; livedown: view markdown files lively
;; (custom-set-variables
;;  '(livedown-autostart nil) ; automatically open preview when opening markdown files
;;  '(livedown-open t)        ; automatically open the browser window
;;  '(livedown-port 1337)     ; port for livedown server
;;  '(livedown-browser nil))  ; browser to use
;; (require 'livedown)

;; ;; markdown-preview-mode: minor mode to preview markdown output as you save
;; (require 'markdown-preview-mode)

;; [2016/11/18]

; did not work
;(add-to-list 'load-path "~/.emacs.d/lisp/magit/lisp")
;(add-to-list 'load-path "~/.emacs.d/lisp/dash")
;(add-to-list 'load-path "~/.emacs.d/lisp/with-editor")

;; magit: emacs interface to git
;; How to install?
;; M-x package-refresh-contents RET
;; M-x package-install RET magit RET
(global-set-key (kbd "C-x g") 'magit-status)

;; [2017/04/09]

;; cc-mode
;;(add-to-list 'load-path "~/.emacs.d/lisp/cc-mode-5.33")
;;(require 'cc-mode)

;;(require 'qtdoc)

;; [2017/04/10]

;; function decides whether .h file is C or C++ header, sets C++ by
;; default because there's more chance of there being a .h without a
;; .cc than a .h without a .c (ie. for C++ template files)
(defun c-c++-header ()
  "sets either c-mode or c++-mode, whichever is appropriate for
header"
  (interactive)
  (let ((c-file (concat (substring (buffer-file-name) 0 -1) "c")))
    (if (file-exists-p c-file)
        (c-mode)
      (c++-mode))))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-c++-header))

;; Initial window size when Emacs is opened
;;(when window-system (set-frame-size (selected-frame) 84 52))
(when window-system (set-frame-size (selected-frame) 90 60))

;; Python hook for setting tab width
(add-hook 'python-mode-hook
          (function (lambda () 
                      (setq python-indent-offset 4))))

;; [2018/04/06]

;; CUDA mode
(require 'cuda-mode)

;; [2018/04/13]

;; cmake mode
;; Add cmake listfile names to the mode list.
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))

(autoload 'cmake-mode "~/.emacs.d/lisp/cmake-mode.el" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("400994f0731b2109b519af2f2d1f022e7ced630a78890543526b9342a3b04cf1" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (company magit jedi)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
