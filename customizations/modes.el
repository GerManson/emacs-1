;; Flymake
(unless (eq system-type 'windows-nt) ; Flymake requires shell and it doesn't work in Windows
  (require 'flymake))

;; Interactively Do Things
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(setq ido-use-virtual-buffers t)

; Ruby
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))

; YAML
(autoload 'yaml-mode "yaml-mode" "Mode for editing yaml files" t)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; Textile
(require 'textile-minor-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-minor-mode))

; JavaScript
(autoload 'js-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

; JSON
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

;; Guru mode, training not to use the arrow keys
(require 'guru-mode)

;; Just a custom key for org-mode journaling.
(add-hook
 'org-mode-hook
 (lambda () (local-set-key (kbd "C-c j") 'org-journal-entry)))
