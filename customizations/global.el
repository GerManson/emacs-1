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

;;; Normally disabled commands
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
