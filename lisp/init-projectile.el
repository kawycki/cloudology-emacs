;;; init-projectile.el ---                           -*- lexical-binding: t; -*-

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

(use-package projectile
  :hook (after-init . projectile-mode)
  :bind (("C-c p" . projectile-command-map))
  :init
  (setq projectile-sort-order 'recentf
        projectile-use-git-grep t)
  :config
  (setq projectile-track-known-projects-automatically nil
        projectile-completion-system 'ivy
        projectile-switch-project-action 'projectile-dired)

  (projectile-update-mode-line)

  (let ((command
         (cond
          ((executable-find "rg")
           (let ((rg-cmd ""))
             (dolist (dir projectile-globally-ignored-directories)
               (setq rg-cmd (format "%s --glob '!%s'" rg-cmd dir)))
             (concat "rg -0 --files --color=never --hidden" rg-cmd)))
          ((executable-find "ag")
           (concat "ag -0 -l --nocolor --hidden"
                   (mapconcat #'identity
                              (cons "" projectile-globally-ignored-directories)
                              " --ignore-dir="))))))
    (setq projectile-generic-command command))

  (if (or (executable-find "rg") (executable-find "ag"))
        (setq projectile-indexing-method 'alien
              projectile-enable-caching nil)
    (setq projectile-indexing-method 'native
          projectile-enable-caching t))

  (defun +add-project ()
    (interactive)
    (let ((project-root (projectile-project-root)))
      (projectile-add-known-project project-root)
      (projectile-save-known-projects)
      (message "Project added: \"%s\"" project-root)
      (projectile-load-known-projects)))
  
  (bind-key "C-c p C-s" #'+add-project))

(use-package ibuffer-projectile
  :hook ((ibuffer . (lambda ()
                      (ibuffer-projectile-set-filter-groups)
                      (unless (eq ibuffer-sorting-mode 'alphabetic)
                        (ibuffer-do-sort-by-alphabetic)))))
  :config
  (setq ibuffer-projectile-prefix "Project: ")
  (setq ibuffer-filter-group-name-face 'font-lock-function-name-face))

(provide 'init-projectile)
;;; init-projectile.el ends here
