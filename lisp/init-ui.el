;;; init-ui.el ---                               -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Kamil Wydrzycki

;; Author: Kamil Wydrzycki <kamwyd@gmail.com>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(setq inhibit-startup-screen t
      use-dialog-box nil
      use-file-dialog nil)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)
(blink-cursor-mode 0)

;; Favor horizontal splits over vertical ones
(setq split-width-threshold nil
      split-height-threshold 160)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-whell-progressive-speed nil
      scroll-step 1
      scroll-margin 0
      scroll-conservatively 1000)

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package doom-themes
  :config
  (doom-themes-visual-bell-config))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-project-root t
        doom-modeline-buffer-file-name-style 'truncate-upto-project
        doom-modeline-minor-modes nil))

(load-theme 'doom-nord t)

(use-package ediff
  :ensure nil
  :hook (ediff-quit . winner-undo)
  :config
  (setq ediff-diff-options "-w"
        ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

(use-package hydra
  :demand t
  :config
  (use-package pretty-hydra)
  (use-package major-mode-hydra))

(use-package page-break-lines
  :hook ((prog-mode . page-break-lines-mode)))

(use-package paren
  :ensure nil
  :demand t
  :hook (find-file . show-paren-mode)
  :config
  (setq show-paren-delay 0.1
        show-paren-when-point-inside-paren t))

(use-package rainbow-delimiters
  :hook ((emacs-lisp-mode lisp-mode) . rainbow-delimiters-mode))

(use-package treemacs
  :bind ([f8] . treemacs)
  :config
  (setq treemacs-follow-after-init t
        treemacs-is-never-other-window t
        treemacs-sorting 'alphabetic-case-insensitive-desc))

(use-package treemacs-icons-dired
  :demand t
  :config
  (treemacs-icons-dired-mode))

(provide 'init-ui)
;;; init-ui.el ends here
