; set paths (only on MacOS X)
(when (equal system-type 'darwin)
  (load-file "/Applications/Emacs.app/Contents/Resources/lisp/shell.el.gz")
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))

;; Use aspell instead of ispell
(setq-default ispell-program-name "aspell")

;; sql-mode default to postgresql syntax hightlighting
(setq sql-postgres-program "psql92")
(setq sql-mysql-program "mysql5")
(add-hook 'sql-mode-hook (lambda () (sql-set-product 'postgres)))

;; Dired+ use a single buffer
(toggle-diredp-find-file-reuse-dir 1)
