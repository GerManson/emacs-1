(require 'color-theme)
(require 'color-theme-almost-monokai)

(eval-after-load "color-theme"
    (color-theme-initialize))

(setq color-theme-is-global t)
(color-theme-billw)

; nice font
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Inconsolata-14"))

; fontify current frame
(fontify-frame nil)

; fontify any future frames
(push 'fontify-frame after-make-frame-functions)