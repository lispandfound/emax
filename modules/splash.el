(defconfig splash
  (setq inhibit-splash-screen t)
  (defconst splash-mode-buffer-name "*emax*")
  (define-derived-mode emax-buffer-mode fundamental-mode "Splash"
    :group 'splash
    :syntax-table nil
    :abbrev-table nil
    (setq buffer-read-only t
          truncate-lines t)
    )
  (defun jake--center-buf ()
      (set-window-margins (car (get-buffer-window-list (current-buffer) nil t))
                          (- (/ (window-width) 2) 28)
                          nil))
  (defun jake/goto-splash ()
    (interactive)
    (unless (buffer-live-p splash-mode-buffer-name)
      (with-current-buffer (get-buffer-create splash-mode-buffer-name)
        (insert-file-contents "~/.emacs.d/boot.txt")
        (emax-buffer-mode)))
    (switch-to-buffer splash-mode-buffer-name)
    (jake--center-buf)))
