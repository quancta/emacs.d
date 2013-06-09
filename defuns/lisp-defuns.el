;; Lisp specific defuns

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

(defun reload (&optional do-compile-subdir)
  (interactive "p")
  (when (> do-compile-subdir 1)
    (progn
      (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
      (byte-recompile-directory (expand-file-name "~/.emacs.d/defuns") 0)
      (byte-recompile-directory (expand-file-name "~/.emacs.d/elpa") 0)
      (byte-recompile-directory (expand-file-name "~/.emacs.d/site-lisp") 0)

      (load-file (expand-file-name "init.el" user-emacs-directory))
      (load-file (expand-file-name "key-bindinds.el" user-emacs-directory))
      (load-file (expand-file-name "mac.el" user-emacs-directory))
      )))

(defun my-kill-current-buffer ()
  (interactive)
  (if server-buffer-clients
      (server-edit))
  (kill-buffer (buffer-name (current-buffer))))

(defun my-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Vietnamese input method
(defvar my-default-input-method default-input-method)
(defun my-toggle-vn-input ()
  (interactive)
  (if (equal default-input-method my-default-input-method)
      (set-input-method "vietnamese-telex")
    (set-input-method my-default-input-method)))

(defvar my-ydump-executable "/opt/local/bin/ydump"
  "ydump is a little utility from the OCaml yojson package.")

;; Json pretty print the region.  Bind to C-c M-j
(defun my-ydump-region (&optional b e)
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
   (shell-command-on-region b e my-ydump-executable (current-buffer) t)
  (comment-region (mark) (point))))


(require 'markdown-mode)

;; Bind to C-c p if you need to run it often.
(defun my-generate-markdown-with-preview ()
  (interactive)
  (markdown)
  (browse-url-of-buffer "*markdown-output*")
  (with-current-buffer "*markdown-output*"
    (write-file "/tmp/www/publications.html" nil)))

(defun my-generate-markdown ()
  (interactive)
  (markdown)
  (with-current-buffer "*markdown-output*"
    (write-file "/tmp/www/publications.html" nil)))

;; Bind to C-c C-u
(defun my-kill-previous-line ()
  (interactive)
  (save-excursion
    (set-mark (point))
    (beginning-of-line 0)
    (kill-region (point) (mark))))


;; Bind to M-c and M-u in OCaml mode
(defun my-ocaml-comment-line ()
  (interactive)
  (insert "(* ")
  (end-of-line)
  (insert " *)"))

(defun my-ocaml-uncomment-line ()
  (interactive)
  (delete-char 3)
  (end-of-line)
  (delete-char -3))

(provide 'lisp-defuns)
