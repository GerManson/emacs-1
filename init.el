
;; fms's init.el
(require 'cl-lib)
(require 'package)

; add directories to the load path
;(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")
(add-to-list 'load-path "~/.emacs.d/vendor")

; handy function to load all elisp files in a directory
(load-file "~/.emacs.d/load-directory.el")

; load utility functions
(mapcar 'load-directory '("~/.emacs.d/utilities"))

; load third-party modes
(vendor 'slime)

(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages nil "My list of ELPA packages")
(setq my-packages '(ag
                    dash-at-point
                    dired+
                    dropdown-list
                    exec-path-from-shell
                    findr
                    gnuplot
                    hippie-expand-slime
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
                    ;php-mode
                    popup
                    quack
                    rainbow-mode
                    rbenv
                    ;rinari
                    ruby-compilation
                    ruby-mode
                    rust-mode
                    smex
                    textile-mode
                    yaml-mode
                    yasnippet))

(dolist (pkg my-packages)
  (message (concat "Checking package: " (symbol-name pkg)))
  (when (not (package-installed-p pkg))
    (message (concat "Installing: " (symbol-name pkg)))
    (package-install pkg)))

; load personal customizations (keybindings, colors, etc.)
(mapcar 'load-directory '("~/.emacs.d/customizations"))

(setq magit-last-seen-setup-instructions "1.4.0")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
