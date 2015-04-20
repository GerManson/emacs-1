;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs ui configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; apply syntax highlighting to all buffers
(global-font-lock-mode t)

;; don't display startup message
(setq inhibit-startup-message t)

;; show column number in bar
(column-number-mode t)

;; show marks as selections
(setq transient-mark-mode t)

;; highlight matching parens
(show-paren-mode t)

;; highlight incremental search
(defconst search-highlight t)
(defconst query-replace-highlight t)

; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; blink cursor
(blink-cursor-mode t)

; force new frames into existing window
(setq ns-pop-up-frames nil)

; no bell
(setq ring-bell-function 'ignore)

; Moe Theme
(require 'moe-theme)

;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Resize titles (optional).
(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; Choose a color for mode-line.(Default: blue)
(moe-theme-set-color 'magenta)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
(moe-dark)

;; Theme and fonts
(when window-system
  ;(load-theme 'twilight-anti-bright t)
  ;(load-theme 'monokai t)
  ;(load-theme 'leuven t)
  ;(load-theme 'granger t)
  ;(load-theme 'spolsky t)
  ;(load-theme 'mccarthy t)
  ;(load-theme 'odersky t)
  (cond ((eq system-type 'gnu/linux)
         (set-default-font "-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
        ((eq system-type 'windows-nt)
         (set-face-attribute 'default nil :font "Consolas-11"))
        ((eq system-type 'darwin)
         (set-face-attribute 'default nil :font "Source Code Pro Medium-11:antialias=false"))))

; line numbers
(global-linum-mode 1)
