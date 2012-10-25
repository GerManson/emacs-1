(when window-system
  (load-theme 'monokai t)

  (cond ((eq system-type 'gnu/linux)
         (set-default-font "-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
        ((eq system-type 'windows-nt)
         (set-face-attribute 'default nil :font "Consolas-11"))
        ((eq system-type 'darwin)
         (set-face-attribute 'default nil :font "Monaco-12"))))
