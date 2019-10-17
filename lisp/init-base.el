;;; init-base.el ---                               -*- lexical-binding: t; -*-

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

(setq-default truncate-lines t
              indent-tabs-mode nil)

(setq auto-save-default nil
      make-backup-file nil
      create-lockfiles nil
      load-prefer-newer t

      inhibit-compacting-font-caches t
      idle-update-delay 2
      bidi-display-reordering nil
      w32-pipe-read-delay 0

      frame-title-format '(buffer-file-name "%f" ("%b")))

(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(prefer-coding-system 'utf-8)

(fset 'yes-or-no-p 'y-or-n-p)

;; enabling Common User Access style editing
(cua-mode)

(use-package autoinsert
  :ensure nil
  :demand t
  :config
  (auto-insert-mode))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(use-package beginend
  :demand t
  :config
  (beginend-global-mode))

(use-package command-log-mode)

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package gcmh
  :config
  (gcmh-mode 1))

(use-package no-littering
  :demand t)

(use-package persistent-scratch
  :demand t
  :config
  (persistent-scratch-setup-default))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :config
  (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
  (add-to-list 'recentf-exclude "autoloads.el"))

(use-package restart-emacs)

(require 'quelpa)

(use-package so-long
  :ensure nil
  :demand t
  :quelpa (so-long :fetcher github :repo "kamil-wydrzycki/so-long")
  :config
  (global-so-long-mode))

(use-package text-mode
  :ensure nil
  :hook (text-mode . visual-line-mode))

(use-package windmove
  :ensure nil
  :demand t
  :config
  (windmove-default-keybindings))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(provide 'init-base)
;;; init-base.el ends here
