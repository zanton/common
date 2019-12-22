;; Confirm on exiting
(setq confirm-kill-emacs 'y-or-n-p)

;; Set Ctrl-h and Alt-h as backspace
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)

;; Help key binding
(global-set-key (kbd "C-?") 'help)

;; Jump to next/previous couple lines
(defun jump-next-couple-lines ()
  "Jump next couple lines."
  (interactive)
  (next-line 5))
(defun jump-previous-couple-lines ()
  "Jump previous couple lines."
  (interactive)
  (previous-line 5))
(global-set-key [(meta n)] 'jump-next-couple-lines)
(global-set-key [(meta p)] 'jump-previous-couple-lines)

;; Scroll current window
(defun scroll-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-down 1))
(defun scroll-up-one-line ()
  "Scroll up one line."
  (interactive)
  (scroll-up 1))
(defun scroll-down-couple-lines ()
  "Scroll down couple lines."
  (interactive)
  (scroll-down 5))
(defun scroll-up-couple-lines ()
  "Scroll up couple lines."
  (interactive)
  (scroll-up 5))
(global-set-key [(control up)] 'scroll-down-one-line)
(global-set-key [(control down)] 'scroll-up-one-line)
(global-set-key [(meta up)] 'scroll-down-couple-lines)
(global-set-key [(meta down)] 'scroll-up-couple-lines)

;; Scroll other window
(defun scroll-other-down-one-line ()
  "Scroll down one line."
  (interactive)
  (scroll-other-window-down 1))
(defun scroll-other-up-one-line ()
  "Scroll up one line."
  (interactive)
  (scroll-other-window 1))
(defun scroll-other-down-couple-lines ()
  "Scroll down couple lines."
  (interactive)
  (scroll-other-window-down 5))
(defun scroll-other-up-couple-lines ()
  "Scroll up couple lines."
  (interactive)
  (scroll-other-window 5))
(global-set-key [(control prior)] 'scroll-other-down-one-line)
(global-set-key [(control next)] 'scroll-other-up-one-line)
(global-set-key [(meta prior)] 'scroll-other-down-couple-lines)
(global-set-key [(meta next)] 'scroll-other-up-couple-lines)

;; Move to previous window (reverse of other-window [C-x o])
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; Rotate all buffers (including emacs's ones)
(global-set-key [(meta right)] 'next-buffer)
(global-set-key [(meta left)] 'previous-buffer)

;; Rotate relevant buffers (excluding emacs's ones)
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

;; Adjust text size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

