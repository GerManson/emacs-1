;; Just a small routine to help with comment blocks.
(defun fill-and-comment ()
  "Fills and comments the region."
  (interactive)
  (save-excursion
    (let ((beg (mark))
          (end (point)))
      (fill-region beg end)
      (comment-region beg end))))
