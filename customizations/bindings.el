;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs bindings configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar my-key-bindings-minor-mode-map (make-keymap) "My keymap.")

;; Unset a bunch of keys
(global-unset-key (kbd "C-x C-c"))
(global-unset-key (kbd "C-x 1"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 0"))
(global-unset-key (kbd "C-x o"))
(global-unset-key (kbd "C-x o"))
(global-unset-key (kbd "C-x k"))

;; New way to get out, just to make sure we didnt screw up.
(define-key my-key-bindings-minor-mode-map (kbd "C-x C-c") 'confirm-exit-emacs)

;; Hotkey for truncating lines
(define-key my-key-bindings-minor-mode-map (kbd "<f7>") 'toggle-truncate-lines)

;; Window management
(define-key my-key-bindings-minor-mode-map (kbd "M-1") 'delete-other-windows)
(define-key my-key-bindings-minor-mode-map (kbd "M-2") 'split-window-vertically)
(define-key my-key-bindings-minor-mode-map (kbd "M-3") 'split-window-horizontally)
(define-key my-key-bindings-minor-mode-map (kbd "M-0") 'delete-window)
(define-key my-key-bindings-minor-mode-map (kbd "M-o") 'other-window)
(define-key my-key-bindings-minor-mode-map (kbd "M-O") (lambda () (interactive) (other-window -1)))

;; Kill buffers
(define-key my-key-bindings-minor-mode-map (kbd "M-k") 'kill-this-buffer)

;; SMEX
(define-key my-key-bindings-minor-mode-map  (kbd "C-x C-m") 'smex)

;; M-x is now smex localized for major mode
(define-key my-key-bindings-minor-mode-map (kbd "M-x") 'smex-major-mode-commands)

;; Old M-X just in case.
(define-key my-key-bindings-minor-mode-map (kbd "C-c C-c M-x") 'execute-extended-command)

(define-minor-mode my-key-bindings-minor-mode
  "A minor mode that sets my own key bindings globally." t " my-keys" 'my-key-bindings-minor-mode
  (toggle-truncate-lines))

(my-key-bindings-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  "This turns the my-keys mode off."
  (my-keys-minor-mode 0))

;; In case the keybindings are not good in the minibuffer.
;;(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
