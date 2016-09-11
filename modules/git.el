(defconfig git
  (use-package magit
    :ensure t
    :commands (magit-blame-mode
               magit-commit-popup
               magit-diff-popup
               magit-fetch-popup
               magit-log-popup
               magit-pull-popup
               magit-push-popup
               magit-status)
    :init
     (nmap
        "gb" 'spacemacs/git-blame-micro-state
        "gc" 'magit-commit-popup
        "gC" 'magit-checkout
        "gd" 'magit-diff-popup
        "gD" 'spacemacs/magit-diff-head
        "ge" 'magit-ediff-compare
        "gE" 'magit-ediff-show-working-tree
        "gf" 'magit-fetch-popup
        "gF" 'magit-pull-popup
        "gi" 'magit-init
        "gl" 'magit-log-popup
        "gL" 'magit-log-buffer-file
        "gP" 'magit-push-popup
        "gs" 'magit-status
        "gS" 'magit-stage-file
        "gU" 'magit-unstage-file)
     :config (diminish 'magit-auto-revert-mode))
  (with-eval-after-load 'magit
    (use-package evil-magit
      :ensure t)))
