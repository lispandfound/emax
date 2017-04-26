(defconfig splash
  (defun get-string-from-file (file)
    (with-temp-buffer
      (insert-file-contents file)
      (buffer-substring-no-properties (point-min) (point-max))))
(use-package pretty-splashscreen-mode
    :load-path "local/pretty-splashscreen-mode"
    :commands pspl/goto-splash
    :init (progn
            (setq
             ;; Set the splashscreen buffer name
             pretty-splashscreen-buffer-name "*emax*"
             ;; Set the contents of the splashscreen
             pretty-splashscreen-buffer-contents (get-string-from-file "~/.emacs.d/boot.txt"))
            ;; Add a startup hook to swap to the splashscreen. `get-string-from-file' is an external, unrelated function
            (setq initial-buffer-choice #'pspl/goto-splash))))
