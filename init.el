(require 'cl)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Setup packages
(require 'setup-package)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup extensions
(eval-after-load 'ido   '(require 'setup-ido))
(eval-after-load 'org   '(require 'setup-org))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'grep  '(require 'setup-rgrep))
(eval-after-load 'shell '(require 'setup-shell))

(eval-after-load 'emacs-lisp-mode '(require 'setup-emacs-lisp))
(eval-after-load 'markdown-mode   '(require 'setup-markdown-mode))
(eval-after-load 'clojure-mode    '(require 'setup-clojure-mode))
(eval-after-load 'ruby-mode       '(require 'setup-ruby-mode))
(eval-after-load 'html-mode       '(require 'setup-html-mode))
(eval-after-load 'java-mode       '(require 'setup-java-mode))
(eval-after-load 'js2-mode        '(require 'setup-js2-mode))

(require 'setup-typerex)
(require 'setup-yasnippet)
(require 'setup-ffip)
(require 'setup-paredit)
(require 'setup-eldoc)
;(require 'setup-viper-mode)
(require 'setup-evil-mode)
(require 'setup-pabbrev)
(require 'setup-scheme-mode)

(require 'sane-defaults)

(when is-mac (require 'mac))

;; Map file type to modes
(require 'mode-mappings)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(require 'key-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Keep emacs Custom-settings in separate file
(setq my-custom-file (expand-file-name "custom.el" user-emacs-directory))
(load my-custom-file)
