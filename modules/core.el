(defconfig core
  ;;  (require 'ui)

  ;; Config functions
  (defun jake/prefix-bind (mode key command)
    (case mode
      ('normal (general-nmap :prefix emax-leader
			     key command))
      ('visual (general-mmap :prefix emax-leader
			     key command))
      (t (general-define-key key command))
      ))
  (use-package evil
    :ensure t
    :config (evil-mode 1)
    )
  (use-package ivy
    :ensure t
    :diminish (ivy-mode . "")
    :init (ivy-mode 1))
  (use-package general
    :init (setq general-default-keymaps 'evil-normal-state-map)
    :config (evil-general-setup t))
  )
