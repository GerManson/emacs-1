;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs global configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; tabs and indentation
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; whitespace removal
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; no newlines past EOF
(setq next-line-add-newlines nil)

;; disable auto-save files (#foo#)
(setq auto-save-default nil)

;; disable backup files (foo~)
(setq backup-inhibited t)

;; dont truncate lines
(setq truncate-lines t)

;; don't confirm opening non-existant files/buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; yes, I want to kill buffers with processes attached
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; Anwsering y/n is faster than yes/no.
(fset 'yes-or-no-p 'y-or-n-p)

;; ask before exiting
(defun confirm-exit-emacs ()
  "Ask for confirmation before exiting emacs"
  (interactive)
  (if (y-or-n-p "Are you sure you want to exit? ")
      (save-buffers-kill-emacs)))

;; Do not ask about running processes when exiting.
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;;; hotkeys

;; New way to get out, just to make sure we didnt screw up.
(global-unset-key "\C-x\C-c")
(global-set-key "\C-x\C-c" 'confirm-exit-emacs)

;; Hotkey for truncating lines
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-horizontally)
(global-set-key (kbd "M-3") 'split-window-vertically)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") (lambda ()
                              (interactive)
                              (other-window -1)))

(global-unset-key (kbd "C-x 1"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 0"))
(global-unset-key (kbd "C-x o"))

;;; Normally disabled commands
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
