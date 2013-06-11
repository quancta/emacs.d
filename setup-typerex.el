(with-temp-buffer
  (insert
   (shell-command-to-string "ocp-edit-mode emacs -load-global-config"))
  (eval-buffer))

;; indent code after pattern match ->
;; (setq tuareg-use-smie t)

;; Make sure you do the following in site-lisp/typerex directory:
;; configure -prefix /usr/local
;; make
;; sudo make install

(provide 'setup-typerex)
