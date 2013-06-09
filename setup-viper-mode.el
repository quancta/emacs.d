(setq viper-mode t)
(require 'viper)
(require 'vimpulse)

(setq viper-want-emacs-keys-in-vi t)
(setq viper-want-emacs-keys-in-insert t)

(global-set-key (kbd "s-j") 'viper-intercept-ESC-key)
(global-set-key (kbd "C-x C-M-v") 'toggle-viper-mode)

(provide 'setup-viper-mode)
