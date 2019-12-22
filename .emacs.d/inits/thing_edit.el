;; Copy at point without selection
(require 'thing-edit)
(global-set-key (kbd "C-c s") 'thing-copy-symbol)
(global-set-key (kbd "C-c e") 'thing-copy-sexp)
(global-set-key (kbd "C-c w") 'thing-copy-word)
