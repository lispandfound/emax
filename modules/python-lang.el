(defconfig python-lang
  (use-package anaconda-mode
    :defer t
    :ensure t
    :init
    (add-hook 'python-mode-hook 'anaconda-mode)
    :config
    (progn

      (general-evil-define-key  '(normal visual) python-mode-map
        :prefix ","
        "hh" 'anaconda-mode-show-doc
        "ga" 'anaconda-mode-find-assignments
        "gb" 'anaconda-mode-go-back
        "gu" 'anaconda-mode-find-references)

      (diminish 'anaconda-mode "")))
  (use-package company-anaconda
    :ensure t
    :defer t
    :init (eval-after-load "company"
            '(add-to-list 'company-backends '(company-anaconda))))
  
  (use-package python
    :defer t
    :init
    (progn
      (defun inferior-python-setup-hook ()
        (setq indent-tabs-mode t))

      (add-hook 'inferior-python-mode-hook #'inferior-python-setup-hook)
      (general-evil-define-key '(normal visual) python-mode-map :prefix ","
            "sB" 'python-shell-send-buffer-switch
            "sb" 'python-shell-send-buffer
            "sF" 'python-shell-send-defun-switch
            "sf" 'python-shell-send-defun
            "si" 'python-start-or-switch-repl
            "sR" 'python-shell-send-region-switch
            "sr" 'python-shell-send-region)
      )
    :config
    (progn
      ;; add support for `ahs-range-beginning-of-defun' for python-mode
      (with-eval-after-load 'auto-highlight-symbol
        (add-to-list 'ahs-plugin-bod-modes 'python-mode))

      (defun python-shell-send-buffer-switch ()
        "Send buffer content to shell and switch to it in insert mode."
        (interactive)
        (python-shell-send-buffer)
        (python-shell-switch-to-shell)
        (evil-insert-state))

      (defun python-shell-send-defun-switch ()
        "Send function content to shell and switch to it in insert mode."
        (interactive)
        (python-shell-send-defun nil)
        (python-shell-switch-to-shell)
        (evil-insert-state))

      (defun python-shell-send-region-switch (start end)
        "Send region content to shell and switch to it in insert mode."
        (interactive "r")
        (python-shell-send-region start end)
        (python-shell-switch-to-shell)
        (evil-insert-state))

      (defun python-start-or-switch-repl ()
        "Start and/or switch to the REPL."
        (interactive)
        (let ((shell-process
               (or (python-shell-get-process)
                   ;; `run-python' has different return values and different
                   ;; errors in different emacs versions. In 24.4, it throws an
                   ;; error when the process didn't start, but in 25.1 it
                   ;; doesn't throw an error, so we demote errors here and
                   ;; check the process later
                   (with-demoted-errors "Error: %S"
                     ;; in Emacs 24.5 and 24.4, `run-python' doesn't return the
                     ;; shell process
                     (call-interactively #'run-python)
                     (python-shell-get-process)))))
          (unless shell-process
            (error "Failed to start python shell properly"))
          (pop-to-buffer (process-buffer shell-process))
          (evil-insert-state)))

       
      ))

  )
