;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs MacOS X configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (equal system-type 'darwin)
  ;; MacOS X paths
  (load-file "/Applications/Emacs.app/Contents/Resources/lisp/shell.el.gz")
  (setq explicit-shell-file-name "/opt/local/bin/bash")

  ;; Turn cmd key into meta
  ;;  (setq mac-option-modifier 'none)
  (setq mac-command-modifier 'meta))
