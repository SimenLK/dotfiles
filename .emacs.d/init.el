(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(display-line-numbers-type (quote relative))
 '(evil-want-C-u-scroll t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (haskell-mode evil-surround python-django django-mode markdown-mode dotnet elpy python magit fsharp-mode evil ##)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; Evil stuff
(require 'evil)
(evil-mode 1)

(require 'evil-surround)
(global-evil-surround-mode 1)

;;; Terminal
(setq system-uses-terminfo nil)

;;; Spaces
(setq-default indent-tabs-mode nil)

;;; Hide toolbar
(tool-bar-mode -1)

;;; Trailing white space
(setq show-trailing-whitespace t)

;;; Vim key bindings

;;; key-chord
(setq key-chord-two-keys-delay 0.5)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;;; Sensible defaults
(load-file "~/.emacs.d/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

;;; Python
(elpy-enable)

;;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;;; F#
(require 'fsharp-mode)
(setq-default fsharp-indent-offset 4)
(add-hook 'fsharp-mode-hook 'highlight-indentation-mode)
(setq inferior-fsharp-program "dotnet fsi")

(require 'dotnet)
(add-hook 'fsharp-mode-hook 'dotnet-mode)

(require 'eglot-fsharp)
