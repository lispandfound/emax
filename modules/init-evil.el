(defconfig init-evil
  (use-package evil
    :ensure t
    :config (evil-mode 1))
  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode 1))
  (use-package bind-map
    :ensure t)
  (use-package smartparens
    :ensure t
    :commands smartparens-mode
    :init (add-hook 'prog-mode-hook #'smartparens-mode)
    :config (require 'smartparens-config))
  (use-package evil-nerd-commenter
    :ensure t
    :commands (evilnc-comment-operator
               evilnc-comment-or-uncomment-lines
               evilnc-quick-comment-or-uncomment-to-the-line
               evilnc-comment-or-uncomment-paragraphs
               comment-or-uncomment-region
               evilnc-toggle-invert-comment-line-by-line
               evilnc-comment-operator)
    :defer t
    :init (progn
              (define-key evil-normal-state-map "gc" 'evilnc-comment-operator)
              (general-define-key :states '(normal visual)
                                  :keymaps 'global
                  "cl" 'evilnc-comment-or-uncomment-lines
                "ci" 'evilnc-quick-comment-or-uncomment-to-the-line
                "cc" 'evilnc-copy-and-comment-lines
                "cp" 'evilnc-comment-or-uncomment-paragraphs
                "cr" 'comment-or-uncomment-region
                "cv" 'evilnc-toggle-invert-comment-line-by-line
                "\\" 'evilnc-comment-operator ; if you prefer backslash key
                )))
  (use-package evil-lisp-state
    :ensure t
    :init (setq evil-lisp-state-global t)
    :config (general-define-key :states '(normal visual) :keymaps 'global
              "k" evil-lisp-state-map))
  (diminish 'undo-tree-mode "")

  ;; Fix for dired
  (general-evil-define-key 'normal dired-mode-map
    "h" 'dired-up-directory
    "j" 'dired-next-line
    "k" 'dired-previous-line
    "l" 'dired-find-alternate-file))
