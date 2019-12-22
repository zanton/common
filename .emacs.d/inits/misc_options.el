;; GUI options: no menu bar, no tool bar
(custom-set-variables
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))

;; Set default font size
(set-default-font "Ubuntu Mono 11")

;; Added automatically for custom theme
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
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

;; Turn off backup files
(setq make-backup-files nil)

