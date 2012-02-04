(when window-system
  (require 'color-theme)
  (require 'color-theme-almost-monokai)

  (eval-after-load "color-theme"
    (color-theme-initialize))

  (setq color-theme-is-global t)
  (color-theme-almost-monokai)

  (if (string-equal system-type "gnu/linux")
    (set-default-font "-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")))