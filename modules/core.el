(defconfig core
  (use-package ivy
    :ensure t
    :diminish (ivy-mode . "")
    :init (ivy-mode 1))
  (use-package general
    :ensure t
    :init (setq general-default-keymaps 'evil-normal-state-map
                general-default-prefix emax-leader)
    :config (require 'keybinds))
  (require 'evil)
  (use-package which-key
    :ensure t
    :config (which-key-mode))
  (use-package golden-ratio
    :ensure t
    :diminish (golden-ratio-mode . "")
    :config (progn
              (add-hook 'buffer-list-update-hook #'golden-ratio)
              (golden-ratio-mode 1))))
