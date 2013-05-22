; for loading libraries in from the vendor directory
(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el")))
    (when (cond
           ((file-directory-p normal) (add-to-list 'load-path normal))
           ((file-directory-p suffix) (add-to-list 'load-path suffix))
           ((file-exists-p suffix) t))
      (require library))))
