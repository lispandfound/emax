(defconfig clojure
  (use-package cider
    :ensure t
    :defer t
    :init
    (progn
      (setq cider-stacktrace-default-filters '(tooling dup)
            cider-repl-pop-to-buffer-on-connect nil
            cider-prompt-save-file-on-load nil
            cider-repl-use-clojure-font-lock t)
      (add-hook 'clojure-mode-hook 'cider-mode)
      (general-evil-define-key 'normal cider-stacktrace-mode-map
        "C-j" 'cider-stacktrace-next-cause
        "C-k" 'cider-stacktrace-previous-cause
        "TAB" 'cider-stacktrace-cycle-current-cause
        "0"   'cider-stacktrace-cycle-all-causes
        "1"   'cider-stacktrace-cycle-cause-1
        "2"   'cider-stacktrace-cycle-cause-2
        "3"   'cider-stacktrace-cycle-cause-3
        "4"   'cider-stacktrace-cycle-cause-4
        "5"   'cider-stacktrace-cycle-cause-5
        "a"   'cider-stacktrace-toggle-all
        "c"   'cider-stacktrace-toggle-clj
        "d"   'cider-stacktrace-toggle-duplicates
        "J"   'cider-stacktrace-toggle-java
        "r"   'cider-stacktrace-toggle-repl
        "T" 'cider-stacktrace-toggle-tooling)
      (general-evil-define-key '(normal visual) clojure-mode-map
        :prefix ","
        "hh" 'cider-doc
        "hg" 'cider-grimoire
        "hj" 'cider-javadoc

        "eb" 'cider-eval-buffer
        "ee" 'cider-eval-last-sexp
        "ef" 'cider-eval-defun-at-point
        "er" 'cider-eval-region
        "ew" 'cider-eval-last-sexp-and-replace

        "fb" 'cider-format-buffer

        "gb" 'cider-pop-back
        "ge" 'cider-jump-to-compilation-error
        "gg" 'cider-find-var
        "gr" 'cider-jump-to-resource

        "sb" 'cider-load-buffer
        "sc" 'cider-connect
        "si" 'cider-jack-in
        "sI" 'cider-jack-in-clojurescript
        "sq" 'cider-quit
        "ss" 'cider-switch-to-repl-buffer
        "sx" 'cider-refresh
        "di" 'cider-inspect)))
  (use-package clojure-mode
    :mode ("\\.clj$" . clojure-mode)
    :defer t
    :ensure t
    :config
      (define-clojure-indent
        ;; Compojure
        (ANY 2)
        (DELETE 2)
        (GET 2)
        (HEAD 2)
        (POST 2)
        (PUT 2)
        (context 2)
        (defroutes 'defun)
        ;; Cucumber
        (After 1)
        (Before 1)
        (Given 2)
        (Then 2)
        (When 2)
        ;; Schema
        (s/defrecord 2)
        ;; test.check
        (for-all 'defun))))
