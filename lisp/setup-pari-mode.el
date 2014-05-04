(autoload 'gp-mode "pari" nil t)
(autoload 'gp-script-mode "pari" nil t)
(autoload 'gp "pari" nil t)
(autoload 'gpman "pari" nil t)

(setq auto-mode-alist
      (cons '("\\.gp$" . gp-script-mode) auto-mode-alist))

(provide 'setup-pari-mode)
