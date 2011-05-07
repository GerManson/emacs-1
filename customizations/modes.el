;; Use iswitchb
(iswitchb-mode 1)
(setq iswitchb-default-method 'samewindow)

; Ruby
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode 1)))

; Rails
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

; YAML
(autoload 'yaml-mode "yaml-mode" "Mode for editing yaml files" t)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; JavaScript
(autoload 'js-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
; JSON
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

; nxhtml (HTML/ERB template support)
(load "~/.emacs.d/vendor/nxhtml/autostart.el")
(setq
  nxhtml-global-minor-mode t
  mumamo-chunk-coloring 'submode-colored
  nxhtml-skip-welcome t
  indent-region-mode t
  rng-nxml-auto-validate-flag t
  nxml-degraded t)

(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

; RVM
(require 'rvm)
(rvm-use-default)

(eval-after-load 'nxhtml
  '(eval-after-load 'color-theme
     (custom-set-faces
       '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#242424"))))
       '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) (:background "#373736"))))
)))

; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 23)
           (equal emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)