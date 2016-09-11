(defconfig themes
  (load-file custom-file)
  (defmacro jake|use-theme (theme package)
    `(use-package ,(eval package)
       :ensure t
       :config (load-theme ',(eval theme))))
  (if emax-theme-package
      (jake|use-theme emax-theme emax-theme-package)
    (load-theme emax-theme))

  ;; Should also handle fonts and such
  (defmacro jake|load-font (font-cons)
    (let ((font-alist (append '('default nil :family) (eval font-cons))))
      `(progn
         (set-face-attribute ,@font-alist))))
  (jake|load-font emax-default-font)
  (setq powerline-height (truncate (* emax-mode-line-scale (frame-char-height))))
  (when emax-use-airline
    (use-package airline-themes
      :ensure t
      :config (load-theme emax-airline-theme)
      ))
  )
