(menu-bar-mode 0)

(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))

(setq inhibit-startup-screen t
      auto-save-default nil
      make-backup-files nil
      create-lockfiles nil)

(column-number-mode)

;;; Scrolling

(setq hscroll-margin 2
      hscroll-step 1
      scroll-conservatively 101
      scroll-margin 0
      scroll-preserve-screen-position t
      auto-window-vscroll nil
      ;; mouse
      mouse-wheel-scroll-amount '(2 ((shift) . hscroll))
      mouse-wheel-scroll-amount-horizontal 2)

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

(use-package diff-hl
  :demand t
  :config
  (global-diff-hl-mode)
  (diff-hl-margin-mode))

(use-package diredfl
  :demand t
  :config
  (diredfl-global-mode))

(use-package dired-sidebar
  :bind (("C-c d" . 'dired-sidebar-toggle-sidebar)))

(use-package doom-modeline
  :if (display-graphic-p)
  :init
  (doom-modeline-mode))

(use-package csharp-mode
  :config
  (add-hook 'csharp-mode-hook 'lsp-deferred))

(use-package fsharp-mode)

(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'lsp-deferred))

(use-package json-mode)

(use-package json-par
  :hook (json-mode . json-par-mode))

(use-package lsp-mode
  :commands (lsp-register-client))

(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1))

(use-package marginalia
  :hook (after-init . marginalia-mode))

(use-package orderless
  :demand t
  :config
  (setq completion-styles '(orderless)))

(use-package projectile
  :hook (after-init . projectile-mode)
  :bind (("C-c p" . projectile-command-map))
  :config
  (projectile-update-mode-line))

(use-package recentf
  :ensure nil
  :bind (("C-c r" . 'recentf-open-files)))

(use-package restart-emacs)

(use-package terraform-mode
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("/home/linuxbrew/.linuxbrew/bin/terraform-ls" "serve"))
                  :major-modes '(terraform-mode)
                  :server-id 'terraform-ls))

  (add-hook 'terraform-mode-hook 'lsp-deferred))

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

(load-theme 'modus-vivendi t)

(cua-mode)
(recentf-mode)
(show-paren-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(diff-hl fsharp-mode orderless magit diredfl projectile json-par json-mode marginalia terraform-mode doom-modeline all-the-icons dired-sidebar company company-mode restart-emacs csharp-mode vertico modus-operandi-theme modus-vivendi-theme which-key lsp-mode go-mode yaml-mode use-package))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
