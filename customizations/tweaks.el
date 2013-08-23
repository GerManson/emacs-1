;; tabs and indentation
(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "linux");

;; encoding
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; show column number in bar
(column-number-mode t)

;; show marks as selections
(setq transient-mark-mode t)

;; highlight matching parens
(show-paren-mode t)

;; highlight incremental search
(defconst search-highlight t)

;; no newlines past EOF
(setq next-line-add-newlines nil)

;; apply syntax highlighting to all buffers
(global-font-lock-mode t)

;; wrap lines in a tasteful way
(global-visual-line-mode 1)

;; disable auto-save files (#foo#)
(setq auto-save-default nil)

;; disable backup files (foo~)
(setq backup-inhibited t)

;; save minibuffer history across sessions
(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

;; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode t)

;; don't confirm opening non-existant files/buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; yes, I want to kill buffers with processes attached
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(when (equal system-type 'darwin)
  ;; MacOS X paths
  (load-file "/Applications/Emacs.app/Contents/Resources/lisp/shell.el.gz")
  (setq explicit-shell-file-name "/opt/local/bin/bash")

  ;; Turn cmd key into meta
  ;;  (setq mac-option-modifier 'none)
  (setq mac-command-modifier 'meta))
