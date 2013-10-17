;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs miscellaneous functions.
;;
;; Francisco Soto <ebobby@ebobby.org>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun run-sbcl ()
  "Starts SLIME with Steel Bank CL."
  (interactive)
  (setq inferior-lisp-program "/opt/local/bin/sbcl")
  (slime))

(defun run-ccl ()
  "Starts SLIME with Clozure CL."
  (interactive)
  (setq inferior-lisp-program "/opt/local/bin/ccl64")
  (slime))

(defun run-clisp ()
  "Starts SLIME with CLisp."
  (interactive)
  (setq inferior-lisp-program "/opt/local/bin/clisp")
  (slime))
