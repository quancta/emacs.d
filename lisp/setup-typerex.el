;; If you ever had problem with setting typerex for any reason
;; this is the fallback to tuareg-mode
;; svn checkout svn://svn.forge.ocamlcore.org/svn/tuareg/trunk $HOME/.tuareg 
;; and then load it:
;; (load (expand-file-name "~/.tuareg/tuareg-site-file.el"))

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

(autoload 'utop "utop" "Toplevel for OCaml" t)

(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'typerex-mode-hook 'utop-setup-ocaml-buffer)

(setq tuareg-interactive-program  (expand-file-name "~/.opam/4.01.0/bin/ocaml"))
(setq tuareg-library-path (expand-file-name "~/.opam/4.01.0/lib/ocaml"))

(add-hook
 'tuareg-mode-hook
 '(lambda ()
    (setq tuareg-lazy-= t)
    (setq tuareg-lazy-paren t)
    (setq tuareg-in-indent 0)
    (setq tuareg-electric-indent nil)
    (setq tuareg-leading-star-in-doc t)
    (setq tuareg-with-indent 0)

    ;; Do not move the cursor after eval a phrase
    (setq tuareg-skip-after-eval-phrase nil)

    ;; Do not display the REPL buffer, I usually set it up in another
    ;; window, or frame already, so just don't mess the layout with
    ;; another window.
    (setq tuareg-display-buffer-on-eval nil)

    ;; ocamlspot and other keys
    (local-set-key (kbd "C-c ;")   'ocamlspot-query)
    (local-set-key (kbd "C-c C-t") 'ocamlspot-type)
    (local-set-key (kbd "C-c C-y") 'ocamlspot-type-and-copy)
    (local-set-key (kbd "C-c C-u") 'ocamlspot-use)
    (local-set-key (kbd "C-c T")   'caml-types-show-type)
    ))

(provide 'setup-typerex)
