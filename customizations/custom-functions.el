(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")

(defun org-journal-entry ()
  (interactive)
  (widen)
  (let ((today (format-time-string org-journal-date-format)))
    (org-insert-heading)
    (insert today)))

;; Just a small routine to help with comment blocks.
(defun fill-and-comment ()
  "Fills and comments the region."
  (interactive)
  (save-excursion
    (let ((beg (mark))
          (end (point)))
      (fill-region beg end)
      (comment-region beg end))))
