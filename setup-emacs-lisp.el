(message "setup-emacs-lisp loaded.")

;; this is already done in setup-eldoc.el
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; mode specific key bindings
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (message "I am hooked in emacs-lisp-mode-hook")
            (local-set-key (kbd "C-c C-j" 'eval-print-last-sexp))
            ))

(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (message "I am hooked in lisp-interaction-mode-hook")
            (local-set-key (kbd "C-c C-j" 'eval-print-last-sexp))
            ))


(provide 'setup-emacs-lisp)
