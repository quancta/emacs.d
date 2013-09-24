(load (expand-file-name "ESS/lisp/ess-site.el" site-lisp-dir))

(add-hook 'inferior-ess-mode-hook
          '(lambda ()
             (local-set-key [C-up] 'comint-previous-input)
             (local-set-key [C-down] 'comint-next-input)))

(provide 'setup-ess)
