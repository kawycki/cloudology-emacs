;;; init-go.el ---                                   -*- lexical-binding: t; -*-

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

(use-package go-mode
  :bind (:map go-mode-map
              ([remap xref-find-definitions] . godef-jump)
              ("<f1>" . godoc-at-point))
  :company company-go company-dabbrev-code
  :config
  (when (executable-find "goimports")
    (setq gofmt-command "goimports"))
  (add-hook 'before-save-hook 'gofmt-before-save)

  (add-to-list 'projectile-project-root-files "go.mod"))

(use-package company-go
  :config
  (setq company-go-show-annotation t))

(provide 'init-go)
;;; init-go.el ends here
