;; ask before exiting
(defun confirm-exit-emacs ()
  "ask for confirmation before exiting emacs"
  (interactive)
  (if (y-or-n-p "Are you sure you want to exit? ")
      (save-buffers-kill-emacs)))

(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)

(global-set-key (kbd "C-e") 'end-of-line)

;; Hotkey for truncating lines
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; This function is used too many times, using Meta slows me down
(global-set-key "\C-x\C-m" 'smex)

(global-set-key (kbd "M-x") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Move to the previous window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))
