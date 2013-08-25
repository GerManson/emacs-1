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
  (setq mac-command-modifier 'meta)

  (setq sql-postgres-program "psql92")
  (setq sql-mysql-program "/opt/local/lib/mysql55/bin/mysql")
  (setq inferior-js-program-command "/opt/local/bin/node -i")
  (setq inferior-lisp-program "/opt/local/bin/sbcl")

  (add-hook 'inferior-js-mode-hook
            (lambda ()
              ;; We like nice colors
              (ansi-color-for-comint-mode-on)
              ;; Deal with some prompt nonsense
              (add-to-list
               'comint-preoutput-filter-functions
               (lambda (output)
                 (replace-regexp-in-string "\033\\[[0-9]+[GKJ]" "" output))))))
