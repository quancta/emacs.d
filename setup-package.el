(require 'package)

(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
(defvar gnu       '("gnu"       . "http://elpa.gnu.org/packages/"))
(defvar melpa     '("melpa"     . "http://melpa.milkbox.net/packages/"))

;; Add marmalade to package repos
(add-to-list 'package-archives marmalade)
(add-to-list 'package-archives melpa t)

(package-initialize)

(unless (and (file-exists-p "~/.emacs.d/elpa/archives/marmalade")
             (file-exists-p "~/.emacs.d/elpa/archives/gnu")
             (file-exists-p "~/.emacs.d/elpa/archives/melpa"))
  (package-refresh-contents))

(defun packages-install (&rest packages)
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))


;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'clj-mode marmalade)
   (cons 'clj-refactor marmalade)
   (cons 'clojure-mode melpa)
   (cons 'dash melpa)
   (cons 'dired-details melpa)
   (cons 'elisp-slime-nav melpa)
   (cons 'evil-leader marmalade)
   (cons 'evil-nerd-commenter marmalade)
   (cons 'evil-numbers marmalade)
   (cons 'evil-paredit marmalade)
   (cons 'exec-path-from-shell melpa)
   (cons 'find-file-in-project melpa)
   (cons 'flycheck marmalade)
   (cons 'gist melpa)
   (cons 'git-commit-mode melpa)
   (cons 'gitconfig-mode melpa)
   (cons 'gitignore-mode melpa)
   (cons 'htmlize melpa)
   (cons 'ido-ubiquitous marmalade)
   (cons 'magit melpa)
   (cons 'markdown-mode melpa)
   (cons 'move-text melpa)
   (cons 'nrepl melpa)
   (cons 'paredit melpa)
   (cons 'quack melpa)
   (cons 'shell-command melpa)
   (cons 'slime-js marmalade)
   (cons 'smooth-scrolling melpa)
   (cons 'smex melpa)
   (cons 'undo-tree melpa)
   (cons 'yasnippet marmalade)
   (cons 'yasnippet-bundle marmalade)
   ))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'setup-package)
