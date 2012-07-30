(when window-system
  (load-theme 'monokai t)

  (if (string-equal system-type "gnu/linux")
    (set-default-font "-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))

  (if (string-equal system-type "windows-nt")
      (set-face-attribute 'default nil :font "Consolas-11")))
