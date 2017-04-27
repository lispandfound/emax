(defconfig syntax-checking
  (use-package flycheck
    :ensure t
    :diminish (flycheck-mode . "λfl")
    :commands (flycheck-mode flycheck-list-errors flycheck-buffer)
    :init (progn (setq ;; Removed checks on idle/change for snappiness
                  flycheck-check-syntax-automatically '(save mode-enabled)
                  flycheck-highlighting-mode 'symbols
                  flycheck-disabled-checkers '(emacs-lisp-checkdoc make))

                 (general-evil-define-key '(normal) flycheck-error-list-mode-map
                   "C-n" #'flycheck-error-list-next-error
                   "C-p" #'flycheck-error-list-previous-error
                   "j"   #'flycheck-error-list-next-error
                   "k"   #'flycheck-error-list-previous-error
                   "RET" #'flycheck-error-list-goto-error)
                 
                 (add-hook 'prog-mode-hook #'global-flycheck-mode)))
  (use-package flycheck-pos-tip
    :ensure t
    :after flycheck
    :config
    (progn (setq flycheck-pos-tip-timeout 10
                 flycheck-display-errors-delay 0.5)
           (flycheck-pos-tip-mode +1))))
