;; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(setq ido-use-virtual-buffers t)

; Ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(require 'rinari)

; YAML
(require 'yaml-mode)

; Textile
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

; JavaScript
(autoload 'js-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

;; Common Lisp
(cond ((eq system-type 'gnu/linux) (setq inferior-lisp-program "/usr/bin/sbcl"))
      ((eq system-type 'darwin) (setq inferior-lisp-program "/opt/local/bin/sbcl"))
      ((eq system-type 'windows-nt) (setq inferior-lisp-program "C:/Progra~2/SteelB~1/1.0.55/sbcl.exe")))

(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")
;; recognize ASDF files used by newer CL systems:
(add-to-list 'auto-mode-alist '("\\.asd$" . lisp-mode))

(require 'slime)
(slime-setup '(slime-fancy slime-repl slime-editing-commands))

;; Scheme
(require 'quack)

;; Just a custom key for org-mode journaling.
(add-hook
 'org-mode-hook
 (lambda () (local-set-key (kbd "C-c j") 'org-journal-entry)))

(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))

(require 'rvm)
(rvm-use-default)

;; Use aspell instead of ispell
(setq-default ispell-program-name "aspell")

;; sql-mode default to postgresql syntax hightlighting
(setq sql-postgres-program "psql92")
(add-hook 'sql-mode-hook (lambda () (sql-set-product 'postgres)))

;; Dired+ use a single buffer
(toggle-diredp-find-file-reuse-dir 1)
