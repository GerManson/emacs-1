(when window-system
  (require 'color-theme)
  (require 'color-theme-almost-monokai)

  (eval-after-load "color-theme"
    (color-theme-initialize))

  (setq color-theme-is-global t)
  (color-theme-almost-monokai))
