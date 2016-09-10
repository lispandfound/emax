(defconfig keybinds
  (defun jake/goto-config ()
    (interactive)
    (find-file "~/.emax"))
  (general-evil-setup t)
  (nmap
   ":" 'execute-extended-command
   "ac" 'calculator-dispatch
   "ad" 'dired
   "ap" 'list-processes
   "aP" 'proced
   "au" 'undo-tree-visualize
   "bd" 'kill-this-buffer
   "bk" 'kill-buffer
   "bw" 'read-only-mode
   "bb" 'ivy-switch-buffer
   "cC" 'compile
   "ck" 'kill-compilation
   "cr" 'recompile
   "Ed" 'jake/goto-config
   "fg" 'rgrep
   "ff" 'counsel-find-file
   "fl" 'find-file-literally
   "fL" 'counsel-locate
   "fr" 'counsel-recentf
   "fS" 'evil-write-all
   "fvd" 'add-dir-local-variable
   "fvf" 'add-file-local-variable
   "fvp" 'add-file-local-variable-prop-line
   "im" 'counsel-woman
   "nr" 'narrow-to-region
   "np" 'narrow-to-page
   "nf" 'narrow-to-defun
   "nw" 'widen
   "ss" 'swiper
   "sj" 'counsel-imenu
   "/" 'counsel-pt
   "fs" 'save-buffer
   "qq" 'delete-frame
   "qz" 'evil-save-and-quit
   "w2"  'split-window-vertically
   "w3" 'split-window-horizontally
   "wc" 'delete-window
   "wH" 'evil-window-move-far-left
   "wh" 'evil-window-left
   "wJ" 'evil-window-move-very-bottom
   "wj" 'evil-window-down
   "wK" 'evil-window-move-very-top
   "wk" 'evil-window-up
   "wL" 'evil-window-move-far-right
   "wl" 'evil-window-right
   "wm" 'delete-other-windows
   "wo" 'other-frame
   "w-" 'split-window-below
   "ww" 'other-window
   "w/" 'split-window-right
   "w=" 'balance-windows
   "xaa" 'align)
  )
