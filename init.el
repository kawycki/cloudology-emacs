(menu-bar-mode 0)

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

(setq inhibit-startup-screen t
      auto-save-default nil
      make-backup-file nil
      create-lockfiles nil)

(column-number-mode)

;; (fido-mode)

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
	     '("elpa-devel" . "https://elpa.gnu.org/devel/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-verbose t
      use-package-always-ensure t
      use-package-always-defer t
      use-package-compute-statistics t)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package company)

(use-package dired-sidebar
  :bind (("C-c d" . 'dired-sidebar-toggle-sidebar)))

(use-package doom-modeline
  :if (display-graphic-p)
  :init
  (doom-modeline-mode))

(use-package csharp-mode
  :config
  (add-hook 'csharp-mode-hook 'lsp-deferred))

(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'lsp-deferred))

(use-package lsp-mode)

(use-package restart-emacs)

(use-package yaml-mode)

(use-package which-key
  :init
  (which-key-mode))

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)
  )

(use-package modus-vivendi-theme)

(use-package modus-operandi-theme)

(load-theme 'modus-operandi t)

(cua-mode)
(recentf-mode)
(show-paren-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline all-the-icons dired-sidebar company company-mode restart-emacs csharp-mode vertico modus-operandi-theme modus-vivendi-theme which-key lsp-mode go-mode yaml-mode use-package))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
