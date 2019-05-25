(package-initialize)
(menu-bar-mode -1)

(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(setq backup-directory-alist
      `((".*" . "~/.emacs.d/saves/")))

(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/saves/" t)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(set-terminal-parameter nil 'background-mode 'dark)
