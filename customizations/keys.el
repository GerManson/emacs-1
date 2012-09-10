(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

; This function is used too many times, using Meta slows me down
(global-set-key "\C-x\C-m" 'execute-extended-command)

(when (eq system-type 'darwin)
  (setq mac-option-modifier 'none)
  (setq mac-command-modifier 'meta))
