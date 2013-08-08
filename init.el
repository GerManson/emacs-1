;; fms's init.el
(require 'cl-lib)

(require 'package)

(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages nil "My list of ELPA packages")
(setq my-packages '(auto-complete
                    dired+
                    dropdown-list
                    exec-path-from-shell
                    findr
                    gnuplot
                    ido-ubiquitous
                    iedit
                    inf-ruby
                    inflections
                    js-comint
                    js2-mode
                    jump
                    magit
                    markdown-mode
                    monokai-theme
                    twilight-anti-bright-theme
                    paredit
                    php-mode
                    popup
                    quack
                    rainbow-mode
                    rbenv
                    rinari
                    ruby-compilation
                    ruby-mode
                    smex
                    textile-mode
                    yaml-mode
                    yasnippet))

(dolist (pkg my-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))

; add directories to the load path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")

; handy function to load all elisp files in a directory
(load-file "~/.emacs.d/load-directory.el")

; load utility functions
(mapcar 'load-directory '("~/.emacs.d/utilities"))

; load third-party modes
(vendor 'slime)

; load personal customizations (keybindings, colors, etc.)
(mapcar 'load-directory '("~/.emacs.d/customizations"))
