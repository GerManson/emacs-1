;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs bindings configuration.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar my-key-bindings-minor-mode-map (make-keymap) "My keymap.")

(defvar smart-tab-using-hippie-expand t
  "Turn this on if you want to use hippie-expand completion.")

(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
  minibuffer compliant: it acts as usual in the minibuffer.

  In all other buffers: if PREFIX is \\[universal-argument], calls
  `smart-indent'. Else if point is at the end of a symbol,
  expands it. Else calls `smart-indent'."
  (interactive "P")
  (cl-labels ((smart-tab-must-expand (&optional prefix)
                                     (unless (or (consp prefix)
                                                 mark-active)
                                       (looking-at "\\_>"))))
    (cond ((minibufferp)
           (smart-tab-fallback))
          ((smart-tab-must-expand prefix)
           (if smart-tab-using-hippie-expand
             (hippie-expand prefix)
             (dabbrev-expand prefix)))
          ((smart-tab-fallback)))))

(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
      (indent-region (region-beginning) (region-end))
    (indent-for-tab-command)))

(defun smart-tab-fallback ()
  (let* ((my-key-bindings-minor-mode nil)
         (keys (this-single-command-keys))
         (original-command (key-binding keys t)))
    (if original-command
      (progn
        (setq this-original-command original-command)
        (call-interactively original-command))
      (smart-indent))))

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

;; Smart tab
(define-key my-key-bindings-minor-mode-map (kbd "TAB") 'smart-tab)
(define-key my-key-bindings-minor-mode-map [(tab)] 'smart-tab)

;; dash
(define-key my-key-bindings-minor-mode-map (kbd "C-c C-p C-d") 'dash-at-point)

(define-minor-mode my-key-bindings-minor-mode
  "A minor mode that sets my own key bindings globally." t " my-keys" 'my-key-bindings-minor-mode)

(my-key-bindings-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  "This turns the my-keys mode off."
  (my-key-bindings-minor-mode 0))

;; In case the keybindings are not good in the minibuffer.
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; Make sure this mode has preference over all modes.
(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-key-bindings-minor-mode))
      (let ((mykeys (assq 'my-key-bindings-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-key-bindings-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))

(ad-activate 'load)
