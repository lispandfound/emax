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
              (setq golden-ratio-exclude-modes '("bs-mode"
                                                 "calc-mode"
                                                 "ediff-mode"
                                                 "dired-mode"
                                                 "gud-mode"
                                                 "gdb-locals-mode"
                                                 "gdb-registers-mode"
                                                 "gdb-breakpoints-mode"
                                                 "gdb-threads-mode"
                                                 "gdb-frames-mode"
                                                 "gdb-inferior-io-mode"
                                                 "gud-mode"
                                                 "gdb-inferior-io-mode"
                                                 "gdb-disassembly-mode"
                                                 "gdb-memory-mode"
                                                 "restclient-mode"
                                                 "speedbar-mode"
                                                 ))
              (setq golden-ratio-extra-commands
                    (append golden-ratio-extra-commands
                            '(ace-window
                              ace-delete-window
                              ace-select-window
                              ace-swap-window
                              ace-maximize-window
                              avy-pop-mark
                              evil-avy-goto-word-or-subword-1
                              evil-avy-goto-line
                              windmove-left
                              windmove-right
                              windmove-up
                              windmove-down
                              evil-window-delete
                              evil-window-split
                              evil-window-vsplit
                              evil-window-left
                              evil-window-right
                              evil-window-up
                              evil-window-down
                              evil-window-bottom-right
                              evil-window-top-left
                              evil-window-mru
                              evil-window-next
                              evil-window-prev
                              evil-window-new
                              evil-window-vnew
                              evil-window-rotate-upwards
                              evil-window-rotate-downwards
                              evil-window-move-very-top
                              evil-window-move-far-left
                              evil-window-move-far-right
                              evil-window-move-very-bottom
                              select-window-0
                              select-window-1
                              select-window-2
                              select-window-3
                              select-window-4
                              select-window-5
                              select-window-6
                              select-window-7
                              select-window-8
                              select-window-9
                              buf-move-left
                              buf-move-right
                              buf-move-up
                              buf-move-down
                              ess-eval-buffer-and-go
                              ess-eval-function-and-go
                              ess-eval-line-and-go))

                    )

                    (golden-ratio-mode 1)
              ))
  (use-package powerline
    :ensure t)
  ) 
