(require 'paredit)
(require 'eldoc)

(eldoc-add-command
 'paredit-backward-delete
 'paredit-close-round)

(provide 'setup-eldoc)
