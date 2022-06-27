;; GUI options: no menu bar, no tool bar
(custom-set-variables
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))

;; Show line number
;(global-linum-mode t)
(setq linum-format "%3d ")

;; Set default font size
;;(set-default-font "Ubuntu Mono 11") ;; not available in emacs 27

;; Themes
;; Set theme to dark laptop
;; Use another theme when emacs is run on terminal
;; because dark-laptop doesn't look dark when run on terminal
;;(add-to-list 'custom-theme-load-path (concat user-emacs-dir "/themes"))
;;(load-theme 'dark-laptop) ;; Emacs in own window
;;(load-theme 'wombat)      ;; Emacs in tty

;; Initial window size when Emacs is opened
(when window-system (set-frame-size (selected-frame) 90 60))

;; Making buffer names unique by uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)


;; [2020/03/17]

;; Kill buffer in other window without jumping there
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))
(global-set-key (kbd "C-x K") 'other-window-kill-buffer)

;; Quit other window without jumping there
(defun quit-other-window ()
  "Quit the other window"
  (interactive)
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (quit-window)
    (select-window win-curr)))
(global-set-key (kbd "C-x q") 'quit-other-window)
