;; Command Keys
(setq mac-command-modifier 'super)
(setq mac-right-command-modifier 'hyper)

;; Option Keys
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier 'alt)

;; FN Keys and right Ctrl
(setq ns-function-modifier 'hyper)
(setq mac-right-control-modifier 'super)

(setq chinese-frame-alist
      '((font . "Kaiti_SC-36")
        (width . 76)
        (height . 18)
        ))

(setq normal-frame-alist
      `((font . "Monaco-18")
        (width . 80)
        (height . 28)
        ))
(setq initial-frame-alist
      `((font . "Monaco-24")
        (width . 86)
        (height . 36)
        ))

(setq default-frame-alist 
      (copy-alist normal-frame-alist)
      ;(copy-alist chinese-frame-alist)
      )

(setq initial-frame-alist
      (copy-alist normal-frame-alist)
      ;(copy-alist chinese-frame-alist)
      )

;; make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)
(push "/opt/local/bin" exec-path)

;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Ignore .DS_Store files with ido mode
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/opt/local/bin/aspell")


(provide 'mac)
