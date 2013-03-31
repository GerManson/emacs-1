;; Interactively Do Things
(require 'ido)
(require 'ido-ubiquitous)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(ido-everywhere t)

;; ido for M-x
(require 'smex)
(smex-initialize)

;; Ruby
(require 'ruby-mode)
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile.lock" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))

;; Rinari
(require 'rinari)

;; YAML
(require 'yaml-mode)

;; Textile
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;; JavaScript
(require 'js2-mode)
(autoload 'js2-mode "js" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(require 'js-comint)
(cond ((eq system-type 'darwin) (progn
                                  (setq inferior-js-program-command "/opt/local/bin/node -i")
                                  (add-hook 'inferior-js-mode-hook
                                            (lambda ()
                                              ;; We like nice colors
                                              (ansi-color-for-comint-mode-on)
                                              ;; Deal with some prompt nonsense
                                              (add-to-list
                                               'comint-preoutput-filter-functions
                                               (lambda (output)
                                                 (replace-regexp-in-string "\033\\[[0-9]+[GKJ]" "" output))))))))
;; PHP
(require 'php-mode)

;; C#
(require 'csharp-mode)

;; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

;; Common Lisp
(require 'slime)
(add-hook 'slime-repl-mode-hook  (lambda () (local-set-key (kbd "C-c C-]") 'slime-close-all-parens-in-sexp)))
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")
(add-to-list 'auto-mode-alist '("\\.asd$" . lisp-mode))

(cond ((eq system-type 'gnu/linux) (setq inferior-lisp-program "/usr/bin/sbcl"))
      ((eq system-type 'darwin) (setq inferior-lisp-program "/opt/local/bin/sbcl")))

(slime-setup '(slime-fancy slime-repl slime-editing-commands slime-references))

;; Paredit
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook       (lambda () (paredit-mode +1)))

;; Scheme
(require 'quack)

;; Rainbow mode
(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))

;; Ruby Version Manager
(require 'rvm)
(rvm-use-default)

;; Markdown
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

;; Colorful shell
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'org)
(add-hook 'org-mode-hook
          (lambda ()
             (setq org-todo-keyword-faces
                   '(("COMMITTED" . (:foreground "yellow"))
                     ("DONE" . (:foreground "cyan"))
                     ("TO-CODE" . (:foreground "magenta"))
                     ("TODO" . (:foreground "white"))))))

; electric-pair-mode
(electric-pair-mode)
