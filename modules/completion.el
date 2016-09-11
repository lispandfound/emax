(defconfig completion
  (use-package company-mode
    :ensure company
    :commands (global-company-mode)
    :init (add-hook 'after-init-hook '(lambda ()
                                        (global-company-mode)
                                        (diminish 'company-mode "λac")))))
