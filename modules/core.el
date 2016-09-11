(defconfig core
  (use-package ivy
    :ensure t
    :diminish (ivy-mode . "")
    :init (ivy-mode 1))
  (use-package counsel
    :ensure t)
  (use-package general
    :ensure t
    :init (setq general-default-keymaps 'evil-normal-state-map
                general-default-prefix emax-leader)
    :config (require 'keybinds))
  (require 'evil)
  (use-package which-key
    :ensure t
    :diminish ""
    :config (which-key-mode))
  (use-package golden-ratio
    :ensure t
    :diminish (golden-ratio-mode . "")
    :config (progn
              (defvar golden-ratio-selected-window
                (frame-selected-window)
                "Selected window.")

              (defun golden-ratio-set-selected-window
                  (&optional window)
                "Set selected window to WINDOW."
                (setq-default
                 golden-ratio-selected-window (or window (frame-selected-window))))

              (defun golden-ratio-selected-window-p
                  (&optional window)
                "Return t if WINDOW is selected window."
                (eq (or window (selected-window))
                    (default-value 'golden-ratio-selected-window)))

              (defun golden-ratio-maybe
                  (&optional arg)
                "Run `golden-ratio' if `golden-ratio-selected-window-p' returns nil."
                (interactive "p")
                (unless (golden-ratio-selected-window-p)
                  (golden-ratio-set-selected-window)
                  (golden-ratio arg)))

              (add-hook 'buffer-list-update-hook #'golden-ratio-maybe)
              (add-hook 'focus-in-hook           #'golden-ratio)
              (add-hook 'focus-out-hook          #'golden-ratio)
              (golden-ratio-mode 1)))
  (use-package powerline
    :ensure t)
  ) 
