; colorful shell

; set paths (only on MacOS X)
(when (equal system-type 'darwin)
  (load-file "/Applications/Emacs.app/Contents/Resources/lisp/shell.el.gz")
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
