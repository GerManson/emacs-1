;; ask before exiting
(defun confirm-exit-emacs ()
  "ask for confirmation before exiting emacs"
  (interactive)
  (if (y-or-n-p "Are you sure you want to exit? ")
      (save-buffers-kill-emacs)))

;; New way to get out, just to make sure we didnt screw up.
(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)

;; Do not ask about running processes when exiting.
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;; Hotkey for truncating lines
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;; Move to the previous window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))
