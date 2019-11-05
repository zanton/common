;; Confirm on exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; Set Ctrl-h and Alt-h as backspace
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)
;(define-key global-map (kbd "M-h") 'backward-kill-word)

;; Help key binding
(global-set-key (kbd "C-?") 'help)

;; Scroll up/down
(defun scroll-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-down 1))
(defun scroll-up-one-line ()
  "Scroll up one line."
  (interactive)
  (scroll-up 1))
(global-set-key [(control up)] 'scroll-down-one-line)
(global-set-key [(control down)] 'scroll-up-one-line)
(global-set-key [(meta up)] 'backward-paragraph)
(global-set-key [(meta down)] 'forward-paragraph)

;; Next/previous couple lines
(defun jump-next-couple-lines ()
  "Jump next couple lines."
  (interactive)
  (next-line 6))
(defun jump-previous-couple-lines ()
  "Jump previous couple lines."
  (interactive)
  (previous-line 6))
(global-set-key [(meta n)] 'jump-next-couple-lines)
(global-set-key [(meta p)] 'jump-previous-couple-lines)

;; Scroll other window
(defun scroll-other-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-other-window-down 1))
(defun scroll-other-up-one-line ()
  "Scroll up one line."
  (interactive)
  (scroll-other-window 1))
(global-set-key [(control prior)] 'scroll-other-down-one-line)
(global-set-key [(control next)] 'scroll-other-up-one-line)
;(global-set-key (kbd "M-next") 'scroll-other-window)
;(global-set-key (kbd "M-prior") 'scroll-other-window-down)

;; Previous window (reverse of C-x o)
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

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

;; Rotate buffers (all including emacs's default ones)
(global-set-key [(meta right)] 'next-buffer)
(global-set-key [(meta left)] 'previous-buffer)

;; Rotate relevant buffers with Ctrl-Left/Right, ignoring emacs's default ones
(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))
(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))
(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))
(global-set-key [(control right)] 'next-non-emacs-buffer)
(global-set-key [(control left)] 'previous-non-emacs-buffer)

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
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set tab width, c basic offset:
;; Set indent to whitespaces ('nil'), for tab change to 't'
;; tab = 2 whitespaces
;(setq-default indent-line-function 'insert-tab)
(setq-default c-basic-offset 2)
;(setq-default indent-tabs-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Bind keys for adjusting font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Org-mode
;; Set insert-subheading
(add-hook 'org-mode-hook
      '(lambda ()
         (local-set-key "\M-j" 'org-insert-subheading)
         ))

;; Open .cilk and .cilkh with C-Mode
(add-to-list 'auto-mode-alist '("\\.cilk\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cilkh\\'" . c-mode))

;; Set default font size
(set-default-font "Ubuntu Mono 11")

;; Go back to previous position
;; C-u C-space
;; For between buffers: C-x C-space

;; Making buffer names unique by uniquify
;(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)

;; Set theme to dark laptop
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'dark-laptop)
;; [2018/04/24]
;; Use another theme when emacs is run on terminal
;; because dark-laptop doesn't look dark when run on terminal
;(if window-system
;	(load-theme 'dark-laptop) ;; Emacs in own window
;	(load-theme 'wombat)      ;; Emacs in tty
;)
;; [2018/04/24]
;; Disable emacs' theme background color when running on terminal
;; so that we can get a real dark background
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

;; Add .emacs.d to load-path for loading *.el from this directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Highlight-symbol mode
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [(f3)] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)

;; Breadcrumb
(require 'breadcrumb)
(global-set-key [(control f2)]          'bc-set)
(global-set-key [(f2)]                  'bc-local-previous)
(global-set-key [(shift f2)]            'bc-local-next)
(global-set-key [(meta f2)]             'bc-list)

;; Auto-complete-mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; Copy at point without selection
;; https://www.emacswiki.org/emacs/download/thing-edit.el
(require 'thing-edit)
(global-set-key (kbd "C-c s") 'thing-copy-symbol)
(global-set-key (kbd "C-c e") 'thing-copy-sexp)
(global-set-key (kbd "C-c w") 'thing-copy-word)

;; imenu, idomenu ?
;; https://www.emacswiki.org/emacs/ImenuMode
(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "C-x C-i") 'imenu)
(global-set-key "\M-i" 'idomenu)

;(require 'package)
;(package-initialize)
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))

;; Sometimes C-j is bound to electric-newline-and-maybe-indent which is not desirable
(global-set-key (kbd "C-j") 'newline-and-indent)

;; load another TAGS file
(global-set-key (kbd "C-c M-.") 'visit-tags-table)

;; Bind keys to turn off truncate-lines in org-mode
;(define-key org-mode-map (kbd "C-c C-/") 'toggle-truncate-lines)

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

;; [2016/10/31]

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

;; [2016/11/10]

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



