(load (expand-file-name "defuns/file-defuns.el" user-emacs-directory))
(load (expand-file-name "defuns/buffer-defuns.el" user-emacs-directory))

(global-set-key (kbd "C-x C-m")		'smex)

;; File Explorer - toggle speedbar
(global-set-key (kbd "C-c e")		'speedbar)
(global-set-key (kbd "C-c I")		'find-user-init-file)
(global-set-key (kbd "C-c k")		'find-key-bindings-file)
(global-set-key (kbd "C-c s")		'switch-to-scratch-buffer)

;; Jump to a definition in the current file. (This is awesome)
(global-set-key (kbd "C-c C-i")		'ido-imenu)
(global-set-key (kbd "C-c C-r")		'copy-region-as-kill)

(provide 'key-bindings)
