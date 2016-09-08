(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
(load-file "~/.emax")
(user-init)
(add-to-list 'enabled-modules 'core)
(el-init-load "~/.emacs.d/modules"
	      :subdirectories '(".")
	      :wrappers '(el-init-require/record-error
			  el-init-require/system-case))
(user-config)

