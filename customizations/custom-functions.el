(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")

(defun org-journal-entry ()
  (interactive)
  (widen)
  (let ((today (format-time-string org-journal-date-format)))
    (org-insert-heading)
    (insert today)))
