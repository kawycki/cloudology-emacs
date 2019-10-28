;;; init-dired.el ---                                -*- lexical-binding: t; -*-

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

(use-package dired
  :ensure nil
  :bind (("C-x j" . dired-jump)
         :map dired-mode-map
         ("C-c f" . find-lisp-find-dired))
  :config
  (setq dired-recursive-copies 'always
        dired-recursive-deletes 'top)
  (when (executable-find "ls")
    (setq ls-lisp-use-insert-directory-program t
          dired-listing-switches "-alh --group-directories-first")))

(use-package diredfl
  :demand t
  :hook (dired-mode . diredfl-mode))

(use-package dired-x
  :ensure nil
  :demand t
  :hook (dired-mode . dired-omit-mode)
  :config
  (add-to-list 'dired-omit-extensions ".sln")
  (add-to-list 'dired-omit-extensions ".csproj")
  (setq dired-omit-verbose nil))

(use-package dired-hacks-utils)

(use-package dired-subtree)

(use-package dired-sidebar
  :bind ([f6] . 'dired-sidebar-toggle-with-current-directory)
  :config
  (use-package vscode-icon
    :config
    (add-to-list 'vscode-icon-file-alist '("cs" . "csharp")))

  (setq dired-sidebar-follow-file-at-point-on-toggle-open t
        dired-sidebar-open-file-in-most-recently-used-window t
        dired-sidebar-recenter-cursor-on-follow-file t
        dired-sidebar-should-follow-file nil
        dired-sidebar-stale-buffer-time-idle-delay 0.1
        dired-sidebar-theme 'none
        dired-sidebar-refresh-on-projectile-switch t
        dired-sidebar-use-custom-modeline nil
        dired-sidebar-use-magit-integration t)

  (add-to-list 'dired-sidebar-special-refresh-commands 'dired-sidebar-find-file)
  (add-to-list 'dired-sidebar-special-refresh-commands 'dired-sidebar-subtree-toggle)
  (add-to-list 'dired-sidebar-special-refresh-commands 'dired-sidebar-up-directory))

(provide 'init-dired)
;;; init-dired.el ends here
