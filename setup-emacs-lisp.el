
;; this is already done in setup-eldoc.el
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; mode specific key bindings
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-j" 'eval-print-last-sexp))
            ))

(provide 'setup-emacs-lisp)
