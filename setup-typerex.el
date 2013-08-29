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

(setq tuareg-leading-star-in-doc t)
(setq tuareg-display-buffer-on-eval nil)
(setq tuareg-library-path (expand-file-name "~/.opam/4.01.0dev+trunk/lib/ocaml"))
(setq tuareg-interactive-program (expand-file-name "~/.opam/4.01.0dev+trunk/bin/ocaml"))

(provide 'setup-typerex)
