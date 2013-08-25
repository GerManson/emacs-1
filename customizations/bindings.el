;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs bindings configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; New way to get out, just to make sure we didnt screw up.
(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)

;; Hotkey for truncating lines
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; Window management
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-horizontally)
(global-set-key (kbd "M-3") 'split-window-vertically)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") (lambda () (interactive) (other-window -1)))

(global-unset-key (kbd "C-x 1"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 0"))
(global-unset-key (kbd "C-x o"))
(global-unset-key (kbd "C-x o"))

;; Kill buffers
(global-set-key (kbd "M-k") 'kill-this-buffer)
(global-unset-key (kbd "C-x k"))

;; SMEX
(global-set-key "\C-x\C-m" 'smex)
;; M-x is now smex localized for major mode
(global-set-key (kbd "M-x") 'smex-major-mode-commands)
;; Old M-X just in case.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
