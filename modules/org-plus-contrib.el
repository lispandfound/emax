(defconfig org-plus-contrib
  (use-package org
    :mode ("\\.org$" . org-mode)
    :commands (org-clock-out org-occur-in-agenda-files org-agenda-files org-mode)
    :defer t
    :ensure org-plus-contrib
    :init (progn
            (setq org-log-done t
                  org-startup-with-inline-images t
                  org-src-fontify-natively t)
            (general-evil-define-key '(normal visual) org-mode-map
              :prefix ","
              "'" 'org-edit-special
              "c" 'org-capture
              "d" 'org-deadline
              "D" 'org-insert-drawer
              "e" 'org-export-dispatch
              "f" 'org-set-effort
              "P" 'org-set-property
              ":" 'org-set-tags

              "a" 'org-agenda
              "b" 'org-tree-to-indirect-buffer
              "A" 'org-archive-subtree
              "l" 'org-open-at-point
              "T" 'org-show-todo-tree

              "." 'org-time-stamp
              "!" 'org-time-stamp-inactive

              ;; headings
              "hi" 'org-insert-heading-after-current
              "hI" 'org-insert-heading

              ;; More cycling options (timestamps, headlines, items, properties)
              "L" 'org-shiftright
              "H" 'org-shiftleft
              "J" 'org-shiftdown
              "K" 'org-shiftup

              ;; Change between TODO sets
              "C-S-l" 'org-shiftcontrolright
              "C-S-h" 'org-shiftcontrolleft
              "C-S-j" 'org-shiftcontroldown
              "C-S-k" 'org-shiftcontrolup

              ;; Subtree editing
              "Sl" 'org-demote-subtree
              "Sh" 'org-promote-subtree
              "Sj" 'org-move-subtree-down
              "Sk" 'org-move-subtree-up

              ;; tables
              "ta" 'org-table-align
              "tb" 'org-table-blank-field
              "tc" 'org-table-convert
              "tdc" 'org-table-delete-column
              "tdr" 'org-table-kill-row
              "te" 'org-table-eval-formula
              "tE" 'org-table-export
              "th" 'org-table-previous-field
              "tH" 'org-table-move-column-left
              "tic" 'org-table-insert-column
              "tih" 'org-table-insert-hline
              "tiH" 'org-table-hline-and-move
              "tir" 'org-table-insert-row
              "tI" 'org-table-import
              "tj" 'org-table-next-row
              "tJ" 'org-table-move-row-down
              "tK" 'org-table-move-row-up
              "tl" 'org-table-next-field
              "tL" 'org-table-move-column-right
              "tn" 'org-table-create
              "tN" 'org-table-create-with-table.el
              "tr" 'org-table-recalculate
              "ts" 'org-table-sort-lines
              "ttf" 'org-table-toggle-formula-debugger
              "tto" 'org-table-toggle-coordinate-overlays
              "tw" 'org-table-wrap-region

              ;; Multi-purpose keys
              "," 'org-ctrl-c-ctrl-c
              "*" 'org-ctrl-c-star
              "RET" 'org-ctrl-c-ret
              "-" 'org-ctrl-c-minus
              "^" 'org-sort
              "/" 'org-sparse-tree

              "I" 'org-clock-in
              "n" 'org-narrow-to-subtree
              "N" 'widen
              "O" 'org-clock-out
              "q" 'org-clock-cancel
              "R" 'org-refile
              "s" 'org-schedule

              ;; insertion of common elements
              "il" 'org-insert-link
              "if" 'org-footnote-new
              ))
    :config (progn
              (use-package org-agenda
                :config (general-evil-define-key '(normal visual) org-agenda-mode-map
                                  "j" 'org-agenda-next-line
                                  "k" 'org-agenda-previous-line))
              
              (add-hook 'org-mode-hook 'org-indent-mode)))
   (use-package evil-org
     :commands evil-org-mode
     :ensure t
     :init
     (add-hook 'org-mode-hook 'evil-org-mode))
  (use-package org-bullets
    :ensure t
    :defer t
    :commands org-bullets-mode
    :init
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
  (use-package org-pomodoro
    :commands org-pomodoro
    :ensure t
    :defer t
    :init
    (general-evil-define-key '(normal visual) org-mode-map
      :prefix ","
      "p" 'org-pomodoro)))
