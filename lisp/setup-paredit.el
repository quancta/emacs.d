;; My keybindings for paredit

(require 'paredit)

;; My addition

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

;; End of my addition

(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(defun setup-paredit-for-mode-map (mode-map)
  (define-key mode-map (kbd "s-<up>") 'paredit-raise-sexp)
  (define-key mode-map (kbd "s-<right>") 'paredit-forward-slurp-sexp)
  (define-key mode-map (kbd "s-<left>") 'paredit-forward-barf-sexp)
  (define-key mode-map (kbd "s-S-<left>") 'paredit-backward-slurp-sexp)
  (define-key mode-map (kbd "s-S-<right>") 'paredit-backward-barf-sexp)
  (define-key mode-map (kbd "s-8") 'paredit-wrap-round)
  (define-key mode-map (kbd "s-9") 'paredit-wrap-round-from-behind)
  (define-key mode-map (kbd "s-<backspace>") 'paredit-splice-sexp-killing-backward)
  (define-key mode-map (kbd "s-t") 'transpose-sexps)
  )

(eval-after-load "lisp-mode" '(setup-paredit-for-mode-map emacs-lisp-mode-map))
(eval-after-load "clojure-mode" '(setup-paredit-for-mode-map clojure-mode-map))

(provide 'setup-paredit)
