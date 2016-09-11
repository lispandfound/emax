(defconfig common-lisp
  (require 'module-funcs)
  (use-package slime
    :commands slime-mode
    :diminish (slime-mode . "λsl")
    :ensure t
    :init (progn
            (setq
             inferior-lisp-program "sbcl" ;; Should change if another lisp is used
             slime-complete-symbol*-fancy t
             slime-complete-symbol-function 'slime-fuzzy-complete-symbol
             slime-contribs '(slime-fancy slime-indentation slime-sbcl-exts slime-scratch))
            (add-hook 'lisp-mode-hook #'slime-mode))
    :config (progn
              (slime-setup)
              (define-key slime-mode-map [(tab)] 'slime-fuzzy-complete-symbol)
              (general-evil-define-key '(normal visual) lisp-mode-map
                :prefix ","
                "cc" 'slime-compile-file
                "cC" 'slime-compile-and-load-file
                "cl" 'slime-load-file
                "cf" 'slime-compile-defun
                "cr" 'slime-compile-region
                "cn" 'slime-remove-notes

                "eb" 'slime-eval-buffer
                "ef" 'slime-eval-defun
                "eF" 'slime-undefine-function
                "ee" 'slime-eval-last-sexp
                "er" 'slime-eval-region

                "gg" 'slime-inspect-definition
                "gb" 'slime-pop-find-definition-stack
                "gn" 'slime-next-note
                "gN" 'slime-previous-note

                "ha" 'slime-apropos
                "hA" 'slime-apropos-all
                "hd" 'slime-disassemble-symbol
                "hh" 'slime-describe-symbol
                "hH" 'slime-hyperspec-lookup
                "hp" 'slime-apropos-package
                "ht" 'slime-toggle-trace-fdefinition
                "hT" 'slime-untrace-all
                "h<" 'slime-who-calls
                "h>" 'slime-calls-who

                "hr" 'slime-who-references
                "hm" 'slime-who-macroexpands
                "hs" 'slime-who-specializes

                "ma" 'slime-macroexpand-all
                "mo" 'slime-macroexpand-1

                "se" 'slime-eval-last-expression-in-repl
                "si" 'slime
                "sq" 'slime-quit-lisp

                "tf" 'slime-toggle-fancy-trace)))
  (when (jake/module-is-enabled 'completion)
    (require 'completion)
    (use-package slime-company
      :defer t
      :ensure t
      :init (add-to-list 'slime-contribs 'slime-company)))
  (use-package eldoc
    :defer t
    :diminish (eldoc-mode . "λel") )) 
