;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs modes configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Interactively Do Things
(require 'ido)
(require 'ido-ubiquitous)
(add-to-list 'ido-ignore-files "\\.DS_Store")
(ido-mode t)
(setq ido-enable-flex-matching t)    ; case insensitive matching
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(ido-everywhere t)

;; ido-like for M-x
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
;(require 'rinari)

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
(add-hook 'js2-mode-hook '(lambda ()
                            (local-set-key "\C-x\C-e" 'js-send-last-sexp)
                            (local-set-key "\C-cb" 'js-send-buffer)
                            (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)))

(require 'js-comint)

;; PHP
;;(require 'php-mode)

;; Git
(require 'magit)
(autoload 'magit-status "magit" nil t)
(add-hook 'magit-mode-hook (lambda () (setq yas-dont-activate t)))

(eval-after-load 'magit
  '(progn
     (set-face-background 'highlight nil) ;; highlight is overriding other background colors for diff chunks
     (set-face-foreground 'highlight nil) ;; highlight is overriding other foreground colors for diff chunks
     (set-face-underline  'highlight nil)
     (define-key magit-mode-map (kbd "<tab>") 'magit-toggle-section)    ; was smart-tab
     (define-key magit-status-mode-map (kbd "M-K") 'magit-quit-session)
     (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace) ))

;; Common Lisp
(require 'slime)
(add-hook 'slime-repl-mode-hook  (lambda () (local-set-key (kbd "C-c C-]") 'slime-close-all-parens-in-sexp)))
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib/")
(add-to-list 'auto-mode-alist '("\\.asd$" . lisp-mode))
(slime-setup '(slime-fancy slime-repl slime-editing-commands slime-references slime-autodoc slime-fancy-inspector))

;; Paredit
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook       (lambda () (paredit-mode +1)))

;; Scheme
(require 'quack)

;; Ruby Version Manager
(require 'rbenv)
(rbenv-use-global)

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
                  '(;; Initial state elements are red in color so they are more prominent.
                    ("TOCODE" :background "red2" :weight bold :foreground "white")
                    ("COMMITTED" :background "VioletRed4" :weight bold :foreground "white")
                    ("TODO"  :background "firebrick" :weight bold :foreground "white")
                    ("JIRA-ISSUE" :background "sienna3" :weight bold :foreground "white")
                    ("IDEA" :background "red2" :weight bold :foreground "white")
                    ("WRITE" :background "purple" :weight bold :foreground "white")
                    ;; Done states are blueish so they do not interfere with the things we need to do.
                    ("MERGED" :background "DodgerBlue3" :weight bold :foreground "white")
                    ("DONE" :background "SeaGreen4" :weight bold :foreground "white")
                    ("RESOLVED" :background "blue2" :weight bold :foreground "white")
                    ("ACCOMPLISHED" :background "blue2" :weight bold :foreground "white")
                    ("WRITTEN" :background "DodgerBlue3" :weight bold :foreground "white")
                    ;; This is for notes markers.
                    ("NOTE" :background "firebrick" :weight bold :foreground "white")
                    ("HOWTO" :background "royal blue" :weight bold :foreground "white")))))

;; SQL
(add-hook 'sql-mode-hook (lambda () (sql-set-product 'mysql)))

;; paired characters!
(electric-pair-mode)

;; Use aspell instead of ispell
(setq-default ispell-program-name "aspell")

;; Dired+ use a single buffer
(toggle-diredp-find-file-reuse-dir 1)

;; Snippets galore.
(require 'yasnippet)
(setq yas/prompt-functions '(yas-ido-prompt yas/dropdown-prompt))
(yas-global-mode 1)

;; In place editing.
(require 'iedit)

;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; ag
(setq ag-highlight-search t)

;; server-mode
(server-mode)

;; autofill
(setq-default fill-column 80)

;; c-mode
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux");

;; wrap lines in a tasteful way
(global-visual-line-mode 1)

;; save minibuffer history across sessions
(setq savehist-file "~/.emacs.d/.savehist")
(savehist-mode 1)

;; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode t)

;; Hippie expand
(setq hippie-expand-try-functions-list
      '(yas-hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-lisp-symbol))

(require 'hippie-expand-slime)
(add-hook 'slime-mode-hook 'set-up-slime-hippie-expand)
(add-hook 'slime-repl-mode-hook 'set-up-slime-hippie-expand)

;; Web Mode
(require 'web-mode)
(require 'rainbow-mode)

(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'sass-mode-hook (lambda () (rainbow-mode 1)))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 4)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Powerline
(require 'powerline)
(powerline-default-theme)
