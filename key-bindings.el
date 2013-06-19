
(global-set-key (kbd "C-x C-m")		'smex)

;; File Explorer - toggle speedbar
(global-set-key (kbd "C-c e")		'speedbar)
(global-set-key (kbd "C-c I")		'find-user-init-file)
(global-set-key (kbd "C-c k")		'find-key-bindings-file)
(global-set-key (kbd "C-c m")		'magit-status)
(global-set-key (kbd "C-c s")		'switch-to-scratch-buffer)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-c C-i")		'ido-imenu)
(global-set-key (kbd "C-c C-r")		'copy-region-as-kill)
 
;; Auto-fill
(global-set-key (kbd "C-c q")		'auto-fill-mode)
(global-set-key (kbd "C-c C-q")		'toggle-text-mode-fill)


;; Auto-fill
;; M-q  'fill-paragraph
(global-set-key (kbd "C-c q")		'auto-fill-mode)
(global-set-key (kbd "C-c C-q")		'toggle-text-mode-auto-fill)


(provide 'key-bindings)
