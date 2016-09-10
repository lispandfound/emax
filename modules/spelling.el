(defconfig spelling
  (use-package auto-dictionary
    :defer t
    :ensure t
    :init (add-hook 'flypsell-mode-hook 'auto-dictionary-mode))
  (use-package flyspell
    :defer t
    :diminish (flyspell-mode "λfs")
    :init
    (progn
      (add-hook 'text-mode-hook 'flyspell-mode)
      (add-hook 'prog-mode-hook 'flyspell-prog-mode)))
  (use-package flyspell-correct-ivy
    :commands (flyspell-correct-word-generic)
    :ensure flyspell-correct
    :init (general-define-key
              :states '(normal visual)
              :keymaps 'global
              "z=" 'flyspell-correct-word-generic)))
