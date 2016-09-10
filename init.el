(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
;; use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(defmacro defconfig (module &rest body)
  `(when (member ',module enabled-modules)
     ,@body
     (provide ',module)))
;; el-init
(use-package el-init
  :ensure t)
(defvar enabled-modules '())
(setq custom-file "~/.emacs.d/custom.el")
(load-file "~/.emax")
(user-init)
(mapcar (lambda (module) (add-to-list 'enabled-modules module)) '(defaults core keybinds themes splash init-evil))
(el-init-load "~/.emacs.d/modules"
	      :subdirectories '(".")
	      :wrappers '(el-init-require/record-error
			  el-init-require/system-case))
(user-config)
(add-hook 'after-init-hook 'jake/goto-splash)
